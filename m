Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9E5145348
	for <devicetree-spec@vger.kernel.org>; Wed,  3 Dec 2025 22:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764801454; cv=none; b=PDyMrGkHvm0+Y6kIcMD0XpFSsP8tmRkZDMUPVeK94HMZ7/EvJO+e4xeOJnw1S+3OdRxZ7nmmtpnCci7twPyBv+1cYJAzv0sxs9Ig5GqFL+s0ge6aosycjfqWsU07zYN9EiDTzqQ72qCY+HUB0a9DqGsjeBVXpRFRHMAN5g1VwoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764801454; c=relaxed/simple;
	bh=CmMeP3Wgb7F2JXCWfuilcNHjgdfnyf8V79u+ji27AA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJe1oa65paGR1C2haiM+KEb0sHXSBn8Dji8HorwKcpGBbnUmp32IrEXS8tnOfD3gj5oos4WoNK9wq9uD6l5UDPqzt4CuJ5iWsid4dDxONstIjOAEBuzWNZYd5TyYKOyFA/jnXq+ygbgTVgF0AagwWx9l/a4tTrZxB6X1ZLh3w1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q8HhMDOe; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q8HhMDOe"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64149f78c0dso344140a12.3
        for <devicetree-spec@vger.kernel.org>; Wed, 03 Dec 2025 14:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764801449; x=1765406249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ux8aZbZPgW4tpB1Y7z88VhDcAOYzDYj/EAgU+NDKuyE=;
        b=Q8HhMDOeH/+/dIFZRxKXFNhdZG+mfCg9y6fZT78uvBInjMwJ4w+QEkcq1FSfMQ3PHx
         DkJ0g8hP2Cx4jO15FgeV7Mz70sD3bDC7j5vWsShfbJDlMX8yGltfun6FlJkAU9jIuPjO
         RUlnzuJJ2nEgND+ARD8+PWSbQdn47hybpWbtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764801449; x=1765406249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ux8aZbZPgW4tpB1Y7z88VhDcAOYzDYj/EAgU+NDKuyE=;
        b=RL4fU5ESkj9cVLSRSFLcKbAH+dPQqc2uosD+cfCWl1pNle0QjcH3g8oZXVu8XMHB+i
         oODpxTA3WZhf/7+kjLYdntt/uJF13oiXkRLiKH3oYKzP0cx/NYGqUEh9N0xHlgeHpYhq
         CKofNYYkA9j8BgIo6cXoZNPnngIr1yU+V7E4fpY8lgk1BjiRLItIT37XPHn9mgNklWIv
         XUEVCltWlEoAiLSs/1JFvliswWlFYXwRgAGQvcBEOYQYTkldHof4DwDVAqG5rjVZpcMe
         BnG4h31LPxrNdEo9HsHH5TUq5scIYUEfu14Odic0YpQF3fFPbchcTOYwk8VNl18FSVtd
         /TsA==
X-Forwarded-Encrypted: i=1; AJvYcCXMJ4Uw9UKaU795VWJXNdrFWPlrShwOQrpb5FtTG0IT53GrCxvdIjDQpOzV1cwKZ/RsK/fmw11PQEjFmLMrkpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOv+eJ3ytTpDepppCFCdQFCi0LhMsgR5bxNXdIZp9h2wWjJcjE
	PZSNE1dQtwEk1rIO0IoWB3wPssLqWLrof+FopnYO3nfB6aAnMPrNITMwjPZKPfRRekJZMdM0xQC
	84StehBvt
X-Gm-Gg: ASbGncshQqhSrNp+LeFvLtgERwPD7gFTcSmXw8UymhBxdqn17D3/3otI3OaDncYKARG
	8/EHIDJAwc/2bcxQy1MYt2P2CVJFoScI/k7xJZNQooTkxnwbsk6zsrZF2CiNmarYhuVgeGN3f7Q
	8P/f2Xqd1kV5+zv97qHm2IlYMhlfk6uqEJMYjixvJFtjZ3YJFB0zdg06aKJpvkR19GR2RLoEEnr
	fcXSzU6eihISH0MU+cD+imYNiOPz1Y5lFkpW7BWlEAGWTpN6C+cn+5exK/vGRuHn4+uLc+WM2Zz
	bakzsXVGMwFNKMyjDbf/EirxqDUsqmz5FCWRL/lPuNb3kRmsYVuQdc3wsV+mF8s4ouCwOoTe3v/
	C0d6yzR+IFzPCCATvAa+NBR/X5z6yebmdK7anfUDrqy8Gk2h/h4ct1WokGQlTmj8fRHhtVDV8H8
	tjNI14pgA=
