From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 04/21] mm/hugetlb: refactor alloc_and_dissolve_huge_page
Date: Tue, 13 Sep 2022 12:54:51 -0700
Message-ID: <20220913195508.3511038-5-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=yHgeZ0+Ocv6GrFoaruOXhrYrRwLmKzzR+EPUoXoCFLk=;
        b=MO7TGhjFAweThFGVYteWrV+nJ7j5y3LZRa4C7ACnJ1qWyIG54wf5kg5kO3xvw/FqDQ
         s4wKsy9yFNOEBO191kejMvdr64z7Q9PD3aPBFXDJT69Mpap/Qm7BagM/tmOC2sbVk5Ek
         f646vwKxfSqOitl6VKXJ3CuYfAma7EN7IglgyNYbVTkgDe6A8Ejr2VK5Z6ft+DXrx+l4
         fQRhw7+DxWu3uXxtthnmrlFhvdM2zwLPoqSspHMHQaTzl30h2Y5TuDS9T3a1oeXGiuia
         JD/Wvi1/kbP+I5YXUEfkPCFyR+Q73ACUQMRNqUffeivDuZhRpUvnXKzfC7RG3PK+ZTef
         LsyA==
In-Reply-To: <20220913195508.3511038-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

The alloc_replacement_page() and replace_hugepage() functions are
created from code in the alloc_and_dissolve_huge_page() function
to allow their reuse by the next commit.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 mm/hugetlb.c | 84 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 51 insertions(+), 33 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a1d51a1f0404..f232a37df4b6 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2709,32 +2709,22 @@ void restore_reserve_on_error(struct hstate *h, struct vm_area_struct *vma,
 }
 
 /*
- * alloc_and_dissolve_huge_page - Allocate a new page and dissolve the old one
- * @h: struct hstate old page belongs to
- * @old_page: Old page to dissolve
- * @list: List to isolate the page in case we need to
- * Returns 0 on success, otherwise negated error.
+ * Before dissolving the page, we need to allocate a new one for the
+ * pool to remain stable.  Here, we allocate the page and 'prep' it
+ * by doing everything but actually updating counters and adding to
+ * the pool.  This simplifies and let us do most of the processing
+ * under the lock.
  */
-static int alloc_and_dissolve_huge_page(struct hstate *h, struct page *old_page,
-					struct list_head *list)
+static struct page *alloc_replacement_page(struct hstate *h, int nid)
 {
 	gfp_t gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
-	int nid = page_to_nid(old_page);
 	bool alloc_retry = false;
 	struct page *new_page;
-	int ret = 0;
 
-	/*
-	 * Before dissolving the page, we need to allocate a new one for the
-	 * pool to remain stable.  Here, we allocate the page and 'prep' it
-	 * by doing everything but actually updating counters and adding to
-	 * the pool.  This simplifies and let us do most of the processing
-	 * under the lock.
-	 */
 alloc_retry:
 	new_page = alloc_buddy_huge_page(h, gfp_mask, nid, NULL, NULL);
 	if (!new_page)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	/*
 	 * If all goes well, this page will be directly added to the free
 	 * list in the pool.  For this the ref count needs to be zero.
@@ -2748,7 +2738,7 @@ static int alloc_and_dissolve_huge_page(struct hstate *h, struct page *old_page,
 	SetHPageTemporary(new_page);
 	if (!put_page_testzero(new_page)) {
 		if (alloc_retry)
-			return -EBUSY;
+			return ERR_PTR(-EBUSY);
 
 		alloc_retry = true;
 		goto alloc_retry;
@@ -2757,6 +2747,48 @@ static int alloc_and_dissolve_huge_page(struct hstate *h, struct page *old_page,
 
 	__prep_new_huge_page(h, new_page);
 
+	return new_page;
+}
+
+static void replace_hugepage(struct hstate *h, int nid, struct page *old_page,
+			     struct page *new_page)
+{
+	lockdep_assert_held(&hugetlb_lock);
+	/*
+	 * Ok, old_page is still a genuine free hugepage. Remove it from
+	 * the freelist and decrease the counters. These will be
+	 * incremented again when calling __prep_account_new_huge_page()
+	 * and enqueue_huge_page() for new_page. The counters will remain
+	 * stable since this happens under the lock.
+	 */
+	remove_hugetlb_page(h, old_page, false);
+
+	/*
+	 * Ref count on new page is already zero as it was dropped
+	 * earlier.  It can be directly added to the pool free list.
+	 */
+	__prep_account_new_huge_page(h, nid);
+	enqueue_huge_page(h, new_page);
+}
+
+/*
+ * alloc_and_dissolve_huge_page - Allocate a new page and dissolve the old one
+ * @h: struct hstate old page belongs to
+ * @old_page: Old page to dissolve
+ * @list: List to isolate the page in case we need to
+ * Returns 0 on success, otherwise negated error.
+ */
+static int alloc_and_dissolve_huge_page(struct hstate *h, struct page *old_page,
+					struct list_head *list)
+{
+	int nid = page_to_nid(old_page);
+	struct page *new_page;
+	int ret = 0;
+
+	new_page = alloc_replacement_page(h, nid);
+	if (IS_ERR(new_page))
+		return PTR_ERR(new_page);
+
 retry:
 	spin_lock_irq(&hugetlb_lock);
 	if (!PageHuge(old_page)) {
@@ -2783,21 +2815,7 @@ static int alloc_and_dissolve_huge_page(struct hstate *h, struct page *old_page,
 		cond_resched();
 		goto retry;
 	} else {
-		/*
-		 * Ok, old_page is still a genuine free hugepage. Remove it from
-		 * the freelist and decrease the counters. These will be
-		 * incremented again when calling __prep_account_new_huge_page()
-		 * and enqueue_huge_page() for new_page. The counters will remain
-		 * stable since this happens under the lock.
-		 */
-		remove_hugetlb_page(h, old_page, false);
-
-		/*
-		 * Ref count on new page is already zero as it was dropped
-		 * earlier.  It can be directly added to the pool free list.
-		 */
-		__prep_account_new_huge_page(h, nid);
-		enqueue_huge_page(h, new_page);
+		replace_hugepage(h, nid, old_page, new_page);
 
 		/*
 		 * Pages have been replaced, we can safely free the old one.
-- 
2.25.1

