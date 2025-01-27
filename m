Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735E28C11
	for <devicetree-spec@vger.kernel.org>; Mon, 27 Jan 2025 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985523; cv=none; b=UQk2VnF8tee5iovgsr9laFwkjYpoozdBVyLm/6ddSr+oGCZi67PQydTIOChzoaDymIaIiCf+tyDpk0qZ3VCZ5GjXxyPE6u+lkXIKG29Q17kfDWbjPXQ7Vdi/Z9kWK33YunAHfc/r4ma+jLTGTMAw0RlrE5qA7CAO0GqRieGTFWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985523; c=relaxed/simple;
	bh=vLTYc9CFIN5zkPESQF15WKXPYAXVJwYfXPuvLsCoczk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=tr47Ruj1fcsW9QKDAatXl0Sul4bNXUNhcUgjGEo3y3QwkUXpXZRM9dNEePAURs77CTPhxZ5HR5eohHtOuU4IaDvEiY4kCGj6/NqeMmVj11B1JDJHtsjFoM7Hj0b95FATtwcqedFm45zkbyLkiPD3ypt5/RFBGrEL7Tw1mrFJkgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=kxXb0x/k; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="kxXb0x/k"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216281bc30fso101726395ad.0
        for <devicetree-spec@vger.kernel.org>; Mon, 27 Jan 2025 05:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1737985521; x=1738590321; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HApgI7/fLjfWnkXh3t9+JVhAGxlPlxoFX3zAB3ICLic=;
        b=kxXb0x/k7PtLQ4/22zrwfLA7WWAFlc7B/ORubsap2Z0vr3Qhoc0C+mGdLVtB9MhBQB
         os7oqaInXCvA5bendrab9ksEslkjKsvgeCRdnaNu7bZPTh16fWlogQTWhAMxP7E1P0VA
         JzZVPKza0ubWRqpm0KijXja0RJQ9da1JZU4xBFeo3R6u3FVZPG532M1dX5rYVRYNpdch
         gsU65JMqGpXIt51tOIPql+3Z/+rTD9//e+rr67bXzj3K6JpvuJD7S3RUB9tNeU6voQyB
         ueQ6cFSuID+wN9Kx8KIzwHNKZWcpkIBzj8F+B+JlBKYd56t+RRElI7r0xRyA6dxAvoPh
         5nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985521; x=1738590321;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HApgI7/fLjfWnkXh3t9+JVhAGxlPlxoFX3zAB3ICLic=;
        b=Rs5BRFBmcg/09P6kEHV2eZ0tQGyoaBEQ89cpyKPuJDlZ/bJkFFBRyOqJ3iWfIQAaWx
         Ost2mtajHfXpuTqLKQunsLWCykLA/0sEqpaiJGiNUZwjL1StsDiflV/78SmbnPNN9vW1
         oc2sFPZH/W+WEFAFeCBSh5t73rs95PHC2QULQOTorEnGxutI+3jPvE/5u//J4SWQPe2o
         RXVGb7PRjSJZx7yebFcKQUFn1FukxGedF/nHiQmExso7Y2ZKGnqR4XkUYwzSSlnGFBh0
         v7txxwtLJMEn5J8SPqCAdWPSZstQiU+14kztyQDv3agdKMi2gYyHJUAkfX8Iz6gNTJHK
         +fow==
X-Gm-Message-State: AOJu0YxgMt86uvMejJcajCvxoNmvPZLBZMO3Ay+/SxE2Zp3qIK+WiRTU
	UGsVn9ZKLP3uFkGopTynOEWIBkghmpor8rwArJ+IhGWsLKj+H3aXh+ePqrSqoQ==
X-Gm-Gg: ASbGncttkO382LVefvTKzmkzCW4oefexQL+6NKeg/6LxFXLqnjfQok+ANsm8ryKITVW
	dH7/1ALIPsZMwweXEnR6O7FE8yyFzqfUhwLt9J1EDJXPd5hOgNpClH0/LMgw4vVAngYE8yQx7Qo
	Vo+cp5eG1ZqE49KAtx/UhJt8UIIzajYLJnwRmUz2rS1uXOwSruUXKowfV9F3znQ0vsYEX3I4fag
	yF0CQKIHVRlWfAug1Y6GMJo0AARFain8Ee5+Q7gk2EpjnKV5BpKdR0QxAVyAso3MmTejAhrdryD
	vx19pGvFlsjM
