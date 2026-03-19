Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0D23D47BB
	for <devicetree-spec@vger.kernel.org>; Thu, 19 Mar 2026 18:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773944163; cv=none; b=DUL+RzGkP8H9Y8AA7FfD5EPHMsNJTnZQ8XW0cF9pgm1oCfm5Y9zUvLRUQ2Hxwathq++AwP9pVQMFUow1ccom/0IeQWSubM1/awP2dMZf4A92aZlUthrfDnFTFJJlL9XSlZ2azGvm9TWB3dCXe1K1Z8Ex1+P1DcvTWaBgxhFist4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773944163; c=relaxed/simple;
	bh=+MHqLjOcVYhQqnSfE+0Fp3m0yXDA/5y9ui7z5ud6z5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BabKLHCUo8qQvZIrXFmjCnXykjzcr3JL+MmbEu08baPVYFlDcsY0qsgxv+Uh63BNBNEEEL4xDfK7iZiZpv7MpvM3bIWsrUITOWd+KRrFvH9tnIh6qFR8aXnAUq2dn2c/cepWIwdT4d2h0gWm6xj3OXZzN4dVj6UrrF2Yz8s08jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jl5q6zu9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jl5q6zu9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932E9C19424
	for <devicetree-spec@vger.kernel.org>; Thu, 19 Mar 2026 18:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773944162;
	bh=+MHqLjOcVYhQqnSfE+0Fp3m0yXDA/5y9ui7z5ud6z5Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jl5q6zu9KYG/9F4EHNJM/IGgQ3LriGtRP/mPvzOvsGtYdAus8WneiL3Wx1q451dYv
	 BrG29ZGHShwKj4CGdLy7qKwN12zXjoK+5jH3jkSEDz7x6aMZ/F+yo7ce0SvaebsB9X
	 OlpbdukidRq6K3mwQXoEKSGq6QgGllXLVOAnQ8qrbpSDypSTJI6ROsRc7gYGK7dASk
	 fy2rHORQV1oMNj8RPqLNs3hhmrKOPM4jhoirkfw6SvJh5x0UFTuI5RAAndawsZtxmc
	 +IcAUIii4kHaJE9Iz+WN0seFV/9adDK4nMcj4yAbnlpBNR/034nix/7iONZLsWjU4/
	 BflbO4EBiCn1w==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66847de014aso1918592a12.2
        for <devicetree-spec@vger.kernel.org>; Thu, 19 Mar 2026 11:16:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YzBG4W6UzRVRrDnwTOwGIjG+YiSRsBlM3qOmWYuVPPBDDcNs/LI
	7fwyuU7KQoaxgf5hkOnnhGfeQnKrvMld3UtgdYUJe88ITi7Fzc2YxWvYMtgYFzc0RovMCUPji6L
	8AMtt+fRAEXzo+bnGyUO9Fm4zRCbAzA==
X-Received: by 2002:a05:6402:e9d:b0:662:ac7e:aac9 with SMTP id
 4fb4d7f45d1cf-668c9724b05mr358755a12.20.1773944161064; Thu, 19 Mar 2026
 11:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <88456d17c91737cfc09af46673b49bb9a9d36dc0.camel@gmail.com>
In-Reply-To: <88456d17c91737cfc09af46673b49bb9a9d36dc0.camel@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 19 Mar 2026 13:15:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKRW-=er+DCTob0HmQv9OyVt7yiej-Yht6UR-mcW=LHUg@mail.gmail.com>
X-Gm-Features: AaiRm53vSG4c09LEHiS6dxa6gpIeJLFCueUVRNSidjgOGVQ8XTb03fljpHSynso
Message-ID: <CAL_JsqKRW-=er+DCTob0HmQv9OyVt7yiej-Yht6UR-mcW=LHUg@mail.gmail.com>
Subject: Re: reserved-memory: node naming - generic name vs binding recommendation
To: Vitor Soares <ivitro@gmail.com>
Cc: devicetree-spec@vger.kernel.org, conor+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 10:27=E2=80=AFAM Vitor Soares <ivitro@gmail.com> wr=
ote:
>
> Hi,
>
> I have a question about node naming conventions for static reserved-memor=
y
> allocations.
>
> The reserved-memory.yaml binding recommends that node names reflect the p=
urpose
> of the node (e.g. "framebuffer" or "dma-pool"). The base Devicetree
> Specification (section 2.2.1) on the other hand recommends using generic =
names
> from its suggested list, which includes "memory", implying a "memory@<add=
r>"
> form.
>
> For nodes with a static allocation, is the binding's guidance to use purp=
ose-
> reflecting names the recommendation, taking precedence over the base spec=
's
> generic "memory@" convention?

"memory" is for memory nodes (i.e. ones with 'device_type =3D
"memory"'), so not really for reserved-memory nodes.

Yes, we would prefer some generic name, but there isn't one defined.
Until one is defined, I have little opinion about what name is used
(beyond global conventions like don't use '_'). Names reflecting the
purpose for /reserved-memory is so widely used already, I don't really
think it is something we can go back and fix.

Rob
