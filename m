Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033D224167A
	for <devicetree-spec@vger.kernel.org>; Tue, 10 Jun 2025 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569390; cv=none; b=U2FPpXMWpR6fjLrrT1iQNLB12pnXokhgL1kliCpjMALPZlcSw2r41ViHLL0kpFFLJFl87RH0mkqvBMJDPJS8jgkupp825bqCYN/KQbMDas6x7GXRXtd7booF2A4gyxrjZZYWzadvF+AY5pFNZXKjtfO/HiRGYfby8aWilL+2Tkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569390; c=relaxed/simple;
	bh=CTTqjNgE5AN576n0OevSBPzWgMQJvfTplTjpMsUoB/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVs4hFcjY0RhL8wIkrgWoGDijlMSiJ1AJ+27PO5RLysHv/OP3ImNE42fBOvt4uQgWj11GpGjZ67UO2HmaVl1e3w+ZzHtlN66AXYtfp7xxKj/xLRctAarxA52lI+PC0drCx16Rv3+ztWXHAnmlQEP3LHSnQwNPwJBtYQRPH+6jpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMgmzJyo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMgmzJyo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FF7C4CEED
	for <devicetree-spec@vger.kernel.org>; Tue, 10 Jun 2025 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569389;
	bh=CTTqjNgE5AN576n0OevSBPzWgMQJvfTplTjpMsUoB/A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bMgmzJyoy2/L3/JJx426Wla4wqceT+7I27zWvBHd6MySZIuEahcnseK9eCjn4Bjj1
	 2iNKjXH5Ea7tyqW1eUSKt0ocI+JZoFU25BWQq2AZXwK6rwPXjcSknLvhVW5Lr6lwZQ
	 nPNDBzLneWrlEQV7Y//1HB7Gq8DhfULfg7McKbpp0toIrj86zxAfy47bixMrvOGRP3
	 BOSBoCsvlLEo1e15KX/G5cfIbpcl8wUGhYA7ekGL+hvfUSvcm+Bzsm7sYzxoo01r6+
	 CtBH9gBAOPQWuYBErb22h9vELAyiwfk3lrTvI3gnOmT2W+LZStKUyK+/u384+Z2A31
	 lMQno5D+tPgAA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-606b6dbe316so6250654a12.3
        for <devicetree-spec@vger.kernel.org>; Tue, 10 Jun 2025 08:29:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHfCIuFXP8zoKNzhi6p91n2c+hGlfUru8vhVuUow9I9LvhZhUZBavc0RctTAt8hsWSFm9iSTivZplGOfonzms=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCIyKYJuyWBGX7xvOdfbVB0oBMKpWM8hucr15kAGKpvRUIJ8am
	0OjN3hf1K0IGnRLvdatic0pvka/RiTnirdhBKnFU5h+dk88OfIKDsRzwT7R1fDni3ewhYFM76oj
	3bTL0FLqRmxlHVxOWmmBG9QkaGr/OOA==
X-Google-Smtp-Source: AGHT+IGwdSRXEuq9NYbqBuc5V6+AJu1w6kxbb/1qe5bOE6go2kHKiDZUQwgCbOOh1lUQdawRq4xVwgHuX02suJVRYdg=
X-Received: by 2002:a17:907:944b:b0:ad5:7bc4:84b5 with SMTP id
 a640c23a62f3a-ade7ad5b31emr344705966b.57.1749569388146; Tue, 10 Jun 2025
 08:29:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-bootsource-v2-1-5a315d9bff26@cherry.de>
 <CAFLszTgdhQHoKLaOvAHcvYatjS3dkSNuy_sr-VxQHgpr88GGRQ@mail.gmail.com> <2cf31fef-5247-4eff-ae34-3c9a95824423@cherry.de>
In-Reply-To: <2cf31fef-5247-4eff-ae34-3c9a95824423@cherry.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Jun 2025 10:29:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKE+J3aF-tCEH=xwvvKL+K3a9Cp=db90XEYYFhzeae9Vw@mail.gmail.com>
X-Gm-Features: AX0GCFvsqNjfVaYRmmXkYAeEFD8M7MFO7OnDfWQ9As-Ka2THK-Q8mU2YRbGaCNE
Message-ID: <CAL_JsqKE+J3aF-tCEH=xwvvKL+K3a9Cp=db90XEYYFhzeae9Vw@mail.gmail.com>
Subject: Re: [PATCH v2] Add 'bootsource' /chosen property
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Simon Glass <sjg@chromium.org>, Quentin Schulz <foss+dt@0leil.net>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>, Daniel Golle <daniel@makrotopia.org>, 
	devicetree-spec@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 9:52=E2=80=AFAM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Simon,
