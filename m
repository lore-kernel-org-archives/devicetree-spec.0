Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6102A1A7253
	for <devicetree-spec@vger.kernel.org>; Sat, 15 Feb 2025 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739620762; cv=none; b=adk797zT14CH4nwm/XVGa24vmXFbtuxlYSm264fQCwYemzna/85PD8ab7IAigBmpRvMEhaSTJpf6J6I/Ix3xjdFSLFoT1FjSlCZ6QQcurB4t5RVnOjzmxI/ytLp2AzcvF32VzW7qnTViYOiVLgcN63kwSHJ1t7JU2yYdlFAj4fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739620762; c=relaxed/simple;
	bh=SqxS0X7sdgiWSk3boCisBeuOP/1jNaoHAIx3ciI/2q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdzvbEr7JiTcp2kVNwFrXo5gyTZEF3C5mNi1mIl8KXHrATqbgXnGZSmG+pnZo1+EXG/Nh3IT/HcVdSTR7eRKisONglHZzBUqBG3gQCymcUAuzM35QNy3jPhRzjfXNAxs3QI/gfE18sfd2wAKrdRxRJvkRUfefu74MV1kcDSRlkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kvvOirpW; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kvvOirpW"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so5550389a12.1
        for <devicetree-spec@vger.kernel.org>; Sat, 15 Feb 2025 03:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739620757; x=1740225557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5P3FZcPWbqay5nDC1tH22mp1U7HpFheKvfrhqbFlmZE=;
        b=kvvOirpWvWTRqgT33CUpfS6s+P2SUI4QCHaB6x4gdvzZqCpmnutWWAczqrb5MG2Fk9
         LshxqvlDZMtTj90gIhocKXSGq6wu0MIUk23olyAtdaYz1IamJ3wquaFv1pjrMiRk0m00
         quxwSy+D/3doo6yJz+IVoaJq5HWQ+LJNgphJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739620757; x=1740225557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5P3FZcPWbqay5nDC1tH22mp1U7HpFheKvfrhqbFlmZE=;
        b=J+JC2J7fVnUiudFI4KYYSjeLTUIJGl4mwLmjvStVxo1E4gddjsjuX01pVaYXxjLu8u
         ibAzIKTXnk0uz3P2UktlOoB21+vURbkqzD0hrVDmD6ZOoTAkaNHOWyu+hvd28fweTEpj
         4vxAxcoyJHRbNNnLn/23N27Z91UjmxeWyvCAJNiMtHx+Z17UxqqjISA1f0JYY/vMpDi4
         IjNjYgb7f4X6vd4/ZjCuxaXUpm/FbyjvVkNKF5Nrm5+0BkspAa/dzcmFr3I5RXF5SDmy
         QWNnsKJ0L+8FdYzuVX1AJebwAJ19N1MtxolCr9KMOBG1xDEjqqi4pkdmod/xh0oQwDCq
         SiyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOar0MSfb5jmimfOD8QfZSVN94SWee9b3OtCRG72uDxFFGwRtsCe9dIxAiTZweoq4ulHyhnp9TGVbz/1r93Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZG3OfEwtQL5PxZOqYStG1+GiNjYPURaz0d/NrRSKj4RO6xstK
	KFLiyqIwnFkWyl/dAQIwOIJ5DtAlAWloAY7JWPPSeqgb058fbpgSUiwhdB7CU8tAMbkZtvdX4CA
	12SZbbI5bi3nyRUB/4dVS61Hy6BYT1sFmt8Zl
X-Gm-Gg: ASbGncuyVkQ6DVVgaZtd8pwm+xFycG3IEzGQpnbaNuJtiIOZHJ2heDC5OFIQHTJIhI9
	eImfN+yWWbE36ei0nG7VOB5lqlyLfhKKUfZt/7uRim9VVm3kLh+rfqrlDifLNEW+mphopvgNgzA
	==
