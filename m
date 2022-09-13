From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 14/21] mm/page_alloc: make alloc_contig_pages DMB aware
Date: Tue, 13 Sep 2022 12:55:01 -0700
Message-ID: <20220913195508.3511038-15-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Q4ZU5cexm9Q08qLiEijmmMTjwuY3GlJ1Cn90C3bzJMU=;
        b=DPtm4ok3PSf82mq7JMYxEELlSbe2Rh/g3fQ51ooEmzdbhvAmX7bq1p/PDmYadgyeC1
         zi9y/jcGd3D1R6ZJkZ/FQsWIwfFLD+Pb0MJITbf3fgUqnK83ONtjfJ+HMIIxaq6Be8T0
         7yW02a5Gpkn6GV6C9TtbKwXcBYYQfckEhhDlRw3kQGNLccCEAsysOi1687eQCVwa1Snz
         UzUeXpguUoApWzimdM3XamY7zoYoXwniOBrFXnFh1C31eUhw4i9vT9n/3okZ8ZMJuUbE
         x2Q9CpCURykZLJagLzDO5v/o6/9ctT6KeQ6BSDQrVAvGz6WE7hB0JQGNvnw+QEyD9e4R
         S75w==
In-Reply-To: <20220913195508.3511038-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

Designated Movable Blocks are skipped when attempting to allocate
contiguous pages. Doing per page validation across all spanned
pages within a zone can be extra inefficient when Designated
Movable Blocks create large overlaps between zones. Use
dmb_intersects() within pfn_range_valid_contig as an early check
to signal the range is not valid.

The zone_movable_pfn array which represents the start of non-
overlapped ZONE_MOVABLE on the node is now preserved to be used
at runtime to skip over any DMB-only portion of the zone.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 mm/page_alloc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index e723094d1e1e..69753cc51e19 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -435,7 +435,7 @@ static unsigned long required_kernelcore_percent __initdata;
 static unsigned long required_movablecore __initdata;
 static unsigned long required_movablecore_percent __initdata;
 static unsigned long min_dmb_pfn[MAX_NUMNODES] __initdata;
-static unsigned long zone_movable_pfn[MAX_NUMNODES] __initdata;
+static unsigned long zone_movable_pfn[MAX_NUMNODES];
 bool mirrored_kernelcore __initdata_memblock;
 
 /* movable_zone is the "real" zone pages in ZONE_MOVABLE are taken from */
@@ -9370,6 +9370,9 @@ static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
 	unsigned long i, end_pfn = start_pfn + nr_pages;
 	struct page *page;
 
+	if (dmb_intersects(start_pfn, end_pfn))
+		return false;
+
 	for (i = start_pfn; i < end_pfn; i++) {
 		page = pfn_to_online_page(i);
 		if (!page)
@@ -9426,7 +9429,10 @@ struct page *alloc_contig_pages(unsigned long nr_pages, gfp_t gfp_mask,
 					gfp_zone(gfp_mask), nodemask) {
 		spin_lock_irqsave(&zone->lock, flags);
 
-		pfn = ALIGN(zone->zone_start_pfn, nr_pages);
+		if (zone_idx(zone) == ZONE_MOVABLE && zone_movable_pfn[nid])
+			pfn = ALIGN(zone_movable_pfn[nid], nr_pages);
+		else
+			pfn = ALIGN(zone->zone_start_pfn, nr_pages);
 		while (zone_spans_last_pfn(zone, pfn, nr_pages)) {
 			if (pfn_range_valid_contig(zone, pfn, nr_pages)) {
 				/*
-- 
2.25.1

