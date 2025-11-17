Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934AD2797BE;
	Mon, 17 Nov 2025 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763394268; cv=none; b=QQfdiF5NZgUz+AnhqiMFpp+vTWEM0m02qRIhdD7qK5Zo9CUa1LA2l4B9K5wgzT5rCXpK6Of8iTuIbQVJp525snAYIE+q86xK6QXA1WzU9xRhW+MOT5tKYhfF2+VfeBjEwWfX9NlOWjq5K7Z4eUk0/uZDfxPdmTRGQxpNPgN2WHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763394268; c=relaxed/simple;
	bh=Ifwy/HEkyZKeh+8kp/OBurYtM7Ps8RvZmWokn/s2Cmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DwpQdcI7/gkLzDfMATVTESC92vklPa9n8PyGLG5NBQsC5vqZk6o+nVX4FgMK+JwLuMBitdJ55zm/Sb2fS/PPgVeNaoeJrckPbhvTqOHXI9IKxC963hMjH8pSnk1OVJ/nm/YdTK8+wSzm6RMQG1E5eSQ258FuQQNrCBL4RgnfOno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rwtJ9Iq+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwtJ9Iq+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9214C4CEF1;
	Mon, 17 Nov 2025 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763394268;
	bh=Ifwy/HEkyZKeh+8kp/OBurYtM7Ps8RvZmWokn/s2Cmw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rwtJ9Iq+0ZsH6fRwPxdPXqJda76Q4mcQuQrc0Bmv8Oc+b8bIiUNv1Y4kyTiPUWImq
	 M8FukR3DMfsB+4N5s6au5+//bgR8OU8OEb9prQjnZRQftpTDpxbFFVMcgEHw+ZV7/E
	 u5dine4Qd96C/rzCytjH+c7rkY37kJwdNSC0ytA/dn5aNR6nj92T8cN5szsfQZp0tA
	 EmOxOvMJ13ySc60IfuL/uiqIdvIwNu1Zo7dpcNEPcZyoY9Ad65qKfUWXZSFRy39PF0
	 YNqo+ZLLKiI5rPNR8qUntwehDja22gtjw/ikamLeHJHST+M6XS/L1+A+iSHDxuqve3
	 n8//Qi9+63L4Q==
Message-ID: <9e14fb8e-af84-4072-b0ac-9ead882782be@kernel.org>
Date: Mon, 17 Nov 2025 16:44:23 +0100
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SoC-specific device tree aliases?
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Rob Herring <robh@kernel.org>, devicetree-spec@vger.kernel.org,
 quentin.schulz@cherry.de, Marc Kleine-Budde <mkl@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aRs-DaayhtQTtFXj@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2025 16:23, Sascha Hauer wrote:
>>
>> You read from registers booted device MMC 1 (out of MMC 0-2), so instead
>> of relying on register value that "1" always means MMC1, not MMC0 for
>> example or whatever else changed in hardware, you can just sort the
>> nodes by unit address and choose the second device.
> 
> The instance numbers do not always match the unit address sorting.
> 
> For example K3 SoCs have:
> 
> dts/src/arm64/ti/k3-am62-main.dtsi:548: sdhci0: mmc@fa10000 {
> dts/src/arm64/ti/k3-am62-main.dtsi:566: sdhci1: mmc@fa00000 {
> dts/src/arm64/ti/k3-am62-main.dtsi:589: sdhci2: mmc@fa20000 {

That's label which is not yet proof that boot source registers have the
same... I can git grep as well, but wanted actual confirmation, because
people put to DTS many wonderful mistakes.


> 
> Rockchip:
> 
> dts/src/arm64/rockchip/rk356x-base.dtsi:619:    sdmmc2: mmc@fe000000 {
> dts/src/arm64/rockchip/rk356x-base.dtsi:994:    sdmmc0: mmc@fe2b0000 {
> dts/src/arm64/rockchip/rk356x-base.dtsi:1008:   sdmmc1: mmc@fe2c0000 {
> 
> There are some examples for i.MX as well. To my own surprise not with
> the mmc nodes, but some SPI instances are not sorted by unit address.
> 
>>
>>
>>>
>>> Also I don't get whether you are suggesting
>>>
>>> A is as fragile as B, so you could equally well do B
>>
>> Both are fragile, so I would be happy to see arguments why A is better
>> than B. Why? Because with B you don't need any binding because all the
>> information is already in DTS.
> 
> What do you consider fragile with it?

Only that you rely on a specific register values and their meaning.

Anyway, I would just go with standard aliases, but add a schema for each
of such cases (SoCs or vendors), so you will define this as an ABI.

One of the reasons why Barebox was affected by all node renames and
alias reshuffling was that it was never documented that anyone treats
this as an ABI.

So you want it to be an ABI for barebox, sure, just make it a binding.

Best regards,
Krzysztof
