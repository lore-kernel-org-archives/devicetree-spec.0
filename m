Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F13D1C862A
	for <devicetree-spec@vger.kernel.org>; Sat, 15 Feb 2025 13:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739624692; cv=none; b=TkfkP0xSjEBrvZQ1K/ZJR5cYjg+ofgSfcJwAi5DFOOTxiZuqeBQJ8aWDXElmyQbt1rGukSAXzWPzOUhMohc0WSNfavo2XMRWueS9ymNBLOrqa0ADvkJoI8L49BTObWB3QMCzZcO+aHPzoRLk6nNcbv92VwfvThTWScmz8vA0uKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739624692; c=relaxed/simple;
	bh=3xi+Vzn2AcxuxlxhliVVc1arqHjhk9/kmlCNbT+xdd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KkN25PqY9dimBYgPcG24SlilpsHAMhdl2Hdpx1MXgiotNq9nZsRKVvRHSaoKdxn50ZmPdHl6r8uv4bwBIAyUulx1iTkBQKULsCgaQS8pNjADsGzDuDYaMTxmVTljh8ENcDgrFUyZPxeqTVWqzi7aBaWPND2TZs/7fiyQj2wBROk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oOb/8K4A; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oOb/8K4A"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e0452f859cso84533a12.2
        for <devicetree-spec@vger.kernel.org>; Sat, 15 Feb 2025 05:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739624689; x=1740229489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF7HQLUaF2Rkxhg+Vv2G04Ncx0jzz+T1h/cQ+pzTpco=;
        b=oOb/8K4AE26/fFAg1FcsbFfFsAwZO53M+yk+VBQgraZMiUaMYVWSM12/IYFvthRZuW
         IJHVDgtYx2uFU6UKpEDQG7dOyFSH1fBlB0W76z38sXCA6vxaFco/JG4jC3rGL5Axgjkm
         Witf9WmW2JwpQls2P6Nk5hmbqP72ps6zZDjts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739624689; x=1740229489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF7HQLUaF2Rkxhg+Vv2G04Ncx0jzz+T1h/cQ+pzTpco=;
        b=wBd78juPIcfe1QJNfuW+Aqo3BIgGIEUJRQx2ibEglnBnhl5G9Yd1xTK4uvOSsH178E
         CdKMg4GVLU+AJZJCx35z7HDM5O/YnFDFKxbla5cX13D3ziBJr85tYCL9vRm8cRWkc0Aw
         Mpy7GH/GXdpoNx+vbBygnxrrTW9feR6ltrg57o0lG1nMKuRFtlAFcqiDQe57GxEKTb8i
         MgdNRGDk5YltYTJUMX1CjocvGRY4x0oetJqfOT/Ofr/a/ee6JgNOmZD2XtkzJLjSdwum
         z8ofJ948Tply3MCxZ5WgP5ZDlZfnuIyJ0PcJfUMa5Ksg/b3kysSmJogtApj2anOLmLk6
         M8Ug==
X-Forwarded-Encrypted: i=1; AJvYcCX5fjcP3deT1AmpXAXGb5/H/6sawIadyh8UobS/6HfzDKH+XHd01V71ZoUsBKtVf9lQeBXo7PtljMbAiBSbEeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcI9zz+vxJ/Srg7xi6XA3V8rs10vUH8Slt6cgYD7IVaQpY3f8y
	SRNCl3ae1RCW8Q69wf3EPwNbaXGQPZwUl3JVtPoHDYAdVCJTRpAewPdSiwas2x+qDS78ZIJjEhu
	AKVtu445slkR08ye3WrsT3mIX8IJII3YvZMwk
X-Gm-Gg: ASbGnctWGk5819WqDLFNuzMF6as0y3f8ftLVeNOPuAcy5yh6lzR4JOqdwY5CaTRTOId
	grToULnjoBIo2Gb09FtMEXctcvwq+AN0qpq9Jk0AX84EbtC5J8+fdGlOQLgwpn72uvHm9RSdfHA
	==
X-Google-Smtp-Source: AGHT+IEoFMzmUjSRF4/M0gLEJ+6nl2080T3fwZrBjh1tjawGu0f4oxFPJPQLkTAA4uY6dHc4Tle7rdZIuc94ZWG1HyA=
X-Received: by 2002:a17:907:9557:b0:aae:c159:9e10 with SMTP id
 a640c23a62f3a-abb70d79dccmr252441066b.42.1739624688731; Sat, 15 Feb 2025
 05:04:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205-bootsource-v1-1-95f4ba69ac27@cherry.de>
 <CAFLszThr_vLbhU7A0_0VTLCGW03k6NmtxLVoW7OzrtxGFertZg@mail.gmail.com>
 <fb6792e8-97c5-4d0e-8ded-e73ea3a7513c@cherry.de> <CAFLszTg9-jMk0PBBSEVT=FonzRUNJOQ5NBMdDYUihWS8NkMhbQ@mail.gmail.com>
 <fc2c6f06-98d9-49d3-9ce5-46dd675e8846@cherry.de> <CAFLszTi2pa56uY95BRvd0snNJC_4qLV3Nm=_4EK5xXDzbmGF6Q@mail.gmail.com>
 <87h64vs7ch.fsf@bloch.sibelius.xs4all.nl>
