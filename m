From: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH 01/21] mm/page_isolation: protect cma from
 isolate_single_pageblock
Date: Tue, 13 Sep 2022 20:02:19 -0400
Message-ID: <36E322BF-F052-4A8B-9FA5-4E0AA84E4AAF@nvidia.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-2-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary="=_MailMate_E6BE9F10-9846-4B48-8CC5-6B56D4224A48_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUD+xyL/Qe0RkWj61woTrh0/f0vU5V2V/+jo+fGraUc=;
 b=lIXCggBNEVudU0AiypxkVj/nGhrFwIb6Hw/MIQ4nzen6+m+dq+jC7lYGBlhuARto/zq1QSDIk35HtPJDIuQo3EV9cWHYintm0hV9t6pDFsEdQDkHRoxQsxa1ZHU8Zd0UXx2C5zFVmD1+sWMDUbFiECGg/pwYvuobbJicHbcS0utUO+F3LSRviwzzBcV4KIHj29b/Cu1TnhFogpDml6hlfkB2TWBTk7XTtXXmE33P2DVDTici1Mxmma5M8fUkuK8PWIMMgqS3sKr44vYwjSerM3vslmXXoK9MdXcoz7q2Uz4AijVpnZbIVJkdpOrollLibthjtlE55nuvIh6wMBfdFw==
In-Reply-To: <20220913195508.3511038-2-opendmb@gmail.com>
List-ID: <devicetree-spec.vger.kernel.org>
To: Doug Berger <opendmb@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <songmuchun@bytedance.com>, Mike Rapoport <rppt@kernel.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Florian Fainelli <f.fainelli@gmail.com>, David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>

--=_MailMate_E6BE9F10-9846-4B48-8CC5-6B56D4224A48_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 13 Sep 2022, at 15:54, Doug Berger wrote:

