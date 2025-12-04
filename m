Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A13346E78
	for <devicetree-spec@vger.kernel.org>; Thu,  4 Dec 2025 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764874271; cv=none; b=CguMS3FOGude1Q6j52dJRUChhelnN37dI6F9eXJgwzVng07uzvjQCqHlOmlSVnfN8BI83bxSzL4B4F0VAoLm9pK92+/cl8fQtE6BBd1kZacTVzonjnYKAgdaY3jxZ83A1lARlGcHHS/oyWbFTWOgCbkUN17MLmKSycfyEYVM2EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764874271; c=relaxed/simple;
	bh=kDK9ciQB4/2Y+PeaNUIZ/XhpMtXFYN+DB/bleSHTeWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ClTDJ8yEDI7DO3WQVdBOqLn4B11vWDNx74lrYenOQ1gLLMBLcp1pIqr+o3xkNSedsgfWJyJ7gzYxsdTubTFIRHDNxyy5QY+Nz6GudIcVM/KlQeyii+OF5OKf2YgjRIDIf3qKDlR8jCdfmMv7sT9ly+/8hHCP0rPd1qtDrltOOVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Xe2AJr1z; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Xe2AJr1z"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c704bdd57aso750818a34.3
        for <devicetree-spec@vger.kernel.org>; Thu, 04 Dec 2025 10:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764874269; x=1765479069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HuCxBLeeJ7Zz/twqp1A0Ys0p37qHP4PCEZ34hI84mRs=;
        b=Xe2AJr1zCMwPmXG5T1Mi/jSrQLYAwKaxP1xLnsyD2qzQg0BcfA8e9FXHylXAVRFBRG
         hj1htuq5JKeqqTHonZPGQobePHumY0iu8wVaEzi0oGyT9AiwJ1uttSQDdfvwd9nynnbM
         yXWbi164okrXgs1Jl7aWUyfNAcGu2JITD9TYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764874269; x=1765479069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuCxBLeeJ7Zz/twqp1A0Ys0p37qHP4PCEZ34hI84mRs=;
        b=qFy7o+HRslRDbG3VSv855DSWIRo1Teuy50rUOB4dtufsMIibn67y9pGJcu+K6QySyD
         2F5y1vF4U2paXUr1nIhrRQxyJlhFVdbHGGGa+rRTONsdgZX8CwP7956TlFNOCuDVGTgI
         irHm8zMZ8PhfGWAjpJQ+kyaO3nqaeGkGX7qtFzQBoD9yJSelzKAYxDOdbAg7ZIhCmyhy
         ybQwkHdFXNQ6t+74VfumnmKIyTTS6ySr9ImXEQWPwOgSUoGexKTau1StEl/hfMfjiSJr
         N8Pxpic/k7bN/ESX3/t8ru5SIHNcD9mIzo38Ipw3s5gatIn2skGYMW2w/FGauKsBfeWx
         IVIw==
X-Forwarded-Encrypted: i=1; AJvYcCXvWkDAURaKJ66Jic2kHIYyylBJmvZUGK0HSJ1hOUSr0snznsXWlqiacoZH6kRZ3q5/960zuXW0Ru1l5fyaaI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYQyRZjGmh+uLO+AAv4w4RSnaxQ5Wke4hLcPtD85ZO8HsWb1Rr
	7Ht1yvG5TL+wbzOlu7FLCkROlIc4Gyzo1f25iMmJEQlNzj8yt7We13I6YvXyjEh3hBA=
X-Gm-Gg: ASbGncsm4slm1C9ejpj2BQtAZVKa9iyokqqiQm26xUyJPfEIInj58zAdl1HTmpf8r1w
	ixHT5gcgfWys7/BKUfGv+WmL5o7VNE4JRGJ0EPRfnnIHxp1CBXk/v4s0VC8vZsoRCREpGlUfCcp
	zkQImn1As/AtwAAEH8hZgSYMcMObot6Qr8BpoqymJvYHrrRe3/NIXVc0hySO2E7Gt04VFmsvygt
	niO7p2gBbKtXJNYSyjERhzRATCwPtNRI+leS7XLPx19RkkJ6Hrk5m0XWnLHI2BN4xDLSrN2xpY4
	l27epufNIY4UeM/25V8P0P73erju4YAPFDEITuvMdJTPMjU7kJ2Ny3cMmKC9a8uORZHd+D8GfaK
	K72JA+L887MDCpG4HxYuwi7pIhrvr8Va5pxvcDJMWhLk6pzHLFSMNuKFUqG3bKhQXfimfq+saYS
	0PTzkNckKXRNOHMHqNAOG83b9HOoq8D2Bku7hfoc3FxVkdkzddYg==
