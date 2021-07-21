From: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
Subject: [PATCH 05/54] dt-bindings: Convert Reserved Memory
 binding to a schema
Date: Wed, 21 Jul 2021 16:03:35 +0200
Message-ID: <20210721140424.725744-6-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
Reply-To: maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org
Mime-Version: 1.0
Return-path: <linux-sunxi+bncBDBYZUEI7YHBB6OS4CDQMGQEWUAGO2A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BBoRRxnpJ33UKltFHOE5ZhuuddnbPtqeJINM//1f9DI=;
        b=atFrJp2vVW9IkndMzUiKgVVKAEa/lnv7rMi+2E/5mQ2qW9iQx/v77ys8bDjaAWYuIw
         Ufxb4YEE7Ry0iNPx5yytGJzHj/fmI/nERCzHw/uM5ZCEf81wsYWzW+tyV8BdSptMUjj3
         xIPc94stj1MFSFLWsD201+IcazPoinaJTJPyWz0A5+v0kqOjomnRY055mq++Btn7qDCs
         Vnuvn/5tijRDoYJd/1AzUAuQGWZK8KyEiFCuesNQf1ris8ZM2K3sqBzp0fqaAmdG/JJd
         yJU9lOn6VifOg9i0UJ7ZFlesHW+zp1kPPLRloxFO2oi2MeJDYcfyfID2K0C1CBu+Wh1A
         yxjg==
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20210721140424.725744-1-maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

The Reserved Memory mechanism is supported by Linux thanks to its device
tree binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
---
 .../reserved-memory/reserved-memory.txt       | 141 ---------------
 .../reserved-memory/reserved-memory.yaml      | 167 ++++++++++++++++++
 2 files changed, 167 insertions(+), 141 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
