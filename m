Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E15731AF1E
	for <devicetree-spec@vger.kernel.org>; Mon, 17 Nov 2025 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763368019; cv=none; b=Wdr08H40l7uzLKxa9LLNNuZhmaw2B6pI1WN4pVTKgazX2LcqtnQOuz0NKo4zvRpMgU8qtqlkaL4i6ARPj17V5H0gFk2Syvx8EgE2PKS0KbnHrAXKmdLLzgNcZ5w94Q/jxGolxKK7M/oKvfRJsrNjU/8WO/Ea6FNzYlVZbsOjJrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763368019; c=relaxed/simple;
	bh=GY2wBkebqqSxoEQo/uqelOZjoKcV/i/NkMPfIVLC34M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NE0efPlJbenJPrRfIEFqhaRD+La/xSX054WM/XVEyMkd3B0P9VmxYgOcUrCcXsPMnH4oDEZJ+hdtW1MvL5SdANWFdqeP3eKy6idKhdjffl2O7KUKooWvbOiV0NAOttr53epFAWSNqK/NfAOO13fka0YXK0SZdmNm1BGcYk28ZQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1vKuZS-0000F6-FW; Mon, 17 Nov 2025 09:26:46 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1vKuZS-000sZR-09;
	Mon, 17 Nov 2025 09:26:46 +0100
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1vKuZR-008G10-2z;
	Mon, 17 Nov 2025 09:26:45 +0100
Date: Mon, 17 Nov 2025 09:26:45 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree-spec@vger.kernel.org,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	quentin.schulz@cherry.de
Subject: Re: SoC-specific device tree aliases?
Message-ID: <aRrcRZvdrbAmsCm_@pengutronix.de>
References: <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de>
 <58816b68-3b09-4320-9a4e-09f2c2b2d0fa@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58816b68-3b09-4320-9a4e-09f2c2b2d0fa@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-spec@vger.kernel.org

On Mon, Nov 17, 2025 at 08:38:48AM +0100, Krzysztof Kozlowski wrote:
> On 13/11/2025 09:28, Ahmad Fatoum wrote:
> > Hello,
> > 
> > With /chosen/bootsource now part of dt-schema, I would like to raise a
> > related point: The need for SoC-specific device tree aliases.
> > 
> > For many SoCs, there is a canonical numbering for peripherals; it's used
> > in the datasheet and BootROMs often makes use of it at runtime to report
> > the bootsource as a pair:
> > 
> >   - One value to enumerate type of boot medium (e.g. mmc, spi-nor..)
> >   - Another value that describes which instance (e.g. SDHC1, SPI3, ...)
> > 
> > Some examples, where this is the case, are AT91, STM32MP or i.MX.
> > 
> > barebox has traditionally used /aliases to translate BootROM information
> > to a device tree node to fixup /chosen/bootsource.
> > 
> > This doesn't work out for many newer SoC support, because of different
> > expectations: For upstream, aliases are relevant to a board, while
> > barebox traditionally expected them to be SoC-specific (because they
> > used to be on i.MX, probably).
> 
> Please state exactly the problem - you have aliases in DTS but
> bootsource in DTSI? Then that's clearly mixup - you need to define them
> in the same place. Aliases are in DTS (I see here other thread on that),
> so stdout-path is also in DTS.
> 
> Or you don't have bootsource in DTSI at all because barebox invents it
> regardless of actual aliases? Then shouldn't this be an obvious issue?
> You cannot have barebox as second source of aliases.
> 
> > 
> > To accommodate this, barebox nowadays extends upstream device trees with
> > /chosen/barebox,bootsource-${alias} properties, which can be used as
> > translation table instead of aliases.
> > 
> > This solves the issue, but there is occasional breakage when upstream
> > decides to remove aliases from the SoC DTSI and move them into the
> > boards until barebox is made to add the /chosen/barebox, overrides.
> > 
> > As described above, I think the data sheet numbering is pretty much an
> > aspect of the hardware and it has a place in the upstream SoC DTSI.
> > 
> > 
> > So what are the thoughts on adding /soc/aliases or some other top-level
> > node to hold this information?
> > Or would a h"ardware-label" property or similar be more tenable?
> 
> So you want to map full node path to some alias, so later you can map
> that alias back to full node path, right? This sounds like quite
> redundant information in DTS just to avoid impact of node reshuffling
> (like unit address changes). In DTS-source-code realm, we solved it with
> phandles. Maybe this would help here?

We want aliases that map from the hardware numbers of a device as used
in the reference manuals to the actual device nodes. One reason why we
need it is to get the device node a SoC has booted from. Many SoCs have
registers which describe <bootsource> <instance number>. We want to get
the device node from that information.

On i.MX these used to be the aliases in /aliases/. Nowadays we agree
that the instance numbers in the aliases are board specific, hence Ahmad
is asking for a place to store SoC specific aliases.

The properties do not have to contain a full device path, a phandle
would do it as well.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
