Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E38D5CDF1
	for <devicetree-spec@vger.kernel.org>; Tue, 14 Jan 2025 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736886990; cv=none; b=lF/+opC/Hmkul+2CbTttR8NcLsx1l17mmmw6fkjIWqYWegitM79H0YHog2xYdbRVf0A+W5S4lf3MZV/K7zTRPU/5IFz4rlxBG0sQnCES6xCZ3e4IM/HqI9DTgGwKrEH/cjrz0kBJ3+vSNcfrCp+KxRxuQpL3G8HnlEquDDJDfTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736886990; c=relaxed/simple;
	bh=kTP9oDtkcZApaMj9+tUVDDb/EhjaAw4lOXL2LiglYIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJa8a+BluRS7rXfpPMWdQKYsubQurFEw5iCeODLsAtWK9UjqMxHBqDnTTbWHH8ntFWU4vTmXbA2k9a11HespcIJ66sLj9hfadVPKyKweGWni3UDLW+DmSvH8ZuznQmUcauVclPPd6NpjTOiZBckd+AMijNO1L54KfG8JBkDIsDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HqzJVL4i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HqzJVL4i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF8DC4CEDD
	for <devicetree-spec@vger.kernel.org>; Tue, 14 Jan 2025 20:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736886989;
	bh=kTP9oDtkcZApaMj9+tUVDDb/EhjaAw4lOXL2LiglYIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HqzJVL4i9qQYjSY/H4PIn2eaz111eXQbr1NhepXfurCoLL5S7NiaY3L7fZDMSd59D
	 Fmo8fdqqkpYeqPI6aMz4QTXFaMy+fKV3Bqfr0NIWxgffd3U+8Lamq7+uwutLtldNTn
	 SmDT3+9sHF4oqntWQgZQv9Nc1otmf++LqOuaRJ8L1kzw1+HLM+95lKs9b4JTIVC+R/
	 C6c8/KD4OEsWLp2jiYi1FXGjX0GQ7B5LryPbe6yNWuX5se3VHWQFw6IGpU5uXo9zFu
	 P7Mc3w6Q5KQUMCf1L9jM8uML6TcrsJNZnEmV48IbhA+t/c4SPv9yJ29WyPnD/FGJQt
	 0hZQHoXC0udEw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3778bffdso6234008e87.0
        for <devicetree-spec@vger.kernel.org>; Tue, 14 Jan 2025 12:36:29 -0800 (PST)
X-Gm-Message-State: AOJu0YxHKCHgWmwPFO1XhbgV39suzpWSHPl1UoMEaqnlvqE0ZGfs/ghh
	jGzbnXqlpFPtoyyz6TwUxIMg1Yovy4PC3huHHLRrbzei53thu5uN0KW7ivTxhmDnNpO8kk1F/dU
	KvWOg5bdWzVj85VN5wRcyR6RGLA==
X-Google-Smtp-Source: AGHT+IFxHDI+0tDcinyedlDz4rkyUyt9IF3K11VmEn3dUB+UdJfAK7LOTZ/iZkjh1J1fpvcLdekprZ6TvKxeM4YEe6g=
X-Received: by 2002:a05:6512:159e:b0:542:98bb:5674 with SMTP id
 2adb3069b0e04-54298bb57famr3994823e87.33.1736886988123; Tue, 14 Jan 2025
 12:36:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <48defa98-9718-4997-86cb-b171187708a6@cherry.de>
In-Reply-To: <48defa98-9718-4997-86cb-b171187708a6@cherry.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jan 2025 14:36:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLJ86n8iX5wt4dEuZz6rudxXKFOuuEGXbk7f4ydvTZLjg@mail.gmail.com>
X-Gm-Features: AbW1kvYk8uSNemjuW7kZFQyGqN4obc41splUmWhupts8VGdl-n3N7N5MoFUPXM4
Message-ID: <CAL_JsqLJ86n8iX5wt4dEuZz6rudxXKFOuuEGXbk7f4ydvTZLjg@mail.gmail.com>
Subject: Re: [RFC] Adding bootsource and reset-source* to /chosen
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: devicetree-spec@vger.kernel.org, 
	U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 12:08=E2=80=AFPM Quentin Schulz
