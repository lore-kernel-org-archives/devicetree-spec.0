From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Group all address related properties
Date: Wed,  7 Oct 2020 16:07:20 -0500
Message-ID: <20201007210720.714446-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Group all the address related properties into their own section adding a
description of how addressing works. It's mostly copied from from the
Linux kernel's booting-without-of.rst which we intend to remove as it is
mostly stale or duplicated in the DT spec.

The copied text was originally written by David Gibson according to git,
though the copyright indicates Ben and Becky.

Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 source/chapter2-devicetree-basics.rst | 105 +++++++++++++++++++-------
 source/references.rst                 |   3 +
 2 files changed, 80 insertions(+), 28 deletions(-)

diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devicetree-basics.rst
index 50a6a86ddb44..dd2d845d22a1 100644
--- a/source/chapter2-devicetree-basics.rst
+++ b/source/chapter2-devicetree-basics.rst
@@ -603,6 +603,83 @@ Description:
                   detected.
    ============== ==============================================================
 
+name (deprecated)
+~~~~~~~~~~~~~~~~~
+
+Property name: ``name``
+
+Value type: ``<string>``
+
+Description:
+
+   The *name* property is a string specifying the name of the node. This
+   property is deprecated, and its use is not recommended. However, it
+   might be used in older non-|spec|-compliant devicetrees. Operating
+   system should determine a node’s name based on the *node-name* component of
+   the node name (see :numref:`sect-node-names`).
+
+device_type (deprecated)
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+Property name: ``device_type``
+
+Value type: ``<string>``
+
+Description:
+
+   The *device\_type* property was used in IEEE 1275 to describe the
+   device’s FCode programming model. Because |spec| does not have FCode, new
+   use of the property is deprecated, and it should be included only on ``cpu``
+   and ``memory`` nodes for compatibility with IEEE 1275–derived devicetrees.
+
+.. _sect-addresses:
+
+Address Properties
+------------------
+
+If you choose to describe a bus with the device-tree and there exists an Open
+Firmware bus binding, then you should follow the specification. However, client
+programs do not require every single device or bus to be described by the device
+tree. In particular, devices on discoverable buses are often not described by
+the device tree.
+
+The format of an address for a device is defined by the parent bus type, based
+on the *#address-cells* and *#size-cells* properties. Note that the parent's
+parent definitions of *#address-cells* and *#size-cells* are not inherited so
+every node with children must specify them. Client programs require the root
+node to have those properties defining addresses format for devices directly
+mapped on the processor bus.
+
+Those 2 properties define 'cells' for representing an address and a size. A
+"cell" is a 32-bit number. For example, if both contain 2,  then an address and
+a size are both composed of 2 cells, and each is a 64-bit number (cells are
+concatenated and expected to be in big endian format). Most 32-bit
+implementations should define *#address-cells* and *#size-cells* to 1, which
+represents a 32-bit value. Some 32-bit processors allow for physical addresses
+greater than 32 bits; these processors should define #address-cells as 2.
+
+*reg* properties are always a tuple of the type "address size" where the number
+of cells of address and size is specified by the bus *#address-cells* and
+*#size-cells*. When a bus supports various address spaces and other flags
+relative to a given address allocation (like prefetchable, etc...) those flags
+are usually added to the top level bits of the physical address. For example, a
+PCI physical address is made of 3 cells, the bottom two containing the actual
+address itself while the top cell contains address space indication, flags, and
+pci bus & device numbers.
+
+The *reg* property only defines addresses and sizes (if *#size-cells* is non-0)
+within a given bus. In order to translate addresses upward (that is into parent
+bus addresses, and possibly into CPU physical addresses), all buses must contain
+a *ranges* property. If the *ranges* property is missing at a given level, it's
+assumed that translation isn't possible, i.e., the registers are not visible on
+the parent bus.
+
+For buses that support dynamic allocation, it's the accepted practice to then
+not provide the address in *reg* (keep it 0) though while providing a flag
+indicating the address is dynamically allocated, and then, to provide a separate
+*assigned-addresses* property that contains the fully allocated addresses. See
+the *PCI Bus Supplement*, Version 2.1* [b8]_ for details.
+
 #address-cells and #size-cells
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -824,34 +901,6 @@ Description:
    coherent DMA operations. Some architectures have coherent DMA by default
    and this property is not applicable.
 
-name (deprecated)
-~~~~~~~~~~~~~~~~~
-
-Property name: ``name``
-
-Value type: ``<string>``
-
-Description:
-
-   The *name* property is a string specifying the name of the node. This
-   property is deprecated, and its use is not recommended. However, it
-   might be used in older non-|spec|-compliant devicetrees. Operating
-   system should determine a node’s name based on the *node-name* component of
-   the node name (see :numref:`sect-node-names`).
-
-device_type (deprecated)
-~~~~~~~~~~~~~~~~~~~~~~~~
-
-Property name: ``device_type``
-
-Value type: ``<string>``
-
-Description:
-
-   The *device\_type* property was used in IEEE 1275 to describe the
-   device’s FCode programming model. Because |spec| does not have FCode, new
-   use of the property is deprecated, and it should be included only on ``cpu``
-   and ``memory`` nodes for compatibility with IEEE 1275–derived devicetrees.
 
 .. _sect-interrupts:
 
diff --git a/source/references.rst b/source/references.rst
index 8d8708df7a03..0da877902df0 100644
--- a/source/references.rst
+++ b/source/references.rst
@@ -9,6 +9,9 @@
    0.9, Open Firmware Working Group, 1996
    (http://devicetree.org/open-firmware/practice/imap/imap0_9d.pdf)
 
+.. [b8] *PCI Bus Supplement*, Version 2.1, Open Firmware Working Group, 1998
+   (https://devicetree.org/open-firmware/bindings/pci/pci2_1.pdf)
+
 .. [CHRP] *PowerPC Microprocessor Common Hardware Reference Platform
    (CHRP) Binding*, Version 1.8, Open Firmware Working Group, 1998
    (http://devicetree.org/open-firmware/bindings/chrp/chrp1_8a.ps). This
-- 
2.25.1

