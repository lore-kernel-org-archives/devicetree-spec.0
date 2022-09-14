From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/21] mm/hugetlb: correct max_huge_pages accounting on
 demote
Date: Wed, 14 Sep 2022 10:30:45 -0700
Message-ID: <4d715585-413d-a506-1bc0-1f12a0aec716@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-3-opendmb@gmail.com> <YyIN+bpKdCb3JuuY@monkey>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0L27G4iP/cuKuBXoxBJrd9C7v+AkXXve2e5WgZmnPFM=;
        b=OwNpFg7qm3P6LQcskO6h973FuZ5ZH5pqPhL9rSvFWvFDrm4IqvH2rasrZoz63gaIVM
         QBxwZeFlhTErfLCFnU/hBTKbTzaucoDPNVe+ec0H2jDaK8Ebhzi4iLc4B30cdh5SIP+J
         U/u8Q+X/XTfAqwup7cUdIYBZy2FMkUqtyZkZx1xbRc2bYhX/D4AOCAU6cAR2wn7cwBTv
         b/PDf4eVJsqSWzv4DCt6F0Fc7zS9N2yOjUi4GsS5Wj91RFeCQIxdy5ahy+ncakDr8iB6
         Fxan9Mw9UOkoWGjPBTPYJun8O3wwAS+yMUT6j8hC6rwUjtVB9XEcsUqg/IOrwP18C5+W
         aNJA==
Content-Language: en-US
In-Reply-To: <YyIN+bpKdCb3JuuY@monkey>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>, Hari Bathini <>

On 9/14/2022 10:23 AM, Mike Kravetz wrote:
> On 09/13/22 12:54, Doug Berger wrote:
>> When demoting a hugepage to a smaller order, the number of pages
>> added to the target hstate will be the size of the large page
>> divided by the size of the smaller page.
>>
>> Fixes: 8531fc6f52f5 ("hugetlb: add hugetlb demote page support")
>> Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
> https://lore.kernel.org/linux-mm/20220823030209.57434-2-linmiaohe-hv44wF8Li93QT0dZR+AlfA@public.gmane.org/
> 
Excellent! Thanks for the pointer and sorry for the noise.
-Doug
