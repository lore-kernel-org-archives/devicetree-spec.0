From: Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH 03/21] mm/hugetlb: correct demote page offset logic
Date: Wed, 14 Sep 2022 00:34:16 +0100
Message-ID: <YyETeBdbldnoRZ+x@casper.infradead.org>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-4-opendmb@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=/9i0RT8xYnvhhYLydSNCy5w2V2bVU0zcdBS2b/Mx3KU=; b=t4p3qotLpiXBOK695FV6Av3c7P
        V9ch6wXoz1ze/fCRWkrmnKtiyv6PaIrGIqra//NJzO/QtAuQ55T8o35R8QevMFZ/1RRuhOIdBe0Pb
        avPTqmgXSgQ1OqwAURW4GVR+y4TIRhuAIq14QtDmIXoVDxzd3jv5vBBLC5789Wo00msxADOfYqo6d
        IP7LviZekrBf8W8u1g4RbQ1Bpc1F0suAv1V7jHk0oBFLZ2XyQNjY80HoVM4apaNTL112jO+GQTaU6
        lzWwjEfT/q37SX/2QQDb5Eon30dK0Xg8IzwevJjJleospvIdLzX/LFXnkA3JNVm5WeLcfH8+OuinY
        ThNQ8k1A==;
Content-Disposition: inline
In-Reply-To: <20220913195508.3511038-4-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar

On Tue, Sep 13, 2022 at 12:54:50PM -0700, Doug Berger wrote:
> With gigantic pages it may not be true that struct page structures
> are contiguous across the entire gigantic page. The mem_map_offset
> function is used here in place of direct pointer arithmetic to
> correct for this.

We're just eliminating mem_map_offset().  Please use nth_page()
instead.

>  	for (i = 0; i < pages_per_huge_page(h);
>  				i += pages_per_huge_page(target_hstate)) {
> +		subpage = mem_map_offset(page, i);
>  		if (hstate_is_gigantic(target_hstate))
