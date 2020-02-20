From: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] Explain what kind of bitmask is used in masks
Date: Thu, 20 Feb 2020 22:14:42 +0100
Message-ID: <20200220211442.31214-1-arkadiusz@drabczyk.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Signed-off-by: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
---
 source/devicetree-basics.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
index 01b1958..bbb236a 100644
--- a/source/devicetree-basics.rst
+++ b/source/devicetree-basics.rst
@@ -1163,7 +1163,7 @@ Value type: ``<prop-encoded-array>`` encoded as a bit mask
 Description:
 
    An *interrupt-map-mask* property is specified for a nexus node in the
-   interrupt tree. This property specifies a mask that is applied to the
+   interrupt tree. This property specifies a mask that is ANDed with the
    incoming unit interrupt specifier being looked up in the table specified
    in the *interrupt-map* property.
 
@@ -1366,7 +1366,7 @@ Value type: ``<prop-encoded-array>`` encoded as a bit mask
 Description:
 
    A *<specifier>-map-mask* property may be specified for a nexus node.
-   This property specifies a mask that is applied to the child unit
+   This property specifies a mask that is ANDed with the child unit
    specifier being looked up in the table specified in the *<specifier>-map*
    property. If this property is not specified, the mask is assumed to be
    a mask with all bits set.
-- 
2.9.0

