Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B10346FA6
	for <devicetree-spec@vger.kernel.org>; Wed,  3 Dec 2025 16:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764779122; cv=none; b=aoIT+LEryY+YdmWWaY5Y6dcUgjiJuxwTkXcJgDsL2pE88XmS1hnOaxMyK11xDiB2OFMcZ6Q64MECKrKkeEc/j0ZURLpcFrzAu9ikVkNh81EFVJO+IHT06vyqphKi7bVZ8ziRfOvZk1HNdbDm1EJKhmVwOmSZx0zcSrrpq0WfpxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764779122; c=relaxed/simple;
	bh=X78IJ0DvEjlyqwGmyrvaQ2ENJh3+EZqI8vGK+k61x8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gX0mfNd61vaqFUOq6GonSngYmgl3VUSMq3iVtq5cjdkh4qpAl+ZMQpcsZE9WpWa3n3vR8A7MV3bXLB/Zu0pHt9l9XuyRk4vWYf9oTx2K8BN1RC+ICsIgJSgyl44fJdNCtoxG+CVkxj5+JTTvYfXA5MWhRex/0VMY/szoEVUBYwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZVyOk0/N; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZVyOk0/N"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b735b89501fso843836566b.0
        for <devicetree-spec@vger.kernel.org>; Wed, 03 Dec 2025 08:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764779115; x=1765383915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOmbe3vzAARQVwHwMPSNLWrHj5szl0MDHgWp97fNf0I=;
        b=ZVyOk0/Nna/jCSIfAKHLNU5B7L8ih/j+xrd//WPxRdtLXQkJHps7EUSDdrQEIQdFSp
         IVprCL9nXgdTv+rAU3u+0NcfEBjJXFToQdrnfRTJR528l2cVD8uN32MLrbKyFh0+LDRR
         g7qnMouYpNIGqby63VF/7eRbTjd5fx8mvt1YE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764779115; x=1765383915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jOmbe3vzAARQVwHwMPSNLWrHj5szl0MDHgWp97fNf0I=;
        b=IaUUiTU2O+J3i3/RuOCCB7q/9icpRAg/7R+qIzw5R+9QWFbGs5jOVXawEDU7QAhtLo
         LWuOSQ6UARBg8hyAqMlPjaOvq3yHW9Peed0q9sILK6lZyoAK14ylcUKdf8a2ra3q2tdn
         ea/eqA1lozX9ok9KmgvxUkx2KL57HZiQEPDhWxg6Hn9e23SpaKsWuXREp28rN6QKp2QF
         yjPWmPTbIPTsIyMUTlzZeujT+eih0WsTnQ54OWGmgiV9S1XHyh8eQtJqxSbz2C+geSXc
         HzFqYQ+u7xNA94Xjk7uCKsSx6ZxvW8C17QhkPpneNaYJS6YZuWHlf9TAjvcY6ylySEFT
         YnmA==
X-Forwarded-Encrypted: i=1; AJvYcCWrSmuzKlIvODRRljZVa0B9vwTAryEL7ECJTIAQ9dm4+UBcOLr9M7gs/7hEcGV0WUyjf9/VWlCLt5wPaRC5fn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YztK34aoPTnSPot97jANnCh6blt/TXsPW1E5c2a1xNPMoBYeoFS
	bWtZBYn6KR3B21K8rJD6ZYmZEv9GpJJYyKDd7rIzq4qv2wOhHysAQlyGAtlpuIQtp1dcjYW4iV0
	l3L+Gt/b9
X-Gm-Gg: ASbGnctigLqrCt4YU4JssFO2uchvwGmh3eLNuqtf1a8rNq70oKbWDgzdkfIoxVPavAg
	v+CKduIwneX0h6/V7eIE80388ckI5pH/R3zuJuVqD8XlVwR+jAWCq63i6u+kcNB7hPmOQdX+p3j
	mrDoT5xKlUWQlTiQoSfOa+nwzY2LDkhZDKYxWSLOZqpuZ5KhMZR3NgwkWaxK7jLRrHcZ9QzfhG4
	4llbEAWa/c+Tl4FoqEvJqQnIGMkCpITUAVs2lP6lllkY6SqvPjlLzF8M73BhyhynID4V4SIbyal
	PnLRYwkXmE6fjeB0/iU7OGmebrLDrpmpfkSk/rh68FJkzqEV7u4lTYDdgzrnxKrztYMu6YvBSFl
	t6+TclrYVxBo9nzDlLWAOnbvdSCUQIFU5robzYfhkEsvyK7ehroeYkc1jjwe8n3MF3PxAS1qnSU
	OoBcW+ssIZJ7pcoxVcupci0P1hNo7bHr+zKIpnPnng8pRcE1kPMg==
X-Google-Smtp-Source: AGHT+IEkPZKfrUBxbMyMpEFA8xl076MCF8lP/aRk+EniHpxBeeJnVTNhkphi2qR1Uwv4QcjiwMDwdg==
X-Received: by 2002:a17:907:86a5:b0:b0e:d477:4972 with SMTP id a640c23a62f3a-b79dc4ea3a7mr334252066b.25.1764779114937;
        Wed, 03 Dec 2025 08:25:14 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d5dsm18598934a12.12.2025.12.03.08.25.14
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 08:25:14 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477770019e4so59784915e9.3
        for <devicetree-spec@vger.kernel.org>; Wed, 03 Dec 2025 08:25:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVAq1jdpsztqihPjkpiYw+pKzOVFqhiUMscXpcTH8zXqo2fjkz4+nGAeI1hsr/2nQNrIMeEeEQcbhxGPYDQ8+E=@vger.kernel.org
