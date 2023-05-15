From: Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH RFC 4/5] arm64: dts: qcom: msm8916: Enable modem on two
 phones
Date: Mon, 15 May 2023 12:12:19 +0200
Message-ID: <20230510-dt-resv-bottom-up-v1-4-3bf68873dbed@gerhold.net>
References: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684145545;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=3LlKTLyOPLCsMajuxocSXbDRZ9+pHs4RCOi8py6qtBg=;
    b=kYuWwP8RTvUBZFdkPMyR485etSDWgsiFGYHAItORqhf3cW58TJfaLY2NZPDxSSWGRX
    wuAhoxb07970pDU05wpHpRB1Xed+NPnvCITpNNG+yDwND6DqD501jpbyrAhMJX1Pm5qz
    oCtmA3W573E3Fya9zW5h+cBghK/eB0x/D7sePbujdkFLGY2XUTAMo47xoperDLinX3EJ
    Xc0x4VQAAgP94wnC+VwSx6IpqqRGVFrNBsqzNYxh/EDgQ9LFvTWwSXNj0dV+VchPNypL
    QwfJWmDQAuo6DMmaGfwN+jItj70PXlG/VZmzhPlY19fc2NHAs7FkCT21S2gxE3q/ZR92
    Sapg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684145545;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=3LlKTLyOPLCsMajuxocSXbDRZ9+pHs4RCOi8py6qtBg=;
    b=SoA2ZDBVnycnBaA/jyKIPH3jOB+OlGcurcQXn89npJE4BewPTk4p2DSSEdiVRV+/oN
    WQnkCGapzkf3VsdTVVCA==
In-Reply-To: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed@gerhold.net>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, devicetree@vger.kernel.org, devicetree-spec@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>

DO NOT APPLY - this is just an example to show the motivation for the
patch series. For clarity only some of the device trees are updated.

On MSM8916 there are different independent firmware regions, e.g. for
the modem (mpss), WiFi/Bluetooth (wcnss) or video acceleration (venus).
They need a specific size but the address is relocatable within a
certain memory region as long as the necessary alignment is respected.

The modem firmware size varies from device to device depending on the
available functionality. Right now msm8916.dtsi specifies the firmware
sizes for the DragonBoard 410c SBC, which has smaller firmware because
the modem firmware only implements GPS but not LTE etc.

The modem firmware is much larger on actual smartphones. Unfortunately,
changing the modem/mpss reserved memory size requires shifting all
following reserved memory regions to new addresses as well, even though
the size for the wcnss/venus firmware is the same for all devices.

This introduces quite a lot of churn with many magic addresses and room
for errors. Only two devices are shown in the example below, but similar
diffs would need to be applied to 30+ more similar MSM8916 device trees.

Note that msm8916-longcheer-l8150 is a single exception where the wcnss
firmware is not relocatable and must be loaded at a specific address.
It is included here to show that the dynamic reserved memory allocation
in the next patch handles this automatically.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      | 29 +++++++++++++++++++++-
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    | 28 +++++++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index f1dd625e1822..4a5eab06c18b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -21,14 +21,37 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	/*
+	 * For some reason, the wcnss firmware is not relocatable, so it must be
+	 * loaded at 0x8b600000. Unfortunately this overlaps with the memory
+	 * region usually used for the modem firmware (0x86800000-0x8b800000).
+	 * However, the modem firmware is relocatable, so wcnss is placed at the
+	 * fixed address and all other firmware regions are moved to a fitting place.
+	 */
 	reserved-memory {
-		/* wcnss.mdt is not relocatable, so it must be loaded at 0x8b600000 */
+		/delete-node/ mpss@86800000;
 		/delete-node/ wcnss@89300000;
+		/delete-node/ venus@89900000;
 
 		wcnss_mem: wcnss@8b600000 {
 			reg = <0x0 0x8b600000 0x0 0x600000>;
 			no-map;
 		};
+
+		venus_mem: venus@8bc00000 {
+			reg = <0x0 0x8bc00000 0x0 0x500000>;
+			no-map;
+		};
+
+		mpss_mem: mpss@8ec00000 {
+			reg = <0x0 0x8ec00000 0x0 0x5000000>;
+			no-map;
+		};
+
+		gps_mem: gps@93c00000 {
+			reg = <0x0 0x93c00000 0x0 0x200000>;
+			no-map;
+		};
 	};
 
 	gpio-keys {
@@ -218,6 +241,10 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&mpss {
+	status = "okay";
+};
+
 &pm8916_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 1a41a4db874d..25ad098b1503 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -36,11 +36,35 @@ chosen {
 	};
 
 	reserved-memory {
+		/delete-node/ mpss@86800000;
+		/delete-node/ wcnss@89300000;
+		/delete-node/ venus@89900000;
+
 		/* Additional memory used by Samsung firmware modifications */
 		tz-apps@85500000 {
 			reg = <0x0 0x85500000 0x0 0xb00000>;
 			no-map;
 		};
+
+		mpss_mem: mpss@86800000 {
+			reg = <0x0 0x86800000 0x0 0x5a00000>;
+			no-map;
+		};
+
+		gps_mem: gps@8c200000 {
+			reg = <0x0 0x8c200000 0x0 0x200000>;
+			no-map;
+		};
+
+		wcnss_mem: wcnss@8c400000 {
+			reg = <0x0 0x8c400000 0x0 0x600000>;
+			no-map;
+		};
+
+		venus_mem: venus@8ca00000 {
+			reg = <0x0 0x8ca00000 0x0 0x500000>;
+			no-map;
+		};
 	};
 
 	gpio-keys {
@@ -263,6 +287,10 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&mpss {
+	status = "okay";
+};
+
 &pm8916_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;

-- 
2.40.1

