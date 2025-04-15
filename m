Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970E2288C9A;
	Tue, 15 Apr 2025 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712701; cv=none; b=KwJudcQxMYsnBiJU3pSUKaAGIxGMml16oDP0baqjrLKsDfWcGliH2k1PJM2YpgBwEbVdC575uF+gCGVwcvaNlIvDELD/8jhMxO77D2vC93jyaZlPT2JfJps6sYWXgOSGNi6awv8IHtFUm7Iy+eTcuYdSp2dG2Qybk+7alt/GhcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712701; c=relaxed/simple;
	bh=fll9s794bO1sjjOKmZ4h8P9dJ/S6mxX7VbWTAbXeGnA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HJ8XBMg/wnphNxPu2ZY+Y5gjvCDh8EHSIOg5bYeVQInaDaLCPRGmSQ2QawoCXTalmqlRgqaz0s1q9bdfrHNMm0HHeeom65a8ih009X2Gl8SozH2kZl9oPbOEK4QqH9r3Jf1Lx00fj9dMK7z72COPZnch5gp9pedJEEi7HK3cWms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XQZFHNX5; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XQZFHNX5"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F349043974;
	Tue, 15 Apr 2025 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744712696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bRRdzyIB3MJCdWTf/5ZNH8IZENeUIiD6dUIkzGb/zY8=;
	b=XQZFHNX5S5ZOvdozlhQ9kcT7OvmkdwRrU7AEUDEzOhPBbplqBT1ZQJv7V/QCeUN4+ids3f
	mGPX4mbMnGAWqwu6U3XOg4YarUlS4btchLxWYQAp+0p0xiFEUGW4/SAtt6/heVFE05Xk5B
	Q+A/DxyRbTLZpyU4sLXsWVqHv/l4nGCtdrwHEX2LY894VogiMdVWeBBEIZwQ3kFupMI+n8
	BvW4rouXSQhN8qEMgMz51PsBnU66nnbC7+pvpwM0LW/Pm6lVAMixPG45FxwUUDztXZnr1R
	b918nc996L4mYyMfrtsFAhlkX49+l382HY+ns437r8XLDK9NjZ/gFv/MToGJdQ==
Date: Tue, 15 Apr 2025 12:24:53 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Andrew Davis <afd@ti.com>, Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>, Robert Nelson
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
Message-ID: <20250415122453.68e4c50f@bootlin.com>
In-Reply-To: <fd4368bb-bb8a-4a27-9b1d-56b3e92b52af@beagleboard.org>
References: <20250411-export-symbols-v3-1-f59368d97063@beagleboard.org>
	<0d25b3d4-7735-4e35-8553-d6e64b8ad8f7@ti.com>
	<d78e60f2-e2e5-4e6a-9724-68cc0481fd77@beagleboard.org>
	<20250414164617.51038dd4@bootlin.com>
	<17e41207-251b-483a-9c15-a9a5d2626755@ti.com>
	<fd4368bb-bb8a-4a27-9b1d-56b3e92b52af@beagleboard.org>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeevgfefffejteefveffkefffefgtedugedvhfevjedvgeekieelffeihfeuvdeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopehjkhhrihgunhgvrhessggvrghglhgvsghorghrugdro
 hhrghdprhgtphhtthhopehlohhrfhhorhhlihhnuhigsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtoheprhhosggvrhhttghnvghlshhonhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehnvghnrggurdhmrghrihhnkhhovhhitgesmhhikhhrohgvrdgtohhmpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheprhhosggvrhhttghnvghlshhonhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi Andrew,

In complement of Ayush comments, here are mine.

On Mon, 14 Apr 2025 22:43:29 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

