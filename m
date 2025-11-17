Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E2B331200;
	Mon, 17 Nov 2025 13:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763385487; cv=none; b=mYXD9kRiE4Zm+iLjZro9y+Lj2fvI/wlWuX/qw1ATwRbx/TFND9Bkyc0GWZTglZMssbniQWOUbYlvOnjUv+DQTrUUK58vAxKKi3IHtVjzX+XjF12iPYNi7h9sZ21TB4m1fMY5T4kQsd+AF0HoWVPQUv1ILn5WrrrNKHC0L7k+2gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763385487; c=relaxed/simple;
	bh=vb1qMwymCCCEoAjoxmPfDS9rCFcy7IJC5C/augEkxK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0yJhlZP9XipaUiZt2CxL9uuJs1Y61fBrjmLafjV++UgvbwN8YzAlyfGnCDWh0ozeM3//FAmV2AlZkqxp3ToQaENXanykJS8hO7x4T0mvVH2G6zEXCB+JiFaPowg52MIztsQzQIEuDY2q6IJUeZ7WImuI4nHfxNY7fSn1oJ+cZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEA/FYSv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEA/FYSv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E29AC113D0;
	Mon, 17 Nov 2025 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763385486;
	bh=vb1qMwymCCCEoAjoxmPfDS9rCFcy7IJC5C/augEkxK4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UEA/FYSvOx9cUXA63n2jKjNnABBeStIRaJICbyVxa0BaQWpxL4//RN4CW9ott00aE
	 y+RL1LGArHRywQoWZ+SyESFDxO/ngeaFFQtKKA+golz50CFGsRvlgf7hsRfP5WUU5I
	 WDx2sOcqFYBt6T5pJ9vYXtx5Ct7oflWGvegjmC3ZuYaHvDC5qVNBQwuY368bK5kbUf
	 4fIA8Du8kt2UAr1OxaQ0bNvl50My07qUVQ5mwQ0YY12lEkI+XvfBe9C4xTT2nJFAsZ
	 U7OWOJZ+q8OFUNOrrQYIX+U7zZ7DloQTBVMdlhfrGp+PLto/0eVCbvDkhHphCfP1Fb
	 nZHLOw5DcrzFQ==
Message-ID: <de1739a8-4677-4cc8-b501-2568b7513467@kernel.org>
Date: Mon, 17 Nov 2025 14:18:02 +0100
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SoC-specific device tree aliases?
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Rob Herring <robh@kernel.org>, devicetree-spec@vger.kernel.org,
 quentin.schulz@cherry.de, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de>
 <58816b68-3b09-4320-9a4e-09f2c2b2d0fa@kernel.org>
 <aRrcRZvdrbAmsCm_@pengutronix.de>
 <8ce701c9-6c8d-4b3e-8706-760b8aba89fc@kernel.org>
 <aRr6JLMplFVeHcjj@pengutronix.de>
 <e5502ec8-0c55-47ce-a9e5-62e137c9808b@kernel.org>
 <20251117-smooth-spiked-loon-52df28-mkl@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251117-smooth-spiked-loon-52df28-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2025 13:56, Marc Kleine-Budde wrote:
