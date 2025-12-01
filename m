Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B1210F1
	for <devicetree-spec@vger.kernel.org>; Mon,  1 Dec 2025 20:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764622760; cv=none; b=ulkjYz78dbal6CGHzIdAzUEDKbaMxQgmXCUVGztYSiQqQCezOF8NxAJ0jzD2NQ6+VBHSeyZXIHcq6zgIkK/ubyVTnLCb7T1J5kaCYmprZ3jw9LrAzuaGV3nMLRR1MsME2tB83SkxnM/8CUlKiqI+XnbVN/WuEu3FZZyGz/+91W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764622760; c=relaxed/simple;
	bh=0bhHfw++5pSOrL1hyiPHtXVUoiR0H8FhFS8GHD/WRn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LP9GgT3tuCJjNSZjCn5PExWsW0mTBepj6gB7NvXhst+hkD+1nVXL+mRyP61eOvWx5vBHPIaRb7xj7Q0k2YDTvdlXYwQZrLf6V2ynsSMxhLYDbEYILThwAhRT8klhkLFqZ/eczICrdhpI0GP8hcqyodWN5aOnkGFKx+cfmWTs/zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PPQzw1rA; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PPQzw1rA"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7277324054so689371566b.0
        for <devicetree-spec@vger.kernel.org>; Mon, 01 Dec 2025 12:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764622751; x=1765227551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bhHfw++5pSOrL1hyiPHtXVUoiR0H8FhFS8GHD/WRn0=;
        b=PPQzw1rA8Is6MkVp9fvpAsk0WCUnBMBqMsw3OTN+up2RA76dw/Q1p9drfk6zFNm3qK
         47gqSL1Hg/J513SsQOI8yYhCfRek6XRDFZgobEozI0YzTrn43QF2CHWll48NVYODiZ8e
         FrtfvtSlfSNEnj+f4cnAJmDrplpFqqgqQuTpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764622751; x=1765227551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0bhHfw++5pSOrL1hyiPHtXVUoiR0H8FhFS8GHD/WRn0=;
        b=kIp9sylCgUa7BM+4yXcSHXp+z1ROjd64d+jpNV0mVvzgmbtNJe4JomcVsxFfg63Ffo
         4lUiJyEw39NGxXIb8QwQfdnPw7rARE90Fh0/Hpeol8WMIh6rZzUC9NlfNzCpyGltRipO
         UPQW0vgnONhcqI2Zl1rA+05EpmL5IaRLKWWM640zJGF5aUWCUWGkWorNqrv7RqunfCDN
         wd4arUGRTyVlmt/RzACjgCTuHp4WZowp5GBvKNK39zJw7rMWBoAec0g6SqSs7IV3mD0F
         OQDSWBOihksxN/ZRaZsOs7X9qdC9Kqqd65fZWZhWkkuZygayBEJhNdwxFipCJ1twQ4Ht
         pSAQ==
X-Gm-Message-State: AOJu0YyW3Jati+QLuZq6ABpXRu4cV7dE3uPHY/BHJA1PQLZMFuVlY9eQ
	vlgA806QQpvHwiHBvnk8uhahmcTrkKFxu71r/SK5e/aDnGFmXrRtm6ufzMASoqThVR/9/Ai855V
	3ZoIidQlF
X-Gm-Gg: ASbGncvNF4LdcsSEUrtyl1MISupEWpyUyOhhi+VYEZNf67H6eQgBljUPTW18Hn4YQO6
	FqscDhj5Upc0iSieopRseO2sdqKP09tOqLl2Pz/ZONieqYA3YJ+o0kF0CC4UpDPGRJmH3GkE74s
	XBljmF9EJ0oePuYNL1GsyEEnyS0A9YGbpzOWLe3EmLuS15mO48Eg1npN1SWZ57FlKNUxtiRwT1N
	MjJpfOmzscEkN6SZLqmDAqgI52cQKUHsEcF1xU1k6SOsiU6IegsQg8a/gTnZVbEP/mTW3Wudspw
	eQQT8WkIz0v7r09kEEAbaWhe7/72PhUtOf3YWLcJJV2tpcz0X8Vr55QIRI3vB4vDZ3JcPyu20a/
	4w6P4dm+QqLecJMEGbHLehdr8DxNzgfo1sgqiuiZ1GWT3Yv0bHjY0eHxYQUz/Y0oiCGSQWH/D3J
	BoOoOkPW7/tF4wXY2egTdVESs0ILn8q1EdVFuomr6BbB6zpJubnw==
