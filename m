Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7372288F2
	for <devicetree-spec@vger.kernel.org>; Wed,  5 Feb 2025 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747938; cv=none; b=XPvBvjh/+2Q6i1l+op//y7DUlGLTlR4jyzvKQcYKIlGn1HuJoUKJxrWgb++qSFBZmygXQWotyA7LmdVX1/iu8GMnXf4H2owQbLh0BKiufviCPlbTYykFX+qgpEP3h0IdXbggPZV+0b7D4qU2t/07NrzNvioX9UeTDw23sqOIqEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747938; c=relaxed/simple;
	bh=FJGaL+8Zd0OH7FGmkXjIK2hW2kAkjQWJ4ktY42yrlXw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F/ELgSlwZSxKZqy5EcaOPDiTVStE79ar27pEQgEQW5AB8+QmclXzOMsfLdc2L4m+koio53PZMuINMa0c62X9wsRoF0jlOQJIBZeqVXQhm6xlAytW4NzpGjiyMBkZI9BvSyYPjsZbR/IIdiwwWMbcN6E6JMexnrJMs7UuBrhslJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OtXIvZuH; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OtXIvZuH"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13A4643147;
	Wed,  5 Feb 2025 09:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738747928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kCwWFbWfExNqZBgl/dF5pi9fPpi80dkdgdJxCSo8zUQ=;
	b=OtXIvZuH08wM+5k3qCYiNz07UhB6pRKtY9nHe88CQ2bw8szU/l8VEqRznBVnFYE2T+36g7
	mOz1lymr23sg+5wSQDLxYuysx+2eNyyQDoDVUaiixYM/LX9NfwkhAYJ7N1D0I/SVwRJu1R
	Q4/I5ey0p7WbRe1ja9k75yR/lah8M0Rp+TB7GK0Y8D4JCLOInqHuqXsn7kt3mHCvQ+Do2l
	oXfcB1HymAESpa07OdBaK8JRAJbo3EnSbB4/NriuNN6+oDjjOgRW5VNnmyiQgEJBG1J4yq
	V3OHECzZcxFgZ3AeOkD2gJC7VibXUkTbpsgehb9KlUicVGiFMGrpjYbpRsfpbA==
Date: Wed, 5 Feb 2025 10:32:04 +0100
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
Message-ID: <20250205103204.100f4b8c@bootlin.com>
In-Reply-To: <e178299f-3dbd-4a33-bde8-08f28af353df@beagleboard.org>
References: <024685af-4694-4c22-bf83-a04dde6e32bd@beagleboard.org>
	<20250127162043.48552da0@bootlin.com>
	<d5f629f5-68d0-4c41-be62-1f1acee3db64@beagleboard.org>
	<20250204202157.202230fe@bootlin.com>
	<e178299f-3dbd-4a33-bde8-08f28af353df@beagleboard.org>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehjkhhrihgunhgvrhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopeguqdhgohhlvgesthhirdgtohhmpdhrtghpthhtoheplhhorhhfohhrlhhinhhugiessggvrghglhgvs
 ghorghrugdrohhrghdprhgtphhtthhopehrohgsvghrthgtnhgvlhhsohhnsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepnhgvnhgrugdrmhgrrhhinhhkohhvihgtsehmihhkrhhovgdrtghomhdprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com

Hi Ayush,

On Wed, 5 Feb 2025 01:53:54 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

