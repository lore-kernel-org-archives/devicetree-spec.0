From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [DTSpec PATCH] Add items to Devicetree Source Format chapter
Date: Fri, 3 Jun 2016 12:29:19 -0700
Message-ID: <5751DA8F.2090708@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=381gQz2+azX2Zjn02eEkPLP0xwvXTe+j6sdBjdS/Fvs=;
        b=bA03iermRFjcqRndGaXgm2nthBUh0burqHrFvvLysRtj0lM/BOyRVHwvBqdPfZQo1L
         UPdhc1vbnY17dIvCIaK7aGaaXTbVPUzINVx5zoIbVBQCD+sOltJUtt9DC7L/CZthbNUL
         LstpMB+TkD+uYHDzRmjJQcFLZOKu7/JsQgxKeHs4IW/SxSXuYjActrM2stxEp0IXd6Ew
         TcL5PekogM4Q/281OO9FDBthA5aG+gz0afHEC6BgwKksClOt46zPVkWvYzx1rmOB/mqJ
         dIIS3Mij4lmNwWMGCacsAsRqYuaWiUo+pfkLnFzo2pGBb1aAn8ipenlxVyYQRknu6RGF
         tnng==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

Add items to Devicetree Source Format chapter

- Add naming convention for DTS files and DTS include files
- Add /include/ compiler directive
- Add ";" to end of node definition
- Add /delete-node/ and /delete-property/
- Add arithmetic, bitwise, and logical expressions

Note that cpp directives are not included in this patch, and
are not yet specified in this appendix.

Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
---
 source/source-language.rst |   60 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

Index: b/source/source-language.rst
===================================================================
--- a/source/source-language.rst
+++ b/source/source-language.rst
@@ -9,6 +9,19 @@ devicetree in the form expected by the k
 not a formal syntax definition of DTS, but describes the basic
 constructs used to represent devicetrees.
 
+The name of DTS files should end with ".dts".
+
+Compiler directives
+-------------------
+
+Other source files can be included from a DTS file.  The name of include
+files should end with ".dtsi".  Included files can in turn include
+additional files.
+
+::
+
+    /include/ "FILE"
+
 Node and property definitions
 -----------------------------
 
@@ -21,11 +34,18 @@ preceded by a label.
     [label:] node-name[@unit-address] {
         [properties definitions]
         [child nodes]
-    }
+    };
 
 Nodes may contain property definitions and/or child node definitions. If
 both are present, properties shall come before child nodes.
 
+Previously defined nodes may be deleted.
+
+::
+
+    /delete-node/ node-name;
+    /delete-node/ &label;
+
 Property definitions are name value pairs in the form:
 
 ::
@@ -39,6 +59,12 @@ form:
 
         [label:] property-name;
 
+Previously defined properties may be deleted.
+
+::
+
+    /delete-property/ property-name;
+
 Property values may be defined as an array of 32-bit integer cells, as
 null-terminated strings, as bytestrings or a combination of these.
 
@@ -48,6 +74,38 @@ null-terminated strings, as bytestrings
 ::
 
         interrupts = <17 0xc>;
+-  values may be represented as arithmetic, bitwise, or logical expressions
+   within parenthesis.
+
+::
+
+    Arithmetic operators
+
+    +   add
+    -   subtract
+    *   multiply
+    /   divide
+    <<  left shift
+    >>  right shift
+
+::
+
+    Bitwise operators
+
+    &&   and
+    ||   or
+
+::
+
+    Logical operators
+
+    <    less than
+    >    greater than
+    <=   less than or equal
+    >=   greater than or equal
+    ==   equal
+    !=   not equal
+
 
 -  A 64-bit value is represented with two 32-bit cells. Example:
 
