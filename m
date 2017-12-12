From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Clarify DTB section preable
Date: Tue, 12 Dec 2017 11:08:36 +0000
Message-ID: <20171212110836.31537-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=6ahTx7JUwvhmiYWXHffv4eayBTVoxjY5uaDlG7JFu1I=;
        b=MyUBTomXBcQqIz48RJ1NOahw/gexJws68tcQmbKxyrK7bfZBpQZrbIXPy+MfmDgWjB
         8E2q8+I/TZXLpMhS8jQQyYPtq83sRq8Ekn1LjyNf3YLaXU9bsHYcy9HIVcLr+Gx4tGG/
         1okzqnSWERk7SkKJ5PJpRnx/dWMlCXDhkL2LHDqyC+1JIZuZylUiDbpZAkmHlpkIUtih
         A+dZk1SUiRfSb35xmL5AVXJquS4ryx+kE8vc232Y4xRe3C5CT1HnfSrb4B2c8Ur2NQzQ
         /VLKitsrHq9P4xWTVdtg2gZ5CEPWMuset5QCTJD6j62GVV2RqPwyOtO1jrZjDaFgZ0rG
         A+0Q==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

The DTB chapter used to be titled the "Flattened Devicetree Structure"
chapter, but that seems to be unclear when it is talking about a
specific encoding of devicetree. In this case, the encoding is 'dtb'.
The source format chapter specifies "DTS", so change the start of this
chapter to line up with the DTS chapter.

At the same time, update the introduction to include the source format
chapter.

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
---
 source/flattened-format.rst | 17 ++++++++++++-----
 source/source-language.rst  |  2 +-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/source/flattened-format.rst b/source/flattened-format.rst
index a1c358e..bd98891 100644
--- a/source/flattened-format.rst
+++ b/source/flattened-format.rst
@@ -1,13 +1,20 @@
 .. _chapter-fdt-structure:
 
-Flat Devicetree Physical Structure
+Flattened Devicetree (DTB) Format
 ==================================
 
-With the exception of platforms using IEEE1275 Open Firmware [IEEE1275], the
-devicetree data is contained within a single, linear, pointerless data structure
-known as the flattened devicetree or devicetree blob.
+The Devicetree Blob (DTB) format is a flat binary encoding of devicetree data.
+It used to exchange devicetree data between software programs.
+For example, when booting an operating system, firmware will pass a DTB to the OS kernel.
 
-This data structure consists of a small header
+.. note::
+
+   IEEE1275 Open Firmware [IEEE1275] does not define the DTB format.
+   On most Open Firmware compliant platforms the devicetree is extracted by calling firmware methods
+   to walk through the tree structure.
+
+The DTB format encodes the devicetree data within a single, linear, pointerless data structure.
+It consists of a small header
 (see section :ref:`sect-fdt-header`),
 followed by three variable sized sections:
 the memory reservation block (see section :ref:`sect-fdt-memory-reservation-block`),
diff --git a/source/source-language.rst b/source/source-language.rst
index fd6f8af..8dd9710 100755
--- a/source/source-language.rst
+++ b/source/source-language.rst
@@ -1,6 +1,6 @@
 .. _chapter-devicetree-source-format:
 
-Devicetree Source Format (version 1)
+Devicetree Source (DTS) Format (version 1)
 ================================================
 
 The Devicetree Source (DTS) format is a textual representation of a
-- 
2.11.0