X-Google-Smtp-Source: AGHT+IEMit75zoIT9qQsUXUDWcWC2ddYWJvU3kaqG7sD5F2uelwv8xuVmOPbxfpCtuTrp6Z2NmTErw==
X-Received: by 2002:a05:6a20:2591:b0:1e1:bdae:e045 with SMTP id adf61e73a8af0-1eb214e053cmr63086301637.23.1737985520568;
        Mon, 27 Jan 2025 05:45:20 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a78eea2sm7215434b3a.174.2025.01.27.05.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 05:45:19 -0800 (PST)
Message-ID: <024685af-4694-4c22-bf83-a04dde6e32bd@beagleboard.org>
Date: Mon, 27 Jan 2025 19:15:10 +0530
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jason Kridner <jkridner@beagleboard.org>, d-gole@ti.com,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: devicetree-spec@vger.kernel.org
From: Ayush Singh <ayush@beagleboard.org>
Subject: [RFC] Adding export-symbols to specification
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,


The RFC aims to get feedback and any blockers/objections to adding 
export-symbols to base devicetree specification to allow for support of 
base board + runtime connector setups using devicetree overlays. The 
idea was actually proposed in the linux kernel mailing list by Herve 
Codina [0] with the devicetree schema and linux kernel implementation. 
Initial implementations for devicetree compiler [1] and fdtoverlay [2] 
have also been sent to the mailing lists.


# Introduction

There are a lot of setups, especially in embedded systems that consist 
of a base connector and addon boards that can be connected to this 
connector. Here are some examples:

- MikroBus

- GE SUNH

- BeagleCapes, etc


Some of these connectors have runtime detection capabilities (GE SUNH), 
while some do not (MikroBUS without 1-wire EEPROM). The goal is to 
decouple the connector on base device tree with the overlay for addon 
boards. This will allow having 1 overlay for each board that would work 
with connector devicetree on any board.


One of the issue was referencing resources available on the base board 
device tree from the addon overlay device tree. Using a nexus node [3] 
helps decoupling resources and avoid the knowledge of the full base 
board from the overlay. Indeed, with nexus node, the overlay need to 
know only about the nexus node itself.

For instance, suppose a connector where a GPIO is connected at PinA. On 
the base board this GPIO is connected to the GPIO 12 of the SoC GPIO 
controller.

The base board can describe this GPIO using a nexus node:

     soc_gpio: gpio-controller {
       #gpio-cells = <2>;
     };

     connector1: connector1 {
         /*
          * Nexus node for the GPIO available on the connector.
          * GPIO 0 (Pin A GPIO) is connected to GPIO 12 of the SoC gpio
          * controller
          */
         #gpio-cells = <2>;
         gpio-map = <0 0 &soc_gpio 12 0>;
         gpio-map-mask = <0xf 0x0>;
         gpio-map-pass-thru = <0x0 0xf>;
     };

The connector pin A GPIO can be referenced using:

   <&connector1 0 GPIO_ACTIVE_HIGH>


This implies that the overlay needs to know about exact label that 
references the connector. This label can be different on a different 
board and so applying the overlay could fail even if it is used to 
describe the exact same addon board. Further more, a given base board 
can have several connectors where the exact same addon board can be 
connected. In that case, the same overlay cannot be used on both 
connector. Indeed, the connector labels have to be different.


The export-symbols node solves this issue.


The idea of export-symbols is to have something similar to the global 
__symbols__ node but local to a specific node. Symbols listed in this 
export-symbols are local and visible only when an overlay is applied on 
a node having an export-symbols subnode.


Note: `export-symbols` properties differ from __symbols__ since they are 
phandles, not path references. This is much easier to work with in 
overlays as described in [7].


