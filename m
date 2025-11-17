Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E508194AD7
	for <devicetree-spec@vger.kernel.org>; Mon, 17 Nov 2025 12:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384208; cv=none; b=VVi4x4fk8LVtnB9h7gkbRzG/DbuirnVrDaWibbcOn3ROvoefTGYrOWb0sLCyE+V7U2itK/EekCSe7EDAZlkgvRGH4N+yCjQvwmCBBWS8Ax0gs1I6eXZ4l3Ixl6alQBEsog9ihIXYoWavGJ2gQsNOnH6Oq9VlAzzMvHT6CeOCwZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384208; c=relaxed/simple;
	bh=0SXdMZLbyuzzaPsKS2Cii36mpzbCUWpkd/CpZzx9Q08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUysdKaQOhxwKtCfSLNErzhMT28dz1iWECnyOtB4/GAsBdKrR9FKjatJa6zop9rv+0/GDZa6gbnOM4G4695n+s9C2DRX8ALPjjshKrTfmnzJbFj/tN3o0+XB8NrZLdTDqnzO+cSeJJyHuOeXJ51ZR2EcUlZ+TwRRvJYTeX/aiVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vKymZ-0001xi-Nr; Mon, 17 Nov 2025 13:56:35 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vKymZ-000uil-1F;
	Mon, 17 Nov 2025 13:56:35 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 09E514A151B;
	Mon, 17 Nov 2025 12:56:35 +0000 (UTC)
Date: Mon, 17 Nov 2025 13:56:34 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>, devicetree-spec@vger.kernel.org, 
	quentin.schulz@cherry.de, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: SoC-specific device tree aliases?
Message-ID: <20251117-smooth-spiked-loon-52df28-mkl@pengutronix.de>
References: <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de>
 <58816b68-3b09-4320-9a4e-09f2c2b2d0fa@kernel.org>
 <aRrcRZvdrbAmsCm_@pengutronix.de>
 <8ce701c9-6c8d-4b3e-8706-760b8aba89fc@kernel.org>
 <aRr6JLMplFVeHcjj@pengutronix.de>
 <e5502ec8-0c55-47ce-a9e5-62e137c9808b@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dr3j23cwjssp2sgf"
Content-Disposition: inline
In-Reply-To: <e5502ec8-0c55-47ce-a9e5-62e137c9808b@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-spec@vger.kernel.org


--dr3j23cwjssp2sgf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: SoC-specific device tree aliases?
MIME-Version: 1.0

On 17.11.2025 11:41:12, Krzysztof Kozlowski wrote:
> On 17/11/2025 11:34, Sascha Hauer wrote:
> > On Mon, Nov 17, 2025 at 10:52:49AM +0100, Krzysztof Kozlowski wrote:
> >> On 17/11/2025 09:26, Sascha Hauer wrote:
> >>> On Mon, Nov 17, 2025 at 08:38:48AM +0100, Krzysztof Kozlowski wrote:
> >>>> On 13/11/2025 09:28, Ahmad Fatoum wrote:
> >>>>> Hello,
> >>>>>
> >>>>> With /chosen/bootsource now part of dt-schema, I would like to rais=
e a
> >>>>> related point: The need for SoC-specific device tree aliases.
> >>>>>
> >>>>> For many SoCs, there is a canonical numbering for peripherals; it's=
 used
