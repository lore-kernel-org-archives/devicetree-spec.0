From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 19/21] dt-bindings: reserved-memory: shared-dma-pool: support DMB
Date: Tue, 13 Sep 2022 12:55:06 -0700
Message-ID: <20220913195508.3511038-20-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Iv6LAHuQtTXeYWyq0DEDKZbOD/1nb3ztqrePD2HtkIE=;
        b=YrAFBuuyJkwRgGb5yJxtoTNNKh/7y4BOHe54UWWbwGw/7zVyvD5YS3xh6wOizb8P5y
         WPvQ65cSNAdgAQQ5wDi83N9jAKpum/P9kqfXIHyP2JYI4r5D1linVF+pAeO7tMTGeNJd
         s10XvBpPDdlS4NQdOIfsc4Y86zu8zbnj/iRe9JIr+LJQn5lsr3jvpDq8YkHXv8CVoVQ9
         l1Y7VxuX7aqVyF4T9IwYMUdPvuZE/+WFrgImMS1687EPItdw+VwpQNOwUoolbQ3Hf9aR
         Ox2qAlcyZj/+2EVV8HvGsz7p+nWwMiSQtDYItBS1H3jfaKi/gJ7kAUpfhR4jWWYZpfwT
         Vmow==
In-Reply-To: <20220913195508.3511038-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

The shared-dmb-pool compatible string creates a Designated Movable
Block to contain a shared pool of DMA buffers.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/reserved-memory/shared-dma-pool.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
index 618105f079be..85824fe05ac9 100644
--- a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
@@ -22,6 +22,14 @@ properties:
           operating system to instantiate the necessary pool management
           subsystem if necessary.
 
+      - const: shared-dmb-pool
+        description: >
+          This indicates a shared-dma-pool region that is located within
+          a Designated Movable Block. The operating system is free to
+          use unallocated memory for movable allocations in this region.
+          Devices need to be tolerant of allocation latency to use this
+          pool.
+
       - const: restricted-dma-pool
         description: >
           This indicates a region of memory meant to be used as a pool
-- 
2.25.1

