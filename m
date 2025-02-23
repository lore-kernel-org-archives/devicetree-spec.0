Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23842F46
	for <devicetree-spec@vger.kernel.org>; Sun, 23 Feb 2025 00:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740270799; cv=none; b=n2BIS7cOgmwsw4mA2yywFKsliAm5QcxRLrpgGFJnDplNj5RW0ZSNDL/jH+HsfYRodOKDgg+doJZUwrXZjY205fe+KqeZQdNV5iZTpZNdrr7ypYY1V+21yw9iX7Is+AQKg1MEgNRxZwuNVjrX9nrOYqBjiQLtb+aRABLrnPHLCIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740270799; c=relaxed/simple;
	bh=QLMCNCiwKqFAvbjXYABKCcQvrYJFW+We2cMPvZ/oDzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6iBN0BLgf1eJhJPE3WzvjQVp7T3aCvIjV/qB/TmpUKntfsK1J4kOYvEBSZ92QvQ/8u7vN9PjEyxMMVSPdeqtj4mwySFjWTONitbZ0rvmQBFwEUJfan6Ir3SbYtWGlkLLnOBjhzGcB1pIB/QmmGd5u3aDvZcHsVY5DDe7tzxLIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jb4x3YP2; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jb4x3YP2"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaec111762bso720877066b.2
        for <devicetree-spec@vger.kernel.org>; Sat, 22 Feb 2025 16:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740270796; x=1740875596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNdEyuFHUP3y64ux1I5nc8h7S6Yf3Be726yC4Moi4JY=;
        b=Jb4x3YP2ME7sWRMFwyBACF8LhbJkdHAl8w0D1X86yG7lJVp57psBXpvaQuyOdr4sYA
         JmAi9uQ5YXQMnFEOySygUFbsdjmwJ+APhVpjfGM/z6uuGMW+/Pp/XgsUS1EJUA87nCSj
         8Usv2KO+0McyGciDaZVR57qORo2lS59USMkpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740270796; x=1740875596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNdEyuFHUP3y64ux1I5nc8h7S6Yf3Be726yC4Moi4JY=;
        b=qactF2wjnIV8jGPoD5f+9iHo0liizm3Kb8QaUmk9LU62mNeWQHlBv0Uud+7odgu6Cx
         Fx7KVzMtFyIHiS5xpf7zO8a2wMxi+ll2J7s9m5Zv43vqWW+QkOEzFEd8RbV1Uf4ziNhy
         jF/yOsQ7SlZzF3en/f48rbon2/c19nHrhnhViAZ0TmZB+TEb4/vhZfxnPNQvry6kGCg5
         V4UPmcTu4BZL7HBxliBkXjZkwOnFZV/lfOH1k2LFDAVoK+DTp76XYf89gespxqqHawe/
         g0BjB0IbUffKeJdXX7NSfye4VvayNuhkiwmR5n0mw2AaIgZCtdoibrndf9MLynXG42HS
         sbiA==
X-Forwarded-Encrypted: i=1; AJvYcCV4WR1O1JlN69iGre191qEi5g1qEHTJvtn/Py6g35X9LJT7AqcRv+fQcPHeuy4nVBNPy/mpF71tA21ouObP54o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZIIFJhotfj4oda5goWkUJJkG/lfKj4NPKzpSr9t538ImNnnzm
	jNGP5tfiyEo33PXd0FnZ3xYemRineOw7y+3FNS3L5pkkaFss3PMSrF30uGZ4Nk0iF+cEh97WVe4
	MU3L+t6oAyE0OlDN5maK/fgt8kOpNEhPZNNqd
X-Gm-Gg: ASbGncv58fDo7SGpyGaNZaPgJuOQQJqB4jNBiTrtNK++jlT03b/k94OjBFJ9UpV8G8B
	dqp+gC+QEt4tVnvCY7IDtZfPuQJnffwMN3O/7gxHUt86zR7dYiOW6ayJjxQpzPAli/VYer3YtQY
	V8b/+/mbjy
