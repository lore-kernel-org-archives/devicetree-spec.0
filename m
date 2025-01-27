Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3286C5FDA7
	for <devicetree-spec@vger.kernel.org>; Mon, 27 Jan 2025 15:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737991258; cv=none; b=tTtIKpa1MteWsT9UpROhbh9qKxUo+NzaToCHZ/D9j9hzj/Gv8urv0xGEdWyvI0N6G5AJiGOzx2e8Cap3o3YyDUkJU/7Y0LgREfwle9xXnKJrINs4lSTS+o1YuMKzis7a/SLXLY4gOxuWS3NW9JtlBc5RDlx5LL1ROwZ0gIbSRNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737991258; c=relaxed/simple;
	bh=niQ8wGljDvwlxeRFTUtq1bX4v9a/reCoyMmoqQ78Tfs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LuunJEHs7afpeTtuZD2Flpvc5BFCyY0z46+m/woWexmdebPIoBe45YjsMVnAPZjgmykgxHDmEV/YRgZQ9zQEJCaWOq4fsNw2iKkRkaKnHgOpNP1AAIwE8rvudSuJLn1+EmSKujzXIG63PrFpiE17BSdIiLYsidCwe3X6CyI/XrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R6hE3YCo; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R6hE3YCo"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E17CD1BF204;
	Mon, 27 Jan 2025 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737991247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Osj6C2zXA+j3PN41PXEteZsKPQdsexWJxmHk0jaTMUQ=;
	b=R6hE3YCoP5Evr0uJE5klPJl2fy/90y865GJ3JNUvkTPHI/r2q1nYvWuh0dIkAc2k4TaH9h
	JcdgPy2Od++s6AAE9Eska+2FhK3BiHzH9TF0akY+GPGAmT9E9uiMtI5fxksalDekkrZXwT
	E9ntvARZGDpFrMBHdaii+OgJ3G9CdrHJBiBL1kSquaNS85v8aZxmrbk/F5U9OQhSrZD0xt
	hJb4eBGt92pGIMM2Ph4X8ytRkuAoyNBkzJJk/ImcJDyU5iPMBBO+EK4oF5StO9uODyyxJZ
	Ye1EpWg/ugvzdoslIomdy6U0dLSx7/j3ReHB096kDRk5tGSqRzqi29wTqiVHCw==
Date: Mon, 27 Jan 2025 16:20:43 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, d-gole@ti.com, Deepak Khatri
 <lorforlinux@beagleboard.org>, Robert Nelson
 <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com, Andrew Davis
 <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Robert Nelson
 <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, David Gibson
 <david@gibson.dropbear.id.au>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 devicetree-spec@vger.kernel.org
Subject: Re: [RFC] Adding export-symbols to specification
Message-ID: <20250127162043.48552da0@bootlin.com>
In-Reply-To: <024685af-4694-4c22-bf83-a04dde6e32bd@beagleboard.org>
References: <024685af-4694-4c22-bf83-a04dde6e32bd@beagleboard.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Ayush,

On Mon, 27 Jan 2025 19:15:10 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

