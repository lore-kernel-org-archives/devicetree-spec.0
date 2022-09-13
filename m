From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/21] mm/hugetlb: allow migrated hugepage to dissolve when freed
Date: Tue, 13 Sep 2022 12:54:52 -0700
Message-ID: <20220913195508.3511038-6-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ivekPqFwDTKnplQubqOcOnwSj5SwqgEqKMLIx8G0mTA=;
        b=kvUC28iyEDcMoby9xrnJHhocivoBZj9gqY+ui6eXHvBbq0tXS2dzYAAmqBdXCNT1wy
         Q0fTtOM1kwBq1neZJJDtv8OVb2E4WTXaookEyrn9UWfnw0gFlPMPSsLKdxzfJXEQRdps
         TBY/dxDfKDXG5nzytFERu/dU7OZ7FBxZvIzoh4dkW/QYs2YW41IfiKdkkwlFW8nnTbi2
         RA0eP5SekM1KC2ny0+Tc+vzS7nujN6k/2bx9b8Rj/IE1ke6REKO17fe0+no3v3V+6DPQ
         hTcXXufvBklDdoPK3SevxPEu7k9onHuyK1D6iBkExepS0BnC5h2ewbJv8V7xNvAFJRmS
         S5FA==
In-Reply-To: <20220913195508.3511038-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

There is no isolation mechanism for hugepages so a hugepage that
is migrated is returned to its hugepage freelist. This creates
problems for alloc_contig_range() because migrated hugepages can
be allocated as migrate targets for subsequent hugepage migration
attempts.

Even if the migration succeeds the alloc_contig_range() attempt
will fail because test_pages_isolated() will find the now free
hugepages haven't been dissolved.

A subsequent attempt by alloc_contig_range() is necessary for the
isolate_migratepages_range() function to find the freed hugepage
and dissolve it (assuming it has not been reallocated).

A workqueue is introduced to perform the equivalent functionality
of alloc_and_dissolve_huge_page() for a migrated hugepage when it
is freed so that the pages can be released to the isolated page
lists of the buddy allocator allowing the alloc_contig_range()
attempt to succeed.

