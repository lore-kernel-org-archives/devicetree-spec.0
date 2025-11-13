Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818BE248F78
	for <devicetree-spec@vger.kernel.org>; Thu, 13 Nov 2025 18:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763057055; cv=none; b=scuIf5lbsmPeroR4d4aKyCbLMR/x/tFW5//ycpsFf3bvw/zmkKAu7oHlKXCVg3qFs18xKTGRzzK5a8ODhnuYibBJigS5i7a87LEKqsaHfEvwlk/NWYo66KThYEB83+zooYAERChzYrFIczflK3DPt0DMqQRTp9AZef9Qs1dPKBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763057055; c=relaxed/simple;
	bh=lGATFl+I1AC7lHzb9mwWCM17eHJRjtAXwJl7STK7qmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6Q7qfuZBpR1zIeeJPPGtNcLNU5ndVvRTZv3mYnfuwx7a7moRBygSLep5JCXsL5WGxGVUwYfE2zL7eNOV/MG/8kA0kLjj2KD6sfqwa/6rbOXb5yKwB+uCvNH/CgRAaSCkx7YEN8d6EE7hAWUUhk4+DgAydWxaN7RkRseq3tgC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDIqDIWY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDIqDIWY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2E0C113D0
	for <devicetree-spec@vger.kernel.org>; Thu, 13 Nov 2025 18:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763057055;
	bh=lGATFl+I1AC7lHzb9mwWCM17eHJRjtAXwJl7STK7qmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VDIqDIWY6A8VQMDGnbyyGw9pXp+Oi6HXOX/ojeQJV6kJHtqhZ2TE0GAWDpcOVQeza
	 WB9wPtzEhGdjFPO7paU/mlvX4LL8QVxQ49U49IN2a4rLdvSzYBqqUj63OOj15WPIwh
	 Ub9I7BZMQQh/+S1cQDZoSH3ywLpJ7I2UtaX3MwFYJmjzHhY+PZcu/EurzPVASuUEDs
	 crpdGvxtLkpCmrYRlLvPJLWQU9C+m8hVzAmKQ/h5olxseT/BzmelOkgvpRtnbOQz5g
	 orkl/2s/05u2s4gZ4whBn9x2Wp6fZ1WzCRiNTKPPERkV+EfouWrJacR7isIuDnHYHo
	 eCh9AARzaBqWQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b71397df721so135856366b.1
        for <devicetree-spec@vger.kernel.org>; Thu, 13 Nov 2025 10:04:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhcY5Ds/vPet/kbqRgcclnXInNPY4Avfb2n7LS/e2GxWxnomUqfXRZA5pDOxQP3FrtI0DTkarzyrknIDia+Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu6ktM350PGWt2EKuhJQqiB/cLwuqoWFKFrqck/CIZYzhZhqln
	p8pcmOJmOMnkKQHYGRKcllpP5+v6D0BSsjeN4kMf//jFnneDep7spJwvpuMweo22o/0LSEd6+Vs
	H702h1ZDZ2415V/ZHKd6R3coSjwyQlA==
X-Google-Smtp-Source: AGHT+IFj913jlecDN6P0U8eeqrzHcFXzRNVt9aVWYl6QT7JdcDigOMFR/y95EK/CCenATAEmya2+2IjZg9sncXuCwZ0=
X-Received: by 2002:a17:906:fe05:b0:b72:de4f:cea6 with SMTP id
 a640c23a62f3a-b736793de61mr16140066b.48.1763057053773; Thu, 13 Nov 2025
 10:04:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de>
In-Reply-To: <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Thu, 13 Nov 2025 12:04:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKHqEtYoSuoLd=tR5B+P-_nDyOfpqEUZ_f=ws3yt5qORw@mail.gmail.com>
X-Gm-Features: AWmQ_blCNNnFNsX3aGJuCDzKuhKi58tC9lDfekxXQTTKrmrSstR6lF4AYiIENeM
Message-ID: <CAL_JsqKHqEtYoSuoLd=tR5B+P-_nDyOfpqEUZ_f=ws3yt5qORw@mail.gmail.com>
Subject: Re: SoC-specific device tree aliases?
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree-spec@vger.kernel.org, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, quentin.schulz@cherry.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 2:29=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix.=
de> wrote:
>
> Hello,
>
> With /chosen/bootsource now part of dt-schema, I would like to raise a
> related point: The need for SoC-specific device tree aliases.
>
> For many SoCs, there is a canonical numbering for peripherals; it's used
> in the datasheet and BootROMs often makes use of it at runtime to report
> the bootsource as a pair:
>
>   - One value to enumerate type of boot medium (e.g. mmc, spi-nor..)
>   - Another value that describes which instance (e.g. SDHC1, SPI3, ...)
>
> Some examples, where this is the case, are AT91, STM32MP or i.MX.
>
> barebox has traditionally used /aliases to translate BootROM information
> to a device tree node to fixup /chosen/bootsource.

So bootsource will be populated "mmc0" or "spinor1" for example?

> This doesn't work out for many newer SoC support, because of different
> expectations: For upstream, aliases are relevant to a board, while
> barebox traditionally expected them to be SoC-specific (because they
> used to be on i.MX, probably).

But usually the numbering follows the SoC numbering. Sometimes it
follows the PCB numbering, but I think that's mainly serial ports.
I've certainly steered people away from vendor specific instance
numbering properties towards aliases (if the need can't be eliminated
entirely).

The board specific part I think is more that the board defines what
devices are present and not present. It would be weird to have a
serial3 alias when that's not wired up. And board .dts files are going
to forget to remove it. Though I guess it is somewhat harmless.

I think the real change here is it would make aliases required when
currently they aren't really. Though I guess populating bootsource is
entirely optional?

Rob
