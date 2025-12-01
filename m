Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2850D8488
	for <devicetree-spec@vger.kernel.org>; Mon,  1 Dec 2025 23:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764633157; cv=none; b=rM/87YhRjqIpJEbcM2G0BAm/TS7HOxaKS7wPibAeUJzM8BvXG93zhqaJwpP/JZH8B06g6HZLhS5j2akXsnSQFeyZemN0spBIeKF8MRiePZc/H0WVz+Y1lPtGWAGsuLhS8Ou981rd/nZtZYGYaH8jf2tA/bFtVxsFCakbise53Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764633157; c=relaxed/simple;
	bh=NpeAjIJ/66sI2fxwcwavlJliC4ZwV6Vm30RiQ3xMXaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbeTZfhaZc1Us3IM//Suyx2Gs7JHLqtAeEMfILSmdVO+MsYVWmG6DqdQqIMmLtTzNwJtOxYU2N1Xj5c8asQMRTwdbkZRMhbZ793rPCiCSR4wvBXgTRhcmp3TZWl5W1QRw0ts+wgfBidj2N2wH7dll/iIwE3kH3RJwWvaT1sjN+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoGNDRiG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoGNDRiG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A80C19421
	for <devicetree-spec@vger.kernel.org>; Mon,  1 Dec 2025 23:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764633156;
	bh=NpeAjIJ/66sI2fxwcwavlJliC4ZwV6Vm30RiQ3xMXaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UoGNDRiGUaS3sPUPQvJVEHQJu898iNY5WuaVu1l07mBTeJtlFLMMpio9+aAG/WakN
	 H46aDgN0uDNq2Sw8/ivo47122vtbZZwZg7Bur/cKR6514o6RDbxKUKD4/fZX5V26pB
	 CYQf9j7bnQholSoi1fmgCZcXOxP1jkCNYdx2vYMgtsoOdg/We4fR3wIt97aDSXJuht
	 BaAB1HvgxLaXYhAE8GHcf9lDl7bbHNmXT9np37BmX701PUtivm3VvNYwpWVP7LJhs6
	 Dz7wV30WR7GHZ+7P0rFZu3PQ4bbl8xnVReMFFt1VbXXAtC2vyDSdiRPxuHIqxJW5l2
	 zeznA3oCqVogw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-787f586532bso38553897b3.1
        for <devicetree-spec@vger.kernel.org>; Mon, 01 Dec 2025 15:52:36 -0800 (PST)
X-Gm-Message-State: AOJu0YxxT2k2MtZGdfOfcjrJRsvAwBaQE+4DUwg6JgMBlR/ttrNdBqWc
	ViAiMFqg1MhtCKKltXIQlPxUflmlQYqw7JaVWYRGzDzAB1XrCva+bSF+t5tz538Yahf0wauLGcf
	HXpWzUZYxQDBYCHjz9CKUlQ7T6KdIkIQ=
X-Google-Smtp-Source: AGHT+IEINHWD1LneS0LA6npoNgtljdhIcbuikGKI4NIgeAOuJAp9cYnG6FsBCM8L2EElCE5Ar1V/xIrxKNOXNCKfz0Q=
X-Received: by 2002:a05:690c:d88:b0:787:c7e5:347f with SMTP id
 00721157ae682-78a8b5605c8mr353425127b3.56.1764633156020; Mon, 01 Dec 2025
 15:52:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
In-Reply-To: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 2 Dec 2025 00:52:25 +0100
X-Gmail-Original-Message-ID: <CAD++jLkuRQKoiEN928GtAj7wUts5PxH905bLp6ZhKsJ3NnenEA@mail.gmail.com>
X-Gm-Features: AWmQ_bkAAzU-XHlgauRWMwT8jkUTAHnpVXHGMaPaOgLC-X-09W0dk23vfS_tgHs
Message-ID: <CAD++jLkuRQKoiEN928GtAj7wUts5PxH905bLp6ZhKsJ3NnenEA@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Doug Anderson <dianders@chromium.org>
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

Hi Dough,

thanks for your mail!

Let me just see if I understand correctly what you're trying to
do  (and apparently actively doing in production):

On Tue, Nov 18, 2025 at 11:43=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:

> We would like an officially accepted scheme that lets us more
> efficiently ship compiled device trees for a handful of related
> products by breaking the device trees up into a common "base" device
> tree and then applying "overlay" device trees atop the base to make a
> full and complete device tree.
(...)
> In Android, we do a pretty good job of solving the stated problem
> using device tree overlays. We describe the SoCs in "dts" files and
> compile them into "dtb"s. We describe boards in "dtso" files and
> compile them into "dtbo" files. A bootloader can handle identifying
> the correct base and overlay (the scheme for doing this is a separate
> but related topic) and applying the overlay atop the base "dtb". This
> solution is fully implemented downstream for Android phones and is
> well documented [2].

So in the kernel we have several arch/*/boot/dts/vendor/ folders
where they have:

soc.dtsi included by board.dtsi included by system.dts
and the top system.dts is all that get compiled.

So what you say is that you do the same thing but at runtime?

Can you just describe why this is done like this with
overlays?

I can only guess that you have one bootloader that needs
to compose device trees to many systems and the bootloader
only discovers the system it is running on and its constraints
at runtime, so shipping the static system.dtb as many people
do is not an option for you?

And the reason the bootloader doesn't already know what
it is running on and doesn't just pass that one device tree
or is just prepared with that one device tree has something
to do with manufacturing or so?

Sorry it just evades me.

Probably becayse even U-Boot these days use the provided
device tree dtb, for the system targeted, to initialize itself. I
suppose your bootloader is generic enough to avoid that
chicken-and-egg problem, right?

I guess if I had this problem:

soc.dtsi
board-a.dtsi
board-b.dtsi
system-board-a-v1.dts
system-board-a-v2.dts
system-board-b-v1.dts

etc having to be combined at runtime, in a bootloader, I would
consider shipping exactly these files in a memory-based
filesystem in my bootloader, and bake a DTS compiler into
my bootloader so it can just build a device tree for what
it detects.

But I guess you didn't want to hear that :D

Anyway, please describe how you ended up in this situation,
I'm trying to understand this.

It is quite clear that device tree overlays were intended for
say plug-n-play additions and minor fragments to be added
to a basically complete device tree, what you are doing was
probably not how it was intended. (Or let's see if someone
proves me wrong on that.)

Yours,
Linus Walleij
