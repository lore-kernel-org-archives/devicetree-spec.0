Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48193204F93
	for <devicetree-spec@vger.kernel.org>; Tue,  2 Dec 2025 22:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764713004; cv=none; b=IE+BerBy79fbuy0+7hqWC8yFg6lBS87cGn6FRMFbo9LOiew5P4sPojAIGZ/OuaBcxbQZccFKcl8kBfWe7A0P8oMb1BvKRCo7VxpalXrjLHkAjutI+3+g4JWDrsrUZPsuIT3PCXbPJ07JNgo9+gjIGrJdmB3lE3xUmA2b/QpLXqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764713004; c=relaxed/simple;
	bh=dBuZYXzF4qvVEPuANWxK/LCht3JKTDuVNWCwv6O8PXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/5dkuyzW9MaK9xDNOgy7hE45nmwoR3oafDM6I/8yAYO7ctld7YrzE/hJ12xvp9Zfr81WDRCACufJxsed44MtF9kyQChGb9S06V/4NhOmpmxGT7DbSJq9w/D9RvG67C4pQJGMqJVYxEsvqxmNJRGFd15Vp9ZOW59aUaH2nG0fC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oZdNJeye; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oZdNJeye"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b72b495aa81so785807766b.2
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 14:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764712999; x=1765317799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE0Tb9n5WshMYKxUeEYg0eYGZtGLhkXKf12cUjTZC80=;
        b=oZdNJeyeWS3sHjNzTN8/+AHfoQHokjXupXegVQk+nP0d/KgYT6v4Zlc0qbw9qEWx6A
         uhaYUQmtHjHSxREegc/ovMYzBW4eSAItpMHI1cjvted4cpe6yPh2qjYNuUM0ByAXh2g/
         prvDl1fWZ9614fGOwFY6VXYn4LM6DBBWoGI4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764712999; x=1765317799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CE0Tb9n5WshMYKxUeEYg0eYGZtGLhkXKf12cUjTZC80=;
        b=nW7dDQ9J/AvZqFEWlPOuf8TRQV8fk/LVd21JyJKSvMKe9q4Dqmpk7vwZ4S4jC3TJEI
         rUqJ7ISP9Od4ri2BgaDlzeOm//freXL5gCVZwKQyRVu+7il1qHDDWzEr7zmGXUfvOzl1
         O3gp0Xrd4Nlo4qyY61KkideZc/EvfDQF2gJoeZdUpOoWbTaxbTwg/EA9fyv4Eyzp52pD
         b3GbzALYhJjcHeH2pP2GzJ2+KuO9T8PnOZNI5px00WcY7WQA7m1xEtR9K3uZ6RBY6LmJ
         q46IVuIKimLmYzLsPJixFinK9SzyrTTc4Sq40Pw1EOTCkq1psIQJXuhHXoj3Q42tik4n
         fweg==
X-Forwarded-Encrypted: i=1; AJvYcCXtYngZ5ExuAs7UCPy6fnrXkgNtp5t7OtaTmiBoLJ9WYLdAaJSZexGY+k4kiwSbEgNU4F+9QLyhcNRR+W8t4u4=@vger.kernel.org
X-Gm-Message-State: AOJu0YziQQXQXQNPPZg3LEc4JI9vMPvlGN9DsprVVciuGTAjZN9f2svx
	cU+dGNBmzKRJekfCgLxsbddUBw+O3D5/U42sUqG2uS6CCm7gIucKqj1kE6Z7FyuHS+lGg6HW5cn
	65a953s18
X-Gm-Gg: ASbGncvJ6qZavldjXtYFbxA8dMA5a+RyknrOmz87SXh9NLapvR0ep2pKzcTnFu53dOo
	a1w6H9LmDUU5T0kFnf+zv9K3YC1up9RT4Usihpr/tpAl73wYJbY679Hrprd9hQra/HjZTQHLbuB
	sws+ytXsX2AbMcqtPY/wjkHx5Y0G8wr1WP723B0h98zRs5ipiJ8BLKjsOa1ZTD9Ss6dnLRawPD3
	E7ZuqSvhkmEsFoycMr2xoxAjIEmtvy4AqLT5yH4wcnCZvGeCC/iyCejsEVCdR23CbIvDx+SaIPb
	R7xtKPN4pXk6zAnmpFLE9OYXLpTRG1LtKTUe8OcVoFvLqOIlWoJI3RLzKYWoCG4mzeavQkjsJ8x
	fkPLvgPHNmuTHHhLng0u+HrWTVRut1784c9vrsAhiTYmo+A4kOq0VbrliiQ8O9iAh+iqS9jWi9n
	uhLn/IJfiywjbZ6tnmyFtWMErObBUaijzDwjwe/tUISvh0g2R/qw==