X-Google-Smtp-Source: AGHT+IHynLweeKA9Ij5ZqHyK/VwRa/0y/krKHaCzz5Fn9A4Sdjqhvb57JPybjTEK+gAdzjj4YQLQ/A==
X-Received: by 2002:a17:907:3e10:b0:b72:b710:cbfd with SMTP id a640c23a62f3a-b767170f7e7mr4392134666b.36.1764622750535;
        Mon, 01 Dec 2025 12:59:10 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59e9b4esm1350930166b.49.2025.12.01.12.59.08
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 12:59:10 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so1532301f8f.3
        for <devicetree-spec@vger.kernel.org>; Mon, 01 Dec 2025 12:59:08 -0800 (PST)
X-Received: by 2002:a05:6000:2282:b0:42b:40df:2336 with SMTP id
 ffacd0b85a97d-42cc1d19a9bmr43036897f8f.39.1764622748258; Mon, 01 Dec 2025
 12:59:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAD=FV=UbejKdD2q2Z3RuYH0Ooc6XRb0oynchDsqnq7GzM6ah0w@mail.gmail.com> <aS3eXBDtaoNLfxZy@shell.armlinux.org.uk>
In-Reply-To: <aS3eXBDtaoNLfxZy@shell.armlinux.org.uk>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Dec 2025 12:58:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WBbqSDghm+o2ZVa4-AbL4aggFQO0xdtmZNrYOQRjF5Vw@mail.gmail.com>
X-Gm-Features: AWmQ_bnKBMj_4BZSGQ_zt34CE203-diDNxdOfHh2BJz5uCaYVKDBch65v2RkB6o
Message-ID: <CAD=FV=WBbqSDghm+o2ZVa4-AbL4aggFQO0xdtmZNrYOQRjF5Vw@mail.gmail.com>
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

