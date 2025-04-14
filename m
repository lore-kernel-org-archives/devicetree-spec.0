Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398F9284698
	for <devicetree-spec@vger.kernel.org>; Mon, 14 Apr 2025 17:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744650823; cv=none; b=uYTW7bqZ+5mpIZJMIj6tLVkQNXErp/ox0IAxDMXiSNi4ergR/j5PRGw4WZHbG4W75X+A5S0o5GThVfZBgORtLNOxGn/G0nZyWEslf6Sk2KsI2a0aOAxKrNTgCfgNNh0t3ENy84WdSo2SaqDEYFLoXlkdvTFmx7VyhsDsFdusGN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744650823; c=relaxed/simple;
	bh=1mchLdm2eoO+dRaIY7JQzk7CiZPq8ubydXkZsARUCJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p13yZT1/c1/Ops3UKZhqEoOuK9WKCpiTUtHRAJ8QBq+4ecn58kLymZh2M+n3AXZdapVNAxTwhsJwexTBU74wi2auxK2QwEijES9/wj3Sx6sDtJL91ey0L9s8k8hdn6vyEL28MWEUx15c1DTkkBYdo4eWMyp0N/qvMif2pOYPxng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=RaETsHAK; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="RaETsHAK"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so4098950a91.1
        for <devicetree-spec@vger.kernel.org>; Mon, 14 Apr 2025 10:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1744650820; x=1745255620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FCCK7ckUqyt97zfZw9XW7Z3PfPEMT2OeO2RNBp0s0HY=;
        b=RaETsHAKYp4/Rng0GaxDfxBnx53bpsIScFu8k5InStJlaQnY+OHgYUec9tTHTMvT3r
         t5B4/7YHsIS0DvZfrN65tQo98NARRqvX49zfKDrgD5UQeG+eQYuKLGkPEDyee9nc1y5v
         LoFYzR+0fYjxzlvXv2GdpetOunroBVGfU5/frERT8cAHdDcRYt7swH1YOkOp09AjEym1
         nyMbIOPWmGmYqHDyytrNOxDt/RahgZmqgckIvUCn9/YUMP28SY92/GsdqMuDWuSxur2/
         ZxxbldGA1UHJkgAJ5J5Q50QfaMxjJkCFZ9HRodIi7/CNbPK0AGklN27x68SDsWgUqugw
         snKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744650820; x=1745255620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCCK7ckUqyt97zfZw9XW7Z3PfPEMT2OeO2RNBp0s0HY=;
        b=BFo8VpsWwXQiVmN2YrHHtGbygRMOSZnybFn40yprMFer2ERQH7QVFIIe8jmfayAGqj
         lDO0WHsa8f7osJOHvMS6q9Gyhl5TRBJwj3vZ42o+skCIHs6zJSWGKJQRahQ4oRW8hTRv
         nzkpA0hG/A5mG2hlUDKOYUWgIxzs23nQMysnoGsonWStDEP9HyLlsVcezteu5vISXELE
         590uqIHUpGvouJp/H5alXQUXa3lqIOPivgEv1F7Nxh4xi7dg7b+96eReLlBfZhYIjFaR
         5axcjcV88GSfnbEDKQ2xKmCdSzZncikvX1csNqohgjCmg1v0X4r9FfjZaufpjSgyKKoZ
         W3jw==
X-Forwarded-Encrypted: i=1; AJvYcCVp8sw+7GOM1uGP4nLCKgZkJWTd1wI6SX2GmDaR5yRY1l+1d7FpIVVchudVJ4P1+xsneK/mTV3ycmYYOqWm2S8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu7SybVK9YBPedKlv83EMto/YNmJ4vNbDQcPb2b/xwW6EZL20J
	DnMbSJEpaWnttS3Ix69yy+Crv10YHxXjg2+zGxpAMLSrvQ/R2yCkeCB1Wpu7gg==
X-Gm-Gg: ASbGncuxiFqFvZPYIFvntINpudplmw3cFuH3JuMrcqsvBsXDdZYpV7DIO1webVESiqR
	skxOvC2sT+y3mkMANjV4cJM019jMKAsq26T9F/VCPPATbDBk5dZcTHjPntstqp98Sj57YCSzONH
	A1MCG+xRgTBbb1igzOfelVEZfOXdzS3F0Rr3cEh48Ycd6dTLGzoNotk7ybmkYFLGBAL3lPtFmJJ
	WkoTYceFI+nUMcO+LCrynjdYXYnpgFrCCiMTCT+/j7q/FdFFifz+N6D8bRHTjVEKed/6bddYX2n
	vL7BdBvA9efEd+X8rPOoZlnw1MtrraNKOv8Nt12/47+MaMU=
