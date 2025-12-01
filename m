Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20322335BDB
	for <devicetree-spec@vger.kernel.org>; Mon,  1 Dec 2025 17:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609800; cv=none; b=SWtY4jms+0A9DYHUUXj2usbL/++tNaNfMlG765fRpN6rzcR09vj+3UyyZTVeWL3Ejm2rPJvbWoNFXGk9u4G6wlt07PZx/3dKJT7sjrOMy1QF81UEzNbZ/OQTDDd3/4u3uM0PFJq3KmJxG1d7HeYpru/z17b4wXJS11RUVdah8uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609800; c=relaxed/simple;
	bh=N6TRaT8Wmx5N8jznkmk2QbmDnzTxxbIrKykbdJPV/pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSyAcwuYHX0NDAN067Vv3vW0Nbz5XKmB/63x0ZU5IC1EWhkWXoikemCtye1gh0F/47jVoVT93I+pO2MvzadsqdGHlHetP1lFxi0Bmo4qbwLilMv8zhuPCsZkTffwsMaveQU/M4OwpjioZ7wGqNV+epoJT0jOh4neLQxyjJ+qDFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LY14ZLM5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LY14ZLM5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F1EC4CEF1;
	Mon,  1 Dec 2025 17:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764609799;
	bh=N6TRaT8Wmx5N8jznkmk2QbmDnzTxxbIrKykbdJPV/pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LY14ZLM5E8As2sEitE450qAGHpUwzpHWHHyeiPlXxvghDo+5AasdjuMZSpwCuyzba
	 SIbE0NW3XXWCKK65ePvDTLo7IIcZSivyaoqgXD+zq8SqTTucMnc68Ig15ktUXsDRLU
	 ZZRJkSUW6uhuD67IjqDJqaB56TF/BKH1s3uAWuKpVQVHXmf8lCv4lGw8stcC6cQcpu
	 gZ+FLzTX8vG5Az8LuKMYlBZ7iOy3K0rM5z/TN7SWJn2PVb5DV4oRB1feRmIHIGiAi6
	 pOiymGIORAhLXOxP3WgIFwFF00x6dTRp/IGt5x2JHIsz46pRPv058t/LKcjnuJcHJZ
	 0n4uoFjI9S25w==
Date: Mon, 1 Dec 2025 11:23:17 -0600
From: Rob Herring <robh@kernel.org>
To: Quentin Schulz <foss+dt@0leil.net>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>, Simon Glass <sjg@chromium.org>,
	Mark Kettenis <mark.kettenis@xs4all.nl>,
	Daniel Golle <daniel@makrotopia.org>,
	devicetree-spec@vger.kernel.org, u-boot@lists.denx.de,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2] Add 'bootsource' /chosen property
Message-ID: <20251201172317.GA3694867-robh@kernel.org>
References: <20250505-bootsource-v2-1-5a315d9bff26@cherry.de>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505-bootsource-v2-1-5a315d9bff26@cherry.de>

On Mon, May 05, 2025 at 05:34:22PM +0200, Quentin Schulz wrote:
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

Applied, thanks.

Rob