X-Google-Smtp-Source: AGHT+IE+39z1Gqea5Hb0YCxcSsRFBXG+n3QidgZ6Z+ZmTTVak7sTfZsiBAPNyraUMJrs7/4CUYILlQ==
X-Received: by 2002:a05:6830:6ee9:b0:799:bdea:34ba with SMTP id 46e09a7af769-7c958aedc48mr1955012a34.9.1764874269070;
        Thu, 04 Dec 2025 10:51:09 -0800 (PST)
Received: from bill-the-cat (fixed-189-203-103-235.totalplay.net. [189.203.103.235])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95acb3cf1sm1910214a34.20.2025.12.04.10.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:51:08 -0800 (PST)
Date: Thu, 4 Dec 2025 12:51:06 -0600
From: Tom Rini <trini@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree-spec@vger.kernel.org,
	quentin.schulz@cherry.de, Marc Kleine-Budde <mkl@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: SoC-specific device tree aliases?
Message-ID: <20251204185106.GC303283@bill-the-cat>
References: <20251117-smooth-spiked-loon-52df28-mkl@pengutronix.de>
 <de1739a8-4677-4cc8-b501-2568b7513467@kernel.org>
 <aRs2y3w854vnHAzg@pengutronix.de>
 <576a9eae-7dba-47d0-ad66-0a81d1893271@kernel.org>
 <aRs-DaayhtQTtFXj@pengutronix.de>
 <9e14fb8e-af84-4072-b0ac-9ead882782be@kernel.org>
 <CAL_Jsq+=v96eP6V+5Ehi9EQT3iKKU7=t7kvJ-WSA+1WCHDuHEA@mail.gmail.com>
 <07ee3540-d0c1-436e-9e1d-db1952f609a6@kernel.org>
 <bcb359cf-0e8a-46ec-9f69-51c4c9e8874e@pengutronix.de>
 <6638e499-2320-41c9-b720-faf4f976e476@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6638e499-2320-41c9-b720-faf4f976e476@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett

On Wed, Dec 03, 2025 at 11:25:11AM +0100, Krzysztof Kozlowski wrote:
> On 03/12/2025 11:16, Ahmad Fatoum wrote:
> > Hello Krzysztof,
> > 
> > On 11/17/25 5:29 PM, Krzysztof Kozlowski wrote:
> >> On 17/11/2025 17:06, Rob Herring wrote:
> >>>> So you want it to be an ABI for barebox, sure, just make it a binding.
> >>>
> >>> What do you have in mind? Other than standard names for the aliases,
> >>> what can we check here? That a specific alias points to a specific
> >>> path? That would be a bit too much IMO. That would be equivalent to
> >>> specifying possible values in 'reg' for all devices.
> >>
> >> Binding with pattern or list of needed alias names, referenced by given
> >> soc-platform top-level schema.
> >>
> >> One of the points is to make it explicit and obvious (e.g. to Arnd or to
> >> me if I forget, because I follow the same logic of aliases per board)
> >> that these aliases are used outside of kernel.
> >>
> >> Just because ufs/mmc/spi can be used that way, does not mean we should
> >> accept any possible alias into soc.dtsi.
> > 
> > I can't see how this could work. A number of boards renumber MMC devices
> > in a different manner than the SoC reference manual:
> > 
> > - Changing the alias numbering is an ABI break, because Linux derives
> > its /dev/mmcblkX numbering from it
> 
> First, why the alias would change? Isn't the board following the SoC
> numbering in 99.9% cases?

I swear historically and probably still today at least one major SoC
vendor manuals/etc start numbering from 1 and not 0. And it's not just
iMX where "which one was wired for an SD cage and which is wired for
eMMC" vary from ref (or hobbyist) platform to ref platform. And then, oh
goodness, custom designs. So no, there's no consistency and then "store
UUID/etc in env during install" falls down on other cases starting with
"is there an env to store them to?" and so a common case is "we know
mmcX is ... so read the UUID, pass that to the kernel".

-- 
Tom
