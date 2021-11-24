From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/3] Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
Date: Wed, 24 Nov 2021 12:34:35 +0000
Message-ID: <927eb333-695d-89d6-f02e-b178b53ae4d9@arm.com>
References: <20211123112104.3530135-1-hsinyi@chromium.org>
 <75ea1026-63e5-165a-9e07-27b5ac4c7579@arm.com>
 <CAJMQK-gHpmfedbRfR-1ZNLw0LpRDJHYoKLd-k3kvkqFf8vnD4A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
Content-Language: en-GB
In-Reply-To: <CAJMQK-gHpmfedbRfR-1ZNLw0LpRDJHYoKLd-k3kvkqFf8vnD4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Id: <devicetree-spec.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hsin-Yi Wang <hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, - <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, senozhatsky-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org

On 2021-11-24 03:55, Hsin-Yi Wang wrote:
> On Tue, Nov 23, 2021 at 7:58 PM Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> wrote:
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
>>
> mtk_scp on its own can use the shared-dma-pool, which it currently uses.
> The reason we switched to restricted-dma-pool is that we want to use
> the noncontiguous DMA API for mtk-isp. The noncontiguous DMA API is
> designed for devices with iommu, and if a device doesn't have an
> iommu, it will fallback using swiotlb. But currently noncontiguous DMA
> API doesn't work with the shared-dma-pool.
> 
> vb2_dc_alloc() -> dma_alloc_noncontiguous() -> alloc_single_sgt() ->
> __dma_alloc_pages() -> dma_direct_alloc_pages() ->
> __dma_direct_alloc_pages() -> swiotlb_alloc().

OK, thanks for clarifying. My gut feeling is that drivers should 
probably only be calling the noncontiguous API when they *know* that 
they have a scatter-gather-capable device or IOMMU that can cope with 
it, but either way I'm still not convinced that it makes sense to hack 
up SWIOTLB with DT ABI baggage for an obscure fallback case. It would 
seem a lot more sensible to fix alloc_single_sgt() to not ignore 
per-device pools once it has effectively fallen back to the normal 
dma_alloc_attrs() flow, but I guess that's not technically guaranteed to 
uphold the assumption that we can allocate struct-page-backed memory.

Still, if we've got to the point of needing to use a SWIOTLB pool as 
nothing more than a bad reinvention of CMA, rather than an actual bounce 
buffer, that reeks of a fundamental design issue and adding more hacks 
on top to bodge around it is not the right way to go - we need to take a 
step back and properly reconsider how dma_alloc_noncontiguous() is 
supposed to interact with DMA protection schemes.

Thanks,
Robin.

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
> _______________________________________________
> iommu mailing list
> iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
