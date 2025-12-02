Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62C7204F93
	for <devicetree-spec@vger.kernel.org>; Tue,  2 Dec 2025 22:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764712963; cv=none; b=dk7BZ6gFa36DmxvWCtQ5bOk1efCebl1dZCg7YkUAV7QCJUpaae3C+ZJxiisAr/7hlLhkXsOC2Gh9CbM85Bg2KVfZR28TDzV2ftHxQ6Jfu6yXMefL8XbhHbrDDV5bDsxVjfuW77+9Ak46KAdJYo8TFXHS09uxxM+PPdYF6vY9THg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764712963; c=relaxed/simple;
	bh=u974lUXvRv6etq/8pbQkXrUsWQ/HwedC4B64gdg+Fz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tVsXfrUNLBrdEy3IMfsh++e0eMU0NAVgXO4LWvXDJpcFsYHF6bLhlFcpsR7llZHqicrHTJ6id+jQTA7pD+OQ2pgwd4Z/pMlEQn6Q2chHE100k/5Guv7H6LC2emN7Z3W1kVUjYqFqaDFz2KdGJsYlHw9Qvqqx/WOw/1vRGhvBlFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nKw7DN7v; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nKw7DN7v"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7636c96b9aso826403866b.2
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 14:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764712958; x=1765317758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u974lUXvRv6etq/8pbQkXrUsWQ/HwedC4B64gdg+Fz8=;
        b=nKw7DN7vv1VY9IFGC8r8wt7i7v+1KGn+FB7KSjD2gtECl9m44/gbgv/zPn3Dk5EgQd
         jCPfOcWcbkMQvrkFkK03zFWSgsjGvIabqwwf/V8VY2H+z/uC0zsECv8PnnwRGGHQDNM0
         tNM3rWJqC2ufJ1QOonOEDB2cvuGbfNjWN7Kbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764712958; x=1765317758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u974lUXvRv6etq/8pbQkXrUsWQ/HwedC4B64gdg+Fz8=;
        b=Ib3naaCsS6lgTHIDD6QoLG7kljcSoNF05OWl/56LA8KWo9AllDv22EoAittmpJZJ/J
         o3VAs6Ij5fBq173QUqPQHT+zJuhGVZa4B0crGqPAo9pug+fXbM0HV0fJBi2ZyJkzsc0e
         RLyD1B+HUo7P1KwE6XphoGSQo8XZl8j/ruDqQckXJyFlVncPQRCAzCacDD8/dm3m3Zhw
         egzhXglI569H06u7BHWlafDD1cNZT38gGejubQ1Bc74uYe4g5BIbori2wdtLg5FliPNj
         pvpvKTZEhWNO0Fei7plTt2GUuZUloWvV3D2iSEnKK+O51IqDlZvssfVL+Fm1Bj8mEY1f
         s2pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxbleHOmUYw2MKESdJJDPwM6ji4Vaj/ItNRTkWfxHMqcDkhjva6YDrr9DxdjQfmTIYBOAn4x0eOfElapEDK3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbKy5g2qRvgtIa2qkAf9eL9s1CTP+CnkAxHLcgubdmqRYe4qez
	G3uh36UtJFTzlAvk7KsJS5sg40qdC1v0rtcw/dTHVP4aoMuFNVp+/zk+mWPvhsFNJOxlwIMryCu
	4toGneRyQ
X-Gm-Gg: ASbGncuTbWSf/opXO+AxvmcAYSF4yZMyh/T2Nz73szLGJe8g7oH3iMRWCVmBp2220qT
	CfRXnaWN0kpQfZzLe0YFBsXYl/WkiFEvee+gzw9O1RDylJXQryiuvHV4E+cVaAPxJ0uwrkTpvGe
	7gJBCINs34Gp2HpHWgZYmglIB5wpCPw2gZOuV5AGe0zrRdsorA75X7+mc+Z9cHpFAVZORO76ta7
	49vqgFgDhXwtkByZDm9QPqbwQNVrF68OoppWksH4qoYqvv8l3OJJbKZIUtFILpseiO/WsGS45nw
	NDF+NKzp0kRzV9XHE+3u4mFp5QDqRvJMoB0R25cGtZoll9HPn6Qmw3dwDxwWA0YzJsPVInwkTXP
	LeZ6sOCEKKIZfA2QI+NQu08PTFcu4QMQAWJAKhDza2Qb8SzsjbLfUVeOQzP4VL4obG8OO9A0tnV
	2rtwmKViUpk5J/88+OgV8xdw72CP3Du6p5/LnbiWhF0LiB5OSDpQ==
