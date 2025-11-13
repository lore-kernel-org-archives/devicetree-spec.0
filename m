Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFE4221FCF
	for <devicetree-spec@vger.kernel.org>; Thu, 13 Nov 2025 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763061479; cv=none; b=UdBFfwhOemBC8qdDrPtPHZ2m0Rif876PIDgQQfKWnFefCUTaKvwKm+E+WAY3Y7hoeeQWUxKQRejROJICnOWuYR4y8G7qPJDIcWhFc/gHIgbeFz4DE76ITso2Yfkj941D2Z+MA4V8CFcjNNod2wUPVeC01Y6VSoXBbdz6rjo3XYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763061479; c=relaxed/simple;
	bh=6U+HqaXN6y7cgbjN6Bjb8v3x50bT8bDtfCr+D2D4qeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sstd7oYHUkSPyAFDTnKUrScdQSItxKXPoZg/qZaf+obdtPr4IMfPZqwpAXAkV4Yp3g0yL6uukT/1vCqRMmRtICm/jbbkyq93o+GisPRp49QyAL2R6SoTMevBjiSKH3+IIVaEJ+R6/E0VbJ2ut2Ft+LzSdbYnHZ4NmMc0jK71Tao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kA/OqS8U; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kA/OqS8U"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so1897907a12.0
        for <devicetree-spec@vger.kernel.org>; Thu, 13 Nov 2025 11:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763061474; x=1763666274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvjPhW53lLm7g2R1+RmexOgllFoRG4RMNyM5i1aMFEY=;
        b=kA/OqS8UHMJTcciCOCz6uBEU1lED2RT4xXyL2ePC0vtPk7JApfO7LsB2SHVFGih94K
         HHkeutcokS1q3JbYAqbkNUH+e7MiwPwvXSkjFBceRL7UG61lJensxj9sYIThMva2GcTb
         fX3QkzcyJQbVMSwHfyNiwZlK/X1kE4j+uG21Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763061474; x=1763666274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NvjPhW53lLm7g2R1+RmexOgllFoRG4RMNyM5i1aMFEY=;
        b=Nq4lOewGXsjypnnwgKZiCLBDXIfypKsaB87Lc59N3X76z+iroNO+APchDYx//9o3Ke
         X/l8dykbMdHWv64+l1Ix4oYHTs85b2EPjUoI851IfPHfSAA1hvWlxPEf/C3fkRcqJIGb
         BCu4ldOUHRAvfv0N6zCd18k4LaOiW9BUbxeG7CmJWiQPcKxGBXYJSmUP71YHEWf3rlq3
         Bd+WqxsPRhtSSW/nLZtbbFvWLLGk/OtxYYBoDb+08v15U6bUBDKTTtnz7CGtAchK+YTi
         e3/6M+Hs0PHl1SiHPs1YbUijHzB+sN8Rh2hRjrtoG7e/Vz3O/kxilXTq8UPv3TQJ63wF
         L/Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUfb0XICQsl8Yg9Yc2dJ3xZ0TTxi23Z4uKtM5ZyWVAKrCjx4zNpYo/fy9iohjAMLtxPHftAoOR2CeZ6GgEzsOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMUS0Kc6HJIs2I6PSHuDdXFYVKBeHvBD/dMOCNNDZZEfFIa8bZ
	l1a9qOQJQjGoMWEnx6ZiqB1w1ZGZMix2SacXc3U/TpN4irrf2/tPZ9DaRTU26foH5bhsgtGHV0+
	yXo9dG8LF
X-Gm-Gg: ASbGncutFneUzgZ/ImFsvKdKpY0Wy3EGezWFSOQlVSmkQBwWWwUvDPocWakHn9JNnz9
	j7Ud0ZMcBp/KJpCAC8HmK6jcwSSptyZyu5ggSoXU/y6uxw3vUee+ydl26v+/JOKMY5fHvvP+B68
	HxHnretg/q9PGsZRaeixi731VLojwa+OzJ7Rl3HEO1Yx+BS3V0PFD/SqaCKhHE/UmzNdfXry55X
	Px1FxwER1v0pYSibqCPdLaGdPSPjQl2CtHv8P91zEnOf26je4V/Vpl2QZjQzu9BWXKY7ijlBfE2
	bPA3hCc7teCzYb2Alrokb/vMYfp4JEBBONAyPOLBVzH/vCr4my7twM7R17ZtafCyDGZ1B902siD
	Gi4bcxmNh20KwuTEMtq36j5RfSn2Ru4TfixcJJDtVSQWFwtrK8RGb6hQUmWrKDinZDoeazUh8kM
	c46RxdamZ/iTwFNYvDlzjsE90Lgq0eJTBT6e335GFU1+51/Q0SEKbkuZafsijqsOp5gtuTyG8=
