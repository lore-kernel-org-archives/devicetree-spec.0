From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] schemas: clock: Add assigned-clocks description
Date: Thu, 28 Apr 2022 10:26:33 -0500
Message-ID: <20220428152633.2261979-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add description for assigned-clocks properties from clock-binding.txt in
the Linux kernel.

This is relicensed from GPL-2.0 (the default) to BSD-2-Clause. The Cc list
are the original authors.

Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Please ack for the license change.

 dtschema/schemas/clock/clock.yaml | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/dtschema/schemas/clock/clock.yaml b/dtschema/schemas/clock/clock.yaml
index 2416d046087c..5299653b80b6 100644
--- a/dtschema/schemas/clock/clock.yaml
+++ b/dtschema/schemas/clock/clock.yaml
@@ -19,6 +19,44 @@ description: |
   output on a device.  The length of a clock specifier is defined by the
   value of a #clock-cells property in the clock provider node.
 
+  Assigned clock parents and rates
+  --------------------------------
+
+  Some platforms may require initial configuration of default parent clocks
+  and clock frequencies. Such a configuration can be specified in a device tree
+  node through assigned-clocks, assigned-clock-parents and assigned-clock-rates
+  properties. The assigned-clock-parents property should contain a list of parent
+  clocks in the form of a phandle and clock specifier pair and the
+  assigned-clock-rates property should contain a list of frequencies in Hz. Both
+  these properties should correspond to the clocks listed in the assigned-clocks
+  property.
+
+  To skip setting parent or rate of a clock its corresponding entry should be
+  set to 0, or can be omitted if it is not followed by any non-zero entry.
+
+      serial@a000 {
+          compatible = "fsl,imx-uart";
+          reg = <0xa000 0x1000>;
+          ...
+          clocks = <&osc 0>, <&pll 1>;
+          clock-names = "baud", "register";
+
+          assigned-clocks = <&clkcon 0>, <&pll 2>;
+          assigned-clock-parents = <&pll 2>;
+          assigned-clock-rates = <0>, <460800>;
+      };
+
+  In this example the <&pll 2> clock is set as parent of clock <&clkcon 0> and
+  the <&pll 2> clock is assigned a frequency value of 460800 Hz.
+
+  Configuring a clock's parent and rate through the device node that consumes
+  the clock can be done only for clocks that have a single user. Specifying
+  conflicting parent or rate configuration in multiple consumer nodes for
+  a shared clock is forbidden.
+
+  Configuration of common clocks, which affect multiple consumer devices can
+  be similarly specified in the clock provider node.
+
 # always select the core schema
 select: true
 
-- 
2.34.1

