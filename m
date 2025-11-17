Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98A6332EB3
	for <devicetree-spec@vger.kernel.org>; Mon, 17 Nov 2025 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763393045; cv=none; b=Ahwus/sOMQaYWeHnuKoNkpb7MFNtXloEgTuMV3Ifb6XkqZ4OS8rAP4QsN/cOeFB128gUkZK6uhZ+qTU646qeuliu6r/2ssKSN9YYV9Fsn3/unanwhPaQ6lXXuvE7rZJpinYoFdrexqSX0tqPvcCx2fF0iiX2q2h6tfW1SI61VOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763393045; c=relaxed/simple;
	bh=UH8nMcJmd8pwt9N8sXuofJ1S0SLAJOPzUMZL37lKUiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqIHQ0c7Kx9ktlyqiopY6Bjg0O6sm4izpq5cHHA4BjQKxOOwkbijwhgdfpap/+kZ0cVjP2kRIci+RVdnwpK4HxOM00afiLDRtlVmgmQ26ZQ6EqrWCAxd+mXMkbbErsFMVBwOkfIIkgzjvX6qtXzI/1lKOJp3uFTQEC0n0Hv0dOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1vL15C-0004MK-Bu; Mon, 17 Nov 2025 16:23:58 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1vL15C-000w51-0B;
	Mon, 17 Nov 2025 16:23:58 +0100
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1vL15B-008M0i-35;
	Mon, 17 Nov 2025 16:23:57 +0100
Date: Mon, 17 Nov 2025 16:23:57 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Rob Herring <robh@kernel.org>, devicetree-spec@vger.kernel.org,
	quentin.schulz@cherry.de, Marc Kleine-Budde <mkl@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: SoC-specific device tree aliases?
Message-ID: <aRs-DaayhtQTtFXj@pengutronix.de>
References: <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de>
 <58816b68-3b09-4320-9a4e-09f2c2b2d0fa@kernel.org>
 <aRrcRZvdrbAmsCm_@pengutronix.de>
 <8ce701c9-6c8d-4b3e-8706-760b8aba89fc@kernel.org>
 <aRr6JLMplFVeHcjj@pengutronix.de>
 <e5502ec8-0c55-47ce-a9e5-62e137c9808b@kernel.org>
 <20251117-smooth-spiked-loon-52df28-mkl@pengutronix.de>
 <de1739a8-4677-4cc8-b501-2568b7513467@kernel.org>
 <aRs2y3w854vnHAzg@pengutronix.de>
 <576a9eae-7dba-47d0-ad66-0a81d1893271@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <576a9eae-7dba-47d0-ad66-0a81d1893271@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-spec@vger.kernel.org

