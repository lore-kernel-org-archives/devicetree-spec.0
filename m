Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05174224F6
	for <devicetree-spec@vger.kernel.org>; Tue,  8 Apr 2025 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744110197; cv=none; b=mDO5SBdU0JQY0mLfPDaBCIe9J3oOu5bhpStkG/9rCY/Rf5ejfBGtwY93Iaf05QScjQYgh/tEoJk3BWL6FQY5ETTUXXWH1NELp0vyYqiegUY/u5vLTD1lj9G/SZfDlRaV/WYiTvKy/ZGxg6DBfa6ttvmjxGqg1rUbIgUQrb4889s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744110197; c=relaxed/simple;
	bh=dS03fMsotkBOk5tvocqlF9h4my2JMJfMQ948BuE6aeM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DND9j282K3x0MhzVxbLDpc0qDVvsS2lrR1L6Ohk6aqk00XRp570Efv7mRJyEtaAmudoWQ1CPrPxRHj+zdoPYTUQFUNt/x8FtztqJX9swq48YzNhXg1VEWJIaO4FPXCCafqZ8jEqbtFd8YNH1IstmLAq9ZU5sBUamrRXaFO5DUlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iV1ejQSk; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iV1ejQSk"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F140440D5;
	Tue,  8 Apr 2025 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744110189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0yL4OjkCyWnSVAvEVu1F8Tw0hQczFNNMADCjZH/mlE8=;
	b=iV1ejQSkq0GWARevMM1+Cb/UfJdHXQYKpidP/CBF9DEH+s1X4N60RU3VoXTehiI9t5HR5F
	c1Eh82OJoAakzlbz/bS1dg9G8k9uS/qAOhtZxnARHZcBTBV0iMRQqDwZle6ei2xKT9Y96Y
	aIxULxDYdNPktIEg0ZGyFVjdEuC+K37cz7UPglTTfkSCTvryqJF62V80OY8mSkGbGny/6f
	u7IOmGn/+txEb6jIOQiTL5DuWdy57GbZ1HG0AQipolNYJ7CRi/t677JvXYRFmVTww2J+q2
	sJcUHrPoMORsr+v5OeHf+R1M92wWSDJap8LHuikOqUBnZqLOS0AnskBfog4M2w==
Date: Tue, 8 Apr 2025 13:03:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, Deepak Khatri
 <lorforlinux@beagleboard.org>, Robert Nelson
 <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com, Andrew Davis
 <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Robert Nelson
 <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, David Gibson
 <david@gibson.dropbear.id.au>, Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Grant Likely
 <grant.likely@secretlab.ca>, Dhruva Gole <d-gole@ti.com>,
 devicetree-spec@vger.kernel.org
Subject: Re: [PATCH v2] Add new `export-symbols` node
Message-ID: <20250408130304.2e765fea@booty>
In-Reply-To: <20250323-export-symbols-v2-1-f0ae1748b244@beagleboard.org>
References: <20250323-export-symbols-v2-1-f0ae1748b244@beagleboard.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddvleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehjkhhrihgunhgvrhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehlohhrfhhorhhlihhnuhigsegsvggrg
 hhlvggsohgrrhgurdhorhhgpdhrtghpthhtoheprhhosggvrhhttghnvghlshhonhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehnvghnrggurdhmrghrihhnkhhovhhitgesmhhikhhrohgvrdgtohhmpdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheprhhosggvrhhttghnvghlshhonhesghhmrghilhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Ayush,

On Sun, 23 Mar 2025 18:37:27 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

> `export-symbols` is designed to be a local replacement of global
> `__symbols__` allowing nodes to define aliases to nodes in a tree, which
> will take precedence over the aliases defined in the global `__symbols__`.
> 
> Having a way to allow node local aliases helps in usecases such as
> connectors and addon-boards, by allowing decoupling of
> overlays/devicetree nodes of addon-board from the base connector.
> 
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

Thank you for the very detailed explanation.

There has been a lot of discussion and brainstorming about this topic,
for various use cases, and various alternatives proposed (as in the
"Alternatives" section). I think all known options have been explored,
and this is the best one definitely. To me it is very important that it
avoids polluting the whole DT namespace as __symbols__ does, and some
implementations are already public so it is proven to work in the
practice.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
