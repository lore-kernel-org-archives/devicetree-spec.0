From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/21] mm/page_isolation: protect cma from
 isolate_single_pageblock
Date: Wed, 14 Sep 2022 10:27:00 -0700
Message-ID: <a3363a52-883b-dcd1-b77f-f2bb378d6f2d@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-2-opendmb@gmail.com>
 <36E322BF-F052-4A8B-9FA5-4E0AA84E4AAF@nvidia.com>
 <ff84d89b-6d4f-c739-63be-4c4825b1fd03@gmail.com>
 <71D040CB-0E26-4CD3-9121-54D740F24594@nvidia.com>
 <6b465dd1-f5b1-cb6c-cee0-5461b66f6031@gmail.com>
 <819CB6CD-0112-4B07-BDFE-84611470070F@nvidia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=hsdefQIEXRQygaF3Dn6cxv0ih/rj9SBPRQELvXoH8xs=;
        b=KNPqrb4tTswiBZepLgTh3pz+heERU63Ppv1xOyMh0I1PuSX3Lnk0mOU79XPiIWavEr
         x4ObfwfIkw6MnzIyiioQ6+DoggIqhv32CFD1qWjFDu+xaZM7NqKu+0/8MEdzZlsF9N59
         OFFVZ0D+FrhCD70WIGKmi3gPQa2LFRgCy3nWTmrU8j3EnwX2F6/cMuhQ0tN0L3wJwiEc
         0TgoCkiC7JCGDtAKiGak90qzLu6R+FjLZN7BPuhdgd49A7oDsqULQQ7lHZBuwtWlXuGm
         bpwjytq5CwnAqBUcwl1ah8u1tOcoXgQZFaQA4OUC5d1fADQN6jtQgxpAo1ypsEvGtO+F
         czpQ==
Content-Language: en-US
In-Reply-To: <819CB6CD-0112-4B07-BDFE-84611470070F-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>

