Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98351220F47
	for <devicetree-spec@vger.kernel.org>; Wed,  3 Dec 2025 07:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764747280; cv=none; b=BxibrwJ0wR2nbzns5zm4qoAZEs7tU6ypSgRSC8d5XD2AxTCgdPS4ruJ7z69go9azIsGQgu1F+W95sclQGnVe0Ar3s0i3PmRuYPmT103hSYPfTWPPv5Y4lNKcpX14Utfhk6OXHthqthi7VVHXJH+zA+qV214esAQGaipngkNJ84A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764747280; c=relaxed/simple;
	bh=vvsuP8cPec6tsdqpBusdQ5elvq0pr23aNk5vQBxpX2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m9aOTD8XR+i8jCryjqcuDTQEF+vCU2yZl1og/wZL4XAFiJvlNQ2kN9xeANFVHghBZQ4oR8q9nGIrGLff/Cez+BWRmPhZzjdNdDkNmpxX6qZUW86Wv/K3YvgEibygA/BfghnWt6s2xgxaJhYCOR7UebMnS9vnML4DJIsgQ0pPKnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NBrHTZL9; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NBrHTZL9"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37a33f49018so52738381fa.2
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 23:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764747277; x=1765352077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjpB6RpfP8oIRkf/hrTHm/IemCWsvs4k4JM+142Rzwk=;
        b=NBrHTZL914h6RqL5b7qjLYJYtr4MOpZBPm9QGsYf6rP3lZsK6yJHLYanRTCdjSXO0g
         zqj0c4HkkAEa/XezlBAVpi1CAxmnsG6PlPkvzJKTflC9rXJfgV2TI7flwbePVZNSKkIW
         2zeET46EdppdSTjfHe0d221KXxwK16mhIQe6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764747277; x=1765352077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hjpB6RpfP8oIRkf/hrTHm/IemCWsvs4k4JM+142Rzwk=;
        b=dcEJjIQvbZM8KGvUCwfl+E5fCfGtGF94cDxRin7D2qmwIu/gnqNyZiOQNXnvrdsykA
         NA2EkSWmUSLrkj+F1BXm6R7LMKQpKgh9C+43GFr0wf4W57R2FTNZjMR4af3zKT1eoGnH
         TJzKu8Zirp5JdaAyoglwhKyKQb+omfI6/bZFITmJ+rYp5BA59wd3+1nIYqZdWolNb0AO
         776TXnJOVeAz5W2JP4snqL85FZ0iE3RFJHvY88nx5ZrhO0eiUAgGQbZsW6hDDtrwe2R/
         bEfyMobZCMQFWfvMcn6vAN0GQkst7MvCckKHUhNPmwGi+pZvj8OlAVDU6jSPMV03Cy6V
         rltQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4WNv6BW+SUQoEml1gwCaZ8Qt77SPw1rzqyaQwJfAHumnzC1jDzrZFmvmQmeBsRjX5ZYcw2XfXMYwCMA1EHeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNRjr29fKaz3YqL40sCfcuXtDW97/OZ4E6AWOBpxwylIPWgYHb
	6M/F1ArEG59C1pm6F6mmDskOJVY2NJ41IQDYTGYNoEN+WoVuWeIIWB0NTlyHBLQ1wKY9YqYaxRj
	sPELfvXmI6O5r0d5es5f6+V3ZisTBbjk0aIT49UjL
X-Gm-Gg: ASbGncsF9qTmsB/780ShFxog6OUZ7l4Pg0a/HVEtBfaPSkbwZ+T2szpFrogg+AIo1sC
	GMfUsHRXegYg8KEx0fKmQxcQEke5zS+8ZEu1sFyuRLlExoPWuNNaUxseeaKfqYx8yldwR9amxSV
	aoriyv21QJVQ3ziSCbVNTB393XFgA1JNMQ9cPdVmAYTxdTVklo2WYwNln8yaMMcl9oodlkfDRwz
	Z4zXi45Z/Y/G4fbC5ssB9PSLyQvLqJ7X6BD4USwpynI1FeSbgNhrxmlWJLLrBUc1KUMxkBlgZhM
	AE34dpJ59YyKRm2PK9E52142/htom8aoaERO
X-Google-Smtp-Source: AGHT+IE8tidS1JbkFRNGe7CxrnOH2PGG15xmYSSlwG5R9iDK9wPsq27o+Cjidr3gLbydcJISmJWRUQmP7QDNztVpiLw=
X-Received: by 2002:a05:6512:3b0a:b0:594:490b:4498 with SMTP id
 2adb3069b0e04-597d3f144bcmr525202e87.11.1764747276661; Tue, 02 Dec 2025
 23:34:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAD++jLkuRQKoiEN928GtAj7wUts5PxH905bLp6ZhKsJ3NnenEA@mail.gmail.com>
 <CAD=FV=X5=AK4XMANv+fatn3d9Y5vo9AXsHWb_47HmNaMWUtMwA@mail.gmail.com>
 <CAGXv+5HyMYgKmLc+jmkj-gytm9SNVg9dS7Vn3dQ-dsH8Wo+4sg@mail.gmail.com> <CAD=FV=Uq9yfUkLUgg116G+2AvEKkEPmdRgUJ5f1bj229j=LxUg@mail.gmail.com>