X-Received: by 2002:a05:600c:35ce:b0:476:84e9:b571 with SMTP id
 5b1f17b1804b1-4792aef7e8emr35377505e9.14.1764779114094; Wed, 03 Dec 2025
 08:25:14 -0800 (PST)
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
 <CAD=FV=Uq9yfUkLUgg116G+2AvEKkEPmdRgUJ5f1bj229j=LxUg@mail.gmail.com> <CAGXv+5HU2y-8AZhXDjneaTdD1yr2h06OXbkozcQJj2mBcR1HmQ@mail.gmail.com>
In-Reply-To: <CAGXv+5HU2y-8AZhXDjneaTdD1yr2h06OXbkozcQJj2mBcR1HmQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 3 Dec 2025 08:25:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U54Uwny=kHY+VjG5DGCSHeRUCcWMG=hG88ov8hC6Ynew@mail.gmail.com>
X-Gm-Features: AWmQ_bkDjTZX2TJKEcgkE7D_dL3KInx1SDfyqXNvFHSLkZzFxywJ641Qd3tcrIU
Message-ID: <CAD=FV=U54Uwny=kHY+VjG5DGCSHeRUCcWMG=hG88ov8hC6Ynew@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Chen-Yu Tsai <wenst@chromium.org>
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

Hi,

On Tue, Dec 2, 2025 at 11:34=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Wed, Dec 3, 2025 at 6:11=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > > In the simplest example we could have one base dts and two overlays
> > > for two different DSI panel models:
> > >
> > >   - base.dtb
> > >     - panel-model-a.dtbo
> > >     - panel-model-b.dtbo
> > >
> > > The problem we then run into is that the base.dtb will only have the
> > > generic model compatible "google,foo", not the sku and revision
> > > specific ones like "google,foo-sku1-rev2".
> > >
> > > And we'd really like to avoid having _more_ overlays just to add the
> > > final specific compatible string, as that kind of defeats the purpose
> > > of using overlays to reduce the number of dts files.
> >
> > I think you may have simplified the above a little too much to the
> > point where it's confusing. At least I'm a bit confused. I _think_ the
> > problems you're talking about are the kinds of things we run into when
> > we take overlays above just two levels. I'm imagining:
> >
> > - base.dtb
> > - board1-rev1.dtbo
> > - board2-rev1.dtbo
> > - board1-rev2.dtbo
> > - board2-rev2.dtbo
> > - panel-a.dtbo
> > - panel-b.dtbo
> >
> > So I think you're saying that you'd start with the "base.dtb" and then
> > extend it with exactly one of the "board" overlays and then exactly
> > one of the "panel" overlays. Is that right?
>
> For now I think we just experiment with having one end "model" or
> "product" as the base.dtb. The panel-*.dtbo selected describe the
> optional components, while the board-rev??.dtbo just provides the
> top level compatible and model.
>
> In an example that I plan to send out this week, I would rework:
>
>   - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
>
> into:
>
>   - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dts
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-es83=
26.dtso
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-rt56=
82s.dtso
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-es832=
6.dtso
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-rt568=
2s.dtso
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-boe.dtso
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-ivo.dtso
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso
>     - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso
>
> The "mt8188-geralt-ciri-sku?.dtso" files only contain the following
> boilerplate:
>
>     /dts-v1/;
>     /plugin/;
>
>     &{/} {
>         model =3D "Google Ciri sku? board (rev4)";
>         compatible =3D "google,ciri-sku?", "google,ciri", "mediatek,mt818=
8";
>     };
>
> The base "mt8188-geralt-ciri.dts" would already have a generic board-
> specific compatible:
>
>     model =3D "Google Ciri board";
>     compatible =3D "google,ciri", "mediatek,mt8188";
>
> > So I'd imagine that each of the "board" overlays could have "full"
> > compatible strings. For instance, I'd imagine "board2-rev2" could
> > have:
> >
> > compatible =3D "google,booard2-rev2", "socVendor,soc"
> >
> >
> > The problem you're struggling with (I think) is that the panel
> > overlays won't be represented in the compatible string (and "model")
> > even though (historically) we always did in ChromeOS (they were
> > included in the "sku" part of the compatible string).
> >
> > Did I get that right?
>
> In a sense you've generalized the problem I was describing.
>
> In my example, the top level compatible gets fixed up by the final
> SKU-specific overlay. But that's 8 extra files to do one bit of
> fixup that supposedly the bootloader could be taught to do, and
> could do even better. The bootloader knows exactly which SKU and
> revision it's running on and can insert the information appropriately.
> We could get rid of those awkwardly long compatible string sequences:
>
>   compatible =3D "google,tentacruel-sku262147", "google,tentacruel-sku262=
146",
>                "google,tentacruel-sku262145", "google,tentacruel-sku26214=
4",
>                "google,tentacruel", "mediatek,mt8186";
>
> Going back to what I think you're describing, is that instead of one
> base board DTB for each product, we could have one base DTB for the
> reference design (in place of the .dtsi file we currently have), and
> make products and component selection all use overlays.
>
> If we do that, then inserting the correct top level compatible and model
> becomes more important, since we do have things such as the ChromeOS OF
> component prober working based on top level compatible. Also, the model
> is present in logs, and would be very misleading to say one device name
> while in reality it is a different one.

I wasn't saying that you'd just have the same "compatible" for every
derivative of a reference board. That seems over the top. I was
thinking that you'd even have a unique "compatible" for each revision
of each board instance. I'm simply suggesting that you don't need a
per-SKU "compatible". Those don't add any real benefit, do they?

In your Ciri example above, you could get rid of all of the "sku"
overlay files since you've said that all they're doing is updating the
"compatible". Since (I think) you're only trying to support "rev4"
based on your model string, that would leave you just one file for
Ciri. If you had more than one revision then you'd have more than one,
but it doesn't need to be multiplied by the SKUs, right?

-Doug