X-Google-Smtp-Source: AGHT+IEs7M6LA6Pikk072jwjoX9pkKXYE7yUEyRS4Szt5ujNGUJMP+HchnrHOMKWYu5+b7SUWovViw==
X-Received: by 2002:a17:907:3e8d:b0:b6d:7f84:633 with SMTP id a640c23a62f3a-b76c53c0c18mr3631561166b.20.1764712999201;
        Tue, 02 Dec 2025 14:03:19 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59aeb45sm1632652166b.40.2025.12.02.14.03.18
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 14:03:18 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e2e52900aso2093890f8f.3
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 14:03:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULwdBuwH9CfRbmRFd1Kj4QDhPZTjySpIOuaaclNQ2e/e4rmhSIaKkZt5slnNjxKS0bzppzu+Vx2XBB4fG+NGo=@vger.kernel.org
X-Received: by 2002:a05:6000:401f:b0:429:bca4:6b44 with SMTP id
 ffacd0b85a97d-42e0f203446mr32556688f8f.13.1764712997701; Tue, 02 Dec 2025
 14:03:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAD++jLkuRQKoiEN928GtAj7wUts5PxH905bLp6ZhKsJ3NnenEA@mail.gmail.com>
 <CAD=FV=X5=AK4XMANv+fatn3d9Y5vo9AXsHWb_47HmNaMWUtMwA@mail.gmail.com> <CAGXv+5HyMYgKmLc+jmkj-gytm9SNVg9dS7Vn3dQ-dsH8Wo+4sg@mail.gmail.com>
In-Reply-To: <CAGXv+5HyMYgKmLc+jmkj-gytm9SNVg9dS7Vn3dQ-dsH8Wo+4sg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Dec 2025 14:03:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uq9yfUkLUgg116G+2AvEKkEPmdRgUJ5f1bj229j=LxUg@mail.gmail.com>
X-Gm-Features: AWmQ_bkxt4Z1y_xk0xRlx44cYkgtJzKDF-PUNGwdWpfvpJRWrhovgdQ52I-giJI
Message-ID: <CAD=FV=Uq9yfUkLUgg116G+2AvEKkEPmdRgUJ5f1bj229j=LxUg@mail.gmail.com>
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

On Mon, Dec 1, 2025 at 7:31=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> > Separately, it can be noted that we always _wanted_ a similar solution
> > for ChromeOS, but we never quite got there... ;-)
>
> FTR ChromeOS is moving in that direction: splitting SKU differences
> based on components into overlays that get applied to the base by the
> bootloader.
>
> In the simplest example we could have one base dts and two overlays
> for two different DSI panel models:
>
>   - base.dtb
>     - panel-model-a.dtbo
>     - panel-model-b.dtbo
>
> The problem we then run into is that the base.dtb will only have the
> generic model compatible "google,foo", not the sku and revision
> specific ones like "google,foo-sku1-rev2".
>
> And we'd really like to avoid having _more_ overlays just to add the
> final specific compatible string, as that kind of defeats the purpose
> of using overlays to reduce the number of dts files.

I think you may have simplified the above a little too much to the
point where it's confusing. At least I'm a bit confused. I _think_ the
problems you're talking about are the kinds of things we run into when
we take overlays above just two levels. I'm imagining:

- base.dtb
- board1-rev1.dtbo
- board2-rev1.dtbo
- board1-rev2.dtbo
- board2-rev2.dtbo
- panel-a.dtbo
- panel-b.dtbo

So I think you're saying that you'd start with the "base.dtb" and then
extend it with exactly one of the "board" overlays and then exactly
one of the "panel" overlays. Is that right?

So I'd imagine that each of the "board" overlays could have "full"
compatible strings. For instance, I'd imagine "board2-rev2" could
have:

compatible =3D "google,booard2-rev2", "socVendor,soc"


The problem you're struggling with (I think) is that the panel
overlays won't be represented in the compatible string (and "model")
even though (historically) we always did in ChromeOS (they were
included in the "sku" part of the compatible string).

Did I get that right?


> I proposed internally maybe having the bootloader fix up the final
> compatible string, but I think we need some rough consensus upstream
> whether this is acceptable or not.

Maybe we need to come to some agreement about when the top-level
compatible string needs to be changed. In the above, I'd perhaps argue
that the panel isn't a major enough change that it needs to change the
top-level compatible string. That would solve the problem, right? What
do others think? Certainly for "probe-able" components we don't change
the top-level compatible string. Can anyone point to any official
documentation about the top-level compatible string?


-Doug
