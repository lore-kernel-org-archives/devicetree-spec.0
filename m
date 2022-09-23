From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/21] mm: introduce Designated Movable Blocks
Date: Fri, 23 Sep 2022 15:10:40 -0700
Message-ID: <59ddaa5a-e47d-f542-f7a7-2c437e1c2808@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <b610a7b3-d740-8d45-c270-4c638deb1cfa@redhat.com>
 <02561695-df44-4df6-c486-1431bf152650@gmail.com>
 <Yy2WUypD5qVmqB0k@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Konhfb7mLO3dA0pHkfbX9G7WZYTlrwd05Msn8eCZhsI=;
        b=DDvg7k75uWgmVeFyrGBonH6mSsCY3m3x9tny22LtoPZP6dUqAXHS1mMKsG219opQwl
         XaO0ZmS5LtDqG1UY+eUw9UMYKepHVeDgWd4c1Q5ECrzU/EFRkPnMDgv2R02eCuB4JtER
         Rrw8uXflmfpBIj0E/q+G3U9mS6iJGd1QlKuTXp4iVT6mqmwufzp2vNnuhlCmSF03XK6j
         GxKqp3YR6HgYXmXe2aIjKtF8cWWLXPoXcOYuFbQ/UwaVfJlVwMlT2VcpRxfuX6Ze/rFy
         PTfyhyhReK5zeBUAdmSJxq8dg8gDKOKrgJAOoCKFiiM/gHjWpAuACW5EzYvfqwAN3wJ3
         MY7A==
Content-Language: en-US
In-Reply-To: <Yy2WUypD5qVmqB0k-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>, Hari

On 9/23/2022 4:19 AM, Mike Rapoport wrote:
> Hi Doug,
> 
> I only had time to skim through the patches and before diving in I'd like
> to clarify a few things.
Thanks for taking the time. Any input is appreciated.

> 
> On Mon, Sep 19, 2022 at 06:03:55PM -0700, Doug Berger wrote:
>> On 9/19/2022 2:00 AM, David Hildenbrand wrote:
>>>
>>> How is this memory currently presented to the system?
>>
>> The 7278 device has four ARMv8 CPU cores in an SMP cluster and two memory
>> controllers (MEMCs). Each MEMC is capable of controlling up to 8GB of DRAM.
>> An example 7278 system might have 1GB on each controller, so an arm64 kernel
>> might see 1GB on MEMC0 at 0x40000000-0x7FFFFFFF and 1GB on MEMC1 at
>> 0x300000000-0x33FFFFFFF.
>>
>> The base capability described in commits 7-15 of this V1 patch set is to
>> allow a 'movablecore' block to be created at a particular base address
>> rather than solely at the end of addressable memory.
> 
> I think this capability is only useful when there is non-uniform access to
> different memory ranges. Otherwise it wouldn't matter where the movable
> pages reside.
I think that is a fair assessment of the described capability. However, 
the non-uniform access is a result of the current Linux architecture 
rather than the hardware architecture.

> The system you describe looks quite NUMA to me, with two
> memory controllers, each for accessing a partial range of the available
> memory.
NUMA was created to deal with non-uniformity in the hardware 
architecture where a CPU and/or other hardware device can make more 
efficient use of some nodes than other nodes. NUMA attempts to allocate 
from "closer" nodes to improve the operational efficiency of the system.

If we consider how an arm64 architecture Linux kernel will apply zones 
to the above example system we find that Linux will place MEMC0 in 
ZONE_DMA and MEMC1 in ZONE_NORMAL. This allows both kernel and user 
space to compete for bandwidth on MEMC1, but largely excludes user space 
from MEMC0. It is possible for user space to get memory from ZONE_DMA 
through fallback when ZONE_NORMAL has been consumed, but there is a 
pretty clear bias against user space use of MEMC0. This non-uniformity 
doesn't come from the bus architecture since each CPU has equal costs to 
access MEMC0 and MEMC1. They compete for bandwidth, but there is no 
hardware bias for one node over another. Creating ZONE_MOVABLE memory on 
MEMC0 can help correct for the Linux bias.

