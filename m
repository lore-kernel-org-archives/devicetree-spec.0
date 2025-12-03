Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AC42EFD99;
	Wed,  3 Dec 2025 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764760115; cv=none; b=DxnxRBhM5s9JvNtLARZ//vkMwIUQGWLU+xgDB0OdiMRRjEqCfwQRcwa5l4hfHentiYYr69bNZ+l4SMt5XrzC9UZP9InPfuTxJHis0t0oiP87aUf0Z7Hy74VfUQJYGjefszrvw+jEk84DyaYinsix3l5HhGr9C2Ks3sVbsxTD/tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764760115; c=relaxed/simple;
	bh=t3W10qsRJTd3xYWo8h8fePXxAi5MXuaO7mW7w3R5grs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDh7C55do5ivcBA9nFyZ6Ge1OpgYJD6Bv4uGVdbP2Tk9/rXh38gX1bqIdhf6NXiP0XjcDctBLUira+KxtguLEWW9IMx5KbuF4/wC9pU3wtqNc2zAIoOY/arLCb4svxAow/oHg2/bPB5mTcC9X3n0Wld+Kfk58Pn5Yyh2QIRUR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhQCS2ob; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhQCS2ob"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B5AC113D0;
	Wed,  3 Dec 2025 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764760114;
	bh=t3W10qsRJTd3xYWo8h8fePXxAi5MXuaO7mW7w3R5grs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XhQCS2obvmNKPGBY06kIZu5LLFLMx+5blL04pytjUsPg0V/oow+iVojGuqozLsImC
	 azxrSjfXhkCpfCa2QIdb1gr+UAmlHcJCOXmmkOrEv8tluW86E3RbGFNV/xQmcUQ2iZ
	 uXiUaeOFDnR4BzFiUv3CJLk890f+kjBmqxL1zsg9OM86KXG2Uz6lyqdkw+F0mLJVhV
	 x0ez1mmTpfNHJ0dNXXE9aKB+D3+U21xsUp1HYghLGBtNBYuDCtgIu6emuNfLfQHbDn
	 cGY6DjtaZzLJLvypVwUUwEOI0bo9V8rJGUsc96uWtUNL9TE3yTWlxYM0gaSkUsnzbk
	 u30BN+0+hvFtg==
Message-ID: <dd589476-56df-4565-b4cb-e34f0d7d5559@kernel.org>
Date: Wed, 3 Dec 2025 12:08:30 +0100
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SoC-specific device tree aliases?
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree-spec@vger.kernel.org,
 quentin.schulz@cherry.de, Marc Kleine-Budde <mkl@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>
References: <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de>
 <58816b68-3b09-4320-9a4e-09f2c2b2d0fa@kernel.org>
 <aRrcRZvdrbAmsCm_@pengutronix.de>
 <8ce701c9-6c8d-4b3e-8706-760b8aba89fc@kernel.org>
 <aRr6JLMplFVeHcjj@pengutronix.de>
 <e5502ec8-0c55-47ce-a9e5-62e137c9808b@kernel.org>
 <20251117-smooth-spiked-loon-52df28-mkl@pengutronix.de>
 <de1739a8-4677-4cc8-b501-2568b7513467@kernel.org>
 <aRs2y3w854vnHAzg@pengutronix.de>
 <576a9eae-7dba-47d0-ad66-0a81d1893271@kernel.org>
 <aRs-DaayhtQTtFXj@pengutronix.de>
 <9e14fb8e-af84-4072-b0ac-9ead882782be@kernel.org>
 <CAL_Jsq+=v96eP6V+5Ehi9EQT3iKKU7=t7kvJ-WSA+1WCHDuHEA@mail.gmail.com>
 <07ee3540-d0c1-436e-9e1d-db1952f609a6@kernel.org>
 <bcb359cf-0e8a-46ec-9f69-51c4c9e8874e@pengutronix.de>
 <6638e499-2320-41c9-b720-faf4f976e476@kernel.org>
 <34bd1a0d8e579aba0a6a88039006500fe822ef3d.camel@ew.tq-group.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <34bd1a0d8e579aba0a6a88039006500fe822ef3d.camel@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2025 11:36, Matthias Schiffer wrote:
> On Wed, 2025-12-03 at 11:25 +0100, Krzysztof Kozlowski wrote:
>> On 03/12/2025 11:16, Ahmad Fatoum wrote:
>>> Hello Krzysztof,
>>>
>>> On 11/17/25 5:29 PM, Krzysztof Kozlowski wrote:
>>>> On 17/11/2025 17:06, Rob Herring wrote:
>>>>>> So you want it to be an ABI for barebox, sure, just make it a binding.
>>>>>
>>>>> What do you have in mind? Other than standard names for the aliases,
>>>>> what can we check here? That a specific alias points to a specific
>>>>> path? That would be a bit too much IMO. That would be equivalent to
>>>>> specifying possible values in 'reg' for all devices.
>>>>
>>>> Binding with pattern or list of needed alias names, referenced by given
>>>> soc-platform top-level schema.
>>>>
>>>> One of the points is to make it explicit and obvious (e.g. to Arnd or to
>>>> me if I forget, because I follow the same logic of aliases per board)
>>>> that these aliases are used outside of kernel.
>>>>
>>>> Just because ufs/mmc/spi can be used that way, does not mean we should
>>>> accept any possible alias into soc.dtsi.
>>>
>>> I can't see how this could work. A number of boards renumber MMC devices
>>> in a different manner than the SoC reference manual:
>>>
>>> - Changing the alias numbering is an ABI break, because Linux derives
>>> its /dev/mmcblkX numbering from it
>>
>> First, why the alias would change? Isn't the board following the SoC
>> numbering in 99.9% cases?
> 
> At least for our TQ-Systems boards, we have a convention based on usage (mmc0:
> eMMC, mmc1: SD card; serial0 is often the console) rather than following the SoC
> numbering; that is, we're using the aliases as a form of hardware abstraction
> rather than hardware description.

Huh, does it even match numbering on the schematics / board / user-guides?

I would prefer not to create bindings purely because some existing DTS
code is not matching our expectations. However there could be a case
where board numbering is different than soc number and we want to keep
aliases configured for board.

Basically what you propose here is the discouraged instance ID disguised
under one more 'alias' which is not really alias. It's just an instance
ID. There is no other use of soc-aliases beside instance ID.

I see the problem you want to solve, I agree it is worth solving and I
agree that DT is the place for this mapping between register value and
device node. However solution of discouraged instance ID is just...
well, discouraged, so not optimal. I don't have particular advice expect
a dedicated property for each device in such case.

Best regards,
Krzysztof
