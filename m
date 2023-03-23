From: Serge Semin <Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>
Subject: [PATCH] meta-schemas: Allow 'not' keyword
Date: Thu, 23 Mar 2023 18:09:47 +0300
Message-ID: <20230323150947.947-1-Sergey.Semin@baikalelectronics.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        baikalelectronics.ru; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:from:from:message-id
        :mime-version:reply-to:subject:subject:to:to; s=post; bh=aF+lFCa
        CJ1EkuIJXyiQSJlqA7NWC417mOVvyKrKtFmw=; b=nUKQf1oUcuWZHGAfMMcR6A6
        IN3Y/NnC8jN1cg9q//3gDpAXFU12w8+azm2bm0JDV3taPwAq4euF+ZzPXlhOJPpU
        G70aphhLXSIChlO/d52fNFHutotrsp48uVggMzC6YRw+fmMK4a7P6bSKuVnUbXt/
        Xir++++gYdrHiRfdTztw=
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Serge Semin <Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexey Malahov <Alexey.Malahov-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>, Pavel Parkhomenko <Pavel.Parkhomenko-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Root- and sub-node schemas are supposed to be allowed to use the 'not'
keyword directly to express a schema against which the instance isn't
supposed to be successfully validated. It shall work in the same way as
the allOf, anyOf, oneOf-based validation except the keyword implies a
single sub-schema against which an instance will be anti-evaluated.

Signed-off-by: Serge Semin <Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>

---

Please see the next email message for the patch context:
Link: https://lore.kernel.org/netdev/20230313225103.30512-16-Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org
---
 dtschema/meta-schemas/base.yaml  | 2 +-
 dtschema/meta-schemas/nodes.yaml | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/dtschema/meta-schemas/base.yaml b/dtschema/meta-schemas/base.yaml
index 1dd005c53467..96d0a82febc6 100644
--- a/dtschema/meta-schemas/base.yaml
+++ b/dtschema/meta-schemas/base.yaml
@@ -50,7 +50,7 @@ properties:
 propertyNames:
   enum: [ $id, $schema, title, description, examples, required, allOf, anyOf, oneOf,
           definitions, $defs, additionalProperties, dependencies, dependentRequired,
-          dependentSchemas, patternProperties, properties, if, then, else,
+          dependentSchemas, patternProperties, properties, not, if, then, else,
           unevaluatedProperties, deprecated, maintainers, select, $ref ]
 
 required:
diff --git a/dtschema/meta-schemas/nodes.yaml b/dtschema/meta-schemas/nodes.yaml
index 7568169a7907..0b2c8f750624 100644
--- a/dtschema/meta-schemas/nodes.yaml
+++ b/dtschema/meta-schemas/nodes.yaml
@@ -26,6 +26,7 @@ propertyNames:
     - unevaluatedProperties
     - deprecated
     - required
+    - not
     - allOf
     - anyOf
     - oneOf
-- 
2.39.2


