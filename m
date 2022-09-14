From: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH 02/21] mm/hugetlb: correct max_huge_pages accounting on
 demote
Date: Wed, 14 Sep 2022 10:23:05 -0700
Message-ID: <YyIN+bpKdCb3JuuY@monkey>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-3-opendmb@gmail.com>
Mime-Version: 1.0
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=h+PaQEvKJ4r0tbbFxslr+sDg1uwEY75IzzGHepYM1wM=;
 b=mbBmgzFtoW00DkdfRrmMcY6RxIq2/ZSrHT3Nxg577RxspMcsaw3AxtHd5BQ/BMHK3/Ng
 0Jjf09met41awPv1Vu4d+k4LI+6nlWMhtyIgRCZOC12hoB/HR7ovGVhxWkBMIGShuHrl
 MhGpc+1RsZU20dlAdRNEjiy64IzbaqOyJ2G7g/baA3tHBOLW0KgRlxL0gaPQ1TwYXv1/
 J0K88Py9P/uWH+6K739A/1hTYTE/yajrACEbRoDtHiZibVU42Xa09ey8yGAGcaHn++Bh
 C9duYostiywX6LFXKhGEZibP60NEop/7Vz4giHJt2JlBQM68eMVbq2e955PDQkROgmn8 hQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+PaQEvKJ4r0tbbFxslr+sDg1uwEY75IzzGHepYM1wM=;
 b=tv8dXoGHmJOEuMDIvo4nlU2mU4IQbcucOkuhn+2wVaTkpIJgupiyJtpZ7v08OtG0iazV7jFwy9oQ5GcE96E4AgvKGadr5non2VpIWOv+QxqQlh6cUgAS+zOmAGZuA4r+9hj5NpzQnxQXt0BzmIGiHdMKwv/4en/LlWgYv/3bO/g=
Content-Disposition: inline
In-Reply-To: <20220913195508.3511038-3-opendmb@gmail.com>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Berger <opendmb@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Muchun Song <songmuchun@bytedance.com>, Mike Rapoport <rppt@kernel.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Florian Fainelli <f.fainelli@gmail.com>, David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>, Hari Bathini <>

On 09/13/22 12:54, Doug Berger wrote:
> When demoting a hugepage to a smaller order, the number of pages
> added to the target hstate will be the size of the large page
> divided by the size of the smaller page.
> 
> Fixes: 8531fc6f52f5 ("hugetlb: add hugetlb demote page support")
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> ---
>  mm/hugetlb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index e070b8593b37..79949893ac12 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3472,7 +3472,8 @@ static int demote_free_huge_page(struct hstate *h, struct page *page)
>  	 * based on pool changes for the demoted page.
>  	 */
>  	h->max_huge_pages--;
> -	target_hstate->max_huge_pages += pages_per_huge_page(h);
> +	target_hstate->max_huge_pages += pages_per_huge_page(h) /
> +					 pages_per_huge_page(target_hstate);
>  
>  	return rc;
>  }

This has already been fixed here,

https://lore.kernel.org/linux-mm/20220823030209.57434-2-linmiaohe@huawei.com/

-- 
Mike Kravetz