X-Google-Smtp-Source: AGHT+IFy+V4++6Q9lqCfUEH28dLJotMSi/e/WBY2X2PO2HDBOQO/d7LoVoutjlu1EeeWjY7g+KNFlHBFTH6lfqXa6gU=
X-Received: by 2002:a17:907:2d92:b0:ab8:c215:fd27 with SMTP id
 a640c23a62f3a-abc09a42e5cmr900553966b.14.1740270795951; Sat, 22 Feb 2025
 16:33:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205-bootsource-v1-1-95f4ba69ac27@cherry.de>
 <CAFLszThr_vLbhU7A0_0VTLCGW03k6NmtxLVoW7OzrtxGFertZg@mail.gmail.com>
 <fb6792e8-97c5-4d0e-8ded-e73ea3a7513c@cherry.de> <CAFLszTg9-jMk0PBBSEVT=FonzRUNJOQ5NBMdDYUihWS8NkMhbQ@mail.gmail.com>
 <fc2c6f06-98d9-49d3-9ce5-46dd675e8846@cherry.de> <5E98D444-A005-42CD-8A6A-381791237A6E@makrotopia.org>
 <07eb10ff-2791-420d-a302-a2e8c308b468@cherry.de> <Z7dItf07omjuTm0U@makrotopia.org>
 <6b6925ee-ba1a-46ed-88dd-87b3bc4b77a5@cherry.de>
In-Reply-To: <6b6925ee-ba1a-46ed-88dd-87b3bc4b77a5@cherry.de>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 22 Feb 2025 17:33:04 -0700
X-Gm-Features: AWEUYZkkJZ4zJg8XiyMqJ7ASjCPovrI_68BsEgOd7sgyWmsj1dhXJkzCPzUpe2k
Message-ID: <CAFLszTh9UcS=3JSO5ZUTr7d6g9+dhorxJBP1--YkpsOcny7Y7g@mail.gmail.com>
Subject: Re: [PATCH] Add 'bootsource' /chosen property
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Daniel Golle <daniel@makrotopia.org>, u-boot@lists.denx.de, 
	Quentin Schulz <foss+dt@0leil.net>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree-spec@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

On Thu, 20 Feb 2025 at 08:55, Quentin Schulz <quentin.schulz@cherry.de> wro=
te:
>
> On 2/20/25 4:22 PM, Daniel Golle wrote:
> > On Thu, Feb 20, 2025 at 04:04:27PM +0100, Quentin Schulz wrote:
> >> Hi Daniel,
> >>
> >> On 2/15/25 4:13 PM, Daniel Golle wrote:
> >>> Hi Quentin,
> >>>
> >>> On 10 February 2025 16:25:23 UTC, Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
> >>>> [...]
> >>>> What I can say from glancing at the code is that for Rockchip they d=
o the following:
> >>>>
> >>>> Register a bootsource type (e.g. MMC, SPI, I2C, USB, etc...), a boot=
source instance of that type (e.g. MMC0, SPI3, I2C7, ...). The mapping betw=
een what the ROM says the device is vs what it is in the DT is done in thei=
r Barebox-specific DT via this custom prop in /chosen:
> >>>>
> >>>> barebox,bootsource-<bootsourcetype><bootsourceinstance> =3D &label; =
 # =C3=A0-la /aliases
