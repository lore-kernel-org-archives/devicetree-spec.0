From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/4] Set maximum sizes for digraphs
Date: Wed,  6 Dec 2017 12:31:20 -0600
Message-ID: <20171206183120.16700-5-robh@kernel.org>
References: <20171206183120.16700-1-robh@kernel.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171206183120.16700-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Between 1.5.6 and 1.6.5 of sphinx, the digraphs stopped being scaled to fit.
Add a maximum size to them to fix this.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 source/devicetree-basics.rst | 3 +++
 source/flattened-format.rst  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
index 5874ec30782e..b5b331680606 100644
--- a/source/devicetree-basics.rst
+++ b/source/devicetree-basics.rst
@@ -47,6 +47,7 @@ with properties and values inside each node.
 
    rankdir = LR;
    ranksep = equally;
+   size = "6,8"
    node [ shape="Mrecord"; width="3.5"; fontname = Courier; ];
 
    "/" [ label = "\N |
@@ -153,6 +154,7 @@ identified by a forward slash (/).
 
    rankdir = LR;
    ranksep = equally;
+   size = "6,8"
    node [ shape="Mrecord"; width="2.5"; fontname = Courier; ];
 
    "/":e    -> "cpus":w
@@ -883,6 +885,7 @@ sits in the logical interrupt tree.
 
    rankdir = LR
    ranksep = "1.5"
+   size = "6,8"
    edge [ dir="none" ]
    node [ shape="Mrecord" width="2.5" ]
 
diff --git a/source/flattened-format.rst b/source/flattened-format.rst
index ccac9335c75d..5b3c6b1f0f1e 100644
--- a/source/flattened-format.rst
+++ b/source/flattened-format.rst
@@ -24,6 +24,7 @@ will resemble the diagram in :numref:`figure_device_tree_structure`
 
    rankdir = LR
    ranksep = "1.5"
+   size = "6,8"
    edge [ dir="none" ]
    node [ shape="Mrecord" width="2.5" ]
 
-- 
2.14.1