The HPG_dissolve hugepage flag is introduced to allow tagging
migratable hugepages that should be dissolved when freed.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 include/linux/hugetlb.h |  5 +++
 mm/hugetlb.c            | 72 ++++++++++++++++++++++++++++++++++++++---
 mm/migrate.c            |  1 +
 mm/page_alloc.c         |  1 +
 4 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 3ec981a0d8b3..0e6e21805e51 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -222,6 +222,7 @@ unsigned long hugetlb_change_protection(struct vm_area_struct *vma,
 
 bool is_hugetlb_entry_migration(pte_t pte);
 void hugetlb_unshare_all_pmds(struct vm_area_struct *vma);
+void sync_hugetlb_dissolve(void);
 
 #else /* !CONFIG_HUGETLB_PAGE */
 
@@ -430,6 +431,8 @@ static inline vm_fault_t hugetlb_fault(struct mm_struct *mm,
 
 static inline void hugetlb_unshare_all_pmds(struct vm_area_struct *vma) { }
 
+static inline void sync_hugetlb_dissolve(void) { }
+
 #endif /* !CONFIG_HUGETLB_PAGE */
 /*
  * hugepages at page global directory. If arch support
@@ -574,6 +577,7 @@ enum hugetlb_page_flags {
 	HPG_freed,
 	HPG_vmemmap_optimized,
 	HPG_raw_hwp_unreliable,
+	HPG_dissolve,
 	__NR_HPAGEFLAGS,
 };
 
@@ -621,6 +625,7 @@ HPAGEFLAG(Temporary, temporary)
 HPAGEFLAG(Freed, freed)
 HPAGEFLAG(VmemmapOptimized, vmemmap_optimized)
 HPAGEFLAG(RawHwpUnreliable, raw_hwp_unreliable)
+HPAGEFLAG(Dissolve, dissolve)
 
 #ifdef CONFIG_HUGETLB_PAGE
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index f232a37df4b6..da80889e1436 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1582,6 +1582,10 @@ static void __update_and_free_page(struct hstate *h, struct page *page)
 	}
 }
 
+static LLIST_HEAD(hpage_dissolvelist);
+static void dissolve_hpage_workfn(struct work_struct *work);
+static DECLARE_WORK(dissolve_hpage_work, dissolve_hpage_workfn);
+
 /*
  * As update_and_free_page() can be called under any context, so we cannot
  * use GFP_KERNEL to allocate vmemmap pages. However, we can defer the
@@ -1628,6 +1632,8 @@ static inline void flush_free_hpage_work(struct hstate *h)
 {
 	if (hugetlb_vmemmap_optimizable(h))
 		flush_work(&free_hpage_work);
+	if (!hstate_is_gigantic(h))
+		flush_work(&dissolve_hpage_work);
 }
 
 static void update_and_free_page(struct hstate *h, struct page *page,
@@ -1679,7 +1685,7 @@ void free_huge_page(struct page *page)
 	struct hstate *h = page_hstate(page);
 	int nid = page_to_nid(page);
 	struct hugepage_subpool *spool = hugetlb_page_subpool(page);
-	bool restore_reserve;
+	bool restore_reserve, dissolve;
 	unsigned long flags;
 
 	VM_BUG_ON_PAGE(page_count(page), page);
@@ -1691,6 +1697,8 @@ void free_huge_page(struct page *page)
 	page->mapping = NULL;
 	restore_reserve = HPageRestoreReserve(page);
 	ClearHPageRestoreReserve(page);
+	dissolve = HPageDissolve(page);
+	ClearHPageDissolve(page);
 
 	/*
 	 * If HPageRestoreReserve was set on page, page allocation consumed a
@@ -1729,6 +1737,11 @@ void free_huge_page(struct page *page)
 		remove_hugetlb_page(h, page, true);
 		spin_unlock_irqrestore(&hugetlb_lock, flags);
 		update_and_free_page(h, page, true);
+	} else if (dissolve) {
+		spin_unlock_irqrestore(&hugetlb_lock, flags);
+		if (llist_add((struct llist_node *)&page->mapping,
+			      &hpage_dissolvelist))
+			schedule_work(&dissolve_hpage_work);
 	} else {
 		arch_clear_hugepage_flags(page);
 		enqueue_huge_page(h, page);
@@ -2771,6 +2784,49 @@ static void replace_hugepage(struct hstate *h, int nid, struct page *old_page,
 	enqueue_huge_page(h, new_page);
 }
 
+static void dissolve_hpage_workfn(struct work_struct *work)
+{
+	struct llist_node *node;
+
+	node = llist_del_all(&hpage_dissolvelist);
+
+	while (node) {
+		struct page *oldpage, *newpage;
+		struct hstate *h;
+		int nid;
+
+		oldpage = container_of((struct address_space **)node,
+				       struct page, mapping);
+		node = node->next;
+		oldpage->mapping = NULL;
+
+		h = page_hstate(oldpage);
+		nid = page_to_nid(oldpage);
+
+		newpage = alloc_replacement_page(h, nid);
+
+		spin_lock_irq(&hugetlb_lock);
+		/* finish freeing oldpage */
+		arch_clear_hugepage_flags(oldpage);
+		enqueue_huge_page(h, oldpage);
+		if (IS_ERR(newpage)) {
+			/* cannot dissolve so just leave free */
+			spin_unlock_irq(&hugetlb_lock);
+			goto next;
+		}
+
+		replace_hugepage(h, nid, oldpage, newpage);
+
+		/*
+		 * Pages have been replaced, we can safely free the old one.
+		 */
+		spin_unlock_irq(&hugetlb_lock);
+		__update_and_free_page(h, oldpage);
+next:
+		cond_resched();
+	}
+}
+
 /*
  * alloc_and_dissolve_huge_page - Allocate a new page and dissolve the old one
  * @h: struct hstate old page belongs to
@@ -2803,6 +2859,7 @@ static int alloc_and_dissolve_huge_page(struct hstate *h, struct page *old_page,
 		 */
 		spin_unlock_irq(&hugetlb_lock);
 		ret = isolate_hugetlb(old_page, list);
+		SetHPageDissolve(old_page);
 		spin_lock_irq(&hugetlb_lock);
 		goto free_new;
 	} else if (!HPageFreed(old_page)) {
@@ -2864,14 +2921,21 @@ int isolate_or_dissolve_huge_page(struct page *page, struct list_head *list)
 	if (hstate_is_gigantic(h))
 		return -ENOMEM;
 
-	if (page_count(head) && !isolate_hugetlb(head, list))
+	if (page_count(head) && !isolate_hugetlb(head, list)) {
+		SetHPageDissolve(head);
 		ret = 0;
-	else if (!page_count(head))
+	} else if (!page_count(head)) {
 		ret = alloc_and_dissolve_huge_page(h, head, list);
-
+	}
 	return ret;
 }
 
+void sync_hugetlb_dissolve(void)
+{
+	flush_work(&free_hpage_work);
+	flush_work(&dissolve_hpage_work);
+}
+
 struct page *alloc_huge_page(struct vm_area_struct *vma,
 				    unsigned long addr, int avoid_reserve)
 {
diff --git a/mm/migrate.c b/mm/migrate.c
index 6a1597c92261..b6c6123e614c 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -141,6 +141,7 @@ void putback_movable_pages(struct list_head *l)
 
 	list_for_each_entry_safe(page, page2, l, lru) {
 		if (unlikely(PageHuge(page))) {
+			ClearHPageDissolve(page);
 			putback_active_hugepage(page);
 			continue;
 		}
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index e5486d47406e..6bf76bbc0308 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -9235,6 +9235,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 	if (ret && ret != -EBUSY)
 		goto done;
 	ret = 0;
+	sync_hugetlb_dissolve();
 
 	/*
 	 * Pages from [start, end) are within a pageblock_nr_pages
-- 
2.25.1

