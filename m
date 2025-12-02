Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754482F9985
	for <devicetree-spec@vger.kernel.org>; Tue,  2 Dec 2025 22:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764714673; cv=none; b=G2ajVqEQ4ZfRSuHQFyxjiVj5Zunu1hVFTRmaxwXymFw5bcDvagR9ucRcdHUkNOF+XLNZikhvzRc3p7bB3sgf5ppQRk0KpNm2nKyWsmLUhI6jJVURFkVfaClVvAGSHl75lPvDZhF8H/lZrlxYqMNo4IzCwiNlPAr8Vk7f01ybqKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764714673; c=relaxed/simple;
	bh=Kt7QLl3M71FQZ1a2RIIbHoMBwRQCVhmZaV0Kws8vsZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtfN/ga4tcxZHX77zLu4hh7hiKRr1kKPnztH+2oVQaxvz94+BPA4gt98Li9Yx/TUa5WH5FsCEPa8WHYnMllD6bDkwA04MMsxgLYQ6Nz4hffCtZlvZ5Y8A96s54M8+U4v0Bahz3qIFXlL/q5HOQLgbCkvYsczi4dWbtQhrshqUYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IuKBtLrF; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IuKBtLrF"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so9224288a12.1
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 14:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764714667; x=1765319467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuXSsKE9g0wgo8lmJJvSeZzq7qMa9oZIDVgvyGW3d8I=;
        b=IuKBtLrFVvgOx7aNTtzB5xBLEL1NYUpRfCCPZsB7J9ReD9kuz/O7DyGkhbuyrIDPMp
         rbK9cp0/POnyybD0udddCqEPRwdEXRh3EqsFl7DibYKQcNId0wAAtiTusIRviCn2M+2e
         sQwm0ijK2cTP3AW0lWygMKSOEj4IO94bi8TpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764714667; x=1765319467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuXSsKE9g0wgo8lmJJvSeZzq7qMa9oZIDVgvyGW3d8I=;
        b=Ax4zpCVD6Bx9ZNUznFh94M2xtjimYnYMhe7GjQitSHMlwDZmyn1mfM1VJOxB7FHhFR
         7vkvPWyPunM+DH0yHXa9BVOOOqTA3kjdXpUHjY3989Z5z+MBMMCINvCB6d12CMnj1+oA
         5tz5agLWwsJdWF2OnzVfuh6ROGArs2YGz2xCRlo2ekK5voNlJm9MkSEzKJnrh88ZBwxC
         /t2Az9waYL8sSEDPl5Tdo0XDH2ZmSxUh/6wC9Tf+cuZBXbMKsnKdsxMMLei3VI/NPXrp
         raBaLXTn+kibn/Exeghh+GPDeCVvp2SvkNWspYLy8cI2wSCHgnExzfauGV8R/oMMMcM+
         wIkw==
X-Forwarded-Encrypted: i=1; AJvYcCWUIdwEo9CDOJUem3/dAV+RedvjYaeFoCBvC6DamjIXygu8NyMDpyJL1Y3V6YU1rQOCqd3cX0JVZptRU6Gt4OE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmhKRi6Ew/1UM34C7pHJx9eEVUAdu7YQdQuYLPghkEHlkhwU0G
	HMqDqaLECxvxmcW2qPEk1qplAGf+2HzPq0ArX8SrlXkAjBYCqK2wMgXyzA1ROTQ95EsMjZ6xL4V
	6O4NNUIwT
X-Gm-Gg: ASbGncsqsz8AcTedAhGi5izBAOorjTInCZtwoUAt1RvFkIFHoKzVm9Q45t0wfi2ICJy
	4KGKB+SeN2wX2eqa2xTWxdqZDqX4UP8Vdo1BIpmjDSz96hIvnv7DsLwYjnpuSAemgWWZ8V/7Q7I
	prETIGFRaLQwgwcueva6ZmkrB1u6P4Qy+y8s8YqrQaiNgiQXVnpq4lAJJRXhtZgttuP8sNpXE4P
	cjAZJy6hWL2kozX/IepuSzjfCKcgw4haPnYIEoLf18OUtP4msmF3EPj3WHHBmbclJN8bEnVMdEr
	/lG8jUpqmBvT/3ltFEgFDbKOhASNtafZMMO2n0PBb5+kTKHrz/MV8JaMoEmqXaqjaxWzD4L6ttt
	ZHjaqvn6dtzV4yJcsv7S6R90QnVEyaAzj6kxbkTiJT95c/g9soGu06VMiT5aCMA/9FlsrBnUrg9
	hZTc6Ww4v21JSlY84kQ9ZsAWjOGM7esAYdDSAPFnQZCaisMd1s0Q==
X-Google-Smtp-Source: AGHT+IESU4Kne2DE1SCqHQVZ2MsbDt+X0+6DsY3iOJHy8Fvf2dEhgMsaf8fO6IIh+2K1cQ3jmmc93A==
X-Received: by 2002:a17:907:7f1f:b0:b70:df0d:e2e9 with SMTP id a640c23a62f3a-b79d11d330emr89731066b.44.1764714667163;
        Tue, 02 Dec 2025 14:31:07 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a5f979sm1593865066b.69.2025.12.02.14.31.04
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 14:31:04 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775ae77516so58568025e9.1
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 14:31:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHt7j3asrvVvPK18+p3/HsUAWeHbov7xzh/6vrqp4XlP6duJPqSEM7HW2oA0mvUDGt7QwRKSnFWoRMhfR3+LU=@vger.kernel.org
X-Received: by 2002:a05:6000:2007:b0:42b:3b3a:5e52 with SMTP id
 ffacd0b85a97d-42f7223773emr784394f8f.39.1764714663803; Tue, 02 Dec 2025
 14:31:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <aS66WcLPm6e5rdyk@shell.armlinux.org.uk> <CAODwPW-sBSZfzbTnYLcGr2sN=+5p+okUeJEJeVvJOHCx3JbOgg@mail.gmail.com>
