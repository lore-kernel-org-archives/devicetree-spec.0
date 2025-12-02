Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00761684B0
	for <devicetree-spec@vger.kernel.org>; Tue,  2 Dec 2025 00:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764636267; cv=none; b=D0AtyDdhSXlHoJRKIAeg0/SH9nx4b6hOcxUbynpvcU+jw2IQilLcTUT2MYgUqkm/5EgaOq60HhIs0TrjY2nr3s2qvKtSQB6yV1X8K2S/nZlWPmKjBCJlfsSamtpBsi1T9G2gySm1jTzlJp9IzGViVft1d205OJ10EU+ECAkUV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764636267; c=relaxed/simple;
	bh=/zpM7Et8+6q6wcoIoJtNb12xO+RS+qqsz/B4wUHVqHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gY1gqlh0utptLdOVgdSzC4znyNR5eiOvsVcc0Jl5ClSNm2d/eEA+R1Cj4eCwAvRn+L6N7WiAcAocXS3MezeC11mfBuJ+WQQbGGsBCGwyMao6LFfvkQhT1Z7AxQyjMSV/WzRtECTXeM7JtJnhVmRB6iOONsqOMgPaOZ3NUbJPqsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XJtVmn6F; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XJtVmn6F"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b735e278fa1so232357366b.0
        for <devicetree-spec@vger.kernel.org>; Mon, 01 Dec 2025 16:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764636263; x=1765241063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeguxzobQAB3EZbFcGpLg32aJHzhS0qrVQLsNvfJv+k=;
        b=XJtVmn6FQDIOzNvZMb8AzLi6Z9lKqzQSyqo6YL+yrhf/uEmJuH9et0BrjgC3xJJcij
         Z9+fH21unhO/YLq1ghXHO4PfTTRpV18vnloQ8sVoxFS6MOTOmxu2awhXQVaOpQE4J1w9
         MqiswUofNaqZC9IcFbbRbNVlC37+MjWUELmO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764636263; x=1765241063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oeguxzobQAB3EZbFcGpLg32aJHzhS0qrVQLsNvfJv+k=;
        b=PS62WQOJVEsUAALS+W0ugvvatQjf9z/rL/0M3/iaQo23ml+NTBqXvYn0ste2AJ0K2y
         nesvXZmnhjj8mzT4LeU27gicTwv0ElIdNf8amw3oZ7G35i8pCLNVE/jEbSF5bBGR+z3l
         9uHsvF6IRs8AyboPqsl/8Qg6kkumfS6Od62EKRjwckCI9ur1RozUau0t+J+GF9vwvBOY
         LjI8ldjeu+53kvCiNdbBWCK53p1TW5obX8uV9gjUuUZNV3/jdpciUysa/yU0mu7MZ5mP
         k8pMlX5Zn8GVwb8cTXvxqJ2U+yChl6Ds7oE2/PZyrOBPBC/QExj5BopnER1F1vlXGNKc
         aICw==
X-Gm-Message-State: AOJu0YyNwlTvDDTBozVglIm/Gs+uTa7rcsvhcgoQ5nMq0LBwrloFw7Dz
	1gwT5Ua/hgOReck7i4JkKOfs0LUfqp5xfK55H5iiUlI+DpkcLYKNDZkSNFmnTKDXe+nXs5I8NvF
	3UUnGFfNA
X-Gm-Gg: ASbGncvZJNSInB4iBqTGF6nEIUQ/8CWtBwbkTnIi6jfh8SkOAc8u7C7W/eBwhbIPyn1
	oN6Lytf1NMmCWIRNrah2bCMiIdjyKflOnNFUjYUYo8DRtkoLTmz+V7Ch7koYaLms1QETX9bNFU4
	c4j4IrE803k5OZjxWIRcb/jyjjndrrs82dQQjEC4LDldP/m9gj2NI8NQZzA8NXXCtZoave/ifOp
	3qZAD32VQ8Qks+qfFlSrV5QTCp7dpRlb6wDkMgsM3BKuKdnvFIdN5rxzsiJEH3MbzQK5yLErLib
	lWVR/EOuZpRc03StqA64auImb9fUcNUNzyeTYco0UR8AGT7j75x9KF5Pb9Te5Be90N1ykreVwNt
	HgKy73xlcI2xqjrk7YKE0aSSvZz+l1F8BTICImCFhITPz6ARZQ2glrJ+vsxJL1yfJNlr1q4uw4l
	lmWkPPB0lfYmVpC0Bb16IySJekfvRkNrE+tQEruU70BbHNSEObPw==
