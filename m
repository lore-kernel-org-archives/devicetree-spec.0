Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F67341654
	for <devicetree-spec@vger.kernel.org>; Fri,  5 Dec 2025 07:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764921457; cv=none; b=Ub6scHnmSwQnOIc1nNB/61SsMLqWUWzi9gbz00paA04Pp+wQEof6tRY/RDWfjRNXfr2vtLxx+EOTijeqkZ69wOgiQ9mtOR7P2o8Bs4/WKk14r7aDcnbvLpnyEXG4754jyJcONoFv8495Xr6zBxD7WP5TTOmwRGHCPfT3ahyJGyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764921457; c=relaxed/simple;
	bh=8Bbq3h8qXvgwEpBrqOdkCOFZCmMH/Uut3VH18UrXQ10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cx4MLYkxq20QCJ8fjndEyfUXlfjGCfalanq7SrQoQwFWKruslpdpQSxeuF1H58j+1PcrC2TdIJlO8zyrX3jL2/U9SokqqIK/lN8uPBFwvAn8AMkFJGzdHGpreX0wQNn8FtQVXTD0PGt+kTtx1VjRVwCdIiQBqP37TBcVcJ/JauU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=fail smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mvDlx05F; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mvDlx05F"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-595819064cdso2652621e87.0
        for <devicetree-spec@vger.kernel.org>; Thu, 04 Dec 2025 23:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764921443; x=1765526243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLD+VL6KxaJNpLbOdAPh6PBCjAs3r0xZd7BY2IsaVLQ=;
        b=mvDlx05FNlfMk3c/yxF68MINU3ImxChsVhwWq+Z/UwP0R7u5VbyDDLadDbREJUEp+b
         Hvf5XCExq4GcVP4htXOIbw/r+3QbyZKIHa4Ec69QhxFIo3OF+z3ADeXOEy6ENa/Ajcbg
         WMtsq1QPXTVag54RTDbTkoVWY+7DEeCg+q6wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764921443; x=1765526243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SLD+VL6KxaJNpLbOdAPh6PBCjAs3r0xZd7BY2IsaVLQ=;
        b=qB/7qOttlYypF8YRbhXANzcJfHtcACPBybfp1HqwDKQDH1nJq5PSl4bFuxWOgeIGmV
         bcFjaLI1JeoO0m0eX6lY1VF0wTECJaoaJhInl2f/I6FWU0r5IDkdxNhZiHyhkslMU/o5
         hh2euNDISg+NBnVv2Sxbccg223MqhIUYcNluxtt7KLe87biINUTWhIv/zpunJO5CmxSX
         zr/1oFvlDTLUiGiZX7Nan4KizPEbe7gNUCUFWjVqUL4hZfso54c25etFZhX+3IE61DeD
         gMWLXTvnm+3QjD1coQmCoHYSga5RSQppL/UfYIbm9kjnAQg5B8Mw3jNFUonY2Q4IoepQ
         lTSg==
X-Forwarded-Encrypted: i=1; AJvYcCWpPIPXamCR2uwahuNxInxAoOdxYtXbnZs9NRHg4UaQv6zv8cffsMVlK6SRBbxckZGl3bVki5njSTm9I62Vhjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXzCMOdsC2XrLP7jXZ39zPGkOKcmtRCg7Gh7U0MUJId4ZF08jL
	nRVE1y0A3iGGk/3VHn1WxNXMrTTNsLghXJ7N+gsRpxpMpWeWdqIWMyTZ3+AoKFtZ7tuU2IaQYUB
	aBeemGJIb03RyUGQ7keVBpJ3SkWdeRBOiAkZxlk58
X-Gm-Gg: ASbGncvt33v1C9zDFPk1W+NrBSxv1v57/A71AC6CKA8vxZVBwe41IuDSbil/LC4idxt
	aviDEonoVJiX6XaNHYE+eNZwqFuFqu9iBnqOjxPrcaLlhr2udRCnBOHnu7kfS810igr0ZxMFcxA
	Lh8N5tOq1+2Dx34F0CEl4An6Dg4HLg9cFz4fYOWhg6NlJPsfi9ywKhuPwZz3lr4vsjgXjXU0fFq
	7s4mSXKD+IPrhGc1EyEMM0eh59v4HaW6IejBfIrCG83sNRQpH9rVeHwjDcC1firSgKDAXuOogW0
	92fX0PK8WikrPnTLdEdNWj8T
X-Google-Smtp-Source: AGHT+IEpuCs/7c2leWW5Fv2G0gCbsdyCo98UVmtlRB6eHIxhmqgN9otJElNisDv5KbMphc2+s2OcSCWG2ig6PuULtVM=
X-Received: by 2002:a05:6512:3f1b:b0:596:b1bd:cbe4 with SMTP id
 2adb3069b0e04-597d63eab9emr2191700e87.8.1764921442858; Thu, 04 Dec 2025
 23:57:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAD++jLkuRQKoiEN928GtAj7wUts5PxH905bLp6ZhKsJ3NnenEA@mail.gmail.com>
 <CAD=FV=X5=AK4XMANv+fatn3d9Y5vo9AXsHWb_47HmNaMWUtMwA@mail.gmail.com>
 <CAGXv+5HyMYgKmLc+jmkj-gytm9SNVg9dS7Vn3dQ-dsH8Wo+4sg@mail.gmail.com>
 <CAD=FV=Uq9yfUkLUgg116G+2AvEKkEPmdRgUJ5f1bj229j=LxUg@mail.gmail.com>
 <CAGXv+5HU2y-8AZhXDjneaTdD1yr2h06OXbkozcQJj2mBcR1HmQ@mail.gmail.com> <CAD=FV=U54Uwny=kHY+VjG5DGCSHeRUCcWMG=hG88ov8hC6Ynew@mail.gmail.com>
