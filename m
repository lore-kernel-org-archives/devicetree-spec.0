From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/3] Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
Date: Fri, 3 Dec 2021 13:07:21 +0000
Message-ID: <46d9c8dd-d2dc-0d2a-aeb4-08dff9dcb733@arm.com>
References: <20211123112104.3530135-1-hsinyi@chromium.org>
 <75ea1026-63e5-165a-9e07-27b5ac4c7579@arm.com>
 <CAAFQd5AA3XCqxOSdQOOCMEdByDKRz5J9vWB0QghO2SSCqOvQBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
In-Reply-To: <CAAFQd5AA3XCqxOSdQOOCMEdByDKRz5J9vWB0QghO2SSCqOvQBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Hsin-Yi Wang <hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>, - <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, senozhatsky-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

On 2021-11-25 07:35, Tomasz Figa wrote:
> Hi Robin,
> 
> On Tue, Nov 23, 2021 at 8:59 PM Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>> On 2021-11-23 11:21, Hsin-Yi Wang wrote:
>>> Default IO_TLB_SEGSIZE (128) slabs may be not enough for some use cases.
>>> This series adds support to customize io_tlb_segsize for each
>>> restricted-dma-pool.
>>>
>>> Example use case:
>>>
>>> mtk-isp drivers[1] are controlled by mtk-scp[2] and allocate memory through
>>> mtk-scp. In order to use the noncontiguous DMA API[3], we need to use
>>> the swiotlb pool. mtk-scp needs to allocate memory with 2560 slabs.
>>> mtk-isp drivers also needs to allocate memory with 200+ slabs. Both are
>>> larger than the default IO_TLB_SEGSIZE (128) slabs.
>>
>> Are drivers really doing streaming DMA mappings that large? If so, that
>> seems like it might be worth trying to address in its own right for the
>> sake of efficiency - allocating ~5MB of memory twice and copying it back
>> and forth doesn't sound like the ideal thing to do.
>>
>> If it's really about coherent DMA buffer allocation, I thought the plan
>> was that devices which expect to use a significant amount and/or size of
>> coherent buffers would continue to use a shared-dma-pool for that? It's
>> still what the binding implies. My understanding was that
>> swiotlb_alloc() is mostly just a fallback for the sake of drivers which
>> mostly do streaming DMA but may allocate a handful of pages worth of
>> coherent buffers here and there. Certainly looking at the mtk_scp
>> driver, that seems like it shouldn't be going anywhere near SWIOTLB at all.
> 
> First, thanks a lot for taking a look at this patch series.
> 
> The drivers would do streaming DMA within a reserved region that is
> the only memory accessible to them for security reasons. This seems to
> exactly match the definition of the restricted pool as merged
> recently.

Huh? Of the drivers indicated, the SCP driver is doing nothing but 
coherent allocations, and I'm not entirely sure what those ISP driver 
patches are supposed to be doing but I suspect it's probably just buffer 
allocation too. I don't see any actual streaming DMA anywhere :/

> The new dma_alloc_noncontiguous() API would allow allocating suitable
> memory directly from the pool, which would eliminate the need to copy.

Can you clarify what's being copied, and where? I'm not all that 
familiar with the media APIs, but I thought it was all based around 
preallocated DMA buffers (the whole dedicated "videobuf" thing)? The few 
instances of actual streaming DMA I can see in drivers/media/ look to be 
mostly PCI drivers mapping private descriptors, whereas the MTK ISP 
appears to be entirely register-based.

> However, for a restricted pool, this would exercise the SWIOTLB
> allocator, which currently suffers from the limitation as described by
> Hsin-Yi. Since the allocator in general is quite general purpose and
> already used for coherent allocations as per the current restricted
> pool implementation, I think it indeed makes sense to lift the
> limitation, rather than trying to come up with yet another thing.

No, just fix the dma_alloc_noncontiguous() fallback case to split the 
allocation into dma_max_mapping_size() chunks. *That* makes sense.

Thanks,
Robin.

> 
> Best regards,
> Tomasz
> 
>>
>> Robin.
>>
>>> [1] (not in upstream) https://patchwork.kernel.org/project/linux-media/cover/20190611035344.29814-1-jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org/
>>> [2] https://elixir.bootlin.com/linux/latest/source/drivers/remoteproc/mtk_scp.c
>>> [3] https://patchwork.kernel.org/project/linux-media/cover/20210909112430.61243-1-senozhatsky-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org/
>>>
>>> Hsin-Yi Wang (3):
>>>     dma: swiotlb: Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
>>>     dt-bindings: Add io-tlb-segsize property for restricted-dma-pool
>>>     arm64: dts: mt8183: use restricted swiotlb for scp mem
>>>
>>>    .../reserved-memory/shared-dma-pool.yaml      |  8 +++++
>>>    .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  4 +--
>>>    include/linux/swiotlb.h                       |  1 +
>>>    kernel/dma/swiotlb.c                          | 34 ++++++++++++++-----
>>>    4 files changed, 37 insertions(+), 10 deletions(-)
>>>