X-Google-Smtp-Source: AGHT+IH7DDNakabn0BszrHYWVfB0NQ8Vuw1pRFv9Ru1+BUZwR3UqaBCm7cB+aFvIOIwkDMq48z7RUA==
X-Received: by 2002:a17:90b:2f08:b0:2ee:44ec:e524 with SMTP id 98e67ed59e1d1-30823783bc7mr16950698a91.35.1744650820226;
        Mon, 14 Apr 2025 10:13:40 -0700 (PDT)
Received: from [172.16.118.31] ([103.93.250.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b1besm101461145ad.74.2025.04.14.10.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 10:13:39 -0700 (PDT)
Message-ID: <fd4368bb-bb8a-4a27-9b1d-56b3e92b52af@beagleboard.org>
Date: Mon, 14 Apr 2025 22:43:29 +0530
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Add new `export-symbols` node
To: Andrew Davis <afd@ti.com>, Herve Codina <herve.codina@bootlin.com>
Cc: Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Grant Likely <grant.likely@secretlab.ca>, Dhruva Gole <d-gole@ti.com>,
 devicetree-spec@vger.kernel.org, devicetree@vger.kernel.org
References: <20250411-export-symbols-v3-1-f59368d97063@beagleboard.org>
 <0d25b3d4-7735-4e35-8553-d6e64b8ad8f7@ti.com>
 <d78e60f2-e2e5-4e6a-9724-68cc0481fd77@beagleboard.org>
 <20250414164617.51038dd4@bootlin.com>
 <17e41207-251b-483a-9c15-a9a5d2626755@ti.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <17e41207-251b-483a-9c15-a9a5d2626755@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/14/25 22:04, Andrew Davis wrote:
> On 4/14/25 9:46 AM, Herve Codina wrote:
>> Hi Ayush, David,
>>
>> On Sat, 12 Apr 2025 00:19:16 +0530
>> Ayush Singh <ayush@beagleboard.org> wrote:
>>
>>> On 4/11/25 23:09, Andrew Davis wrote:
>>>
>>>> On 4/11/25 3:00 AM, Ayush Singh wrote:
>>>>> `export-symbols` is designed to be a local replacement of global
>>>>> `__symbols__` allowing nodes to define aliases to nodes in a tree, 
>>>>> which
>>>>> will take precedence over the aliases defined in the global
>>>>> `__symbols__`.
>>>>>
>>>>> Having a way to allow node local aliases helps in usecases such as
>>>>> connectors and addon-boards, by allowing decoupling of
>>>>> overlays/devicetree nodes of addon-board from the base connector.
>>>>>
>>>>> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
>>>>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>>>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>>>>> ---
>>>>> This patch series follows the initial RFC [9] sent a few weeks ago. I
>>>>> will be reiterating the RFC here for anyone who might be seeing 
>>>>> this the
>>>>> first time, since there was not much feedback in that thread.
>>>>
>>>> I think this is a useful tool in the effort to build a complete
>>>> addon-board
>>>> solution. But I'm still missing how it all fits together, do you have
>>>> a real
>>>> working overlay making use of this somewhere I could take a look at?
>>>> Maybe
>>>> an overlay for one of the addon-boards you list below (one of the
>>>> BeagleCapes
>>>> for instance).
>>>>
>>
>> We (me and Luca) have a working device-tree and overlay.
>>
>> Our base device tree is the following (simplified but relevant part for
>> this topic are available):
>> / {
>>     ...
>>
>>     addon_connector0: addon-connector0 {
>>         compatible = "gehc,sunhv1-addon-connector";
>>
>>         /*
>>          * addon-connector node is a nexus node
>>          *  - 2 interupt lines are wired to the connector
>>          *  - 1 gpio line is wired to the connector
>>          *  - 1 PWM is wired to the connector
>>          */
>>         #interrupt-cells = <2>;
>>         #address-cells = <0>;
>>         interrupt-map = <0 IRQ_TYPE_LEVEL_LOW    &gpio4 1 
>> IRQ_TYPE_LEVEL_LOW>,
>>                 <0 IRQ_TYPE_EDGE_FALLING &gpio4 1 
>> IRQ_TYPE_EDGE_FALLING>,
>>                 <1 IRQ_TYPE_LEVEL_LOW    &i2c3_mux 1 1 
>> IRQ_TYPE_LEVEL_LOW>,
>>                 <1 IRQ_TYPE_EDGE_FALLING &i2c3_mux 1 1 
>> IRQ_TYPE_EDGE_FALLING>;
>>         #gpio-cells = <2>;
>>         gpio-map-mask = <0xf 0x0>;
>>         gpio-map-pass-thru = <0x0 0xf>;
>>         gpio-map = <0 0 &gpio4 1 0>;
>
> This isn't a thing, or do you plan to add nexus nodes / map bindings 
> for all possible
> enumerated items in DT? Not sure this will scale well :/
>
>>         #pwm-cells = <3>;
>>         pwm-map-mask = <0xffffffff 0 0>;
>>         pwm-map-pass-thru = <0 0xffffffff 0xffffffff>;
>>         pwm-map = <0 0 0 &pwm1 0 57000 0>;
>>
>>
>>         devices {
>
> What is this node? I'm assuming this is something the "connector 
> driver" for
> this connector will look for and populate subnodes? What about simple 
> connectors
> where no driver should be needed?

Well, I don't think there are many connectors that do not need a driver. 
Or well, as long as the connector wants to use nexus nodes, it needs a 
driver. At least for GPIOs and PWMs, nexus nodes work pretty well.

The reason nexus nodes cannot be used without driver is well they appear 
as gpio-controller, which means without a driver, any device using them 
enters differed probing.

>
>>             /*
>>              * 'no bus' devices such as fixed-regulators or
>>              * fixed-clocks will be added in this node by the
>>              * overlay.
>>              */
>>             #address-cells = <0>;
>>             #size-cells = <0>;
>>         };
>>
>>         /*
>>          * This is the i2c bus wired at the connector. It is
>>          * handled by the i2c5 adapter available in the SoC.
>>          * The overlay will add devices in this node. Those
>>          * devices are devices available on the addon-board and
>>          * connected to this i2c bus
>>          */
>>         i2c-addon {
>>             i2c-parent = <&i2c5>;
>
> What if this I2C instance is not enabled (maybe not an issue for I2C,
> but some devices should have their status left disabled unless something
> is connected, SPI for instance).
>
> And this (I2C) only works because there is this `i2c-parent` thing, 
> but that
> isn't the case for most (e.g. there is no spi-parent, mdio-parent, etc..)
> My proposal[0] handles that by giving standard names to the provider 
> phandles
> that conforming add-on board overlays can reference directly.
>
>>             #address-cells = <1>;
>>             #size-cells = <0>;
>>         };
>>
>>         export-symbols {
>>             /*
>>              * The 'addon_connector' symbol can be used from the
>>              * overlay to reference this connector
>>              */
>>             addon_connector = <&addon_connector0>;
>>         };
>>     };
>> };
>>
>>
>> Then following overlay is applied at the addon-connector0 node and 
>> described
>
> *How* is this "applied at the addon-connector0 node"?
>
> Again I'm going to guess this is if we are able to modify the 
> `fdtapply` tool
> to accept connection points as a new command line parameter. And then 
> somehow
> do the same for all other projects that apply DT overlays (U-Boot, 
> Zephyr, etc.).

I do have patches that add it to fdtoverlay. But most driver based 
solutions will probably rely on some EEPROM or sysfs entry as well.


>
> And in that case, we would have to pass in the name of the connector 
> anyway,
> so having that name be the only item in `export-symbols` doesn't get 
> us anything
> new, we could have just passed the connector name directly.
>
> BTW, this is solved in my proposal[0] with adapter/shim overlays. 
> Which allow for
> this to work without any modifying the overlay tooling. Maybe there is 
> a way we
> can put this new `export-symbols` node in the adapter overlay to avoid 
> passing
> in the connector name directly to the tooling.. I have to think on this.

The problem with the __symbols__ proposal is the following:

1. Path references are not supported in overlays.

I have tried to add them as well, but full support for path references 
is not possible in overlays, at least right now. The reason for this can 
be found here [0].

There is a possibility of adding a new node: `__symbols_phandle__`, but 
that seems too linux specific.

Note: It is not possible to use aliases due to the reasons discussed 
here [1].


2. Global modification

The __symbols__ based approach directly adds nodes to different parts of 
the devicetree, outside of the connector. That is a security problem. We 
need a way to isolate any devicetree modification to a single node.

I had a discussion here [2] regarding why the sysfs based interface for 
overlays is not merged in mainline, and at least to me, it seems for 
mainline support, the modifications need to be strictly isolated as much 
as possible. But of course, maybe I misunderstood something.


3. Pollutes the global symbols

Export-symbols are local to the connector node, which brings a lot of 
benefits since it is not possible to accidentally refer to the wrong 
phandle. Can be avoided with careful naming.

Additionally, I am not completely sure how connector versioning would be 
handled here. Maybe the symbols should have naming convention that 
accounts for the version, but that seems like it can get difficult to 
scale pretty fast.


4. It requires all symbols to be generated

I don't personally have a problem with this, but it has come up in some 
other discussions.


>
>> the addon board connected to the connector:
>>
>> / {
>>     fragment@0 {
>>         target-path = "";
>>
>>         __overlay__ {
>>             devices {
>>                 reg_addon_3v3: regulator-addon-3v3 {
>>                     compatible = "regulator-fixed";
>
> Is this really a fixed regulator on the add-on board or is this being 
> feed
> from the main board's PMIC but you have no good way to model that 
> connection
> with this scheme? This breaks the regulator/power dependency graph. If a
> device on the add-on board powers down, that information is no longer 
> sent
> back to the parent PMIC and the power rail will be needlessly left 
> enabled.
>
> This is why I was looking for a full complete example, not a 
> simplified one.
> I'm having to make too many assumptions here to give this 
> `export-symbols`
> thing a proper review.


I will try sending patches for PocketBeagle 2 connector since that is 
probably complex enough to catch the corner cases. But well, it will be 
at least a bit simplified (SPI devices will be missing). The reason 
being there are other open items outside of export-symbols:

1. SPI chipselect.

- That is a required property for SPI devices in dt, but there is no way 
(that I know of) to decouple that in a connector addon-board setup


TechLab cape also exposes a MikroBUS connector on it, so I guess I can 
test how board chaining looks like as well.


>
> Andrew
>
> [0] https://lore.kernel.org/lkml/20240702164403.29067-1-afd@ti.com/
>
>>                     regulator-name = "3V3_ADDON";
>>                     regulator-min-microvolt = <15000000>;
>>                     regulator-max-microvolt = <15000000>;
>>                     regulator-always-on;
>>                 };
>>
>>                 reg_addon_12v0: regulator-addon-12v0 {
>>                     compatible = "regulator-fixed";
>>                     regulator-name = "12V0_ADDON";
>>                     vin-supply = <&reg_addon_3v3>;
>>                     regulator-min-microvolt = <12000000>;
>>                     regulator-max-microvolt = <12000000>;
>>                     gpios = <&tca6424_addon 12 GPIO_ACTIVE_HIGH>;
>>                     enable-active-high;
>>                 };
>>
>>                 /*
>>                  * This backligh is a PWM driven backlight.
>>                  * It uses the PWM #0 available at the connector
>>                  */
>>                 backlight_addon: backlight-addon {
>>                     compatible = "pwm-backlight";
>>                     power-supply = <&reg_addon_12v0>;
>>                     pwms = <&addon_connector 0 57000 0>;
>>                     brightness-levels = <0 255>;
>>                     num-interpolated-steps = <255>;
>>                     default-brightness-level = <255>;
>>                 };
>>             };
>>
>>             i2c-addon {
>>                 #address-cells = <1>;
>>                 #size-cells = <0>;
>>
>>                 /*
>>                  * This IO expander uses the interrupt #0
>>                  * available at the connector.
>>                  * It is a device connected to the i2c-addon bus
>>                  * available at the connector.
>>                  */
>>                 tca6424_addon: gpio@23 {
>>                     compatible = "ti,tca6424";
>>                     status = "okay";
>>                     reg = <0x23>;
>>                     gpio-controller;
>>                     #gpio-cells = <2>;
>>                     interrupt-parent = <&addon_connector>;
>>                     interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
>>                     interrupt-controller;
>>                     #interrupt-cells = <2>;
>>                     vcc-supply = <&reg_addon_3v3>;
>>                 };
>>             };
>>         };
>>     };
>> };
>>
>>
>> Best regards,
>> Hervé
>>

Best Regards

Ayush Singh


[0]: 
https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-b47f96dc7710@beagleboard.org/T/#m8259c8754f680b9da7b91f7b7dd89f10da91d8ed

[1]: 
https://lore.kernel.org/all/20241110-of-alias-v2-0-16da9844a93e@beagleboard.org/T/#t

[2]: 
https://lore.kernel.org/all/9c326bb7-e09a-4c21-944f-006b3fad1870@beagleboard.org/

