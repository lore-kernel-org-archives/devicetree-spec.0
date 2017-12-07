From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Spelling fixes
Date: Thu,  7 Dec 2017 08:57:46 -0600
Message-ID: <20171207145746.8393-1-robh@kernel.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Fix a number of spelling errors.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 source/device-bindings.rst   | 2 +-
 source/devicenodes.rst       | 6 +++---
 source/devicetree-basics.rst | 2 +-
 source/flattened-format.rst  | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/source/device-bindings.rst b/source/device-bindings.rst
index 7210a6ffd933..f47b184cfa5c 100644
--- a/source/device-bindings.rst
+++ b/source/device-bindings.rst
@@ -280,7 +280,7 @@ Network Class Binding
    Property    ``max-frame-size``
    =========== ==============================================================
    Value type  ``<u32>``
-   Descriptio  Specifies maximum packet length in bytes that the physical
+   Description Specifies maximum packet length in bytes that the physical
                interface can send and receive.
    Example     ``max-frame-size = <1518>;``
    =========== ==============================================================
diff --git a/source/devicenodes.rst b/source/devicenodes.rst
index 9e2d6d8b029f..b161f076751a 100644
--- a/source/devicenodes.rst
+++ b/source/devicenodes.rst
@@ -347,7 +347,7 @@ standard properties with specific applicable detail.
                                                    program should modify PIR to match the *reg*
                                                    property value. If PIR cannot be modified and
                                                    the PIR value is distinct from the interrupt
-                                                   controller numberspace, the CPUs binding may
+                                                   controller number space, the CPUs binding may
                                                    define a binding-specific representation of
                                                    PIR values if desired.
    ``clock-frequency``    | R   | array            Specifies the current clock speed of the CPU
@@ -386,7 +386,7 @@ standard properties with specific applicable detail.
                                                    CPUs, nor can its state be affected by the
                                                    normal operation of other running CPUs, except
                                                    by an explicit method for enabling or
-                                                   reenabling the quiescent CPU (see the
+                                                   re-enabling the quiescent CPU (see the
                                                    enable-method property).
 
                                                    In particular, a running CPU shall be able to
@@ -417,7 +417,7 @@ standard properties with specific applicable detail.
                                                       required format is: ``"[vendor],[method]"``,
                                                       where vendor is a string describing the name of
                                                       the manufacturer and method is a string
-                                                      describing the vendorspecific mechanism.
+                                                      describing the vendor specific mechanism.
 
                                                    Example: ``"fsl,MPC8572DS"``
 
diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
index b5b331680606..6de1d5da846b 100644
--- a/source/devicetree-basics.rst
+++ b/source/devicetree-basics.rst
@@ -1262,7 +1262,7 @@ node with a specified parent unit address and interrupt specifier.
 
 In this example, the interrupt-map-mask property has a value of ``<0xf800
 0 0 7>``. This mask is applied to a child unit interrupt specifier before
-performing a lookup in the interruptmap table.
+performing a lookup in the *interrupt-map* table.
 
 To perform a lookup of the open-pic interrupt source number for INTB for
 IDSEL 0x12 (slot 2), function 0x3, the following steps would be
diff --git a/source/flattened-format.rst b/source/flattened-format.rst
index 5b3c6b1f0f1e..a82e502211f1 100644
--- a/source/flattened-format.rst
+++ b/source/flattened-format.rst
@@ -246,7 +246,7 @@ Lexical structure
 ~~~~~~~~~~~~~~~~~
 
 The structure block is composed of a sequence of pieces, each beginning
-with a token, that is, a bigendian 32-bit integer. Some tokens are
+with a token, that is, a big-endian 32-bit integer. Some tokens are
 followed by extra data, the format of which is determined by the token
 value. All tokens shall be aligned on a 32-bit boundary, which may
 require padding bytes (with a value of 0x0) to be inserted after the
@@ -359,7 +359,7 @@ Strings Block
 -------------
 
 The strings block contains strings representing all the property names
-used in the tree. These nullterminated strings are simply concatenated
+used in the tree. These null terminated strings are simply concatenated
 together in this section, and referred to from the structure block by an
 offset into the strings block.
 
-- 
2.14.1
