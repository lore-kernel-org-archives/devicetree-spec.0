Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867302E8E13
	for <devicetree-spec@vger.kernel.org>; Wed,  3 Dec 2025 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764757015; cv=none; b=dwNFOALxSN14xfNRqZL0AZOFMDMQHq5NUpgOaXYovvP5H2c8Ns+Ype+/RX4a2uyLt7pXxWVH46bDGo9FQHmvbPPOAouJ05Wa3MOTc24b6YOHqOACUgztk73d+QD+Op2ZcEKEaCwZUSwf/0o6jYyFIO8TXpPaSvvuotXbRbAFS2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764757015; c=relaxed/simple;
	bh=nTdmeduMeqbHHtbwT6crN5Jg7zxo1zHTV0LmN6egeO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2J/7iWqyXn7y9J2eCsA04ZVqZw1+HMbdUVGLyFQ1z1xa2IKDqsdneDDozIlE59VYdNPUA/IRZRxJDSk0U5/RZHp/uZiVbMzfsx01g0KmjzS4hTXtPq3jf7agZRx4EdosWapg4EuL3VwbV6gn2IeiXBE0yA6blrxGQkgV2NRz/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vQjuf-0006EP-MF; Wed, 03 Dec 2025 11:16:45 +0100
Message-ID: <bcb359cf-0e8a-46ec-9f69-51c4c9e8874e@pengutronix.de>
Date: Wed, 3 Dec 2025 11:16:44 +0100
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SoC-specific device tree aliases?
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree-spec@vger.kernel.org,
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
 <9e14fb8e-af84-4072-b0ac-9ead882782be@kernel.org>
 <CAL_Jsq+=v96eP6V+5Ehi9EQT3iKKU7=t7kvJ-WSA+1WCHDuHEA@mail.gmail.com>
 <07ee3540-d0c1-436e-9e1d-db1952f609a6@kernel.org>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <07ee3540-d0c1-436e-9e1d-db1952f609a6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-spec@vger.kernel.org

Hello Krzysztof,

On 11/17/25 5:29 PM, Krzysztof Kozlowski wrote:
> On 17/11/2025 17:06, Rob Herring wrote:
>>> So you want it to be an ABI for barebox, sure, just make it a binding.
>>
>> What do you have in mind? Other than standard names for the aliases,
>> what can we check here? That a specific alias points to a specific
>> path? That would be a bit too much IMO. That would be equivalent to
>> specifying possible values in 'reg' for all devices.
> 
> Binding with pattern or list of needed alias names, referenced by given
> soc-platform top-level schema.
> 
> One of the points is to make it explicit and obvious (e.g. to Arnd or to
> me if I forget, because I follow the same logic of aliases per board)
> that these aliases are used outside of kernel.
> 
> Just because ufs/mmc/spi can be used that way, does not mean we should
> accept any possible alias into soc.dtsi.

I can't see how this could work. A number of boards renumber MMC devices
in a different manner than the SoC reference manual:

- Changing the alias numbering is an ABI break, because Linux derives
its /dev/mmcblkX numbering from it

- Leaving them as-is means they are not usable for boot source determination

That's why I am suggesting a separate node that reflects only the SoC
reference manual's numbering. I don't see how a schema for the existing
/aliases would remove the need for this.

Thanks,
Ahmad

> 
> Best regards,
> Krzysztof
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

