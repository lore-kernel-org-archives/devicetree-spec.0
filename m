Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D00137C35
	for <devicetree-spec@vger.kernel.org>; Thu, 30 Jan 2025 19:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738263712; cv=none; b=cUfmjc8zTlOSzVEU81MevdK4ZAtfGfEhKBIbS3hzo+HHiH+Bm3RK9DVPP+jkGdoTsUqzZdq+6SVI1F/I+hI4/6vtIYhkmhPtYuvSq7S2KVl70E98XjdamrKkKWuuSHsWl0xEn5+uUbVEWTrBERv/iUNBY897QZ+j4oG3FGZ3vQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738263712; c=relaxed/simple;
	bh=06jBVm5zCjS+mHVfWhU3GTEW9FXuAOcBB2ILjjYvN04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XkAyYMMBRcVmHCG0u0zuRKIAlDlOE+XYpFOOq7LlPgh3ZalmM3H1ROD+EAjRXOt1N2B/ibLilSTRF5UevDRRCJjk/TPKlZaXAi0iJ+kG2R03SVsW1kQDoC3ChhXKQ4DffTw6aee5q5MgOfgPFoogg5X9inrTQMu6ERjOS8JzWWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=C3ESdKb7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="C3ESdKb7"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216281bc30fso27522275ad.0
        for <devicetree-spec@vger.kernel.org>; Thu, 30 Jan 2025 11:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1738263706; x=1738868506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pom//gSFz+GG7lMV6JhpqhCYd/ndD86tX3bctHpzqYY=;
        b=C3ESdKb7X0BLu6kCl8AkYtLHPuJKUp57av5vk0MfZ/a9zShCEnQsnK5VUAuhWwvge8
         m8cIdYRNJodI4TbkXONJpqoOnohwRyxOYaIkMjrCFWywVQM7W1tijwH/PCJL29RjETPI
         nWYsXKrPjP94IDHYjcGlcTDQ58RNrSIoXD6e8QUtv3LSGhF4huLDHiA/EEhJasiiVPmA
         H4umFMOKEqSBzxL4WQU/WhDsVbkHb9VRLWjgQedKfm2OFdexff+27gyjIad6rymN1J45
         7jXMKHK7TDrRhokFBDfQKtxps7lovfcFVAxTfpl3kCCdxtjw1OBuWjsekWtujOWLTZb9
         vMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738263706; x=1738868506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pom//gSFz+GG7lMV6JhpqhCYd/ndD86tX3bctHpzqYY=;
        b=MJHYlzV3m6dc7CbWRdo1p6HR12z49M9EWG3Iot7DCkTeTgH+4Ox36BrXZbtvpHLnGq
         kcfaPQl3WQtEld6mpqJxeqnY4pwauLNEGt0aB7GLBMNoYCUNw+pzanTzdcid6HuuffDb
         I0m0RLzglS8FvUXPVOnSJcuMrX7hqjPrUmPVJKPhwcJGUdCzmGoEMWOu1dRa07gd+t8W
         6lKcIQ8MpuynPVD2bJrh20/o0HKvfbeYz9dvIufFfVigsw8TbCVzTP1LXIg/cUugF/Oi
         a9H3caQ6A49p09zrZj5sEPDAFT23KzbZ67PUPtTlZ9OJilYVlw69FyefJA0w/a0RBMG1
         psLg==
X-Forwarded-Encrypted: i=1; AJvYcCV7yTu+GnpV6G58tJkzP3NRJK85Qr6uxblelK3g4hcTF0qLU1iL/mapvDd/8YCwu0hBUkf6KUxo13E2MKEpbPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIi5L1ObI5SFdDQtWlu+8bxsptD+8RWymuATHkhoOkK3VOMUl5
	McJg4dwTPOWN1E8Jv4aYg5ws+WGI/B2EqTzvIk+2KU6Toso4zwvE2g1juaMZvQ==
X-Gm-Gg: ASbGncsgSGxoxyebHWUbrDl3IaOYeXdKYEbEgO2mAkQm+VzKUU4kMADA8eXxdAN25iX
	JASxHT9MTZDHrbPHh30YdxPdytslN/+ydGlVSkgDU+EIJKgSp1kfKc3RFkG4PXUnzP1aFl9UHIn
	qkZXEDpsDR+PEfarsk2tYOAXqr0IJSuUyotA531vk3g4wPF/OB8v6LwyIYXWpLmyvjFFj9sdMaz
	3T0lc4G2CX4dTCB1ERC44R+dx+f1m83HJIrxj2O+5ywthm1xmYOHWobP2ktGSKe4aXL/IiX11Lk
	rj1u6lcC+0Vh8M16CtAYtnU=
X-Google-Smtp-Source: AGHT+IHlYpD6AUIrB68zmDqQtANHMqB7O6jArG3HsUxwtMMQ7vegK1X04CTs0vsmagfg1s7uNJTeUA==
X-Received: by 2002:a17:903:94e:b0:216:3732:ade3 with SMTP id d9443c01a7336-21dd7dccd43mr143445315ad.35.1738263706057;
        Thu, 30 Jan 2025 11:01:46 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee01bsm17225255ad.47.2025.01.30.11.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 11:01:45 -0800 (PST)