In-Reply-To: <87h64vs7ch.fsf@bloch.sibelius.xs4all.nl>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 15 Feb 2025 06:04:37 -0700
X-Gm-Features: AWEUYZn-z6bVI4ARjR5r2ZUxUrsQgZ5T14tDebJRY-TZvYtwNxbSOp6lQPA3stA
Message-ID: <CAFLszTgaHhEKvDeK_U1Rsm450+7GYeDu7gE1U=vkYEkS9W+tFg@mail.gmail.com>
Subject: Re: [PATCH] Add 'bootsource' /chosen property
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: quentin.schulz@cherry.de, foss+dt@0leil.net, a.fatoum@pengutronix.de, 
	heiko@sntech.de, devicetree-spec@vger.kernel.org, u-boot@lists.denx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Sat, 15 Feb 2025 at 05:47, Mark Kettenis <mark.kettenis@xs4all.nl> wrote=
:
>
> > From: Simon Glass <sjg@chromium.org>
> > Date: Sat, 15 Feb 2025 04:59:06 -0700
>
> Hi Siomon, Quentin,
>
> > Hi Quentin,
> >
> > On Mon, 10 Feb 2025 at 09:25, Quentin Schulz <quentin.schulz@cherry.de>=
 wrote:
> > >
> > > Hi Simon,
> > >
> > > On 2/9/25 3:28 PM, Simon Glass wrote:
> > > > Hi Quentin,
> > > >
> > > > On Thu, 6 Feb 2025 at 08:46, Quentin Schulz <quentin.schulz@cherry.=
de> wrote:
> > > >>
> > > >> Hi Simon,
> > > >>
> > > >> On 2/6/25 1:33 PM, Simon Glass wrote:
> > > >>> Hi Quentin,
> > > >>>
> > > >>> On Wed, 5 Feb 2025 at 02:12, Quentin Schulz <foss+dt@0leil.net> w=
rote:
> > > >>>>
> > > >>>> From: Quentin Schulz <quentin.schulz@cherry.de>
> > > >>>>
> > > >>>> Bootloaders typically can be loaded from different storage media=
, such
> > > >>>> as eMMC, SD card, SPI flash, EEPROM, but also from non-persisten=
t media
> > > >>>> such as USB (via proprietary protocols loading directly into SRA=
M, or
> > > >>>> fastboot, DFU, etc..), JTAG, ...
> > > >>>>
> > > >>>> This information is usually reported by the SoC-ROM via some pro=
prietary
> > > >>>> mechanism (some specific address in registers/DRAM for example).
> > > >>>>
> > > >>>> It would be useful to know which medium was used to load the fir=
st stage
> > > >>>> of the bootloader. SoC-ROM shall be ignored and not reported in =
this
> > > >>>> property.
> > > >>>>
> > > >>>> This can allow client programs to detect which medium to write t=
o when
> > > >>>> updating the boot program, or detect if fallback mechanisms to
> > > >>>> unexpected medium were used to reach the client program's execut=
ion.
> > > >>>>
> > > >>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> > > >>>> ---
> > > >>>> Bootloaders typically can be loaded from different storage media=
, such
> > > >>>> as eMMC, SD card, SPI flash, EEPROM, but also from non-persisten=
t media
> > > >>>> such as USB (via proprietary protocols loading directly into SRA=
M, or
> > > >>>> fastboot, DFU, etc..), JTAG, ...
> > > >>>>
> > > >>>> This information is usually reported by the SoC-ROM via some pro=
prietary
> > > >>>> mechanism (some specific address in registers/DRAM for example).
> > > >>>>
> > > >>>> It would be useful to know which medium was used to load the fir=
st stage
> > > >>>> of the bootloader. SoC-ROM shall be ignored and not reported in =
this
> > > >>>> property.
> > > >>>>
> > > >>>> This can allow client programs to detect which medium to write t=
o when
> > > >>>> updating the boot program, or detect if fallback mechanisms to
> > > >>>> unexpected medium were used to reach the client program's execut=
ion.
> > > >>>>
> > > >>>> Note that this property is already set by Barebox and I'm planni=
ng on
> > > >>>> adding it to U-Boot as well, specifically for Rockchip SoCs.
> > > >>>>
> > > >>>> I have some doubts about the wording, especially in the case of
> > > >>>> hypervisors or chained boot programs. I'm not entirely sure what=
 would