On Mon, Dec 1, 2025 at 10:28=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Dec 01, 2025 at 09:42:40AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Nov 18, 2025 at 2:43=E2=80=AFPM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > This is a continuation of the discussion that started in reply to my
> > > patch adding basic device trees for Pixel 10 phones [1].
> > >
> > >
> > > Problem statement:
> > > ------------------
> > >
> > > We would like an officially accepted scheme that lets us more
> > > efficiently ship compiled device trees for a handful of related
> > > products by breaking the device trees up into a common "base" device
> > > tree and then applying "overlay" device trees atop the base to make a
> > > full and complete device tree.
> > >
> > > To make it more concrete, we'd like to build a "base" device tree tha=
t
> > > describes a SoC and then have the overlays be enough to make a full
> > > description of a board. In theory, one could also imagine wanting to
> > > expand this to 3 or more levels (perhaps SoC, baseboard, derived
> > > boards), though this is not planned at this time.
> > >
> > > The primary reason for wanting to break device trees like this is
> > > efficiency of the shipped binary device trees. A large portion of a
> > > final device tree just describes the SoC. We save space in the final
> > > compiled device trees if they don't need to contain as much duplicate=
d
> > > information.
> > >
> > > A secondary reason for wanting to break device trees like this is to
> > > more nicely handle when a board has a socketed SoC that can be
> > > replaced with a finite (and small) number of different SoCs (usually
> > > revisions of the same SoC). Even if this secondary reason is
> > > considered invalid or too difficult, the primary reason still
> > > describes a compelling need.
> > >
> > > In order to make this proposal work, it's expected that a bootloader
> > > will understand the scheme and will know how to combine the overlay
> > > atop the base before passing a complete device tree to the main OS.
> >
> > It's been roughly two weeks since I sent out this proposal. Do DT
> > folks have any comments? Are the goals I have stated understood? Do
> > people agree that these goals are reasonable? Is there any question
> > that there is a need to solve these problems not just for Google, but
> > for the community as a whole? I'm happy to reach out to people and
> > have them reply "yes, I have this problem too" if it would somehow
> > help. I don't doubt that there are still people at Qualcomm who would
> > like a solution even if I think Elliot isn't driving it there
> > anymore...
> >
> > How do we make forward progress? Does anyone have any comments on
> > Julius's reply? At the moment, I think there are some conflicts with
> > what Julius would like to see (no changes to the rules for how
> > overlays are applied) and what Rob said previously (we need to find
> > some way to combine the compatible strings). Did I misunderstand? Can
> > we find a common ground?
>
> My feeling on this (and I don't have much time to consider it tonight)
> is that this isn't going to get a quick answer.
>
> This answer is based on my authorship of various device trees, and is
> solely my own opinion, and in no way represents any position by my
> employer.
>
> While the DT files are dual-licensed, the license that applies to the
> copy in the kernel is GPL v2, because the kernel as a whole is GPL v2
> licensed. The dual-licensing of the DT files is to permit them to be
> taken from the kernel and used in e.g. boot loaders etc.
>
> However, as the license that applies to the kernel copy is GPL v2, and
> GPL v2 requires distribution in source code form, or an offer valid
> for two years of the corresponding source code etc (check the GPL v2
> for the exact terms) it could be inappropriate for the kernel tree
> to distribute binary DT blobs without their corresponding source.
>
> It seems to me that this is a problem for lawyers, and you're probably
> not going to get a quick answer on it.
>
> So, I'd suggest patience, and don't expect this topic to move quickly.

It seems like perhaps I wasn't clear enough in my description of the
problem I'm trying to solve. I'm not trying to change anything about
the licensing or where the device tree source is stored / distributed.
This is all about packaging. As you can see further in the original
patch series I pointed at [1] that I include both the base and the
overlay source code [2]. I just want to organize things such that
SoC-related nodes and properties are in the base device tree (whether
"dts" or "dtb") and then we use an overlay ("dtso" or "dtbo") to end
up with a combined device tree that represents a complete board.

Today, there are no technical reasons stopping people from doing this
and many phones (including Google Pixel phones) ship their device
trees like this.

That being said, we can't land device trees like this upstream because
the base device tree for the SoC is not "complete" and can't pass yaml
validation.

According to Krzysztof, this is simply policy. As he says: "SoC does
not meet this criteria, therefore it is not suitable for DTS" [3]

If I read his response properly, Rob wasn't dead-set on this being
against policy. He said "I think it is worth having the discussion"
[4]. He was concerned that the final compatible string needed to be a
combination of the base and the overlay.

My goal is to find a solution where upstream would accept device trees
that are split into a base for the SoC and an overlay to "complete"
the board..

There are no legal questions here. I don't even believe that there is
any true technical complexity, really. There are a few small
differences in the way we can slice a solution and how we do it will
certainly have impacts, but I don't believe that some magic solution
is going to come up and make everyone happy (someone should feel free
to prove me wrong, though!). This means we have to either decide this
isn't a problem worth solving or we have to pick some compromise about
how this works. At this point, I'm fine with any answer (even a
definitive statement that this isn't a problem that upstream wants to
solve). I'm not terribly happy with just ignoring it for another year
or three.

[1] https://lore.kernel.org/r/20251111112158.1.I72a0b72562b85d02fee424fed93=
9fea9049ddda9@changeid
[2] https://lore.kernel.org/r/20251111112158.4.I5032910018cdd7d6be7aea78870=
d04c0dc381d6e@changeid/
[3] https://lore.kernel.org/all/20251114-elite-refined-yak-bf9e64@kuoka/
[4] https://lore.kernel.org/all/20251113022719.GA2281498-robh@kernel.org/

-Doug
