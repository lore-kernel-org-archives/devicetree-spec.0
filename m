Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A201DDC16
	for <devicetree-spec@vger.kernel.org>; Sat, 15 Feb 2025 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739632463; cv=none; b=c5Hm3rGM2aYaz+DF1AR2v8o5HLhDieskDz6RNau0SJQvEct3gKA0nXILZ7//TE+FVuSdp5KICZQ9RtbQaCfswA+PaFvsomIvP/v41M1dHV+nc77wQQ+5wh861bwqmpAjtRnkDh5mRDXmtmZkuZIMyWS2vPUdSHpcmHAMA4yr+a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739632463; c=relaxed/simple;
	bh=TsOlirqbYuJsHw4VS0+dFreRNS0lBOe+wOSBO6H1PfM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=BWMd6T/LHZCPZA983VztSowAhWebr5MRgC2q6MKZza5SvJQplg7FuJ23KZDK2tFbx2Vs33izBUmalfKZqTXaBgeKZGvluS8LH5TMdstD/4hEdEFoxI6QkatU0FdLOwh9osZGVMx3udul11BifeFx1pJIBrj1JDZnTr9AL6s8Nrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_128_GCM_SHA256:128)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tjJro-000000008Fc-2u9L;
	Sat, 15 Feb 2025 15:14:04 +0000
Date: Sat, 15 Feb 2025 15:13:57 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: u-boot@lists.denx.de, Quentin Schulz <quentin.schulz@cherry.de>,
 Simon Glass <sjg@chromium.org>
CC: Quentin Schulz <foss+dt@0leil.net>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Heiko Stuebner <heiko@sntech.de>, devicetree-spec@vger.kernel.org
Subject: Re: [PATCH] Add 'bootsource' /chosen property
User-Agent: K-9 Mail for Android
In-Reply-To: <fc2c6f06-98d9-49d3-9ce5-46dd675e8846@cherry.de>
References: <20250205-bootsource-v1-1-95f4ba69ac27@cherry.de> <CAFLszThr_vLbhU7A0_0VTLCGW03k6NmtxLVoW7OzrtxGFertZg@mail.gmail.com> <fb6792e8-97c5-4d0e-8ded-e73ea3a7513c@cherry.de> <CAFLszTg9-jMk0PBBSEVT=FonzRUNJOQ5NBMdDYUihWS8NkMhbQ@mail.gmail.com> <fc2c6f06-98d9-49d3-9ce5-46dd675e8846@cherry.de>
Message-ID: <5E98D444-A005-42CD-8A6A-381791237A6E@makrotopia.org>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

On 10 February 2025 16:25:23 UTC, Quentin Schulz <quentin=2Eschulz@cherry=
=2Ede> wrote:
> [=2E=2E=2E]
>What I can say from glancing at the code is that for Rockchip they do the=
 following:
>
>Register a bootsource type (e=2Eg=2E MMC, SPI, I2C, USB, etc=2E=2E=2E), a=
 bootsource instance of that type (e=2Eg=2E MMC0, SPI3, I2C7, =2E=2E=2E)=2E=
 The mapping between what the ROM says the device is vs what it is in the D=
T is done in their Barebox-specific DT via this custom prop in /chosen:
>
>barebox,bootsource-<bootsourcetype><bootsourceinstance> =3D &label;  # =
=C3=A0-la /aliases
>
>This gets read and resolved and then inserted as
>
>/chosen/bootsource =3D "/some/path"
>
>into the kernel DT=2E

We are doing something quite similar downsream at openwrt=2Eorg for MediaT=
ek router SoCs, see for example:

https://github=2Ecom/openwrt/openwrt/blob/main/package/boot/uboot-mediatek=
/patches/310-mt7988-select-rootdisk=2Epatch

https://github=2Ecom/openwrt/openwrt/blob/main/target/linux/mediatek/files=
-6=2E6/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edtsi#L32

https://github=2Ecom/openwrt/openwrt/blob/main/target/linux/mediatek/files=
-6=2E6/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc=2Edtso#L60


Of course we could use the standard "bootsource" property instead, but hav=
ing a way to reference the volume or partition used as rootfs instead of ju=
st passing a referencd to a physical device is advantagous=2E=2E=2E





