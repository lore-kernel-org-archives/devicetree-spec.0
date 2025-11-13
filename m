Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DC3DDD2
	for <devicetree-spec@vger.kernel.org>; Thu, 13 Nov 2025 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763022553; cv=none; b=Tu3jUuAXyGkI4EmweDeQdhPe8O4aVQIaYJbVCH2nY0auwmY4r6Id6e0vgeedzXZES1X1mOdIcjWXpJiwqst6R0PduveOzoZlS3bug4K0EdAWmtQf6K2zWAxP6ChxEQvZnaVksMPTI61pg596xKa6ERnICL/9JFUA47joCWEWuXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763022553; c=relaxed/simple;
	bh=WkwkFGhjSe/RTTW/9W8KFbpvM90IQfQ0/X6XqByt9+g=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=s6HTGcF3yES5enkrh+XP22EqkCJFkrHlEr6W1Y+lnNZ3b8EoKbU2/7yvrth+1IcOx3AJz/SWlVLgVAYOJAYboDiFmNrWWqRTbhf+aRgK6HrJ87msJQ1EpY+H9x+iz3dXr/xlp2LssgpbChSmPoAVXVOJxmj1GgFQAQJmy8K0DX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vJShN-0007EK-Ij; Thu, 13 Nov 2025 09:28:57 +0100
Message-ID: <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de>
Date: Thu, 13 Nov 2025 09:28:56 +0100
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree-spec@vger.kernel.org
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, quentin.schulz@cherry.de
Subject: SoC-specific device tree aliases?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-spec@vger.kernel.org

Hello,

With /chosen/bootsource now part of dt-schema, I would like to raise a
related point: The need for SoC-specific device tree aliases.

For many SoCs, there is a canonical numbering for peripherals; it's used
in the datasheet and BootROMs often makes use of it at runtime to report
the bootsource as a pair:

  - One value to enumerate type of boot medium (e.g. mmc, spi-nor..)
  - Another value that describes which instance (e.g. SDHC1, SPI3, ...)

Some examples, where this is the case, are AT91, STM32MP or i.MX.

barebox has traditionally used /aliases to translate BootROM information
to a device tree node to fixup /chosen/bootsource.

This doesn't work out for many newer SoC support, because of different
expectations: For upstream, aliases are relevant to a board, while
barebox traditionally expected them to be SoC-specific (because they
used to be on i.MX, probably).

To accommodate this, barebox nowadays extends upstream device trees with
/chosen/barebox,bootsource-${alias} properties, which can be used as
translation table instead of aliases.

This solves the issue, but there is occasional breakage when upstream
decides to remove aliases from the SoC DTSI and move them into the
boards until barebox is made to add the /chosen/barebox, overrides.

As described above, I think the data sheet numbering is pretty much an
aspect of the hardware and it has a place in the upstream SoC DTSI.


So what are the thoughts on adding /soc/aliases or some other top-level
node to hold this information?
Or would a h"ardware-label" property or similar be more tenable?


Thanks!
Ahmad

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

