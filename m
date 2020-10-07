From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Increase the TOC levels to 4
Date: Wed,  7 Oct 2020 15:55:21 -0500
Message-ID: <20201007205521.699207-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

Some properties show up in the TOC and some don't because they are at the
4th level, so let's increase the depth to 4.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 source/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source/index.rst b/source/index.rst
index 120c99168668..9c8101f68d6e 100644
--- a/source/index.rst
+++ b/source/index.rst
@@ -10,7 +10,7 @@ Welcome to Devicetree Specification's documentation!
 
 .. toctree::
    :numbered:
-   :maxdepth: 3
+   :maxdepth: 4
 
    license
    acknowledgements
-- 
2.25.1

