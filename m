From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/21] mm: introduce Designated Movable Blocks
Date: Tue, 13 Sep 2022 12:54:47 -0700
Message-ID: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=/QqAVzo4fvEyn6D6UHpopTegAEfKSX+ABogkBcqAx/E=;
        b=nVJi7KBRKxtWgvxaesz2o24wWrg2ZKodAwUFy6lYQfmaIC8UuDCUN5nEpl0riwMAuz
         EppuZ9CncgB2eWcb9NU1S/03hFJme/FpnGEI4HG5F6GSgnH547+zVsiGy5YAaSUAn1LU
         1q+cuMIzxZeGDCcfaOowOs8Rn+rEdHSzKYBBbGPDpwxEHvNLayNaOHu7ruFOZAZrbYpT
         LC7ttQLf1WgmEobP7lQ8CEWDWQ/ucp72KpaGBSIZ6fdFj/LwcJxiKY1GVmfq01XRlYoD
         DHPliW4LirhpKBqjdI6qs3/he8KJ0eYf8Sg/VbiwVn8jFQ9DxWdkveCjfSzDVo07BfVt
         qwxA==
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

MOTIVATION:
Some Broadcom devices (e.g. 7445, 7278) contain multiple memory
controllers with each mapped in a different address range within
a Uniform Memory Architecture. Some users of these systems have
expressed the desire to locate ZONE_MOVABLE memory on each
memory controller to allow user space intensive processing to
make better use of the additional memory bandwidth.
Unfortunately, the historical monotonic layout of zones would
mean that if the lowest addressed memory controller contains
ZONE_MOVABLE memory then all of the memory available from
memory controllers at higher addresses must also be in the
ZONE_MOVABLE zone. This would force all kernel memory accesses
onto the lowest addressed memory controller and significantly
reduce the amount of memory available for non-movable
allocations.

The main objective of this patch set is therefore to allow a
block of memory to be designated as part of the ZONE_MOVABLE
zone where it will always only be used by the kernel page
allocator to satisfy requests for movable pages. The term
Designated Movable Block is introduced here to represent such a
block. The favored implementation allows modification of the
'movablecore' kernel parameter to allow specification of a base
address and support for multiple blocks. The existing
'movablecore' mechanisms are retained. Other mechanisms based on
device tree are also included in this set.

BACKGROUND:
NUMA architectures support distributing movablecore memory
across each node, but it is undesirable to introduce the
overhead and complexities of NUMA on systems that don't have a
Non-Uniform Memory Architecture.

Commit 342332e6a925 ("mm/page_alloc.c: introduce kernelcore=mirror option")
also depends on zone overlap to support sytems with multiple
mirrored ranges.

Commit c6f03e2903c9 ("mm, memory_hotplug: remove zone restrictions")
embraced overlapped zones for memory hotplug.

This commit set follows their lead to allow the ZONE_MOVABLE
zone to overlap other zones while spanning the pages from the
lowest Designated Movable Block to the end of the node.
Designated Movable Blocks are made absent from overlapping zones
and present within the ZONE_MOVABLE zone.

I initially investigated an implementation using a Designated
Movable migrate type in line with comments[1] made by Mel Gorman
regarding a "sticky" MIGRATE_MOVABLE type to avoid using
ZONE_MOVABLE. However, this approach was riskier since it was
much more instrusive on the allocation paths. Ultimately, the
progress made by the memory hotplug folks to expand the
ZONE_MOVABLE functionality convinced me to follow this approach.

OPPORTUNITIES:
There have been many attempts to modify the behavior of the
kernel page allocators use of CMA regions. This implementation
of Designated Movable Blocks creates an opportunity to repurpose
the CMA allocator to operate on ZONE_MOVABLE memory that the
kernel page allocator can use more agressively, without
affecting the existing CMA implementation. It is hoped that the
"shared-dmb-pool" approach included here will be useful in cases
where memory sharing is more important than allocation latency.

CMA introduced a paradigm where multiple allocators could
operate on the same region of memory, and that paradigm can be
extended to Designated Movable Blocks as well. I was interested
in using kernel resource management as a mechanism for exposing
Designated Movable Block resources (e.g. /proc/iomem) that would
be used by the kernel page allocator like any other ZONE_MOVABLE
memory, but could be claimed by an alternative allocator (e.g.
CMA). Unfortunately, this becomes complicated because the kernel
resource implementation varies materially across different
architectures and I do not require this capability so I have
deferred that.

