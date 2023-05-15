From: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
Subject: [PATCH 3/5] of: reserved_mem: Use stable allocation order
Date: Mon, 15 May 2023 12:12:18 +0200
Message-ID: <20230510-dt-resv-bottom-up-v1-3-3bf68873dbed@gerhold.net>
References: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684145544;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=DNTC0U3plBj7cthESRLpCld4G4lr+3CgqNixMQWGBow=;
    b=op7/C51ozPARSOEyrMPwMTrmQQgjf+W/Gx3IIhxw7EY8aDIImpixNrB6PSIS2YAZXY
    40c5+jU2bqPIKPwlhcf/8ua+4uttvlmm/Z0/UTxvg8f2ViJEY7u0OTzNUk2ZYM57ckr2
    UxRbDawLu/LFc5R4r0PjCd1MlaX2+ncl70AdCmc6cgIHzC1n4bR1zQUBYlOtAjUHo18d
    lLO/Zc/p0ewSGPnRhZ1WbvI23htdtVmVzKiodXnNdfdJeK8ro8ttLYam85ebX+6eRD5b
    jRERkKUE+s13J+91vGLuX9gB7Fh4OL3RJUvznHHi0j5w6JZ0xq2LAkW+UbhSGwojrSUf
    tW8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684145544;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=DNTC0U3plBj7cthESRLpCld4G4lr+3CgqNixMQWGBow=;
    b=gMMt+EFdTB5ds3J1kxDXQo7JfoVyAQx2QRs1dmiW5lPRexdNCZs/JQvvOFUBF4781W
    MEy3TBDkmpRCfTcEnkBQ==
In-Reply-To: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed-3XONVrnlUWDR7s880joybQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Konrad Dybcio <konrad.dybcio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>

sort() in Linux is based on heapsort which is not a stable sort
algorithm - equal elements are being reordered. For reserved memory in
the device tree this happens mainly for dynamic allocations: They do not
have an address to sort with, so they are reordered somewhat randomly
when adding/removing other unrelated reserved memory nodes.

Functionally this is not a big problem, but it's confusing during
development when all the addresses change after adding unrelated
reserved memory nodes.

Make the order stable by sorting dynamic allocations according to
the node order in the device tree. Static allocations are not affected
by this because they are still sorted by their (fixed) address.

Signed-off-by: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
---
 drivers/of/of_reserved_mem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 6443140deacf..f6d14354a534 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -224,6 +224,11 @@ static int __init __rmem_cmp(const void *a, const void *b)
 	if (ra->size > rb->size)
 		return 1;
 
+	if (ra->fdt_node < rb->fdt_node)
+		return -1;
+	if (ra->fdt_node > rb->fdt_node)
+		return 1;
+
 	return 0;
 }
 

-- 
2.40.1

