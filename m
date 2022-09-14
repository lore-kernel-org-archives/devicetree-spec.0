From: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH 02/21] mm/hugetlb: correct max_huge_pages accounting on
 demote
Date: Wed, 14 Sep 2022 14:11:05 -0700
Message-ID: <YyJDaVRrKy5jgewU@monkey>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-3-opendmb@gmail.com>
 <YyIN+bpKdCb3JuuY@monkey>
 <20220914135825.88814aa1699e93c8a782abc6@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=ZJc1F9HYQOlsczZEz1vwWHtL1KKYf8bQHQYFfpT5CNA=;
 b=ZkGcqOeKJrR/J8ljmv5spZWDvnwHAozGWiNb85CdWi1gIJuugIIYrwWrD/fVD9ceChKs
 ka0PXy/iryrQEKRmFof9QT0t8czISYhnJzbBR3XFSlgZRPgPQ0bd1B+ZxEIj1DlMAK/b
 zlGft8Al2A0HvgGduWguZvUMCU4gbc43KvseoSd4Lc/wpINSJnfydOwit+Nxz5TLtI0u
 sieL2Vu1MpXJKrLiOLH1CbksPgqH9Vu0oiytV+HT24fri2xG5K3CCDNYfohiM/zkVDqj
 2DqXRG0Dgy2N9HJb2SjLzYMxar3q5Pm04cPB5xUSA8nBQNUtqakSu5PJCEb+CcT1zPVg mA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJc1F9HYQOlsczZEz1vwWHtL1KKYf8bQHQYFfpT5CNA=;
 b=rFTNhmL+PDhkyO1+8vA34+giC2MCq6WJTBeY+GbJU007msnJmG4y8sSNGjZyGLI36uNz5KNQMuKie9V6TXbV3nBEr4s8HCV4C3OZkOpgc1W9/jTi8a6VDzbKkckayAmAWAha23pjpgzHqvop6XJhnmgVkKHAFNZrX8xiMQkzd1U=
Content-Disposition: inline
In-Reply-To: <20220914135825.88814aa1699e93c8a782abc6@linux-foundation.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Doug Berger <opendmb@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Muchun Song <songmuchun@bytedance.com>, Mike Rapoport <rppt@kernel.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Florian Fainelli <f.fainelli@gmail.com>, David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>, Hari Bathini <hbathini@linux.ibm>

On 09/14/22 13:58, Andrew Morton wrote:
> On Wed, 14 Sep 2022 10:23:05 -0700 Mike Kravetz <mike.kravetz@oracle.com> wrote:
> 
> > On 09/13/22 12:54, Doug Berger wrote:
> > > When demoting a hugepage to a smaller order, the number of pages
> > > added to the target hstate will be the size of the large page
> > > divided by the size of the smaller page.
> > > 
> > > Fixes: 8531fc6f52f5 ("hugetlb: add hugetlb demote page support")
> > > Signed-off-by: Doug Berger <opendmb@gmail.com>
> > > ---
> > >  mm/hugetlb.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > > index e070b8593b37..79949893ac12 100644
> > > --- a/mm/hugetlb.c
> > > +++ b/mm/hugetlb.c
> > > @@ -3472,7 +3472,8 @@ static int demote_free_huge_page(struct hstate *h, struct page *page)
> > >  	 * based on pool changes for the demoted page.
> > >  	 */
> > >  	h->max_huge_pages--;
> > > -	target_hstate->max_huge_pages += pages_per_huge_page(h);
> > > +	target_hstate->max_huge_pages += pages_per_huge_page(h) /
> > > +					 pages_per_huge_page(target_hstate);
> > >  
> > >  	return rc;
> > >  }
> > 
> > This has already been fixed here,
> > 
> > https://lore.kernel.org/linux-mm/20220823030209.57434-2-linmiaohe@huawei.com/
> 
> Neither version tells us the user-visible runtime effects of the change :(

Sorry, I should have pushed harder on this with Miaohe's patch.

There are no user-visible runtime effects.  In fact, this change really causes
no functional change (unless I am mistaken and Miaohe did not correct me).
max_huge_pages is not used again until it is reset.  See my explanation at:
https://lore.kernel.org/linux-mm/YvwfvxXewnZpHQcz@monkey/
-- 
Mike Kravetz
