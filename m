Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099B129DB68
	for <devicetree-spec@vger.kernel.org>; Tue, 10 Jun 2025 14:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749565631; cv=none; b=sXu0JOks6ESg+QwsirOLa78johrFTl5XDcX8fk7UOnppWMF3q0NUN10xDuNGXZwDQtZ8iER6KiE718oAVceCYuv1RcI2RLpYOrrFKKaxYBjliT2JUYEiOkAgphBUe/MJ8QUoYLwHZkC1vkB0B0Y9Y3o7+TZeEuR8cdd/UjUBqgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749565631; c=relaxed/simple;
	bh=7+/Y4jvF0oOIZT/A+1AW8/mZAiOjMLi8NeVCcjMOWsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=da6S/onuaGw09Ba5lu82L22BYO5NzGpAZgMtkitjRPN2fIfrxsfk0kwkTIQjAHMmPLHW9cZRULoF58E5sV4hMWLqX6xgJf9PG7UOsu6VQMmiHpXxzvgiyVC/db9OgsqZib2Hgl3TZXYkEhS0IvVylFrLkZal/pppgowMhy8gOC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IMLCVIuw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IMLCVIuw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so66453035e9.1
        for <devicetree-spec@vger.kernel.org>; Tue, 10 Jun 2025 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749565627; x=1750170427; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jafe8JQP4MaI0csRoQ/CHsatrx2WYQOUYf6Z5J/yRmY=;
        b=IMLCVIuwimBaj69/ZClqPlUjaUp3exkGcTVkIe8Z11SMs5w5/XGjuB6q0dR6tNnPJx
         8SosEGa3cRa+UQkVVQvRZ8n5LZ50sVAFx5GjvYyoeOIrK4P7/emfb/++6hggTik8eVuB
         Ym+BKz+dV2UEUtLh0JzvEigtZrDB7J7GH0w4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749565627; x=1750170427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jafe8JQP4MaI0csRoQ/CHsatrx2WYQOUYf6Z5J/yRmY=;
        b=JoFWC2R+zvAIxoAyT0PuVUI9NfFmy09abGP3Y3qbe7v54nvhJ4sEk0iYLsLr1uqpA8
         Oe3ZcOaKs8MayFcQWNPMzfuAtcnFGo8V+KOO029M97mcDkfU1WYXPgcGzetTIXcLdPt7
         +qe3vE8TGYcupq1yng2yP5aqgNZzaoOZarYSlCxq80RzBLtAAtwjh99bc6hPcPueYlDh
         Z8EM/Ic7+HYsAMSsKOowoZvt+/rlS3hQWHWBcx6mWCojD2Dh+Y//42Knazho2rduBysv
         3WqhCImbhy/95lXFLe52lpyK5SYoy5faD+T8K/p9zdRPpePC2H16L5RFHkWUijjzbRjU
         lM1A==
X-Forwarded-Encrypted: i=1; AJvYcCW3P7j3gve1NEV3o9ygsfhYskECIqF/6bhnOC5OAbdupMvQee0bpZX3xZmwGh8oS7YZNwveZV8xq9FPnOOXVqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJKigXQlh8+BMWcSsH/sJuEDMhBSBrWrOKgjuawncn6+wqkqR3
	7l9DRCJyZytlKKaEKhx4sCZiaUZj9QeU54spIlPSOBATYsvL3WNMtidGssDexMx8KbADgRPRnz1
	fEMDvycqrWIytrwcggs64RGE46OF+b7jQQha0XORG2dPNc1MBUeE=
X-Gm-Gg: ASbGncv8nWmB3Gh0bertgNad1UnUaXTmLH3vlAkDBLj/5H8r4jeO4avA18VztMnMBbO
	3eeMdSDBdOKvJ+GFmcvRF9mVFom+W8KIbWEE+gDENQYNw168DFg98URwLMAxtjyfK/Oln3CC9n4
	6U+RkN+j6MzMHBCPQFGXvd7aoz774YlKa7Z5SFLFnOfRqN
X-Google-Smtp-Source: AGHT+IEDeJCGERZyQut3hicRcgFo/aQtMM3eDkWFo+qN8D18XIDPZ9ZkRslICIYgk8LOgszctNhKpFmk5WTkGbn+7iE=
X-Received: by 2002:a05:6402:d09:b0:606:d25c:c779 with SMTP id
 4fb4d7f45d1cf-60774b80004mr15444736a12.34.1749565616030; Tue, 10 Jun 2025
 07:26:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-bootsource-v2-1-5a315d9bff26@cherry.de>