X-Google-Smtp-Source: AGHT+IFX+ItclyYxvVcxmfV8ZMX89P4APM78Z9N3Kx9edv/4j4I0bd6FwVZggPLC6qNv/l1ZJPdxnQ==
X-Received: by 2002:a17:906:d54e:b0:b76:5ef6:3b73 with SMTP id a640c23a62f3a-b76c54b9c6dmr2795120866b.23.1764636262684;
        Mon, 01 Dec 2025 16:44:22 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a3a4ebsm1359471566b.62.2025.12.01.16.44.21
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 16:44:21 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47118259fd8so46473555e9.3
        for <devicetree-spec@vger.kernel.org>; Mon, 01 Dec 2025 16:44:21 -0800 (PST)
X-Received: by 2002:a5d:64e9:0:b0:429:b9bc:e826 with SMTP id
 ffacd0b85a97d-42e0f35bdb6mr29386558f8f.53.1764636261047; Mon, 01 Dec 2025
 16:44:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAD++jLkuRQKoiEN928GtAj7wUts5PxH905bLp6ZhKsJ3NnenEA@mail.gmail.com>
In-Reply-To: <CAD++jLkuRQKoiEN928GtAj7wUts5PxH905bLp6ZhKsJ3NnenEA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Dec 2025 16:44:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X5=AK4XMANv+fatn3d9Y5vo9AXsHWb_47HmNaMWUtMwA@mail.gmail.com>
X-Gm-Features: AWmQ_bk30zsEX6ldKjcS73dst-qzy7aOugGH30_jv9Y6DTxDabuDBqyR7LAhrbg
Message-ID: <CAD=FV=X5=AK4XMANv+fatn3d9Y5vo9AXsHWb_47HmNaMWUtMwA@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Linus Walleij <linusw@kernel.org>
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

On Mon, Dec 1, 2025 at 3:52=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> Hi Dough,
>
> thanks for your mail!
>
> Let me just see if I understand correctly what you're trying to
> do  (and apparently actively doing in production):

Thanks for your thoughts. Just to be clear, even though I've dealt
with device trees on a lot of ChromeOS boards, this is something that
_Android_ phones are doing in production and is what I'm focusing on
here. The whole scheme is at least roughly documented at:

https://source.android.com/docs/core/architecture/dto/partitions

This is all stuff that predates me looking at Android. I'm just coming
in and trying to make sense of what's there and trying to upstream
what I can.

Separately, it can be noted that we always _wanted_ a similar solution
for ChromeOS, but we never quite got there... ;-)