In-Reply-To: <CAD=FV=Uq9yfUkLUgg116G+2AvEKkEPmdRgUJ5f1bj229j=LxUg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 3 Dec 2025 15:34:25 +0800
X-Gm-Features: AWmQ_bkxzVXkZCUfjtFP-mSp_oll7xVq_mrcGN89ZTQuKJKFTIYUF1_pwB0pj4Q
Message-ID: <CAGXv+5HU2y-8AZhXDjneaTdD1yr2h06OXbkozcQJj2mBcR1HmQ@mail.gmail.com>
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

On Wed, Dec 3, 2025 at 6:11=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Mon, Dec 1, 2025 at 7:31=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >
> > > Separately, it can be noted that we always _wanted_ a similar solutio=
n
> > > for ChromeOS, but we never quite got there... ;-)
> >
> > FTR ChromeOS is moving in that direction: splitting SKU differences
> > based on components into overlays that get applied to the base by the
> > bootloader.
> >
> > In the simplest example we could have one base dts and two overlays
> > for two different DSI panel models:
> >
> >   - base.dtb
> >     - panel-model-a.dtbo
> >     - panel-model-b.dtbo
> >
> > The problem we then run into is that the base.dtb will only have the
> > generic model compatible "google,foo", not the sku and revision
> > specific ones like "google,foo-sku1-rev2".
> >
> > And we'd really like to avoid having _more_ overlays just to add the
> > final specific compatible string, as that kind of defeats the purpose
> > of using overlays to reduce the number of dts files.
>
> I think you may have simplified the above a little too much to the
> point where it's confusing. At least I'm a bit confused. I _think_ the
> problems you're talking about are the kinds of things we run into when
> we take overlays above just two levels. I'm imagining:
>
> - base.dtb
> - board1-rev1.dtbo
> - board2-rev1.dtbo
> - board1-rev2.dtbo
> - board2-rev2.dtbo
> - panel-a.dtbo
> - panel-b.dtbo
>
> So I think you're saying that you'd start with the "base.dtb" and then
> extend it with exactly one of the "board" overlays and then exactly
> one of the "panel" overlays. Is that right?

For now I think we just experiment with having one end "model" or
"product" as the base.dtb. The panel-*.dtbo selected describe the
optional components, while the board-rev??.dtbo just provides the
top level compatible and model.

In an example that I plan to send out this week, I would rework:

  - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts

into:

  - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dts
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-es8326=
.dtso
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-rt5682=
s.dtso
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-es8326.=
dtso
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-rt5682s=
.dtso
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-boe.dtso
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-ivo.dtso
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso
    - arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso

The "mt8188-geralt-ciri-sku?.dtso" files only contain the following
boilerplate:

    /dts-v1/;
    /plugin/;

    &{/} {
        model =3D "Google Ciri sku? board (rev4)";
        compatible =3D "google,ciri-sku?", "google,ciri", "mediatek,mt8188"=
;
    };

The base "mt8188-geralt-ciri.dts" would already have a generic board-
specific compatible:

    model =3D "Google Ciri board";
    compatible =3D "google,ciri", "mediatek,mt8188";

> So I'd imagine that each of the "board" overlays could have "full"
> compatible strings. For instance, I'd imagine "board2-rev2" could
> have:
>
> compatible =3D "google,booard2-rev2", "socVendor,soc"
>
>
> The problem you're struggling with (I think) is that the panel
> overlays won't be represented in the compatible string (and "model")
> even though (historically) we always did in ChromeOS (they were
> included in the "sku" part of the compatible string).
>
> Did I get that right?

In a sense you've generalized the problem I was describing.

In my example, the top level compatible gets fixed up by the final
SKU-specific overlay. But that's 8 extra files to do one bit of
fixup that supposedly the bootloader could be taught to do, and
could do even better. The bootloader knows exactly which SKU and
revision it's running on and can insert the information appropriately.
We could get rid of those awkwardly long compatible string sequences:

  compatible =3D "google,tentacruel-sku262147", "google,tentacruel-sku26214=
6",
               "google,tentacruel-sku262145", "google,tentacruel-sku262144"=
,
               "google,tentacruel", "mediatek,mt8186";

Going back to what I think you're describing, is that instead of one
base board DTB for each product, we could have one base DTB for the
reference design (in place of the .dtsi file we currently have), and
make products and component selection all use overlays.

If we do that, then inserting the correct top level compatible and model
becomes more important, since we do have things such as the ChromeOS OF
component prober working based on top level compatible. Also, the model
is present in logs, and would be very misleading to say one device name
while in reality it is a different one.

> > I proposed internally maybe having the bootloader fix up the final
> > compatible string, but I think we need some rough consensus upstream
> > whether this is acceptable or not.
>
> Maybe we need to come to some agreement about when the top-level
> compatible string needs to be changed. In the above, I'd perhaps argue
> that the panel isn't a major enough change that it needs to change the
> top-level compatible string. That would solve the problem, right? What
> do others think? Certainly for "probe-able" components we don't change
> the top-level compatible string. Can anyone point to any official
> documentation about the top-level compatible string?

I'd certainly like more documentation as well.


ChenYu