In-Reply-To: <20250505-bootsource-v2-1-5a315d9bff26@cherry.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 10 Jun 2025 08:26:44 -0600
X-Gm-Features: AX0GCFu90ZllmdqNjQQGKFKxOQNV0eUWbpmKz0IsZ4YDoA9RXD6jgZRV3e8vhz0
Message-ID: <CAFLszTgdhQHoKLaOvAHcvYatjS3dkSNuy_sr-VxQHgpr88GGRQ@mail.gmail.com>
Subject: Re: [PATCH v2] Add 'bootsource' /chosen property
To: Quentin Schulz <foss+dt@0leil.net>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>, Daniel Golle <daniel@makrotopia.org>, 
	devicetree-spec@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 May 2025 at 09:34, Quentin Schulz <foss+dt@0leil.net> wrote:
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
> In cases where a boot program is split into multiple stages (like
> U-Boot), it only represents the device that was used to load the very
> first stage (in case of U-Boot, VPL/TPL/SPL whichever is executed first)
> and not any of the later stages (in case of U-Boot, TPL/SPL/proper) or
> any client program. They may match, but they may not and this property
> is meant to only represent the device used for loading the very first
> stage.
>
> I have a board running U-Boot which currently has 9 boot scenarios
> (eMMC/SD/SPI-NOR for the first stage, eMMC/SD/SPI-NOR for the next
> stages; not counting USB loading yet, which would make it a few more). I
> cannot force the BootROM of this board to select a specific device aside
> from erasing the other media.
> The only way to identify which device was used for the first stage is to
> parse U-Boot first stage console output or add some custom logic for my
> board. To validate that a new version of the bootloader works, including
> the fallback mechanisms, I need to make sure the BootROM loads the first
> stage from the expected device otherwise I may have false positives.
> This would be useful for automated testing.
>
> I could also very well see this being used to identify where the first
> stage of the boot program is stored (which may differ from where the
> later stages are! that's the case for U-Boot proper for example!) to be
> able to update it from a client program.
>
> Note that Barebox has been using this property for a while already, with
> this very content[1].
>
> This is chosen as a string so that it matches other properties in
> /chosen (e.g. stdout-path) as well as allows for extending it, in case
> one needs to provide additional information (e.g. HW boot partition for
> eMMC, a specific disk on an AHCI controller, a specific USB device on
> a USB bus, etc.).
>
> [1] https://lore.kernel.org/u-boot/0066fcc2-3431-48be-8dc2-00ea7e2550c2@pengutronix.de/
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Note that this property is already set by Barebox and I'm planning on
> adding it to U-Boot as well, specifically for Rockchip SoCs.
>
> I have some doubts about the wording, especially in the case of
> hypervisors or chained boot programs. I'm not entirely sure what would
> make the most sense to put in the property for those scenario.
> ---
> Changes in v2:
> - added usecases, non-usecases and increased verbosity of the definition
>   of the property name as requested by Simon,
> - Link to v1: https://lore.kernel.org/r/20250205-bootsource-v1-1-95f4ba69ac27@cherry.de
> ---
>  source/chapter3-devicenodes.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>

Reviewed-by: Simon Glass <sjg@chromium.org>

Does this need to go into the schema as well?

- Simon

> diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenodes.rst
> index 8080321d6e60d6b1e86c81af86c6850246a0223b..98cab42c105d9a390f74a6f80fb2bba61d5bb919 100644
> --- a/source/chapter3-devicenodes.rst
> +++ b/source/chapter3-devicenodes.rst
> @@ -456,6 +456,23 @@ time. It shall be a child of the root node.
>                                                         the client program. The value could
>                                                         potentially be a null string if no boot
>                                                         arguments are required.
> +   ``bootsource``          O     ``<string>``          A string that specifies the full path to the
> +                                                       node representing the device the BootROM used
> +                                                       to load the initial boot program.
> +                                                       If the initial boot program is split into
> +                                                       multiple stages, this represents the storage
> +                                                       medium or device (e.g. used by fastboot) from
> +                                                       which the very first stage was loaded by the
> +                                                       BootROM.
> +                                                       It may differ from the device from which later
> +                                                       stages of the boot program or client program
> +                                                       are loaded from, as this property isn't meant
> +                                                       to represent those devices.
> +                                                       A later stage of the boot program, or the
> +                                                       client program, may use this information to
> +                                                       favor the device in this property over others
> +                                                       for loading later stages, or know the storage
> +                                                       medium to flash an update to.
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
