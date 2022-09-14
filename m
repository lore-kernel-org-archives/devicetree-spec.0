From: Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 01/21] mm/page_isolation: protect cma from
 isolate_single_pageblock
Date: Tue, 13 Sep 2022 21:09:36 -0400
Message-ID: <71D040CB-0E26-4CD3-9121-54D740F24594@nvidia.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-2-opendmb@gmail.com>
 <36E322BF-F052-4A8B-9FA5-4E0AA84E4AAF@nvidia.com>
 <ff84d89b-6d4f-c739-63be-4c4825b1fd03@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary="=_MailMate_616185E2-29EC-4B0E-8755-A12BD9249736_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2v/TCRcZ/UTFjnI4Zbvw/IAbK4sfnHYDS7H9Kum4LEk=;
 b=AldNPiGotb9KR0Fj/6sXxGG8JjkolBYvub3KBHYFtCyDusseiwPmAC4zdSiEh27xZlOJsJQaoDmgd4YttXS/WajMq6N7SzGBdTlccDAU443A9Qk8neTs6PO0PGHuvxLBBTz6zrbwXT1fTpfR5L7pAW9xCEe3+GGto02YX34EdcEkHk3HxgQU2770tYLeR70eR0OjFY4LqulH8mWusjR+h1HHrr8AbyR8uAbghw4okObfapb4Vrn6iMon126z2iyUBdzdcOxfWtHLZ+xGrGHEE2B9H34VIspYBxWd34dmsCGteUaAHizF1I4hChjIqDYuLjYXmAUWUx9F6v0WPhVxYA==
In-Reply-To: <ff84d89b-6d4f-c739-63be-4c4825b1fd03-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
To: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>

--=_MailMate_616185E2-29EC-4B0E-8755-A12BD9249736_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 13 Sep 2022, at 20:59, Doug Berger wrote:

> On 9/13/2022 5:02 PM, Zi Yan wrote:
>> On 13 Sep 2022, at 15:54, Doug Berger wrote:
>>
>>> The function set_migratetype_isolate() has special handling for
>>> pageblocks of MIGRATE_CMA type that protects them from being
>>> isolated for MIGRATE_MOVABLE requests.
>>>
>>> Since isolate_single_pageblock() doesn't receive the migratetype
>>> argument of start_isolate_page_range() it used the migratetype
>>> of the pageblock instead of the requested migratetype which
>>> defeats this MIGRATE_CMA check.
>>>
>>> This allows an attempt to create a gigantic page within a CMA
>>> region to change the migratetype of the first and last pageblocks
>>> from MIGRATE_CMA to MIGRATE_MOVABLE when they are restored after
>>> failure, which corrupts the CMA region.
>>>
>>> The calls to (un)set_migratetype_isolate() for the first and last
>>> pageblocks of the start_isolate_page_range() are moved back into
>>> that function to allow access to its migratetype argument and make
>>> it easier to see how all of the pageblocks in the range are
>>> isolated.
>>>
>>> Fixes: b2c9e2fbba32 ("mm: make alloc_contig_range work at pageblock g=
ranularity")
>>> Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>   mm/page_isolation.c | 75 +++++++++++++++++++++---------------------=
---
>>>   1 file changed, 35 insertions(+), 40 deletions(-)
>>
>> Thanks for the fix.
> Thanks for the review.
>
>>
>> Why not just pass migratetype into isolate_single_pageblock() and use
>> it when set_migratetype_isolate() is used? That would have much
>> fewer changes. What is the reason of pulling skip isolation logic out?=

> I found the skip_isolation logic confusing and thought that setting and=
 restoring the migratetype within the same function and consolidating the=
 error recovery paths also within that function was easier to understand =
and less prone to accidental breakage.
>
> In particular, setting MIGRATE_ISOLATE in isolate_single_pageblock() an=
d having to remember to unset it in start_isolate_page_range() differentl=
y on different error paths was troublesome for me.

Wouldn't this work as well?

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index c1307d1bea81..a312cabd0d95 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -288,6 +288,7 @@ __first_valid_page(unsigned long pfn, unsigned long n=
r_pages)
  * @isolate_before:    isolate the pageblock before the boundary_pfn
  * @skip_isolation:    the flag to skip the pageblock isolation in secon=
d
  *                     isolate_single_pageblock()
+ * @migratetype:       Migrate type to set in error recovery.
  *
  * Free and in-use pages can be as big as MAX_ORDER and contain more tha=
n one
  * pageblock. When not all pageblocks within a page are isolated at the =
same
@@ -302,9 +303,9 @@ __first_valid_page(unsigned long pfn, unsigned long n=
r_pages)
  * the in-use page then splitting the free page.
  */
 static int isolate_single_pageblock(unsigned long boundary_pfn, int flag=
s,
-                       gfp_t gfp_flags, bool isolate_before, bool skip_i=
solation)
+                       gfp_t gfp_flags, bool isolate_before, bool skip_i=
solation,
+                       int migratetype)
 {
-       unsigned char saved_mt;
        unsigned long start_pfn;
        unsigned long isolate_pageblock;
        unsigned long pfn;
@@ -328,12 +329,10 @@ static int isolate_single_pageblock(unsigned long b=
oundary_pfn, int flags,
        start_pfn  =3D max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAG=
ES),
                                      zone->zone_start_pfn);