> On Tue, Nov 18, 2025 at 11:43=E2=80=AFPM Doug Anderson <dianders@chromium=
.org> wrote:
>
> > We would like an officially accepted scheme that lets us more
> > efficiently ship compiled device trees for a handful of related
> > products by breaking the device trees up into a common "base" device
> > tree and then applying "overlay" device trees atop the base to make a
> > full and complete device tree.
> (...)
> > In Android, we do a pretty good job of solving the stated problem
> > using device tree overlays. We describe the SoCs in "dts" files and
> > compile them into "dtb"s. We describe boards in "dtso" files and
> > compile them into "dtbo" files. A bootloader can handle identifying
> > the correct base and overlay (the scheme for doing this is a separate
> > but related topic) and applying the overlay atop the base "dtb". This
> > solution is fully implemented downstream for Android phones and is
> > well documented [2].
>
> So in the kernel we have several arch/*/boot/dts/vendor/ folders
> where they have:
>
> soc.dtsi included by board.dtsi included by system.dts
> and the top system.dts is all that get compiled.
>
> So what you say is that you do the same thing but at runtime?

Essentially. In this case, we don't ship the device tree _sources_ but
ship _compiled_ device tree. We compile the SoC into a "dtb" and then
combine anything above the SoC into a single "dtbo". We ship several
"dtb" files and several "dtbo" files and combine them at runtime after
we identify which hardware we're running on.


> Can you just describe why this is done like this with
> overlays?
>
> I can only guess that you have one bootloader that needs
> to compose device trees to many systems and the bootloader
> only discovers the system it is running on and its constraints
> at runtime, so shipping the static system.dtb as many people
> do is not an option for you?
>
> And the reason the bootloader doesn't already know what
> it is running on and doesn't just pass that one device tree
> or is just prepared with that one device tree has something
> to do with manufacturing or so?
>
> Sorry it just evades me.

Our builder creates a single "image" that can be flashed onto any
number of devices. Users (or manufacturers) can download and install
this single image and it will work on a wide variety of devices. So
you can download a single "Pixel 10" image that can be installed on
any of the Pixel 10 devices (Pixel 10, Pixel 10 Pro, and Pixel 10 Pro
XL). It will also work on our development board and early
pre-production variants of those boards.

In order for this to work, we need a lot of device trees and
_something_ needs to pick the correct one. Right now, the bootloader
is in charge of this task.

If we had less variety of products that we needed to ship then, yes,
we could just ship the one device tree and have a separate build for
each product. ...but that doesn't scale terribly well.


> Probably becayse even U-Boot these days use the provided
> device tree dtb, for the system targeted, to initialize itself. I
> suppose your bootloader is generic enough to avoid that
> chicken-and-egg problem, right?

FWIW: I believe even U-boot supports shipping a pile of device trees
and detecting things at runtime. See the "FIT" image:

https://docs.u-boot.org/en/latest/usage/fit/index.html


> I guess if I had this problem:
>
> soc.dtsi
> board-a.dtsi
> board-b.dtsi
> system-board-a-v1.dts
> system-board-a-v2.dts
> system-board-b-v1.dts
>
> etc having to be combined at runtime, in a bootloader, I would
> consider shipping exactly these files in a memory-based
> filesystem in my bootloader, and bake a DTS compiler into
> my bootloader so it can just build a device tree for what
> it detects.
>
> But I guess you didn't want to hear that :D

You're saying to just ship device tree source instead of binary? Hmmm,
it's an interesting idea. It wouldn't be _terrible_ since "dtb" stores
a lot of strings to begin with, but I think it would still add enough
of a bloat to make it a no-go for us... I would also imagine it would
be a pain to deal with #include of header files with #defines. Do we
somehow partially pre-process the device tree files but don't apply
the #include files. It might be possible to solve some specific cases,
but having this work in a generic way seems miserable.


> Anyway, please describe how you ended up in this situation,
> I'm trying to understand this.

The main goal is just building/shipping one image to support a variety
of similar products and trying to save space by not repeating the SoC
bits over and over again.


> It is quite clear that device tree overlays were intended for
> say plug-n-play additions and minor fragments to be added
> to a basically complete device tree, what you are doing was
> probably not how it was intended. (Or let's see if someone
> proves me wrong on that.)

Not sure what makes that so clear, since it's not clear to me. In any
case, even if device tree overlays weren't intended for such a usage,
they actually seem to work fairly well for it, even if upstream
currently rejects device tree usage like this.

FWIW, the fact that bootloaders (like U-Boot) have the ability to
apply overlays makes me think that _someone_ intended them to be used
similar to how Android is using them. ;-) If it was just expansion
cards then (presumably) someone would boot to Linux and just apply
overlays from there. See:

https://docs.u-boot.org/en/latest/usage/fit/overlay-fdt-boot.html


-Doug
