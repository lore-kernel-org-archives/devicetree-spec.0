Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF14268689
	for <devicetree-spec@vger.kernel.org>; Tue, 25 Feb 2025 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740496728; cv=none; b=gB35YMN7MbWx+1UM8bnFBugIQFnye5EdYyeuCTYRlkv+83oRGKRqg8wXtM9QefjbGp8ua+2NbWJd5Vijdv5DXcHfwIJRaFpZ4FbVUdti9ffhD4fS/esFLBq+ZEIX3yzvFYINu7x3GZiBmdhY9hcXdOSkFSKcV+A0S+R4GLqQ7Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740496728; c=relaxed/simple;
	bh=nTzcq3qmhNmXwLDhgdT/jmEx4a7DqwF1/ggXZfXC57w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ve6nUTz31S/jOnKrCXXlYG+fTOQOSkG9hiFh7Do6ETY39QBka1n/+aX/Nhy8CS6DzcXzudRpUi1JMI088+sngPxEQxaliw3hNOjGxy5L/tuPQSsZ7qGqNpilJCEcCDXwoxoPM7cizZTzv5b9+l5d9zFWHUA0+wEWToNpJFfTVJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=1hPPEeAv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="1hPPEeAv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220c665ef4cso101473995ad.3
        for <devicetree-spec@vger.kernel.org>; Tue, 25 Feb 2025 07:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1740496726; x=1741101526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QbDFb9vr40fwt6Y9HjL3aOGFjWACSIZGufQLcv9GkQ=;
        b=1hPPEeAvfJ4t/uPwvpUI/4/XDIVowFuMQrvnRmgsZeSPAfD8IE3S8/DCp5RTJJ6XCK
         EW8vmYAoEGSiSfWA9wnnExUa9lnOT2i1/e2oLhZU316uLWwphcvQHtva4oftpZzkeAJb
         qaI7MMJDVE+iUAV/NVtW8HCUFb9SW84Cd859QwQFIFgNR6WvLwN3wDM0h43n/sWcMucC
         +lfTVDUMlBLarvajKH/dfoCvbownc7kd/PibOS3SaissZT0BOV6UEOahKPvYWQQNYiMt
         spIu05lPfTr5Hu4wpAa8pzqbXnhBZLkUWVB4d64HeZC4R1wqjgJqeM+TUb7nHLcSpKTA
         3t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740496726; x=1741101526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QbDFb9vr40fwt6Y9HjL3aOGFjWACSIZGufQLcv9GkQ=;
        b=UjT3L8q71nIjuPbiZPANj2GmapXs9YfLKjvCRT/DDY1nLCS2W+zEPLahU6zqFHZ/92
         uc6a1ZS0tKTbt0J9tJJH7X10kBKgk1GhePrswsomu5gxeLFal2ofeh5jHx1RiZfO0SZl
         UMN43Au9ndfW5iX+8W0AQ8VTLPh8tkWmMYMj5pg2dn8NCE8+ezh4WalHMR4OFqzk5R9K
         zlCRrwBSn7RJJ24cckO0yJ4XK1E5gEgaEMfxHj2jCz/X9IlqEkRVqnclyJ7tJWcoTyy2
         QVh9HHzC+6u6Vg/ZaliIcjxw/h8yRTaf/jss79P9FFcv/y9p61UMpMGr2DPR4k9RNQhn
         91+g==
X-Gm-Message-State: AOJu0YxFwMfABObQmFN9i6QmzoxvDMX5hYgvhpucM7NklLQvM9IS0Ohi
	7qrdPJjY5+wiEtnsio+/91rHQKtx8BAfFJXNCEpOgr2Z6a7FzTm7lWLxKWMk+RyQfnPD/lIl/Xc
	=
X-Gm-Gg: ASbGnctJ70gTS/euG5ykx5btWbdsSSCnvzCbffny7GEqC8wcfnix7tKNaFQmW0LLGGy
	xKpxspR4AiDyn5O275HgNuheQPICCSAY2zDnjJRzcoNd+SyrvgCueQXXO2IY8ju/p3BToEXb1ta
	+evJv3kMwM7wpRVLtxwCv16dCWrHIIKp96EDwHHcip1+X0uqeUUCZ7zlO2V1UJK++vaMnUpNB2H
	08kest9p5p5qDzqhoVGitanSzavu8s9oimN9MpsBWf+GQ1PzY8KQe2yeGHuXzr+dCaNJmK8A63n
	MJVvsDfvnpPqHStzBgrQVrqLxZ0g+/BjrWQUGOb+fupTtjgJEcvt4AWOUd4cN50fnPEq4FrBmmp
	/xmI=
