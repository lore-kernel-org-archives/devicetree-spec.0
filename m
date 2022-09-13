From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 20/21] mm/cma: introduce rmem shared-dmb-pool
Date: Tue, 13 Sep 2022 12:55:07 -0700
Message-ID: <20220913195508.3511038-21-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lc6C5FZ3R6bpGdrTQfUMqHUthTTami+g742/pfBsTic=;
        b=RlsLmEiP3JVWhyXjCMSzF7A4AVjyq1jRjWCW9x5GNVTee31Y+zsIXxNeUFqHaiWHyg
         8J6hP8RFMjTeETwSHV9ENC6pqQalmeYj6JweS9Tsv7OxuqvPlsMarmRSfwGBaWF+XcBE
         la0+kyQTMUqV4xn7LwqYCphDGQkUMF9O3ZqeG7FJEIlcBtt95RRsh5UONSCeySm6f9no
         qWos+YkhM9jVDPaT5oAH5RbFh07TQsfPjWCoTiWZNYZktg0UxgNqKCsIm4np7G5/9pqK
         Gqu0dk9U2X717zjfg5WZXwdvFki/e2iGeK+mAGJNsof/XN1i9elvjnIO7qYgQkqpgSuo
         A90g==
In-Reply-To: <20220913195508.3511038-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

A 'shared-dmb-pool' reserved-memory device tree node defines a
Designated Movable Block for use by an associated Contiguous
Memory Allocator.

Devices access the CMA region in the same manner as a 'shared-
dma-pool', but the kernel page allocator is free to use the
memory like any other ZONE_MOVABLE memory.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/of_reserved_mem.c |  5 +++++
 kernel/dma/contiguous.c      | 33 ++++++++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 0eb9e8898d7b..700c0dc0d3b6 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -123,6 +123,11 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 		   && !nomap) {
 		/* Need adjust the alignment to satisfy the CMA requirement */
 		align = max_t(phys_addr_t, align, CMA_MIN_ALIGNMENT_BYTES);
+	} else if (IS_ENABLED(CONFIG_CMA)
+		   && of_flat_dt_is_compatible(node, "shared-dmb-pool")) {
+		/* Need adjust the alignment to satisfy CMA/DMB requirements */
+		align = max_t(phys_addr_t, align, CMA_MIN_ALIGNMENT_BYTES);
+		align = max_t(phys_addr_t, align, DMB_MIN_ALIGNMENT_BYTES);
 	}
 
 	prop = of_get_flat_dt_prop(node, "alloc-ranges", &len);
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 6ea80ae42622..65dda12752a7 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -50,6 +50,7 @@
 #include <linux/sizes.h>
 #include <linux/dma-map-ops.h>
 #include <linux/cma.h>
+#include <linux/dmb.h>
 
 #ifdef CONFIG_CMA_SIZE_MBYTES
 #define CMA_SIZE_MBYTES CONFIG_CMA_SIZE_MBYTES
@@ -397,10 +398,11 @@ static const struct reserved_mem_ops rmem_cma_ops = {
 	.device_release = rmem_cma_device_release,
 };
 
-static int __init rmem_cma_setup(struct reserved_mem *rmem)
+static int __init _rmem_cma_setup(struct reserved_mem *rmem, bool in_dmb)
 {
 	unsigned long node = rmem->fdt_node;
 	bool default_cma = of_get_flat_dt_prop(node, "linux,cma-default", NULL);
+	phys_addr_t align = CMA_MIN_ALIGNMENT_BYTES;
 	struct cma *cma;
 	int err;
 
@@ -414,16 +416,25 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
 	    of_get_flat_dt_prop(node, "no-map", NULL))
 		return -EINVAL;
 
-	if (!IS_ALIGNED(rmem->base | rmem->size, CMA_MIN_ALIGNMENT_BYTES)) {
+	if (in_dmb) {
+		if (default_cma) {
+			pr_err("Reserved memory: cma-default cannot be DMB\n");
+			return -EINVAL;
+		}
+		align = max_t(phys_addr_t, align, DMB_MIN_ALIGNMENT_BYTES);
+	}
+	if (!IS_ALIGNED(rmem->base | rmem->size, align)) {
 		pr_err("Reserved memory: incorrect alignment of CMA region\n");
 		return -EINVAL;
 	}
 
-	err = cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->name, &cma);
+	err = __cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->name,
+				      &cma, in_dmb);
 	if (err) {
 		pr_err("Reserved memory: unable to setup CMA region\n");
 		return err;
 	}
+
 	/* Architecture specific contiguous memory fixup. */
 	dma_contiguous_early_fixup(rmem->base, rmem->size);
 
@@ -433,10 +444,22 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
 	rmem->ops = &rmem_cma_ops;
 	rmem->priv = cma;
 
-	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
-		&rmem->base, (unsigned long)rmem->size / SZ_1M);
+	pr_info("Reserved memory: created %s memory pool at %pa, size %ld MiB\n",
+		in_dmb ? "DMB" : "CMA", &rmem->base,
+		(unsigned long)rmem->size / SZ_1M);
 
 	return 0;
 }
+
+static int __init rmem_cma_setup(struct reserved_mem *rmem)
+{
+	return _rmem_cma_setup(rmem, false);
+}
 RESERVEDMEM_OF_DECLARE(cma, "shared-dma-pool", rmem_cma_setup);
+
+static int __init rmem_cma_in_dmb_setup(struct reserved_mem *rmem)
+{
+	return _rmem_cma_setup(rmem, true);
+}
+RESERVEDMEM_OF_DECLARE(cma_in_dmb, "shared-dmb-pool", rmem_cma_in_dmb_setup);
 #endif
-- 
2.25.1

