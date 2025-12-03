Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5A124E4A1
	for <devicetree-spec@vger.kernel.org>; Wed,  3 Dec 2025 11:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764761701; cv=none; b=dIJBA2igdQ/aWfAT0XML/x30aoWMqs+flWFWxm77zv0JlA9uHrVVZ8Z92kfSLNLTxHvvh8/XViCrnM0z8F47uEz7vtCDybpXVdQ4+ycAaDlXOolpX4JRU2EyfA5Tkzo0eqZOgg/QAYr+ZGvbecuINxey9EKrxYXKrCvMQKK7uv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764761701; c=relaxed/simple;
	bh=2CDpfurWhZKfXtEZ54dirUQfDB5GZUe89QM6AihBRDg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AGnH2KNvsG9PqRHfNxeoDqvGth03sgO67npUejJ54As3uPSAMnZ6+u5SKAV+gBgFnVfoNUNsAhqx2QaLZPOs3s850LfBNNym5nL0dKSVNve4yFKdGT2W94suSaIoLNSj2wTpMOei8L5XPisYoMG4d3NROe3KtrUwjpwMTx/6b+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vQl8B-0005vO-2V; Wed, 03 Dec 2025 12:34:47 +0100
Message-ID: <ddc6fa7b-7840-4340-be41-8f28aad1c80e@pengutronix.de>
Date: Wed, 3 Dec 2025 12:34:45 +0100
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
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
 <bcb359cf-0e8a-46ec-9f69-51c4c9e8874e@pengutronix.de>
 <6638e499-2320-41c9-b720-faf4f976e476@kernel.org>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <6638e499-2320-41c9-b720-faf4f976e476@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-spec@vger.kernel.org

Hello Krzysztof,

On 12/3/25 11:25 AM, Krzysztof Kozlowski wrote:
> On 03/12/2025 11:16, Ahmad Fatoum wrote:
>>> Just because ufs/mmc/spi can be used that way, does not mean we should
>>> accept any possible alias into soc.dtsi.
>>
>> I can't see how this could work. A number of boards renumber MMC devices
>> in a different manner than the SoC reference manual:
>>
>> - Changing the alias numbering is an ABI break, because Linux derives
>> its /dev/mmcblkX numbering from it
> 
> First, why the alias would change? Isn't the board following the SoC
> numbering in 99.9% cases?

For 32-bit i.MX, the figure is more like 80% with 20% of the boards
going out of their way to override the numbering in the SoC dtsi.

I can only assume the figure may be higher for other platforms, where
there is no numbering in the DTSI. See below[1] for calculation.

> Second, I don't think it is an ABI. We had it ~5 or ~8 years ago where
> the mmcblkX was changing based on probe ordering. Many people setups got
> broken, many people complained and the consensus reply was: please start
> finally using UUID/PARTUIID/LABEL for rootfs.

On the other hand, I have seen people flashing the same image to both an
eMMC and a SD-Card and wondering why the bootloader picks a different
rootfs than the kernel.

> Eventually we got back to
> mmcblkX stability but rule is there - if your cmdline has /dev/mmcblkX,
> then it is your problem.

Device tree aliases are the only way to identify the same MMC device
in bootloader and kernel over different boots and for my part, I can
only encourage their use.

[1]: I checked out Linux v6.18, used imx_v6_v7_defconfig and built the
dtb target.

arch/arm/boot/dts/nxp/imx/.*.dtb.dts.tmp in the build directory are the
preprocessed device tree source files.

I deleted arch/arm/boot/dts/nxp/imx/.imx7ulp*.dtb.dts.tmp, because
it's the only SoC apparently that numbers MMC peripherals stating with 0.

Now let's find all instances of mmcX = somethingY, where X is not Y - 1:

perl -ne '/mmc(\d+)\s*=\s*&\w+?(\d+)/ && $1 != $2 - 1 and \
	print($ARGV, $_) && close ARGV' \
		arch/arm/boot/dts/nxp/imx/.*.dtb.dts.tmp

This returns 76 matches out of a total 381, so that's 19.95% of all i.MX
device trees that went out of their way to override the numbering in the
SoC dtsi.

Cheers,
Ahmad

> 
> 
> 
> 
> Best regards,
> Krzysztof
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

