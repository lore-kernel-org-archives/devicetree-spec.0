From: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
Subject: [PATCH RFC 5/5] arm64: dts: qcom: msm8916: Reserve firmware memory
 dynamically
Date: Mon, 15 May 2023 12:12:20 +0200
Message-ID: <20230510-dt-resv-bottom-up-v1-5-3bf68873dbed@gerhold.net>
References: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684145545;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=PG1/HhYRt67ZjjvC3b/0RRaBqAYMx2ZNVcQFqLHzqRo=;
    b=e6GsGuerdYL8cTjyPg0uxiNq163vL1fxE+X9VM7QMXjZ44YbW3lqpUfuvqcemzZSG4
    HQyIv0Xv+GVTB5g6ydUvhrIXxJ43/GAPC3FjVJpRf7BfnYurtUk4tOH3zS6CkwUea/Kh
    Y15Iwgt3viuWbRfA3D4mBmkVfZuoHVaB+yKMnx0iBJNUX/xERZaB8n5GGPS14oMwoHm5
    wehaN2YWsnfFUu25vWoSBZZKO9ERbXPgsQY7EQ+l/PzwA7TnHzKYxWig73mMTSeaxhRY
    FCNALeXZkQ3Xu3SgV9wPJijoIBeevmlhzXVGF026xnjybXWC/sXXin5FLefE8sRZMfQH
    imPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684145545;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=PG1/HhYRt67ZjjvC3b/0RRaBqAYMx2ZNVcQFqLHzqRo=;
    b=0XaHEr06/C9yX8Cr6qL0DbAi7kImA8Lndmyn+KVE2yj7oUVzbVuPmKljvDZAul9y8x
    MItCmQ6Xf7BHmyH1z6BQ==
In-Reply-To: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed-3XONVrnlUWDR7s880joybQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Konrad Dybcio <konrad.dybcio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>

DO NOT APPLY - this is just an example to show the motivation for the
patch series. For clarity only some of the device trees are updated.

Most of the reserved firmware memory on MSM8916 can be relocated when
respecting the required alignment. To avoid having to precompute the
reserved memory regions in every board DT, describe the actual
requirements (size, alignment, alloc-ranges) using the dynamic reserved
memory allocation. Use the new "alloc-bottom-up" option to allocate the
memory contiguously to the other reserved memory regions.

This approach has several advantages:

 1. We can define "templates" for the reserved memory regions in
    msm8916.dtsi and keep only device-specific details in the board DT.
    This is useful for the "mpss" region size for example, which varies
    from device to device. It is no longer necessary to redefine all
    firmware regions to shift their addresses.

 2. When some of the functionality (e.g. WiFi, Bluetooth, modem) is not
    enabled or needed for a device, the reserved memory can stay
    disabled, freeing up the unused reservation for Linux.

 3. Devices with special requirements for one of the firmware regions
    are handled automatically. For example, msm8916-longcheer-l8150
    has non-relocatable "wcnss" firmware that must be loaded exactly
    at address 0x8b600000. When this is defined as a static region,
    the other dynamic allocations automatically adjust to a different
    place with suitable alignment.

All in all this approach significantly reduces the boilerplate necessary
to define the different firmware regions, and makes it easier to enable
functionality on the different devices.

Signed-off-by: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           | 13 +++++++
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      | 36 +++++++++----------
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    | 41 +++++++++------------
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi          | 29 ++++++++-------
 arch/arm64/boot/dts/qcom/msm8916.dtsi              | 42 ++++++++++++++++------
 5 files changed, 96 insertions(+), 65 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index 59860a2223b8..534fc9b2f816 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -310,6 +310,10 @@ &lpass {
 	status = "okay";
 };
 
