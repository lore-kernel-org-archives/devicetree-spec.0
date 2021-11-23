From: Hsin-Yi Wang <hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/3] dma: swiotlb: Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
Date: Tue, 23 Nov 2021 19:21:02 +0800
Message-ID: <20211123112104.3530135-2-hsinyi@chromium.org>
References: <20211123112104.3530135-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cXx4tPUfUH9pafyzAeGR5gquV85Y2Z7tudxqqufT9GE=;
        b=Wyu1LS1cdtTMg0hBT2U10oleP2US7ydiLPsXo5v+x1MNLCd6m33da3VzYuAdmFxMDv
         /atTSJHqbJlfRgPOsJTgGAwa42sZEMLJfCeeybWG2f34PtVrGXjnb2T1yJRaaAh4pnH5
         yo0ASPO7kd0LehyYoqSA3V7IvNbzQ7efFI4NM=
In-Reply-To: <20211123112104.3530135-1-hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>, - <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, senozhatsky-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

Default IO_TLB_SEGSIZE is 128, but some use cases requires more slabs.
Otherwise swiotlb_find_slots() will fail.

This patch allows each mem pool to decide their own io-tlb-segsize
through dt property.

Signed-off-by: Hsin-Yi Wang <hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/linux/swiotlb.h |  1 +
 kernel/dma/swiotlb.c    | 34 ++++++++++++++++++++++++++--------
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 569272871375c4..73b3312f23e65b 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -95,6 +95,7 @@ struct io_tlb_mem {
 	unsigned long nslabs;
 	unsigned long used;
 	unsigned int index;
+	unsigned int io_tlb_segsize;
 	spinlock_t lock;
 	struct dentry *debugfs;
 	bool late_alloc;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 8e840fbbed7c7a..021eef1844ca4c 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -145,9 +145,10 @@ void swiotlb_print_info(void)
 	       (mem->nslabs << IO_TLB_SHIFT) >> 20);
 }
 
-static inline unsigned long io_tlb_offset(unsigned long val)
+static inline unsigned long io_tlb_offset(unsigned long val,
+					  unsigned long io_tlb_segsize)
 {
-	return val & (IO_TLB_SEGSIZE - 1);
+	return val & (io_tlb_segsize - 1);
 }
 
 static inline unsigned long nr_slots(u64 val)
@@ -186,13 +187,16 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	mem->end = mem->start + bytes;
 	mem->index = 0;
 	mem->late_alloc = late_alloc;
+	if (!mem->io_tlb_segsize)
+		mem->io_tlb_segsize = IO_TLB_SEGSIZE;
 
 	if (swiotlb_force == SWIOTLB_FORCE)
 		mem->force_bounce = true;
 
 	spin_lock_init(&mem->lock);
 	for (i = 0; i < mem->nslabs; i++) {
-		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
+		mem->slots[i].list = mem->io_tlb_segsize -
+				     io_tlb_offset(i, mem->io_tlb_segsize);
 		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
 		mem->slots[i].alloc_size = 0;
 	}
@@ -523,7 +527,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 			alloc_size - (offset + ((i - index) << IO_TLB_SHIFT));
 	}
 	for (i = index - 1;
-	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
+	     io_tlb_offset(i, mem->io_tlb_segsize) != mem->io_tlb_segsize - 1 &&
 	     mem->slots[i].list; i--)
 		mem->slots[i].list = ++count;
 
@@ -603,7 +607,7 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	 * with slots below and above the pool being returned.
 	 */
 	spin_lock_irqsave(&mem->lock, flags);
-	if (index + nslots < ALIGN(index + 1, IO_TLB_SEGSIZE))
+	if (index + nslots < ALIGN(index + 1, mem->io_tlb_segsize))
 		count = mem->slots[index + nslots].list;
 	else
 		count = 0;
@@ -623,8 +627,8 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	 * available (non zero)
 	 */
 	for (i = index - 1;
-	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 && mem->slots[i].list;
-	     i--)
+	     io_tlb_offset(i, mem->io_tlb_segsize) != mem->io_tlb_segsize - 1 &&
+	     mem->slots[i].list; i--)
 		mem->slots[i].list = ++count;
 	mem->used -= nslots;
 	spin_unlock_irqrestore(&mem->lock, flags);
@@ -701,7 +705,9 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 
 size_t swiotlb_max_mapping_size(struct device *dev)
 {
-	return ((size_t)IO_TLB_SIZE) * IO_TLB_SEGSIZE;
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+
+	return ((size_t)IO_TLB_SIZE) * mem->io_tlb_segsize;
 }
 
 bool is_swiotlb_active(struct device *dev)
@@ -788,6 +794,7 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 {
 	struct io_tlb_mem *mem = rmem->priv;
 	unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
+	struct device_node *np;
 
 	/*
 	 * Since multiple devices can share the same pool, the private data,
@@ -808,6 +815,17 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 
 		set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
 				     rmem->size >> PAGE_SHIFT);
+
+		np = of_find_node_by_phandle(rmem->phandle);
+		if (np) {
+			if (!of_property_read_u32(np, "io-tlb-segsize",
+						  &mem->io_tlb_segsize)) {
+				if (hweight32(mem->io_tlb_segsize) != 1)
+					mem->io_tlb_segsize = IO_TLB_SEGSIZE;
+			}
+			of_node_put(np);
+		}
+
 		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
 		mem->force_bounce = true;
 		mem->for_alloc = true;
-- 
2.34.0.rc2.393.gf8c9666880-goog