> > > >>>> make the most sense to put in the property for those scenario.
> > > >>>> ---
> > > >>>>    source/chapter3-devicenodes.rst | 3 +++
> > > >>>>    1 file changed, 3 insertions(+)
> > > >>>>
> > > >>>> diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-d=
evicenodes.rst
> > > >>>> index 8080321d6e60d6b1e86c81af86c6850246a0223b..defd1a46e4ffaa4b=
b085306b5e153d38b740ac66 100644
> > > >>>> --- a/source/chapter3-devicenodes.rst
> > > >>>> +++ b/source/chapter3-devicenodes.rst
> > > >>>> @@ -456,6 +456,9 @@ time. It shall be a child of the root node.
> > > >>>>                                                           the cl=
ient program. The value could
> > > >>>>                                                           potent=
ially be a null string if no boot
> > > >>>>                                                           argume=
nts are required.
> > > >>>> +   ``bootsource``          O     ``<string>``          A string=
 that specifies the full path to the
> > > >>>> +                                                       node rep=
resenting the device the BootROM used
> > > >>>> +                                                       to load =
the initial boot program.
> > > >>>
> > > >>> Could/shoud this be a phandle instead? It might be more efficient=
.
> > > >>>
> > > >>
> > > >> In terms of size in DTB, phandle vs string probably much more effi=
cient yes.
> > > >>
> > > >>   From user's perspective, I'm not too sure?
> > > >>
> > > >> /aliases does use full paths for example.
> > > >>
> > > >> Having a full path allows for easy consumption, just cat
> > > >> /proc/device-tree/chosen/bootsource and you'll have the actual pat=
h.
> > > >> Otherwise, we'd need a special tool for that I guess since it'll r=
eturn
> > > >> the phandle number and then you have to traverse the tree to find =
which
> > > >> node has that phandle number?
> > > >>
> > > >> Also, I could imagine some scenario where:
> > > >> - a boot source would not be available in DT yet (though we probab=
ly
> > > >> shouldn't write it in /chosen/bootsource since we wouldn't know th=
e
> > > >> proper path to it), e.g. USB loading, this is usually done via a
> > > >> proprietary protocol and/or tool (e.g. rockusb/rkdeveloptool for
> > > >> Rockchip) but no USB support yet in boot program or kernel (that w=
as the
> > > >> case for a long time for RK3588 for example and I still have at le=
ast
> > > >> one device without the USB node described yet).
> > > >> - a boot source would be available in EL3 but not EL2, so does not=
 make
> > > >> necessarily make sense to have it in kernel DTB for example. If it=
's not
> > > >> there, can't have a phandle.
> > > >> - a boot source supported only in boot program's DTB and not kerne=
l's
> > > >> DTB, we probably still want to provide it to kernel's DTB even if =
it's
> > > >> not a device node in it.
> > > >> - a boot source doesn't necessarily have a label (though we could =
use a
> > > >> full-path phandle I believe &{/some/path@1f000} probably works). T=
hat is
> > > >> not uncommon for SPI flashes for example.
> > > >
> > > > Well I'm not sure what we are defining here and which programs will=
 use it.
> > > >
> > >
> > > I'm not sure to understand where the confusion is wrt "what we are
> > > defining here"? Can you please clarify?
> > >
> > > Used by whatever and whoever wants to have some specific logic based =
on
> > > which medium the DUT was booted from, e.g. software updaters, distros=
 or
> > > CI tools (labgrid in my case)? If your software is assuming the DUT i=
s
> > > booted from eMMC while it is actually from SPI, you may think you're
> > > updating (including security fixes) the SW while you're not.
> >
> > So for example, VBE includes a node which tells you which device is
> > used for firmware updates. If VBE is used, does it supercede this
> > setting?
> >
> > >
> > > Throwing ideas right now, but this could also probably be used by
> > > fastboot/DFU to know which medium (e.g. MMC, SPI) to update by defaul=
t
> > > instead of using one that defaults from the env/bin. I have no
> > > experience with either so maybe that's misleading.
> >
> > What are you planning to use this for? Can we scope it to that, initial=
ly?
> >
> > >
> > > > I don't really like the idea of mentioning a boot source that is no=
t
> > > > in the device tree. In fact that's one reason why I believe it is
> > > > better to use a phandle, since it enforces that. The RK3588 things =
you
> > > > mention sound like things the vendor should fix from day one, if it
> > > > matters.
> > > >
> > >
> > > There is no such "full Device Tree support day one", especially for n=
ew
> > > arm SoCs. We still do not have USB-C support on Radxa Rock-5B (it's o=
n
> > > the way but still), the introducing commit was made more than two yea=
rs
> > > ago already. I don't understand what's being suggested here.
> >
> > You mentioned that we have to use a string because it might refer to a
> > node not in the devicetree, e.g. we booted from USB but there is no
> > USB node in the devicetree. My suggestion would be to add that node,
> > even if it is empty.
> >
> > >
> > > > If the boot-source device is not in the 'kernel' DTB, then why have
> > > > the boot source there? What use could it be? This seems like having=
 an
