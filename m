From: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
Subject: [PATCH 1/5] dt-bindings: reserved-memory: Add
 alloc-{bottom-up,top-down}
Date: Mon, 15 May 2023 12:12:16 +0200
Message-ID: <20230510-dt-resv-bottom-up-v1-1-3bf68873dbed@gerhold.net>
References: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684145544;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=olVuiJZGfA/LHV3YVLMLjpbt55lnzWTZbOuO9FJhuMI=;
    b=CY+o6P9VjlLTzgmoC0ukNBftxBPWTp+7p5Sf63HXc0kUdrbe51QDEhkdp9Wtei8gCx
    36mkGqS1MxlBxUd2aUZm8VSzzNvMDQ+iEyrYqhhDomIXlgCGy0lYIQlTuJVh/7vTZXjH
    LZk02fO22jf3tEZDtUtM/hEzd/CoSxwcSfng63j1v3SMB17uUs5bzuub7PAMNgvhSk5h
    fVs9gKoT23x5tolvWfYrBeCcMwEdRGVXI+f17rwhgYErxVvZpiA+WYm8KF5vlZFlNfSK
    JKBYgV4xLhWiG84cXENjPysczqq8CwbFkGjrxDqLv8EBWXhxPuxZ28E+Od8VshjfWQ3m
    NQpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684145544;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=olVuiJZGfA/LHV3YVLMLjpbt55lnzWTZbOuO9FJhuMI=;
    b=NpzOsiBC7Df5KrzmYokWRVug7C5LvTnshPFSpfjZg+SXou+lgjK2J8KTa7xrsVuGtr
    lptCIGHXxBH9BsowsSBg==
In-Reply-To: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed-3XONVrnlUWDR7s880joybQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Konrad Dybcio <konrad.dybcio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>

Right now the allocation behavior for dynamic reserved memory is
implementation-defined. On Linux it is dependent on the architecture.
This is usually fine if the address is completely arbitrary.

However, when using "alloc-ranges" it is helpful to allow controlling
this. That way you can make sure that the reservations are placed next
to other (static) allocations to keep the free memory contiguous if
possible.

Signed-off-by: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
---
 .../bindings/reserved-memory/reserved-memory.yaml  | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
index c680e397cfd2..56f4bc6137e7 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
@@ -52,6 +52,18 @@ properties:
       Address and Length pairs. Specifies regions of memory that are
       acceptable to allocate from.
 
+  alloc-bottom-up:
+    type: boolean
+    description: >
+      Specifies that the memory region should be preferably allocated
+      at the lowest available address within the "alloc-ranges" region.
+
+  alloc-top-down:
+    type: boolean
+    description: >
+      Specifies that the memory region should be preferably allocated
+      at the highest available address within the "alloc-ranges" region.
+
   iommu-addresses:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: >
@@ -93,6 +105,10 @@ properties:
       system can use that region to store volatile or cached data that
       can be otherwise regenerated or migrated elsewhere.
 
+dependencies:
+  alloc-bottom-up: [alloc-ranges]
+  alloc-top-down: [alloc-ranges]
+
 allOf:
   - if:
       required:
@@ -178,4 +194,27 @@ examples:
         };
       };
     };
+
+  - |
+    / {
+      compatible = "foo";
+      model = "foo";
+
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        adsp_mem: adsp {
+          size = <0x0 0x600000>;
+          alignment = <0x0 0x100000>;
+          alloc-ranges = <0x0 0x86800000 0x0 0x10000000>;
+          alloc-bottom-up;
+          no-map;
+        };
+      };
+    };
 ...

-- 
2.40.1