> >>>>> in the datasheet and BootROMs often makes use of it at runtime to r=
eport
> >>>>> the bootsource as a pair:
> >>>>>
> >>>>>   - One value to enumerate type of boot medium (e.g. mmc, spi-nor..)
> >>>>>   - Another value that describes which instance (e.g. SDHC1, SPI3, =
=2E..)
> >>>>>
> >>>>> Some examples, where this is the case, are AT91, STM32MP or i.MX.
> >>>>>
> >>>>> barebox has traditionally used /aliases to translate BootROM inform=
ation
> >>>>> to a device tree node to fixup /chosen/bootsource.
> >>>>>
> >>>>> This doesn't work out for many newer SoC support, because of differ=
ent
> >>>>> expectations: For upstream, aliases are relevant to a board, while
> >>>>> barebox traditionally expected them to be SoC-specific (because they
> >>>>> used to be on i.MX, probably).
> >>>>
> >>>> Please state exactly the problem - you have aliases in DTS but
> >>>> bootsource in DTSI? Then that's clearly mixup - you need to define t=
hem
> >>>> in the same place. Aliases are in DTS (I see here other thread on th=
at),
> >>>> so stdout-path is also in DTS.
> >>>>
> >>>> Or you don't have bootsource in DTSI at all because barebox invents =
it
> >>>> regardless of actual aliases? Then shouldn't this be an obvious issu=
e?
> >>>> You cannot have barebox as second source of aliases.
> >>>>
> >>>>>
> >>>>> To accommodate this, barebox nowadays extends upstream device trees=
 with
> >>>>> /chosen/barebox,bootsource-${alias} properties, which can be used as
> >>>>> translation table instead of aliases.
> >>>>>
> >>>>> This solves the issue, but there is occasional breakage when upstre=
am
> >>>>> decides to remove aliases from the SoC DTSI and move them into the
> >>>>> boards until barebox is made to add the /chosen/barebox, overrides.
> >>>>>
> >>>>> As described above, I think the data sheet numbering is pretty much=
 an
> >>>>> aspect of the hardware and it has a place in the upstream SoC DTSI.
> >>>>>
> >>>>>
> >>>>> So what are the thoughts on adding /soc/aliases or some other top-l=
evel
> >>>>> node to hold this information?
> >>>>> Or would a h"ardware-label" property or similar be more tenable?
> >>>>
> >>>> So you want to map full node path to some alias, so later you can map
> >>>> that alias back to full node path, right? This sounds like quite
> >>>> redundant information in DTS just to avoid impact of node reshuffling
> >>>> (like unit address changes). In DTS-source-code realm, we solved it =
with
> >>>> phandles. Maybe this would help here?
> >>>
> >>> We want aliases that map from the hardware numbers of a device as used
> >>> in the reference manuals to the actual device nodes. One reason why we
> >>> need it is to get the device node a SoC has booted from. Many SoCs ha=
ve
> >>> registers which describe <bootsource> <instance number>. We want to g=
et
> >>> the device node from that information.
> >>
> >> Ah, so you don't map from full node path but from some value in regist=
er
> >> and you want to store these values as alias.
> >
> > Not sure if we mean the same when you say "store these values as alias".
> >
> > What we want to do is a SoC dtsi providing something like:
>
> I meant how your bootloader/barebox generates this information.

Most SoC have 1 or 2 registers where you can read the source where the
system has booted from.

One register contains the information such as eMMC, NAND, USB, serial
download, ... the other register contains the information about which
instance, e.g. 0, 1, 2... The boot loader combines both pieces of
information and knows the boot source of the system.

The problem we want to solve is the mapping from the SoC specific
numbering of the registers to the devices in the DT.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--dr3j23cwjssp2sgf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkbG38ACgkQDHRl3/mQ
kZyDlgf+M1oE2u20KvrVgPcM3R7EC6zrj0ndK6A2Tq14t438d2B8Mh9RNBjDZJhM
U6v0aRP8xJQRHlkJ6b0ioq3wlXbA4n3kwPmY2cVBy4tnMXT34EkuWXsbr+NWVBpO
WLWvrhqIrityasvGLeD1jkCisoicEw5vapfO62qAsokDawA3zq3tCXjeahCoAWQw
o/Iyl0z6J+NJOfGELuG0jX392SnZuWW1p1hL5EN1oNq7z6UQPniLoudLuZd+aaJE
H6DrMJ0c/KPwd01gxWh41WcmK3azu+5uJcLCsJWHb9N1nLEG9CaCYt97KsHPmrKU
WUIqoS7k7SvRXbWE3eL0RZ/VqnIbyg==
=5H4S
-----END PGP SIGNATURE-----

--dr3j23cwjssp2sgf--
