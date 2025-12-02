Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67522E8B9C
	for <devicetree-spec@vger.kernel.org>; Tue,  2 Dec 2025 22:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764712809; cv=none; b=buVSc3UoAegKcUBDCCC4U8u238ifHdQSCgm+BeILSBCGDVolCS2MPn1pyoY4nBb8w152Avt6TR/p3hz21iiRZjgDFxXsecBkmMtcoLN45qmix+8tFajEzN7XmdYEtG8BhVeLdqTN1YHmz7xm0llBsNChAefP/tN+w4plMMCtuHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764712809; c=relaxed/simple;
	bh=OoXXtyJW5KXAsacbVq5Fs6IJuBLiDgKDL14fYkxOfRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crVl0eY1TKcMLozUKNR4K76BlTuxDjHQ2cMD3J6Eq0kcy0qhoUmaR5JM9uNpnXCKQNMEVgjsEf6IT7HQfMEMUmS8GQ0VRu3ln4vtiUoAHuWQvh38h687D95Bh9Y6m+lX12B/fdVRY5HykhkPweBYAzNG1O6EYbX8DU0rxcUFVGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IOZ1Kjug; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IOZ1Kjug"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so8745722a12.3
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 14:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764712804; x=1765317604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yegdrDTIiSzr8qdU/hFwYrh2y7sAILKZQL5h+MMY60s=;
        b=IOZ1KjugnZaVQcLqaoJK7i1JHM9q7uqeVUx5Mm+McX52ToyprJ5KIvHdSv9jtVRAFz
         4I670R2URfDPUFVgOG/vhn/7YL1LV12H8MU3V9AR9RMq24Gam/s2CcVFARrMHcJF6jHK
         lL+OAqj1DRaq32b6+E+iuk486UdB9AOfDiK34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764712804; x=1765317604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yegdrDTIiSzr8qdU/hFwYrh2y7sAILKZQL5h+MMY60s=;
        b=GnDu2Bh8kU4pAYInMZWBa63SHZVQeprJ9awBymVPpgW/6bO/Elp+hOJUfEvdAhiLg9
         GUrgw7hSjef0rl3tfdfQNCpqPwJL0ZPr26QEamg76BLsGPOsBxolfBA486gYi67QUzy8
         8OQULj8D3aKxwGpqe2Lfrd7FapVaQIz5wnmHttMJkeQrA0w2IWQ4Ia6rFiBMvQO3pnSt
         qWye/Aj71FeqhqbYdl2E+m5SjYuKcyB6RA1/2p1ppqEsBpE6/n/LznF6zK3coTsnoNLb
         dEl03TlCa8tLc02+uvI+4ytpUzRJDYXSQgg6YwGB0VA3qPJ/R69P4Nh2g2XBKYWBdbIG
         9KWg==
X-Forwarded-Encrypted: i=1; AJvYcCVDwrHlzwUovM465gK/VYvu6fvkbM7xwMisImSefqc15stADyNz0BwMN3Xg3WBl+S2E9bbpT6KkRwbEVoXvFto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw+koJTQQLiJ+R8F2fOX0KXyOusoE6ZAqzMIiYWbs/Go6y5OPM
	8n+2hOcybz9/PiEvkQ+e83m7Hh4UN9ymyWYPYDum06iBj3m06qAe0NJtIwLbq7+rfBXohHJWH+8
	o2inH8dcB
X-Gm-Gg: ASbGncvnxkR92o0Ak6iLpFi2zOV/Gt5eaIHRl0G3FwZjyHA1X6jQadR/FZyq0sihG7J
	1BOhoZbcQ8WR9s14MlWLfcsCbWub9AGQeNAFvLnFHEZ3XKumEiAdegG+7nMWz/GJMyDpzOHaKsh
	73Csf9cefElAdUb7PSSnm0AQNZxHZMSGM/+wEuzi9+EYQ2uOBvqRdtoCaM4wRRkpHMJzmknkIaF
	TXgtsRrq0ziwf9qZ6jCq5WYIUJzNmj2v6436xKdKQkTepp8MXAy1D9fypgeKeBLvZUsFyo4hGDC
	whJh4+I5aS0Q9Xx4+BYv99b5h+vJaE25GLig/pHjYECB9WT98Lm9gn9uKZ15nUUbU+yitH6mx83
	O6aTD9pQb0S9PztNVeynB+TLfWj7tbJtuM8ur3G69chfsIvDVnraObPLxvEVoxEeJi09JOYAgV/
	5v1FotmWw3SqGD0cQhe38tax2tYc1Ogz45Z+E8fhHbikZWhgIkig==