X-Google-Smtp-Source: AGHT+IGNw2x6RidFadFM+S8HjW9eFHiJJgHTp7eR7ldC4mKhbiMvAyiCZFeW8HAfM71sisbXeF5yiQ==
X-Received: by 2002:a05:6402:2345:b0:640:7402:4782 with SMTP id 4fb4d7f45d1cf-6479c2fdac0mr3576522a12.0.1764801449341;
        Wed, 03 Dec 2025 14:37:29 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751062081sm19367052a12.34.2025.12.03.14.37.27
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 14:37:27 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2e3c0dccso189408f8f.2
        for <devicetree-spec@vger.kernel.org>; Wed, 03 Dec 2025 14:37:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTOrz6MANTO2MN8/tpjy3hu60uWe8j9r9vNZWrnaeRIYx9KWG/iVHwDe/kiyX1wcOd3Q2zGubqg5GT5hu1dRA=@vger.kernel.org
X-Received: by 2002:a05:6000:1a8f:b0:42b:3e0a:649e with SMTP id
 ffacd0b85a97d-42f73172837mr4272908f8f.13.1764801447104; Wed, 03 Dec 2025
 14:37:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <aS66WcLPm6e5rdyk@shell.armlinux.org.uk> <CAL_JsqLxLakt94ACgv8z5A-O4WGZPfiZ-7UFaBPaOa7W8L3Cxw@mail.gmail.com>
In-Reply-To: <CAL_JsqLxLakt94ACgv8z5A-O4WGZPfiZ-7UFaBPaOa7W8L3Cxw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 3 Dec 2025 14:37:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wfu4ddQdTeupN+Md5Tv+5P1Up+Zo5U2AjGpqayTuqFhw@mail.gmail.com>
X-Gm-Features: AWmQ_bnIblbkwj1cLEC5h0WcUWlJmSIhOZHgYB3U9v0vApinUDHFAU4YsyhmX8k
Message-ID: <CAD=FV=Wfu4ddQdTeupN+Md5Tv+5P1Up+Zo5U2AjGpqayTuqFhw@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Rob Herring <robh@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 2, 2025 at 3:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> > as a set of examples. I don't see a clear way to generate these from
> > a fragmented scheme. There's a similar problem with the board-level
> > compatible:
> >
> >         compatible =3D "solidrun,cubox-i/dl", "fsl,imx6dl";
> >         compatible =3D "solidrun,hummingboard2/dl", "fsl,imx6dl";
> >         compatible =3D "solidrun,hummingboard/dl", "fsl,imx6dl";
> >         compatible =3D "solidrun,hummingboard2/q", "fsl,imx6q";
> >
> > These don't include the SoM information.
>
> So we're back to needing to merge compatible even though Doug was
> willing to drop it. Or to put it another way, there's usecases for the
> base to be different SoC revisions and variants. So I don't think we
> should give up on solving that.

I'm willing to take a crack at it. Before doing so, though, I think we
need to agree upon a definition of what the top-level "compatible" is
supposed to be. Otherwise, what exactly is our goal in trying to merge
"compatible" strings? We should have a goal of updating the official
documentation with whatever we decide.


I guess first, we should see what the spec says. The Devicetree
Specification v0.4 says this about the top-level compatible (which, it
should be noted, is documented _separtely_ from section 2.3.1 since
all of section 2.3 is only about device nodes):

> Specifies a list of platform architectures with which this platform is co=
mpatible. This property can be used by operating systems in selecting platf=
orm specific code. The recommended form of the property value is: "manufact=
urer,model" For example: compatible =3D "fsl,mpc8572ds"

That's not very detailed, but I guess we can start out looking at what
it _doesn't_ say.

a) The spec doesn't say anything about the top-level compatible
uniquely identifying a specific hardware configuration. Nothing there
says "look at one of the strings in the list and you can tell exactly
what product you have in front of you".

b) The spec doesn't specifically mention that one should include any
strings for a SoC / SoM / reference board. Indeed, the example given
shows an example "compatible" with just one string: "fsl,mpc8572ds".
Searching the interwebs, I find that this example "compatible"
probably refers to a Freescale "MPC8572 Development System", which is
a dev board with a "MPC8572" chip. Notably, the example "compatible"
didn't include the "MPC8572" chip.

c) The spec doesn't seem to include a firm definition of what they
mean by the word "platform". In my mind, one could interpret the SoC
as a "platform". One could also interpret a SoM or a reference board
as a "platform". It's not necessarily clear. Since AI is the answer to
all things these days, I asked Gemini. I asked what "platform" meant
in the context of the DT spec and it (confidently) told me that "the
platform is the physical machine." ...but when I asked if one could
also consider the SoC the "platform", it told me that was "an
excellent clarifying question" and went on to say the SoC "is often
referred to as the base platform or the SoC-level platform." :-P


How does that help us? I guess I'd summarize that, from reading the
spec and more loosely interpreting the word "platform":

