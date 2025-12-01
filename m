Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B8533A70E
	for <devicetree-spec@vger.kernel.org>; Mon,  1 Dec 2025 17:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764611408; cv=none; b=D4v4V/hXPGTCeN/5sj5tPOHhjkI+JkqLISPNAT09f5vIruNpr3adhq/1eIvnIUJrofhaeqNAFILPyj+a3JeRLPuIatxTKBqStz1issSIaieZpYn4RlrU0r9l+x+6QLAhBSzUSMtYuzakhKiVAwJdPQj+1XuSg4dIXAavrVIUBHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764611408; c=relaxed/simple;
	bh=z2aNNddcuFIhJPUpkq+i8i2OZABHzv6Jpaadi1Svrd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzvO9eQA2bEKB4+6Ehf85Cq57Uufh+NUOcu5YRbNg0zGwFxEMRg8aMf6B25u+Nh2mh57K+MLh73+lok5OiNoY8wMwnk2PTI86Lk7Im/lU2BQ24/2zTXnex7XzVdrK8AOiM0h/6pD8wDckdxoOtxU8vJznQGqfKIdXcc3naChsl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KCU6yNrs; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KCU6yNrs"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b73545723ebso890872066b.1
        for <devicetree-spec@vger.kernel.org>; Mon, 01 Dec 2025 09:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764611405; x=1765216205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2aNNddcuFIhJPUpkq+i8i2OZABHzv6Jpaadi1Svrd4=;
        b=KCU6yNrsJT+hLOAuLNeZ70K0sV3dFv449+1xgmlQ77DKdscG/TfmYCOwuUb+bOQkIw
         k+RHDmO2Op+eUiS3d6SmMHmwKIYcdJ5bQQLoJd55/DMofzC19x8QoxbCTFghamrxLCs0
         E+c8DCBJA3HR0V5EaoTbHhgYwGh+ue4kTKbNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764611405; x=1765216205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z2aNNddcuFIhJPUpkq+i8i2OZABHzv6Jpaadi1Svrd4=;
        b=O54CwiwDXdU2+tYlaueA53Stz2OKYOGmFCUtAD1uEn683BcCd4rJusIapkKTh4KVkf
         ncKNdyfFEOG43CXESdoklOOPhwb6tSzvPlJVyzIOhzDJzpHMb77FN14vFY32R3fpwZoi
         4w5o/s6HU9zva6RJcg6I6tMiCkx7joCt2gqzjfavFnSdCvw296TjLwY9zQP58LaTuyTG
         Ly5ecy5l2j2bagnlSQ79FIPNminQuvaE2HbzOe3f9rhM2h8C90f/RefEyEW+fw2iRRkG
         klNi6O0hFWVCH27D1XFvLvcDaK4pEmFQScOIs22rSflcW1TSZDH3+8rHSOzUMREDeRuP
         sZsQ==
X-Gm-Message-State: AOJu0YwroJlR6lCxghU85AZVIdf3rKkxqEOO6H08zoFsZKS3BqKW74P6
	Dt2Dr1qn46aKvzRAR7pT+8IwYAi9SJutbPPwZGR3BRSWe4rByOtGx6XGMcMq0TWrykUhAoJyjN0
	zwsLe5HFx
X-Gm-Gg: ASbGncvLVTSiminJ66c2lUCbY9660gRDkQyf5lXRvIXasmnNanFnOT3FYf3ImmkbME5
	OxuNviMH/O566ghM6uNbiAT3tj0qycWvFzZ+sSU5TPsy1v/QFxCHTnnqgIQZMxQgMyRPGgDXm54
	5jK83Z2B3BppmWZkP48izsflZql3U2bR+AlHdjZ19xTwv0LGYMgLRIpTPJdBGlaLnG/Hde2Vl2Z
	+V59R+bN6c2Bn22zeAfRxAFKu+00MrFzCSv3SvFBio4PgUZewBnoguzKAgTX5Yy7qGgFgOHI3yA
	07T0DXdTE2RwpImW5nVzZ7FeYK3AwlChzzzn1KFkr1R0obxwa6RgtqlZOeRkU6770AVYxhMc72V
	GeYru657lBWoZ7/aLjpTe7Fn9nCQw2Z4U42ARzhiZaNEdPehCAGASHq8szzeN49HIm/8SMqHViL
	Llo6iLqkLRsAs5DVC5fpuXsb283RQYfAiVoKh7KAnyqXje3oacjA==