The MEMBLOCK_MOVABLE and MEMBLOCK_HOTPLUG have a lot in common
and could potentially be consolidated, but I chose to avoid that
here to reduce controversy.

The CMA and DMB alignment constraints are currently the same so
the logic could be simplified, but this implementation keeps
them distinct to facilitate independent evolution of the
implementations if necessary.

COMMITS: 
Commits 1-3 represent bug fixes that could have been submitted
separately and should be submitted to linux-stable. They are
included here because of later commit dependencies to facilitate
review of the entire patch set.

Commits 4-6 are enhancements of hugepage migration to support
contiguous allocations (i.e. alloc_contig_range). These are
potentially of value if a non-gigantic hugepage can be
allocated through fallback from MIGRATE_CMA pageblocks or for
the allocation of gigantic pages. Their real value is to support
CMA from Designated Movable Blocks.

Commits 7-15 make up the preferred embodiment of the concept of
Designated Movable Block support.

The remaining commits (i.e. 16-21) are examples of additional
opportunites to use DMBs with other kernel services to achieve
more aggressive sharing of DMB reservations with the kernel
page allocator. It is hoped that they are of value to others,
but they can be reviewed and evaluated separately from the other
commits in this set if there is controversy and/or opportunites
for improvement.

[1] https://lore.kernel.org/lkml/20160428103927.GM2858-3eNAlZScCAx27rWaFMvyedHuzzzSOjJt@public.gmane.org/

Doug Berger (21):
  mm/page_isolation: protect cma from isolate_single_pageblock
  mm/hugetlb: correct max_huge_pages accounting on demote
  mm/hugetlb: correct demote page offset logic
  mm/hugetlb: refactor alloc_and_dissolve_huge_page
  mm/hugetlb: allow migrated hugepage to dissolve when freed
  mm/hugetlb: add hugepage isolation support
  lib/show_mem.c: display MovableOnly
  mm/vmstat: show start_pfn when zone spans pages
  mm/page_alloc: calculate node_spanned_pages from pfns
  mm/page_alloc.c: allow oversized movablecore
  mm/page_alloc: introduce init_reserved_pageblock()
  memblock: introduce MEMBLOCK_MOVABLE flag
  mm/dmb: Introduce Designated Movable Blocks
  mm/page_alloc: make alloc_contig_pages DMB aware
  mm/page_alloc: allow base for movablecore
  dt-bindings: reserved-memory: introduce designated-movable-block
  mm/dmb: introduce rmem designated-movable-block
  mm/cma: support CMA in Designated Movable Blocks
  dt-bindings: reserved-memory: shared-dma-pool: support DMB
  mm/cma: introduce rmem shared-dmb-pool
  mm/hugetlb: introduce hugetlb_dmb

 .../admin-guide/kernel-parameters.txt         |  17 +-
 .../designated-movable-block.yaml             |  51 ++++
 .../reserved-memory/shared-dma-pool.yaml      |   8 +
 drivers/of/of_reserved_mem.c                  |  20 +-
 include/linux/cma.h                           |  13 +-
 include/linux/dmb.h                           |  28 +++
 include/linux/gfp.h                           |   5 +-
 include/linux/hugetlb.h                       |   5 +
 include/linux/memblock.h                      |   8 +
 kernel/dma/contiguous.c                       |  33 ++-
 lib/show_mem.c                                |   2 +-
 mm/Kconfig                                    |  12 +
 mm/Makefile                                   |   1 +
 mm/cma.c                                      |  58 +++--
 mm/dmb.c                                      | 156 ++++++++++++
 mm/hugetlb.c                                  | 194 +++++++++++----
 mm/memblock.c                                 |  30 ++-
 mm/migrate.c                                  |   1 +
 mm/page_alloc.c                               | 225 +++++++++++++-----
 mm/page_isolation.c                           |  75 +++---
 mm/vmstat.c                                   |   5 +
 21 files changed, 765 insertions(+), 182 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/designated-movable-block.yaml
 create mode 100644 include/linux/dmb.h
 create mode 100644 mm/dmb.c

-- 
2.25.1