> On 17.11.2025 11:41:12, Krzysztof Kozlowski wrote:
>> On 17/11/2025 11:34, Sascha Hauer wrote:
>>> On Mon, Nov 17, 2025 at 10:52:49AM +0100, Krzysztof Kozlowski wrote:
>>>> On 17/11/2025 09:26, Sascha Hauer wrote:
>>>>> On Mon, Nov 17, 2025 at 08:38:48AM +0100, Krzysztof Kozlowski wrote:
>>>>>> On 13/11/2025 09:28, Ahmad Fatoum wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> With /chosen/bootsource now part of dt-schema, I would like to raise a
>>>>>>> related point: The need for SoC-specific device tree aliases.
>>>>>>>
>>>>>>> For many SoCs, there is a canonical numbering for peripherals; it's used
>>>>>>> in the datasheet and BootROMs often makes use of it at runtime to report
>>>>>>> the bootsource as a pair:
>>>>>>>
>>>>>>>   - One value to enumerate type of boot medium (e.g. mmc, spi-nor..)
>>>>>>>   - Another value that describes which instance (e.g. SDHC1, SPI3, ...)
>>>>>>>
>>>>>>> Some examples, where this is the case, are AT91, STM32MP or i.MX.
>>>>>>>
>>>>>>> barebox has traditionally used /aliases to translate BootROM information
>>>>>>> to a device tree node to fixup /chosen/bootsource.
>>>>>>>
>>>>>>> This doesn't work out for many newer SoC support, because of different
>>>>>>> expectations: For upstream, aliases are relevant to a board, while
>>>>>>> barebox traditionally expected them to be SoC-specific (because they
>>>>>>> used to be on i.MX, probably).
>>>>>>
>>>>>> Please state exactly the problem - you have aliases in DTS but
>>>>>> bootsource in DTSI? Then that's clearly mixup - you need to define them
>>>>>> in the same place. Aliases are in DTS (I see here other thread on that),
>>>>>> so stdout-path is also in DTS.
>>>>>>
>>>>>> Or you don't have bootsource in DTSI at all because barebox invents it
>>>>>> regardless of actual aliases? Then shouldn't this be an obvious issue?
>>>>>> You cannot have barebox as second source of aliases.
>>>>>>
>>>>>>>
>>>>>>> To accommodate this, barebox nowadays extends upstream device trees with
>>>>>>> /chosen/barebox,bootsource-${alias} properties, which can be used as
>>>>>>> translation table instead of aliases.
>>>>>>>
>>>>>>> This solves the issue, but there is occasional breakage when upstream
>>>>>>> decides to remove aliases from the SoC DTSI and move them into the
>>>>>>> boards until barebox is made to add the /chosen/barebox, overrides.
>>>>>>>
>>>>>>> As described above, I think the data sheet numbering is pretty much an
>>>>>>> aspect of the hardware and it has a place in the upstream SoC DTSI.
>>>>>>>
>>>>>>>
>>>>>>> So what are the thoughts on adding /soc/aliases or some other top-level
>>>>>>> node to hold this information?
>>>>>>> Or would a h"ardware-label" property or similar be more tenable?
>>>>>>
>>>>>> So you want to map full node path to some alias, so later you can map
>>>>>> that alias back to full node path, right? This sounds like quite
>>>>>> redundant information in DTS just to avoid impact of node reshuffling
>>>>>> (like unit address changes). In DTS-source-code realm, we solved it with
>>>>>> phandles. Maybe this would help here?
>>>>>
>>>>> We want aliases that map from the hardware numbers of a device as used
>>>>> in the reference manuals to the actual device nodes. One reason why we
>>>>> need it is to get the device node a SoC has booted from. Many SoCs have
>>>>> registers which describe <bootsource> <instance number>. We want to get
>>>>> the device node from that information.
>>>>
>>>> Ah, so you don't map from full node path but from some value in register
>>>> and you want to store these values as alias.
>>>
>>> Not sure if we mean the same when you say "store these values as alias".
>>>
>>> What we want to do is a SoC dtsi providing something like:
>>
>> I meant how your bootloader/barebox generates this information.
> 
> Most SoC have 1 or 2 registers where you can read the source where the
> system has booted from.
> 
> One register contains the information such as eMMC, NAND, USB, serial

I know.

> download, ... the other register contains the information about which
> instance, e.g. 0, 1, 2... The boot loader combines both pieces of
> information and knows the boot source of the system.
> 
> The problem we want to solve is the mapping from the SoC specific
> numbering of the registers to the devices in the DT.

You are both not replying to what I said.

So to recall, I said your bootloader comes with something read from
register values and uses this to match the alias from DT and that's as
fragile as doing simple unit address based arithmetic after sorting.

Best regards,
Krzysztof