X-Google-Smtp-Source: AGHT+IG+khhbeMslmrHZqesxPBC2XQjtXdDQkLOBjHs4KD5cMfVi73SfINezTK3rBym90gDy0CcUuQ==
X-Received: by 2002:a17:907:3f22:b0:b76:3548:b73b with SMTP id a640c23a62f3a-b767168f0b8mr4449521366b.4.1764611404995;
        Mon, 01 Dec 2025 09:50:04 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59aece0sm1255833566b.32.2025.12.01.09.50.04
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:50:04 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so8001304a12.0
        for <devicetree-spec@vger.kernel.org>; Mon, 01 Dec 2025 09:50:04 -0800 (PST)
X-Received: by 2002:a05:600c:3b01:b0:477:54cd:200a with SMTP id
 5b1f17b1804b1-477c110325dmr353054665e9.6.1764610971488; Mon, 01 Dec 2025
 09:42:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
In-Reply-To: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Dec 2025 09:42:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UbejKdD2q2Z3RuYH0Ooc6XRb0oynchDsqnq7GzM6ah0w@mail.gmail.com>
X-Gm-Features: AWmQ_bklYYUuZ7Bfo2iuNXaW3ByDaQVvqRqdXPt8364JwFM4FAtgG6_fIKG39f4
Message-ID: <CAD=FV=UbejKdD2q2Z3RuYH0Ooc6XRb0oynchDsqnq7GzM6ah0w@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 18, 2025 at 2:43=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> This is a continuation of the discussion that started in reply to my
> patch adding basic device trees for Pixel 10 phones [1].
>
>
> Problem statement:
> ------------------
>
> We would like an officially accepted scheme that lets us more
> efficiently ship compiled device trees for a handful of related
> products by breaking the device trees up into a common "base" device
> tree and then applying "overlay" device trees atop the base to make a
> full and complete device tree.
>
> To make it more concrete, we'd like to build a "base" device tree that
> describes a SoC and then have the overlays be enough to make a full
> description of a board. In theory, one could also imagine wanting to
> expand this to 3 or more levels (perhaps SoC, baseboard, derived
> boards), though this is not planned at this time.
>
> The primary reason for wanting to break device trees like this is
> efficiency of the shipped binary device trees. A large portion of a
> final device tree just describes the SoC. We save space in the final
> compiled device trees if they don't need to contain as much duplicated
> information.
>
> A secondary reason for wanting to break device trees like this is to
> more nicely handle when a board has a socketed SoC that can be
> replaced with a finite (and small) number of different SoCs (usually
> revisions of the same SoC). Even if this secondary reason is
> considered invalid or too difficult, the primary reason still
> describes a compelling need.
>
> In order to make this proposal work, it's expected that a bootloader
> will understand the scheme and will know how to combine the overlay
> atop the base before passing a complete device tree to the main OS.

It's been roughly two weeks since I sent out this proposal. Do DT
folks have any comments? Are the goals I have stated understood? Do
people agree that these goals are reasonable? Is there any question
that there is a need to solve these problems not just for Google, but
for the community as a whole? I'm happy to reach out to people and
have them reply "yes, I have this problem too" if it would somehow
help. I don't doubt that there are still people at Qualcomm who would
like a solution even if I think Elliot isn't driving it there
anymore...

How do we make forward progress? Does anyone have any comments on
Julius's reply? At the moment, I think there are some conflicts with
what Julius would like to see (no changes to the rules for how
overlays are applied) and what Rob said previously (we need to find
some way to combine the compatible strings). Did I misunderstand? Can
we find a common ground?

Thanks!

-Doug