In-Reply-To: <CAD=FV=U54Uwny=kHY+VjG5DGCSHeRUCcWMG=hG88ov8hC6Ynew@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Dec 2025 15:57:09 +0800
X-Gm-Features: AWmQ_bnyMAQiZOYBBfvhrL-p7NWwcYHWTn73VcRsGKhm3OKMH_INaVMR_dcDzI4
Message-ID: <CAGXv+5EXBimfLyK7bmyyHmNcPBNQ=wN+i1_siaMUcibiB7BCPQ@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Walleij <linusw@kernel.org>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, Yu-Ping Wu <yupingso@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 12:32=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Dec 2, 2025 at 11:34=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Wed, Dec 3, 2025 at 6:11=E2=80=AFAM Doug Anderson <dianders@chromium=
.org> wrote:
> > >
> > > > In the simplest example we could have one base dts and two overlays
> > > > for two different DSI panel models:
> > > >
> > > >   - base.dtb
> > > >     - panel-model-a.dtbo
> > > >     - panel-model-b.dtbo
> > > >
> > > > The problem we then run into is that the base.dtb will only have th=
e
> > > > generic model compatible "google,foo", not the sku and revision
> > > > specific ones like "google,foo-sku1-rev2".
> > > >
> > > > And we'd really like to avoid having _more_ overlays just to add th=
e
> > > > final specific compatible string, as that kind of defeats the purpo=
se
> > > > of using overlays to reduce the number of dts files.
> > >
> > > I think you may have simplified the above a little too much to the
> > > point where it's confusing. At least I'm a bit confused. I _think_ th=
e
> > > problems you're talking about are the kinds of things we run into whe=
n
> > > we take overlays above just two levels. I'm imagining:
> > >
> > > - base.dtb
> > > - board1-rev1.dtbo
> > > - board2-rev1.dtbo
> > > - board1-rev2.dtbo
> > > - board2-rev2.dtbo
> > > - panel-a.dtbo
> > > - panel-b.dtbo
> > >
> > > So I think you're saying that you'd start with the "base.dtb" and the=
n
> > > extend it with exactly one of the "board" overlays and then exactly
> > > one of the "panel" overlays. Is that right?
> >
> > For now I think we just experiment with having one end "model" or
> > "product" as the base.dtb. The panel-*.dtbo selected describe the
> > optional components, while the board-rev??.dtbo just provides the
> > top level compatible and model.
> >
> > In an example that I plan to send out this week, I would rework:
> >
> >   - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
> >
> > into:
> >
> >   - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dts
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-es=
8326.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-rt=
5682s.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-es8=
326.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-rt5=
682s.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-boe.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-ivo.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso
> >     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso
> >
> > The "mt8188-geralt-ciri-sku?.dtso" files only contain the following
> > boilerplate:
> >
> >     /dts-v1/;
> >     /plugin/;
> >
> >     &{/} {
> >         model =3D "Google Ciri sku? board (rev4)";
> >         compatible =3D "google,ciri-sku?", "google,ciri", "mediatek,mt8=
188";
> >     };
> >
> > The base "mt8188-geralt-ciri.dts" would already have a generic board-
> > specific compatible:
> >
> >     model =3D "Google Ciri board";
> >     compatible =3D "google,ciri", "mediatek,mt8188";
> >
> > > So I'd imagine that each of the "board" overlays could have "full"
> > > compatible strings. For instance, I'd imagine "board2-rev2" could
> > > have:
> > >
> > > compatible =3D "google,booard2-rev2", "socVendor,soc"
> > >
> > >
> > > The problem you're struggling with (I think) is that the panel
> > > overlays won't be represented in the compatible string (and "model")
> > > even though (historically) we always did in ChromeOS (they were
> > > included in the "sku" part of the compatible string).
> > >
> > > Did I get that right?
> >
> > In a sense you've generalized the problem I was describing.
> >
> > In my example, the top level compatible gets fixed up by the final
> > SKU-specific overlay. But that's 8 extra files to do one bit of
> > fixup that supposedly the bootloader could be taught to do, and
> > could do even better. The bootloader knows exactly which SKU and
> > revision it's running on and can insert the information appropriately.
> > We could get rid of those awkwardly long compatible string sequences:
> >
> >   compatible =3D "google,tentacruel-sku262147", "google,tentacruel-sku2=
62146",
> >                "google,tentacruel-sku262145", "google,tentacruel-sku262=
144",
> >                "google,tentacruel", "mediatek,mt8186";
> >
> > Going back to what I think you're describing, is that instead of one
> > base board DTB for each product, we could have one base DTB for the
> > reference design (in place of the .dtsi file we currently have), and
> > make products and component selection all use overlays.
> >
> > If we do that, then inserting the correct top level compatible and mode=
l
> > becomes more important, since we do have things such as the ChromeOS OF
> > component prober working based on top level compatible. Also, the model
> > is present in logs, and would be very misleading to say one device name
> > while in reality it is a different one.
>
> I wasn't saying that you'd just have the same "compatible" for every
> derivative of a reference board. That seems over the top. I was
> thinking that you'd even have a unique "compatible" for each revision
> of each board instance. I'm simply suggesting that you don't need a
> per-SKU "compatible". Those don't add any real benefit, do they?
>
> In your Ciri example above, you could get rid of all of the "sku"
> overlay files since you've said that all they're doing is updating the
> "compatible". Since (I think) you're only trying to support "rev4"
> based on your model string, that would leave you just one file for
> Ciri. If you had more than one revision then you'd have more than one,
> but it doesn't need to be multiplied by the SKUs, right?

That's right. What I was saying was that the final device tree only has
a simplified compatible, but maybe someone would want a proper one inserted=
.

ChenYu