> The function set_migratetype_isolate() has special handling for
> pageblocks of MIGRATE_CMA type that protects them from being
> isolated for MIGRATE_MOVABLE requests.
>
> Since isolate_single_pageblock() doesn't receive the migratetype
> argument of start_isolate_page_range() it used the migratetype
> of the pageblock instead of the requested migratetype which
> defeats this MIGRATE_CMA check.
>
> This allows an attempt to create a gigantic page within a CMA
> region to change the migratetype of the first and last pageblocks
> from MIGRATE_CMA to MIGRATE_MOVABLE when they are restored after
> failure, which corrupts the CMA region.
>
> The calls to (un)set_migratetype_isolate() for the first and last
> pageblocks of the start_isolate_page_range() are moved back into
> that function to allow access to its migratetype argument and make
> it easier to see how all of the pageblocks in the range are
> isolated.
>
> Fixes: b2c9e2fbba32 ("mm: make alloc_contig_range work at pageblock gra=
nularity")
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> ---
>  mm/page_isolation.c | 75 +++++++++++++++++++++------------------------=

>  1 file changed, 35 insertions(+), 40 deletions(-)

Thanks for the fix.

Why not just pass migratetype into isolate_single_pageblock() and use
it when set_migratetype_isolate() is used? That would have much
fewer changes. What is the reason of pulling skip isolation logic out?

Ultimately, I would like to make MIGRATE_ISOLATE a separate bit,
so that migratetype will not be overwritten during page isolation.
Then, set_migratetype_isolate() and start_isolate_page_range()
will not have migratetype to set in error recovery any more.
That is on my TODO.

>
> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> index 9d73dc38e3d7..8e16aa22cb61 100644
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -286,8 +286,6 @@ __first_valid_page(unsigned long pfn, unsigned long=
 nr_pages)
>   * @flags:			isolation flags
>   * @gfp_flags:			GFP flags used for migrating pages
>   * @isolate_before:	isolate the pageblock before the boundary_pfn
> - * @skip_isolation:	the flag to skip the pageblock isolation in second=

> - *			isolate_single_pageblock()
>   *
>   * Free and in-use pages can be as big as MAX_ORDER-1 and contain more=
 than one
>   * pageblock. When not all pageblocks within a page are isolated at th=
e same
> @@ -302,9 +300,8 @@ __first_valid_page(unsigned long pfn, unsigned long=
 nr_pages)
>   * the in-use page then splitting the free page.
>   */
>  static int isolate_single_pageblock(unsigned long boundary_pfn, int fl=
ags,
> -			gfp_t gfp_flags, bool isolate_before, bool skip_isolation)
> +			gfp_t gfp_flags, bool isolate_before)
>  {
> -	unsigned char saved_mt;
>  	unsigned long start_pfn;
>  	unsigned long isolate_pageblock;
>  	unsigned long pfn;
> @@ -328,18 +325,6 @@ static int isolate_single_pageblock(unsigned long =
boundary_pfn, int flags,
>  	start_pfn  =3D max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),=

>  				      zone->zone_start_pfn);
>
> -	saved_mt =3D get_pageblock_migratetype(pfn_to_page(isolate_pageblock)=
);
> -
> -	if (skip_isolation)
> -		VM_BUG_ON(!is_migrate_isolate(saved_mt));
> -	else {
> -		ret =3D set_migratetype_isolate(pfn_to_page(isolate_pageblock), save=
d_mt, flags,
> -				isolate_pageblock, isolate_pageblock + pageblock_nr_pages);
> -
> -		if (ret)
> -			return ret;
> -	}
> -
>  	/*
>  	 * Bail out early when the to-be-isolated pageblock does not form
>  	 * a free or in-use page across boundary_pfn:
> @@ -428,7 +413,7 @@ static int isolate_single_pageblock(unsigned long b=
oundary_pfn, int flags,
>  					ret =3D set_migratetype_isolate(page, page_mt,
>  						flags, head_pfn, head_pfn + nr_pages);
>  					if (ret)
> -						goto failed;
> +						return ret;
>  				}
>
>  				ret =3D __alloc_contig_migrate_range(&cc, head_pfn,
> @@ -443,7 +428,7 @@ static int isolate_single_pageblock(unsigned long b=
oundary_pfn, int flags,
>  					unset_migratetype_isolate(page, page_mt);
>
>  				if (ret)
> -					goto failed;
> +					return -EBUSY;
>  				/*
>  				 * reset pfn to the head of the free page, so
>  				 * that the free page handling code above can split
> @@ -459,24 +444,19 @@ static int isolate_single_pageblock(unsigned long=
 boundary_pfn, int flags,
>  				while (!PageBuddy(pfn_to_page(outer_pfn))) {
>  					/* stop if we cannot find the free page */
>  					if (++order >=3D MAX_ORDER)
> -						goto failed;
> +						return -EBUSY;
>  					outer_pfn &=3D ~0UL << order;
>  				}
>  				pfn =3D outer_pfn;
>  				continue;
>  			} else
>  #endif
> -				goto failed;
> +				return -EBUSY;
>  		}
>
>  		pfn++;
>  	}
>  	return 0;
> -failed:
> -	/* restore the original migratetype */
> -	if (!skip_isolation)
> -		unset_migratetype_isolate(pfn_to_page(isolate_pageblock), saved_mt);=

> -	return -EBUSY;
>  }
>
>  /**
> @@ -534,21 +514,30 @@ int start_isolate_page_range(unsigned long start_=
pfn, unsigned long end_pfn,
>  	unsigned long isolate_start =3D ALIGN_DOWN(start_pfn, pageblock_nr_pa=
ges);
>  	unsigned long isolate_end =3D ALIGN(end_pfn, pageblock_nr_pages);
>  	int ret;
> -	bool skip_isolation =3D false;
>
>  	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pagebl=
ock */
> -	ret =3D isolate_single_pageblock(isolate_start, flags, gfp_flags, fal=
se, skip_isolation);
> +	ret =3D set_migratetype_isolate(pfn_to_page(isolate_start), migratety=
pe,
> +			flags, isolate_start, isolate_start + pageblock_nr_pages);
>  	if (ret)
>  		return ret;
> -
> -	if (isolate_start =3D=3D isolate_end - pageblock_nr_pages)
> -		skip_isolation =3D true;
> +	ret =3D isolate_single_pageblock(isolate_start, flags, gfp_flags, fal=
se);
> +	if (ret)
> +		goto unset_start_block;
>
>  	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock =
*/
> -	ret =3D isolate_single_pageblock(isolate_end, flags, gfp_flags, true,=
 skip_isolation);