> >>>>
> >>>> This gets read and resolved and then inserted as
> >>>>
> >>>> /chosen/bootsource =3D "/some/path"
> >>>>
> >>>> into the kernel DT.
> >>>
> >>> We are doing something quite similar downsream at openwrt.org for Med=
iaTek router SoCs, see for example:
> >>>
> >>> https://github.com/openwrt/openwrt/blob/main/package/boot/uboot-media=
tek/patches/310-mt7988-select-rootdisk.patch
> >>>
> >>> https://github.com/openwrt/openwrt/blob/main/target/linux/mediatek/fi=
les-6.6/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi#L32
> >>>
> >>> https://github.com/openwrt/openwrt/blob/main/target/linux/mediatek/fi=
les-6.6/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtso#L60
> >>>
> >>>
> >>> Of course we could use the standard "bootsource" property instead, bu=
t having a way to reference the volume or partition used as rootfs instead =
of just passing a referencd to a physical device is advantagous...
> >>>
> >>
> >> If I understood correctly, your prebuilt DT would have
> >>
> >> / {
> >>      chosen {
> >>          rootdisk-emmc =3D <&rootfs_in_emmc>;
> >>          rootdisk-nor =3D <&rootfs_in_nor>;
> >>          rootdisk-sd =3D <&rootfs_in_sd>;
> >>          rootdisk-spim-nand =3D <&rootfs_in_ubi>;
> >>      };
> >> };
> >>
> >> and then at runtime you would populate /chosen/rootdisk property with =
the
> >> "rootdisk-<medium>" string with <medium> matching whatever the BootROM
> >> reports. I assume the goal is to somehow make sure that the rootfs is =
loaded
> >> from the same storage medium as the one used by the BootROM to load th=
e
> >> first stage bootloader?
> >>
> >> Can you confirm I did get that right?
> >
> > Yes, that's more or less correct. It's to point Linux to the device or
> > partition of the uImage from which U-Boot has loaded the Linux kernel.
> >
> > Note that for OpenWrt we prefer to store the uImage.FIT inside a raw
> > block or flash partition, or UBI volume, rather than as a file inside a
> > filesystem.
> >
> > This information is then used for two things:
> >
> >   - Mount the root filesystem
> >     We use a read-only squashfs which is part of the uImage.FIT, it ess=
entially
> >     has the same purpose of an initramfs on other distributions, but mo=
unting
> >     squashfs is much faster then decompressing the whole initramfs at o=
nce, and
> >     it doesn't need to remain in RAM permanently.
> >
> >   - Know where an updated uImage.FIT should be written to.
> >
>
> OK, so everything in a FIT image and you store the location and storage
> medium where it was loaded from so that you can update it. Makes sense.
>
> I guess we could have bootstd/bootmeths populate another property that
> specifies which medium and partition was used to load the kernel/FDT and
> initramfs. I don't have much experience with that aside from
> extlinux.conf and that wouldn't be appropriate I believe especially if
> you used root=3DPARTLABEL=3D or a UUID in your kernel command line as the=
re
> could be multiple ones with the same there (e.g. we have the exact same
> image you can flash on SD card and eMMC and the probe order isn't
> deterministic in the kernel I believe).
>
> Don't want to get sidetracked too far though, I don't think it is
> incompatible with or related to /chosen/bootsource usage?
>
> >>
> >> I was specifically NOT aiming /chosen/bootsource to represent the stor=
age
> >> medium used to load the kernel or rootfs, but rather the medium that w=
as
> >> used by the BootROM to load the first stage of the bootloader that is
> >> user-flashable/uploadable.
> >>
> >> You could very well decide to load/mount your rootfs from SD even if t=
he
> >> BootROM loaded the first stage bootloader from SPI-NOR. This property =
is
> >> about representing the latter, not the former and not merging the mean=
ing of
> >> both into one.
> >
> > Of course, especially for general purpose Linux which would not fit int=
o
> > NOR flash that's the only option.
> >
> > In case of OpenWrt we usually do want to load kernel (and rootfs) from
> > the same device also used by the BootROM for booting. OpenWrt can easil=
y
> > fit onto 16 MiB of NOR flash, including bootloader, EEPROM for MAC
> > addresses and WiFi calibration as well as some megabytes for user data.
> >
>
> We (Cherry/Theobroma) have some modified behavior for bootstd to favor
> booting from the same storage medium as U-Boot proper (so NOT
> necessarily what is reported by /chosen/bootsource) instead of
> defaulting to boot from SD card first and then eMMC. See
> https://elixir.bootlin.com/u-boot/v2025.01/source/board/theobroma-systems=
/common/common.c#L11.
> So I very much understand your usecase :)
>
> FYI, U-Boot SPL favors for loading U-Boot proper the same storage medium
> as was used by the BootROM (so that would be the same as reported by
> /chosen/bootsource here!) and this is modeled with the "same-as-spl"
> string in /chosen/u-boot,spl-boot-order property. I was thinking of
> adding a "same-as-proper" boot target for bootstd so I can remove my
> custom setup_boottargets. This was also somehow asked by at least one
> person over IRC some months ago, so maybe I'm not the only one with this
> usecase :) Haven't spent time looking into it and I may never have time
> to do so, take this as a brain dump here :)
>
>
> > To satisfy both needs, I reckon we would need to formally introduce an
> > OpenWrt boot-method to U-Boot, and then U-Boot could leave a mark in
> > /chosen where the uImage.FIT was loaded from, independently of the
> > BootROM which may differ?
> >
>
> Yes, I don't think both could or should be represented by the same proper=
ty.
>
> To sum up, specifically for U-Boot:
>
> BootROM loading VPL/TPL/SPL -> /chosen/bootsource (what this patch is
> suggesting)
> VPL loading SPL -> don't know, haven't checked the VBE series yet :(
> maybe Simon has something in mind?
> SPL loading U-Boot proper -> /chosen/u-boot,spl-boot-device
> U-Boot proper loading kernel/fit/... -> nothing at the moment
>
> Forgot to thank you for sharing what OpenWRT does :)

Thanks for all the details. It seems fine to me. Perhaps you could
copy some of the text above into your binding so there is more detail?

Regards,
Simon