a) The compatible string doesn't _need_ to include strings
representing the SoC, SoM, or baseboard, but it can.

b) The compatible string is primarily there for use by the operating
system to select platform (board, reference board, SoM, or SoC)
specific code.


That still doesn't really tell us when we should / shouldn't include a
SoC / SoM / baseboard in the top-level "compatible". It also doesn't
tell us if we should include even more detailed levels. ...and by
"more detailed levels", I would perhaps say that each of these could
also be considered a "platform":
* google,trogdor-lazor-rev6-sku6 - An exact model of board.
* google,trogdor-lazor-rev6 - A platform that has several SKUs.
* google,trogdor-lazor - A platform that has several revisions and SKUs.
* google,trogdor - A reference platform that has several boards.


Perhaps we should lean into the statement "This property can be used
by operating systems in selecting platform specific code" to give us
guidance? The problem is that we somehow need to not just look at
current operating systems but, if we want to strive towards the goal
of shipping binary device trees, we need to consider future operating
system code that hasn't yet been written. That sounds impossible and
makes one think you should cram as much info into the compatible
string as possible, but...

...actually, we only need to put information into the compatible
string if there's not an easy way for the operating system to get the
information elsewhere, right? If the information is found elsewhere in
the device tree or if the operating system can probe the information
itself, then there's really no _need_ to put it in the top-level
"compatible" and we'll never end up painting ourselves into a corner.
We could still put the information there just to make it convenient,
but it's not really needed. Does this make sense?

I would further argue that, in order to be useful, any given
"platform" should document its expectations and we need to be
consistent across anyone using that platform. To make it concrete, if
the Qualcomm SC7180 platform documents that "qcom,sc7180" belongs in
the top-level compatible string then all device trees including sc7180
should have that string. This _doesn't_ mean that on some future
platform (like qcom,sc9999) we couldn't make a different decision.
Maybe on "qcom,sc9999" we've decided to put SoC details as some
properties under the "soc@0" node. Now the operating system can find
the details about which SoC is present from the "soc@0" node and
therefore we don't need to represent it in the top-level compatible
string.


Assuming that all makes sense, maybe the way to document the top-level
compatible string:

--

Specifies a list of "platform architectures" with which this platform
is compatible. A "platform architecture" can be at any level, from the
specific board to the class of board to the reference platform to the
SoM to the SoC. A given "platform architecture" should always be
consistently included or not-included by all final device trees using
it. If the "qcom,sc7180" SoC platform is defined to be included, it
should be consistently included by any device trees with this SoC. The
criteria for whether to represent a "platform architecture" in the
top-level compatible string is the difficulty of the operating system
obtaining the information in some other way (including from other DT
properties or from probing). In general, the top-level "compatible"
used by operating systems in selecting platform specific code. The
recommended form of the property value is: "manufacturer,model"

Examples:

compatible =3D "fsl,mpc8572ds";
- Select code related to the Freescale MPC8572 Development System

No platform is included for the CPU since ("fsl,mpc8572") isn't
consistently listed as a platform.

compatible =3D "google,snow-rev4", "google,snow", "samsung,exynos5250",
"samsung,exynos5"
- Select code related to google,snow-rev4.
- Select code related to google,snow.
- Select code related to samsung,exynos5250.
- Select code related to samsung,exynos5.

In this example, the idea is that all exynos5 boards would have
"samsung,exynos5" so code that needed to run on "exynos5" could
consistently test for that "compatible" string. Similarly, all
exynos5250 boards would have "samsung,exynos5250" and all snow boards
would have "google,snow"

--

What do folks think?

Note that the current Chromebook stuff [1] we used on sc7180-trogdor
boards doesn't fit amazingly well into that definition, but it can
kinda squeeze in there. Essentially the sc7180-trogdor stuff is
designed around making it easy for the bootloader to find the right
device tree but doesn't provide anything terribly useful to the OS in
the top-level "compatible" string. At this point, I don't think I
would encourage others to adopt something similar.


If folks agree with the above interpretation, I think I'd end up back
to arguing _against_ the need to merge compatible strings. If we don't
need to put detailed SoC information into the top-level compatible
string then we don't need to merge. I think the most
flexible/futureproof would be to just define that for the SoC inside
Pixel 10 (and presumably all future Google Silicon) we'll put SoC
information under the "soc@0" node and thus there's no need to include
it in the top-level "compatible". That leaves us without a
"compatible" to put in the base "dtb", but maybe we can just put
compatible =3D "incomplete" or something like that?

I suspect that even for Russell's purposes the information can either
be probed by the OS or put in places other than the top-level
compatible string. We might not want to change his existing
devicetrees in case some OS is relying on the existing compatible
strings, but for work going forward it feels like it would be a
solution...


[1] https://docs.kernel.org/arch/arm/google/chromebook-boot-flow.html


-Doug