X-Google-Smtp-Source: AGHT+IHUJxq8b9z7gpsyR4j7BGhxZlfMvBoPd9C4dJTW08iGQ9xZ/C6DduVCHZiiJRfY0ik1uPZCTXH3h7bWfbrJNv8=
X-Received: by 2002:a17:907:78b:b0:ab7:c115:68fd with SMTP id
 a640c23a62f3a-abb70e61a23mr232639566b.53.1739620757446; Sat, 15 Feb 2025
 03:59:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205-bootsource-v1-1-95f4ba69ac27@cherry.de>
 <CAFLszThr_vLbhU7A0_0VTLCGW03k6NmtxLVoW7OzrtxGFertZg@mail.gmail.com>
 <fb6792e8-97c5-4d0e-8ded-e73ea3a7513c@cherry.de> <CAFLszTg9-jMk0PBBSEVT=FonzRUNJOQ5NBMdDYUihWS8NkMhbQ@mail.gmail.com>
 <fc2c6f06-98d9-49d3-9ce5-46dd675e8846@cherry.de>
In-Reply-To: <fc2c6f06-98d9-49d3-9ce5-46dd675e8846@cherry.de>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 15 Feb 2025 04:59:06 -0700
X-Gm-Features: AWEUYZnOH2Gags1-pfb8HTwFVAcoX45UgopkfFOzdLjLAX2UNcpD7y7zAcoCAnA
Message-ID: <CAFLszTi2pa56uY95BRvd0snNJC_4qLV3Nm=_4EK5xXDzbmGF6Q@mail.gmail.com>
Subject: Re: [PATCH] Add 'bootsource' /chosen property
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+dt@0leil.net>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree-spec@vger.kernel.org, u-boot@lists.denx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

On Mon, 10 Feb 2025 at 09:25, Quentin Schulz <quentin.schulz@cherry.de> wro=
te:
>
> Hi Simon,
>
> On 2/9/25 3:28 PM, Simon Glass wrote:
> > Hi Quentin,
> >
> > On Thu, 6 Feb 2025 at 08:46, Quentin Schulz <quentin.schulz@cherry.de> =
wrote:
> >>
> >> Hi Simon,
> >>
> >> On 2/6/25 1:33 PM, Simon Glass wrote:
> >>> Hi Quentin,
> >>>
> >>> On Wed, 5 Feb 2025 at 02:12, Quentin Schulz <foss+dt@0leil.net> wrote=
:
> >>>>
> >>>> From: Quentin Schulz <quentin.schulz@cherry.de>
> >>>>
> >>>> Bootloaders typically can be loaded from different storage media, su=
ch
> >>>> as eMMC, SD card, SPI flash, EEPROM, but also from non-persistent me=
dia
> >>>> such as USB (via proprietary protocols loading directly into SRAM, o=
r
> >>>> fastboot, DFU, etc..), JTAG, ...
> >>>>
> >>>> This information is usually reported by the SoC-ROM via some proprie=
tary
> >>>> mechanism (some specific address in registers/DRAM for example).
> >>>>
> >>>> It would be useful to know which medium was used to load the first s=
tage
> >>>> of the bootloader. SoC-ROM shall be ignored and not reported in this
> >>>> property.
> >>>>
> >>>> This can allow client programs to detect which medium to write to wh=
en
> >>>> updating the boot program, or detect if fallback mechanisms to
> >>>> unexpected medium were used to reach the client program's execution.
> >>>>
> >>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> >>>> ---
> >>>> Bootloaders typically can be loaded from different storage media, su=
ch
> >>>> as eMMC, SD card, SPI flash, EEPROM, but also from non-persistent me=
dia
> >>>> such as USB (via proprietary protocols loading directly into SRAM, o=
r
> >>>> fastboot, DFU, etc..), JTAG, ...
> >>>>
> >>>> This information is usually reported by the SoC-ROM via some proprie=
tary
> >>>> mechanism (some specific address in registers/DRAM for example).
> >>>>
> >>>> It would be useful to know which medium was used to load the first s=
tage
> >>>> of the bootloader. SoC-ROM shall be ignored and not reported in this
> >>>> property.
> >>>>
> >>>> This can allow client programs to detect which medium to write to wh=
en
> >>>> updating the boot program, or detect if fallback mechanisms to
> >>>> unexpected medium were used to reach the client program's execution.
> >>>>
> >>>> Note that this property is already set by Barebox and I'm planning o=
n
> >>>> adding it to U-Boot as well, specifically for Rockchip SoCs.
> >>>>
> >>>> I have some doubts about the wording, especially in the case of
> >>>> hypervisors or chained boot programs. I'm not entirely sure what wou=
ld
> >>>> make the most sense to put in the property for those scenario.
> >>>> ---
> >>>>    source/chapter3-devicenodes.rst | 3 +++
> >>>>    1 file changed, 3 insertions(+)
> >>>>
> >>>> diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devic=
enodes.rst
> >>>> index 8080321d6e60d6b1e86c81af86c6850246a0223b..defd1a46e4ffaa4bb085=
306b5e153d38b740ac66 100644
> >>>> --- a/source/chapter3-devicenodes.rst
> >>>> +++ b/source/chapter3-devicenodes.rst
> >>>> @@ -456,6 +456,9 @@ time. It shall be a child of the root node.
> >>>>                                                           the client=
 program. The value could
