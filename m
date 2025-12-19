Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA26218AAB
	for <devicetree-spec@vger.kernel.org>; Fri, 19 Dec 2025 03:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766116417; cv=none; b=OR1xRxcGAAidsq+xMyYf0ZZARA8UYftSEg5bgLu9B0MDVwAVRxZjMC/R8ojtR6eiodTYnPXdWRmU1qaRiRGyI8IBYmCP8TtmAjDiKBko09NB2qqOaFiuMeT/RdySANWf/uGqbuahQkAoiukOwXGZclUupJTfhs9asHCmNGJgHLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766116417; c=relaxed/simple;
	bh=0lUyL1UCQm8GpXarPgPZME+r7IT5Tq9McCg9JzwT0XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoNGdju2Z3jiexq5DmYHOEHNKqsJOni2EBalk7KQysAJYX02p0I1X3UFBFoMj1IEM9rPMaNua8o1jYjD5mW7jzajEdrWOpw5Qgw9iXq3nyR1lDOFEa11DDI1+vWyc7a/kuq60mn66XTgQ+ago4KBoZABWntuKYMIegkgwSErrRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c9utwW75; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c9utwW75"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so921833f8f.3
        for <devicetree-spec@vger.kernel.org>; Thu, 18 Dec 2025 19:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766116413; x=1766721213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lUyL1UCQm8GpXarPgPZME+r7IT5Tq9McCg9JzwT0XA=;
        b=c9utwW75+gZCU4jpbDiiPMex7ExBPwk+Xgo5EQpOdxYD65qxzzJVTnk9LoNItmAYiw
         EkiAJ7hu595SaRVpjiBy6XETpdICnKoQAVCYVdZn+9pU4vkLz00p1ts5ZOkPxLeJ7lJm
         J3X7d+h+iA7gfhSsB0nCqSnZVp4znxDWiwLDyiNx4DenwFzacZPqXzVGUepxCHEkeMn9
         ufZTLA+y8WTGMbc90w1MDXwg7uI8NkGmSBTkkUgj2T5LF4hfjEqgp2qD3CNl7i7Sd456
         vYhSOCtKXSopZGmSk4TVo9EabyaR1Wqx76yylXLLijpZRopYHyo6aU0y8d4M72q0qs5n
         k/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766116413; x=1766721213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0lUyL1UCQm8GpXarPgPZME+r7IT5Tq9McCg9JzwT0XA=;
        b=CWAD2sJ23vNm72+LJYfClVZhEf0r3mloqX2EO650UuqFBNSj461lui5p/olF4AvhNo
         UcoATXdbxYdfh6ZY7LSqw5rnLfEvb7FPSSwDEh4NDSW2jYrvnP97U8HE88ho6oGJGSFF
         ZvNBTMYmRrbYoXMN+rpfrkTSFpORpJyLguytQuA4P3c2DGyOH1pcQxwizu9cM7qjOAls
         oiVxnxbHSBPd1uAmnCrJK3J2u5EVnszaWJBXVjqqjWdPlrm4XeVBEKfi2+kBCH9u8wyo
         mSSMXgXWZqVzZgiKJxsQlapdvqGpPFoirX2un3YZCTrB4ASzu5yyB+B4KlvM252S7xrP
         Cl3A==
X-Gm-Message-State: AOJu0Ywn/mXFnFiXKVQmPVYPItbtouains5d245CRkh1qBEHTjXhnAzp
	yBh6Td4eHmERyXrZHhBSMm4ePGNQUF17eU3gqsZp5Cb30x1RU+VYgbhDqBlpkA56L2329TyrSG/
	SKSVeezqzEWPnaIHMsCXPqQ3KrNgDnXM7P6aGexAu
X-Gm-Gg: AY/fxX6A5HkHigEM/E6xAcEbBUvvSPRj5Bzy1cwIcF7PqI00ApQ4zjBrRgCzSkKv15f
	p7Z8M3SmNIFuzE/kOEKTFavfcbcNdLYt6TdmwDL1a5qEg9WSYxkCgrgLwfRwql0X8r3Wf4lESEw
	6GzHWfbSqwcZcBbcNvhOf/g3n1gKOw4nRPEK28IaKqqX8tbuwCU1AziPBTQTdJwGSEf81CfvKzc
	bZcPnneROFL8aEeeuS8uGwu37E/5j+qk8sHHaOPrTUHLskLX6D22NFC5nKp7n2QaFQghaELMoPx
	YDRT4lysgG9gG92vEuXI3JR0dw==
