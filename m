From: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/2] Syntax highlight C and DTS
Date: Fri, 28 Oct 2016 17:12:53 +1100
Message-ID: <1477635173-9292-3-git-send-email-stewart@linux.vnet.ibm.com>
References: <1477635173-9292-1-git-send-email-stewart@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477635173-9292-1-git-send-email-stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Signed-off-by: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@publ=
ic.gmane.org>
---
 source/devicenodes.rst       | 18 +++++++++---------
 source/devicetree-basics.rst | 14 ++++++++------
 source/flattened-format.rst  |  6 +++---
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/source/devicenodes.rst b/source/devicenodes.rst
index e12aa95..78b5bdb 100644
--- a/source/devicenodes.rst
+++ b/source/devicenodes.rst
@@ -91,12 +91,12 @@ considering a string as a device path, shall detect and=
 use the alias.
=20
 **Example**
=20
-::
+.. code-block:: dts
=20
     aliases {
         serial0 =3D "/simple-bus@fe000000/serial@llc500";
         ethernet0 =3D "/simple-bus@fe000000/ethernet@31c000";
-    }
+    };
=20
 Given the alias serial0, a client program can look at the aliases node
 and determine the alias refers to the device path
@@ -168,7 +168,7 @@ and ``#size-cells =3D <2>``.
=20
 **Example #1**
=20
-::
+.. code-block:: dts
=20
     memory@0 {
         device_type =3D "memory";
@@ -178,7 +178,7 @@ and ``#size-cells =3D <2>``.
=20
 **Example #2**
=20
-::
+.. code-block:: dts
=20
     memory@0 {
         device_type =3D "memory";
@@ -234,7 +234,7 @@ time. It shall be a child of the root node.
=20
 **Example**
=20
-::
+.. code-block:: dts
=20
     chosen {
         bootargs =3D "root=3D/dev/nfs rw nfsroot=3D192.168.1.1 console=3Dt=
tyS0,115200";
@@ -618,7 +618,7 @@ Example
=20
 Here is an example of a ``/cpus`` node with one child cpu node:
=20
-::
+.. code-block:: dts
=20
     cpus {
         #address-cells =3D <1>;
@@ -680,7 +680,7 @@ Example
 See the following example of a devicetree representation of two CPUs,
 each with their own on-chip L2 and a shared L3.
=20
-::
+.. code-block:: dts
=20
     cpus {
         #address-cells =3D <1>;
@@ -709,7 +709,7 @@ each with their own on-chip L2 and a shared L3.
                     cache-unified;
                     cache-size =3D <0x40000>; // 256 KB
                     cache-sets =3D <0x400>; // 1024
-                    cache-block-size =3D
+                    cache-block-size =3D <32>;
                     cache-level =3D <3>;
                 };
             };
@@ -730,7 +730,7 @@ each with their own on-chip L2 and a shared L3.
                 cache-unified;
                 cache-size =3D <0x40000>; // 256 KB
                 cache-sets =3D <0x400>; // 1024
-                cache-line-size =3D <32> // 32 bytes
+                cache-line-size =3D <32>; // 32 bytes
                 next-level-cache =3D <&L3>; // phandle to L3
             };
         };
diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
index ba5281c..be80af3 100644
--- a/source/devicetree-basics.rst
+++ b/source/devicetree-basics.rst
@@ -463,7 +463,7 @@ Example:
=20
    See the following devicetree excerpt:
=20
-   ::
+   .. code-block:: dts
=20
       pic@10000000 {
          phandle =3D <1>;
@@ -473,9 +473,11 @@ Example:
    A *phandle* value of 1 is defined. Another device node could reference
    the pic node with a phandle value of 1:
=20
-   ::
+   .. code-block:: dts
=20
-      interrupt-parent =3D <1>;
+      another-device-node {
+        interrupt-parent =3D <1>;
+      };
=20
 .. note:: Older versions of devicetrees may be encountered that contain a
    deprecated form of this property called ``linux,phandle``. For
@@ -557,7 +559,7 @@ Example:
=20
    See the following devicetree excerpt:
=20
-   ::
+   .. code-block:: dts
=20
       soc {
          #address-cells =3D <1>;
@@ -671,7 +673,7 @@ Description:
=20
 Address Translation Example:
=20
-   ::
+   .. code-block:: dts
=20
        soc {
           compatible =3D "simple-bus";
@@ -1084,7 +1086,7 @@ interrupt controller.
=20
 .. _example-interrupt-mapping:
=20
-::
+.. code-block:: dts
=20
    soc {
       compatible =3D "simple-bus";
diff --git a/source/flattened-format.rst b/source/flattened-format.rst
index ba68f8a..ccac933 100644
--- a/source/flattened-format.rst
+++ b/source/flattened-format.rst
@@ -70,7 +70,7 @@ big-endian format.
=20
 **Flattened Devicetree Header Fields**
=20
-::
+.. code-block:: c
=20
         struct fdt_header {
             uint32_t magic;
@@ -208,7 +208,7 @@ The memory reservation block consists of a list of pair=
s of 64-bit
 big-endian integers, each pair being represented by the following C
 structure.
=20
-::
+.. code-block:: c
=20
     struct fdt_reserve_entry {
         uint64_t address;
@@ -273,7 +273,7 @@ The five token types are as follows:
    describing the property. This data consists first of the property=E2=80=
=99s
    length and name represented as the following C structure:
=20
-   ::
+   .. code-block:: c
=20
       struct {
           uint32_t len;
--=20
2.7.4
