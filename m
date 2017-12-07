From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Add GPIO binding
Date: Thu,  7 Dec 2017 17:10:59 +0000
Message-ID: <20171207171059.24845-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=0er0lUF65mpn9c+V+P22IVXUArjoyHzZYHnXNJ/+cpc=;
        b=QebdEDKQ389CvmCngPScjOaHB2GFTv9Or2jBLCX/kLK9CRkzQU0DccU+LmeEM04IFt
         cQg03CUQImLRW2P6bV1PlX7QnOJ5r2xbOZW3ucDl6ks0qIx9IrfA6wzChLLR+m2R+eTK
         wLCUv1qntYG7G+Osg2cX0IPoriXEO/cL1g8oXiBDXDyL02cbKJg//p23UejpnNXOOfPm
         meyxBwtOuQ5fwdDNBl3FYWw8LiYPMzw13SI2mA2JcTf/wF+5oqDqD1QyM27ilK6u8nHx
         FCuRakKnSsA+nC58lf9j5mBOisZqrPvvBPcAM92Y8xPHJFt1Brkm1A4gOGjbESBq+TMN
         DsQA==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

Add the GPIOs binding as described in the Linux kernel. All of the
binding except pinmux has been included. Pinmux is omitted until the
pinmux binding is similar transferred.

The source binding in the Linux kernel tree can be found here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/gpio/gpio.txt

This patch is provided for review, but also as an exploration of
bringing a full binding file over from the Linux freeform text into the
specification document, and it shows the weakness of the current
approach. All of the work done on this patch gives the text more
structure and more formatting options, but it doesn't do anything to
make binding files machine readable. I intend to iterate this patch to
split the binding content off into a machine parsable file that can be
parsed to emit Sphinx markup. This patch can be considered as the
baseline.

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
---
 source/devicetree-basics.rst | 253 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 253 insertions(+)

diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
index 6de1d5d..104178f 100644
--- a/source/devicetree-basics.rst
+++ b/source/devicetree-basics.rst
@@ -1283,3 +1283,256 @@ performed:
 *  That result is looked up in the *interrupt-map* table, which maps to
    the parent interrupt specifier ``<4 1>``.
 