X-Google-Smtp-Source: AGHT+IE3I53mVBPDehcMacNsaxgFPcVSIRcxntERtcYAZqEp1+y8QRWVI6p4B/5fWcluJ3UbnF1GHg==
X-Received: by 2002:a05:6a00:4fc6:b0:730:7499:4043 with SMTP id d2e1a72fcca58-73426aedd26mr27225145b3a.0.1740496725775;
        Tue, 25 Feb 2025 07:18:45 -0800 (PST)
Received: from ?IPV6:2401:4900:71cd:a48f:7e5b:79cf:73ed:df46? ([2401:4900:71cd:a48f:7e5b:79cf:73ed:df46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aedaa642994sm1486977a12.50.2025.02.25.07.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 07:18:45 -0800 (PST)
Message-ID: <7d1b81c2-918b-4996-82c0-2aae35051e02@beagleboard.org>
Date: Tue, 25 Feb 2025 20:48:32 +0530
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add new `export-symbols` node
To: Andrew Davis <afd@ti.com>, Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Grant Likely <grant.likely@secretlab.ca>, Dhruva Gole <d-gole@ti.com>
Cc: devicetree-spec@vger.kernel.org
References: <20250225-export-symbols-v1-1-693049e3e187@beagleboard.org>
 <f2bd0fea-83bc-430f-8e3d-290bb3957f30@ti.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <f2bd0fea-83bc-430f-8e3d-290bb3957f30@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/25/25 20:15, Andrew Davis wrote:

> On 2/25/25 12:02 AM, Ayush Singh wrote:
>> `export-symbols` is designed to be a local replacement of global
>> `__symbols__` allowing nodes to define aliases to nodes in a tree, which
>> will take precedence over the aliases defined in the global 
>> `__symbols__`.
>>
>> Having a way to allow node local aliases helps in usecases such as
>> connectors and addon-boards, by allowing decoupling of
>> overlays/devicetree nodes of addon-board from the base connector.
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>> This patch series follows the initial RFC [9] sent a few weeks ago. I
>> will be reiterating the RFC here for anyone who might be seeing this the
>> first time, since there was not much feedback in that thread.
>>
>> The patch series adds export-symbols to base devicetree specification to
>> allow for support of base board + runtime connector setups using 
>> devicetree
>> overlays. The idea was actually proposed in the linux kernel mailing 
>> list
>> by Herve Codina [0] with the devicetree schema and linux kernel
>> implementation. Initial implementations for devicetree compiler [1] and
>> fdtoverlay [2] have also been sent to the mailing lists.
>>
>> Introduction
>> *************
>>
>> There are a lot of setups, especially in embedded systems that 
>> consist of
>> a base connector and addon boards that can be connected to this 
>> connector.
>> Here are some examples:
>> - MikroBus
>> - GE SUNH
>> - BeagleCapes, etc
>>
>> Some of these connectors have runtime detection capabilities (GE SUNH),
>> while some do not (MikroBUS without 1-wire EEPROM). The goal is to 
>> decouple
>> the connector on base device tree with the overlay for addon boards. 
>> This
>> will allow having 1 overlay for each board that would work with 
>> connector
>> devicetree on any board.
>>
>> One of the issue was referencing resources available on the base board
>> device tree from the addon overlay device tree. Using a nexus node [3]
>> helps decoupling resources and avoid the knowledge of the full base 
>> board
>> from the overlay. Indeed, with nexus node, the overlay need to know only
>> about the nexus node itself.
>>
>> For instance, suppose a connector where a GPIO is connected at PinA. 
>> On the
>> base board this GPIO is connected to the GPIO 12 of the SoC GPIO 
>> controller.
>>
>> The base board can describe this GPIO using a nexus node:
>>
>>      soc_gpio: gpio-controller {
>>        #gpio-cells = <2>;
>>      };
>>
>>      connector1: connector1 {
>>          /*
>>           * Nexus node for the GPIO available on the connector.
>>           * GPIO 0 (Pin A GPIO) is connected to GPIO 12 of the SoC gpio
>>           * controller
>>           */
>>          #gpio-cells = <2>;
>>          gpio-map = <0 0 &soc_gpio 12 0>;
>>          gpio-map-mask = <0xf 0x0>;
>>          gpio-map-pass-thru = <0x0 0xf>;
>>      };
>>
>> The connector pin A GPIO can be referenced using:
>>
>>    <&connector1 0 GPIO_ACTIVE_HIGH>
>>
>> This implies that the overlay needs to know about exact label that
>> references the connector. This label can be different on a different 
>> board
>> and so applying the overlay could fail even if it is used to describe 
>> the
>> exact same addon board. Further more, a given base board can have 
>> several
>> connectors where the exact same addon board can be connected. In that 
>> case,
>> the same overlay cannot be used on both connector. Indeed, the connector
>> labels have to be different.
>>
>> The `export-symbols` node solves this issue.
>>
>> The idea of export-symbols is to have something similar to the global
>> `__symbols__` node but local to a specific node. Symbols listed in this
>> export-symbols are local and visible only when an overlay is applied 
>> on a
>> node having an export-symbols subnode.
>>
>> Note: `export-symbols` properties differ from __symbols__ since they are
>> phandles, not path references. This is much easier to work with in
>> overlays as described in [7].
>>
>> Using export-symbols, our example becomes:
>>
>>      soc_gpio: gpio-controller {
>>        #gpio-cells = <2>;
>>      };
>>
>>      connector1: connector1 {
>>          /*
>>           * Nexus node for the GPIO available on the connector.
>>           * GPIO 0 (Pin A GPIO) is connected to GPIO 12 of the SoC gpio
>>           * controller
>>           */
>>          #gpio-cells = <2>;
>>          gpio-map = <0 0 &soc_gpio 12 0>;
>>          gpio-map-mask = <0xf 0x0>;
>>          gpio-map-pass-thru = <0x0 0xf>;
>>
>>          export-symbols {
>>            connector = <&connector1>;
>>          };
>>      };
>>
>> With that export-symbols node, an overlay applied on connector1 node can
>> have the symbol named 'connector' resolved to connector1. Indeed, the
>> `export-symbols` node available at connector1 node is used when the 
>> overlay
>> is applied. If the overlay has an unresolved 'connector' symbol, it 
>> will be
>> resolved to connector1 thanks to export-symbols.
>>
>> Our overlay using the nexus node can contains:
>>
>>     node {
>>        foo-gpio = <&connector 0 GPIO_ACTIVE_HIGH>;
>>     };
>>
>> It used the GPIO 0 from the connector it is applied on.
>>
>> A board with two connectors can be described with:
>>
>>      connector1: connector1 {
>>          ...
>>          export-symbols {
>>            connector = <&connector1>;
>>          };
>>      };
>>
>>      connector2: connector2 {
>>          ...
>>          export-symbols {
>>            connector = <&connector2>;
>>          };
>>      };
>>
>> In that case, the same overlay with unresolved 'connector' symbol can be
>> applied on both connectors and the correct symbol resolution (connector1
>> or connector2) will be done.
>
> How? I feel this gets hand-waved over but is the core issue you are 
> trying
> to solve. Let's say I have the above, 2 of the same connector on a board,
> how do I apply my add-on overlay to one and not the other, or to both?
>
> I believe you have suggested maybe specifying the connector with a hint
> when applying it, so my question is why can't this "hint" just be the
> connector name without the export-symbols indirection?
>
> Maybe a concrete example could help me get the full picture here,
> say I want to do this ahead of time in U-Boot during boot (so I have
> basically just "fdtapply"). I know the name of the base DT and the
> name of the device overlay. What steps do I take here?
>
> Andrew
>
My bad, the example is not great. Selecting the connector for 
application will be done in the following ways depending on the context:

1. Driver: If there is a driver (either doing automatic discovery or 
sysfs), then it will select the target connector since each connector 
will have a separate instance of the driver.

2. fdtoverlay: I will be adding a patch to allow specifying the target 
path in the fdtoverlay. So we can apply the code to the specific 
connector we want.


The `export-symbols` are for nodes that the connector needs to use, like 
the GPIO, I2C, SPI etc. In this particular example, the connector itself 
is the GPIO proxy node. It should probably be written like this:


      connector1: connector1 {
          ...
          export-symbols {
            gpio = <&connector1>;
          };
      };

      connector2: connector2 {
          ...
          export-symbols {
            gpio = <&connector2>;
          };
      };


To clarify, `export-symbols` is not responsible or even useful for 
selecting the connector itself. It is only going to be used to select 
everything else that the connector needs a generic name for.


Best Regards,

Ayush Singh


