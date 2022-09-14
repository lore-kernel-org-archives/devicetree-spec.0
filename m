From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 02/21] mm/hugetlb: correct max_huge_pages accounting on
 demote
Date: Wed, 14 Sep 2022 10:26:48 -0700
Message-ID: <c4d40567-6ac6-d822-7098-a5ad1ae567ec@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-3-opendmb@gmail.com> <YyIN+bpKdCb3JuuY@monkey>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=QyRGzlkoFcQG3CIMtJPpDZn+hUgACTBPPomMcutX19k=;
        b=Pn4nqjxVEX/40MaS2pCNxckO6W0GVqjplLgc4YUpDc+NUzQMdvYp+h9a2SUbKePdNf
         y8kZjtKbeOf8fVif7+dfDenYS/1jVYV5uoFoAs/cY4uIPSj19owpvWNd7wx/0m0l7rws
         oecBLvmQr6nar/9/rUQmFR9ltOIqaaW68CcY5Kgo8ysxDTvO6RFaQqmmpD1CQ5gzcJXf
         OFxlH1/pZ06zBltHk8fY4h1CK4yGsoQUovRnAPOdclXozylg4qtr0bgrQJa/egKMEPOb
         B6ZmZiy3RVdEFGRF2KkrY1qTREOETvJsBmdX8yhjBlcH4gn8S8Vz2XX1XviQtC12zn6h
         pu3A==
Content-Language: en-US
In-Reply-To: <YyIN+bpKdCb3JuuY@monkey>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Kravetz <mike.kravetz@oracle.com>, Doug Berger <opendmb@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Muchun Song <songmuchun@bytedance.com>, Mike Rapoport <rppt@kernel.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>, Hari Bathini <hbathini@linux.ibm.com>, Kees Cook <keesc>

On 9/14/22 10:23, Mike Kravetz wrote:
> On 09/13/22 12:54, Doug Berger wrote:
>> When demoting a hugepage to a smaller order, the number of pages
>> added to the target hstate will be the size of the large page
>> divided by the size of the smaller page.
>>
>> Fixes: 8531fc6f52f5 ("hugetlb: add hugetlb demote page support")
>> Signed-off-by: Doug Berger <opendmb@gmail.com>
>> ---
>>   mm/hugetlb.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index e070b8593b37..79949893ac12 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -3472,7 +3472,8 @@ static int demote_free_huge_page(struct hstate *h, struct page *page)
>>   	 * based on pool changes for the demoted page.
>>   	 */
>>   	h->max_huge_pages--;
>> -	target_hstate->max_huge_pages += pages_per_huge_page(h);
>> +	target_hstate->max_huge_pages += pages_per_huge_page(h) /
>> +					 pages_per_huge_page(target_hstate);
>>   
>>   	return rc;
>>   }
> 
> This has already been fixed here,
> 
> https://lore.kernel.org/linux-mm/20220823030209.57434-2-linmiaohe@huawei.com/
> 

Could we slap the Fixes tag when this Miaohe's patch series gets 
accepted since the offending commit is in v5.16 and beyond. Thanks!
-- 
Florian
