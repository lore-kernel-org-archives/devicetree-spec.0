From: Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/21] mm: introduce Designated Movable Blocks
Date: Fri, 23 Sep 2022 14:19:47 +0300
Message-ID: <Yy2WUypD5qVmqB0k@kernel.org>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <b610a7b3-d740-8d45-c270-4c638deb1cfa@redhat.com>
 <02561695-df44-4df6-c486-1431bf152650@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663932008;
        bh=lzkcfA8lwY431cGoFaoDpZ054pCCOOU4vMeBaieOALo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CFFgso3bs6An9nGUhg/DG6R6EN9niEPLr2bcvNvSIZeH5Ca/4zD5HH3MAQwNJ5mc9
         +Hc567HPd6/20p6YaNX/Zvv6xT/ckjT9jLPQvD/WGz8mFXi9wWGc+5xCpFYC4T4XZw
         J2QCchDnSDhacfqP44aIabXsMgDbC1DrzUvn9pDZ1hvVgL7+QgzJhX1ywAwW83QAff
         5tr++tEQUnIFI/6oMtIWKFC+RtQAUJUrpM3ED/pvVcV6Y/GAKzQaMKcRFEC7DztYOH
         Au8CuF0rW5ZOStR6byQQubKH+EDX0QcQvObkvdsoCIqJ2ivv7nIVDarHsRqR3Li0Ww
         tr6LGpBwCOQ2w==
Content-Disposition: inline
In-Reply-To: <02561695-df44-4df6-c486-1431bf152650-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>, Hari

Hi Doug,

I only had time to skim through the patches and before diving in I'd like
to clarify a few things.

On Mon, Sep 19, 2022 at 06:03:55PM -0700, Doug Berger wrote:
> On 9/19/2022 2:00 AM, David Hildenbrand wrote:
> > 
> > How is this memory currently presented to the system?
>
> The 7278 device has four ARMv8 CPU cores in an SMP cluster and two memory
> controllers (MEMCs). Each MEMC is capable of controlling up to 8GB of DRAM.
> An example 7278 system might have 1GB on each controller, so an arm64 kernel
> might see 1GB on MEMC0 at 0x40000000-0x7FFFFFFF and 1GB on MEMC1 at
> 0x300000000-0x33FFFFFFF.
> 
> The base capability described in commits 7-15 of this V1 patch set is to
> allow a 'movablecore' block to be created at a particular base address
> rather than solely at the end of addressable memory.

I think this capability is only useful when there is non-uniform access to
different memory ranges. Otherwise it wouldn't matter where the movable
pages reside. The system you describe looks quite NUMA to me, with two
memory controllers, each for accessing a partial range of the available
memory.
 
> > > expressed the desire to locate ZONE_MOVABLE memory on each
> > > memory controller to allow user space intensive processing to
> > > make better use of the additional memory bandwidth.
> > 
> > Can you share some more how exactly ZONE_MOVABLE would help here to make
> > better use of the memory bandwidth?
>
> ZONE_MOVABLE memory is effectively unusable by the kernel. It can be used by
> user space applications through both the page allocator and the Hugetlbfs.
> If a large 'movablecore' allocation is defined and it can only be located at
> the end of addressable memory then it will always be located on MEMC1 of a
> 7278 system. This will create a tendency for user space accesses to consume
> more bandwidth on the MEMC1 memory controller and kernel space accesses to
> consume more bandwidth on MEMC0. A more even distribution of ZONE_MOVABLE
> memory between the available memory controllers in theory makes more memory
> bandwidth available to user space intensive loads.

The theory makes perfect sense, but is there any practical evidence of
improvement?
Some benchmark results that illustrate the difference would be nice.

> > > BACKGROUND:
> > > NUMA architectures support distributing movablecore memory
> > > across each node, but it is undesirable to introduce the
> > > overhead and complexities of NUMA on systems that don't have a
> > > Non-Uniform Memory Architecture.
> > 
> > How exactly would that look like? I think I am missing something :)
>
> The notion would be to consider each memory controller as a separate node,
> but as stated it is not desirable.

Why?

> Thanks for your consideration,
> Dough Baker ... I mean Doug Berger :).

-- 
Sincerely yours,
Mike.
