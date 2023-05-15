From: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
Subject: [PATCH 2/5] of: reserved_mem: Implement alloc-{bottom-up,top-down}
Date: Mon, 15 May 2023 12:12:17 +0200
Message-ID: <20230510-dt-resv-bottom-up-v1-2-3bf68873dbed@gerhold.net>
References: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684145544;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=jfB/CpVNa1JJ+lCLjNohI5jzcdCGpDmi64bliceUj4E=;
    b=WROWHfEyjMq/Q/G1dolZPFwt4ZlT+ICnNtbgViYYzlfQwkEAcmL27Ezq8Lgr7439eC
    BHXmRl2eUjMEHnQyIVMgB+VoM6XCZNrMzH3/QOiOnP+MqFYha4Lj64im5n3vXH7Ea4Ch
    pxDms+Cf58akmv1XgezvGTPHzGCcJlMiBWvmWrVme3esZ30esR1G9NVpTGprb/U0r2Du
    5oWM7c7l9c2VO1PjNuvrjwOuIElJo/1fcV+mZ+ypA4i1UcxaKvWpVo+6fKbu9IKW3qEg
    4J95wqHk6h4KpGZ/1NZh8PVKGBKmyTVPT+d0CHWhahqMNmES7W5IBQ4RiIV64udkyLCF
    /FGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684145544;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=jfB/CpVNa1JJ+lCLjNohI5jzcdCGpDmi64bliceUj4E=;
    b=0IzAm2OSKSa3+6O4Nfm1SUdH5UqnTb2zgC4j3SBLyKUO0zGxZdG3JlmLSrT7PZHhsE
    1vgoLsnBEKs5RsAFeoBA==
In-Reply-To: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed-3XONVrnlUWDR7s880joybQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Konrad Dybcio <konrad.dybcio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>

Use memblock_set_bottom_up() to specify an explicit allocation order for
dynamic reservations with "alloc-ranges". Since the default value varies
between architectures the previous value is saved and restored after
trying the allocations.

If neither alloc-bottom-up or alloc-top-down are specified the previous
implementation-defined allocation order is preserved.

Signed-off-by: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
---
 drivers/of/of_reserved_mem.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 948efa9f99e3..6443140deacf 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -89,7 +89,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 	phys_addr_t base = 0, align = 0, size;
 	int len;
 	const __be32 *prop;
-	bool nomap;
+	bool nomap, prev_bottom_up;
 	int ret;
 
 	prop = of_get_flat_dt_prop(node, "size", &len);
@@ -130,6 +130,12 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 			return -EINVAL;
 		}
 
+		prev_bottom_up = memblock_bottom_up();
+		if (of_get_flat_dt_prop(node, "alloc-bottom-up", NULL))
+			memblock_set_bottom_up(true);
+		if (of_get_flat_dt_prop(node, "alloc-top-down", NULL))
+			memblock_set_bottom_up(false);
+
 		base = 0;
 
 		while (len > 0) {
@@ -148,6 +154,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 			len -= t_len;
 		}
 
+		memblock_set_bottom_up(prev_bottom_up);
 	} else {
 		ret = early_init_dt_alloc_reserved_memory_arch(size, align,
 							0, 0, nomap, &base);

-- 
2.40.1