+&mba_mem {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
@@ -320,6 +324,11 @@ &mpss {
 	firmware-name = "qcom/apq8016/mba.mbn", "qcom/apq8016/modem.mbn";
 };
 
+&mpss_mem {
+	status = "okay";
+	size = <0x0 0x2b00000>;
+};
+
 &pm8916_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
@@ -418,6 +427,10 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
+&wcnss_mem {
+	status = "okay";
+};
+
 /* Enable CoreSight */
 &cti0 { status = "okay"; };
 &cti1 { status = "okay"; };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 4a5eab06c18b..2d2bf255b315 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -29,29 +29,12 @@ chosen {
 	 * fixed address and all other firmware regions are moved to a fitting place.
 	 */
 	reserved-memory {
-		/delete-node/ mpss@86800000;
-		/delete-node/ wcnss@89300000;
-		/delete-node/ venus@89900000;
+		/delete-node/ wcnss;
 
 		wcnss_mem: wcnss@8b600000 {
 			reg = <0x0 0x8b600000 0x0 0x600000>;
 			no-map;
 		};
-
-		venus_mem: venus@8bc00000 {
-			reg = <0x0 0x8bc00000 0x0 0x500000>;
-			no-map;
-		};
-
-		mpss_mem: mpss@8ec00000 {
-			reg = <0x0 0x8ec00000 0x0 0x5000000>;
-			no-map;
-		};
-
-		gps_mem: gps@93c00000 {
-			reg = <0x0 0x93c00000 0x0 0x200000>;
-			no-map;
-		};
 	};
 
 	gpio-keys {
@@ -241,10 +224,23 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&gps_mem {
+	status = "okay";
+};
+
+&mba_mem {
+	status = "okay";
+};
+
 &mpss {
 	status = "okay";
 };
 
+&mpss_mem {
+	status = "okay";
+	size = <0x0 0x5000000>;
+};
+
 &pm8916_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
@@ -294,6 +290,10 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
+&wcnss_mem {
+	status = "okay";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 25ad098b1503..82402689b414 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -36,35 +36,11 @@ chosen {
 	};
 
 	reserved-memory {
-		/delete-node/ mpss@86800000;
-		/delete-node/ wcnss@89300000;
-		/delete-node/ venus@89900000;
-
 		/* Additional memory used by Samsung firmware modifications */
 		tz-apps@85500000 {
 			reg = <0x0 0x85500000 0x0 0xb00000>;
 			no-map;
 		};
-
-		mpss_mem: mpss@86800000 {
-			reg = <0x0 0x86800000 0x0 0x5a00000>;
-			no-map;
-		};
-
-		gps_mem: gps@8c200000 {
-			reg = <0x0 0x8c200000 0x0 0x200000>;
-			no-map;
-		};
-
-		wcnss_mem: wcnss@8c400000 {
-			reg = <0x0 0x8c400000 0x0 0x600000>;
-			no-map;
-		};
-
-		venus_mem: venus@8ca00000 {
-			reg = <0x0 0x8ca00000 0x0 0x500000>;
-			no-map;
-		};
 	};
 
 	gpio-keys {
@@ -287,10 +263,23 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&gps_mem {
+	status = "okay";
+};
+
+&mba_mem {
+	status = "okay";
+};
+
 &mpss {
 	status = "okay";
 };
 
+&mpss_mem {
+	status = "okay";
+	size = <0x0 0x5a00000>;
+};
+
 &pm8916_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
@@ -348,6 +337,10 @@ &wcnss_iris {
 	compatible = "qcom,wcn3660b";
 };
 
+&wcnss_mem {
+	status = "okay";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi b/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
index 50bae6f214f1..ec073cfbb435 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
@@ -16,18 +16,6 @@ chosen {
 		stdout-path = "serial0";
 	};
 
-	reserved-memory {
-		mpss_mem: mpss@86800000 {
-			reg = <0x0 0x86800000 0x0 0x5500000>;
-			no-map;
-		};
-
-		gps_mem: gps@8bd00000 {
-			reg = <0x0 0x8bd00000 0x0 0x200000>;
-			no-map;
-		};
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -91,10 +79,23 @@ &gcc {
 	clocks = <&xo_board>, <&sleep_clk>, <0>, <0>, <0>, <0>, <0>;
 };
 
+&gps_mem {
+	status = "okay";
+};
+
+&mba_mem {
+	status = "okay";
+};
+
 &mpss {
 	status = "okay";
 };
 
+&mpss_mem {
+	status = "okay";
+	size = <0x0 0x5500000>;
+};
+
 &pm8916_usbin {
 	status = "okay";
 };
@@ -126,6 +127,10 @@ &wcnss_iris {
 	compatible = "qcom,wcn3620";
 };
 
+&wcnss_mem {
+	status = "okay";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 7e0fa37a3adf..bc072a0e4d4f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -78,24 +78,44 @@ rfsa@867e0000 {
 			no-map;
 		};
 
-		mpss_mem: mpss@86800000 {
-			reg = <0x0 0x86800000 0x0 0x2b00000>;
+		mpss_mem: mpss {
+			/* size is device-specific */
+			alignment = <0x0 0x400000>;
+			alloc-ranges = <0x0 0x86800000 0x0 0x10000000>;
+			alloc-bottom-up;
 			no-map;
+			status = "disabled";
 		};
-
-		wcnss_mem: wcnss@89300000 {
-			reg = <0x0 0x89300000 0x0 0x600000>;
+		gps_mem: gps {
+			size = <0x0 0x200000>;
+			alignment = <0x0 0x100000>;
+			alloc-ranges = <0x0 0x86800000 0x0 0x10000000>;
+			alloc-bottom-up;
 			no-map;
+			status = "disabled";
 		};
-
-		venus_mem: venus@89900000 {
-			reg = <0x0 0x89900000 0x0 0x600000>;
+		mba_mem: mba {
+			size = <0x0 0x100000>;
+			alignment = <0x0 0x100000>;
+			alloc-ranges = <0x0 0x86800000 0x0 0x10000000>;
+			alloc-bottom-up;
 			no-map;
+			status = "disabled";
 		};
-
-		mba_mem: mba@8ea00000 {
+		wcnss_mem: wcnss {
+			size = <0x0 0x600000>;
+			alignment = <0x0 0x100000>;
+			alloc-ranges = <0x0 0x86800000 0x0 0x10000000>;
+			alloc-bottom-up;
+			no-map;
+			status = "disabled";
+		};
+		venus_mem: venus {
+			size = <0x0 0x500000>;
+			alignment = <0x0 0x100000>;
+			alloc-ranges = <0x0 0x86800000 0x0 0x10000000>;
+			alloc-bottom-up;
 			no-map;
-			reg = <0 0x8ea00000 0 0x100000>;
 		};
 	};
 

-- 
2.40.1

