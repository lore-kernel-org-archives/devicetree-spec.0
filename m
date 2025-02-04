Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C0578F40
	for <devicetree-spec@vger.kernel.org>; Tue,  4 Feb 2025 19:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738696925; cv=none; b=ew3Y1RyRblBUV8DljXncn4+RzqR+zHXnwrFGrlgywOQ0yZxsh5I73QrwRKOS5iZaQE0ZR+zS7b/6lkBP6UMWSZ2/33YjMruui0Rvc5XhKtii0n23v2cNt5FlFgz5vNYs/BOYZpJd+R+RJlQMQirOfMOKgOFyQbWH8hSfpk1+DRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738696925; c=relaxed/simple;
	bh=f71QQbDJLEQ+2F1U9fhXk3wQ/n5fMkTz1OfcCtCd4QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XpYNAlwUEEbGkUvWUsxuIplu62LZFDCtZb54v1CTBirjUaewynf/GTnWyKAcOSI2yaA5yDG6I/yG7S+q2sSc5gUZ7elq3ZqpypZEyoxprXZcj2BX4oPQzVCKOn90dnMQqKMKzSyYN7spmELcr2+m6nxKduCjSWSrOy4PWyCXEhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Oux81m4d; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Oux81m4d"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A537544336;
	Tue,  4 Feb 2025 19:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738696921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zEtAU5G1zZj9gNzBCYUq/Cm1aRJOC4wimq99hfjQQPY=;
	b=Oux81m4dEVPAEWCZMJdR+6cBx3lGzIS2kaYP59vlo8imzjBqxcV7x7ntygN3Fu5bZX2Ie6
	dkQPWNY2bnxb0tsFUMFs+GQpUxhC1aRucWAfl8tXsAYMWOvqB/BzDmh1X/q8WPO556y3NU
	5vNDg8Hs8aFTkcWJpV8SnkBPjRHep3Tht1XBZT+kt5c9Poq1ZHKFSP7SJVuFtxr3u6p+7g
	MZaJ40DgBl3Bh9gve1EfFsySuoTb2cJpIijj65PPwMB8FGQsRB1LmipUrsOI2hNo8wl85b
	RrZMtbzWgOnkM5wbY8Ws2W4s1/DNVGsRFSj/8OECtqn52CWRb1qqAhcjqLNIIg==
Date: Tue, 4 Feb 2025 20:21:57 +0100
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
Message-ID: <20250204202157.202230fe@bootlin.com>
In-Reply-To: <d5f629f5-68d0-4c41-be62-1f1acee3db64@beagleboard.org>
References: <024685af-4694-4c22-bf83-a04dde6e32bd@beagleboard.org>
	<20250127162043.48552da0@bootlin.com>
	<d5f629f5-68d0-4c41-be62-1f1acee3db64@beagleboard.org>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehjkhhrihgunhgvrhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopeguqdhgohhlvgesthhirdgtohhmpdhrtghpthhtoheplhhorhhfohhrlhhinhhugiessggvrghglhgvs
 ghorghrugdrohhrghdprhgtphhtthhopehrohgsvghrthgtnhgvlhhsohhnsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepnhgvnhgrugdrmhgrrhhinhhkohhvihgtsehmihhkrhhovgdrtghomhdprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com

On Tue, 4 Feb 2025 22:54:52 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

> > You have perfectly summarized the export-symbols goal and the benefit of
> > this new feature.
> >
> > I am waiting for feedback from other people. I hope we will move forward
> > on this topic and unblock several users (me included) stuck on this real
> > issue.
> >
> > Thanks a lot!
> >
> > Best regards,
> > Hervé  
> 
> While working on a Patch series to the specification itself, I realized 
> that I was missing some edge cases, so wanted to discuss those:
> 
> # Scope
> 
> Should export-symbols only be used to resolve the properties in parent, 
> or should all other children (and their decedents) use the 
> `export-symbols` for resolving phandles and path references?
> 
> For example, should the following work:
> 
> 
> parent {
> 
>      sibling {
> 
>          led = <&gpio 0 GPIO_ACTIVE_HIGH>
> 
>      };
> 
> 
>      export-symbols {
> 
>          gpio = <&my_gpio1>;
> 
>      };
> 
> };
> 
> 
> This would also mean that bottoms up lookup needs to take place for all 
> `export-symbols` that might be present in path to root, before using top 
> level `__symbols__` or `/aliases`.

I restricted the use of export-symbols node when an overlay is applied at a node
which contains an export-symbols sub-node.

In your example, If you apply an overlay at parent node, your export-symbols
is used but if you apply an overlay at sibling node, your export-symbols is
not used.

Of course if your overlay applied at parent node looks like the following:

  __overlay__ {
    sibling {
       prop = <&gpio>;
    };
  };

&gpio will be resolved using your export-symbols. __overlay__ is applied
at parent -> visible in the overlay.

If the base device-tree looks like this:
	parent {
		sibling {
 
			export-symbols {
				gpio = <&my_gpio1>;
			};
		};
	};

The same overlay applied at parent will failed.
Indeed, no export-symbols is available at parent node and so the
gpio symbols used by the overlay will not be resolved even
if an export-symbols exists in the sibling node.
To see this export-symbols from the overlay, the overlay has to be applied
at sibling node and not parent node.

> 
> 
> # Export symbols phandles
> 
> Can export symbols reference each other? For example is the following valid:
> 
> 
> parent {
> 
>      export-symbols {
> 
>          shadow_gpio = <&my_gpio1>;
> 
>          gpio = <&shadow_gpio>;
> 
>      };
> 
> };

For sure, not planned.

Also, maybe I missed something but I am not sure you can have a
phandle referencing a property.

In your example, shadow_gpio is a property, even if we add a label
to this property i.e.
  label_shadow_gpio: shadow_gpio = <&my_gpio1>;

How can we set:
  gpio = <&label_shadow_gpio>;


Best regards,
Hervé

