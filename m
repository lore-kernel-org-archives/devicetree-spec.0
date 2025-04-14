Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DC12522B8;
	Mon, 14 Apr 2025 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744648478; cv=none; b=C8l441I5iw0yojGl2Onw9hb7YMB5nOUDrY81R2d19jQ9hWnRBgQNdD1n/1F1jpKoSrfYXqlRjjPfdwbf/UyXR6soUjI7Wjug6ZS2v4+5Yp2EWOIlSSDuBkNOEDAXkzZRpf1ibu3UoGDFHdBA1NlnmT2yzYXwq3FE8X5Y8rgE/y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744648478; c=relaxed/simple;
	bh=LO4DuLl+X4EDJOQ3IPIbUUECY8EfcbE5aDFZ4A9HCME=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RwNYjZkXYfCy6yZw+VoJziP7T2Fla31e1O8LbZs1tMMNHh3H6XcAgUmvre758kgWGzVoNwmGBI9vXzqVR5tp0wmmfrjo/Gz66atNHbQ7oh0sxyCsgfzi1ldClw4fKpeYPgKeip8ZfpHG6vpbr7cN0e6Aq9VbodS2fUTI2s9unNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FsO/eT1K; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FsO/eT1K"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53EGY6512742853
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 11:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744648447;
	bh=L1aNQk/iCKA2V1iY/QZK/8uT/8a/Tc3AoV8XYwN7UpM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FsO/eT1KkVYnAJw0Tpi+Kb6Kacesnn5hovBEtJ+iFt7eYs577mbI3fVzNjTghqsA5
	 5nDQyouI5Ok5Khf59AIBXYEwfHkZLzq/oxUkIHGNe0WFOEi7F98FREZy+Wbllks9bu
	 VMTyTUppXnem+Idea7QvMlsGcaRNfY95b80XYMTE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53EGY6nM031533
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 11:34:06 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 11:34:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 11:34:05 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53EGY5uF033867;
	Mon, 14 Apr 2025 11:34:05 -0500
Message-ID: <17e41207-251b-483a-9c15-a9a5d2626755@ti.com>
Date: Mon, 14 Apr 2025 11:34:05 -0500
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Add new `export-symbols` node
To: Herve Codina <herve.codina@bootlin.com>,
        Ayush Singh
	<ayush@beagleboard.org>
CC: Jason Kridner <jkridner@beagleboard.org>,
        Deepak Khatri
	<lorforlinux@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        <nenad.marinkovic@mikroe.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Robert Nelson <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        David
 Gibson <david@gibson.dropbear.id.au>,
        Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Grant Likely <grant.likely@secretlab.ca>, Dhruva Gole <d-gole@ti.com>,
        <devicetree-spec@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250411-export-symbols-v3-1-f59368d97063@beagleboard.org>
 <0d25b3d4-7735-4e35-8553-d6e64b8ad8f7@ti.com>
 <d78e60f2-e2e5-4e6a-9724-68cc0481fd77@beagleboard.org>
 <20250414164617.51038dd4@bootlin.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250414164617.51038dd4@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/14/25 9:46 AM, Herve Codina wrote:
> Hi Ayush, David,
> 
> On Sat, 12 Apr 2025 00:19:16 +0530
> Ayush Singh <ayush@beagleboard.org> wrote:
> 
>> On 4/11/25 23:09, Andrew Davis wrote:
>>
>>> On 4/11/25 3:00 AM, Ayush Singh wrote:
>>>> `export-symbols` is designed to be a local replacement of global
>>>> `__symbols__` allowing nodes to define aliases to nodes in a tree, which
>>>> will take precedence over the aliases defined in the global
>>>> `__symbols__`.
>>>>
>>>> Having a way to allow node local aliases helps in usecases such as
>>>> connectors and addon-boards, by allowing decoupling of
>>>> overlays/devicetree nodes of addon-board from the base connector.
>>>>
>>>> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
>>>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>>>> ---
>>>> This patch series follows the initial RFC [9] sent a few weeks ago. I
>>>> will be reiterating the RFC here for anyone who might be seeing this the
>>>> first time, since there was not much feedback in that thread.
>>>>   
>>>
>>> I think this is a useful tool in the effort to build a complete
>>> addon-board
>>> solution. But I'm still missing how it all fits together, do you have
>>> a real
>>> working overlay making use of this somewhere I could take a look at?
>>> Maybe
>>> an overlay for one of the addon-boards you list below (one of the
>>> BeagleCapes
>>> for instance).
>>>
> 
> We (me and Luca) have a working device-tree and overlay.
> 
> Our base device tree is the following (simplified but relevant part for
> this topic are available):
> / {
> 	...
> 
> 	addon_connector0: addon-connector0 {
> 		compatible = "gehc,sunhv1-addon-connector";
> 
> 		/*
> 		 * addon-connector node is a nexus node
> 		 *  - 2 interupt lines are wired to the connector
> 		 *  - 1 gpio line is wired to the connector
> 		 *  - 1 PWM is wired to the connector
> 		 */
> 		#interrupt-cells = <2>;
> 		#address-cells = <0>;
> 		interrupt-map = <0 IRQ_TYPE_LEVEL_LOW    &gpio4 1 IRQ_TYPE_LEVEL_LOW>,
> 				<0 IRQ_TYPE_EDGE_FALLING &gpio4 1 IRQ_TYPE_EDGE_FALLING>,
> 				<1 IRQ_TYPE_LEVEL_LOW    &i2c3_mux 1 1 IRQ_TYPE_LEVEL_LOW>,
> 				<1 IRQ_TYPE_EDGE_FALLING &i2c3_mux 1 1 IRQ_TYPE_EDGE_FALLING>;
> 		#gpio-cells = <2>;
> 		gpio-map-mask = <0xf 0x0>;
> 		gpio-map-pass-thru = <0x0 0xf>;
> 		gpio-map = <0 0 &gpio4 1 0>;

This isn't a thing, or do you plan to add nexus nodes / map bindings for all possible
enumerated items in DT? Not sure this will scale well :/

> 		#pwm-cells = <3>;
> 		pwm-map-mask = <0xffffffff 0 0>;
> 		pwm-map-pass-thru = <0 0xffffffff 0xffffffff>;
> 		pwm-map = <0 0 0 &pwm1 0 57000 0>;
> 
> 
> 		devices {

What is this node? I'm assuming this is something the "connector driver" for
this connector will look for and populate subnodes? What about simple connectors
where no driver should be needed?

> 			/*
> 			 * 'no bus' devices such as fixed-regulators or
> 			 * fixed-clocks will be added in this node by the
> 			 * overlay.
> 			 */
> 			#address-cells = <0>;
> 			#size-cells = <0>;
> 		};
> 
> 		/*
> 		 * This is the i2c bus wired at the connector. It is
> 		 * handled by the i2c5 adapter available in the SoC.
> 		 * The overlay will add devices in this node. Those
> 		 * devices are devices available on the addon-board and
> 		 * connected to this i2c bus
> 		 */
> 		i2c-addon {
> 			i2c-parent = <&i2c5>;

What if this I2C instance is not enabled (maybe not an issue for I2C,
but some devices should have their status left disabled unless something
is connected, SPI for instance).

And this (I2C) only works because there is this `i2c-parent` thing, but that
isn't the case for most (e.g. there is no spi-parent, mdio-parent, etc..)
My proposal[0] handles that by giving standard names to the provider phandles
that conforming add-on board overlays can reference directly.

> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 		};
> 
> 		export-symbols {
> 			/*
> 			 * The 'addon_connector' symbol can be used from the
> 			 * overlay to reference this connector
> 			 */
> 			addon_connector = <&addon_connector0>;
> 		};
> 	};
> };
> 
> 
> Then following overlay is applied at the addon-connector0 node and described

