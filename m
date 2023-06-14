From: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
Subject: [PATCH v2 1/2] of: reserved_mem: Try to keep range allocations
 contiguous
Date: Wed, 14 Jun 2023 21:20:42 +0200
Message-ID: <20230510-dt-resv-bottom-up-v2-1-aeb2afc8ac25@gerhold.net>
References: <20230510-dt-resv-bottom-up-v2-0-aeb2afc8ac25@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686770450;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=LdeZ5ShzM18y4oy4q0pM7ga3Ybusf7cQdOu55GJ4/fM=;
    b=RDIc6K+fuXpn+9U5xbQluGWN1tgqNZJYFYq4GDD0iS3/xDUUFGzInbbvzPajYjB73X
    l2DFMTkStTsx+PL8CM6AtcKiaxcWDRBYfp8JuHyxoS3b8qAyI3FU7xF20N3LgN+g0fHD
    3QjAkWZo0Osgpw8PVDsXPd/bTu1yCT7TGBIUzdTdwDPDmXD40tOKyxS1aggktUombb8v
    64uOcLHy/PeP4J01/bPiumT0NACjWecbgBMoT+kow05FaR51v0jJY10Aq8W1H572TWi+
    nF1pe6nC75hQkW7GgsKvGdsvEK1j3/49DTvE/Tww1abEjKyDXKhxSFJkdJJoWbUD9kC9
    nqpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686770450;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=LdeZ5ShzM18y4oy4q0pM7ga3Ybusf7cQdOu55GJ4/fM=;
    b=59cCZ4+6c3YKIGO5o78XtZ1x4mwKdt3EUHOR88YMGTRprtTBgUWfX3GIK4tenqjbTP
    aa/Rbkx//GSW5G0FNSAA==
In-Reply-To: <20230510-dt-resv-bottom-up-v2-0-aeb2afc8ac25-3XONVrnlUWDR7s880joybQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Konrad Dybcio <konrad.dybcio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>

Right now dynamic reserved memory regions are allocated either
bottom-up or top-down, depending on the memblock setting of the
architecture. This is fine when the address is arbitrary. However,
when using "alloc-ranges" the regions are often placed somewhere
in the middle of (free) RAM, even if the range starts or ends next
to another (static) reservation.

Try to detect this situation, and choose explicitly between bottom-up
or top-down to allocate the memory close to the other reservations:

  1. If the "alloc-range" starts at the end or inside an existing
     reservation, use bottom-up.
  2. If the "alloc-range" ends at the start or inside an existing
     reservation, use top-down.
  3. If both or none is the case, keep the current
     (architecture-specific) behavior.

There are plenty of edge cases where only a more complex algorithm
would help, but even this simple approach helps in many cases to keep
the reserved memory (and therefore also the free memory) contiguous.

Signed-off-by: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
---
 drivers/of/of_reserved_mem.c | 55 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 948efa9f99e3..7f892c3dcc63 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -77,6 +77,57 @@ void __init fdt_reserved_mem_save_node(unsigned long node, const char *uname,
 	return;
 }
 
+/*
+ * __reserved_mem_alloc_in_range() - allocate reserved memory described with
+ *	'alloc-ranges'. Choose bottom-up/top-down depending on nearby existing
+ *	reserved regions to keep the reserved memory contiguous if possible.
+ */
+static int __init __reserved_mem_alloc_in_range(phys_addr_t size,
+	phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
+	phys_addr_t *res_base)
+{
+	bool prev_bottom_up = memblock_bottom_up();
+	bool bottom_up = false, top_down = false;
+	int ret, i;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserved_mem *rmem = &reserved_mem[i];
+
+		/* Skip regions that were not reserved yet */
+		if (rmem->size == 0)
+			continue;
+
+		/*
+		 * If range starts next to an existing reservation, use bottom-up:
+		 *	|....RRRR................RRRRRRRR..............|
+		 *	       --RRRR------
+		 */
+		if (start >= rmem->base && start <= (rmem->base + rmem->size))
+			bottom_up = true;
+
+		/*
+		 * If range ends next to an existing reservation, use top-down:
+		 *	|....RRRR................RRRRRRRR..............|
+		 *	              -------RRRR-----
+		 */
+		if (end >= rmem->base && end <= (rmem->base + rmem->size))
+			top_down = true;
+	}
+
+	/* Change setting only if either bottom-up or top-down was selected */
+	if (bottom_up != top_down)
+		memblock_set_bottom_up(bottom_up);
+
+	ret = early_init_dt_alloc_reserved_memory_arch(size, align,
+			start, end, nomap, res_base);
+
+	/* Restore old setting if needed */
+	if (bottom_up != top_down)
+		memblock_set_bottom_up(prev_bottom_up);
+
+	return ret;
+}
+
 /*
  * __reserved_mem_alloc_size() - allocate reserved memory described by
  *	'size', 'alignment'  and 'alloc-ranges' properties.
@@ -137,8 +188,8 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 			end = start + dt_mem_next_cell(dt_root_size_cells,
 						       &prop);
 
-			ret = early_init_dt_alloc_reserved_memory_arch(size,
-					align, start, end, nomap, &base);
+			ret = __reserved_mem_alloc_in_range(size, align,
+					start, end, nomap, &base);
 			if (ret == 0) {
 				pr_debug("allocated memory for '%s' node: base %pa, size %lu MiB\n",
 					uname, &base,

-- 
2.40.1

