From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 00/21] mm: introduce Designated Movable Blocks
Date: Mon, 19 Sep 2022 11:00:15 +0200
Message-ID: <b610a7b3-d740-8d45-c270-4c638deb1cfa@redhat.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663578020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f8vJrGjQeilqRFYE1RxARCjX6qJaMbpyS//5x6x7ndo=;
        b=TdRKrWq/3Wmbpp2OKRdx3bninBJoR4WpCpdN+UhVYW/GQ25oiHF4RShJ/3A9bTy82hTa4Z
        ef45PMFxT3fAkrvDJVUATXAC2Tpm2cL8/4HJGVfAQEgrUBAHwd6AkJPR8IhNRsmi2oqCgp
        wmM5Qwo3r1gY14KggjuAOPXeP2BrncQ=
Content-Language: en-US
In-Reply-To: <20220913195508.3511038-1-opendmb@gmail.com>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Doug Berger <opendmb@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <songmuchun@bytedance.com>, Mike Rapoport <rppt@kernel.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Florian Fainelli <f.fainelli@gmail.com>, Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>, Hari Bathini <hbathini@linux.ibm.com>, Kees Cook <keescook@chro>

Hi Dough,

I have some high-level questions.

> MOTIVATION:
> Some Broadcom devices (e.g. 7445, 7278) contain multiple memory
> controllers with each mapped in a different address range within
> a Uniform Memory Architecture. Some users of these systems have

How large are these areas typically?

How large are they in comparison to other memory in the system?

How is this memory currently presented to the system?

> expressed the desire to locate ZONE_MOVABLE memory on each
> memory controller to allow user space intensive processing to
> make better use of the additional memory bandwidth.

Can you share some more how exactly ZONE_MOVABLE would help here to make 
better use of the memory bandwidth?

> Unfortunately, the historical monotonic layout of zones would
> mean that if the lowest addressed memory controller contains
> ZONE_MOVABLE memory then all of the memory available from
> memory controllers at higher addresses must also be in the
> ZONE_MOVABLE zone. This would force all kernel memory accesses
> onto the lowest addressed memory controller and significantly
> reduce the amount of memory available for non-movable
> allocations.

We do have code that relies on zones during boot to not overlap within a 
single node.

> 
> The main objective of this patch set is therefore to allow a
> block of memory to be designated as part of the ZONE_MOVABLE
> zone where it will always only be used by the kernel page
> allocator to satisfy requests for movable pages. The term
> Designated Movable Block is introduced here to represent such a
> block. The favored implementation allows modification of the

Sorry to say, but that term is rather suboptimal to describe what you 
are doing here. You simply have some system RAM you'd want to have 
managed by ZONE_MOVABLE, no?

> 'movablecore' kernel parameter to allow specification of a base
> address and support for multiple blocks. The existing
> 'movablecore' mechanisms are retained. Other mechanisms based on
> device tree are also included in this set.
> 
> BACKGROUND:
> NUMA architectures support distributing movablecore memory
> across each node, but it is undesirable to introduce the
> overhead and complexities of NUMA on systems that don't have a
> Non-Uniform Memory Architecture.

How exactly would that look like? I think I am missing something :)

> 
> Commit 342332e6a925 ("mm/page_alloc.c: introduce kernelcore=mirror option")
> also depends on zone overlap to support sytems with multiple
> mirrored ranges.

IIRC, zones will not overlap within a single node.

> 
> Commit c6f03e2903c9 ("mm, memory_hotplug: remove zone restrictions")
> embraced overlapped zones for memory hotplug.

Yes, after boot.

> 
> This commit set follows their lead to allow the ZONE_MOVABLE
> zone to overlap other zones while spanning the pages from the
> lowest Designated Movable Block to the end of the node.
> Designated Movable Blocks are made absent from overlapping zones
> and present within the ZONE_MOVABLE zone.
> 
> I initially investigated an implementation using a Designated
> Movable migrate type in line with comments[1] made by Mel Gorman
> regarding a "sticky" MIGRATE_MOVABLE type to avoid using
> ZONE_MOVABLE. However, this approach was riskier since it was
> much more instrusive on the allocation paths. Ultimately, the
> progress made by the memory hotplug folks to expand the
> ZONE_MOVABLE functionality convinced me to follow this approach.
> 
> OPPORTUNITIES:
> There have been many attempts to modify the behavior of the
> kernel page allocators use of CMA regions. This implementation
> of Designated Movable Blocks creates an opportunity to repurpose
> the CMA allocator to operate on ZONE_MOVABLE memory that the
> kernel page allocator can use more agressively, without
> affecting the existing CMA implementation. It is hoped that the
> "shared-dmb-pool" approach included here will be useful in cases
> where memory sharing is more important than allocation latency.
> 
> CMA introduced a paradigm where multiple allocators could
> operate on the same region of memory, and that paradigm can be
> extended to Designated Movable Blocks as well. I was interested
> in using kernel resource management as a mechanism for exposing
> Designated Movable Block resources (e.g. /proc/iomem) that would
> be used by the kernel page allocator like any other ZONE_MOVABLE
> memory, but could be claimed by an alternative allocator (e.g.
> CMA). Unfortunately, this becomes complicated because the kernel
> resource implementation varies materially across different
> architectures and I do not require this capability so I have
> deferred that.

Why can't we simply designate these regions as CMA regions?

Why do we have to start using ZONE_MOVABLE for them?

-- 
Thanks,

David / dhildenb

