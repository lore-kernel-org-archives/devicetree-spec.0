Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10959204F93
	for <devicetree-spec@vger.kernel.org>; Tue,  2 Dec 2025 22:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764713110; cv=none; b=uqLE3J+N2SMiuBSLgzbp7T07zkyNM7lONVTYP9CjQdK1i2bcKP/xFRrkKAQKJ7ylOvnRPcx4S9rdHsKxE7IObIk1JEybeDC7DIfl3uJZ08qjRGqxtjJXK//UftMwsqr7qtf4Aquo/EIhgiqPY1ISqse48CwXO7hZUqn6qsxlmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764713110; c=relaxed/simple;
	bh=B1OPPhN9pGtfta9FcvJcfo3kyGpxYUpQDm3/3tNP1OA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oD4BcJb8Rp3c1h7Z6/o2YPUACRXMDGXejckmHNbRh49VjllqTlfpvn9P88AxwaFLxOT61HomO/zGWDliC437EJwAjvfWMOOZQs7R533ijpOt9Hy+mYoyWHp4gxAUrlZSJaD+TgAXWGEhBdtuHjFKkj50CuRtcFNK7aHeFoysQ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wesih0ia; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wesih0ia"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b727f452fffso42607366b.1
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 14:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764713104; x=1765317904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZsKacXlk1x/USH5v76Y2P+5QZvrnKBumSM1Y249Jhk=;
        b=Wesih0iaJqBKMM3OMa4+btuZuW0BHlzTbLhEji+4YUXTz4qHaPAyWllcnQa4/YntY9
         R3kI4wMxRyKXKGAUi0bRqGcXo/C4UcFp0Dv9I20J+cpYXsWYqQ0aQw1fxYI5qMgopjgb
         nQ37dsHPMDiNTnKpL5Omjax08zG05xho7TcOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713104; x=1765317904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ZsKacXlk1x/USH5v76Y2P+5QZvrnKBumSM1Y249Jhk=;
        b=rtZiOZ9CjdbYpBRkIYQ/3g7RZBmrvXU2Cj2WJzKbOZ2S7j+Wyhk/EAPZkruOncTNCB
         QAkVvwGCWW9fx1wCxI2mjIkeEEfPb2AscSG5ir+ebrmHzqWpp9kLMv2+8xAjXuxbchbu
         lacotvY6CnDaAPPFbgCmiBDi6PcRBKe2my72IA3Dk4duysSttk6JVX/Y31DMiCIucLlE
         DSBGF2sZ6n/YJd9P0I9pXgbj4/N353oA3C97fjZrfVw5A61CK6vOX69V0vQy4WXIMIwQ
         wua+fdYyb/AoOyIsu3Fi+97pMPAFGKcoD+j6RGExCvyAETpO4XqltCfWmlnlVdoYhKjh
         IXEQ==
X-Gm-Message-State: AOJu0YzrTyrdUc8LRtr6iSeJMu0wApX6t7SuVS6S0Y/9OxqGm+XBQtlG
	cJAmDW3VRbbuF/8+dC+Ok2MHxWy/KNMdV0I3SD8+VPGdmTZq7M1wXVff/AMeLisp8YFxkeZO6e7
	YZ//YTVaO
X-Gm-Gg: ASbGncuzGw18Gn9lb2yO8MmyE3UxxN/PjrlQ2wCBtsLPlDOLuaDIAisOcb7SA7hu3Vv
	5jzyQq0P1HLDptezh81L1osUVoqaHivFiGZhtTfN5lKlx0w3w31r18aUfnZSFWNl92ea/cJyYQI
	PxbGiWh+qHqdJjgDUfTrLdtVj876Qxefkp0W3a8NekPkisPYjf+TqCmS5U3Y8TL1+kr0vgfn7nc
	ronny1U5bMW8Wwt3iJRSv37qnryYvi1HM7g+37XkSujo/0W1Yl3NesP/8rIWqi+nyEvYfyLCwpH
	V3rkFDU0jX21B24oryW0oTNoKpphgkS+2vX7T/0CjmQ0ORhyWKD/G5XJ6r1l4ykUjBl2olKSLgB
	5MTu5QIc9F6fkOkGS2Z3lSVqmKUSdGnf8Laey1+GuutY2bk+GLgFWM5RIkBPMVmHh+V7MOuotDW
	BBpRfIexK2DU/LFhINcJ04h8cYUyMBC7ngyMlIQw2CFQ3EMTR0sA==
