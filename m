From: kernel test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 18/21] mm/cma: support CMA in Designated Movable Blocks
Date: Thu, 15 Sep 2022 06:03:39 +0800
Message-ID: <202209150503.AZYsY64p-lkp@intel.com>
References: <20220913195508.3511038-19-opendmb@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663193055; x=1694729055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p3oc3q2U/df+Y6Jf+6GoDWbjGub5SY7+B7D0sWSkZfM=;
  b=PT/0I9fkSfPzCUOBtlvbzOyAZBjla1I4SgSjenYiHeqC6mVKU8P3vO2g
   BKyVYq0I4F9lx3g+mPSu9lmOM+Lm+Zo9HyuYKDt1XsFQjGYHrsbvDf02+
   dNyIUSd6a1AIG2KV0Si0InxpF+H8tJf6Lxrc6q2/pJro1mQMgQ3CEA7ZL
   4nQjwpZbsssQlv/SxUEmuKm/PSNelaab2k6dJcQvRSjk7nzFCt0QMMMSG
   xSoT8P3tMQO7qMZRw6Jc7mjfVco0TNaDgXdxj1pM8Lh7ONY70nd7NfNg5
   9mJVJfxMMzB+Nn1LMaq5hB6CO+iukpUlxbw3QoUj9qjeAonwPWB0j/2xF
   Q==;
Content-Disposition: inline
In-Reply-To: <20220913195508.3511038-19-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: kbuild-all-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, Linux Memory Management List <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David

Hi Doug,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.0-rc5]
[cannot apply to akpm-mm/mm-everything next-20220914]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Doug-Berger/mm-introduce-Designated-Movable-Blocks/20220914-040216
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20220915/202209150503.AZYsY64p-lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/635e919c92ca242c4b900bdfc7e21529e76f2f8e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Doug-Berger/mm-introduce-Designated-Movable-Blocks/20220914-040216
        git checkout 635e919c92ca242c4b900bdfc7e21529e76f2f8e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

All errors (new ones prefixed by >>):

   mm/page_alloc.c:9236:5: warning: no previous prototype for '_alloc_contig_range' [-Wmissing-prototypes]
    9236 | int _alloc_contig_range(unsigned long start, unsigned long end,
         |     ^~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'alloc_contig_range':
>> mm/page_alloc.c:9390:36: error: 'MIGRATE_CMA' undeclared (first use in this function); did you mean 'MIGRATE_SYNC'?
    9390 |                 if (migratetype == MIGRATE_CMA)
         |                                    ^~~~~~~~~~~
         |                                    MIGRATE_SYNC
   mm/page_alloc.c:9390:36: note: each undeclared identifier is reported only once for each function it appears in


vim +9390 mm/page_alloc.c

  9361	
  9362	/**
  9363	 * alloc_contig_range() -- tries to allocate given range of pages
  9364	 * @start:	start PFN to allocate
  9365	 * @end:	one-past-the-last PFN to allocate
  9366	 * @migratetype:	migratetype of the underlying pageblocks (either
  9367	 *			#MIGRATE_MOVABLE or #MIGRATE_CMA).  All pageblocks
  9368	 *			in range must have the same migratetype and it must
  9369	 *			be either of the two.
  9370	 * @gfp_mask:	GFP mask to use during compaction
  9371	 *
  9372	 * The PFN range does not have to be pageblock aligned. The PFN range must
  9373	 * belong to a single zone.
  9374	 *
  9375	 * The first thing this routine does is attempt to MIGRATE_ISOLATE all
  9376	 * pageblocks in the range.  Once isolated, the pageblocks should not
  9377	 * be modified by others.
  9378	 *
  9379	 * Return: zero on success or negative error code.  On success all
  9380	 * pages which PFN is in [start, end) are allocated for the caller and
  9381	 * need to be freed with free_contig_range().
  9382	 */
  9383	int alloc_contig_range(unsigned long start, unsigned long end,
  9384			       unsigned int migratetype, gfp_t gfp_mask)
  9385	{
  9386		switch (dmb_intersects(start, end)) {
  9387		case DMB_DISJOINT:
  9388			break;
  9389		case DMB_INTERSECTS:
> 9390			if (migratetype == MIGRATE_CMA)
  9391				migratetype = MIGRATE_MOVABLE;
  9392			else
  9393				return -EBUSY;
  9394			break;
  9395		default:
  9396			return -EBUSY;
  9397		}
  9398	
  9399		return _alloc_contig_range(start, end, migratetype, gfp_mask);
  9400	}
  9401	EXPORT_SYMBOL(alloc_contig_range);
  9402	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