+General Purpose IO (GPIO)
+-------------------------
+
+GPIO signals are modelled in |spec| as a point to point connection between
+a GPIO controller node which provides the GPIO signal,
+and a GPIO consumer node.
+A connection is described with a ``single-gpio`` which is placed in the
+consumer node, and identifies a specific GPIO controller and signal.
+
+In this model, the purpose of a GPIO signal is determined by the GPIO consumer
+node, which is entirely dependant on what device the consumer node represents.
+The GPIO controller does not make any assumptions about how GPIOs will be used.
+For example, an MMC controller may use a GPIO connection to communicate the RW/RO pin state.
+In this case the MMC controller node would identify the specific GPIO signal
+used to detect RW/RO state,
+and the MMC controller driver would know to configure it as an input.
+The GPIO controller node has no knowledge of how the pin should be used and
+merely provides a pin control interface to the MMC driver.
+
+To conform to the generic GPIO binding, both the GPIO controller and consumer
+nodes must conform to this binding as detailed below.
+
+GPIO Definitions
+^^^^^^^^^^^^^^^^
+
+.. tabularcolumns:: | l l J |
+.. table:: GPIO Binding Datatype Definitions
+
+   =================== ============================== ================================================
+   Type                Definition                     Description
+   =================== ============================== ================================================
+   ``gpio-list``       ``single-gpio [gpio-list]``    Array of one or more ``gpio-single``.
+   ``single-gpio``     ``<phandle> <gpio-specifier>`` Reference to a single GPIO signal specifying
+                                                      both GPIO controller (``phandle``) and GPIO
+                                                      signal from that controller (``gpio-specifier``)
+   ``gpio-specifier``  ``<u32>[0..#gpio-cells]``      Array of ``cells``. Array size defined by
+                                                      value of *#gpio-cells* in GPIO controller node.
+                                                      In other words, the size of a ``gpio-specifier``
+                                                      is dependent on the GPIO controller.
+   =================== ============================== ================================================
+
+A ``gpio-specifier`` is an array of 1 or more ``cells`` indicating the specific GPIO signal and configuration of that signal.
+The GPIO controller binding must describe what information is encoded into its gpio-specifier,
+which could include bank number, pin position, driver configuration, or signal inversion.
+Typically a GPIO controller will set ``#gpio-cells=<2>``, with the first cell encoding the signal number,
+and the second encoding flags for pin configuration.
+
+GPIO Consumer Nodes
+^^^^^^^^^^^^^^^^^^^
+
+GPIO consumers use properties named *<name>-gpios* to hold a ``gpio-list``.
+The purpose of each GPIO reference is defined by the consumer device binding,
+and is expected to be documented as part of that binding.
+The ``<name>`` part should refer to the function of the GPIO signal
+
+Normally each *<name>-gpios* property contains only one GPIO reference,
+and bindings should use different *<name>* values for each GPIO function.
+However, if multiple GPIOs are used for the same function (e.g. an set of
+parallel IO lines) then a *<name>-gpios* property may reference multiple
+GPIO signals.
+
+Some older bindings use *gpio*, *gpios* or *<name>-gpio* properties to hold
+the ``gpio-list``.
+These property names are deprecated and should not be used in new GPIO consumer bindings.
+
+.. tabularcolumns:: | l c l J |
+.. table:: GPIO Consumer Properties
+
+   =================== ===== ================= ================================================
+   Property Name       Usage Value Type        Definition
+   =================== ===== ================= ================================================
+   ``<name>-gpios``    R     ``<gpio-list>``   Reference to a GPIO signal.
+                                               ``name`` should reference the GPIO function.
+   ``<name>-gpio``     O     ``<single-gpio>`` Deprecated
+   ``gpios``           O     ``<gpio-list>``   Deprecated
+   ``gpio``            O     ``<single-gpio>`` Deprecated
+   Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
+   ============================================================================================
+
+GPIO Consumer Example
+~~~~~~~~~~~~~~~~~~~~~
+
+.. code-block:: dts
+
+    gpio1: gpio1 {
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+    gpio2: gpio2 {
+        gpio-controller;
+        #gpio-cells = <1>;
+    };
+
+    gpio-consumer {
+        enable-gpios = <&gpio2 2>;
+        data-gpios = <&gpio1 12 0>,
+                     <&gpio1 13 0>,
+                     <&gpio1 14 0>,
+                     <&gpio1 15 0>;
+    };
+
+
+GPIO Controller Nodes
+^^^^^^^^^^^^^^^^^^^^^
+
+Every GPIO controller node must contain an empty *gpio-controller* property,
+and a *gpio-cells* integer property, which indicates the number of cells in a
+``single-gpio``.
+
+.. tabularcolumns:: | l c l J |
+.. table:: GPIO Controller Properties
+
+   =================== ===== ================= ================================================
+   Property Name       Usage Value Type        Definition
+   =================== ===== ================= ================================================
+   ``#gpio-cells``     R     ``<u32>``         Specifies the number of ``<u32>`` cells to
+                                               represent the address in the ``reg`` property in
+                                               children of root.
+   ``gpio-controller`` R     ``<empty>``       Declares the device as a GPIO controller that
+                                               can be referenced using a ``single-gpio``
+   ``ngpios``          OR    ``<u32>``         Optional property describing the number
+                                               of GPIO signals provided by the controller.
+                                               This property may be used when the controller
+                                               provides fewer signals than the driver binding
+                                               supports. For example, a MMIO GPIO controller
+                                               with 32-bit registers might theoretically
+                                               support 32 GPIO signals, but only numbers 0
+                                               through 11 wired up. In this case
+                                               "ngpios = <12>;" should be set.
+   ``gpio-line-names`` O     ``<stringlist>``  An array of names for each of the GPIO signals
+                                               provided by the controller. This name should be
+                                               the most meaningful producer name for the
+                                               system, such as a rail name indicating the
+                                               usage. Package names such as pin names are
+                                               discouraged. For example, "MMC-CD",
+                                               "Red LED Vdd" and "Ethernet RST" are reasonable
+                                               line names as they describe what the line is
+                                               used for. Names like "GPIO0" are discouraged.
+                                               Additionally, placeholder names are discouraged.
+                                               If a signal does not have a name defined, then
+                                               use "" (blank string) as the placeholder.
+   Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
+   ============================================================================================
+
+GPIO Specifier Best Practices
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+How a ``gpio-specifier`` is encoded is defined by the GPIO controller binding,
+and so it allows quite a bit of flexibility to encode extra information required
+by the interrupt controller into the ``gpio-specifier`` itself.
+However, most GPIO controllers encode the same information so it is strongly recommended
+to follow established convention for ``gpio-specifier`` format.
+
+Established convention for ``gpio-specifier`` is to use either 2 or 3 cells to describe
+a GPIO signal depending on whether or not the GPIO controller provides multiple "banks"
+of GPIO registers.
+If the controller does use banks, then 3 cells should be used with the bank encoded
+into the first cell, the pin within the bank in the second, and the flags in the third
+cell.
+If the controller does not use banks, then 2 cells are sufficient; the first cell
+encoding the signal number and the second encoding the flags.
+
+Standard encoding for the flags cell are as follows
+
+.. tabularcolumns:: | l J |
+.. table:: GPIO Standard Flags Bitfield
+
+   ========== ========================================================================
+   Bit number Meaning
+   ========== ========================================================================
+   0 (LSB)    Signal Polarity - 0 Means Active High. 1 Means Active Low
+   1          Driver type - 0 means push-pull. 1 means single-ended
+   2          Input type - 0 means open-source, 1 means open-drain
+   3          Sleep mode - 0 means state must be maintained during sleep/low-power
+              1 means state can be losts after sleep/low-power
+   ========== ========================================================================
+
+Example
+~~~~~~~
+
+Here is an example of a simple memory mapped GPIO controller
+
+.. code-block:: dts
+
+    gpio-controller@c8008000 {
+        compatible = "acme,gpio";
+        reg = <0xc8008000 0x1000};
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <18>;
+        gpio-line-names = "MMC-CD", "MMC-WP", "VDD eth", "RST eth", "LED R",
+                          "LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
+                          "Row A", "Row B", "Row C", "Row D", "NMI button",
+                          "poweroff", "reset";
+    };
+
+GPIO Hogging
+~~~~~~~~~~~~
+
+A GPIO controller may provide automatic configuration information for one or more GPIO
+signals by adding ``GPIO hog`` child nodes.
+GPIO hogging informs the GPIO controller driver that some pins must be configured in a
+particular way at driver initialization time, without requiring a reference from a GPIO
+consumer node.
+
+.. tabularcolumns:: | l c l J |
+.. table:: GPIO Hog Child Node Properties
+
+
+   =================== ===== ======================== ================================================
+   Property Name       Usage Value Type               Definition
+   =================== ===== ======================== ================================================
+   ``gpio-hog``        R     ``<empty>``              Declares the child node as a GPIO hog node
+                                                      containing GPIO configuration information.
+   ``gpios``           R     ``<prop-encoded-array>`` Array of ``gpio-specifier`` listing a set
+                                                      of GPIOs to be preconfigured at initialization
+                                                      time.
+   ``input``           O     ``<empty>``              indicates listed GPIOs must be configured as
+                                                      inputs.
+   ``output-low``      O     ``<empty>``              indicates listed GPIOs must be configured as
+                                                      output driven low.
+                                                      ``output-low`` has no effect if the ``input``
+                                                      property is present.
+   ``output-high``     O     ``<empty>``              indicates listed GPIOs must be configured as
+                                                      output driven high.
+                                                      ``output-high`` has no effect if either the
+                                                      ``input`` or ``output-low`` properties are
+                                                      present.
+   ``line-name``       O     ``<string>``             The GPIO label name. If omitted, the GPIO hog
+                                                      node name is used.
+   Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
+   ===================================================================================================
+
+GPIO Hogging Example
+~~~~~~~~~~~~~~~~~~~~
+
+.. code-block:: dts
+
+    qe_pio_a: gpio-controller@1400 {
+        compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
+        reg = <0x1400 0x18>;
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        line_b {
+            gpio-hog;
+            gpios = <6 0>;
+            output-low;
+            line-name = "foo-bar-gpio";
+        };
+    };
+
-- 
2.11.0
