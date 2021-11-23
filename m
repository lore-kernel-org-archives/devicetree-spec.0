From: Hsin-Yi Wang <hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/3] Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
Date: Tue, 23 Nov 2021 19:21:01 +0800
Message-ID: <20211123112104.3530135-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5/NUU473gHgJJWAHyz9icycAmdo+qfzcO9MMsTUYLCA=;
        b=Ka+/WtPAVKmsC47ebx/EttMPimSyaFaQsXvSwohDRgg53jo8emMNbvUMSjBffFZJiF
         6mmEV31XO/9nn98pDJV/kWkNmFi5luffIqiHkegaqh/MUKTubaMVlPLwa07SSu/o/XsD
         8ngdYw/RZqDR/Hmx12cSy0gEWVZ3Gd2d3Mktk=
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>, - <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, senozhatsky-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

Default IO_TLB_SEGSIZE (128) slabs may be not enough for some use cases.
This series adds support to customize io_tlb_segsize for each
restricted-dma-pool.

Example use case:

mtk-isp drivers[1] are controlled by mtk-scp[2] and allocate memory through
mtk-scp. In order to use the noncontiguous DMA API[3], we need to use
the swiotlb pool. mtk-scp needs to allocate memory with 2560 slabs.
mtk-isp drivers also needs to allocate memory with 200+ slabs. Both are
larger than the default IO_TLB_SEGSIZE (128) slabs.

[1] (not in upstream) https://patchwork.kernel.org/project/linux-media/cover/20190611035344.29814-1-jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org/
[2] https://elixir.bootlin.com/linux/latest/source/drivers/remoteproc/mtk_scp.c
[3] https://patchwork.kernel.org/project/linux-media/cover/20210909112430.61243-1-senozhatsky-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org/

Hsin-Yi Wang (3):
  dma: swiotlb: Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
  dt-bindings: Add io-tlb-segsize property for restricted-dma-pool
  arm64: dts: mt8183: use restricted swiotlb for scp mem

 .../reserved-memory/shared-dma-pool.yaml      |  8 +++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  4 +--
 include/linux/swiotlb.h                       |  1 +
 kernel/dma/swiotlb.c                          | 34 ++++++++++++++-----
 4 files changed, 37 insertions(+), 10 deletions(-)

-- 
2.34.0.rc2.393.gf8c9666880-goog