> >>>>                                                           potentiall=
y be a null string if no boot
> >>>>                                                           arguments =
are required.
> >>>> +   ``bootsource``          O     ``<string>``          A string tha=
t specifies the full path to the
> >>>> +                                                       node represe=
nting the device the BootROM used
> >>>> +                                                       to load the =
initial boot program.
> >>>
> >>> Could/shoud this be a phandle instead? It might be more efficient.
> >>>
> >>
> >> In terms of size in DTB, phandle vs string probably much more efficien=
t yes.
> >>
> >>   From user's perspective, I'm not too sure?
> >>
> >> /aliases does use full paths for example.
> >>
> >> Having a full path allows for easy consumption, just cat
> >> /proc/device-tree/chosen/bootsource and you'll have the actual path.
> >> Otherwise, we'd need a special tool for that I guess since it'll retur=
n
> >> the phandle number and then you have to traverse the tree to find whic=
h
> >> node has that phandle number?
> >>
> >> Also, I could imagine some scenario where:
> >> - a boot source would not be available in DT yet (though we probably
> >> shouldn't write it in /chosen/bootsource since we wouldn't know the
> >> proper path to it), e.g. USB loading, this is usually done via a
> >> proprietary protocol and/or tool (e.g. rockusb/rkdeveloptool for
> >> Rockchip) but no USB support yet in boot program or kernel (that was t=
he
> >> case for a long time for RK3588 for example and I still have at least
> >> one device without the USB node described yet).
> >> - a boot source would be available in EL3 but not EL2, so does not mak=
e
> >> necessarily make sense to have it in kernel DTB for example. If it's n=
ot
> >> there, can't have a phandle.
> >> - a boot source supported only in boot program's DTB and not kernel's
> >> DTB, we probably still want to provide it to kernel's DTB even if it's
> >> not a device node in it.
> >> - a boot source doesn't necessarily have a label (though we could use =
a
> >> full-path phandle I believe &{/some/path@1f000} probably works). That =
is
> >> not uncommon for SPI flashes for example.
> >
> > Well I'm not sure what we are defining here and which programs will use=
 it.
> >
>
> I'm not sure to understand where the confusion is wrt "what we are
> defining here"? Can you please clarify?
>
> Used by whatever and whoever wants to have some specific logic based on
> which medium the DUT was booted from, e.g. software updaters, distros or
> CI tools (labgrid in my case)? If your software is assuming the DUT is
> booted from eMMC while it is actually from SPI, you may think you're
> updating (including security fixes) the SW while you're not.

So for example, VBE includes a node which tells you which device is
used for firmware updates. If VBE is used, does it supercede this
setting?

