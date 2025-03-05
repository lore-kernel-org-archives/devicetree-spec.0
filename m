Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F962E338C
	for <devicetree-spec@vger.kernel.org>; Wed,  5 Mar 2025 07:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160836; cv=none; b=IK+UU+GCHXCMrkzwLEcmeDXl0smOgn64YoPcGd4UkIbCXrM2HGXiyFnvbDLSpF/EF2bXsRSW5EHGDvNuV1O75YA36kvOM6xZmCcVu89PkFl+PI7TR9V8W9kMzJJbYVYfzSRFp2ZF9uxEAk99CHjt/TVYBYMMqCgxkuliiacc38U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160836; c=relaxed/simple;
	bh=foE19zEFWVgX45VfQG17mnrHGuKB7o1WEvzgm6MgRGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tR0gf+4WDbd11Ov3jf09MIx7zBwkm/NiB7Z4IE3eFEMq2YxKanLGBEW1OpoOK/aneTMUp7WygouxqUQmUN5BJWJPQlaMSBDNwxZLdU3Bbr1GhDDW9h3Uz8LtPm5Oh1/IVgGRxd4+wCFzQKyVdQqxGBbNHwYglX/xNQf/nI4p2e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AJrpQ/I+; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AJrpQ/I+"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F952442CE;
	Wed,  5 Mar 2025 07:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741160832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BxewYtZ3b2c3O8j1XmKwbWnuowSMJNR1iZV56HYaFtQ=;
	b=AJrpQ/I+X9MQlcjIZe8xrAZ9xKhAs1qOY0MQ1v2K3F0LV73ZztuT44WdRfMdTM9rm+XCOP
	7+o6GfanufqEDCNC0FBj4uolIBZ5hfaeoBpABuq2eMP3aHsNZms7YxDO4Mbcy0w7go8wKE
	ZUM5kCZGmtHnogNfJIk/tM5caftMfK7o8W3kG6VrPMZ7OWZIQ7v1GR5k/5ew6R9rs/C+6J
	z8tL4H9DVqxnI1JnwvqRklNiqi1xMLiTl1jE1vi1xzQ1HMDs8FecFXhvq7sJOLVfNYeKkT
	Jqx3HV1cBGSIEOTnp8kd3kcUPT8+AolQBdhDh5qbBwjEw3pq9I0aX9V+KqZuvg==
Date: Wed, 5 Mar 2025 08:47:07 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, Deepak Khatri
 <lorforlinux@beagleboard.org>, Robert Nelson
 <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com, Andrew Davis
 <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Robert Nelson
 <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, David Gibson
 <david@gibson.dropbear.id.au>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Grant Likely <grant.likely@secretlab.ca>, Dhruva Gole <d-gole@ti.com>,
 devicetree-spec@vger.kernel.org
Subject: Re: [PATCH] Add new `export-symbols` node
Message-ID: <20250305084707.51c5a0f5@bootlin.com>
In-Reply-To: <20250225-export-symbols-v1-1-693049e3e187@beagleboard.org>
References: <20250225-export-symbols-v1-1-693049e3e187@beagleboard.org>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdegvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepjhhkrhhiughnvghrsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtoheplhhorhhfohhrlhhinhhugiessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehrohgsvghrthgtnhgvlhhsohhnsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepnhgvnhgrugdrmhgrrhhin
 hhkohhvihgtsehmihhkrhhovgdrtghomhdprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehrohgsvghrthgtnhgvlhhsohhnsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Ayush,

On Tue, 25 Feb 2025 11:32:21 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

> `export-symbols` is designed to be a local replacement of global
> `__symbols__` allowing nodes to define aliases to nodes in a tree, which
> will take precedence over the aliases defined in the global `__symbols__`.
> 
> Having a way to allow node local aliases helps in usecases such as
> connectors and addon-boards, by allowing decoupling of
> overlays/devicetree nodes of addon-board from the base connector.
> 
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

Thanks for the patch.

...

> +``*/export-symbols`` node
> +-------------------------
> +A devicetree node may have an export-symbols child node
> +(`*/export-symbols`) that defines one of more export-symbol properties.

"one or more" instead of "one of more".

With that fixed,

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