<quentin.schulz@cherry.de> wrote:
>
> Hi all,
>
> In U-Boot, there are multiple stages which can be loaded from different
> media each. On Rockchip SoCs, it mostly goes this way, SoC BootROM loads
> from a medium (storage or over USB) and executes the TPL (or SPL if no
> TPL supported), the TPL goes back to BootROM and reads the SPL from the
> same medium and executes it. The SPL will favor the same medium for
> loading the U-Boot FIT image (containing TF-A BL31, OP-TEE OS BL32 and
> U-Boot proper image), but in case it fails, falls back to other possible
> media. In U-Boot we have the storage medium used for loading the U-Boot
> FIT image stored in the DTB under /chosen/u-boot,spl-boot-device
> property. But we do not have a property for the medium the BootROM
> loaded the TPL (or SPL) from. This could be useful information. For
> example, I have some CI where I want to check whether the BootROM loaded
> the TPL from the expected location (important when checking that they
> all work and don't depend on a bootloader flashed in a fallback medium
> for example). Another usecase could be to detect whenever one loads the
> TPL from USB (not a USB stick, some USB transfer; see rockusb for
> Rockchip for example) and decide to do something else in U-Boot or the
> OS depending on that (could be starting DFU for flashing the device, or
> fastboot for loading the rest of the system).
>
> Barebox currently does that by setting /chosen/bootsource to the full
> path of the device the BootROM says it booted from, but that isn't part
> of the DT spec so before I add support in U-Boot for that, I'm asking
> whether that's fine or if we should correct course in Barebox and use
> another name and/or location.
>
> I've also been made aware of other "sources" that are added to the
> /chosen node in Barebox, reset-source, reset-source-instance and
> reset-source-device. I am not entirely sure what those exactly are for
> BUT it seems that this is of interest to U-Boot as well since we do try
> to report a reset cause as read from the CPU for Rockchip SoCs, c.f.
> https://elixir.bootlin.com/u-boot/v2024.10/source/arch/arm/mach-rockchip/=
cpu-info.c#L14.
> I believe /chosen/reset-source would be the reason, e.g. "POR", "RST",
> "WDG", "WKE", "THERM", etc. /chosen/reset-source-device contains the
> node path to the device that triggered that, that could be useful in the
> event there are more than one thermal trip point (e.g. CPU or GPU), or
> more than one hardware watchdog (I for example have a system with
> potentially 4: SoC, PMIC, 2 separate in an external MCU). I guess
> /chosen/reset-source-instance is for HW blocks that expose the same
> reset but from two different sources which aren't modeled in Device
> Tree. Again, this would be useful for the bootloader or OS to decide to
> do something else based on the reset cause (e.g. have data on why some
> devices reboot in the field, e.g. because of thermals, power loss,
> brownout, etc..).

Is the handling of these properties something common/generic or going
to be device (e.g. wdog, pmic) specific. For the former, then /chosen
makes sense. For the latter, maybe everything being in the device
nodes makes more sense. Then you wouldn't need a link to the device.

> I'm reaching out to the devicetree-spec community before I add code in
> U-Boot to implement this so we don't add unnecessary backward
> compatibility code, were the properties or locations to be modified to
> match the spec.
>
> Does anyone disagree with adding this to the spec? Does anyone have
> another suggestion for the naming or location of the properties?

I always feel better if we have multiple users for a new, common
binding. A new binding extended by a 2nd user shortly after defining
it makes me grumpy. Here's a thread that came up with the same type of
issue:

https://lore.kernel.org/all/20250113112349.801875-1-prabhakar.mahadev-lad.r=
j@bp.renesas.com/

> Would you prefer a patch to the spec and discuss "code" directly there?

Generally, anything new is schema first. Ideally the spec would get
generated from schemas, but there's no work being done on that.

Rob
