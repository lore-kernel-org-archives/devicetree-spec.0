From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/4] Use fixed column widths for all 4 column property tables
Date: Wed,  6 Dec 2017 12:31:18 -0600
Message-ID: <20171206183120.16700-3-robh@kernel.org>
References: <20171206183120.16700-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171206183120.16700-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We have a mixture of table widths and the auto sizing doesn't want to use
the maximum line width in some Sphinx versions for some reason. We've
already used fixed widths in some places, so just use fixed widths
everywhere.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 source/device-bindings.rst |  8 ++++----
 source/devicenodes.rst     | 18 +++++++++---------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/source/device-bindings.rst b/source/device-bindings.rst
index 9de6f3c6a31a..7210a6ffd933 100644
--- a/source/device-bindings.rst
+++ b/source/device-bindings.rst
@@ -150,7 +150,7 @@ specific representation.
 ``current-speed`` Property
 ^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-.. tabularcolumns:: l J
+.. tabularcolumns:: | l J |
 .. table:: ``current-speed`` Property
 
    =========== ==============================================================
@@ -170,7 +170,7 @@ Serial devices compatible to the National Semiconductor 16450/16550 UART
 (Universal Asynchronous Receiver Transmitter) should be represented in
 the devicetree using following properties.
 
-.. tabularcolumns:: l c l J
+.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
 .. table:: ns16550 UART Properties
 
    ======================= ===== ===================== ===============================================
@@ -393,7 +393,7 @@ specifiers:
         2 = active high level sensitive type enabled
         3 = high to low edge sensitive type enabled
 
-.. tabularcolumns:: | l c l J |
+.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
 .. table:: Open-PIC properties
 
    ======================== ===== ===================== ===============================================
@@ -423,7 +423,7 @@ probed for devices. The devices on the bus can be accessed directly
 without additional configuration required. This type of bus is
 represented as a node with a compatible value of "simple-bus".
 
-.. tabularcolumns:: | l c l J |
+.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
 .. table:: ``simple-bus`` Compatible Node Properties
 
    ======================== ===== ===================== ===============================================
diff --git a/source/devicenodes.rst b/source/devicenodes.rst
index 37db79b9c747..9e2d6d8b029f 100644
--- a/source/devicenodes.rst
+++ b/source/devicenodes.rst
@@ -22,7 +22,7 @@ Root node
 The devicetree has a single root node of which all other device nodes
 are descendants. The full path to the root node is ``/``.
 
-.. tabularcolumns:: | l c l J |
+.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
 .. table:: Root Node Properties
 
    =================== ===== ================= ===============================================
@@ -131,7 +131,7 @@ memory reservations) as WIMG = 0b001x. That is:
 
 If the VLE storage attribute is supported, with VLE=0.
 
-.. tabularcolumns:: | l c l J |
+.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
 .. table:: ``/memory`` Node Properties
 
    ======================= ===== ========================= ===============================================
@@ -202,7 +202,7 @@ The ``/chosen`` node does not represent a real device in the system but
 describes parameters chosen or specified by the system firmware at run
 time. It shall be a child of the root node.
 
-.. tabularcolumns:: | l c l J |
+.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
 .. table:: ``/chosen`` Node Properties
 
    ======================= ===== ===================== ===============================================
@@ -253,7 +253,7 @@ A ``/cpus`` node is required for all devicetrees. It does not represent a
 real device in the system, but acts as a container for child ``cpu`` nodes
 which represent the systems CPUs.
 
-.. tabularcolumns:: | l c l J |
+.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
 .. table:: ``/cpus`` Node Properties
 
    ======================= ===== ===================== ===============================================
@@ -310,7 +310,7 @@ The following table describes the general properties of ``cpu`` nodes. Some
 of the properties described in :numref:`table-cpu-node-props` are select
 standard properties with specific applicable detail.
 
-.. tabularcolumns:: | p{1.5cm} p{1cm} p{2.5cm} p{9.0cm} |
+.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
 .. _table-cpu-node-props:
 .. table:: ``/cpus/cpu*`` Node General Properties
    :class: longtable
@@ -435,7 +435,7 @@ standard properties with specific applicable detail.
    :ref:`sect-standard-properties`) are allowed but are optional.
 
 
-.. tabularcolumns:: | p{1.5cm} p{1cm} p{2.5cm} p{9.0cm} |
+.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
 .. table:: ``/cpus/cpu*`` Node Power ISA Properties
    :class: longtable
 
@@ -503,7 +503,7 @@ The following properties of a cpu node describe the translate look-aside
 buffer in the processor’s MMU.
 
 
-.. tabularcolumns:: | l c l J |
+.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
 .. table:: ``/cpu/cpu*`` Node Power ISA TLB Properties
 
    ============== ===== =========== ===============================================
@@ -546,7 +546,7 @@ Internal (L1) Cache Properties
 The following properties of a cpu node describe the processor’s internal
 (L1) cache.
 
-.. tabularcolumns:: | l c l J |
+.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
 .. table:: ``/cpu/cpu*`` Node Power ISA Cache Properties
 
    ======================= ===== ============= ===============================================
@@ -658,7 +658,7 @@ appropriate location in the devicetree.
 Multiple-level and shared caches are represented with the properties in
 Table 3-9. The L1 cache properties are described in Table 3-8.
 
-.. tabularcolumns:: | l c l J |
+.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
 .. table:: ``/cpu/cpu*/l?-cache`` Node Power ISA Multiple-level and Shared Cache Properties
 
    =============== ===== ============ ===============================================
-- 
2.14.1