*How* is this "applied at the addon-connector0 node"?

Again I'm going to guess this is if we are able to modify the `fdtapply` tool
to accept connection points as a new command line parameter. And then somehow
do the same for all other projects that apply DT overlays (U-Boot, Zephyr, etc.).

And in that case, we would have to pass in the name of the connector anyway,
so having that name be the only item in `export-symbols` doesn't get us anything
new, we could have just passed the connector name directly.

BTW, this is solved in my proposal[0] with adapter/shim overlays. Which allow for
this to work without any modifying the overlay tooling. Maybe there is a way we
can put this new `export-symbols` node in the adapter overlay to avoid passing
in the connector name directly to the tooling.. I have to think on this.

> the addon board connected to the connector:
> 
> / {
> 	fragment@0 {
> 		target-path = "";
> 
> 		__overlay__ {
> 			devices {
> 				reg_addon_3v3: regulator-addon-3v3 {
> 					compatible = "regulator-fixed";

Is this really a fixed regulator on the add-on board or is this being feed
from the main board's PMIC but you have no good way to model that connection
with this scheme? This breaks the regulator/power dependency graph. If a
device on the add-on board powers down, that information is no longer sent
back to the parent PMIC and the power rail will be needlessly left enabled.

This is why I was looking for a full complete example, not a simplified one.
I'm having to make too many assumptions here to give this `export-symbols`
thing a proper review.

Andrew

[0] https://lore.kernel.org/lkml/20240702164403.29067-1-afd@ti.com/

> 					regulator-name = "3V3_ADDON";
> 					regulator-min-microvolt = <15000000>;
> 					regulator-max-microvolt = <15000000>;
> 					regulator-always-on;
> 				};
> 
> 				reg_addon_12v0: regulator-addon-12v0 {
> 					compatible = "regulator-fixed";
> 					regulator-name = "12V0_ADDON";
> 					vin-supply = <&reg_addon_3v3>;
> 					regulator-min-microvolt = <12000000>;
> 					regulator-max-microvolt = <12000000>;
> 					gpios = <&tca6424_addon 12 GPIO_ACTIVE_HIGH>;
> 					enable-active-high;
> 				};
> 
> 				/*
> 				 * This backligh is a PWM driven backlight.
> 				 * It uses the PWM #0 available at the connector
> 				 */
> 				backlight_addon: backlight-addon {
> 					compatible = "pwm-backlight";
> 					power-supply = <&reg_addon_12v0>;
> 					pwms = <&addon_connector 0 57000 0>;
> 					brightness-levels = <0 255>;
> 					num-interpolated-steps = <255>;
> 					default-brightness-level = <255>;
> 				};
> 			};
> 
> 			i2c-addon {
> 				#address-cells = <1>;
> 				#size-cells = <0>;
> 
> 				/*
> 				 * This IO expander uses the interrupt #0
> 				 * available at the connector.
> 				 * It is a device connected to the i2c-addon bus
> 				 * available at the connector.
> 				 */
> 				tca6424_addon: gpio@23 {
> 					compatible = "ti,tca6424";
> 					status = "okay";
> 					reg = <0x23>;
> 					gpio-controller;
> 					#gpio-cells = <2>;
> 					interrupt-parent = <&addon_connector>;
> 					interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> 					interrupt-controller;
> 					#interrupt-cells = <2>;
> 					vcc-supply = <&reg_addon_3v3>;
> 				};
> 			};
> 		};
> 	};
> };
> 
> 
> Best regards,
> Hervé
> 
