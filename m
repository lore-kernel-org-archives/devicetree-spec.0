Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD5C1DF24B
	for <devicetree-spec@vger.kernel.org>; Thu,  6 Feb 2025 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738845246; cv=none; b=NydqdpTCmxDMJowTax6I8OPdU6BN4nqQZLCAel3pxgbUL6LTTf35w3U1kKrArJ7M7goszaTejNVDDe8Je8q/NioqGjz2iI4bMUQWENp6mh9rhn27yp8n374zqevSm31/yoi5i0TJHsyBYcyEEsRx+bgmWu/s7fcEiT5o0vJ3pZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738845246; c=relaxed/simple;
	bh=vKiHvYssF/iuMM5mzWLSAAQjOC8779JQ0SDRroVTnkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZ119dOFwCD4krSqyFuVJfcryEIx8NsLP6goNDtR2qyZKDiSMs6nMHy1N+sV+pttHA7LApz1BBUODimdYDoTS6hk72ad594SxU0SgSJHZHjw/xi14Qr9Bb3wXkqMozEePMO6lRY8Wo62tKAmCxhJ+8CFlRwLsWFiPOXr6Aot9aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g41/RMIo; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g41/RMIo"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so1699519a12.0
        for <devicetree-spec@vger.kernel.org>; Thu, 06 Feb 2025 04:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738845243; x=1739450043; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gHqkAdcIlZr83Jxhut0FO7fEQOGkYW/42vDl87S/VGs=;
        b=g41/RMIocJwHrawb28/new7ibuqswktWlWqyNw9Q1lGa83lJL9Qfs4CqKiSF0xlVI7
         4W1WK8fE8x4c9KoiBz8WPsAyiO1W4bFFez2lu7cPQATgY8SPL/VHGTcleG5JOepWgAUe
         /Z5ACbf+RmBCLH5cYJL3dAiXwZUxUSDXtqNfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738845243; x=1739450043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHqkAdcIlZr83Jxhut0FO7fEQOGkYW/42vDl87S/VGs=;
        b=uGt0TR1XCYlOO52UAhRhsR4v7GA70xAU84G4XlNqt0Q4AxhQSnazn7Ea2FcM8+YA7a
         Nt7frKDKlgeiHs8bqGTUehT+EQZQtG5gBbl4/vAabq4qSn4B3tav7q7p1Q/dv356po+h
         OXVHxVSzYJ6ncgvMkKNtbf/npcvw/ztM0sAY0r1GteuLToYdvHqKwj9My1nf5V6w0F2y
         21vc+UcZhSJ42+WFOwjBYDQdr4BhX5aQHiWOZ2NsmUzRQ1hjWQatOi9oBed+j8Td6egz
         +8sUafgX5VfndJXqY9Sm0lndOALSW5AMZ+iMz3fRZiJIj9ftwgA7d8iCH0m41EWPBofG
         /jSg==
X-Forwarded-Encrypted: i=1; AJvYcCVv7upEhtUnSiyDNwGpD0jvdmCQY2351JVLL7veXY4kgg9ebhu84eMCBJWk2uwiTbWJts7BTHj1W2yzoSFWzBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0GvUm6Lo1IkRzNHP14cWj5ELj+3FZpKpQpuSXDbCggtBpb28/
	0n0hXflyeW/jcsmkLqCu+wQ/qZWQGVL/Im+9w9VSWjF0ADHW/bowIx68Nr/SMFk+Gn7ZutdOCQK
	3EB6sUnfpOXJAC1Xg+kToOoM4/AakczHcWj+V
X-Gm-Gg: ASbGnctQ7e6khjT7VOSSWViGxKoyjzE7ePirnjHCbxniMqQMkmoDALw6WjH9s1I1Em/
	R9oYMeuICId83kRCyh5sY6vlVsLy81PioRRm/MGv469dVnRpcMNuSwzxVb92tM90T9b+5ZJG9gg
	==