-       saved_mt =3D get_pageblock_migratetype(pfn_to_page(isolate_pagebl=
ock));
-
        if (skip_isolation)
-               VM_BUG_ON(!is_migrate_isolate(saved_mt));
+               VM_BUG_ON(!is_migrate_isolate(get_pageblock_migratetype(p=
fn_to_page(isolate_pageblock))));
        else {
-               ret =3D set_migratetype_isolate(pfn_to_page(isolate_pageb=
lock), saved_mt, flags,
+               ret =3D set_migratetype_isolate(pfn_to_page(isolate_pageb=
lock), migratetype, flags,
                                isolate_pageblock, isolate_pageblock + pa=
geblock_nr_pages);

                if (ret)
@@ -475,7 +474,7 @@ static int isolate_single_pageblock(unsigned long bou=
ndary_pfn, int flags,
 failed:
        /* restore the original migratetype */
        if (!skip_isolation)
-               unset_migratetype_isolate(pfn_to_page(isolate_pageblock),=
 saved_mt);
+               unset_migratetype_isolate(pfn_to_page(isolate_pageblock),=
 migratetype);
        return -EBUSY;
 }

@@ -537,7 +536,8 @@ int start_isolate_page_range(unsigned long start_pfn,=
 unsigned long end_pfn,
        bool skip_isolation =3D false;

        /* isolate [isolate_start, isolate_start + pageblock_nr_pages) pa=
geblock */
-       ret =3D isolate_single_pageblock(isolate_start, flags, gfp_flags,=
 false, skip_isolation);
+       ret =3D isolate_single_pageblock(isolate_start, flags, gfp_flags,=
 false,
+                               skip_isolation, migratetype);
        if (ret)
                return ret;

@@ -545,7 +545,8 @@ int start_isolate_page_range(unsigned long start_pfn,=
 unsigned long end_pfn,
                skip_isolation =3D true;

        /* isolate [isolate_end - pageblock_nr_pages, isolate_end) pagebl=
ock */
-       ret =3D isolate_single_pageblock(isolate_end, flags, gfp_flags, t=
rue, skip_isolation);
+       ret =3D isolate_single_pageblock(isolate_end, flags, gfp_flags, t=
rue,
+                               skip_isolation, migratetype);
        if (ret) {
                unset_migratetype_isolate(pfn_to_page(isolate_start), mig=
ratetype);
                return ret;

>
> It could certainly be done differently, but this was my preference.

A smaller patch can make review easier, right?

>>
>> Ultimately, I would like to make MIGRATE_ISOLATE a separate bit,
>> so that migratetype will not be overwritten during page isolation.
>> Then, set_migratetype_isolate() and start_isolate_page_range()
>> will not have migratetype to set in error recovery any more.
>> That is on my TODO.
>>
>>>
>>> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>>> index 9d73dc38e3d7..8e16aa22cb61 100644
>>> --- a/mm/page_isolation.c
>>> +++ b/mm/page_isolation.c
>>> @@ -286,8 +286,6 @@ __first_valid_page(unsigned long pfn, unsigned lo=
ng nr_pages)
>>>    * @flags:			isolation flags
>>>    * @gfp_flags:			GFP flags used for migrating pages
>>>    * @isolate_before:	isolate the pageblock before the boundary_pfn
>>> - * @skip_isolation:	the flag to skip the pageblock isolation in seco=
nd
>>> - *			isolate_single_pageblock()
>>>    *
>>>    * Free and in-use pages can be as big as MAX_ORDER-1 and contain m=
ore than one
>>>    * pageblock. When not all pageblocks within a page are isolated at=
 the same
>>> @@ -302,9 +300,8 @@ __first_valid_page(unsigned long pfn, unsigned lo=
ng nr_pages)
>>>    * the in-use page then splitting the free page.
>>>    */
>>>   static int isolate_single_pageblock(unsigned long boundary_pfn, int=
 flags,
>>> -			gfp_t gfp_flags, bool isolate_before, bool skip_isolation)
>>> +			gfp_t gfp_flags, bool isolate_before)
>>>   {
>>> -	unsigned char saved_mt;
>>>   	unsigned long start_pfn;
>>>   	unsigned long isolate_pageblock;
>>>   	unsigned long pfn;
>>> @@ -328,18 +325,6 @@ static int isolate_single_pageblock(unsigned lon=
g boundary_pfn, int flags,
>>>   	start_pfn  =3D max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGE=
S),
>>>   				      zone->zone_start_pfn);
>>>
>>> -	saved_mt =3D get_pageblock_migratetype(pfn_to_page(isolate_pagebloc=
k));
>>> -
>>> -	if (skip_isolation)
>>> -		VM_BUG_ON(!is_migrate_isolate(saved_mt));
>>> -	else {
>>> -		ret =3D set_migratetype_isolate(pfn_to_page(isolate_pageblock), sa=
ved_mt, flags,
>>> -				isolate_pageblock, isolate_pageblock + pageblock_nr_pages);
>>> -
>>> -		if (ret)
>>> -			return ret;
>>> -	}
>>> -
>>>   	/*
>>>   	 * Bail out early when the to-be-isolated pageblock does not form
>>>   	 * a free or in-use page across boundary_pfn:
>>> @@ -428,7 +413,7 @@ static int isolate_single_pageblock(unsigned long=
 boundary_pfn, int flags,
>>>   					ret =3D set_migratetype_isolate(page, page_mt,
>>>   						flags, head_pfn, head_pfn + nr_pages);
>>>   					if (ret)
>>> -						goto failed;
>>> +						return ret;
>>>   				}
>>>
>>>   				ret =3D __alloc_contig_migrate_range(&cc, head_pfn,
>>> @@ -443,7 +428,7 @@ static int isolate_single_pageblock(unsigned long=
 boundary_pfn, int flags,
>>>   					unset_migratetype_isolate(page, page_mt);
>>>
>>>   				if (ret)
>>> -					goto failed;
>>> +					return -EBUSY;
>>>   				/*
>>>   				 * reset pfn to the head of the free page, so
>>>   				 * that the free page handling code above can split
>>> @@ -459,24 +444,19 @@ static int isolate_single_pageblock(unsigned lo=
ng boundary_pfn, int flags,
>>>   				while (!PageBuddy(pfn_to_page(outer_pfn))) {
>>>   					/* stop if we cannot find the free page */
>>>   					if (++order >=3D MAX_ORDER)
>>> -						goto failed;
>>> +						return -EBUSY;
>>>   					outer_pfn &=3D ~0UL << order;
>>>   				}
>>>   				pfn =3D outer_pfn;
>>>   				continue;
>>>   			} else
>>>   #endif
>>> -				goto failed;
>>> +				return -EBUSY;
>>>   		}
>>>
>>>   		pfn++;
>>>   	}
>>>   	return 0;
>>> -failed:
>>> -	/* restore the original migratetype */
>>> -	if (!skip_isolation)
>>> -		unset_migratetype_isolate(pfn_to_page(isolate_pageblock), saved_mt=
);
>>> -	return -EBUSY;
>>>   }
>>>
>>>   /**
>>> @@ -534,21 +514,30 @@ int start_isolate_page_range(unsigned long star=
t_pfn, unsigned long end_pfn,
>>>   	unsigned long isolate_start =3D ALIGN_DOWN(start_pfn, pageblock_nr=
_pages);
>>>   	unsigned long isolate_end =3D ALIGN(end_pfn, pageblock_nr_pages);
>>>   	int ret;
>>> -	bool skip_isolation =3D false;
>>>
>>>   	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pag=
eblock */
>>> -	ret =3D isolate_single_pageblock(isolate_start, flags, gfp_flags, f=
alse, skip_isolation);
>>> +	ret =3D set_migratetype_isolate(pfn_to_page(isolate_start), migrate=
type,
>>> +			flags, isolate_start, isolate_start + pageblock_nr_pages);
>>>   	if (ret)
>>>   		return ret;
>>> -
>>> -	if (isolate_start =3D=3D isolate_end - pageblock_nr_pages)
>>> -		skip_isolation =3D true;
>>> +	ret =3D isolate_single_pageblock(isolate_start, flags, gfp_flags, f=
alse);
>>> +	if (ret)
>>> +		goto unset_start_block;
>>>
>>>   	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblo=
ck */
>>> -	ret =3D isolate_single_pageblock(isolate_end, flags, gfp_flags, tru=
e, skip_isolation);
>>> +	pfn =3D isolate_end - pageblock_nr_pages;
>>> +	if (isolate_start !=3D pfn) {
>>> +		ret =3D set_migratetype_isolate(pfn_to_page(pfn), migratetype,
>>> +				flags, pfn, pfn + pageblock_nr_pages);
>>> +		if (ret)
>>> +			goto unset_start_block;
>>> +	}
>>> +	ret =3D isolate_single_pageblock(isolate_end, flags, gfp_flags, tru=
e);
>>>   	if (ret) {
>>> -		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype)=
;
>>> -		return ret;
>>> +		if (isolate_start !=3D pfn)
>>> +			goto unset_end_block;
>>> +		else
>>> +			goto unset_start_block;
>>>   	}
>>>
>>>   	/* skip isolated pageblocks at the beginning and end */
>>> @@ -557,15 +546,21 @@ int start_isolate_page_range(unsigned long star=
t_pfn, unsigned long end_pfn,
>>>   	     pfn +=3D pageblock_nr_pages) {
>>>   		page =3D __first_valid_page(pfn, pageblock_nr_pages);
>>>   		if (page && set_migratetype_isolate(page, migratetype, flags,
>>> -					start_pfn, end_pfn)) {
>>> -			undo_isolate_page_range(isolate_start, pfn, migratetype);
>>> -			unset_migratetype_isolate(
>>> -				pfn_to_page(isolate_end - pageblock_nr_pages),
>>> -				migratetype);
>>> -			return -EBUSY;
>>> -		}
>>> +					start_pfn, end_pfn))
>>> +			goto unset_isolated_blocks;
>>>   	}
>>>   	return 0;
>>> +
>>> +unset_isolated_blocks:
>>> +	ret =3D -EBUSY;
>>> +	undo_isolate_page_range(isolate_start + pageblock_nr_pages, pfn,
>>> +				migratetype);
>>> +unset_end_block:
>>> +	unset_migratetype_isolate(pfn_to_page(isolate_end - pageblock_nr_pa=
ges),
>>> +				  migratetype);
>>> +unset_start_block:
>>> +	unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);=

