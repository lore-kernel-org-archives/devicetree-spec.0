From: Wei Liang Lim <weiliang.lim-bONrM45KWFOXmMXjJBpWqg@public.gmane.org>
Subject: [PATCH v2] schemas: chosen: Add 'boot-hart-id' property
Date: Thu, 5 Jan 2023 10:23:38 +0800
Message-ID: <20230105022338.562824-1-weiliang.lim@starfivetech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: cheehong.ang-bONrM45KWFOXmMXjJBpWqg@public.gmane.org, junliang.tan-bONrM45KWFOXmMXjJBpWqg@public.gmane.org, weiliang.lim-bONrM45KWFOXmMXjJBpWqg@public.gmane.org

Add 'boot-hart-id' property to allow user to specify preferred cold boot HART for RISCV architecture in OpenSBI firmware.
If unspecified, the default lottery mechanism will be used to randomly select the cold boot hart.
This is mainly to solve some product requirements which a preferred cold boot hart is required.

Signed-off-by: Wei Liang Lim <weiliang.lim-bONrM45KWFOXmMXjJBpWqg@public.gmane.org>
Reviewed-by: Chee Hong Ang <cheehong.ang-bONrM45KWFOXmMXjJBpWqg@public.gmane.org>
Reviewed-by: Jun Liang Tan <junliang.tan-bONrM45KWFOXmMXjJBpWqg@public.gmane.org>
---
 dtschema/schemas/chosen.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
index 86194dd..ead3691 100644
--- a/dtschema/schemas/chosen.yaml
+++ b/dtschema/schemas/chosen.yaml
@@ -31,6 +31,13 @@ properties:
 
   bootargs:
     $ref: types.yaml#/definitions/string
+    
+  boot-hart-id:
+    $ref: types.yaml#/definitions/uint32
+    description:
+      This property is an option for user to specify the preferred cold boot
+      HART for RISCV architecture in OpenSBI firmware. If unspecified, the
+      default lottery mechanism will be used.
 
   kaslr-seed:
     $ref: types.yaml#/definitions/uint64
-- 
2.25.1

