Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E738279792;
	Mon, 14 Apr 2025 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641985; cv=none; b=UkxHf6lyot4CiAEs7sh9H6Zb5BvdJaYgdJXwRdvCQYBUMmKr/pAlK303uP6DHezXhi880CnxREZUoj7BQ+MbYUkShnc8/BqEcznTMTMUweluIeWqnAJNMNMsdZ2NinEA8KwgflW6fAy43ollUP0rCt2imwQpz2MctFf40qbke7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641985; c=relaxed/simple;
	bh=KmvEpwG/vemFi0gA2h80I0MoHs5yC8NuctYgm5tH/dU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I/RJo4HneCevC12ID+F9MMbqAPWJEyi5s7Plm89gZSqBYcBDmAyHi5C6fBnYF0Sg32By4d+r926NHE/EoANeIDjj+ey7imJD4rzUTt+3e6ohlWr7vyZYX6Df4hKOuCAzYIn8ZsUs6w1CTOTfkFZT+4HSlosaCK6s/euK5abUPc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VtHJcBNk; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VtHJcBNk"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C238439B1;
	Mon, 14 Apr 2025 14:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744641981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gJRcB4OlXVDhcr55oeZrW5pgLpuewAdHBuFl9mPcETE=;
	b=VtHJcBNk5ebtVbBodnxqNHRmAbNyJDP78VsAhoJJIBjug/3FcgJSZ5r+7pc5m9EzXYJnWy
	t563upBzsYPRQxwLL/VGHvRCYJiHX8Kv5PnO0s3mGay0UyJnhUZiwtFpt+oOu5igo/dbvP
	2XV+PqN2MaL1tpsYm19PHWLZyfm8sh9W0XIw9oxnJ3fynF+YoB4jiyh/lWSpqeHWpjwXwk
	auW3kNBz96Qm6iau+4EAgsdnjAswEucdlxuACcL3QNxrH7RtkSj5PcCUKF/vGgK3nvNw9T
	U2lN+3jJXaAOkCZwS/us/uejgNKqyK3Jl8dKtxkdeX1e9pwp+n8bvP8/fgoe8A==
Date: Mon, 14 Apr 2025 16:46:17 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>, Andrew Davis <afd@ti.com>
Cc: Jason Kridner <jkridner@beagleboard.org>, Deepak Khatri
 <lorforlinux@beagleboard.org>, Robert Nelson
 <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com, Geert
 Uytterhoeven <geert@linux-m68k.org>, Robert Nelson
 <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, David Gibson
 <david@gibson.dropbear.id.au>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Grant Likely <grant.likely@secretlab.ca>, Dhruva Gole <d-gole@ti.com>,
 devicetree-spec@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] Add new `export-symbols` node
Message-ID: <20250414164617.51038dd4@bootlin.com>
In-Reply-To: <d78e60f2-e2e5-4e6a-9724-68cc0481fd77@beagleboard.org>
References: <20250411-export-symbols-v3-1-f59368d97063@beagleboard.org>
	<0d25b3d4-7735-4e35-8553-d6e64b8ad8f7@ti.com>
	<d78e60f2-e2e5-4e6a-9724-68cc0481fd77@beagleboard.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtohepjhhkrhhiughnvghrsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtoheplhhorhhfohhrlhhinhhugiessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehrohgsvghrthgtnhgvlhhsohhnsegsvggrghhlvggsohgrrhgurdhorhhgp
 dhrtghpthhtohepnhgvnhgrugdrmhgrrhhinhhkohhvihgtsehmihhkrhhovgdrtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehrohgsvghrthgtnhgvlhhsohhnsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Ayush, David,

On Sat, 12 Apr 2025 00:19:16 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

> On 4/11/25 23:09, Andrew Davis wrote:
> 
> > On 4/11/25 3:00 AM, Ayush Singh wrote:  
> >> `export-symbols` is designed to be a local replacement of global
> >> `__symbols__` allowing nodes to define aliases to nodes in a tree, which
> >> will take precedence over the aliases defined in the global 
> >> `__symbols__`.
> >>
> >> Having a way to allow node local aliases helps in usecases such as
> >> connectors and addon-boards, by allowing decoupling of
> >> overlays/devicetree nodes of addon-board from the base connector.
> >>
> >> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> >> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> >> ---
> >> This patch series follows the initial RFC [9] sent a few weeks ago. I
> >> will be reiterating the RFC here for anyone who might be seeing this the
> >> first time, since there was not much feedback in that thread.
> >>  
> >
> > I think this is a useful tool in the effort to build a complete 
> > addon-board
> > solution. But I'm still missing how it all fits together, do you have 
> > a real
> > working overlay making use of this somewhere I could take a look at? 
> > Maybe
> > an overlay for one of the addon-boards you list below (one of the 
> > BeagleCapes
> > for instance).
> >

