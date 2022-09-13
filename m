From: Doug Berger <opendmb@gmail.com>
Subject: [PATCH 02/21] mm/hugetlb: correct max_huge_pages accounting on demote
Date: Tue, 13 Sep 2022 12:54:49 -0700
Message-ID: <20220913195508.3511038-3-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Ae0x/cYtHCzUmIbnlOleUipnU3BBydliG8CbSfbHHfI=;
        b=lQy156yj9m33v2+lsCppN/1SSiL1+HSKUeGu4OKDvKzsWQP9uaxSZeRF6KYff4/ZX1
         T8ar9K8mrC7poQnpcOlicqZBPrnyrX4lQmy/efXceAo8c/r+O7+kebNQPiRqxM6b8RHk
         nqDdqIjYqMl2UkmBaLyC3jNoxqdBf+LTtzsYTc4L2U/V/TdvsthKIhCb1FgggCffFcVL
         4UCRPgfEkwehGvOaibbczRrkl3etaXkViPMT1ZepP3U6LDqZx2jP70X41REaFOYLplOf
         cOzr55DR2HMCT6kc/P98YRx0lPP2AD9Ny8hyMOuXORVZJrRjvmaKZrJZ1BXySGhbtpI9
         HDig==
In-Reply-To: <20220913195508.3511038-1-opendmb@gmail.com>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <songmuchun@bytedance.com>, Mike Rapoport <rppt@kernel.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Doug Berger <opendmb@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@su>

When demoting a hugepage to a smaller order, the number of pages
added to the target hstate will be the size of the large page
divided by the size of the smaller page.

Fixes: 8531fc6f52f5 ("hugetlb: add hugetlb demote page support")
Signed-off-by: Doug Berger <opendmb@gmail.com>
---
 mm/hugetlb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index e070b8593b37..79949893ac12 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3472,7 +3472,8 @@ static int demote_free_huge_page(struct hstate *h, struct page *page)
 	 * based on pool changes for the demoted page.
 	 */
 	h->max_huge_pages--;
-	target_hstate->max_huge_pages += pages_per_huge_page(h);
+	target_hstate->max_huge_pages += pages_per_huge_page(h) /
+					 pages_per_huge_page(target_hstate);
 
 	return rc;
 }
-- 
2.25.1

