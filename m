From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 17/21] mm/dmb: introduce rmem designated-movable-block
Date: Tue, 13 Sep 2022 12:55:04 -0700
Message-ID: <20220913195508.3511038-18-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=U4jOrSu6bqJBytWJghR6t0ljWrrZGLSB9ph/v+e9V8I=;
        b=D/mTJk6kZw64eyUhHPaSFfxR9Msa5UBxyOTlcsmCwhUVjiAhTk7oqnxftuemkUJs0o
         e/3ecILYiDZtf1ZduEhchjc87lM/UzBWANhyHjDCeSCCZZ+OsXTubHr/HBHsItOzKdH7
         p/GQO/8nQMFRqeejgZsBOVzCwSXLRfYO2jhkP7CDsujDhgqd9989s5l2qAcx+CNYHM2D
         3FzlZrQmr76F2aSmz5wNYnpRQxzHx962ONlutGAvPr/+dXcOvxUiHsk1k1ee7yaWbHVI
         2LCJzHzqV9IGkV4gb1i+myYCzvATpnUG8sQPbUiE3I3lJUeSHhrVFH3mITfi1tyJU0b1
         X7Mw==
In-Reply-To: <20220913195508.3511038-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

This commit allows Designated Movable Blocks to be created by
including reserved-memory child nodes in the device tree with
the "designated-movable-block" compatible string.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/of_reserved_mem.c | 15 ++++++---
 mm/dmb.c                     | 64 ++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 5 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 65f3b02a0e4e..0eb9e8898d7b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -23,6 +23,7 @@
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
 #include <linux/cma.h>
+#include <linux/dmb.h>
 
 #include "of_private.h"
 
@@ -113,12 +114,16 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 
 	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
 
-	/* Need adjust the alignment to satisfy the CMA requirement */
-	if (IS_ENABLED(CONFIG_CMA)
-	    && of_flat_dt_is_compatible(node, "shared-dma-pool")
-	    && of_get_flat_dt_prop(node, "reusable", NULL)
-	    && !nomap)
+	if (of_flat_dt_is_compatible(node, "designated-movable-block")) {
+		/* Need adjust the alignment to satisfy the DMB requirement */
+		align = max_t(phys_addr_t, align, DMB_MIN_ALIGNMENT_BYTES);
+	} else if (IS_ENABLED(CONFIG_CMA)
+		   && of_flat_dt_is_compatible(node, "shared-dma-pool")
+		   && of_get_flat_dt_prop(node, "reusable", NULL)
+		   && !nomap) {
+		/* Need adjust the alignment to satisfy the CMA requirement */
 		align = max_t(phys_addr_t, align, CMA_MIN_ALIGNMENT_BYTES);
+	}
 
 	prop = of_get_flat_dt_prop(node, "alloc-ranges", &len);
 	if (prop) {
diff --git a/mm/dmb.c b/mm/dmb.c
index 9d9fd31089d2..8132d18542a0 100644
--- a/mm/dmb.c
+++ b/mm/dmb.c
@@ -90,3 +90,67 @@ void __init dmb_init_region(struct memblock_region *region)
 		init_reserved_pageblock(page);
 	}
 }
+
+/*
+ * Support for reserved memory regions defined in device tree
+ */
+#ifdef CONFIG_OF_RESERVED_MEM
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+
+#undef pr_fmt
+#define pr_fmt(fmt) fmt
+
+static int rmem_dmb_device_init(struct reserved_mem *rmem, struct device *dev)
+{
+	struct dmb *dmb;
+
+	dmb = (struct dmb *)rmem->priv;
+	if (dmb->owner)
+		return -EBUSY;
+
+	dmb->owner = dev;
+	return 0;
+}
+
+static void rmem_dmb_device_release(struct reserved_mem *rmem,
+				    struct device *dev)
+{
+	struct dmb *dmb;
+
+	dmb = (struct dmb *)rmem->priv;
+	if (dmb->owner == (void *)dev)
+		dmb->owner = NULL;
+}
+
+static const struct reserved_mem_ops rmem_dmb_ops = {
+	.device_init	= rmem_dmb_device_init,
+	.device_release = rmem_dmb_device_release,
+};
+
+static int __init rmem_dmb_setup(struct reserved_mem *rmem)
+{
+	unsigned long node = rmem->fdt_node;
+	struct dmb *dmb;
+	int err;
+
+	if (!of_get_flat_dt_prop(node, "reusable", NULL) ||
+	    of_get_flat_dt_prop(node, "no-map", NULL))
+		return -EINVAL;
+
+	err = dmb_reserve(rmem->base, rmem->size, &dmb);
+	if (err) {
+		pr_err("Reserved memory: unable to setup DMB region\n");
+		return err;
+	}
+
+	rmem->priv = dmb;
+	rmem->ops = &rmem_dmb_ops;
+	pr_info("Reserved memory: created DMB at %pa, size %ld MiB\n",
+		&rmem->base, (unsigned long)rmem->size / SZ_1M);
+
+	return 0;
+}
+RESERVEDMEM_OF_DECLARE(dmb, "designated-movable-block", rmem_dmb_setup);
+#endif
-- 
2.25.1

