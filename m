Received: from mx-relay82-hz1.antispameurope.com (mx-relay82-hz1.antispameurope.com [94.100.133.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7D42ED860
	for <devicetree-spec@vger.kernel.org>; Wed,  3 Dec 2025 10:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.251
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764758286; cv=pass; b=e05RPmnNVmL7RrQYYxpkkahFeSWSvbt2y/Q89vKcHBZLIayxWvl+FL7m7zrzr/+qTP9EQA5xr6IC/+KSDaeVeLayiro/7ZhCmXkjWSimxCqMawbKO0vDxYTzXLg8EPYNlY94DJoj/6ZPXReLrnSmHw5xqKAQBcbWNb40eTN2u70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764758286; c=relaxed/simple;
	bh=TncNJLmPcZDzWaziXGBOZjRq9TTtaFfqkktv+allXYQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ab9RAsZJMrmQ1Bwh67v5SfnNiqKvCSZwEC73AciUO9BxFhj+Oi/xXfoLwJFUUW7Ylnj/Ym8Em9PRTuVj1nNGz2mxIFSUYVGGbbxRqFkKxjZycT/MvX6k44hC/uK9bCydc+xkJOuN0srHJlrKtM9Gnx4w8ou85okwj3rHIfw7Ib0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qjxZrAJW; arc=pass smtp.client-ip=94.100.133.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qjxZrAJW"
ARC-Authentication-Results: i=1; mx-gate82-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=TncNJLmPcZDzWaziXGBOZjRq9TTtaFfqkktv+allXYQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764758217;
 b=E7ogNDSj78eenDwTSQgP6LaOE7vMrJJtnoS7ONpJctcv0h1/j1rmS7ZwYRFyRahrHM1W+AA0
 BrgXvbj7TziZXN3QnogaOF52KfLa15yVu3AQ9i5pDqVxdX9j6oOgU8Hr3pS4LIi79eCbTpp4iP2
 iKn5PIe7zqAg5VA7Hpplj0R6J71fI28dvqSvD4uwCBKfMeSaATJP1y8sTNX4BJDQ9S2fBu7eCYC
 plSolUFnXOtpoaT8f7qTaQiPPm0zwU9+Mxvg0OW6BqOw/pG6g3tv55qYBNUC9AkcxVGHXMHPw9V
 PT0nb/oX2iNm5j0KtVExW878Y5UhIfiIhzWKsqmO80trQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764758217;
 b=fm8qrSDOPcL5QdtD54y+ZcGDbNlbj/qG0REQ1awD1w2cAyjDjw23HGS3QaPwc8QPqmzHRTMT
 Agkv8UCCN2FmIw0l4JzIPDpRskUzz6zaAzjsFUdv8slwBO0VbbcU28SpBP1GC9X1DC/o/pvwX0T
 /88FMV+3zKI9pZ/TVXQGZg8YJwMwmoNe8T6tqd41rT+Z2LtjTc+wM4j9J8DPxwlJFrJhRGrtc6N
 DISdc0QNl9e6bqQ6HMZHMKjSuPZc8EXtLK0VOL25jkNBtt7ij9Go6zDC4yaIkjqJkr6K1i59zza
 RZ5aJMXSOb0HBW9RmOIpgwUe3JpVJI8xvChNSj3yosTTg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay82-hz1.antispameurope.com;
 Wed, 03 Dec 2025 11:36:57 +0100
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id E02BDA413EF;
	Wed,  3 Dec 2025 11:36:49 +0100 (CET)
Message-ID: <34bd1a0d8e579aba0a6a88039006500fe822ef3d.camel@ew.tq-group.com>
Subject: Re: SoC-specific device tree aliases?
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree-spec@vger.kernel.org, quentin.schulz@cherry.de, Marc
 Kleine-Budde <mkl@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Ahmad
 Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Wed, 03 Dec 2025 11:36:49 +0100
In-Reply-To: <6638e499-2320-41c9-b720-faf4f976e476@kernel.org>
References: <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de>
	 <58816b68-3b09-4320-9a4e-09f2c2b2d0fa@kernel.org>
	 <aRrcRZvdrbAmsCm_@pengutronix.de>
	 <8ce701c9-6c8d-4b3e-8706-760b8aba89fc@kernel.org>
	 <aRr6JLMplFVeHcjj@pengutronix.de>
	 <e5502ec8-0c55-47ce-a9e5-62e137c9808b@kernel.org>
	 <20251117-smooth-spiked-loon-52df28-mkl@pengutronix.de>
	 <de1739a8-4677-4cc8-b501-2568b7513467@kernel.org>
	 <aRs2y3w854vnHAzg@pengutronix.de>
	 <576a9eae-7dba-47d0-ad66-0a81d1893271@kernel.org>
	 <aRs-DaayhtQTtFXj@pengutronix.de>
	 <9e14fb8e-af84-4072-b0ac-9ead882782be@kernel.org>
	 <CAL_Jsq+=v96eP6V+5Ehi9EQT3iKKU7=t7kvJ-WSA+1WCHDuHEA@mail.gmail.com>
	 <07ee3540-d0c1-436e-9e1d-db1952f609a6@kernel.org>
	 <bcb359cf-0e8a-46ec-9f69-51c4c9e8874e@pengutronix.de>
	 <6638e499-2320-41c9-b720-faf4f976e476@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-cloud-security-sender:matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient:devicetree-spec@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay82-hz1.antispameurope.com with 4dLvFt4DBkz8nnys
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:4dd542daace045f614f4cd39a937d89e
X-cloud-security:scantime:1.847
DKIM-Signature: a=rsa-sha256;
 bh=TncNJLmPcZDzWaziXGBOZjRq9TTtaFfqkktv+allXYQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764758216; v=1;
 b=qjxZrAJWwO3QTFZEvwZ5xd88JWBRyApx7fmOAqGl3GPNxmcs1Mg1QnP6rtos0j0HrnqNc+Ff
 Htccfue8HKhktz+y+OFmlY1Vt72kDSf1X/sQMB1I4pRK+UISB7GSunKXdqS2ikKSBVs8SXeuyUG
 A6649qqCApl0Q3lKu5AfyngCOF6N/OjN/UMEirlzs0Z/7QlvMYkYQcgenOlGrINdNucqvEADLyS
 +bY2v95gAiBZmBiPqNTj6XdmyjFZgqgOlqJQheVabni6Aw7aes2/yE7Emtu5B4PyTDU96al/5k2
 nkykQ+X7qLp5kZkK3lfaVS/CQvO6oC6D1YWwF/hub37GQ==

On Wed, 2025-12-03 at 11:25 +0100, Krzysztof Kozlowski wrote:
> On 03/12/2025 11:16, Ahmad Fatoum wrote:
> > Hello Krzysztof,
> >=20
> > On 11/17/25 5:29 PM, Krzysztof Kozlowski wrote:
> > > On 17/11/2025 17:06, Rob Herring wrote:
> > > > > So you want it to be an ABI for barebox, sure, just make it a bin=
ding.
> > > >=20
> > > > What do you have in mind? Other than standard names for the aliases=
,
> > > > what can we check here? That a specific alias points to a specific
> > > > path? That would be a bit too much IMO. That would be equivalent to
> > > > specifying possible values in 'reg' for all devices.
> > >=20
> > > Binding with pattern or list of needed alias names, referenced by giv=
en
> > > soc-platform top-level schema.
> > >=20
> > > One of the points is to make it explicit and obvious (e.g. to Arnd or=
 to
> > > me if I forget, because I follow the same logic of aliases per board)
> > > that these aliases are used outside of kernel.
> > >=20
> > > Just because ufs/mmc/spi can be used that way, does not mean we shoul=
d
> > > accept any possible alias into soc.dtsi.
> >=20
> > I can't see how this could work. A number of boards renumber MMC device=
s
> > in a different manner than the SoC reference manual:
> >=20
> > - Changing the alias numbering is an ABI break, because Linux derives
> > its /dev/mmcblkX numbering from it
>=20
> First, why the alias would change? Isn't the board following the SoC
> numbering in 99.9% cases?

At least for our TQ-Systems boards, we have a convention based on usage (mm=
c0:
eMMC, mmc1: SD card; serial0 is often the console) rather than following th=
e SoC
numbering; that is, we're using the aliases as a form of hardware abstracti=
on
rather than hardware description.

Best,
Matthias


>=20
> Second, I don't think it is an ABI. We had it ~5 or ~8 years ago where
> the mmcblkX was changing based on probe ordering. Many people setups got
> broken, many people complained and the consensus reply was: please start
> finally using UUID/PARTUIID/LABEL for rootfs. Eventually we got back to
> mmcblkX stability but rule is there - if your cmdline has /dev/mmcblkX,
> then it is your problem.
>=20
>=20
>=20
>=20
> Best regards,
> Krzysztof
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
