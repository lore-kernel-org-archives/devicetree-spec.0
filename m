From: Wei Liang Lim <weiliang.lim-bONrM45KWFOXmMXjJBpWqg@public.gmane.org>
Subject: [PATCH] schemas: chosen: Add 'boot-hart-id' property
Date: Tue, 3 Jan 2023 11:25:22 +0800
Message-ID: <20230103032522.36353-1-weiliang.lim@starfivetech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: cheehong.ang-bONrM45KWFOXmMXjJBpWqg@public.gmane.org, junliang.tan-bONrM45KWFOXmMXjJBpWqg@public.gmane.org, weiliang.lim-bONrM45KWFOXmMXjJBpWqg@public.gmane.org

Add 'boot-hart-id' property to allow user to specify preferred cold boot HART in OpenSBI for StarFive JH7110 platform.

Signed-off-by: Wei Liang Lim <weiliang.lim-bONrM45KWFOXmMXjJBpWqg@public.gmane.org>
Reviewed-by: Chee Hong Ang <cheehong.ang-bONrM45KWFOXmMXjJBpWqg@public.gmane.org>
Reviewed-by: Jun Liang Tan <junliang.tan-bONrM45KWFOXmMXjJBpWqg@public.gmane.org>
---
 dtschema/schemas/chosen.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
index 86194dd..f88feb5 100644
--- a/dtschema/schemas/chosen.yaml
+++ b/dtschema/schemas/chosen.yaml
@@ -31,6 +31,19 @@ properties:
 
   bootargs:
     $ref: types.yaml#/definitions/string
+    
+   boot-hart-id:
+    type: integer
+    description:
+      This property allows user to specify preferred cold boot HART in OpenSBI
+      for StarFive JH7110 platform. If unspecified, the existing lottery mechanism
+      will be used. e.g.
+      
+      /{
+              chosen {
+                      boot-hart-id = <1>;
+              };
+      };
 
   kaslr-seed:
     $ref: types.yaml#/definitions/uint64
-- 
2.25.1