> +	pfn =3D isolate_end - pageblock_nr_pages;
> +	if (isolate_start !=3D pfn) {
> +		ret =3D set_migratetype_isolate(pfn_to_page(pfn), migratetype,
> +				flags, pfn, pfn + pageblock_nr_pages);
> +		if (ret)
> +			goto unset_start_block;
> +	}
> +	ret =3D isolate_single_pageblock(isolate_end, flags, gfp_flags, true)=
;
>  	if (ret) {
> -		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
> -		return ret;
> +		if (isolate_start !=3D pfn)
> +			goto unset_end_block;
> +		else
> +			goto unset_start_block;
>  	}
>
>  	/* skip isolated pageblocks at the beginning and end */
> @@ -557,15 +546,21 @@ int start_isolate_page_range(unsigned long start_=
pfn, unsigned long end_pfn,
>  	     pfn +=3D pageblock_nr_pages) {
>  		page =3D __first_valid_page(pfn, pageblock_nr_pages);
>  		if (page && set_migratetype_isolate(page, migratetype, flags,
> -					start_pfn, end_pfn)) {
> -			undo_isolate_page_range(isolate_start, pfn, migratetype);
> -			unset_migratetype_isolate(
> -				pfn_to_page(isolate_end - pageblock_nr_pages),
> -				migratetype);
> -			return -EBUSY;
> -		}
> +					start_pfn, end_pfn))
> +			goto unset_isolated_blocks;
>  	}
>  	return 0;
> +
> +unset_isolated_blocks:
> +	ret =3D -EBUSY;
> +	undo_isolate_page_range(isolate_start + pageblock_nr_pages, pfn,
> +				migratetype);
> +unset_end_block:
> +	unset_migratetype_isolate(pfn_to_page(isolate_end - pageblock_nr_page=
s),
> +				  migratetype);
> +unset_start_block:
> +	unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
> +	return ret;
>  }
>
>  /*
> -- =

> 2.25.1


--
Best Regards,
Yan, Zi

--=_MailMate_E6BE9F10-9846-4B48-8CC5-6B56D4224A48_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmMhGgsPHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhUXhwP/jRZWxGpSgHBpXv4SWOrjilrF6k/Xxj5qoRC
Ndxp9JHAYgxD472j53CXaht8NY3oqyKHOFwTeISEGLYirQjlTvJKiW17bjtCSrY3
kCclXgEdI9+ReWadY9Npn4+LOQ1dW+VPxlnQHVtl1NlX0ErMDNfQZcow7tjoJkOS
eiPSFxCjHn/msIivYcT9v4mRxYdraup5xCDK+FLy48FjBkVpeSdNlM/HFLfVXitf
z/KRVDt0PC8cXdeX+T1j7l/iBKmCfFhVGvXIpAYWKD84rzTG0O3feLCCWUvG/eZZ
Jep5mRR6jg2kS1qZOPkbMdHhaxpBEGyiWbXPGOV4m0Dy94qi8+aOtDc6SN/SHb3s
tZSN5p0t8xYC8KqboRCuhBI/uTEdovCpADyxxaZ0etZJaJGB42oNf9+quwI4dg1D
PSSGxMdse1AgfVnpphzSrRDC0OFvPtLHNE1/oaJmo0+weezkdnU7rxzhFPryBqAD
yc9zKhdwIHNa2DcwuJiXGMWl6VAou2V4kaOTlxZOKyKsHLAEOLlXvhTdd1arzLgt
sq3E0vvlupEvb/qErCTfBCYzmg+Jtsh2OUYRpK4z6PUA22mZfmDCFqo+hUJiE6uP
/zETn916ZdC+jnomoGMYS6Ci/GhPT8MOscbpDs+xgNAWDu3QTAakCgFnxu5Cc+I/
BHD6uwQ5
=v0DW
-----END PGP SIGNATURE-----

--=_MailMate_E6BE9F10-9846-4B48-8CC5-6B56D4224A48_=--
