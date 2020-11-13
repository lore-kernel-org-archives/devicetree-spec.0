From: KwangDeok Son <kdson@zinitix.com>
Subject: [PATCH] dt-bindings: input: Document the Zinitix Touchpad bindigns.
Date: Fri, 13 Nov 2020 19:24:36 +0900
Message-ID: <20201113192436.54e2f2a6@zinitix-H370AORUSGAMING3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec@vger.kernel.org
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, kdson@zinitix.com

Add DT bindings documentation for Zinitix I2C Touchpad.

Signed-off-by: KwangDeok Son <kdson@zinitix.com>

---
diff --git a/Documentation/devicetree/bindings/input/zinitix-touchpad.txt b/Documentation/devicetree/bindings/input/zinitix-touchpad.txt
index e69de29bb2d1..29a3fe9b58cb 100644
--- a/Documentation/devicetree/bindings/input/zinitix-touchpad.txt
+++ b/Documentation/devicetree/bindings/input/zinitix-touchpad.txt
@@ -0,0 +1,28 @@
+Zinitix I2C Touchpad
+
+
+Required properties:
+- compatible: must be "zinitix,zntxtp".
+- reg: I2C address of the chip.
+- interrupts: interrupt to which the chip is connected (see interrupt
+  binding[0]).
+
+
+Optional properties:
+- wakeup-source: touchpad can be used as a wakeup source.
+- vcc-supply: a phandle for the regulator supplying 2.7V to 3.6V power.
+
+[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+[1]: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+
+
+Example:
+	&i2c0 {
+		touchpad@40 {
+			compatible = "zinitix,zntxtp";
+			reg = <0x40>;
+			interrupt-parent = <&gpio>;
+			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+			wakeup-source;
+		};
+	};



