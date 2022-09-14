From: Doug Berger <opendmb@gmail.com>
Subject: Re: [PATCH 01/21] mm/page_isolation: protect cma from
 isolate_single_pageblock
Date: Tue, 13 Sep 2022 18:47:30 -0700
Message-ID: <6b465dd1-f5b1-cb6c-cee0-5461b66f6031@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-2-opendmb@gmail.com>
 <36E322BF-F052-4A8B-9FA5-4E0AA84E4AAF@nvidia.com>
 <ff84d89b-6d4f-c739-63be-4c4825b1fd03@gmail.com>
 <71D040CB-0E26-4CD3-9121-54D740F24594@nvidia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lv2EW+YacMZIkto1FE/PYwGOrvQSc+gb1r7/5hGU0G0=;
        b=TlZ3UcwrCRVJ9pCoGwD1LClQHtJn3rO/rK+G/QPpv7Iu450TbP3yyF/PpJ4KoZNrhQ
         MmL6onngYB0QP2mJdhcNTmGqWKUOPLACrE9O5OtB6dSh2aJdstveTWv4gNubvVWpg8vw
         PayjyN6ouB+jZ2nwTv0I7xI9lIH9sP7IVvKi69tNQPm52gxCKiHC7d+jvEcV/O8SUEoF
         QpwR0VU+gqSP1sAKgmFxOt0GVo2jLbkMDJ8sUY5mET0nvSGhlbC7R7yCmSKPDpvsOJWa
         Be9JG32+StkF8qKPF4YcvzoSKp7S7iFh33nCmYmj/9JhsWnJP629KJ2nHlFm8+ITecAs
         6l5Q==
Content-Language: en-US
In-Reply-To: <71D040CB-0E26-4CD3-9121-54D740F24594@nvidia.com>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <songmuchun@bytedance.com>, Mike Rapoport <rppt@kernel.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Florian Fainelli <f.fainelli@gmail.com>, David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>