We (me and Luca) have a working device-tree and overlay.

Our base device tree is the following (simplified but relevant part for
this topic are available):
/ {
	...

	addon_connector0: addon-connector0 {
		compatible = "gehc,sunhv1-addon-connector";

		/*
		 * addon-connector node is a nexus node
		 *  - 2 interupt lines are wired to the connector
		 *  - 1 gpio line is wired to the connector
		 *  - 1 PWM is wired to the connector
		 */
		#interrupt-cells = <2>;
		#address-cells = <0>;
		interrupt-map = <0 IRQ_TYPE_LEVEL_LOW    &gpio4 1 IRQ_TYPE_LEVEL_LOW>,
				<0 IRQ_TYPE_EDGE_FALLING &gpio4 1 IRQ_TYPE_EDGE_FALLING>,
				<1 IRQ_TYPE_LEVEL_LOW    &i2c3_mux 1 1 IRQ_TYPE_LEVEL_LOW>,
				<1 IRQ_TYPE_EDGE_FALLING &i2c3_mux 1 1 IRQ_TYPE_EDGE_FALLING>;
		#gpio-cells = <2>;
		gpio-map-mask = <0xf 0x0>;
		gpio-map-pass-thru = <0x0 0xf>;
		gpio-map = <0 0 &gpio4 1 0>;
		#pwm-cells = <3>;
		pwm-map-mask = <0xffffffff 0 0>;
		pwm-map-pass-thru = <0 0xffffffff 0xffffffff>;
		pwm-map = <0 0 0 &pwm1 0 57000 0>;


		devices {
			/*
			 * 'no bus' devices such as fixed-regulators or
			 * fixed-clocks will be added in this node by the
			 * overlay.
			 */
			#address-cells = <0>;
			#size-cells = <0>;
		};

		/*
		 * This is the i2c bus wired at the connector. It is
		 * handled by the i2c5 adapter available in the SoC.
		 * The overlay will add devices in this node. Those
		 * devices are devices available on the addon-board and
		 * connected to this i2c bus
		 */
		i2c-addon {
			i2c-parent = <&i2c5>;
			#address-cells = <1>;
			#size-cells = <0>;
		};

		export-symbols {
			/*
			 * The 'addon_connector' symbol can be used from the
			 * overlay to reference this connector
			 */
			addon_connector = <&addon_connector0>;
		};
	};
};


Then following overlay is applied at the addon-connector0 node and described
the addon board connected to the connector:

/ {
	fragment@0 {
		target-path = "";

		__overlay__ {
			devices {
				reg_addon_3v3: regulator-addon-3v3 {
					compatible = "regulator-fixed";
					regulator-name = "3V3_ADDON";
					regulator-min-microvolt = <15000000>;
					regulator-max-microvolt = <15000000>;
					regulator-always-on;
				};

				reg_addon_12v0: regulator-addon-12v0 {
					compatible = "regulator-fixed";
					regulator-name = "12V0_ADDON";
					vin-supply = <&reg_addon_3v3>;
					regulator-min-microvolt = <12000000>;
					regulator-max-microvolt = <12000000>;
					gpios = <&tca6424_addon 12 GPIO_ACTIVE_HIGH>;
					enable-active-high;
				};

				/*
				 * This backligh is a PWM driven backlight.
				 * It uses the PWM #0 available at the connector
				 */
				backlight_addon: backlight-addon {
					compatible = "pwm-backlight";
					power-supply = <&reg_addon_12v0>;
					pwms = <&addon_connector 0 57000 0>;
					brightness-levels = <0 255>;
					num-interpolated-steps = <255>;
					default-brightness-level = <255>;
				};
			};

			i2c-addon {
				#address-cells = <1>;
				#size-cells = <0>;

				/*
				 * This IO expander uses the interrupt #0
				 * available at the connector.
				 * It is a device connected to the i2c-addon bus
				 * available at the connector.
				 */
				tca6424_addon: gpio@23 {
					compatible = "ti,tca6424";
					status = "okay";
					reg = <0x23>;
					gpio-controller;
					#gpio-cells = <2>;
					interrupt-parent = <&addon_connector>;
					interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
					interrupt-controller;
					#interrupt-cells = <2>;
					vcc-supply = <&reg_addon_3v3>;
				};
			};
		};
	};
};


Best regards,
Hervé