> On 2/5/25 00:51, Herve Codina wrote:
> 
> > On Tue, 4 Feb 2025 22:54:52 +0530
> > Ayush Singh <ayush@beagleboard.org> wrote:
> >  
> >>> You have perfectly summarized the export-symbols goal and the benefit of
> >>> this new feature.
> >>>
> >>> I am waiting for feedback from other people. I hope we will move forward
> >>> on this topic and unblock several users (me included) stuck on this real
> >>> issue.
> >>>
> >>> Thanks a lot!
> >>>
> >>> Best regards,
> >>> Hervé  
> >> While working on a Patch series to the specification itself, I realized
> >> that I was missing some edge cases, so wanted to discuss those:
> >>
> >> # Scope
> >>
> >> Should export-symbols only be used to resolve the properties in parent,
> >> or should all other children (and their decedents) use the
> >> `export-symbols` for resolving phandles and path references?
> >>
> >> For example, should the following work:
> >>
> >>
> >> parent {
> >>
> >>     sibling {
> >>
> >>         led = <&gpio 0 GPIO_ACTIVE_HIGH>
> >>
> >>     };
> >>
> >>
> >>     export-symbols {
> >>
> >>         gpio = <&my_gpio1>;
> >>
> >>     };
> >>
> >> };
> >>
> >>
> >> This would also mean that bottoms up lookup needs to take place for all
> >> `export-symbols` that might be present in path to root, before using top
> >> level `__symbols__` or `/aliases`.  
> > I restricted the use of export-symbols node when an overlay is applied 
> > at a node
> > which contains an export-symbols sub-node.
> >
> > In your example, If you apply an overlay at parent node, your 
> > export-symbols
> > is used but if you apply an overlay at sibling node, your 
> > export-symbols is
> > not used.
> >
> > Of course if your overlay applied at parent node looks like the following:
> >
> > __overlay__ {
> > sibling {
> > prop = <&gpio>;
> > };
> > };
> >
> > &gpio will be resolved using your export-symbols. __overlay__ is applied
> > at parent -> visible in the overlay.
> >
> > If the base device-tree looks like this:
> > parent {
> > sibling {
> > export-symbols {
> > gpio = <&my_gpio1>;
> > };
> > };
> > };
> >
> > The same overlay applied at parent will failed.
> > Indeed, no export-symbols is available at parent node and so the
> > gpio symbols used by the overlay will not be resolved even
> > if an export-symbols exists in the sibling node.
> > To see this export-symbols from the overlay, the overlay has to be applied
> > at sibling node and not parent node.  
> 
> Yes, but adding export-symbols to specification would mean defining the 
> behavior in base devicetree as well.
> 
> 
> ```
> 
> \ {
> 
>      parent {
> 
>          export-symbols {
> 
>              gpio = <&main_gpio0>;
> 
>          };
> 
>      };
> 
> };
> 
> 
> &parent {
> 
>      led = <&gpio 0 GPIO_ACTIVE_HIGH>
> 
> };
> 
> ```
> 

In this example, we can consider that 'led = <&gpio 0 GPIO_ACTIVE_HIGH>' is
applied to the parent node (&parent).

Suppose:
 \ {
      node-one {
	  export-symbols {
		gpio = <&main_gpio0>;
          };
 
	  node-two {
          	export-symbols {
              		gpio = <&main_gpio1>;
          	};
	  };
      };
 };

&node-one {  <--- Applied to node-one
	my-gpio = <&gpio>;   <--- &main_gpio0 from node-one.export-symbols
};

&node-one { <--- Applied to node-one
	node-two {
		my-gpio = <&gpio>;   <--- &main_gpio0 from node-one.export-symbols
	};
};

&node-two { <--- Applied to node-two
	my-gpio = <&gpio>;   <--- &main_gpio1 from node-two.export-symbols
};

Suppose this other base DT
\ {
	node-one {
		export-symbols {
			gpio = <&main_gpio0>;
		};
		my-gpio = <&gpio>;  <--- Not allowed as there is no notion of
				         fragment applied. my-gpio was not
					 "applied" but already present in the
					 node description
	};
 };

Two questions:
- Does it make sense ?
- Is it easily implementable ?

> 
> It might not make sense to add it to devicetree specification if the 
> node does not function in normal devicetree context.
> 
> >>
> >> # Export symbols phandles
> >>
> >> Can export symbols reference each other? For example is the following 
> >> valid:
> >>
> >>
> >> parent {
> >>
> >>     export-symbols {
> >>
> >>         shadow_gpio = <&my_gpio1>;
> >>
> >>         gpio = <&shadow_gpio>;
> >>
> >>     };
> >>
> >> };  
> > For sure, not planned.
> >
> > Also, maybe I missed something but I am not sure you can have a
> > phandle referencing a property.
> >
> > In your example, shadow_gpio is a property, even if we add a label
> > to this property i.e.
> > label_shadow_gpio: shadow_gpio = <&my_gpio1>;
> >
> > How can we set:
> > gpio = <&label_shadow_gpio>;  
> 
> Well, technically, all phandles actually just reference a property since 
> they are resolved using the properties defined in `__symbols__` node or 
> `/aliases`. So it is pretty simple to add the functionality described above.

I think in __symbols__ we have labels not phandles.
At runtime, in the end, a phandles are numbers.

  some-node {
	phandle = <0x12>;
  };

  other-node {
	ref-to-some-node = <0x12>; <--- It references a node which has phandle == 0x12
  };