>   
>>>> expressed the desire to locate ZONE_MOVABLE memory on each
>>>> memory controller to allow user space intensive processing to
>>>> make better use of the additional memory bandwidth.
>>>
>>> Can you share some more how exactly ZONE_MOVABLE would help here to make
>>> better use of the memory bandwidth?
>>
>> ZONE_MOVABLE memory is effectively unusable by the kernel. It can be used by
>> user space applications through both the page allocator and the Hugetlbfs.
>> If a large 'movablecore' allocation is defined and it can only be located at
>> the end of addressable memory then it will always be located on MEMC1 of a
>> 7278 system. This will create a tendency for user space accesses to consume
>> more bandwidth on the MEMC1 memory controller and kernel space accesses to
>> consume more bandwidth on MEMC0. A more even distribution of ZONE_MOVABLE
>> memory between the available memory controllers in theory makes more memory
>> bandwidth available to user space intensive loads.
> 
> The theory makes perfect sense, but is there any practical evidence of
> improvement?
> Some benchmark results that illustrate the difference would be nice.
I agree that benchmark results would be nice. Unfortunately, I am not 
part of the constituency that uses these Linux features so I have no 
representative user space work loads to measure. I can only say that I 
was asked to implement this capability, this is the approach I took, and 
customers of Broadcom are making use of it. I am submitting it upstream 
with the hope that: its/my sanity can be better reviewed, it will not 
get broken by future changes in the kernel, and it will be useful to others.

This "narrow" capability may have limited value to others, but it should 
not create issues for those that do not actively wish to use it. I would 
hope that makes it easier to review and get accepted.

However, I believe "other opportunities" exist that may have broader 
appeal so I have suggested some along with the "narrow" capability to 
hopefully give others motivation to consider accepting the narrow 
capability and to help shape how these "other capabilities" should be 
implemented.

One "other opportunity" that I have realized may be more interesting 
than I originally anticipated comes from the recognition that the 
Devicetree Specification includes support for Reserved Memory regions 
that can contain the 'reusable' property to allow the OS to make use of 
the memory. Currently, Linux only takes advantage of that capability for 
reserved memory nodes that are compatible with 'shared-dma-pool' where 
CMA is used to allow the memory to be used by the OS and by device 
drivers. CMA is a great concept, but we have observed shortcomings that 
become more apparent as the size of the CMA region grows. Specifically, 
the Linux memory management works very hard to keep half of the CMA 
memory free. A number of submissions have been made over the years to 
alter the CMA implementation to allow more aggressive use of the memory 
by the OS, but there are users that desire the current behavior so the 
submissions have been rejected.

No other types of reserved memory nodes can take advantage of sharing 
the memory with the Linux operating system because there is insufficient 
specification of how device drivers can reclaim the reserved memory when 
it is needed. The introduction of Designated Movable Block support 
provides a mechanism that would allow this capability to be realized. 
Because DMBs are in ZONE_MOVABLE their pages are reclaimable, and 
because they can be located anywhere they can satisfy DMA constraints of 
owning devices. In the simplest case, device drivers can use the 
dmb_intersects() function to determine whether their reserved memory 
range is within a DMB and can use the alloc_contig_range() function to 
reclaim the pages. This simple API could certainly be improved upon 
(e.g. the CMA allocator seems like an obvious choice), but it doesn't 
need to be defined by me so I would be happy to hear other people's ideas.

> 
>>>> BACKGROUND:
>>>> NUMA architectures support distributing movablecore memory
>>>> across each node, but it is undesirable to introduce the
>>>> overhead and complexities of NUMA on systems that don't have a
>>>> Non-Uniform Memory Architecture.
>>>
>>> How exactly would that look like? I think I am missing something :)
>>
>> The notion would be to consider each memory controller as a separate node,
>> but as stated it is not desirable.
> 
> Why?
In my opinion this is an inappropriate application of NUMA because the 
hardware does not impose any access non-uniformity to justify the 
complexity and overhead associated with NUMA. It would only be 
shoe-horned into the implementation to add some logical notion of memory 
nodes being associated with memory controllers. I would expect such an 
approach to receive a lot of push back from the Android Common Kernel 
users which may not be relevant to everyone, but is to many.

Thanks for your consideration,
-Doug