Using export-symbols, our example becomes:

     soc_gpio: gpio-controller {
       #gpio-cells = <2>;
     };

     connector1: connector1 {
         /*
          * Nexus node for the GPIO available on the connector.
          * GPIO 0 (Pin A GPIO) is connected to GPIO 12 of the SoC gpio
          * controller
          */
         #gpio-cells = <2>;
         gpio-map = <0 0 &soc_gpio 12 0>;
         gpio-map-mask = <0xf 0x0>;
         gpio-map-pass-thru = <0x0 0xf>;

         export-symbols {
           connector = <&connector1>;
         };
     };


With that export-symbols node, an overlay applied on connector1 node can 
have the symbol named 'connector' resolved to connector1. Indeed, the 
export-symbols node available at connector1 node is used when the 
overlay is applied. If the overlay has an unresolved 'connector' symbol, 
it will be resolved to connector1 thanks to export-symbols.


Our overlay using the nexus node can contains:


    node {
       foo-gpio = <&connector 0 GPIO_ACTIVE_HIGH>;
    };


It used the GPIO 0 from the connector it is applied on.

A board with two connectors can be described with:


     connector1: connector1 {
         ...
         export-symbols {
           connector = <&connector1>;
         };
     };

     connector2: connector2 {
         ...
         export-symbols {
           connector = <&connector2>;
         };
     };


In that case, the same overlay with unresolved 'connector' symbol can be 
applied on both connectors and the correct symbol resolution (connector1 
or connector2) will be done.


# Alternatives


Some alternative approaches that were considered:



1. Using aliases.

Currently, it is not possible to update aliases in device tree overlays. 
I sent a patch a few weeks ago to add this support [4]. However, as was 
outlined by Rob, this can break existing drivers that used the unused 
indexes for devices not present in the aliases list.


2. Add support for phandles in `__symbols__`

This has been discussed in the following patch series [5]. However, 
since there is no way to distinguish between strings and phandles in 
devicetree (everything is bytestring), the type guessing is awkward. 
Also, the export-symbol solution is much more flexible than extending 
the old `__symbols__` node.


3. Add support for path reference resolution to overlays

An approach using `__symbols__` was proposed by Andrew Davis [6]. 
However, currently, it is difficult to support path reference resolution 
support to overlays [7]. This limitation makes it difficult to support 
connector chaining (MikroBUS -> Grove -> Addon board), which is possible 
in some connectors.


# Some other benefits to export-symbols

1. No need to enable generation of all symbols in base devicetree

Since the nodes used by connector are referenced by properties in 
`export-symbols`, the symbols table entries for these nodes will be 
generated, even if symbols generation is not enabled globally. This can 
help save space, specially in constrained devices.


2. Enables scoping symbol resolution

Does not pollute the global symbols, and can be useful outside addon 
board setups.


# Why add to specification?

I would like the ability to share the addon board overlays with 
ZephyrRTOS, which also has boards that support MikroBUS (like 
BeagleConnect Freedom [8]) and U-Boot. So it would make more sense if 
this node is part of the specification instead of linux specific.


# What's next?

I am also not sure if there is some sort of process that I have to 
follow to make changes to the device tree specification, so please 
inform me if I am missing something, or if there is some documentation 
regarding submitting proposals for new nodes.


[0]: 
https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/

[1]: 
https://lore.kernel.org/all/20250110-export-symbols-v1-1-b6213fcd6c82@beagleboard.org/

[2]: 
https://lore.kernel.org/devicetree-compiler/86a7a08c-d81c-43d4-99fb-d0c4e9777601@beagleboard.org/T/#t

[3] 
https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping

[4]: 
https://lore.kernel.org/all/20241110-of-alias-v2-0-16da9844a93e@beagleboard.org/T/#t

[5]: 
https://lore.kernel.org/devicetree-compiler/44bfc9b3-8282-4cc7-8d9a-7292cac663ef@ti.com/T/#mbbc181b0ef394b85b76b2024d7e209ebe70f7003

[6]: https://lore.kernel.org/lkml/20240702164403.29067-1-afd@ti.com/

[7]: 
https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-b47f96dc7710@beagleboard.org/T/#m8259c8754f680b9da7b91f7b7dd89f10da91d8ed

[8]: https://www.beagleboard.org/boards/beagleconnect-freedom


Best Regards,

Ayush Singh