X-Google-Smtp-Source: AGHT+IHnFghbYWnmvbE3c10+XYzV0FyrwOkcNN8LnGg97SvX+pXqXOmzNIDiYO/xWPzGJu8bvJBtoA==
X-Received: by 2002:a17:907:9412:b0:b77:1b05:a082 with SMTP id a640c23a62f3a-b79c21c56b9mr551741166b.2.1764713104488;
        Tue, 02 Dec 2025 14:05:04 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162088sm1636518466b.1.2025.12.02.14.05.03
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 14:05:03 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso1660145e9.0
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 14:05:03 -0800 (PST)
X-Received: by 2002:a05:6000:1ac5:b0:429:8bb2:d0ce with SMTP id
 ffacd0b85a97d-42f6d5a0bb0mr5508346f8f.18.1764713102630; Tue, 02 Dec 2025
 14:05:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <aS66WcLPm6e5rdyk@shell.armlinux.org.uk>
In-Reply-To: <aS66WcLPm6e5rdyk@shell.armlinux.org.uk>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Dec 2025 14:04:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VxArGov6jB8jTTnPmM9XKAya_nc4wCDQS+uZf72hgmzA@mail.gmail.com>
X-Gm-Features: AWmQ_bnodrqkOULQQki0m69B7q1cCVAE8F8yOrV4gjyka70td8p-eK-StEz6mVE
Message-ID: <CAD=FV=VxArGov6jB8jTTnPmM9XKAya_nc4wCDQS+uZf72hgmzA@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 2, 2025 at 2:07=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Having worked on the SolidRun i.MX6 platforms, I agree with this.
> Within these platforms there are:
>
> SoC     SOM             Platform
> imx6dl  pre-v1.5        cubox
> imx6q   v1.5            hummingboard
>         v1.5 + emmc     hummingboard2
>
> On top of these, I have specific "user" extensions for hardware that
> I've connected - e.g.
> - the NoIR RPi camera needs DT modification.
> - for monitoring a mechanical church clock, a "gps" variant that
>   allowed PPS to be used with a GPIO pin, and a "capture" variant
>   that configured the hardware to allow precise event stamping.
> - 1-wire, for ds18b20 temperature sensors.
>
> Without the user extensions, this adds up to 18 DTB files:
> arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts
> arch/arm/boot/dts/nxp/imx/imx6q-cubox-i-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-cubox-i-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-cubox-i.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts
>
> basically, every combination needs to be enumerated. So, having two SoC
> dt files, three for the SOM, and three for the platform that the boot
> loader combines would significantly cut this down - to 8.
>
> However, it isn't that simple. For example, when the Hummingboard2 is
> used with the iMX6Q SoC, there's a SATA device present in the SoC level
> that needs Hummingboard2 specific properties to tune the signal
> waveform. However, iMX6DL doesn't have this SATA device in silicon, so
> the node doesn't exist in the base SoC DT file. The situation is the
> same for Hummingboard, but the tuning parameters, being board specific,
> are different.
>
> This means is that there are DT properties that are dependent on the
> SoC DT component and the platform DT component which do not fit with
> splitting the DT files into their individual "component" levels.

Wow, it sounds complicated! Yeah, in your specific case where you need
specific tuning parameters for each combination of SoC and SoM the
easiest might be to just keep things separate as you have it. If
you're looking to optimize the total size of the distributed device
trees instead of the total number of files, overlays still could
possibly help you out, though. I could imagine a case where you first
apply the "coarse" overlays (SoC, SoM, board) and then you look for
finer-grained overlays that are applied atop that. You'd still need a
bunch of these "finer grained" overlays (one for each unique
combination) but each one would be tiny.