deleted file mode 100644
index e8d3096d922c..000000000000
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ /dev/null
@@ -1,141 +0,0 @@
-*** Reserved memory regions ***
-
-Reserved memory is specified as a node under the /reserved-memory node.
-The operating system shall exclude reserved memory from normal usage
-one can create child nodes describing particular reserved (excluded from
-normal use) memory regions. Such memory regions are usually designed for
-the special usage by various device drivers.
-
-Parameters for each memory region can be encoded into the device tree
-with the following nodes:
-
-/reserved-memory node
----------------------
-#address-cells, #size-cells (required) - standard definition
-    - Should use the same values as the root node
-ranges (required) - standard definition
-    - Should be empty
-
-/reserved-memory/ child nodes
------------------------------
-Each child of the reserved-memory node specifies one or more regions of
-reserved memory. Each child node may either use a 'reg' property to
-specify a specific range of reserved memory, or a 'size' property with
-optional constraints to request a dynamically allocated block of memory.
-
-Following the generic-names recommended practice, node names should
-reflect the purpose of the node (ie. "framebuffer" or "dma-pool"). Unit
-address (@<address>) should be appended to the name if the node is a
-static allocation.
-
-Properties:
-Requires either a) or b) below.
-a) static allocation
-   reg (required) - standard definition
-b) dynamic allocation
-   size (required) - length based on parent's #size-cells
-                   - Size in bytes of memory to reserve.
-   alignment (optional) - length based on parent's #size-cells
-                        - Address boundary for alignment of allocation.
-   alloc-ranges (optional) - prop-encoded-array (address, length pairs).
-                           - Specifies regions of memory that are
-                             acceptable to allocate from.
-
-If both reg and size are present, then the reg property takes precedence
-and size is ignored.
-
-Additional properties:
-compatible (optional) - standard definition
-    - may contain the following strings:
-        - shared-dma-pool: This indicates a region of memory meant to be
-          used as a shared pool of DMA buffers for a set of devices. It can
-          be used by an operating system to instantiate the necessary pool
-          management subsystem if necessary.
-        - vendor specific string in the form <vendor>,[<device>-]<usage>
-no-map (optional) - empty property
-    - Indicates the operating system must not create a virtual mapping
-      of the region as part of its standard mapping of system memory,
-      nor permit speculative access to it under any circumstances other
-      than under the control of the device driver using the region.
-reusable (optional) - empty property
-    - The operating system can use the memory in this region with the
-      limitation that the device driver(s) owning the region need to be
-      able to reclaim it back. Typically that means that the operating
-      system can use that region to store volatile or cached data that
-      can be otherwise regenerated or migrated elsewhere.
-
-A node must not carry both the no-map and the reusable property as these are
-logically contradictory.
-
-Linux implementation note:
-- If a "linux,cma-default" property is present, then Linux will use the
-  region for the default pool of the contiguous memory allocator.
-
-- If a "linux,dma-default" property is present, then Linux will use the
-  region for the default pool of the consistent DMA allocator.
-
-Device node references to reserved memory
------------------------------------------
-Regions in the /reserved-memory node may be referenced by other device
-nodes by adding a memory-region property to the device node.
-
-memory-region (optional) - phandle, specifier pairs to children of /reserved-memory
-memory-region-names (optional) - a list of names, one for each corresponding
-  entry in the memory-region property
-
-Example
--------
-This example defines 3 contiguous regions are defined for Linux kernel:
-one default of all device drivers (named linux,cma@72000000 and 64MiB in size),
-one dedicated to the framebuffer device (named framebuffer@78000000, 8MiB), and
-one for multimedia processing (named multimedia-memory@77000000, 64MiB).
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	memory {
-		reg = <0x40000000 0x40000000>;
-	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		/* global autoconfigured region for contiguous allocations */
-		linux,cma {
-			compatible = "shared-dma-pool";
-			reusable;
-			size = <0x4000000>;
-			alignment = <0x2000>;
-			linux,cma-default;
-		};
-
-		display_reserved: framebuffer@78000000 {
-			reg = <0x78000000 0x800000>;
-		};
-
-		multimedia_reserved: multimedia@77000000 {
-			compatible = "acme,multimedia-memory";
-			reg = <0x77000000 0x4000000>;
-		};
-	};
-
-	/* ... */
-
-	fb0: video@12300000 {
-		memory-region = <&display_reserved>;
-		/* ... */
-	};
-
-	scaler: scaler@12500000 {
-		memory-region = <&multimedia_reserved>;
-		/* ... */
-	};
-
-	codec: codec@12600000 {
-		memory-region = <&multimedia_reserved>;
-		/* ... */
-	};
-};
diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
new file mode 100644
index 000000000000..b61527f11953
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
@@ -0,0 +1,167 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: /reserved-memory Node
+
+maintainers:
+  - Devicetree Specification Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
+
+description: >
+  Reserved memory is specified as a node under the /reserved-memory node. The
+  operating system shall exclude reserved memory from normal usage one can
+  create child nodes describing particular reserved (excluded from normal use)
+  memory regions. Such memory regions are usually designed for the special
+  usage by various device drivers.
+
+properties:
+  $nodename:
+    const: reserved-memory
+
+  "#address-cells": true
+  "#size-cells": true
+  ranges: true
+
+patternProperties:
+  "^(?!(ranges))[a-z,-]*(@[0-9]+)?$":
+    type: object
+
+    description: >
+      Each child of the reserved-memory node specifies one or more regions of
+      reserved memory. Each child node may either use a 'reg' property to
+      specify a specific range of reserved memory, or a 'size' property with
+      optional constraints to request a dynamically allocated block of memory.
+
+      Following the generic-names recommended practice, node names should
+      reflect the purpose of the node (ie. "framebuffer" or "dma-pool"). Unit
+      address (@<address>) should be appended to the name if the node is a
+      static allocation.
+
+    properties:
+      reg: true
+
+      size:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: >
+          Length based on parent's \#size-cells. Size in bytes of memory to
+          reserve.
+
+      alignment:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: >
+          Length based on parent's \#size-cells. Address boundary for
+          alignment of allocation.
+
+      alloc-ranges:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: >
+          Address and Length pairs. Specifies regions of memory that are
+          acceptable to allocate from.
+
+      compatible:
+        oneOf:
+          - const: shared-dma-pool
+            description: >
+              This indicates a region of memory meant to be used as a shared
+              pool of DMA buffers for a set of devices. It can be used by an
+              operating system to instantiate the necessary pool management
+              subsystem if necessary.
+
+          # Vendor-specific compatibles in the form <vendor>,[<device>-]<usage>
+          - const: mediatek,trustzone-bootinfo
+
+      no-map:
+        type: boolean
+        description: >
+          Indicates the operating system must not create a virtual mapping of
+          the region as part of its standard mapping of system memory, nor
+          permit speculative access to it under any circumstances other than
+          under the control of the device driver using the region.
+
+      reusable:
+        type: boolean
+        description: >
+          The operating system can use the memory in this region with the
+          limitation that the device driver(s) owning the region need to be
+          able to reclaim it back. Typically that means that the operating
+          system can use that region to store volatile or cached data that
+          can be otherwise regenerated or migrated elsewhere.
+
+      linux,cma-default:
+        type: boolean
+        description: >
+          If this property is present, then Linux will use the region for the
+          default pool of the contiguous memory allocator.
+
+      linux,dma-default:
+        type: boolean
+        description: >
+          If this property is present, then Linux will use the region for the
+          default pool of the consistent DMA allocator.
+
+    allOf:
+      - if:
+          required:
+            - no-map
+
+        then:
+          not:
+            required:
+              - reusable
+
+      - if:
+          required:
+            - reusable
+
+        then:
+          not:
+            required:
+              - no-map
+
+    oneOf:
+      - required:
+          - reg
+
+      - required:
+          - size
+
+    additionalProperties: true
+
+additionalProperties: true
+
+examples:
+  - |
+      / {
+          #address-cells = <1>;
+          #size-cells = <1>;
+          model = "MediaTek MT2701 evaluation board";
+          compatible = "mediatek,mt2701-evb", "mediatek,mt2701";
+
+          reserved-memory {
+              #address-cells = <1>;
+              #size-cells = <1>;
+              ranges;
+
+              /* global autoconfigured region for contiguous allocations */
+              linux,cma {
+                  compatible = "shared-dma-pool";
+                  reusable;
+                  size = <0x4000000>;
+                  alignment = <0x2000>;
+                  linux,cma-default;
+              };
+
+              display_reserved: framebuffer@78000000 {
+                  reg = <0x78000000 0x800000>;
+              };
+
+              trustzone-bootinfo@80002000 {
+                  compatible = "mediatek,trustzone-bootinfo";
+                  reg = <0x80002000 0x1000>;
+              };
+          };
+      };
+
+...
-- 
2.31.1
