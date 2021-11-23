From: Hsin-Yi Wang <hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 3/3] arm64: dts: mt8183: use restricted swiotlb for scp mem
Date: Tue, 23 Nov 2021 19:21:04 +0800
Message-ID: <20211123112104.3530135-4-hsinyi@chromium.org>
References: <20211123112104.3530135-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mq8nc34v9wy9BHUcdNCchv5TcJtzwaMW4yDN1UOKTXs=;
        b=JpDT/+FDBCbI5IBaWeaKfzyOwUUOyTt+Vw1ovqm0zuzKZZrjqWO3dJqGL1pzmsZRcz
         WEzphSwzny6i8imySPh8owk0bZ7mV09ROF7m2cIZELwxwLD3zWFbiIveEf0Sy/YacdFK
         n/sQubJ/NkmPIgp5pbeN1xtI08xQWQungcwqY=
In-Reply-To: <20211123112104.3530135-1-hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>, - <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, senozhatsky-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

Use restricted-dma-pool for mtk_scp's reserved memory. And set the
io-tlb-segsize to 4096 since the driver needs at least 2560 slabs to
allocate memory.

Signed-off-by: Hsin-Yi Wang <hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 94c13c45919445..de94b2fd7f33e7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -109,9 +109,9 @@ reserved_memory: reserved-memory {
 		ranges;
 
 		scp_mem_reserved: scp_mem_region {
-			compatible = "shared-dma-pool";
+			compatible = "restricted-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
-			no-map;
+			io-tlb-segsize = <4096>;
 		};
 	};
 
-- 
2.34.0.rc2.393.gf8c9666880-goog