To make it concrete, I'd imagine:
- imx6q - base dtb
- som1.5 - overlay
- hummingboard2 - overlay
- hummingboard2-with-imx6q - overlay

...and the "hummingboard2-with-imx6q" could _just_ have the SATA
tunings in it. I think that would be possible, right?


> The other issue would be the /model property - for example:
>
>         model =3D "SolidRun HummingBoard2 Solo/DualLite";
>         model =3D "SolidRun HummingBoard2 Solo/DualLite (1.5som+emmc)";
>         model =3D "SolidRun HummingBoard2 Solo/DualLite (1.5som)";
>         model =3D "SolidRun HummingBoard Solo/DualLite";
>         model =3D "SolidRun HummingBoard2 Dual/Quad";
>         model =3D "SolidRun Cubox-i Solo/DualLite";
>
> as a set of examples. I don't see a clear way to generate these from
> a fragmented scheme. There's a similar problem with the board-level
> compatible:
>
>         compatible =3D "solidrun,cubox-i/dl", "fsl,imx6dl";
>         compatible =3D "solidrun,hummingboard2/dl", "fsl,imx6dl";
>         compatible =3D "solidrun,hummingboard/dl", "fsl,imx6dl";
>         compatible =3D "solidrun,hummingboard2/q", "fsl,imx6q";
>
> These don't include the SoM information.

Right. This is the question many of the messages in this thread have
been struggling with.

Things become a bit easier if you simply don't expect the top-level
"compatible" to describe everything. ...but in your case it sounds
like things are _very_ dynamic (everything can be combined with
everything), so if we want to solve your problem it seems like we
truly do need a way to "combine" compatible strings.

As per one of my earlier replies, it's possible we'll postpone this
and start with simpler cases where we don't need to do any top-level
compatible/model munging, but it's good to know that there's a use
case that really needs it.


> Maybe what would work would be a high-level DT file that contains
> paths to the lower levels that need to be combined, along with
> properties that need to be merged. E.g.
>
> / {
>         model =3D "SolidRun HummingBoard2 Dual/Quad";
>         compatible =3D "solidrun,hummingboard2/q", "fsl,imx6q";
>
>         dts-components {
>                 compatible =3D "boot/dt";
>
>                 component@1 {
>                         compatible =3D "dt";
>                         path =3D "imx6q.dtbo";
>                 };
>
>                 component@2 {
>                         compatible =3D "dt";
>                         path =3D "imx6qdl-sr-som-v1.5.dtbo";
>                 };
>
>                 component@3 {
>                         compatible =3D "dt";
>                         path =3D "imx6qdl-hummingboard2.dtbo";
>                 };
>
>                 component@4 {
>                         compatible =3D "dt";
>                         path =3D "imx6ql-hummingboard2-emmc.dtbo";
>                 };
>         };
>
>         soc {
>                 sata@2200000 {
>                         .. sata tuning properties ..
>                 };
>         };
> };
>
> Or something similar.

Yeah, the question of how to know which files to combine is an
important and related point, but I've been trying to keep it separate
so we don't have to solve every complex problem at once. This is, I
believe, also the subject of one of Chen-Yu's talks at Plumbers.


> However, this would mean we would still need the
> 18 or so top level DT files, but also each component as well, which
> will increase the number of files we're having to manage on a target
> platform - so I'm wondering whether it's worth it.
>
> I don't think we'll be able to get away from this problem: it's likely
> that there will continue to be properties that are specific across
> several "levels" of a split DT setup, and apart from something like the
> above, I don't really see a way to handle them.
>
> I also don't see a sensible way without something like the above for a
> boot loader to know the filenames of each of the components for a
> platform - and it would need to be told the order to glue those
> components together.

Right, this kind of thing would be a judgement call. How you'd want to
organize things / use overlays would be up to you.


> I would have liked to use overlays for these platforms, but ISTR they
> either weren't supported at the time, or frowned upon, and even so I
> can only see them working for the simplest of cases due to the issue
> I mention above.

The fact that you have similar needs at least makes me continue to be
confident that this is an important problem to try to solve.


-Doug