On Mon, Nov 17, 2025 at 03:57:19PM +0100, Krzysztof Kozlowski wrote:
> On 17/11/2025 15:52, Sascha Hauer wrote:
> > On Mon, Nov 17, 2025 at 02:18:02PM +0100, Krzysztof Kozlowski wrote:
> >> On 17/11/2025 13:56, Marc Kleine-Budde wrote:
> >>> On 17.11.2025 11:41:12, Krzysztof Kozlowski wrote:
> >>>> On 17/11/2025 11:34, Sascha Hauer wrote:
> >>>>> On Mon, Nov 17, 2025 at 10:52:49AM +0100, Krzysztof Kozlowski wrote:
> >>>>>> On 17/11/2025 09:26, Sascha Hauer wrote:
> >>>>>>> On Mon, Nov 17, 2025 at 08:38:48AM +0100, Krzysztof Kozlowski wrote:
> >>>>>>>> On 13/11/2025 09:28, Ahmad Fatoum wrote:
> >>>>>>>>> Hello,
> >>>>>>>>>
> >>>>>>>>> With /chosen/bootsource now part of dt-schema, I would like to raise a
> >>>>>>>>> related point: The need for SoC-specific device tree aliases.
> >>>>>>>>>
> >>>>>>>>> For many SoCs, there is a canonical numbering for peripherals; it's used
> >>>>>>>>> in the datasheet and BootROMs often makes use of it at runtime to report
> >>>>>>>>> the bootsource as a pair:
> >>>>>>>>>
> >>>>>>>>>   - One value to enumerate type of boot medium (e.g. mmc, spi-nor..)
> >>>>>>>>>   - Another value that describes which instance (e.g. SDHC1, SPI3, ...)
> >>>>>>>>>
> >>>>>>>>> Some examples, where this is the case, are AT91, STM32MP or i.MX.
> >>>>>>>>>
> >>>>>>>>> barebox has traditionally used /aliases to translate BootROM information
> >>>>>>>>> to a device tree node to fixup /chosen/bootsource.
> >>>>>>>>>
> >>>>>>>>> This doesn't work out for many newer SoC support, because of different
> >>>>>>>>> expectations: For upstream, aliases are relevant to a board, while
> >>>>>>>>> barebox traditionally expected them to be SoC-specific (because they
> >>>>>>>>> used to be on i.MX, probably).
> >>>>>>>>
> >>>>>>>> Please state exactly the problem - you have aliases in DTS but
> >>>>>>>> bootsource in DTSI? Then that's clearly mixup - you need to define them
> >>>>>>>> in the same place. Aliases are in DTS (I see here other thread on that),
> >>>>>>>> so stdout-path is also in DTS.
> >>>>>>>>
> >>>>>>>> Or you don't have bootsource in DTSI at all because barebox invents it
> >>>>>>>> regardless of actual aliases? Then shouldn't this be an obvious issue?
> >>>>>>>> You cannot have barebox as second source of aliases.
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> To accommodate this, barebox nowadays extends upstream device trees with
> >>>>>>>>> /chosen/barebox,bootsource-${alias} properties, which can be used as
> >>>>>>>>> translation table instead of aliases.
> >>>>>>>>>
> >>>>>>>>> This solves the issue, but there is occasional breakage when upstream
> >>>>>>>>> decides to remove aliases from the SoC DTSI and move them into the
> >>>>>>>>> boards until barebox is made to add the /chosen/barebox, overrides.
> >>>>>>>>>
> >>>>>>>>> As described above, I think the data sheet numbering is pretty much an
> >>>>>>>>> aspect of the hardware and it has a place in the upstream SoC DTSI.
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> So what are the thoughts on adding /soc/aliases or some other top-level
> >>>>>>>>> node to hold this information?
> >>>>>>>>> Or would a h"ardware-label" property or similar be more tenable?
> >>>>>>>>
> >>>>>>>> So you want to map full node path to some alias, so later you can map
> >>>>>>>> that alias back to full node path, right? This sounds like quite
> >>>>>>>> redundant information in DTS just to avoid impact of node reshuffling
> >>>>>>>> (like unit address changes). In DTS-source-code realm, we solved it with
> >>>>>>>> phandles. Maybe this would help here?
> >>>>>>>
> >>>>>>> We want aliases that map from the hardware numbers of a device as used
> >>>>>>> in the reference manuals to the actual device nodes. One reason why we
> >>>>>>> need it is to get the device node a SoC has booted from. Many SoCs have
> >>>>>>> registers which describe <bootsource> <instance number>. We want to get
> >>>>>>> the device node from that information.
> >>>>>>
> >>>>>> Ah, so you don't map from full node path but from some value in register
> >>>>>> and you want to store these values as alias.
> >>>>>
> >>>>> Not sure if we mean the same when you say "store these values as alias".
> >>>>>
> >>>>> What we want to do is a SoC dtsi providing something like:
> >>>>
> >>>> I meant how your bootloader/barebox generates this information.
> >>>
> >>> Most SoC have 1 or 2 registers where you can read the source where the
> >>> system has booted from.
> >>>
> >>> One register contains the information such as eMMC, NAND, USB, serial
> >>
> >> I know.
> >>
> >>> download, ... the other register contains the information about which
> >>> instance, e.g. 0, 1, 2... The boot loader combines both pieces of
> >>> information and knows the boot source of the system.
> >>>
> >>> The problem we want to solve is the mapping from the SoC specific
> >>> numbering of the registers to the devices in the DT.
> >>
> >> You are both not replying to what I said.
> >>
> >> So to recall, I said your bootloader comes with something read from
> >> register values and uses this to match the alias from DT and that's as
> >> fragile as doing simple unit address based arithmetic after sorting.
> > 
> > I don't get what you mean with "simple unit address based arithmetic
> > after sorting".
> 
> You read from registers booted device MMC 1 (out of MMC 0-2), so instead
> of relying on register value that "1" always means MMC1, not MMC0 for
> example or whatever else changed in hardware, you can just sort the
> nodes by unit address and choose the second device.

The instance numbers do not always match the unit address sorting.

For example K3 SoCs have:

dts/src/arm64/ti/k3-am62-main.dtsi:548: sdhci0: mmc@fa10000 {
dts/src/arm64/ti/k3-am62-main.dtsi:566: sdhci1: mmc@fa00000 {
dts/src/arm64/ti/k3-am62-main.dtsi:589: sdhci2: mmc@fa20000 {

Rockchip:

dts/src/arm64/rockchip/rk356x-base.dtsi:619:    sdmmc2: mmc@fe000000 {
dts/src/arm64/rockchip/rk356x-base.dtsi:994:    sdmmc0: mmc@fe2b0000 {
dts/src/arm64/rockchip/rk356x-base.dtsi:1008:   sdmmc1: mmc@fe2c0000 {

There are some examples for i.MX as well. To my own surprise not with
the mmc nodes, but some SPI instances are not sorted by unit address.

> 
> 
> > 
> > Also I don't get whether you are suggesting
> > 
> > A is as fragile as B, so you could equally well do B
> 
> Both are fragile, so I would be happy to see arguments why A is better
> than B. Why? Because with B you don't need any binding because all the
> information is already in DTS.

What do you consider fragile with it?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