Message-ID: <edaa1378-c871-4c55-ab99-21ef6656f35a@beagleboard.org>
Date: Fri, 31 Jan 2025 00:31:35 +0530
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Adding export-symbols to specification
To: Herve Codina <herve.codina@bootlin.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: Jason Kridner <jkridner@beagleboard.org>, d-gole@ti.com,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree-spec@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
References: <024685af-4694-4c22-bf83-a04dde6e32bd@beagleboard.org>
 <c1224497-69cc-4a76-a63f-4445e341c374@cherry.de>
 <20250130190745.290376a7@bootlin.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20250130190745.290376a7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/30/25 23:37, Herve Codina wrote:

> Hi Quentin,
>
> On Thu, 30 Jan 2025 17:47:16 +0100
> Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
>> Hi Ayush,
>>
>> This is actually quite interesting. I don't know exactly how far we
>> could push this.
>>
>> FYI, we have a Q7 carrierboard which supports three different modules
>> today. This carrierboard currently has two adapter boards that are
>> compatible with all three modules. One is Haikou Video Demo, see patch
>> here:
>> https://lore.kernel.org/linux-rockchip/20241127143719.660658-4-heiko@sntech.de/
>>
>> We could resolve differences in i2c bus by adding another label to the
>> bus node that is exposed on the connector, so that isn't much of an
>> issue. MIPI DSI PHY and controller may be a different story as those may
>> have different bindings that would make it difficult to support with one
>> overlay? Haven't checked yet though. See [1] and [2] for the DTS (not
>> yet overlays...) of the other two SoM that this adapter works with.
>> However, this would resolve the issue of having different GPIOs for
>> reset and interrupt lines. Anyway, I'm not sure this export-symbols
>> stuff would actually help us, just being curious here, will keep an eye
>> on it but probably won't be able to help much.
>>
>> [1]
>> https://git.theobroma-systems.com/puma-linux.git/tree/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dts?h=v6.6.39-puma
>> [2]
>> https://git.theobroma-systems.com/puma-linux.git/tree/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dts?h=v6.6.39-puma
>>
> Related to buses like i2c or even DSI, we are working on it.
>
> We have presented the big picture in
>    https://lore.kernel.org/all/20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com/
> When this series was sent, export-symbols and nexus node were not present.
> A talk has been done at Plumbers:
>    https://lpc.events/event/18/contributions/1696/
> An the nexus node came from Plumbers discussion and export-symbols came right
> after in order to solve symbols resolution.
>
> Back to i2c bus, we have proposed the following:
>    https://lore.kernel.org/all/20240917-hotplug-drm-bridge-v4-5-bc4dfee61be6@bootlin.com/
>
> I recently took the i2c topic and I plan to send an updated iteration with
> issue fixed using the 'i2c-parent' and 'i2c-bus-extension'.
>
> On DSI bus, my colleague Luca is working on it. He already extracted specific
> DRM modification out of the big picture and sent a dedicated series:
>    https://lore.kernel.org/all/20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com/
>
> I hope those pointers will show you the direction we take and maybe help
> in your issues.
>
>> On 1/27/25 2:45 PM, Ayush Singh wrote:
>> [...]
>>> A board with two connectors can be described with:
>>>
>>>
>>>       connector1: connector1 {
>>>           ...
>>>           export-symbols {
>>>             connector = <&connector1>;
>>>           };
>>>       };
>>>
>>>       connector2: connector2 {
>>>           ...
>>>           export-symbols {
>>>             connector = <&connector2>;
>>>           };
>>>       };
>>>
>>>
>>> In that case, the same overlay with unresolved 'connector' symbol can be
>>> applied on both connectors and the correct symbol resolution (connector1
>>> or connector2) will be done.
>>>    
>> I'm not sure to understand how the tooling would figure out to which
>> connector of the baseboard should the overlay be applied?
>>
>> In the case of a single connector and a single overlay, that's fine. But
>> in the case of 2+ connectors, 2+ adapters but a single overlay, how does
>> the system know which connector it should resolve the "connector" part
>> in the overlay? Is there some tooling involved? E.g. providing an
>> argument (like which connector from the board to use?). Or are you
>> expecting that applying the overlay once will pick connector1 and
>> applying the overlay a second time would pick connector2? If you have
>> multiple overlays for different adapters using this connector
>> abstraction, the first one to be applied would be the on the first
>> connector and then the second on the second one? What if I have nothing
>> connected on connector 1 but on connector 2, how do I specify to which
>> connector the overlay should apply?
> In my case, I have a driver for the connector and our driver apply the
> overlay.
>
> The symbol resolution is done at runtime by the kernel when the overlay is
> applied by the driver.
>    https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/
>
> The related driver applying the overlay:
>    https://lore.kernel.org/all/20240917-hotplug-drm-bridge-v4-8-bc4dfee61be6@bootlin.com/
> Even if some modification are still needed in this driver, the base ideas are
> already present.
>
> Best regards,
> Hervé


I am also planning to add argument for specifying target in fdtoverlay 
(to support application using uboot, etc). So something like:


fdtoverlay overlay.dtbo --target "/path/to/connector"


Best regards,

Ayush Singh

