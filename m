Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D1B313523
	for <devicetree-spec@vger.kernel.org>; Thu, 18 Dec 2025 22:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766098579; cv=none; b=CS1YmGivtI064bhwLqpPwpqIoDkCZASOeZlx054DfjN/1cTfBIwr80oI3IJF5swE2yp3SDa8JWvP2iWh8jKjsfF05HeTWXBtHa21T/Imdw5PVxgqPiH74uN1IjbsSszpRqh7hWZNkBlIQhrtVb4NkgHKfXT4Ks7PqqwgRd4P+1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766098579; c=relaxed/simple;
	bh=ytefce9GoabytodYzfx2Y2KHZCazU28BdXPoQRkGF0Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tMcMQchjksfhkwLIPd+lXIeRqp8/1VB9/d0HOh4PwOL70tfLPqR0JzktxNUQig5L2dVirlmbtVy2Wt1t3iIoaghGwPtOUVxM/qVt+Qcm2pqY03tZUVRo9j6ZzlT8sVY+n6lYkA1bB1epoNN5NcgSjSI5nej1HA76QdeWs31B63E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YGPk2gTd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YGPk2gTd"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2e628f8aso465045f8f.1
        for <devicetree-spec@vger.kernel.org>; Thu, 18 Dec 2025 14:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766098575; x=1766703375; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ytefce9GoabytodYzfx2Y2KHZCazU28BdXPoQRkGF0Y=;
        b=YGPk2gTdkZsQk2LeOIP3qFwRqtAgDgenvscnDSsGIxgGvV9wS8urXjRJrqEMo4MHrB
         CTtRvM9u12ZYHeJVr81Vtn5WZY3EbwbH71FF/4uG9GlSLVOI6tBCPuhD4eXqzBezWS26
         SC0WDwlpJtklrnddQ6lqxLE2WMVihDa5p34hOxd6Ml+Gc+WFaX4nUUKNig12vMpchseJ
         e3A0dCPEuATfSZUXfnZkgyXQxrJvJqB3QWdTutUsqVRfc1wxn/9jil9OEDVS+Ctxe79n
         0Svy8LO9+7N9xsgRpjDCM0kXgNS9iCwqhVkFwZcMd6IE7I0O448tkVXpY1IJGzYJduJg
         L7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766098575; x=1766703375;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytefce9GoabytodYzfx2Y2KHZCazU28BdXPoQRkGF0Y=;
        b=BOWZ1KIN34ulC+4mP3k2hdG4POK1qTSHes1a/KOf6Dcx8WmjVA4Vqt2/mKOXQ/pPWP
         IeVRWFVjsoGVmKvgcz40BlmDFXhSCRO712m1aMJAu4OGrhFM6oaR/eCFr4Mv51aF/rbI
         Nu6oHMg6R5BhN/RQ7KctBmXRRoutl+YZr9H3tUPKD41I0oHkISCs1Lqxbucr0mgtjtAl
         6wa0ez6xPxXiEOZa6ufBMDUrjaKV65Czax8fdEEQ0EWQAI3o9ICo6J5Si0L3FxsXr3dD
         ZYd1WHG+Qw/hQazykifaJX6zPENLUdkWaoRBm4fZIiGyUU0wkDezMtyr/MBC1S3v+Y2K
         x5Bw==
X-Gm-Message-State: AOJu0YyqXGJN3H5xR283qykfC65obtcc7NY04/20ljfHbph6xlC9HOXR
	qBRv1Ae3vKz9RMFRBppcwKY3+48+ikuQBW/I/vd/kI1vhnDkNCoOw18TK6t1ptDmsoEVr6VUD58
	CQqoulV4zIAYcjqerbfj/vP1skYo/O1wn+1w6dh4h0+fnuVwDFr/Yt6VJ2Ro=
X-Gm-Gg: AY/fxX6Bfl1P1CsFxD8tRTrB21wdHmLHNlvW3Z01JQz235407cQns/FEnBYEW/FOZRa
	W4gQi3Z/vZPfgw1Bc1rXypN1DA/jcsRVihlUF3fthpQdRXxPtPU8GEcciPeoCKOOpjXSNTtLcO0
	8fuepmwmB7pIdy1WPmebbzj+l7hw9CZZ9/LMCreCJyhtlyA3YexOjreCL17dAiFIivTqajxJand
	1Yzu+pMm8ID5gwRwXjAZiFKZgIBDJGM0/eWTzSU/xahT0k2RCIPfpAcFQNJAlebtGHX1CTgG357
	Dr7ia6m/u3tEGddTfIGz03T2gQ==