>
> Throwing ideas right now, but this could also probably be used by
> fastboot/DFU to know which medium (e.g. MMC, SPI) to update by default
> instead of using one that defaults from the env/bin. I have no
> experience with either so maybe that's misleading.

What are you planning to use this for? Can we scope it to that, initially?

>
> > I don't really like the idea of mentioning a boot source that is not
> > in the device tree. In fact that's one reason why I believe it is
> > better to use a phandle, since it enforces that. The RK3588 things you
> > mention sound like things the vendor should fix from day one, if it
> > matters.
> >
>
> There is no such "full Device Tree support day one", especially for new
> arm SoCs. We still do not have USB-C support on Radxa Rock-5B (it's on
> the way but still), the introducing commit was made more than two years
> ago already. I don't understand what's being suggested here.

You mentioned that we have to use a string because it might refer to a
node not in the devicetree, e.g. we booted from USB but there is no
USB node in the devicetree. My suggestion would be to add that node,
even if it is empty.

>
> > If the boot-source device is not in the 'kernel' DTB, then why have
> > the boot source there? What use could it be? This seems like having an
>
> Informative?

OK, but this is really what I'm getting at. You must be adding this
for a reason, perhaps many. So please can you list the actual uses
your software will make, with this value in place?

>
> > alias to something that doesn't exist in the tree. But it could also
> > be used to just have "my-silly-device" as the value, with a magic
> > meaning which no one can figure out.
> >
>
> That's fair.
>
> > Re not having a label, we can add one. Yes, fdtdump does not have the
> > schema and doesn't decode phandles, although I suppose we could teach
> > it some basic things, or add a new tool.
> >
>
> If you don't use the same DT for U-Boot and the kernel (which is the
> case for all Rockchip-based devices as far as I know), a label may be an
> issue, especially if you don't keep the symbols in the DTB. Because then
> you need to guarantee that label X in U-Boot matching node Y in U-Boot
> also matches node Y in the kernel and not node Z, so you need some kind
> of hardcoding/mapping somewhere in U-Boot.

Wouldn't you set it correctly when you update the /chosen node? There
is no sense in putting this property in either the U-Boot or Linux
devicetree. It needs to be added to the Linux devicetree, in the FDT
fix-ups, just before booting LInux, like we do with other things in
the /chosen node.

>
> > So overall, this seems like a balance between short-term convenience
> > and long-term confusion.
> >
> > To me, the strongest argument for paths is that /aliases uses full
> > paths rather the phandles. I believe that was a mistake (it caused
> > problems in SPL as it bloats the DT), but I've not looked at what it
> > would take to change it now.
> >
> >>
> >> And additional argument for full-path: Barebox already uses that.
> >
> > Were there discussions with that, which could be used here?
> >
>
> @Ahmad, any piece of history you'd like to share here maybe?
>
> What I can say from glancing at the code is that for Rockchip they do
> the following:
>
> Register a bootsource type (e.g. MMC, SPI, I2C, USB, etc...), a
> bootsource instance of that type (e.g. MMC0, SPI3, I2C7, ...). The
> mapping between what the ROM says the device is vs what it is in the DT
> is done in their Barebox-specific DT via this custom prop in /chosen:
>
> barebox,bootsource-<bootsourcetype><bootsourceinstance> =3D &label;  #
> =C3=A0-la /aliases
>
> This gets read and resolved and then inserted as
>
> /chosen/bootsource =3D "/some/path"
>
> into the kernel DT.
>
> > Anyway, if this is the way you want to go, I think it would be useful
> > to add some of your notes above into the binding, so there are some
> > rules around it.
> >
>
> I'm not sure what classifies as a rule in what I suggested, could you
> elaborate on that maybe?

Let's get the info on what you are actually going to use this (you, or
your company).

But overall, I don't really have a strong opinion on whether this
should be a string or a phandle. If we consistently used phandles
today, I would want that, but we don't, so it seems that ship has
sailed.

Regards,
Simon