X-Google-Smtp-Source: AGHT+IHIoRhAHsJljmUD61AePjzLVFwj3QhjnhhL+UNfjxtXlU0R+Mcoh6Zz1m9uhNQfkadim1hYkHd1OiRbICHRCl4=
X-Received: by 2002:a05:6000:1865:b0:430:fd69:9920 with SMTP id
 ffacd0b85a97d-4324e4cb8fcmr1372653f8f.16.1766116413242; Thu, 18 Dec 2025
 19:53:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=W+jE_L_LLgAhD8K_4+CtivSD9-9t7Xe63XuKrKjfyfeQ@mail.gmail.com>
 <qjpukes4etbgh4ncapec4v6okkiohlcqqdfvjfinyrj6olaryc@l3vspbwze7ri>
In-Reply-To: <qjpukes4etbgh4ncapec4v6okkiohlcqqdfvjfinyrj6olaryc@l3vspbwze7ri>
From: Doug Anderson <dianders@google.com>
Date: Thu, 18 Dec 2025 19:53:21 -0800
X-Gm-Features: AQt7F2p2onmGGluMChpUPnX2EJ52kg3U4wzxf-6WTNWJ3ZgZKq0PFDzSaO68z8M
Message-ID: <CAD=FV=VmzcsauPM3WuJhc9=_+qa+Tvmtqdhz0eDXz5TF-fHaKA@mail.gmail.com>
Subject: Re: Proposal: document where SoC info belongs
To: Bjorn Andersson <andersson@kernel.org>
Cc: devicetree-spec@vger.kernel.org, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 18, 2025 at 6:39=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Thu, Dec 18, 2025 at 02:56:03PM -0800, Doug Anderson wrote:
> > Hi,
> >
> > To try to move things along, I'm picking a small piece out of my
> > previous discussion [1] to see if we can make some progress.
> >
> > Right now, the top-level "compatible" string in a dts file usually
> > contains one or more strings to represent the SoC. Examples chosen
> > semi-randomly:
> >
> > exynos5250-snow.dts:
> > - compatible: "google,snow-rev4", "google,snow", "samsung,exynos5250",
> > "samsung,exynos5"
> > - SoC: "samsung,exynos5250", "samsung,exynos5"
> >
> > sun20i-d1-clockworkpi-v3.14.dts:
> > - compatible: "clockwork,r-01-clockworkpi-v3.14", "allwinner,sun20i-d1"
> > - SoC: "allwinner,sun20i-d1"
> >
> > sdm845-db845c.dts:
> > - compatible: "thundercomm,db845c", "qcom,sdm845"
> > - SoC: "qcom,sdm845"
> >
> > I propose that we DEPRECATE including SoC information in the top-level
> > compatible string and move it elsewhere. I propose these top-level
> > properties that should be used instead:
> >
> > soc-family-compatible =3D "vendor,family";
> > soc-product-id =3D <0x1234>;
> > soc-product-variant =3D <0x1234>;
> > soc-product-description =3D "Something";
> > soc-major-rev =3D <0x1234>;
> > soc-minor-rev =3D <0x1234>;
> > soc-sub-rev =3D <0x1234>;
>
> So these 6 properties defines the soc itself? And the rules for how a
> bootloader matches against these 6 properties is defined elsewhere?

Right. See below, but I think a bootloader would need to know how
important a mismatched minor-rev or sub-rev is. I guess we could come
up with a rule and hope it works for everyone, though...


> What about "PCB" name and version?
>
> How about the case where my product has 5 different components that
> might come from a second source?

This _only_ covers SoC with the goal of getting the SoC out of the
top-level compatible string. The SoC tends to be a lot easier to deal
with. It doesn't try to solve the board problem. I was hoping to bite
off something small that we could agree upon and I'm worried that if
we try to tackle the board problem at the same time we'll just get
deadlocked.