>>> +	return ret;
>>>   }
>>>
>>>   /*
>>> -- =

>>> 2.25.1
>>
>>
>> --
>> Best Regards,
>> Yan, Zi


--
Best Regards,
Yan, Zi

--=_MailMate_616185E2-29EC-4B0E-8755-A12BD9249736_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmMhKdAPHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhU4G0P/0E4O0Cg41Szq2Fc+4Izzn2CFvZWxau6lI7X
ff2eB/+eopoZzo/hq4V/Nzh36jUxeCeWIyhfQPPOqkvt1tAeGUC4LGwtikyj1Ifw
+h4o5hglAVsBBSobMbZYDNme9ewg9syLZ+X+dvRQnFS2Shi8t0l+yE3MMYKfWRnN
nQ11gPeeFCz75p8U6bi7EN3ALoYHs/duxL6q9+9+Xzo/cmaufGWBQgjDTT839EXA
OD8zpEDFluyi8WtR3TS8Fk1O0fLpMLhAuVdwneI1Tb7HyGzWjLjqqhSGz+uWiOHA
Q6Vk/p880S+1nmhm2UiLZV12+JzzBeHtXRrvWQjnUlwV/fjIH2i+jot6pConPh4j
bTKcEWMT6lsagQkZev0gCAMHxs2UF8Atx5HMrqVIwbAi3tOcgilogmAbeVzVk7bB
fW0Cxmosv1oBlfcuHLVzDtMcLs4Jp6IoEmgkVxDOWGNJMFo94vfd+DG3/XJDAcm3
TfJLCwqOeeQ3yUowSxdlyZqsOv0mWq07PgdhJq7hOeObA86RQb9xX2VLfn0bAoAE
9KABUvkrZYjCCbpLtc9OPWesZyzQbw8HGwR5Qol46r7RKZarFhZyjZL3XG9Udvjv
U4OggIcIKdrGGEdLXn6IEzg3nhUIuAxeBQDbc/jn6MMfUQzYIKewdMfcd0GVDsRi
sUSyKCKM
=Ek6s
-----END PGP SIGNATURE-----

--=_MailMate_616185E2-29EC-4B0E-8755-A12BD9249736_=--