X-Google-Smtp-Source: AGHT+IHVO7HJmBLIOk3SgNDZkxnK4B96BR/mJZUwmiDVvQ2tjDKUQdSS7y9cJjKI6ybXlQb8mi11mg==
X-Received: by 2002:a17:906:478a:b0:b6d:67b0:ca0b with SMTP id a640c23a62f3a-b76719f74e2mr4597947166b.61.1764712803940;
        Tue, 02 Dec 2025 14:00:03 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f4d533f2sm1619245266b.0.2025.12.02.14.00.02
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 14:00:02 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso63549265e9.0
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 14:00:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjMcMXhFeOr8X9hd7aGqCAWAU0YAYPvCNFIm8wXg1f7k4eX2UUlgPk5oOqQq4b6HZLXN8jefA8LQhboNgA6Ww=@vger.kernel.org
X-Received: by 2002:a5d:5e01:0:b0:42b:3131:5435 with SMTP id
 ffacd0b85a97d-42cc1ac9de0mr44938296f8f.2.1764712801617; Tue, 02 Dec 2025
 14:00:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAODwPW_51fKOfDQbTUFCum13M621Uxi2Zw2YHng0DrrwwvZhRQ@mail.gmail.com> <CAL_JsqJz8D53OF8PGaq+o6X5zfE1Y4NrH+BpYPEo6OENviJvbg@mail.gmail.com>