> > >
> > > Informative?
> >
> > OK, but this is really what I'm getting at. You must be adding this
> > for a reason, perhaps many. So please can you list the actual uses
> > your software will make, with this value in place?
> >
> > >
> > > > alias to something that doesn't exist in the tree. But it could als=
o
> > > > be used to just have "my-silly-device" as the value, with a magic
> > > > meaning which no one can figure out.
> > > >
> > >
> > > That's fair.
> > >
> > > > Re not having a label, we can add one. Yes, fdtdump does not have t=
he
> > > > schema and doesn't decode phandles, although I suppose we could tea=
ch
> > > > it some basic things, or add a new tool.
> > > >
> > >
> > > If you don't use the same DT for U-Boot and the kernel (which is the
> > > case for all Rockchip-based devices as far as I know), a label may be=
 an
> > > issue, especially if you don't keep the symbols in the DTB. Because t=
hen
> > > you need to guarantee that label X in U-Boot matching node Y in U-Boo=
t
> > > also matches node Y in the kernel and not node Z, so you need some ki=
nd
> > > of hardcoding/mapping somewhere in U-Boot.
> >
> > Wouldn't you set it correctly when you update the /chosen node? There
> > is no sense in putting this property in either the U-Boot or Linux
> > devicetree. It needs to be added to the Linux devicetree, in the FDT
> > fix-ups, just before booting LInux, like we do with other things in
> > the /chosen node.
> >
> > >
> > > > So overall, this seems like a balance between short-term convenienc=
e
> > > > and long-term confusion.
> > > >
> > > > To me, the strongest argument for paths is that /aliases uses full
> > > > paths rather the phandles. I believe that was a mistake (it caused
> > > > problems in SPL as it bloats the DT), but I've not looked at what i=
t
> > > > would take to change it now.
> > > >
> > > >>
> > > >> And additional argument for full-path: Barebox already uses that.
> > > >
> > > > Were there discussions with that, which could be used here?
> > > >
> > >
> > > @Ahmad, any piece of history you'd like to share here maybe?
> > >
> > > What I can say from glancing at the code is that for Rockchip they do
> > > the following:
> > >
> > > Register a bootsource type (e.g. MMC, SPI, I2C, USB, etc...), a
> > > bootsource instance of that type (e.g. MMC0, SPI3, I2C7, ...). The
> > > mapping between what the ROM says the device is vs what it is in the =
DT
> > > is done in their Barebox-specific DT via this custom prop in /chosen:
> > >
> > > barebox,bootsource-<bootsourcetype><bootsourceinstance> =3D &label;  =
#
> > > =C3=A0-la /aliases
> > >
> > > This gets read and resolved and then inserted as
> > >
> > > /chosen/bootsource =3D "/some/path"
> > >
> > > into the kernel DT.
> > >
> > > > Anyway, if this is the way you want to go, I think it would be usef=
ul
> > > > to add some of your notes above into the binding, so there are some
> > > > rules around it.
> > > >
> > >
> > > I'm not sure what classifies as a rule in what I suggested, could you
> > > elaborate on that maybe?
> >
> > Let's get the info on what you are actually going to use this (you, or
> > your company).
> >
> > But overall, I don't really have a strong opinion on whether this
> > should be a string or a phandle. If we consistently used phandles
> > today, I would want that, but we don't, so it seems that ship has
> > sailed.
>
> It probably should be a string because that allows you to specify some
> additional information at the end of the path.  For example if you
> boot from a disk on an AHCI controller, there are no nodes for the
> individual disks.  So if you use a phandle the best you can do is
> point at the AHCI controller.  A string also allows you to specify the
> partition on a disk and a file on that partition if necessary.  This
> is similar to how "stdout-path" and "stdin-path" can include
> additional information about the serial interface (i.e. baud rate,
> parity bit, stop bit).
>
> There is prior art for all this in OpenFirmware, which defines a
> "bootpath" string under "/chosen".  Not sure why that was dropped in
> DTSpec.  Interestingly enough in OpenFirmware there were "stdin" and
> "stdout" which were lhandles.  Those are similar to phandles but
> reference a node in the tree directly.  So it looks like the DTSpec
> authors made a conscious decision to use strings for things like this.

Thanks, that helps a lot. Quentin, can you include some notes like
this in your patch?

Regards,
Simon
