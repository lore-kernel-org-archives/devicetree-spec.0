From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [DTSpec PATCH v2] Add items to Devicetree Source Format chapter
Date: Tue, 7 Jun 2016 13:49:59 -0700
Message-ID: <57573377.4010001@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=9A8c96RNrBT25FA8eMZH5x3/zSmzQdnrl9oZ77ojUbI=;
        b=eTLwqW9Ja5j2Jyz3NoqQoVeH74j1OwTSP6IZk2pJAuwGRDT94qNEWFBAVBCM1c7P1C
         8XRNHq/F60ot8vhXCrYoW/8rOBI/K3b4K3Rc7RJ4O8uRwNTJKMTuj4YQktjVqn064ux2
         FovW/55iUUQes6BWEI4IhiE5pR2LKSq6cXg3pTLiJ2B+5DTPcrTFqN2f52fDHkUZswvL
         qXCfnEtBdfL34takg7HeONgTJc5SXCpeXhlLFHMsem9qrunZtvMHkoJY6WZX22Al5Zf+
         n5MH5zpQjdf0Gcf/pTFMySCOeeE4Q94X6Yltjo0mq79mY5qixaUyS5N+t5duCwXNHnsr
         /mwg==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

Add items to Devicetree Source Format chapter

- Add naming convention for DTS files and DTS include files
- Add /include/ compiler directive
- Add ";" to end of node definition
- Add /delete-node/ and /delete-property/
- Add arithmetic, bitwise, logical, and ternary expressions

Note that cpp directives are not included in this patch, and
are not yet specified in this appendix.

Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
---

changes in v2
  - arithmetic operators "and", "or" were incorrectly listed as as bitwise
  - thus bitwise operators "and", "or" were incorrectly shown
  - "exclusive or" operator added
  - logical and arithmetic "not" operators added
  - ternary operator added
  - moved shift operators from arithmetic to bitwise


 source/source-language.rst |   70 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

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
 
@@ -48,6 +74,48 @@ null-terminated strings, as bytestrings
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
+
+::
+
+    Bitwise operators
+
+    &    and
+    |    or
+    ^    exclusive or
+    ~    not
+    <<  left shift
+    >>  right shift
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
+    &&   and
+    ||   or
+    !    not
+
+::
+
+    Ternary operators
+
+    ?:   (condition ? value_if_true : value_if_false)
 
 -  A 64-bit value is represented with two 32-bit cells. Example:
 