>
> On 6/10/25 4:26 PM, Simon Glass wrote:
> > On Mon, 5 May 2025 at 09:34, Quentin Schulz <foss+dt@0leil.net> wrote:
> >>
> >> From: Quentin Schulz <quentin.schulz@cherry.de>
> >>
> >> Bootloaders typically can be loaded from different storage media, such
> >> as eMMC, SD card, SPI flash, EEPROM, but also from non-persistent medi=
a
> >> such as USB (via proprietary protocols loading directly into SRAM, or
> >> fastboot, DFU, etc..), JTAG, ...
> >>
> >> This information is usually reported by the SoC-ROM via some proprieta=
ry
> >> mechanism (some specific address in registers/DRAM for example).
> >>
> >> It would be useful to know which medium was used to load the first sta=
ge
> >> of the bootloader. SoC-ROM shall be ignored and not reported in this
> >> property.
> >>
> >> This can allow client programs to detect which medium to write to when
> >> updating the boot program, or detect if fallback mechanisms to
> >> unexpected medium were used to reach the client program's execution.
> >>
> >> In cases where a boot program is split into multiple stages (like
> >> U-Boot), it only represents the device that was used to load the very
> >> first stage (in case of U-Boot, VPL/TPL/SPL whichever is executed firs=
t)
> >> and not any of the later stages (in case of U-Boot, TPL/SPL/proper) or
> >> any client program. They may match, but they may not and this property
> >> is meant to only represent the device used for loading the very first
> >> stage.
> >>
> >> I have a board running U-Boot which currently has 9 boot scenarios
> >> (eMMC/SD/SPI-NOR for the first stage, eMMC/SD/SPI-NOR for the next
> >> stages; not counting USB loading yet, which would make it a few more).=
 I
> >> cannot force the BootROM of this board to select a specific device asi=
de
> >> from erasing the other media.
> >> The only way to identify which device was used for the first stage is =
to
> >> parse U-Boot first stage console output or add some custom logic for m=
y
> >> board. To validate that a new version of the bootloader works, includi=
ng
> >> the fallback mechanisms, I need to make sure the BootROM loads the fir=
st
> >> stage from the expected device otherwise I may have false positives.
> >> This would be useful for automated testing.
> >>
> >> I could also very well see this being used to identify where the first
> >> stage of the boot program is stored (which may differ from where the
> >> later stages are! that's the case for U-Boot proper for example!) to b=
e
> >> able to update it from a client program.
> >>
> >> Note that Barebox has been using this property for a while already, wi=
th
> >> this very content[1].
> >>
> >> This is chosen as a string so that it matches other properties in
> >> /chosen (e.g. stdout-path) as well as allows for extending it, in case
> >> one needs to provide additional information (e.g. HW boot partition fo=
r
> >> eMMC, a specific disk on an AHCI controller, a specific USB device on
> >> a USB bus, etc.).
> >>
> >> [1] https://lore.kernel.org/u-boot/0066fcc2-3431-48be-8dc2-00ea7e2550c=
2@pengutronix.de/
> >>
> >> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> >> ---
> >> Note that this property is already set by Barebox and I'm planning on
> >> adding it to U-Boot as well, specifically for Rockchip SoCs.
> >>
> >> I have some doubts about the wording, especially in the case of
> >> hypervisors or chained boot programs. I'm not entirely sure what would
> >> make the most sense to put in the property for those scenario.
> >> ---
> >> Changes in v2:
> >> - added usecases, non-usecases and increased verbosity of the definiti=
on
> >>    of the property name as requested by Simon,
> >> - Link to v1: https://lore.kernel.org/r/20250205-bootsource-v1-1-95f4b=
a69ac27@cherry.de
> >> ---
> >>   source/chapter3-devicenodes.rst | 17 +++++++++++++++++
> >>   1 file changed, 17 insertions(+)
> >>
> >
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> >
> > Does this need to go into the schema as well?
> >
>
> Considering this should ever only be programmatically set at runtime,
> I'm not sure this is necessary?
>
> But taking into account that u-boot,version is part of the schema, I
> guess this could too :)

Validation can and does run on booted systems, so yes.

There's also a (unresourced) goal to generate the spec from the
schemas. No one seems to care enough to make that happen any time soon
though.

Rob