IMO different families of boards will have different ways of
identifying different SKUs or boards with different 2nd source
components. Thus, IMO, for describing that type of thing we need to
allow different "loaders" to specify different types of properties.
...but I guess this is controversial and folks would like to identify
some sort of "universal" system that everyone can agree upon. While
that seems like it could be doable for SoC, I don't see it working for
boards. Maybe I'm just wrongheaded.


> Are you proposing that we allow adding arbitrary properties matching
> some pattern in the top-level node to facilitate matching? Presumably
> defined in some combination of vendor bindings?
>
> >
> > The family-compatible would be VERY high-level and is not intended to
> > be a marketing name. It would be something like "samsung,exynos",
> > "nvidia,tegra" or "google,google-silicon". The ONLY goal for this
> > string is that within a family, the other properties uniquely identify
> > a given SoC. This is a SINGLE string, NOT a list of strings. There is
> > no concept of being part of multiple families.
> >
> > All the other numbers are hopefully self-explanatory. These values
> > could be absent (assumed 0) if they don't make sense for a given SoC.
> >
> > The soc-product-description is designed to be some nice name that
> > represents the family, product-id, and product-variant but _not_ the
> > rev (since that's easy for anyone who cares to represent it as "rev
> > X.Y.Z")
> >
> >
> > The goals here are:
> > * Stop trying to jam so much into the top-level "compatible".
> > * Make it one step easier for bootloaders (or code packaging device
> > trees for bootloaders) to differentiate device trees / overlays. This
> > isn't _enough_ since this proposal doesn't include board info, but
> > it's a place to start.
> > * Make it easier to deal with "socketed" boards where the SoC can be re=
placed.
> >
> > NOTE: if a set of devicetrees is provided to a bootloader, it could
> > not just look at these properties to help it pick a devicetree but it
> > could also change the properties to be more detailed (it could fill in
> > some of the minor/sub-revs, for instance).
> >
> >
> > I think this is a positive change for everyone and a cleaner way to
> > represent things even if you aren't dealing with the above problems.
> >
> > What I'm looking for from people is some responses. Folks could choose:
> >
> > A) Yes, this is great. We already have something like this and we'd
> > switch to your properties if it became a standard.
> >
>
> We have qcom,msm-id; qcom,board-id; qcom,pmic-id; these have met the
> needs of some, but generally it lacks multiple axis.
>
> > B) I like the idea, but I need an extra property to represent my SoC
> > and then I'd use it.
> >
>
> s/an/several/

Aside from helping to deal with boards / second sources, what is missing?


> > C) I like the idea and I'd use it, but with some changes.
> >
> > D) We don't have anything like this today, but it sounds useful.
> >
> > E) Why are you wasting my time? This isn't a useful problem. The SoC
> > belongs in the top-level compatible string, period.
> >
>
> We do have functionality that relates to the generic soc name,
> (qcom,sdm845 in your example above). Extracting it into something else
> would imply that we need to check against soc-family-compatible?
>
> But when it comes to bootloaders picking the appropriate compatible,
> I've seen plenty of cases where basing it on compatible would be nasty.
>
> E.g. how do you write your string matching routine such that it allows
> all the different axis, where some are optional, some allows fallback to
> previous minor revisions of the chip etc.

If we're _just_ worrying about the SoC, I think we don't need to do
any string parsing. In the case of Qualcomm, I'd imagine that you'd
have _just one_ "soc-family-compatible" for all Qualcomm SoCs. Perhaps
"qcom,msm". This is because I believe all Qualcomm chips have a global
"product ID". So for "sdm845", you'd have:

soc-family-compatible =3D "qcom,msm";
soc-product-id =3D <0xSDM845_PRODUCT_ID>;
soc-product-variant =3D <0xIF_THERE_ARE_SKUS_OF_SDM845_PUT_HERE>;
soc-product-description =3D "Qualcomm SDM845";
soc-major-rev =3D <...>;
soc-minor-rev =3D <...>;
soc-sub-rev =3D <...>;

So no string matching. The bootloader would have to have knowledge of
whether it would pick a device tree where a sub-rev, minor-rev,
major-rev, or variant doesn't quite match.

With that explanation, does it sound better? ...or maybe it's just not
useful to you because moving the SoC out of the compatible isn't
useful to you without also handling the different SKUs and second
source components?

-Doug
