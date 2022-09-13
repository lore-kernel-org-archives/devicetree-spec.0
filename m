From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/21] mm/hugetlb: add hugepage isolation support
Date: Tue, 13 Sep 2022 12:54:53 -0700
Message-ID: <20220913195508.3511038-7-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5478I3WyUfDJcI1zhJnzCnFwBV1ia1XR+sLHu3XJI6Q=;
        b=ngWpsEYVUBqyRCK+w+5Ame50HZp1DYM8gstxDexc5gHtIO2fEu4wX/+7Noqq7EWBX5
         SX4JOXX5B1E8Qf1s/pvzk9Bz2iJJBgv4Hk3Ull+tKjmtldfM+s3z+vbM1B3di5w6gxjz
         dcVCWO2NZ50adOCK8bPYxw3tCqWOsDx7M7cTAjTnYf/V4tSaPDhi8fqtVljCEiP5o1JE
         EBkXOKZZNuxNzz6s5U3pOqHYezTLOaL4mQLClkKUJN8hT0raCVH32ZKrxQcROVGentqi
         38kFA0gMphAG/6qqKzQ2VCttdNXcqVd0gmzjLhB0hmlMfPBCKPcE2Rytw17lBrFXHH3/
         rqCA==
In-Reply-To: <20220913195508.3511038-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

When a range of pageblocks is isolated there is at most one
hugepage that has only tail pages overlapping that range (i.e.
a hugepage that overlaps the beginning of the range).

However, that hugepage is the first migration target for an
alloc_contig_range() attempt so it already receives special
attention.

Checking whether the pageblock containing the head of a hugepage
is isolated is an inexpensive way to avoid hugepage allocations
from isolated pageblocks which makes alloc_contig_range() more
efficient.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 mm/hugetlb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index da80889e1436..2f354423f50f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -33,6 +33,7 @@
 #include <linux/migrate.h>
 #include <linux/nospec.h>
 #include <linux/delayacct.h>
+#include <linux/page-isolation.h>
 
 #include <asm/page.h>
 #include <asm/pgalloc.h>
@@ -1135,6 +1136,10 @@ static struct page *dequeue_huge_page_node_exact(struct hstate *h, int nid)
 		if (PageHWPoison(page))
 			continue;
 
+		/* Check head pageblock isolation */
+		if (is_migrate_isolate_page(page))
+			continue;
+
 		list_move(&page->lru, &h->hugepage_activelist);
 		set_page_refcounted(page);
 		ClearHPageFreed(page);
-- 
2.25.1

