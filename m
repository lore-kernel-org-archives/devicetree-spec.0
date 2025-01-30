Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000143B19A
	for <devicetree-spec@vger.kernel.org>; Thu, 30 Jan 2025 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738260475; cv=none; b=D6zGUdkDBTEyLfGJnMj0G7sgiq4NWrfQwJOusztOz3VOeQ5PaClAe5QZB4q6wOXCv3jnNom7SckjMzijeMsmhigUR0RL/jUe2QX9sIyen/s6IGQP0rNPU9/4l1N9vtRhtNldw2eofhYIkt4MHV7oFco31FDSs8uqmxqx13I/qT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738260475; c=relaxed/simple;
	bh=BBpyurZaGH/J4qu9ytdShc2qVsjnPLbv4gHzV6YD1as=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hVIWo7SNP+sRvfeosXiB57gX/uAXn8YKFVtVYTCYntlnzqD0JegN9PHvDErzoRh74l1aDnQPqLUX1G29BRd9J11D5PZtICE3ZCK40C1o5R8z76w3GryYB8vuuNF3phTTjE6arAAZLRIAKOFxFUAjB7fMzD3yV/U3oTEzRT09O6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CkO1Dsgu; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CkO1Dsgu"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AEB54326B;
	Thu, 30 Jan 2025 18:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738260469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UhJ5l8IfJO089emYzBnS/IomDkVJiRlU+jecPNAm8uU=;
	b=CkO1DsgumfD0LvPHusLqmVUSNz36TwSs8IoPvIJfKLFcK/dAV7Eun0UqPGW01uJvk04es+
	woCZlvxTdwIwYs9o3d150h27IZ+fGREI0zZd7fCyBfIy+awTFIe3JWIqDxjK99S7SVoeE3
	zxfhRJVpLqWhAdpXanJvrxMJ0nAqaapua7LvpghIDgseLFjVM1V/5tgZTnLSye5ihfiSSC
	1/hno29WOIiJJoGLnLUq77eIXFWyhcSGE7tWQjMhQahU4lYIgp2B6Ty43aQCzroUgaLliB
	DDRQmiUhts3z/eYS5SW5GDWHuiYKE/dS9kaMAYJQ9/QnCmOaTzAK+gNYi04Img==
Date: Thu, 30 Jan 2025 19:07:45 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Ayush Singh <ayush@beagleboard.org>, Jason Kridner
 <jkridner@beagleboard.org>, d-gole@ti.com, Deepak Khatri
 <lorforlinux@beagleboard.org>, Robert Nelson
 <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com, Andrew Davis
 <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Robert Nelson
 <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, David Gibson
 <david@gibson.dropbear.id.au>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 devicetree-spec@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [RFC] Adding export-symbols to specification
Message-ID: <20250130190745.290376a7@bootlin.com>
In-Reply-To: <c1224497-69cc-4a76-a63f-4445e341c374@cherry.de>
References: <024685af-4694-4c22-bf83-a04dde6e32bd@beagleboard.org>
	<c1224497-69cc-4a76-a63f-4445e341c374@cherry.de>
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
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeihedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeejlefgkeduhfffveegueeguefhvdfgfedtueefkedtveefkeelheekfefghfeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpthhhvghosghrohhmrgdqshihshhtvghmshdrtghomhdplhhptgdrvghvvghnthhsnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgur
 dhorhhgpdhrtghpthhtohepjhhkrhhiughnvghrsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepugdqghholhgvsehtihdrtghomhdprhgtphhtthhopehlohhrfhhorhhlihhnuhigsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtoheprhhosggvrhhttghnvghlshhonhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehnvghnrggurdhmrghrihhnkhhovhhitgesmhhikhhrohgvrdgtohhmpdhrtghpthhtoheprghfugesthhirdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Quentin,

On Thu, 30 Jan 2025 17:47:16 +0100
Quentin Schulz <quentin.schulz@cherry.de> wrote:

