Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FEF2877F2;
	Thu, 13 Nov 2025 20:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763065452; cv=none; b=FLQNdqCEDoWxjCL20BZtZy94aLKhVxNZdziupjVY4jlFJs6Cx04CtUwxaeLOaVN/Rjm4LS01xEY/3jqpOAXG+JHiRSjFu0cl7mOu8TErRUmpxTDUOM111uoFvI3131mSDkhPH4NghzaJiVNNt2vOpUVJ4ORaY1yW9nSmaBvnOq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763065452; c=relaxed/simple;
	bh=D9UKAvXdC5cpJpTyd2jAsEj9qc3G4X4H8wSSvOVSuaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yi2ZRfWT6DD2Mv92lqZGT9bNozAsnQWXd0Qoq27wIuFbNYkg+CEXkLtoFBA7/w+TKH55XXSTvH3nhfA99lkaJgxfzxO+tdqD1mp9Oex6WnG13bl5XlQdCMfHQT/p+d7uKHzUsVDxG91xhU04+etAyhoM4cVNvnJ3fkZ/acUvdFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=WbBpP3Ou; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="WbBpP3Ou"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=nNf9m+JS/I5CX1tV9NPZBIw3JgLomlwFtuJEag/nt5o=; b=WbBpP3Ouc6g4KsOdNyJ/LX3Pos
	XOwsPB2/lZW1Lb160zlvMqVMvJGocOU5CjVij2FMkl6BURM2LY3mjffQIuSeC1xl8X/CihApOir4P
	qCsSQ+0NWqocVwEIjaiHPZNi2YUi9UVh67ssujEG3bCl4CyqhHSjVQobDrNNYTtfVedmHTuemVyDG
	hHMd0zwrfpIhC+HBt39skD/i4gWUZjZ7nF7HwhFEdSLM6dzoh+79NEl1jY1zvQRpYq+dQmx65T+Ph
	Qct4lu8jRp2MMB6c6oHE8QXEaKzTw25ZSzYYm+ZLWDbxAadn1qqWglsct8up73f3BZzJDbR81aAeg
	Ub2/LkjA==;
Received: from i53875a11.versanet.de ([83.135.90.17] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vJdrS-0004eR-6I; Thu, 13 Nov 2025 21:24:06 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Doug Anderson <dianders@chromium.org>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree-spec@vger.kernel.org,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, quentin.schulz@cherry.de,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: SoC-specific device tree aliases?
Date: Thu, 13 Nov 2025 21:24:05 +0100
Message-ID: <22899909.EfDdHjke4D@diego>
In-Reply-To:
 <CAD=FV=XMm_SatBN79D6A8aCXSTpJvmgdhXMm84Um5fpq=e66LA@mail.gmail.com>
References:
 <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de>
 <CAL_JsqKHqEtYoSuoLd=tR5B+P-_nDyOfpqEUZ_f=ws3yt5qORw@mail.gmail.com>
 <CAD=FV=XMm_SatBN79D6A8aCXSTpJvmgdhXMm84Um5fpq=e66LA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 13. November 2025, 20:17:40 Mitteleurop=C3=A4ische Normalzei=
t schrieb Doug Anderson:
> Hi,
>=20
> On Thu, Nov 13, 2025 at 10:12=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > On Thu, Nov 13, 2025 at 2:29=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutro=
nix.de> wrote:
> > >
> > > Hello,
> > >
> > > With /chosen/bootsource now part of dt-schema, I would like to raise a
> > > related point: The need for SoC-specific device tree aliases.
> > >
> > > For many SoCs, there is a canonical numbering for peripherals; it's u=
sed
> > > in the datasheet and BootROMs often makes use of it at runtime to rep=
ort
> > > the bootsource as a pair:
> > >
> > >   - One value to enumerate type of boot medium (e.g. mmc, spi-nor..)
> > >   - Another value that describes which instance (e.g. SDHC1, SPI3, ..=
=2E)
> > >
> > > Some examples, where this is the case, are AT91, STM32MP or i.MX.
> > >
> > > barebox has traditionally used /aliases to translate BootROM informat=
ion
> > > to a device tree node to fixup /chosen/bootsource.
> >
> > So bootsource will be populated "mmc0" or "spinor1" for example?
> >
> > > This doesn't work out for many newer SoC support, because of different
> > > expectations: For upstream, aliases are relevant to a board, while
> > > barebox traditionally expected them to be SoC-specific (because they
> > > used to be on i.MX, probably).
> >
> > But usually the numbering follows the SoC numbering. Sometimes it
> > follows the PCB numbering, but I think that's mainly serial ports.
> > I've certainly steered people away from vendor specific instance
> > numbering properties towards aliases (if the need can't be eliminated
> > entirely).
>=20
> It's been a long time since I was involved in any discussion about
> this, but I remember Arnd Bergmann being strongly against having
> numbering aliases in the SoC "dtsi" file. I was always on the opposite
> side of this argument, but it seems reasonable to include him in the
> conversation.
>=20
> From my point of view, with the exception of the "serial" alias folks
> almost always wanted devices to be numbered as per the SoC numbering,
> as long as there was a well-defined SoC numbering. For instance, if
> the SoC manual consistently calls a port "i2c12" then it's pretty
> confusing if the device doesn't end up as "/dev/i2c12". This always
> led me to the argument that aliases like this should be in the SoC
> ".dtsi" file.

Yep, especially when everything in the soc documentation _and_ the
board schematics calls i2c4 controller, clocks and data lines ... i2c4-foo.

I do agree that unnumbered controllers (like sdhci, sdmmc, sdio on
recent Rockchip SoCs) should be the responsibility of the boards,
but really don't get the idea of repeating the ever same list of aliases
in each and every board dts.


> The "serial" alias is a bit of a special case because of historical
> assumptions. It's often assumed that serial port "0" is the debug
> port. Luckily there aren't usually so many active serial ports so it's
> not terribly confusing...
>=20
>=20
> > The board specific part I think is more that the board defines what
> > devices are present and not present. It would be weird to have a
> > serial3 alias when that's not wired up. And board .dts files are going
> > to forget to remove it. Though I guess it is somewhat harmless.
>=20
> To me it doesn't seem awful to still have the alias pointing to a
> "disabled" node. The node is still there, so why can't the alias still
> be there?

additionally, one would never ever point "serial3" or "i2c4" to anything
else than the uart3 and i2c4 controllers, because that would be completely
confuse everybody.

Like when the board uses i2c0 and i2c4, those should still have the
aliases i2c0 and i2c4, because when you have "i2c1" as alias for the i2c4
controller on the running system, so many heads will explode ;-)