> Hello everyone,
> 
> 
> The RFC aims to get feedback and any blockers/objections to adding 
> export-symbols to base devicetree specification to allow for support of 
> base board + runtime connector setups using devicetree overlays. The 
> idea was actually proposed in the linux kernel mailing list by Herve 
> Codina [0] with the devicetree schema and linux kernel implementation. 
> Initial implementations for devicetree compiler [1] and fdtoverlay [2] 
> have also been sent to the mailing lists.
> 
> 
> # Introduction
> 
> There are a lot of setups, especially in embedded systems that consist 
> of a base connector and addon boards that can be connected to this 
> connector. Here are some examples:
> 
> - MikroBus
> 
> - GE SUNH
> 
> - BeagleCapes, etc
> 
> 
> Some of these connectors have runtime detection capabilities (GE SUNH), 
> while some do not (MikroBUS without 1-wire EEPROM). The goal is to 
> decouple the connector on base device tree with the overlay for addon 
> boards. This will allow having 1 overlay for each board that would work 
> with connector devicetree on any board.
> 
> 
> One of the issue was referencing resources available on the base board 
> device tree from the addon overlay device tree. Using a nexus node [3] 
> helps decoupling resources and avoid the knowledge of the full base 
> board from the overlay. Indeed, with nexus node, the overlay need to 
> know only about the nexus node itself.
> 
> For instance, suppose a connector where a GPIO is connected at PinA. On 
> the base board this GPIO is connected to the GPIO 12 of the SoC GPIO 
> controller.
> 
> The base board can describe this GPIO using a nexus node:
> 
>      soc_gpio: gpio-controller {
>        #gpio-cells = <2>;
>      };
> 
>      connector1: connector1 {
>          /*
>           * Nexus node for the GPIO available on the connector.
>           * GPIO 0 (Pin A GPIO) is connected to GPIO 12 of the SoC gpio
>           * controller
>           */
>          #gpio-cells = <2>;
>          gpio-map = <0 0 &soc_gpio 12 0>;
>          gpio-map-mask = <0xf 0x0>;
>          gpio-map-pass-thru = <0x0 0xf>;
>      };
> 
> The connector pin A GPIO can be referenced using:
> 
>    <&connector1 0 GPIO_ACTIVE_HIGH>
> 
> 
> This implies that the overlay needs to know about exact label that 
> references the connector. This label can be different on a different 
> board and so applying the overlay could fail even if it is used to 
> describe the exact same addon board. Further more, a given base board 
> can have several connectors where the exact same addon board can be 
> connected. In that case, the same overlay cannot be used on both 
> connector. Indeed, the connector labels have to be different.
> 
> 
> The export-symbols node solves this issue.
> 
> 
> The idea of export-symbols is to have something similar to the global 
> __symbols__ node but local to a specific node. Symbols listed in this 
> export-symbols are local and visible only when an overlay is applied on 
> a node having an export-symbols subnode.
> 
> Note: `export-symbols` properties differ from __symbols__ since they are 
> phandles, not path references. This is much easier to work with in 
> overlays as described in [7].
> 
> 
> Using export-symbols, our example becomes:
> 
>      soc_gpio: gpio-controller {
>        #gpio-cells = <2>;
>      };
> 
>      connector1: connector1 {
>          /*
>           * Nexus node for the GPIO available on the connector.
>           * GPIO 0 (Pin A GPIO) is connected to GPIO 12 of the SoC gpio
>           * controller
>           */
>          #gpio-cells = <2>;
>          gpio-map = <0 0 &soc_gpio 12 0>;
>          gpio-map-mask = <0xf 0x0>;
>          gpio-map-pass-thru = <0x0 0xf>;
> 
>          export-symbols {
>            connector = <&connector1>;
>          };
>      };
> 
> 
> With that export-symbols node, an overlay applied on connector1 node can 
> have the symbol named 'connector' resolved to connector1. Indeed, the 
> export-symbols node available at connector1 node is used when the 
> overlay is applied. If the overlay has an unresolved 'connector' symbol, 
> it will be resolved to connector1 thanks to export-symbols.
> 
> 
> Our overlay using the nexus node can contains:
> 
> 
>     node {
>        foo-gpio = <&connector 0 GPIO_ACTIVE_HIGH>;
>     };
> 
> 
> It used the GPIO 0 from the connector it is applied on.
> 
> A board with two connectors can be described with:
> 
> 
>      connector1: connector1 {
>          ...
>          export-symbols {
>            connector = <&connector1>;
>          };
>      };
> 
>      connector2: connector2 {
>          ...
>          export-symbols {
>            connector = <&connector2>;
>          };
>      };
> 
> 
> In that case, the same overlay with unresolved 'connector' symbol can be 
> applied on both connectors and the correct symbol resolution (connector1 
> or connector2) will be done.
> 

[...]

You have perfectly summarized the export-symbols goal and the benefit of
this new feature.

I am waiting for feedback from other people. I hope we will move forward
on this topic and unblock several users (me included) stuck on this real
issue.

Thanks a lot!

Best regards,
Hervé
