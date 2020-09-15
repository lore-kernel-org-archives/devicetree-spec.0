From: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/4] trivial: Add chapter number to source files
Date: Tue, 15 Sep 2020 10:03:32 +0100
Message-ID: <20200915090335.9167-2-grant.likely@arm.com>
References: <20200915090335.9167-1-grant.likely@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUPtFl0jiUZ2z3HZhZ++UhrysO0WxdFjxHBPxI/TJxM=;
 b=2ORHo31BxyFBr4BD/GJjYLOUjYoqe25X/8or+PzoWiiBM/P3NmGg0FM7rKEx/drtUoqbuVIBaZD8mfhfO0M16JodtYc50syHphFGcqeCDwweXDp+tiwAukSME25d7GAYDYs5MWFSyB5ec1xHTteiAYddrRGSQQTjdoUujnGorkE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUPtFl0jiUZ2z3HZhZ++UhrysO0WxdFjxHBPxI/TJxM=;
 b=2ORHo31BxyFBr4BD/GJjYLOUjYoqe25X/8or+PzoWiiBM/P3NmGg0FM7rKEx/drtUoqbuVIBaZD8mfhfO0M16JodtYc50syHphFGcqeCDwweXDp+tiwAukSME25d7GAYDYs5MWFSyB5ec1xHTteiAYddrRGSQQTjdoUujnGorkE=
In-Reply-To: <20200915090335.9167-1-grant.likely-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: nd-5wv7dgnIgG8@public.gmane.org, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

It is easier to follow the organization of the source files if the
chapter numbers are included in the file names. This patch only renames
the main chapter .rst files and fixes up the index.rst with the new
names.

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../{introduction.rst => chapter1-introduction.rst}  |  0
 ...ree-basics.rst => chapter2-devicetree-basics.rst} |  0
 source/{devicenodes.rst => chapter3-devicenodes.rst} |  0
 ...ice-bindings.rst => chapter4-device-bindings.rst} |  0
 ...ened-format.rst => chapter5-flattened-format.rst} |  0
 ...rce-language.rst => chapter6-source-language.rst} |  0
 source/index.rst                                     | 12 ++++++------
 7 files changed, 6 insertions(+), 6 deletions(-)
 rename source/{introduction.rst => chapter1-introduction.rst} (100%)
 rename source/{devicetree-basics.rst => chapter2-devicetree-basics.rst} (100%)
 rename source/{devicenodes.rst => chapter3-devicenodes.rst} (100%)
 rename source/{device-bindings.rst => chapter4-device-bindings.rst} (100%)
 rename source/{flattened-format.rst => chapter5-flattened-format.rst} (100%)
 rename source/{source-language.rst => chapter6-source-language.rst} (100%)

diff --git a/source/introduction.rst b/source/chapter1-introduction.rst
similarity index 100%
rename from source/introduction.rst
rename to source/chapter1-introduction.rst
diff --git a/source/devicetree-basics.rst b/source/chapter2-devicetree-basics.rst
similarity index 100%
rename from source/devicetree-basics.rst
rename to source/chapter2-devicetree-basics.rst
diff --git a/source/devicenodes.rst b/source/chapter3-devicenodes.rst
similarity index 100%
rename from source/devicenodes.rst
rename to source/chapter3-devicenodes.rst
diff --git a/source/device-bindings.rst b/source/chapter4-device-bindings.rst
similarity index 100%
rename from source/device-bindings.rst
rename to source/chapter4-device-bindings.rst
diff --git a/source/flattened-format.rst b/source/chapter5-flattened-format.rst
similarity index 100%
rename from source/flattened-format.rst
rename to source/chapter5-flattened-format.rst
diff --git a/source/source-language.rst b/source/chapter6-source-language.rst
similarity index 100%
rename from source/source-language.rst
rename to source/chapter6-source-language.rst
diff --git a/source/index.rst b/source/index.rst
index ea85396..568e72b 100644
--- a/source/index.rst
+++ b/source/index.rst
@@ -13,12 +13,12 @@ Welcome to Devicetree Specification's documentation!
    license
    acknowledgements
    revhistory
-   introduction
-   devicetree-basics
-   devicenodes
-   device-bindings
-   flattened-format
-   source-language
+   chapter1-introduction
+   chapter2-devicetree-basics
+   chapter3-devicenodes
+   chapter4-device-bindings
+   chapter5-flattened-format
+   chapter6-source-language
    references
 
 ..
-- 
2.20.1

