Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A47C30F55E;
	Mon, 17 Nov 2025 07:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763365133; cv=none; b=SiXqpxENqOSMBxUL6XEScLIl0L6dNUdVK0nE3RY61LSBhhN66IcogMPQhULgQ4sFxmasw5LDGGPwcTlRpb8G6l/rUBSvO8tOyKoUL2FYcrdI1QEqhJEkqia9dnZix/MkK1/Cx0u+PcAfeDoA8uhoVy7ps9iauTHjRK7mEmRRxzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763365133; c=relaxed/simple;
	bh=JH4JaDRYvV5msbcyMy/ghQDyrY39sdXyPDGMLdLPPwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=toOgbjDWPmTLprL3HayaTjV1JgviMT6qJpS7DvfHMsEhboYjz8QB2GpFk9ep5WG5fquTqehnU4sX4RgS6w9g5LNSYGSye/ArPJzfsEvdk8UPmbqCFsYdijzg8VVg6e42GUFHY6BSBAXpJYjeVMBZqFBWEhS9oTz9RKsWW6PxMqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uu5O2GEZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uu5O2GEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE45C19424;
	Mon, 17 Nov 2025 07:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763365132;
	bh=JH4JaDRYvV5msbcyMy/ghQDyrY39sdXyPDGMLdLPPwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uu5O2GEZW8AllFKpmVgxbvfBjzqFNfeC9yR+iT3ee96jITUefaCHDBuQf255aLm6C
	 zl6R46zOTfsEW7yALjVWhZreFEkNuqrDqSzy/rHjG3iDBjcafrdxgoU/sVTxf2VQt+
	 19EfHvka0ves2jaCtdVaffI8Qb7x9OJX8w+OdFbRenbyD2mY0T8K2rF8AiaC6nz50p
	 4l4hSEVqZ9iPcpHnCpNo5iTuUTNMF8GNH8V3bmvtY6sRnUUK8HgluKBj0yG/K3j5VR
	 bnT1JGLc1BvCULuTmx4CZUz7HLazhMB1XzxLO174lSNN21EXvi4QJZrs3aVNKYzkWm
	 sU3J7eAyMhKDQ==
Message-ID: <58816b68-3b09-4320-9a4e-09f2c2b2d0fa@kernel.org>
Date: Mon, 17 Nov 2025 08:38:48 +0100
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SoC-specific device tree aliases?
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree-spec@vger.kernel.org
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, quentin.schulz@cherry.de
References: <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2025 09:28, Ahmad Fatoum wrote:
> Hello,
> 
> With /chosen/bootsource now part of dt-schema, I would like to raise a
> related point: The need for SoC-specific device tree aliases.
> 
> For many SoCs, there is a canonical numbering for peripherals; it's used
> in the datasheet and BootROMs often makes use of it at runtime to report
> the bootsource as a pair:
> 
>   - One value to enumerate type of boot medium (e.g. mmc, spi-nor..)
>   - Another value that describes which instance (e.g. SDHC1, SPI3, ...)
> 
> Some examples, where this is the case, are AT91, STM32MP or i.MX.
> 
> barebox has traditionally used /aliases to translate BootROM information
> to a device tree node to fixup /chosen/bootsource.
> 
> This doesn't work out for many newer SoC support, because of different
> expectations: For upstream, aliases are relevant to a board, while
> barebox traditionally expected them to be SoC-specific (because they
> used to be on i.MX, probably).

Please state exactly the problem - you have aliases in DTS but
bootsource in DTSI? Then that's clearly mixup - you need to define them
in the same place. Aliases are in DTS (I see here other thread on that),
so stdout-path is also in DTS.

Or you don't have bootsource in DTSI at all because barebox invents it
regardless of actual aliases? Then shouldn't this be an obvious issue?
You cannot have barebox as second source of aliases.

> 
> To accommodate this, barebox nowadays extends upstream device trees with
> /chosen/barebox,bootsource-${alias} properties, which can be used as
> translation table instead of aliases.
> 
> This solves the issue, but there is occasional breakage when upstream
> decides to remove aliases from the SoC DTSI and move them into the
> boards until barebox is made to add the /chosen/barebox, overrides.
> 
> As described above, I think the data sheet numbering is pretty much an
> aspect of the hardware and it has a place in the upstream SoC DTSI.
> 
> 
> So what are the thoughts on adding /soc/aliases or some other top-level
> node to hold this information?
> Or would a h"ardware-label" property or similar be more tenable?

So you want to map full node path to some alias, so later you can map
that alias back to full node path, right? This sounds like quite
redundant information in DTS just to avoid impact of node reshuffling
(like unit address changes). In DTS-source-code realm, we solved it with
phandles. Maybe this would help here?

Best regards,
Krzysztof
