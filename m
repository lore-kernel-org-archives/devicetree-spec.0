From: Michal Simek <michal.simek-5C7GfCeVMHo@public.gmane.org>
Subject: dt_binding_check not reporting all errors
Date: Mon, 24 Apr 2023 18:38:41 +0200
Message-ID: <77db7543-cae4-695c-7c86-6562534d4e87@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nS/ZMm0kKtmhclRTHC4OFTo7RMbgZT1WKs3Te0gVoU=;
 b=AHTG6q1kruUuMSwZpF45ktIRBgEjyreAQZ0FFDJ3z8WGVdHxfKg+syJj1KL7TD4H0txNU0bE8Nmmcj7nJhQYz9EV3jjC+x0qLiBMH+00K1wgOe4QAt5F6Ly8CB0hFsIXzVaCtiOC45TIytuFAQ7lCh1G7skzehz8DpcL1xcsjVg=
Content-Language: en-US
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi,

last week I found that dt_binding_check is not checking all errors with 
compatible string and I have no idea why. I have used 3 systems and behavior is 
pretty much the same.
I am on the top of 6.3 kernel with
dt-validate -V
2023.5.dev3+g31cc52ae483e

And here is the behavior.
Two compatible string I see errors but if I break only one compatible string I 
can't see erros. Not sure if this is issue with dt binding document or with host 
PC setup. Definitely thank you for any hint what to check.

Thanks,
Michal


[linux](master)$ vim Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
[linux](master)$ git diff
diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml 
b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
index 098b73134a1b..fbd9754ab0a3 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
@@ -110,7 +110,7 @@ examples:
          usb@0 {
              #address-cells = <0x2>;
              #size-cells = <0x2>;
-            compatible = "xlnx,zynqmp-dwc3";
+            compatible = "xlnx,zynqmp-dwc32", "xlnx,zynqmp-dwc3";
              reg = <0x0 0xff9d0000 0x0 0x100>;
              clocks = <&zynqmp_clk USB0_BUS_REF>, <&zynqmp_clk USB3_DUAL_REF>;
              clock-names = "bus_clk", "ref_clk";
[linux](master)$ make 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml 
dt_binding_check
   LINT    Documentation/devicetree/bindings
   CHKDT   Documentation/devicetree/bindings/processed-schema.json
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   DTEX    Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dts
   DTC_CHK Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dtb
/dev/shm/linux/Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dtb: 
usb@0: compatible:0: 'xlnx,zynqmp-dwc32' is not one of ['xlnx,zynqmp-dwc3', 
'xlnx,versal-dwc3']
	From schema: /dev/shm/linux/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
/dev/shm/linux/Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dtb: 
usb@0: compatible: ['xlnx,zynqmp-dwc32', 'xlnx,zynqmp-dwc3'] is too long
	From schema: /dev/shm/linux/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml



[linux](master)$ vim Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
[linux](master)$ git diff Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml 
b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
index 098b73134a1b..0b8985bf9b0b 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
@@ -110,7 +110,7 @@ examples:
          usb@0 {
              #address-cells = <0x2>;
              #size-cells = <0x2>;
-            compatible = "xlnx,zynqmp-dwc3";
+            compatible = "xlnx,zynqmp-dwc32";
              reg = <0x0 0xff9d0000 0x0 0x100>;
              clocks = <&zynqmp_clk USB0_BUS_REF>, <&zynqmp_clk USB3_DUAL_REF>;
              clock-names = "bus_clk", "ref_clk";
[linux](master)$ make 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml 
dt_binding_check
   LINT    Documentation/devicetree/bindings
   CHKDT   Documentation/devicetree/bindings/processed-schema.json
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   DTEX    Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dts
   DTC_CHK Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dtb


[linux](master)$ vim Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
[linux](master)$ git diff Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml 
b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
index 098b73134a1b..b6d0d6930a32 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
@@ -110,7 +110,7 @@ examples:
          usb@0 {
              #address-cells = <0x2>;
              #size-cells = <0x2>;
-            compatible = "xlnx,zynqmp-dwc3";
+            compatible = "xlnx,ffdzynqmp-dwc3";
              reg = <0x0 0xff9d0000 0x0 0x100>;
              clocks = <&zynqmp_clk USB0_BUS_REF>, <&zynqmp_clk USB3_DUAL_REF>;
              clock-names = "bus_clk", "ref_clk";
[linux](master)$ make 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml 
dt_binding_check
   LINT    Documentation/devicetree/bindings
   CHKDT   Documentation/devicetree/bindings/processed-schema.json
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   DTEX    Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dts
   DTC_CHK Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dtb


