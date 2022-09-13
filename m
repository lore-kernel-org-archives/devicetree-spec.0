From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 12/21] memblock: introduce MEMBLOCK_MOVABLE flag
Date: Tue, 13 Sep 2022 12:54:59 -0700
Message-ID: <20220913195508.3511038-13-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5WWAAzNcGRX09yf3QcgLeiV4ytIgw0QIAz2zMov/ZDY=;
        b=Yz1mtV6YiuvArbfHbQBXNKT9eLELbvn7bnniGDLD1BumkiBsr2ZDlVa36+Wy8wKT5o
         ryYhGAJx49vUh11TKsorymepYWGSO76xJbhP0rWVGH3ntJ/cZBgl0HG4OoxTwsRCKi5P
         r8fZHkmi9dhCwHqvtScDgQwe7gg6nWmJBlbT6hYOH0ew7iRaIAjSwvoSk6SKm+tRfQu+
         rKZsLcxmkz1cCAli2W9VyR6gyYWGuJOVoZMSgPsY0YmHve5v7DOrmmIyu3LMUZg6pUfw
         lIU/zKc3QMqDUaQMXnCFOtpC/YhN4nYgSjeSX0Y2GgcVNB6wvWWTn+zhjMxvZzDNv7zs
         69cQ==
In-Reply-To: <20220913195508.3511038-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

The MEMBLOCK_MOVABLE flag is introduced to designate a memblock
as only supporting movable allocations by the page allocator.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 include/linux/memblock.h |  8 ++++++++
 mm/memblock.c            | 24 ++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 50ad19662a32..8eb3ca32dfa7 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -47,6 +47,7 @@ enum memblock_flags {
 	MEMBLOCK_MIRROR		= 0x2,	/* mirrored region */
 	MEMBLOCK_NOMAP		= 0x4,	/* don't add to kernel direct mapping */
 	MEMBLOCK_DRIVER_MANAGED = 0x8,	/* always detected via a driver */
+	MEMBLOCK_MOVABLE	= 0x10,	/* designated movable block */
 };
 
 /**
@@ -125,6 +126,8 @@ int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
 int memblock_mark_nomap(phys_addr_t base, phys_addr_t size);
 int memblock_clear_nomap(phys_addr_t base, phys_addr_t size);
+int memblock_mark_movable(phys_addr_t base, phys_addr_t size);
+int memblock_clear_movable(phys_addr_t base, phys_addr_t size);
 
 void memblock_free_all(void);
 void memblock_free(void *ptr, size_t size);
@@ -265,6 +268,11 @@ static inline bool memblock_is_driver_managed(struct memblock_region *m)
 	return m->flags & MEMBLOCK_DRIVER_MANAGED;
 }
 
+static inline bool memblock_is_movable(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_MOVABLE;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index b5d3026979fc..5d6a210d98ec 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -979,6 +979,30 @@ int __init_memblock memblock_clear_nomap(phys_addr_t base, phys_addr_t size)
 	return memblock_setclr_flag(base, size, 0, MEMBLOCK_NOMAP);
 }
 
+/**
+ * memblock_mark_movable - Mark designated movable block with MEMBLOCK_MOVABLE.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_movable(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(base, size, 1, MEMBLOCK_MOVABLE);
+}
+
+/**
+ * memblock_clear_movable - Clear flag MEMBLOCK_MOVABLE for a specified region.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_clear_movable(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(base, size, 0, MEMBLOCK_MOVABLE);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
-- 
2.25.1