X-Google-Smtp-Source: AGHT+IHeWlB3M3OdYudf5PvYNrYi0kblYJs8adnywRMdojYvtvCr0GPuVWde+51DqKRUEfw4rN99uw==
X-Received: by 2002:a05:6402:280d:b0:640:80cc:f08e with SMTP id 4fb4d7f45d1cf-64350e9eb31mr301293a12.26.1763061474121;
        Thu, 13 Nov 2025 11:17:54 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b1dc1sm2107580a12.25.2025.11.13.11.17.52
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 11:17:52 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so1002350f8f.0
        for <devicetree-spec@vger.kernel.org>; Thu, 13 Nov 2025 11:17:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVuSE+bso63bpUXgTlTN6kvgSCNvSGIeC2Pb02yont5/itp5cyfeZ6vUcSKIE1k6QoM4xcwoNxh/C0gUnQvWDA=@vger.kernel.org
X-Received: by 2002:a05:6000:228a:b0:42b:36f4:cd24 with SMTP id
 ffacd0b85a97d-42b593495bemr483459f8f.24.1763061471661; Thu, 13 Nov 2025
 11:17:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de> <CAL_JsqKHqEtYoSuoLd=tR5B+P-_nDyOfpqEUZ_f=ws3yt5qORw@mail.gmail.com>
In-Reply-To: <CAL_JsqKHqEtYoSuoLd=tR5B+P-_nDyOfpqEUZ_f=ws3yt5qORw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Nov 2025 11:17:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XMm_SatBN79D6A8aCXSTpJvmgdhXMm84Um5fpq=e66LA@mail.gmail.com>
X-Gm-Features: AWmQ_bkyBts-Wppv2Dbv_dWj5HI6fiZeXLPYhETWPI5H0cLyL4YjgsmNwKGbG4M
Message-ID: <CAD=FV=XMm_SatBN79D6A8aCXSTpJvmgdhXMm84Um5fpq=e66LA@mail.gmail.com>
Subject: Re: SoC-specific device tree aliases?
To: Rob Herring <robh@kernel.org>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree-spec@vger.kernel.org, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, quentin.schulz@cherry.de, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 13, 2025 at 10:12=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Thu, Nov 13, 2025 at 2:29=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutroni=
x.de> wrote:
> >
> > Hello,
> >
> > With /chosen/bootsource now part of dt-schema, I would like to raise a
> > related point: The need for SoC-specific device tree aliases.
> >
> > For many SoCs, there is a canonical numbering for peripherals; it's use=
d
> > in the datasheet and BootROMs often makes use of it at runtime to repor=
t
> > the bootsource as a pair:
> >
> >   - One value to enumerate type of boot medium (e.g. mmc, spi-nor..)
> >   - Another value that describes which instance (e.g. SDHC1, SPI3, ...)
> >
> > Some examples, where this is the case, are AT91, STM32MP or i.MX.
> >
> > barebox has traditionally used /aliases to translate BootROM informatio=
n
> > to a device tree node to fixup /chosen/bootsource.
>
> So bootsource will be populated "mmc0" or "spinor1" for example?
>
> > This doesn't work out for many newer SoC support, because of different
> > expectations: For upstream, aliases are relevant to a board, while
> > barebox traditionally expected them to be SoC-specific (because they
> > used to be on i.MX, probably).
>
> But usually the numbering follows the SoC numbering. Sometimes it
> follows the PCB numbering, but I think that's mainly serial ports.
> I've certainly steered people away from vendor specific instance
> numbering properties towards aliases (if the need can't be eliminated
> entirely).

It's been a long time since I was involved in any discussion about
this, but I remember Arnd Bergmann being strongly against having
numbering aliases in the SoC "dtsi" file. I was always on the opposite
side of this argument, but it seems reasonable to include him in the
conversation.

From my point of view, with the exception of the "serial" alias folks
almost always wanted devices to be numbered as per the SoC numbering,
as long as there was a well-defined SoC numbering. For instance, if
the SoC manual consistently calls a port "i2c12" then it's pretty
confusing if the device doesn't end up as "/dev/i2c12". This always
led me to the argument that aliases like this should be in the SoC
".dtsi" file.

The "serial" alias is a bit of a special case because of historical
assumptions. It's often assumed that serial port "0" is the debug
port. Luckily there aren't usually so many active serial ports so it's
not terribly confusing...


> The board specific part I think is more that the board defines what
> devices are present and not present. It would be weird to have a
> serial3 alias when that's not wired up. And board .dts files are going
> to forget to remove it. Though I guess it is somewhat harmless.

To me it doesn't seem awful to still have the alias pointing to a
"disabled" node. The node is still there, so why can't the alias still
be there?

-Doug