X-Google-Smtp-Source: AGHT+IG9/zVcwPAgaQzYXPFyO74fEe9R1b/W0DUiyy85R7TIIFG9HV07K1RcZ0MdZZgKxYEWIsdghqLOY6akBOvkjh8=
X-Received: by 2002:a05:6402:3508:b0:5dc:dfc4:4aa0 with SMTP id
 4fb4d7f45d1cf-5dcecc96b83mr3036531a12.8.1738845243132; Thu, 06 Feb 2025
 04:34:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205-bootsource-v1-1-95f4ba69ac27@cherry.de>
In-Reply-To: <20250205-bootsource-v1-1-95f4ba69ac27@cherry.de>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 6 Feb 2025 05:33:51 -0700
X-Gm-Features: AWEUYZm87uehcjS7OzT_e3knKYWvxlwQT02wiUO5a6yjHi-b0-AvjI4387WgLH8
Message-ID: <CAFLszThr_vLbhU7A0_0VTLCGW03k6NmtxLVoW7OzrtxGFertZg@mail.gmail.com>
Subject: Re: [PATCH] Add 'bootsource' /chosen property
To: Quentin Schulz <foss+dt@0leil.net>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
	devicetree-spec@vger.kernel.org, u-boot@lists.denx.de, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

Hi Quentin,

On Wed, 5 Feb 2025 at 02:12, Quentin Schulz <foss+dt@0leil.net> wrote:
>
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> Bootloaders typically can be loaded from different storage media, such
> as eMMC, SD card, SPI flash, EEPROM, but also from non-persistent media
> such as USB (via proprietary protocols loading directly into SRAM, or
> fastboot, DFU, etc..), JTAG, ...
>
> This information is usually reported by the SoC-ROM via some proprietary
> mechanism (some specific address in registers/DRAM for example).
>
> It would be useful to know which medium was used to load the first stage
> of the bootloader. SoC-ROM shall be ignored and not reported in this
> property.
>
> This can allow client programs to detect which medium to write to when
> updating the boot program, or detect if fallback mechanisms to
> unexpected medium were used to reach the client program's execution.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Bootloaders typically can be loaded from different storage media, such
> as eMMC, SD card, SPI flash, EEPROM, but also from non-persistent media
> such as USB (via proprietary protocols loading directly into SRAM, or
> fastboot, DFU, etc..), JTAG, ...
>
> This information is usually reported by the SoC-ROM via some proprietary
> mechanism (some specific address in registers/DRAM for example).
>
> It would be useful to know which medium was used to load the first stage
> of the bootloader. SoC-ROM shall be ignored and not reported in this
> property.
>
> This can allow client programs to detect which medium to write to when
> updating the boot program, or detect if fallback mechanisms to
> unexpected medium were used to reach the client program's execution.
>
> Note that this property is already set by Barebox and I'm planning on
> adding it to U-Boot as well, specifically for Rockchip SoCs.
>
> I have some doubts about the wording, especially in the case of
> hypervisors or chained boot programs. I'm not entirely sure what would
> make the most sense to put in the property for those scenario.
> ---
>  source/chapter3-devicenodes.rst | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenodes.rst
> index 8080321d6e60d6b1e86c81af86c6850246a0223b..defd1a46e4ffaa4bb085306b5e153d38b740ac66 100644
> --- a/source/chapter3-devicenodes.rst
> +++ b/source/chapter3-devicenodes.rst
> @@ -456,6 +456,9 @@ time. It shall be a child of the root node.
>                                                         the client program. The value could
>                                                         potentially be a null string if no boot
>                                                         arguments are required.
> +   ``bootsource``          O     ``<string>``          A string that specifies the full path to the
> +                                                       node representing the device the BootROM used
> +                                                       to load the initial boot program.

Could/shoud this be a phandle instead? It might be more efficient.

>     ``stdout-path``         O     ``<string>``          A string that specifies the full path to the
>                                                         node representing the device to be used for
>                                                         boot console output. If the character ":" is
>
> ---
> base-commit: 5688e1c0b961d2ca5a32e3b624a9f4a9b433184f
> change-id: 20250205-bootsource-84df255e9e6c
>
> Best regards,
> --
> Quentin Schulz <quentin.schulz@cherry.de>
>
>

Regards,
SImon