X-Google-Smtp-Source: AGHT+IHyAglAUV7SanEVQr9reVdR9Xpy0j/wGwvdQqLYH7/hlHdm3sZfq7rYW7MYuyFNmavyzcXiN9znw1kvfWJlf7I=
X-Received: by 2002:a5d:5f87:0:b0:431:35a:4a97 with SMTP id
 ffacd0b85a97d-4324e70b294mr862685f8f.59.1766098575073; Thu, 18 Dec 2025
 14:56:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Doug Anderson <dianders@google.com>
Date: Thu, 18 Dec 2025 14:56:03 -0800
X-Gm-Features: AQt7F2qybuXbfLLar7UKfoOwfXGPNdCNJ6JMqPj6-D2vmiGqYTNo3Bkg9Tksous
Message-ID: <CAD=FV=W+jE_L_LLgAhD8K_4+CtivSD9-9t7Xe63XuKrKjfyfeQ@mail.gmail.com>
Subject: Proposal: document where SoC info belongs
To: devicetree-spec@vger.kernel.org
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Bjorn Andersson <andersson@kernel.org>, 
	Simon Glass <sjg@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

To try to move things along, I'm picking a small piece out of my
previous discussion [1] to see if we can make some progress.

Right now, the top-level "compatible" string in a dts file usually
contains one or more strings to represent the SoC. Examples chosen
semi-randomly:

exynos5250-snow.dts:
- compatible: "google,snow-rev4", "google,snow", "samsung,exynos5250",
"samsung,exynos5"
- SoC: "samsung,exynos5250", "samsung,exynos5"

sun20i-d1-clockworkpi-v3.14.dts:
- compatible: "clockwork,r-01-clockworkpi-v3.14", "allwinner,sun20i-d1"
- SoC: "allwinner,sun20i-d1"

sdm845-db845c.dts:
- compatible: "thundercomm,db845c", "qcom,sdm845"
- SoC: "qcom,sdm845"

I propose that we DEPRECATE including SoC information in the top-level
compatible string and move it elsewhere. I propose these top-level
properties that should be used instead:

soc-family-compatible = "vendor,family";
soc-product-id = <0x1234>;
soc-product-variant = <0x1234>;
soc-product-description = "Something";
soc-major-rev = <0x1234>;
soc-minor-rev = <0x1234>;
soc-sub-rev = <0x1234>;

The family-compatible would be VERY high-level and is not intended to
be a marketing name. It would be something like "samsung,exynos",
"nvidia,tegra" or "google,google-silicon". The ONLY goal for this
string is that within a family, the other properties uniquely identify
a given SoC. This is a SINGLE string, NOT a list of strings. There is
no concept of being part of multiple families.

All the other numbers are hopefully self-explanatory. These values
could be absent (assumed 0) if they don't make sense for a given SoC.

The soc-product-description is designed to be some nice name that
represents the family, product-id, and product-variant but _not_ the
rev (since that's easy for anyone who cares to represent it as "rev
X.Y.Z")


The goals here are:
* Stop trying to jam so much into the top-level "compatible".
* Make it one step easier for bootloaders (or code packaging device
trees for bootloaders) to differentiate device trees / overlays. This
isn't _enough_ since this proposal doesn't include board info, but
it's a place to start.
* Make it easier to deal with "socketed" boards where the SoC can be replaced.

NOTE: if a set of devicetrees is provided to a bootloader, it could
not just look at these properties to help it pick a devicetree but it
could also change the properties to be more detailed (it could fill in
some of the minor/sub-revs, for instance).


I think this is a positive change for everyone and a cleaner way to
represent things even if you aren't dealing with the above problems.

What I'm looking for from people is some responses. Folks could choose:

A) Yes, this is great. We already have something like this and we'd
switch to your properties if it became a standard.

B) I like the idea, but I need an extra property to represent my SoC
and then I'd use it.

C) I like the idea and I'd use it, but with some changes.

D) We don't have anything like this today, but it sounds useful.

E) Why are you wasting my time? This isn't a useful problem. The SoC
belongs in the top-level compatible string, period.

F) Other (please specify)


FWIW, from chatting with Rob Herring offline, my understanding is:
* He doesn't think that using the "soc@0" is the right place for these
properties.
* He didn't seem enthusiastic about adding a new node and was more
amenable to adding properties, which is why I added a pile of
top-level properties.


[1] https://lore.kernel.org/r/CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com
