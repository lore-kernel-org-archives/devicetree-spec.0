From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [DTSpec PATCH v3] Add items to Devicetree Source Format chapter
Date: Wed, 8 Jun 2016 10:44:25 -0700
Message-ID: <57585979.1050402@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=lsAmhmI2iHSIY090PPTTw2FtFLoBLN8JFGB8TaFGyzY=;
        b=d0etYgRoEqf7W60wfsbW/0Xbgw7f7zGuc3LZNIP7EP08npv+bHY7/ITxidvdEAGeNo
         fHtwLxt1cazLsHcspbFs+k1bLS8VpZGiqnifmd6CTMqPMXyGFTX4hmPChYWcl5jEuIX1
         oIBp107rV+v1UZsMKDYloaUozVYxtTOuS5RHr93JB5oJvtUvKl3HJAc1jgklEsD8xkY6
         1itT8irswW/5T6CGceFt+yrzGOB6Jlf+sYcchkM5btthDkwzZriWk3EqHJ4GiTDbyzC+
         9rvnFCl+D3vrCG998ZOEOzpaWaj5r/kooeaF2aVie76KnXRjLmEiR3Sv0kIwM3i04YSr
         E6zA==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

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

changes in v3
  - moved relational operators out of logical operators list into a
    relational operators list

changes in v2
  - arithmetic operators "and", "or" were incorrectly listed as as bitwise
  - thus bitwise operators "and", "or" were incorrectly shown
  - "exclusive or" operator added
  - logical and arithmetic "not" operators added
  - ternary operator added
  - moved shift operators from arithmetic to bitwise


 source/source-language.rst |   75 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

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
 
@@ -48,6 +74,53 @@ null-terminated strings, as bytestrings
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
+    &&   and
+    ||   or
+    !    not
+
+::
+
+    Relational operators
+
+    <    less than
+    >    greater than
+    <=   less than or equal
+    >=   greater than or equal
+    ==   equal
+    !=   not equal
+
+::
+
+    Ternary operators
+
+    ?:   (condition ? value_if_true : value_if_false)
 
 -  A 64-bit value is represented with two 32-bit cells. Example:
 
