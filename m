Received: from glittertind.blackshift.org (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5E42F5318;
	Wed,  3 Dec 2025 11:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.23.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764761397; cv=none; b=k5nppv0nxsylWQGq37JxQv7J65tY/LQ+oRohIDGtRutpBFw9Psknxa5BopzCdHWqBbVT6qgP9WgBxa+FZHzevVI0/QbE5wRHkeVbimbran+UgsZM5LcCT3HFMKjqYFH2GfrbdxiX0V8GtjWeMiszRy6f6MXv4pQhuLZZ9Nw+KBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764761397; c=relaxed/simple;
	bh=8E4cajnzDsEXR4Y5U4stRqHzzcaoI/VX5B7tMew+SVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Js3vgma8PkrxoD5GJ6AwslgTlBlROYspeesTQbD32PCT7LdC/xAyhaksm8mdRQWILcZHgHKbrN4dEDedST+87eEINZewlW2DLnA7/3mt98Ik4j/laA0KZyo1v/b2hBCKZbVNSQRqK3pIfC3epcNUZCrZMdvW9wxNHY6fDiKtbkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackshift.org; spf=pass smtp.mailfrom=blackshift.org; arc=none smtp.client-ip=116.203.23.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackshift.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blackshift.org
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:102:af0a:700:7b4:bad1:4073:8aa9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "bjornoya.blackshift.org", Issuer "R13" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id F3C03769BBF;
	Wed, 03 Dec 2025 11:20:55 +0000 (UTC)
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 652614AE620;
	Wed, 03 Dec 2025 11:20:55 +0000 (UTC)
Date: Wed, 3 Dec 2025 12:20:52 +0100
From: Marc Kleine-Budde <mkl@blackshift.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree-spec@vger.kernel.org, quentin.schulz@cherry.de, 
	Marc Kleine-Budde <mkl@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: SoC-specific device tree aliases?
Message-ID: <20251203-adorable-gila-monster-3d313a-mkl@blackshift.org>
References: <20251117-smooth-spiked-loon-52df28-mkl@pengutronix.de>
 <de1739a8-4677-4cc8-b501-2568b7513467@kernel.org>
 <aRs2y3w854vnHAzg@pengutronix.de>
 <576a9eae-7dba-47d0-ad66-0a81d1893271@kernel.org>
 <aRs-DaayhtQTtFXj@pengutronix.de>
 <9e14fb8e-af84-4072-b0ac-9ead882782be@kernel.org>
 <CAL_Jsq+=v96eP6V+5Ehi9EQT3iKKU7=t7kvJ-WSA+1WCHDuHEA@mail.gmail.com>
 <07ee3540-d0c1-436e-9e1d-db1952f609a6@kernel.org>
 <bcb359cf-0e8a-46ec-9f69-51c4c9e8874e@pengutronix.de>
 <6638e499-2320-41c9-b720-faf4f976e476@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t4ohs6ozy6w5jecs"
Content-Disposition: inline
In-Reply-To: <6638e499-2320-41c9-b720-faf4f976e476@kernel.org>


--t4ohs6ozy6w5jecs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: SoC-specific device tree aliases?
MIME-Version: 1.0

On 03.12.2025 11:25:11, Krzysztof Kozlowski wrote:
> On 03/12/2025 11:16, Ahmad Fatoum wrote:
> > Hello Krzysztof,
> >
> > On 11/17/25 5:29 PM, Krzysztof Kozlowski wrote:
> >> On 17/11/2025 17:06, Rob Herring wrote:
> >>>> So you want it to be an ABI for barebox, sure, just make it a bindin=
g.
> >>>
> >>> What do you have in mind? Other than standard names for the aliases,
> >>> what can we check here? That a specific alias points to a specific
> >>> path? That would be a bit too much IMO. That would be equivalent to
> >>> specifying possible values in 'reg' for all devices.
> >>
> >> Binding with pattern or list of needed alias names, referenced by given
> >> soc-platform top-level schema.
> >>
> >> One of the points is to make it explicit and obvious (e.g. to Arnd or =
to
> >> me if I forget, because I follow the same logic of aliases per board)
> >> that these aliases are used outside of kernel.
> >>
> >> Just because ufs/mmc/spi can be used that way, does not mean we should
> >> accept any possible alias into soc.dtsi.
> >
> > I can't see how this could work. A number of boards renumber MMC devices
> > in a different manner than the SoC reference manual:
> >
> > - Changing the alias numbering is an ABI break, because Linux derives
> > its /dev/mmcblkX numbering from it
>
> First, why the alias would change? Isn't the board following the SoC
> numbering in 99.9% cases?
>
> Second, I don't think it is an ABI. We had it ~5 or ~8 years ago where
> the mmcblkX was changing based on probe ordering. Many people setups got
> broken, many people complained and the consensus reply was: please start
> finally using UUID/PARTUIID/LABEL for rootfs. Eventually we got back to
> mmcblkX stability but rule is there - if your cmdline has /dev/mmcblkX,
> then it is your problem.

In order to use UUID/PARTUIID/LABEL in the kernel command line, the
firmware/bootloader/... has to map from the register value to the
instance to read the UUID/PARTUIID/LABEL from the media.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--t4ohs6ozy6w5jecs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkwHREACgkQDHRl3/mQ
kZzwfgf8D0iKkrtKkeJ70sXp75h6AxSyZRncrmiVeBUi8lAVt62FfYa5J61M91Ml
6x5nXN82mwu8dpL/FaF0M1bU4gf2lwv1RBkr2AV3N6ujlWfZlNKyghtiZPcTcTeH
PUy41AeTORxsm8AcdoFWMaG4HD/ghoK69Lmjr4R6a8aQwMEg06v4dsKoq0oFe6af
JSVNLeyF1BAkNGywXpvBLNn0Vbn6MWymnJh/f3/e2Y1fKKI0uRf9VVuGPOfjZCFS
+a0Yw1DfKGuxexmfsh/v7NpdUSK72rOSmaLN85uJ+9TYZrMWyB+OSTV4DFXY1pGS
6fhmRNBMCR420AxfBHuuecVCOVR+DA==
=Pc8g
-----END PGP SIGNATURE-----

--t4ohs6ozy6w5jecs--