In-Reply-To: <CAODwPW-sBSZfzbTnYLcGr2sN=+5p+okUeJEJeVvJOHCx3JbOgg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Dec 2025 14:30:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WsWNb3FnHQHKGKzTckLuPNR4iDCQ2rxg07bLXwqZ-pWA@mail.gmail.com>
X-Gm-Features: AWmQ_bnreofmVzYeCHzPsyJJNHJLUpWtcWHtk5rxJWZfVBP3NQVojlqKSM7G3lw
Message-ID: <CAD=FV=WsWNb3FnHQHKGKzTckLuPNR4iDCQ2rxg07bLXwqZ-pWA@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Julius Werner <jwerner@chromium.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 2, 2025 at 1:58=E2=80=AFPM Julius Werner <jwerner@chromium.org>=
 wrote:
>
> >> Is there really a need to merge the compatible strings in your case?
> >
> > Well, you could just require duplicating an overlay N times for N bases=
, but that doesn't scale
>
> I think my question was more along the lines of "is there actually a
> reason why the combined compatible string needs to be that accurate"
> (i.e. contain the right "socvendor,mysoc-rev1" or
> "socvendor,mysoc-rev2"). What is the purpose of having that string in
> there?

Yes, this matches what I just sent in several of my replies. What
exactly is the top-level compatible supposed to represent? I think
different people have different ideas. Is it documented somewhere? I
guess I could start a new thread to solve just this one question,
though I suspect not everyone (not even core DT folks) will agree. If
they don't, how do we solve that? Who is "the decider"?


> It wouldn't be used for matching which DTB(O) to load in this
> case because we're already past that step. It's not used by the kernel
> directly for anything as far as I know.

It has _sometimes_ been used by the Linux kernel. Specifically the
fact that the SoC is represented in the top-level compatible is used
to "blocklist" the generic cpufreq driver
(drivers/cpufreq/cpufreq-dt-platdev.c). I've never loved this, but it
is an example.

Occasionally, I have also seen random software workarounds that rely
on the top-level string. See Linux commit 127068abe85b ("i2c:
qcom-geni: Disable DMA processing on the Lenovo Yoga C630"), which
added:

+       if (!of_machine_is_compatible("lenovo,yoga-c630"))
+               dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);

...that's been since removed, but it's one example I can think of
where the top-level string was temporarily relied upon.

There are certainly lots of hits for `of_machine_is_compatible()` in
Linux today. I don't know if these are all for good reasons, but they
are examples of people relying on it. In my experience it's mostly
used for things that are a bit hacky, to avoid an unexplained bug, or
to work around the fact that someone didn't add a specific enough
compatible string somewhere else in the device tree.


> Is it used by userspace
> programs which parse /proc/device-tree/compatible in order to detect
> which SoC revision they're running on? Because that's the only use
> case I could think of that really remains, but I'd argue that the
> compatible string is a pretty poor vehicle for things like that

Agreed. This type of thing has always been broken on Chromebooks which
have more than one revision/sku listed since a single device tree
works on more than one device. We had long arguments about this in the
past and I think DT folks finally threw in the towel and let us land
these, though I think they still don't really like it to this day.


> (it
> would be easier to parse and use to just put a `soc-revision =3D <1>`
> property somewhere). So if this is the only problem I'd say maybe just
> don't use the board compatible string for that, don't expect to be
> able to find such details in there accurately. But if we do think it
> needs to be that accurate for some reason, then I'd suggest platforms
> like this (which should be rather few, e.g. only those that really
> have a socketable SoC with differentiations that are so compatible
> that other than this identification information itself it doesn't
> require any device tree differences) should simply have their
> bootloaders rewrite the compatible string into the right format with
> all the necessary information manually, rather than expect the overlay
> application process to create it correctly.

Yeah, trying to stuff the world into the top-level compatible never
seemed amazing to me. Given that today's advice is to have a top-level
`soc@0` node, IMO SoC-specific details ought to be under that. This is
something that Stephen Boyd suggested a while ago but it never gained
traction.


> > I also don't see a sensible way without something like the above for a
> > boot loader to know the filenames of each of the components for a
> > platform - and it would need to be told the order to glue those
> > components together.
>
> I think platform identification and matching which overlays to apply
> should remain outside the scope of the device tree itself. The main
> reason is that you usually want to compress DTB(O) files for
> efficiency, and when you have a large list of overlays in a kernel
> image you don't want to have to decompress them all just to determine
> which ones to load for the current platform. So I think it's generally
> better to let bootloaders come up with their own scheme to store this
> information inside their file systems or whatever other data
> structures they use to find these DTB(O) files.

IMO it's still nice to be able to store some of the metadata that the
loader will use in the overlay files, just so we don't need a parallel
set of files. The current Android way of doing things is that the
metadata in the "dtbo" is parsed by the packaging tool (`mktdimg`) and
that creates the tables that the bootloader needs. This seems
reasonable, even though I'll argue that the metadata needs to be
documented under a specific node (one for `mkdtimg`). I wouldn't want
to have to maintain a separate file mapping overlays to their
metadata.

-Doug