In-Reply-To: <CAL_JsqJz8D53OF8PGaq+o6X5zfE1Y4NrH+BpYPEo6OENviJvbg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Dec 2025 13:59:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xe3zqbyN5RVRppWbN=v6L=nECs6HtCu43m=QYUa=iV4w@mail.gmail.com>
X-Gm-Features: AWmQ_bmCUBKo9K_aGB-WNG6OGoI6RAsr0V6rdUnS6-V-21fTohUtnWxeXdCfFXY
Message-ID: <CAD=FV=Xe3zqbyN5RVRppWbN=v6L=nECs6HtCu43m=QYUa=iV4w@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Rob Herring <robh@kernel.org>
Cc: Julius Werner <jwerner@chromium.org>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	yupingso@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 1, 2025 at 4:48=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> > > Possible example if we support 3 levels:
> > >
> > > SoC (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc=
"
> > > overlay1 (incomplete) compatible: "referencevendor,referencecodename"=
;
>
> I don't understand this one...
>
> > > overlay2 compatible: "boardvendor,myboard-rev1", "boardvendor,myboard=
"
> > > merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
> > >                    "referencevendor,reference-codename",
> > >                     , "socvendor,mysoc";

I was just trying to come up with an example with 3 levels. Usually a
whole pile of boards are based on a reference design, so the reference
board could be an extra level of overlays. Thinking about this with
the sc7180 Chromebooks, you might have:

SoC: qcom,sc7180 (base DTB)
Reference design: google,trogdor
Actual board: google,lazor-rev1, google,lazor

So final compatible could be:
"google,lazor-rev1", "google-lazor", "google-trogdor", "qcom,sc7180"

In the case of what we ended up with upstream for sc7180 Chromebooks,
we actually _didn't_ include the reference design (google,trogdor) in
the list of compatibles in the final board. I think this was because
the name of the reference design ("trogdor") was also the name of the
reference _board_ and it would have been confusing. ...but I can also
see how one might want the reference board to show up here. I don't
feel super strongly either way.

In any case, I'm OK with not focusing on 3-levels right now and I'm
not actually planning to use it in the short term, I just want to make
sure that anything we do doesn't preclude it...


> > Sorry, I only cursorily followed the previous discussion so I may have
> > missed the exact need for this part. But I would caution against any
> > proposal that changes the basic rules of how an overlay is applied.
> > The definition of how overlays work has (I think?) been stable for
> > over a decade now, and is implemented in bootloaders that often cannot
> > easily be updated. I absolutely support your effort to get more
> > upstream standardization for managing base device trees and overlays
> > (which I think need to be flexible for arbitrary layers, not just SoC
> > and board), but let's not break the overlay code in old bootloaders
> > while doing it.
>
> I think merging compatibles is orthogonal to splitting SoC and board
> DTs. Doug needs to merge because there is more than 1 SoC version or
> base DT to pick. In many cases (SoC revision compatibles are the
> exception upstream), there is only 1 SoC DT and N board DTs. So we
> should consider both and define them separately. In the simple case,
> you'd have something like:
>
> SoC (incomplete) compatible: "socvendor,mysoc"
> Board overlay compatible: "boardvendor,myboard-rev1",
> "boardvendor,myboard", "socvendor,mysoc"
>
> Then you just apply the overlay and it overwrites the incomplete
> compatible. That works with existing overlay applying (overwriting)
> for multiple steps as long as each step is a superset (compatible
> list) of the prior steps.
>
> In Doug's case, I think you need code to decide which base to pick and
> then fixup the final compatible.
>
> SoC (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc"
> Board overlay compatible: "boardvendor,myboard-rev1",
> "boardvendor,myboard", "socvendor,mysoc"
>
> And then after applying, you do the merge to insert the SoC rev compatibl=
e:
>
> "boardvendor,myboard-rev1", "boardvendor,myboard",
> "socvendor,mysoc-rev1", "socvendor,mysoc"
>
> You need SoC specific code to know what SoC revision you are running
> on, so SoC specific post apply code should be fine too. There's not
> any existing bootloader problem because you need code to handle this.
>
> Maybe that fixup will end up being generic enough that it's not
> platform specific, but that's an optimization of the implementation.
>
> > Is there really a need to merge the compatible strings in your case?
>
> Well, you could just require duplicating an overlay N times for N
> bases, but that doesn't scale

I'm actually OK with deferring the "pluggable SoC" problem for now.
Even for the Google Pixel team, it's a bit of an edge case. If we have
to solve it by duplicating "dtbo" files for socketed boards (or any
board which could have more than one SoC) that's probably OK for now.
Once other problems are solved, we can perhaps come back to the idea
of merging compatible strings and/or other properties.

In v1 of my Pixel 10 series I wasn't even trying to support multiple
SoC revisions, I was just trying to look forward to the future based
on what I saw downstream. ;-)

If I drop the idea of merging compatible strings and just duplicate
the "SoC" parts of the compatible in each of the overlays, then do we
have something that's landable to get things off the ground? I think
Krzysztof will still NAK my base "dtb" that represents just the SoC
since it's not "complete". I certainly wouldn't want to just steamroll
over his concerns. Krzysztof: Do you have any thoughts? Do you
understand my goal here and agree that it's something worth solving?
If you don't agree it's worth solving, would it help to hear more
people express their interest in a solution? If you agree it's worth
solving, can you provide a suggestion for how we can move forward?


> > I
> > think in the vast majority of platform identification cases, code only
> > cares about matching the most precise string (i.e.
> > "boardvendor,myboard-rev1"). If we do feel like having the whole chain
> > of identification is necessary, it could be achieved by just
> > copy&pasting the extra strings into the overlay file. If we have
> > cross-validation between base and overlay source files we could also
> > have the validation check that the overlays correctly contain all
> > compatible strings from their base tree. If we know that the base
> > trees aren't standalone anyway, we could also just invent other
> > property names that identify them (e.g. `soc-compatible =3D
> > "socvendor,mysoc";`). Anything other than breaking the overlay format
> > would be preferable in my opinion.
>
> There's also a use case I'm aware of where the base DT is just for a
> SoM and then the bootloader applies an expansion board overlay. So it
> is not always "not standalone". And of course, this could be combined
> with what Doug wants to do.
>
> Note that for any new property (or an incomplete compatible) like
> soc-compatible, you will need to consider how we validate it.
>
> > I also feel like we need a better standardized way to tie base device
> > trees to overlays, like your `/loaders` node proposal in an earlier
> > email, although maybe that's an orthogonal discussion (but related,
> > especially if there's supposed to be cross-validation between base
> > trees and overlays). The compatible string is just not a scalable way
> > for bootloaders to make this determination, there may be a lot more
> > differentiation than just "SoC" and "board", and the scheme almost
> > certainly needs to be platform/bootloader-specific because every
> > hardware vendor has their own ideas about how to group and reuse parts
> > of a platform. This information doesn't necessarily need to be *in*
> > the device tree, it could also just be in a separate YAML file in the
> > same repo (since bootloaders will almost certainly want to have it
> > transformed into their own out-of-band descriptor at build-time
> > anyway, so that they can compress the device tree itself and don't
> > have to decompress each one for matching), but it needs to be
> > somewhere.
>
> There is a proposal here[1]. It's simple, but I do wonder if looking
> at the root compatible only is too narrow of a view. An overlay could
> target a connector compatible for example.

Yeah, I'm still not really a fan of that proposal. I think different
loaders are going to need different information to know which overlays
to apply, so we need to define "yaml" files for different loaders and
define the formats for a few different loaders.

From a validation point of view, I'd imagine we'd want to (if
possible) validate all different combinations, but (if it's
well-defined in a binding) we could potentially include rules in the
kernel that understand different loaders and could come up with
different things to validate.


-Doug