On 9/13/2022 6:53 PM, Zi Yan wrote:
> On 13 Sep 2022, at 21:47, Doug Berger wrote:
> 
>> On 9/13/2022 6:09 PM, Zi Yan wrote:
>>> On 13 Sep 2022, at 20:59, Doug Berger wrote:
>>>
>>>> On 9/13/2022 5:02 PM, Zi Yan wrote:
>>>>> On 13 Sep 2022, at 15:54, Doug Berger wrote:
>>>>>
>>>>>> The function set_migratetype_isolate() has special handling for
>>>>>> pageblocks of MIGRATE_CMA type that protects them from being
>>>>>> isolated for MIGRATE_MOVABLE requests.
>>>>>>
>>>>>> Since isolate_single_pageblock() doesn't receive the migratetype
>>>>>> argument of start_isolate_page_range() it used the migratetype
>>>>>> of the pageblock instead of the requested migratetype which
>>>>>> defeats this MIGRATE_CMA check.
>>>>>>
>>>>>> This allows an attempt to create a gigantic page within a CMA
>>>>>> region to change the migratetype of the first and last pageblocks
>>>>>> from MIGRATE_CMA to MIGRATE_MOVABLE when they are restored after
>>>>>> failure, which corrupts the CMA region.
>>>>>>
>>>>>> The calls to (un)set_migratetype_isolate() for the first and last
>>>>>> pageblocks of the start_isolate_page_range() are moved back into
>>>>>> that function to allow access to its migratetype argument and make
>>>>>> it easier to see how all of the pageblocks in the range are
>>>>>> isolated.
>>>>>>
>>>>>> Fixes: b2c9e2fbba32 ("mm: make alloc_contig_range work at pageblock granularity")
>>>>>> Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>> ---
>>>>>>     mm/page_isolation.c | 75 +++++++++++++++++++++------------------------
>>>>>>     1 file changed, 35 insertions(+), 40 deletions(-)
>>>>>
>>>>> Thanks for the fix.
>>>> Thanks for the review.
>>>>
>>>>>
>>>>> Why not just pass migratetype into isolate_single_pageblock() and use
>>>>> it when set_migratetype_isolate() is used? That would have much
>>>>> fewer changes. What is the reason of pulling skip isolation logic out?
>>>> I found the skip_isolation logic confusing and thought that setting and restoring the migratetype within the same function and consolidating the error recovery paths also within that function was easier to understand and less prone to accidental breakage.
>>>>
>>>> In particular, setting MIGRATE_ISOLATE in isolate_single_pageblock() and having to remember to unset it in start_isolate_page_range() differently on different error paths was troublesome for me.
>>>
>>> Wouldn't this work as well?
>>>
>>> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>>> index c1307d1bea81..a312cabd0d95 100644
>>> --- a/mm/page_isolation.c
>>> +++ b/mm/page_isolation.c
>>> @@ -288,6 +288,7 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
>>>     * @isolate_before:    isolate the pageblock before the boundary_pfn
>>>     * @skip_isolation:    the flag to skip the pageblock isolation in second
>>>     *                     isolate_single_pageblock()
>>> + * @migratetype:       Migrate type to set in error recovery.
>>>     *
>>>     * Free and in-use pages can be as big as MAX_ORDER and contain more than one
>>>     * pageblock. When not all pageblocks within a page are isolated at the same
>>> @@ -302,9 +303,9 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
>>>     * the in-use page then splitting the free page.
>>>     */
>>>    static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>>> -                       gfp_t gfp_flags, bool isolate_before, bool skip_isolation)
>>> +                       gfp_t gfp_flags, bool isolate_before, bool skip_isolation,
>>> +                       int migratetype)
>>>    {
>>> -       unsigned char saved_mt;
>>>           unsigned long start_pfn;
>>>           unsigned long isolate_pageblock;
>>>           unsigned long pfn;
>>> @@ -328,12 +329,10 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>>>           start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
>>>                                         zone->zone_start_pfn);
>>>
>>> -       saved_mt = get_pageblock_migratetype(pfn_to_page(isolate_pageblock));
>>> -
>>>           if (skip_isolation)
>>> -               VM_BUG_ON(!is_migrate_isolate(saved_mt));
>>> +               VM_BUG_ON(!is_migrate_isolate(get_pageblock_migratetype(pfn_to_page(isolate_pageblock))));
>>>           else {
>>> -               ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock), saved_mt, flags,
>>> +               ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock), migratetype, flags,
>>>                                   isolate_pageblock, isolate_pageblock + pageblock_nr_pages);
>>>
>>>                   if (ret)
>>> @@ -475,7 +474,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>>>    failed:
>>>           /* restore the original migratetype */
>>>           if (!skip_isolation)
>>> -               unset_migratetype_isolate(pfn_to_page(isolate_pageblock), saved_mt);
>>> +               unset_migratetype_isolate(pfn_to_page(isolate_pageblock), migratetype);
>>>           return -EBUSY;
>>>    }
>>>
>>> @@ -537,7 +536,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>>>           bool skip_isolation = false;
>>>
>>>           /* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
>>> -       ret = isolate_single_pageblock(isolate_start, flags, gfp_flags, false, skip_isolation);
>>> +       ret = isolate_single_pageblock(isolate_start, flags, gfp_flags, false,
>>> +                               skip_isolation, migratetype);
>>>           if (ret)
>>>                   return ret;
>>>
>>> @@ -545,7 +545,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>>>                   skip_isolation = true;
>>>
>>>           /* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
>>> -       ret = isolate_single_pageblock(isolate_end, flags, gfp_flags, true, skip_isolation);
>>> +       ret = isolate_single_pageblock(isolate_end, flags, gfp_flags, true,
>>> +                               skip_isolation, migratetype);
>>>           if (ret) {
>>>                   unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
>>>                   return ret;
>>>
>> I would expect this to work as well, but it is not my preference.
>>
>>>>
>>>> It could certainly be done differently, but this was my preference.
>>>
>>> A smaller patch can make review easier, right?
>> It certainly can. Especially when it is for code that you are familiar with ;).
>>
>> I am happy to have you submit a patch to fix this issue and submit it to stable for backporting. Fixing the issue is what's important to me.
>>
> 
> I can submit the above as a patch. Is there a visible userspace issue, so that we need to
> backport it? Thanks.
I did not observe symptoms of the issue, but I did observe the issue 
when allocating gigantic huge pages as part of the hugetlbfs on a system 
with CMA regions.

My best guess is that it probably does not create a "functional" problem 
since the error would likely be cancelled out by subsequent CMA 
allocations restoring the pageblock migratetype. However, in the 
meantime the page allocator would handle free pages in those pageblocks 
without the MIGRATE_CMA qualifications which might impact driver 
performance. There might be other problems of which I am unaware.

The issue currently only exists in the wild in v5.19, so it would be 
nice to get it backported there to nip it in the bud.

> 
>>>
>>>>>
>>>>> Ultimately, I would like to make MIGRATE_ISOLATE a separate bit,
>>>>> so that migratetype will not be overwritten during page isolation.
>>>>> Then, set_migratetype_isolate() and start_isolate_page_range()
>>>>> will not have migratetype to set in error recovery any more.
>>>>> That is on my TODO.
>>>>>
>>>>>>
>>>>>> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>>>>>> index 9d73dc38e3d7..8e16aa22cb61 100644
>>>>>> --- a/mm/page_isolation.c
>>>>>> +++ b/mm/page_isolation.c
>>>>>> @@ -286,8 +286,6 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
>>>>>>      * @flags:			isolation flags
>>>>>>      * @gfp_flags:			GFP flags used for migrating pages
>>>>>>      * @isolate_before:	isolate the pageblock before the boundary_pfn
>>>>>> - * @skip_isolation:	the flag to skip the pageblock isolation in second
>>>>>> - *			isolate_single_pageblock()
>>>>>>      *
>>>>>>      * Free and in-use pages can be as big as MAX_ORDER-1 and contain more than one
>>>>>>      * pageblock. When not all pageblocks within a page are isolated at the same
>>>>>> @@ -302,9 +300,8 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
>>>>>>      * the in-use page then splitting the free page.
>>>>>>      */
>>>>>>     static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>>>>>> -			gfp_t gfp_flags, bool isolate_before, bool skip_isolation)
>>>>>> +			gfp_t gfp_flags, bool isolate_before)
>>>>>>     {
>>>>>> -	unsigned char saved_mt;
>>>>>>     	unsigned long start_pfn;
>>>>>>     	unsigned long isolate_pageblock;
>>>>>>     	unsigned long pfn;
>>>>>> @@ -328,18 +325,6 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>>>>>>     	start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
>>>>>>     				      zone->zone_start_pfn);
>>>>>>
>>>>>> -	saved_mt = get_pageblock_migratetype(pfn_to_page(isolate_pageblock));
>>>>>> -
>>>>>> -	if (skip_isolation)
>>>>>> -		VM_BUG_ON(!is_migrate_isolate(saved_mt));
>>>>>> -	else {
>>>>>> -		ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock), saved_mt, flags,
>>>>>> -				isolate_pageblock, isolate_pageblock + pageblock_nr_pages);
>>>>>> -
>>>>>> -		if (ret)
>>>>>> -			return ret;
>>>>>> -	}
>>>>>> -
>>>>>>     	/*
>>>>>>     	 * Bail out early when the to-be-isolated pageblock does not form
>>>>>>     	 * a free or in-use page across boundary_pfn:
>>>>>> @@ -428,7 +413,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>>>>>>     					ret = set_migratetype_isolate(page, page_mt,
>>>>>>     						flags, head_pfn, head_pfn + nr_pages);
>>>>>>     					if (ret)
>>>>>> -						goto failed;
>>>>>> +						return ret;
>>>>>>     				}
>>>>>>
>>>>>>     				ret = __alloc_contig_migrate_range(&cc, head_pfn,
>>>>>> @@ -443,7 +428,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>>>>>>     					unset_migratetype_isolate(page, page_mt);
>>>>>>
>>>>>>     				if (ret)
>>>>>> -					goto failed;
>>>>>> +					return -EBUSY;
>>>>>>     				/*
>>>>>>     				 * reset pfn to the head of the free page, so
>>>>>>     				 * that the free page handling code above can split
>>>>>> @@ -459,24 +444,19 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>>>>>>     				while (!PageBuddy(pfn_to_page(outer_pfn))) {
>>>>>>     					/* stop if we cannot find the free page */
>>>>>>     					if (++order >= MAX_ORDER)
>>>>>> -						goto failed;
>>>>>> +						return -EBUSY;
>>>>>>     					outer_pfn &= ~0UL << order;
>>>>>>     				}
>>>>>>     				pfn = outer_pfn;
>>>>>>     				continue;
>>>>>>     			} else
>>>>>>     #endif
>>>>>> -				goto failed;
>>>>>> +				return -EBUSY;
>>>>>>     		}
>>>>>>
>>>>>>     		pfn++;
>>>>>>     	}
>>>>>>     	return 0;
>>>>>> -failed:
>>>>>> -	/* restore the original migratetype */
>>>>>> -	if (!skip_isolation)
>>>>>> -		unset_migratetype_isolate(pfn_to_page(isolate_pageblock), saved_mt);
>>>>>> -	return -EBUSY;
>>>>>>     }
>>>>>>
>>>>>>     /**
>>>>>> @@ -534,21 +514,30 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>>>>>>     	unsigned long isolate_start = ALIGN_DOWN(start_pfn, pageblock_nr_pages);
>>>>>>     	unsigned long isolate_end = ALIGN(end_pfn, pageblock_nr_pages);
>>>>>>     	int ret;
>>>>>> -	bool skip_isolation = false;
>>>>>>
>>>>>>     	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
>>>>>> -	ret = isolate_single_pageblock(isolate_start, flags, gfp_flags, false, skip_isolation);
>>>>>> +	ret = set_migratetype_isolate(pfn_to_page(isolate_start), migratetype,
>>>>>> +			flags, isolate_start, isolate_start + pageblock_nr_pages);
>>>>>>     	if (ret)
>>>>>>     		return ret;
>>>>>> -
>>>>>> -	if (isolate_start == isolate_end - pageblock_nr_pages)
>>>>>> -		skip_isolation = true;
>>>>>> +	ret = isolate_single_pageblock(isolate_start, flags, gfp_flags, false);
>>>>>> +	if (ret)
>>>>>> +		goto unset_start_block;
>>>>>>
>>>>>>     	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
>>>>>> -	ret = isolate_single_pageblock(isolate_end, flags, gfp_flags, true, skip_isolation);
>>>>>> +	pfn = isolate_end - pageblock_nr_pages;
>>>>>> +	if (isolate_start != pfn) {
>>>>>> +		ret = set_migratetype_isolate(pfn_to_page(pfn), migratetype,
>>>>>> +				flags, pfn, pfn + pageblock_nr_pages);
>>>>>> +		if (ret)
>>>>>> +			goto unset_start_block;
>>>>>> +	}
>>>>>> +	ret = isolate_single_pageblock(isolate_end, flags, gfp_flags, true);
>>>>>>     	if (ret) {
>>>>>> -		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
>>>>>> -		return ret;
>>>>>> +		if (isolate_start != pfn)
>>>>>> +			goto unset_end_block;
>>>>>> +		else
>>>>>> +			goto unset_start_block;
>>>>>>     	}
>>>>>>
>>>>>>     	/* skip isolated pageblocks at the beginning and end */
>>>>>> @@ -557,15 +546,21 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>>>>>>     	     pfn += pageblock_nr_pages) {
>>>>>>     		page = __first_valid_page(pfn, pageblock_nr_pages);
>>>>>>     		if (page && set_migratetype_isolate(page, migratetype, flags,
>>>>>> -					start_pfn, end_pfn)) {
>>>>>> -			undo_isolate_page_range(isolate_start, pfn, migratetype);
>>>>>> -			unset_migratetype_isolate(
>>>>>> -				pfn_to_page(isolate_end - pageblock_nr_pages),
>>>>>> -				migratetype);
>>>>>> -			return -EBUSY;
>>>>>> -		}
>>>>>> +					start_pfn, end_pfn))
>>>>>> +			goto unset_isolated_blocks;
>>>>>>     	}
>>>>>>     	return 0;
>>>>>> +
>>>>>> +unset_isolated_blocks:
>>>>>> +	ret = -EBUSY;
>>>>>> +	undo_isolate_page_range(isolate_start + pageblock_nr_pages, pfn,
>>>>>> +				migratetype);
>>>>>> +unset_end_block:
>>>>>> +	unset_migratetype_isolate(pfn_to_page(isolate_end - pageblock_nr_pages),
>>>>>> +				  migratetype);
>>>>>> +unset_start_block:
>>>>>> +	unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
>>>>>> +	return ret;
>>>>>>     }
>>>>>>
>>>>>>     /*
>>>>>> -- 
>>>>>> 2.25.1
>>>>>
>>>>>
>>>>> --
>>>>> Best Regards,
>>>>> Yan, Zi
>>>
>>>
>>> --
>>> Best Regards,
>>> Yan, Zi
>> Thanks for your efforts to get alloc_contig_range to work at pageblock granularity!
>> -Doug
> 
> 
> --
> Best Regards,
> Yan, Zi
Thanks,
-Doug