On 9/13/2022 6:09 PM, Zi Yan wrote:
> On 13 Sep 2022, at 20:59, Doug Berger wrote:
> 
>> On 9/13/2022 5:02 PM, Zi Yan wrote:
>>> On 13 Sep 2022, at 15:54, Doug Berger wrote:
>>>
>>>> The function set_migratetype_isolate() has special handling for
>>>> pageblocks of MIGRATE_CMA type that protects them from being
>>>> isolated for MIGRATE_MOVABLE requests.
>>>>
>>>> Since isolate_single_pageblock() doesn't receive the migratetype
>>>> argument of start_isolate_page_range() it used the migratetype
>>>> of the pageblock instead of the requested migratetype which
>>>> defeats this MIGRATE_CMA check.
>>>>
>>>> This allows an attempt to create a gigantic page within a CMA
>>>> region to change the migratetype of the first and last pageblocks
>>>> from MIGRATE_CMA to MIGRATE_MOVABLE when they are restored after
>>>> failure, which corrupts the CMA region.
>>>>
>>>> The calls to (un)set_migratetype_isolate() for the first and last
>>>> pageblocks of the start_isolate_page_range() are moved back into
>>>> that function to allow access to its migratetype argument and make
>>>> it easier to see how all of the pageblocks in the range are
>>>> isolated.
>>>>
>>>> Fixes: b2c9e2fbba32 ("mm: make alloc_contig_range work at pageblock granularity")
>>>> Signed-off-by: Doug Berger <opendmb@gmail.com>
>>>> ---
>>>>    mm/page_isolation.c | 75 +++++++++++++++++++++------------------------
>>>>    1 file changed, 35 insertions(+), 40 deletions(-)
>>>
>>> Thanks for the fix.
>> Thanks for the review.
>>
>>>
>>> Why not just pass migratetype into isolate_single_pageblock() and use
>>> it when set_migratetype_isolate() is used? That would have much
>>> fewer changes. What is the reason of pulling skip isolation logic out?
>> I found the skip_isolation logic confusing and thought that setting and restoring the migratetype within the same function and consolidating the error recovery paths also within that function was easier to understand and less prone to accidental breakage.
>>
>> In particular, setting MIGRATE_ISOLATE in isolate_single_pageblock() and having to remember to unset it in start_isolate_page_range() differently on different error paths was troublesome for me.
> 
> Wouldn't this work as well?
> 
> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> index c1307d1bea81..a312cabd0d95 100644
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -288,6 +288,7 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
>    * @isolate_before:    isolate the pageblock before the boundary_pfn
>    * @skip_isolation:    the flag to skip the pageblock isolation in second
>    *                     isolate_single_pageblock()
> + * @migratetype:       Migrate type to set in error recovery.
>    *
>    * Free and in-use pages can be as big as MAX_ORDER and contain more than one
>    * pageblock. When not all pageblocks within a page are isolated at the same
> @@ -302,9 +303,9 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
>    * the in-use page then splitting the free page.
>    */
>   static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
> -                       gfp_t gfp_flags, bool isolate_before, bool skip_isolation)
> +                       gfp_t gfp_flags, bool isolate_before, bool skip_isolation,
> +                       int migratetype)
>   {
> -       unsigned char saved_mt;
>          unsigned long start_pfn;
>          unsigned long isolate_pageblock;
>          unsigned long pfn;
> @@ -328,12 +329,10 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>          start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
>                                        zone->zone_start_pfn);
> 
> -       saved_mt = get_pageblock_migratetype(pfn_to_page(isolate_pageblock));
> -
>          if (skip_isolation)
> -               VM_BUG_ON(!is_migrate_isolate(saved_mt));
> +               VM_BUG_ON(!is_migrate_isolate(get_pageblock_migratetype(pfn_to_page(isolate_pageblock))));
>          else {
> -               ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock), saved_mt, flags,
> +               ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock), migratetype, flags,
>                                  isolate_pageblock, isolate_pageblock + pageblock_nr_pages);
> 
>                  if (ret)
> @@ -475,7 +474,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>   failed:
>          /* restore the original migratetype */
>          if (!skip_isolation)
> -               unset_migratetype_isolate(pfn_to_page(isolate_pageblock), saved_mt);
> +               unset_migratetype_isolate(pfn_to_page(isolate_pageblock), migratetype);
>          return -EBUSY;
>   }
> 
> @@ -537,7 +536,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>          bool skip_isolation = false;
> 
>          /* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
> -       ret = isolate_single_pageblock(isolate_start, flags, gfp_flags, false, skip_isolation);
> +       ret = isolate_single_pageblock(isolate_start, flags, gfp_flags, false,
> +                               skip_isolation, migratetype);
>          if (ret)
>                  return ret;
> 
> @@ -545,7 +545,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>                  skip_isolation = true;
> 
>          /* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
> -       ret = isolate_single_pageblock(isolate_end, flags, gfp_flags, true, skip_isolation);
> +       ret = isolate_single_pageblock(isolate_end, flags, gfp_flags, true,
> +                               skip_isolation, migratetype);
>          if (ret) {
>                  unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
>                  return ret;
> 
I would expect this to work as well, but it is not my preference.

>>
>> It could certainly be done differently, but this was my preference.
> 
> A smaller patch can make review easier, right?
It certainly can. Especially when it is for code that you are familiar 
with ;).

I am happy to have you submit a patch to fix this issue and submit it to 
stable for backporting. Fixing the issue is what's important to me.

> 
>>>
>>> Ultimately, I would like to make MIGRATE_ISOLATE a separate bit,
>>> so that migratetype will not be overwritten during page isolation.
>>> Then, set_migratetype_isolate() and start_isolate_page_range()
>>> will not have migratetype to set in error recovery any more.
>>> That is on my TODO.
>>>
>>>>
>>>> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>>>> index 9d73dc38e3d7..8e16aa22cb61 100644
>>>> --- a/mm/page_isolation.c
>>>> +++ b/mm/page_isolation.c
>>>> @@ -286,8 +286,6 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
>>>>     * @flags:			isolation flags
>>>>     * @gfp_flags:			GFP flags used for migrating pages
>>>>     * @isolate_before:	isolate the pageblock before the boundary_pfn
>>>> - * @skip_isolation:	the flag to skip the pageblock isolation in second
>>>> - *			isolate_single_pageblock()
>>>>     *
>>>>     * Free and in-use pages can be as big as MAX_ORDER-1 and contain more than one
>>>>     * pageblock. When not all pageblocks within a page are isolated at the same
>>>> @@ -302,9 +300,8 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
>>>>     * the in-use page then splitting the free page.
>>>>     */
>>>>    static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>>>> -			gfp_t gfp_flags, bool isolate_before, bool skip_isolation)
>>>> +			gfp_t gfp_flags, bool isolate_before)
>>>>    {
>>>> -	unsigned char saved_mt;
>>>>    	unsigned long start_pfn;
>>>>    	unsigned long isolate_pageblock;
>>>>    	unsigned long pfn;
>>>> @@ -328,18 +325,6 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>>>>    	start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
>>>>    				      zone->zone_start_pfn);
>>>>
>>>> -	saved_mt = get_pageblock_migratetype(pfn_to_page(isolate_pageblock));
>>>> -
>>>> -	if (skip_isolation)
>>>> -		VM_BUG_ON(!is_migrate_isolate(saved_mt));
>>>> -	else {
>>>> -		ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock), saved_mt, flags,
>>>> -				isolate_pageblock, isolate_pageblock + pageblock_nr_pages);
>>>> -
>>>> -		if (ret)
>>>> -			return ret;
>>>> -	}
>>>> -
>>>>    	/*
>>>>    	 * Bail out early when the to-be-isolated pageblock does not form
>>>>    	 * a free or in-use page across boundary_pfn:
>>>> @@ -428,7 +413,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>>>>    					ret = set_migratetype_isolate(page, page_mt,
>>>>    						flags, head_pfn, head_pfn + nr_pages);
>>>>    					if (ret)
>>>> -						goto failed;
>>>> +						return ret;
>>>>    				}
>>>>
>>>>    				ret = __alloc_contig_migrate_range(&cc, head_pfn,
>>>> @@ -443,7 +428,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>>>>    					unset_migratetype_isolate(page, page_mt);
>>>>
>>>>    				if (ret)
>>>> -					goto failed;
>>>> +					return -EBUSY;
>>>>    				/*
>>>>    				 * reset pfn to the head of the free page, so
>>>>    				 * that the free page handling code above can split
>>>> @@ -459,24 +444,19 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>>>>    				while (!PageBuddy(pfn_to_page(outer_pfn))) {
>>>>    					/* stop if we cannot find the free page */
>>>>    					if (++order >= MAX_ORDER)
>>>> -						goto failed;
>>>> +						return -EBUSY;
>>>>    					outer_pfn &= ~0UL << order;
>>>>    				}
>>>>    				pfn = outer_pfn;
>>>>    				continue;
>>>>    			} else
>>>>    #endif
>>>> -				goto failed;
>>>> +				return -EBUSY;
>>>>    		}
>>>>
>>>>    		pfn++;
>>>>    	}
>>>>    	return 0;
>>>> -failed:
>>>> -	/* restore the original migratetype */
>>>> -	if (!skip_isolation)
>>>> -		unset_migratetype_isolate(pfn_to_page(isolate_pageblock), saved_mt);
>>>> -	return -EBUSY;
>>>>    }
>>>>
>>>>    /**
>>>> @@ -534,21 +514,30 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>>>>    	unsigned long isolate_start = ALIGN_DOWN(start_pfn, pageblock_nr_pages);
>>>>    	unsigned long isolate_end = ALIGN(end_pfn, pageblock_nr_pages);
>>>>    	int ret;
>>>> -	bool skip_isolation = false;
>>>>
>>>>    	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
>>>> -	ret = isolate_single_pageblock(isolate_start, flags, gfp_flags, false, skip_isolation);
>>>> +	ret = set_migratetype_isolate(pfn_to_page(isolate_start), migratetype,
>>>> +			flags, isolate_start, isolate_start + pageblock_nr_pages);
>>>>    	if (ret)
>>>>    		return ret;
>>>> -
>>>> -	if (isolate_start == isolate_end - pageblock_nr_pages)
>>>> -		skip_isolation = true;
>>>> +	ret = isolate_single_pageblock(isolate_start, flags, gfp_flags, false);
>>>> +	if (ret)
>>>> +		goto unset_start_block;
>>>>
>>>>    	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
>>>> -	ret = isolate_single_pageblock(isolate_end, flags, gfp_flags, true, skip_isolation);
>>>> +	pfn = isolate_end - pageblock_nr_pages;
>>>> +	if (isolate_start != pfn) {
>>>> +		ret = set_migratetype_isolate(pfn_to_page(pfn), migratetype,
>>>> +				flags, pfn, pfn + pageblock_nr_pages);
>>>> +		if (ret)
>>>> +			goto unset_start_block;
>>>> +	}
>>>> +	ret = isolate_single_pageblock(isolate_end, flags, gfp_flags, true);
>>>>    	if (ret) {
>>>> -		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
>>>> -		return ret;
>>>> +		if (isolate_start != pfn)
>>>> +			goto unset_end_block;
>>>> +		else
>>>> +			goto unset_start_block;
>>>>    	}
>>>>
>>>>    	/* skip isolated pageblocks at the beginning and end */
>>>> @@ -557,15 +546,21 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>>>>    	     pfn += pageblock_nr_pages) {
>>>>    		page = __first_valid_page(pfn, pageblock_nr_pages);
>>>>    		if (page && set_migratetype_isolate(page, migratetype, flags,
>>>> -					start_pfn, end_pfn)) {
>>>> -			undo_isolate_page_range(isolate_start, pfn, migratetype);
>>>> -			unset_migratetype_isolate(
>>>> -				pfn_to_page(isolate_end - pageblock_nr_pages),
>>>> -				migratetype);
>>>> -			return -EBUSY;
>>>> -		}
>>>> +					start_pfn, end_pfn))
>>>> +			goto unset_isolated_blocks;
>>>>    	}
>>>>    	return 0;
>>>> +
>>>> +unset_isolated_blocks:
>>>> +	ret = -EBUSY;
>>>> +	undo_isolate_page_range(isolate_start + pageblock_nr_pages, pfn,
>>>> +				migratetype);
>>>> +unset_end_block:
>>>> +	unset_migratetype_isolate(pfn_to_page(isolate_end - pageblock_nr_pages),
>>>> +				  migratetype);
>>>> +unset_start_block:
>>>> +	unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
>>>> +	return ret;
>>>>    }
>>>>
>>>>    /*
>>>> -- 
>>>> 2.25.1
>>>
>>>
>>> --
>>> Best Regards,
>>> Yan, Zi
> 
> 
> --
> Best Regards,
> Yan, Zi
Thanks for your efforts to get alloc_contig_range to work at pageblock 
granularity!
-Doug
