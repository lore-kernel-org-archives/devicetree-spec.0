From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 16/21] dt-bindings: reserved-memory: introduce designated-movable-block
Date: Tue, 13 Sep 2022 12:55:03 -0700
Message-ID: <20220913195508.3511038-17-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=0ytqVsMPjuVvTMmUHQDgw++YWpDMZOL8Z97lPlE2FVY=;
        b=io9Nt4/RcZ2YZMphnT4cANVUYCQB6U7tpDHWWA0ymeRAMaiACQe59CDdxV3fKa+Hsn
         xNls20lsFyfw6rNS33zM5vtcFodTEOrCxgBbNhbWX8T1mEeMX+VwfC33CIm+xfP758LM
         zM7bYSmAZtJOGaBc2/pCs2H6YwEWsP5kO079m4wM+f6s/zfDbHxnmlkNGrxVR7sLq2J2
         vi+KzltoxbcgQVb6NYjPdS8rs20FudQRcZ6AiEV/jd58a8RhxFomEIPJSEoUVrySG9CU
         fGCpRyRxdV4msiy4sXSvtH2LCG/1JOnoJrLiDkFSx8Zr9e7tZ4S5+YfhjAOUxZaXHtxy
         O3kw==
In-Reply-To: <20220913195508.3511038-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

Introduce designated-movable-block.yaml to document the
devicetree binding for Designated Movable Block children of the
reserved-memory node.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../designated-movable-block.yaml             | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/designated-movable-block.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/designated-movable-block.yaml b/Documentation/devicetree/bindings/reserved-memory/designated-movable-block.yaml
new file mode 100644
index 000000000000..42f846069a2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/designated-movable-block.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/designated-movable-block.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: /reserved-memory Designated Movable Block node binding
+
+maintainers:
+  - devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+
+allOf:
+  - $ref: "reserved-memory.yaml"
+
+properties:
+  compatible:
+    const: designated-movable-block
+    description:
+      This indicates a region of memory meant to be placed into
+      ZONE_MOVABLE.
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reusable
+
+examples:
+  - |
+      reserved-memory {
+          #address-cells = <0x2>;
+          #size-cells = <0x2>;
+
+          DMB0@10800000 {
+               compatible = "designated-movable-block";
+               reusable;
+               reg = <0x0 0x10800000 0x0 0x2d800000>;
+          };
+
+          DMB1@40000000 {
+               compatible = "designated-movable-block";
+               reusable;
+               reg = <0x0 0x40000000 0x0 0x30000000>;
+          };
+
+          DMB2@80000000 {
+               compatible = "designated-movable-block";
+               reusable;
+               reg = <0x0 0x80000000 0x0 0x2fc00000>;
+          };
+      };
-- 
2.25.1