> On 4/14/25 22:04, Andrew Davis wrote:
> > On 4/14/25 9:46 AM, Herve Codina wrote:  
> >> Hi Ayush, David,
> >>
> >> On Sat, 12 Apr 2025 00:19:16 +0530
> >> Ayush Singh <ayush@beagleboard.org> wrote:
> >>  
> >>> On 4/11/25 23:09, Andrew Davis wrote:
> >>>  
> >>>> On 4/11/25 3:00 AM, Ayush Singh wrote:  
> >>>>> `export-symbols` is designed to be a local replacement of global
> >>>>> `__symbols__` allowing nodes to define aliases to nodes in a tree, 
> >>>>> which
> >>>>> will take precedence over the aliases defined in the global
> >>>>> `__symbols__`.
> >>>>>
> >>>>> Having a way to allow node local aliases helps in usecases such as
> >>>>> connectors and addon-boards, by allowing decoupling of
> >>>>> overlays/devicetree nodes of addon-board from the base connector.
> >>>>>
> >>>>> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> >>>>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >>>>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> >>>>> ---
> >>>>> This patch series follows the initial RFC [9] sent a few weeks ago. I
> >>>>> will be reiterating the RFC here for anyone who might be seeing 
> >>>>> this the
> >>>>> first time, since there was not much feedback in that thread.  
> >>>>
> >>>> I think this is a useful tool in the effort to build a complete
> >>>> addon-board
> >>>> solution. But I'm still missing how it all fits together, do you have
> >>>> a real
> >>>> working overlay making use of this somewhere I could take a look at?
> >>>> Maybe
> >>>> an overlay for one of the addon-boards you list below (one of the
> >>>> BeagleCapes
> >>>> for instance).
> >>>>  
> >>
> >> We (me and Luca) have a working device-tree and overlay.
> >>
> >> Our base device tree is the following (simplified but relevant part for
> >> this topic are available):
> >> / {
> >>     ...
> >>
> >>     addon_connector0: addon-connector0 {
> >>         compatible = "gehc,sunhv1-addon-connector";
> >>
> >>         /*
> >>          * addon-connector node is a nexus node
> >>          *  - 2 interupt lines are wired to the connector
> >>          *  - 1 gpio line is wired to the connector
> >>          *  - 1 PWM is wired to the connector
> >>          */
> >>         #interrupt-cells = <2>;
> >>         #address-cells = <0>;
> >>         interrupt-map = <0 IRQ_TYPE_LEVEL_LOW    &gpio4 1   
> >> IRQ_TYPE_LEVEL_LOW>,  
> >>                 <0 IRQ_TYPE_EDGE_FALLING &gpio4 1   
> >> IRQ_TYPE_EDGE_FALLING>,  
> >>                 <1 IRQ_TYPE_LEVEL_LOW    &i2c3_mux 1 1   
> >> IRQ_TYPE_LEVEL_LOW>,  
> >>                 <1 IRQ_TYPE_EDGE_FALLING &i2c3_mux 1 1   
> >> IRQ_TYPE_EDGE_FALLING>;  
> >>         #gpio-cells = <2>;
> >>         gpio-map-mask = <0xf 0x0>;
> >>         gpio-map-pass-thru = <0x0 0xf>;
> >>         gpio-map = <0 0 &gpio4 1 0>;  
> >
> > This isn't a thing, or do you plan to add nexus nodes / map bindings 
> > for all possible
> > enumerated items in DT? Not sure this will scale well :/

I map using nexus nodes only resources (gpio, pwm, ...) connected to
the connector. What do you mean by all possible enumerated items in DT?

> >  
> >>         #pwm-cells = <3>;
> >>         pwm-map-mask = <0xffffffff 0 0>;
> >>         pwm-map-pass-thru = <0 0xffffffff 0xffffffff>;
> >>         pwm-map = <0 0 0 &pwm1 0 57000 0>;
> >>
> >>
> >>         devices {  
> >
> > What is this node? I'm assuming this is something the "connector 
> > driver" for
> > this connector will look for and populate subnodes? What about simple 

This node ('devices') is here to offer an entry point to fixed-regulators,
fixed-clocks, ... Those device are soldered on the addon board and are not
connected to any busses (i2c, spi, ...). They need to be described and this
node allows to describe them. It was proposed in our connector binding:
   https://lore.kernel.org/lkml/20240813151901.GA953664-robh@kernel.org/

This node indeed, is taken into account by the connector driver with a call
to of_platform_default_populate().

Where do you put your fixed-clock and fixed-regulator soldered on your addon
board in your DT description (overlay) proposal ?


> > connectors
> > where no driver should be needed?  

A connector needs a driver. This point has been confirmed by Rob Herring:
  https://lore.kernel.org/all/CAL_JsqKg0NpDi1Zf1T+f2rYw5UuVfK7+kjWj1_edFWH8EStjXw@mail.gmail.com/

> 
> Well, I don't think there are many connectors that do not need a driver. 
> Or well, as long as the connector wants to use nexus nodes, it needs a 
> driver. At least for GPIOs and PWMs, nexus nodes work pretty well.

Nexus node are not handled by the connector driver.
The related translation is handled by the core OF with
of_parse_phandle_with_args_map():
  https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/of/base.c#L1441

> 
> The reason nexus nodes cannot be used without driver is well they appear 
> as gpio-controller, which means without a driver, any device using them 
> enters differed probing.

Nexus node can be used without drivers. They are just a translation described
in the DT. The connector driver itself has nothing to do to have nexus node
translation working.

> 
> >  
> >>             /*
> >>              * 'no bus' devices such as fixed-regulators or
> >>              * fixed-clocks will be added in this node by the
> >>              * overlay.
> >>              */
> >>             #address-cells = <0>;
> >>             #size-cells = <0>;
> >>         };
> >>
> >>         /*
> >>          * This is the i2c bus wired at the connector. It is
> >>          * handled by the i2c5 adapter available in the SoC.
> >>          * The overlay will add devices in this node. Those
> >>          * devices are devices available on the addon-board and
> >>          * connected to this i2c bus
> >>          */
> >>         i2c-addon {
> >>             i2c-parent = <&i2c5>;  
> >
> > What if this I2C instance is not enabled (maybe not an issue for I2C,
> > but some devices should have their status left disabled unless something
> > is connected, SPI for instance).

No, why do you need to disable SPI controller if nothing is connected to the
SPI busses. Again this bus is wired to the connector and once an addon board
is connected, a device can be connected to the bus.

For a SPI controller, set in low power (suspend/resume) when nothing is
connected and so the bus is not used, I understand.
Set to 'disabled' status seems to me incorrect.

The meaning of 'disabled' status in my understanding is the device is not used.
As the related bus connected to the connector and available for any addon board,
the device is "used".

Can you clarify this point?

> >
> > And this (I2C) only works because there is this `i2c-parent` thing, 
> > but that
> > isn't the case for most (e.g. there is no spi-parent, mdio-parent, etc..)

Yes and it can be easily extended to SPI and other busses.
I don't see any blocking point with this point.

This 'i2c-parent' handling is part of 'i2c bus extension' series, I sent.
SPI and other can be updated to follow the exact same strategy.
   https://lore.kernel.org/lkml/20250205173918.600037-1-herve.codina@bootlin.com/

> > My proposal[0] handles that by giving standard names to the provider 
> > phandles
> > that conforming add-on board overlays can reference directly.
> >  
> >>             #address-cells = <1>;
> >>             #size-cells = <0>;
> >>         };
> >>
> >>         export-symbols {
> >>             /*
> >>              * The 'addon_connector' symbol can be used from the
> >>              * overlay to reference this connector
> >>              */
> >>             addon_connector = <&addon_connector0>;
> >>         };
> >>     };
> >> };
> >>
> >>
> >> Then following overlay is applied at the addon-connector0 node and 
> >> described  
> >
> > *How* is this "applied at the addon-connector0 node"?