> 
> > Best regards,
> > Hervé
> >  
> 
> 
> I have been thinking about some alternative approaches as well, and 
> something that sounds nice is `/ephimeral-symbols`. Let me explain what 
> I mean:
> 
> `/ephemeral-symbols` can be a global node whose properties have a single 
> phandle as value. For example:
> 
> 
> / {
>      ephemeral-symbols {
>        connector1 = <&connector1>;
>        gpio = <&my_gpio1>;
>      };
> };
> 
> 
> This node will take precedence over `__symbols__` and will be used for 
> symbol resolution. However, it will never be present in the compiled 
> devicetree blob.
> 
> In case of base devicetree, it can be used to generate symbols for 
> specific nodes:
> 
> 
> / {
>      connector1 {
>          prop = "1";
>      };
> 
>      ephemeral-symbols {
>          connector1 = <&connector1>;
>      };
> };
> 
> 
> Will compile to:
> 
> 
> / {
> 
>      connector1 {
>          prop = "1";
>      };
> 
>      __symbols__ {
>          connector1 = "/connector1";
>      };
> 
> };
> 
> 
> In case of addon board overlay setup, it can be used in a similar way to 
> the __symbols__ proposal by Andrew [0].
> 
> 
> So you have the base devicetree:
> 
> 
> / {
> 
>      connector1 {
>      };
> 
>      connector2 {
>      };
> 
>      ephemeral-symbols {
>          connector1 = <&connector1>;
>      };
> };
> 
> 
> adapter overlay:
> 
> 
> /dts-v1/;
> /plugin/;
> 
> &{/} {
>      ephemeral-symbols {
>          ABC_CONNECTOR = <&connector1>;
>      };
> };
> 
> 
> addon board overlay:
> 
> 
> /dts-v1/;
> /plugin/;
> 
> 
> &ABC_CONNECTOR {
> 
>      prop = "val";
> 
> };
> 
> 
> Which will end up resolving to:
> 
> 
> / {
> 
>      connector1 {
>          prop = "val";
>      };
> 
>      connector2 {
>      };
> 
>      __symbols__ {
>          connector1 = "/connector1";
>          connector2 = "/connector2";
>      };
> 
> };

You need 2 overlays and you need to have both overlay applied in an atomic
way.

adapter-connector1.dtso then addon.dtso

You should avoid this kind of non atomic flow:
  adapter-connector1.dtso
  adapter-connector2.dtso  <--- ABC_CONNECTOR changed
  addon.dtso <--- ABC_CONNECTOR from adapter-connector2.dtso: Ok
  addon.dtso <-- ABC_CONNECTOR is no more from adapter-connector1.dtso

I really wanted to avoid this extra complexity (runtime and maintenance)
involving two overlays.

With epheral-symbols, you need to use ABC_CONNECTOR as a reference and not
a phandle. I mean:
in the overlay:
  &ABC_CONNECTOR {   <--- Use a reference: ok
      some-thing;
  };

  node {
    phandle-to-connector = <&ABC_CONNECTOR>; <--- Use as phandle: ko
  };

To use a phandle, you need to have a phandle = <0x??> property set in the node
the phandle is pointing to. In your base dt:
> / {
> 
>      connector1 {
>      };
> 
>      connector2 {
>      };
> 
>      ephemeral-symbols {
>          connector1 = <&connector1>;
>      };
> };

connector2 will not have its phandle property set unless you
  - set a label and use that label in a phandle reference in your base DT.
or
  - set a label and compile with -@ flag

On my use case, my connector node is not referenced by a phandle in my
base DT, except export-symbols.
I really don't need and don't want to export all possible symbols of my
base DT (I don't use -@ option).

An other rule we try to follow on our side (me and Luca) is:
Overlays are supposed to add or remove descriptions of new or removed
hardwares and so overlays add or remove nodes and not properties in
existing node (which means modify existing hardware).

> 
> 
> It does seem like it avoids the pitfalls of [0] (no global __symbols__ 
> polluting and chaining is fine since we do not need to resize devicetree 
> to resolve path references). But it might have some other flaws I am 
> missing right now.

I don't think we pollute the global __symbols__ with export-symbols
solution :)

Related to implementation details (resizing devicetree), my turn :)

At runtime the implementation constraint is that adding a property in an
already existing node leads to a memory leak and so adding connector2 in
__symbols__ node at runtime is an issue.

Best regards,
Hervé