> Hi Ayush,
> 
> This is actually quite interesting. I don't know exactly how far we 
> could push this.
> 
> FYI, we have a Q7 carrierboard which supports three different modules 
> today. This carrierboard currently has two adapter boards that are 
> compatible with all three modules. One is Haikou Video Demo, see patch 
> here: 
> https://lore.kernel.org/linux-rockchip/20241127143719.660658-4-heiko@sntech.de/
> 
> We could resolve differences in i2c bus by adding another label to the 
> bus node that is exposed on the connector, so that isn't much of an 
> issue. MIPI DSI PHY and controller may be a different story as those may 
> have different bindings that would make it difficult to support with one 
> overlay? Haven't checked yet though. See [1] and [2] for the DTS (not 
> yet overlays...) of the other two SoM that this adapter works with. 
> However, this would resolve the issue of having different GPIOs for 
> reset and interrupt lines. Anyway, I'm not sure this export-symbols 
> stuff would actually help us, just being curious here, will keep an eye 
> on it but probably won't be able to help much.
> 
> [1] 
> https://git.theobroma-systems.com/puma-linux.git/tree/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dts?h=v6.6.39-puma
> [2] 
> https://git.theobroma-systems.com/puma-linux.git/tree/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dts?h=v6.6.39-puma
> 

Related to buses like i2c or even DSI, we are working on it.

We have presented the big picture in
  https://lore.kernel.org/all/20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com/
When this series was sent, export-symbols and nexus node were not present.
A talk has been done at Plumbers:
  https://lpc.events/event/18/contributions/1696/
An the nexus node came from Plumbers discussion and export-symbols came right
after in order to solve symbols resolution.

Back to i2c bus, we have proposed the following:
  https://lore.kernel.org/all/20240917-hotplug-drm-bridge-v4-5-bc4dfee61be6@bootlin.com/

I recently took the i2c topic and I plan to send an updated iteration with
issue fixed using the 'i2c-parent' and 'i2c-bus-extension'.

On DSI bus, my colleague Luca is working on it. He already extracted specific
DRM modification out of the big picture and sent a dedicated series:
  https://lore.kernel.org/all/20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com/

I hope those pointers will show you the direction we take and maybe help
in your issues.

> On 1/27/25 2:45 PM, Ayush Singh wrote:
> [...]
> > A board with two connectors can be described with:
> > 
> > 
> >      connector1: connector1 {
> >          ...
> >          export-symbols {
> >            connector = <&connector1>;
> >          };
> >      };
> > 
> >      connector2: connector2 {
> >          ...
> >          export-symbols {
> >            connector = <&connector2>;
> >          };
> >      };
> > 
> > 
> > In that case, the same overlay with unresolved 'connector' symbol can be 
> > applied on both connectors and the correct symbol resolution (connector1 
> > or connector2) will be done.
> >   
> 
> I'm not sure to understand how the tooling would figure out to which 
> connector of the baseboard should the overlay be applied?
> 
> In the case of a single connector and a single overlay, that's fine. But 
> in the case of 2+ connectors, 2+ adapters but a single overlay, how does 
> the system know which connector it should resolve the "connector" part 
> in the overlay? Is there some tooling involved? E.g. providing an 
> argument (like which connector from the board to use?). Or are you 
> expecting that applying the overlay once will pick connector1 and 
> applying the overlay a second time would pick connector2? If you have 
> multiple overlays for different adapters using this connector 
> abstraction, the first one to be applied would be the on the first 
> connector and then the second on the second one? What if I have nothing 
> connected on connector 1 but on connector 2, how do I specify to which 
> connector the overlay should apply?

In my case, I have a driver for the connector and our driver apply the
overlay.

The symbol resolution is done at runtime by the kernel when the overlay is
applied by the driver.
  https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/

The related driver applying the overlay:
  https://lore.kernel.org/all/20240917-hotplug-drm-bridge-v4-8-bc4dfee61be6@bootlin.com/
Even if some modification are still needed in this driver, the base ideas are
already present.

Best regards,
Hervé
