From: Hsin-Yi Wang <hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/3] dt-bindings: Add io-tlb-segsize property for restricted-dma-pool
Date: Tue, 23 Nov 2021 19:21:03 +0800
Message-ID: <20211123112104.3530135-3-hsinyi@chromium.org>
References: <20211123112104.3530135-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z+/tM6AGO8qVa/0Ves95KRNhzSUdOxRaqnGgKB5D++M=;
        b=XpXqNAebRwgXhworSNtt028SsP5KTorBtVnPQ2NDJ5AqE0w8IT8BOg6T3ewnDOxn0x
         QaNyBlTudA5wA6HUsP3tTtdlTWjvrE8GuQPbTwT1fW+w1gEOlQN/lkvuxJNQ4SJKqEYn
         we3ePUFjfo44/HkRFeRMoGLKvp+vx0wcGlvTA=
In-Reply-To: <20211123112104.3530135-1-hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>, - <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, senozhatsky-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

Add a io-tlb-segsize property that each restricted-dma-pool can set its
own io_tlb_segsize since some use cases require slabs larger than default
value (128).

Signed-off-by: Hsin-Yi Wang <hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 .../bindings/reserved-memory/shared-dma-pool.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
index a4bf757d6881de..6198bf6b76f0b2 100644
--- a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
@@ -56,6 +56,14 @@ properties:
       If this property is present, then Linux will use the region for
       the default pool of the consistent DMA allocator.
 
+  io-tlb-segsize:
+    type: u32
+    description: >
+      Each restricted-dma-pool can use this property to set its own
+      io_tlb_segsize. If not set, it will use the default value
+      IO_TLB_SEGSIZE defined in include/linux/swiotlb.h. The value has
+      to be a power of 2, otherwise it will fall back to IO_TLB_SEGSIZE.
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.0.rc2.393.gf8c9666880-goog