In my use-case, this overlay is applied by the connector driver using
of_overlay_fdt_apply(). The target node (the connector of_node) is passed 
as parameter to the function.
   https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/of/overlay.c#L981

> >
> > Again I'm going to guess this is if we are able to modify the 
> > `fdtapply` tool
> > to accept connection points as a new command line parameter. And then 
> > somehow
> > do the same for all other projects that apply DT overlays (U-Boot, 
> > Zephyr, etc.).  
> 
> I do have patches that add it to fdtoverlay. But most driver based 
> solutions will probably rely on some EEPROM or sysfs entry as well.

Exactly, in our case, we have an EEPROM soldered on all kind of addon-board
we support for our vendor specific connector.

We load a first overlay describing needed hardware to access this EEPROM.
All supported addon-board used the same EEPROM and need the same hardware
to access it.

Thanks to this EEPROM, we can identify the addon board and so apply a
second overlay to describe the specific hardware available on the addon
board we identified.

> 
> 
> >
> > And in that case, we would have to pass in the name of the connector 
> > anyway,
> > so having that name be the only item in `export-symbols` doesn't get 
> > us anything
> > new, we could have just passed the connector name directly.

See below my example involving power supplies.

> >
> > BTW, this is solved in my proposal[0] with adapter/shim overlays. 
> > Which allow for
> > this to work without any modifying the overlay tooling. Maybe there is 
> > a way we
> > can put this new `export-symbols` node in the adapter overlay to avoid 
> > passing
> > in the connector name directly to the tooling.. I have to think on this.  
> 
> The problem with the __symbols__ proposal is the following:
> 
> 1. Path references are not supported in overlays.
> 
> I have tried to add them as well, but full support for path references 
> is not possible in overlays, at least right now. The reason for this can 
> be found here [0].
> 
> There is a possibility of adding a new node: `__symbols_phandle__`, but 
> that seems too linux specific.
> 
> Note: It is not possible to use aliases due to the reasons discussed 
> here [1].
> 
> 
> 2. Global modification
> 
> The __symbols__ based approach directly adds nodes to different parts of 
> the devicetree, outside of the connector. That is a security problem. We 
> need a way to isolate any devicetree modification to a single node.
> 
> I had a discussion here [2] regarding why the sysfs based interface for 
> overlays is not merged in mainline, and at least to me, it seems for 
> mainline support, the modifications need to be strictly isolated as much 
> as possible. But of course, maybe I misunderstood something.
> 
> 
> 3. Pollutes the global symbols
> 
> Export-symbols are local to the connector node, which brings a lot of 
> benefits since it is not possible to accidentally refer to the wrong 
> phandle. Can be avoided with careful naming.
> 
> Additionally, I am not completely sure how connector versioning would be 
> handled here. Maybe the symbols should have naming convention that 
> accounts for the version, but that seems like it can get difficult to 
> scale pretty fast.
> 
> 
> 4. It requires all symbols to be generated
> 
> I don't personally have a problem with this, but it has come up in some 
> other discussions.
> 
> 
> >  
> >> the addon board connected to the connector:
> >>
> >> / {
> >>     fragment@0 {
> >>         target-path = "";
> >>
> >>         __overlay__ {
> >>             devices {
> >>                 reg_addon_3v3: regulator-addon-3v3 {
> >>                     compatible = "regulator-fixed";  
> >
> > Is this really a fixed regulator on the add-on board or is this being 
> > feed
> > from the main board's PMIC but you have no good way to model that 
> > connection
> > with this scheme? This breaks the regulator/power dependency graph. If a
> > device on the add-on board powers down, that information is no longer 
> > sent
> > back to the parent PMIC and the power rail will be needlessly left 
> > enabled.

A power-supply from the base board is wired to the connector ?
Right:

--- Base DT ---
	/* The regulator used or can also be a child node of the PMIC */
	regulator_wired_to_addon: regulator_3v3 {
		compatible = "xxxx"
		regulator-min-microvolt = <330000>;
		regulator-max-microvolt = <330000>;
        }

        addon_connector0: addon-connector0 {
		...
		export-symbols {
			/*
			 * The 'addon_connector' symbol can be used from the
			 * overlay to reference this connector
			 */
			addon_connector = <&addon_connector0>;
			
			/*
			 * The 3v3 power supply available at the connector */
			 */
			addon_connector_pwr_3v3: <&regulator_wired_to_addon>;

		};


The addon board has a device that use this 3v3 provided at the connector

--- Overlay ---

	fragment@0 {
		target-path = "";

		__overlay__ {
			...
			i2c-addon {
				/*
				 * An I2C device that is powered by the 3v3
				 * available at the connector
				 */
				foo@10 {
					compatible = "bar,foo";
					reg = <0x10>;
					...
					vcc-supply = <&addon_connector_pwr_3v3>;
				};
			};
		};
	};

I don't see anything incorrect or blocking in that description.
involving export-symbols.

> >
> > This is why I was looking for a full complete example, not a 
> > simplified one.
> > I'm having to make too many assumptions here to give this 
> > `export-symbols`
> > thing a proper review.  
> 
> 
> I will try sending patches for PocketBeagle 2 connector since that is 
> probably complex enough to catch the corner cases. But well, it will be 
> at least a bit simplified (SPI devices will be missing). The reason 
> being there are other open items outside of export-symbols:
> 
> 1. SPI chipselect.
> 
> - That is a required property for SPI devices in dt, but there is no way 
> (that I know of) to decouple that in a connector addon-board setup

Chip select are described at SPI controller node -> described in the base dts.

The SPI lines wired to the connector should be described as a "SPI bus
extension". This extension described at SPI controller node similar to
"I2C bus extension".
Note: For I2C bus extension sent upstream, the extension is also described
      at the I2C controller node) see
        https://lore.kernel.org/lkml/20250205173918.600037-1-herve.codina@bootlin.com/

For SPI, a description for translating SPI chip selects from the controller
point of view to the connector can be doable easily.
Something to tell: "The chip-select number 5 of this controller is wired to
the chip-select number 0 defined by the pin 'SPI CS' at the connector"

And then, devices added in the SPI extension at the connector will used this
chip-select.


In other words, something like the following:

--- base board ---
	spi0: spi@1000 {
		comptible = "xxxxx":
		reg = 0x1000;

		spi-bus-extension@0 {
			cs-map = <5 0>	/* For this extension, CS number 5
					 * from the controller point of view
					 * becomes CS number 0 from the addon
					 * board point of view
					 */
          		spi-bus = <&spi_addon>;
		};
	};

	addon_connector0: addon-connector0 {
		...
		/*
		 * This is the SPI bus wired at the connector. It is
		 * handled by the spi@1000 controller available in the SoC.
		 * The overlay will add devices in this node. Those
		 * devices are devices available on the addon-board and
		 * connected to this SPI bus
		 */
		spi-addon {
			spi-parent = <&spi0>;
			#address-cells = <1>;
			#size-cells = <0>;
		};
	};


--- Overlay ---

	fragment@0 {
		target-path = "";

		__overlay__ {
			...
			spi-addon {
				/*
				 * An SPI device in the addon board using
				 * at the CS number 0 of the connector
				 */
				flash@0 {
					compatible = "jedec,spi-nor";
					reg = <0>;
					spi-max-frequency = <40000000>;
				};
			};
		};
	};

Andrew, with your proposal how can you decouple the Chip Select?
I didn't see anything about SPI in your "Add generic Overlay for Grove
Sunlight Sensor" series you pointed out.
Maybe I missed it.

Do you have any other idea to do that?

Best regards,
Hervé

> 
> 
> TechLab cape also exposes a MikroBUS connector on it, so I guess I can 
> test how board chaining looks like as well.
> 
> 
> >
> > Andrew
> >
> > [0] https://lore.kernel.org/lkml/20240702164403.29067-1-afd@ti.com/
> >  
> >>                     regulator-name = "3V3_ADDON";
> >>                     regulator-min-microvolt = <15000000>;
> >>                     regulator-max-microvolt = <15000000>;
> >>                     regulator-always-on;
> >>                 };
> >>
> >>                 reg_addon_12v0: regulator-addon-12v0 {
> >>                     compatible = "regulator-fixed";
> >>                     regulator-name = "12V0_ADDON";
> >>                     vin-supply = <&reg_addon_3v3>;
> >>                     regulator-min-microvolt = <12000000>;
> >>                     regulator-max-microvolt = <12000000>;
> >>                     gpios = <&tca6424_addon 12 GPIO_ACTIVE_HIGH>;
> >>                     enable-active-high;
> >>                 };
> >>
> >>                 /*
> >>                  * This backligh is a PWM driven backlight.
> >>                  * It uses the PWM #0 available at the connector
> >>                  */
> >>                 backlight_addon: backlight-addon {
> >>                     compatible = "pwm-backlight";
> >>                     power-supply = <&reg_addon_12v0>;
> >>                     pwms = <&addon_connector 0 57000 0>;
> >>                     brightness-levels = <0 255>;
> >>                     num-interpolated-steps = <255>;
> >>                     default-brightness-level = <255>;
> >>                 };
> >>             };
> >>
> >>             i2c-addon {
> >>                 #address-cells = <1>;
> >>                 #size-cells = <0>;
> >>
> >>                 /*
> >>                  * This IO expander uses the interrupt #0
> >>                  * available at the connector.
> >>                  * It is a device connected to the i2c-addon bus
> >>                  * available at the connector.
> >>                  */
> >>                 tca6424_addon: gpio@23 {
> >>                     compatible = "ti,tca6424";
> >>                     status = "okay";
> >>                     reg = <0x23>;
> >>                     gpio-controller;
> >>                     #gpio-cells = <2>;
> >>                     interrupt-parent = <&addon_connector>;
> >>                     interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> >>                     interrupt-controller;
> >>                     #interrupt-cells = <2>;
> >>                     vcc-supply = <&reg_addon_3v3>;
> >>                 };
> >>             };
> >>         };
> >>     };
> >> };
> >>
> >>
> >> Best regards,
> >> Hervé
> >>  
> 
> Best Regards
> 
> Ayush Singh
> 
> 
> [0]: 
> https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-b47f96dc7710@beagleboard.org/T/#m8259c8754f680b9da7b91f7b7dd89f10da91d8ed
> 
> [1]: 
> https://lore.kernel.org/all/20241110-of-alias-v2-0-16da9844a93e@beagleboard.org/T/#t
> 
> [2]: 
> https://lore.kernel.org/all/9c326bb7-e09a-4c21-944f-006b3fad1870@beagleboard.org/
> 