X-Google-Smtp-Source: AGHT+IFsbY213E0x1vqR2w4JW+DDkjTDLmPOsOZShWVonG02uqgCjFAiZPM9CsK8G4NwslV2dRNKDg==
X-Received: by 2002:a17:907:7287:b0:b73:8cea:62bb with SMTP id a640c23a62f3a-b767170cceamr5187459066b.31.1764712958144;
        Tue, 02 Dec 2025 14:02:38 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59e93c4sm1579117666b.53.2025.12.02.14.02.36
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 14:02:37 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so2454321f8f.3
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 14:02:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVJ26rbesvBv261goSj1liQSio+mBgbo5/sbbBm5o4K7u1y4xnTo8RGcOxQRt8wW6RJacoUTFsH3WB68YOw3I=@vger.kernel.org
X-Received: by 2002:a05:6000:1448:b0:42b:3090:2683 with SMTP id
 ffacd0b85a97d-42cc1d23070mr45380932f8f.53.1764712956453; Tue, 02 Dec 2025
 14:02:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAD++jLkuRQKoiEN928GtAj7wUts5PxH905bLp6ZhKsJ3NnenEA@mail.gmail.com> <CAL_Jsq+uVyGzi+TniwJQEOFDm=L9=S-aLWfvyDmY-GQD5iAEOA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+uVyGzi+TniwJQEOFDm=L9=S-aLWfvyDmY-GQD5iAEOA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Dec 2025 14:02:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vn1z0chJZ=q3NZ3mKYu5v=YnuCBWUyStHMtD8NmY+C5A@mail.gmail.com>
X-Gm-Features: AWmQ_bktU_7WzMXkSb0jNKYTqaWWW-X2pb9d9w7tIirVWuCJkv8u5Cj9FxSuwAw
Message-ID: <CAD=FV=Vn1z0chJZ=q3NZ3mKYu5v=YnuCBWUyStHMtD8NmY+C5A@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 1, 2025 at 5:07=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> I would be interested in some experiments around making this change
> with existing DTs. Take a board DT and add the overlay boilerplate
> (that may be nothing more than add '/plugin/') and remove the SoC
> include. Does that apply to a compiled SoC DTB and is the result the
> same as before?
>
> Think of it as moving from building C code using a #include of every
> .c file to build a single .o to linking multiple individual .o files.
> No one would argue the former is better.

I suspect it would work some of the time, but it wouldn't be
guaranteed. In the very least, the base SoC "dtb" would fail to
validate because it would be missing a documented top-level
compatible. :-P ...but if we ignore that, I'd imagine these things
could break:

1. If a SoC is relying on a "label" that's provided by the boards, it
could break.

2. If any of the boards "delete" things from the SoC, it could break.

3. Board files could have been relying on the "bindings" #includes in
the base SoC file.

I guess the first two things are much more common between all of the
"dtsi" files included to make up a board than they are between the
main SoC "dtsi" file and the others, and the third one is "easily"
fixed.

OK, so I did a quick experiment and quickly found an example of #2.
Take a look at "sc7180-acer-aspire1.dts" and you'll find:

/delete-node/ &tz_mem;
/delete-node/ &ipa_fw_mem;

Those delete nodes from the SoC tree.

I also found an example of #3. sc7180-trogdor.dtsi refers to
"GCC_MSS_CFG_AHB_CLK", but it doesn't include
"dt-bindings/clock/qcom,gcc-sc7180.h".


All of the above could be fixed, but it stops being a "quick"
experiment. ;-) Essentially, if people weren't trying to follow the
rules of the overlay-to-base boundary it's likely they've crossed
them, as in the above case. :-P

If continuing the above experiment would help convince someone, I
could certainly continue it. I guess I just don't have too much of a
doubt that it could be made to work OK. I think it would be _less_
efficient overall to ship full DTBs generated like that because we'll
have compiled the base device tree with "-@". The only way to become
more efficient would be to actually ship the base DTB + overlays.

-Doug
