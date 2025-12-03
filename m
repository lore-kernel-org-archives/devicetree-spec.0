Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A71D32F770
	for <devicetree-spec@vger.kernel.org>; Wed,  3 Dec 2025 17:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764784302; cv=none; b=SE2eQvWveXwmi2E8aCOsorTaCQ/lpbRXbaYDgF6DdRaZ04FAWouvKUaAAoa2SA4mjI+GB6JK9+yEiTa339kOScIAnPx5q81eCMlBsmspX4U/488c/bdJEhqA0Bo1KXWJoDtAQKFv1z/oHB5CmjSh+PWZeaOw4m+P72KjF8qvOlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764784302; c=relaxed/simple;
	bh=ABMMraB9tPMvepd0zwOKIL1tb1nFWaBr2Q92AKB/OlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFqEBzGKcG6muaU2YsGQLJim0g7Ag8Gf09C62gijTkNh8vMSUK7InSBlp+tA+twmJc0LnWPrRR7GfZTvq7+eO9rmRLl5mOjUy2U6XwYdU240JkQBhZzAQI/9oQDA2c3YcnQrKucF+lA48v5+pJdGdgapZN6XZAHwiGWLsfBiCxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEQOKY3k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEQOKY3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91639C116C6
	for <devicetree-spec@vger.kernel.org>; Wed,  3 Dec 2025 17:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764784301;
	bh=ABMMraB9tPMvepd0zwOKIL1tb1nFWaBr2Q92AKB/OlM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TEQOKY3kKKKqyCCLbwVzyww/9ySF2tBjZXrREVlmYLXy+y0ZCY0M57Kf4g3u2LjbF
	 NAM+6aH8oiRkDv108T0tIIpP7oucQ28ZfUk8X08dvDr5JBvs9iIqpkX25JBtRMoe/r
	 8VqzFtArHAHKC9XJFbXWxH3yJBezJHw3BjkadG+lJZDi1i8Y7m5iy0KfDgtZaJTny/
	 brJLZOSgSuhU2RDdZaqWUt5chujwlUlZzSA+kMFbNd1zLqLeDTRjCoViDNekGD/G9N
	 QlEEUl7Gb8ejC4WzVG32nJYLgfrXPUveMb69oNPmER2UTrHniMsRPGkTPPnPoS1kxe
	 Z96nSFZosFNzw==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64312565c10so10808393a12.2
        for <devicetree-spec@vger.kernel.org>; Wed, 03 Dec 2025 09:51:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUklXt2KGuzpsS55CorrTsoXU/XRWDao6/KdMkENCumzr6zXda1HwrvOZJkUGgTraDuK2NpF4ID7Q9GEA9qHu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc3NYRMP6h6A1oEtGxE6z/t8fNNB1liNKuXQD7HPzFh7BC/4rq
	jMM6HIl/VZOQZtGPw12bjJuRPsfRjPXDa4fSSlty0qBalP8pOt8YrNZKKBiqd4ZZbSIaK2LM+VC
	EoKcYt96aLBCACTzLXejlEU8ybpBS2w==
X-Google-Smtp-Source: AGHT+IGZnv3IdzCfaBgaCN9nKAbuyEt6MyarxJdGHL7jwcJM+QgpiDNKxFIa9x50mX+I6XGGNuDnJAaMWKj3UuKHzeY=
X-Received: by 2002:a17:907:6d0d:b0:b6d:3fc9:e60c with SMTP id
 a640c23a62f3a-b79ec4560a4mr7309166b.20.1764784300046; Wed, 03 Dec 2025
 09:51:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ebc08400-c16d-4ed0-b487-9aabe13bbf0f@pengutronix.de>
 <58816b68-3b09-4320-9a4e-09f2c2b2d0fa@kernel.org> <aRrcRZvdrbAmsCm_@pengutronix.de>
 <8ce701c9-6c8d-4b3e-8706-760b8aba89fc@kernel.org> <aRr6JLMplFVeHcjj@pengutronix.de>
 <e5502ec8-0c55-47ce-a9e5-62e137c9808b@kernel.org> <20251117-smooth-spiked-loon-52df28-mkl@pengutronix.de>
 <de1739a8-4677-4cc8-b501-2568b7513467@kernel.org> <aRs2y3w854vnHAzg@pengutronix.de>
 <576a9eae-7dba-47d0-ad66-0a81d1893271@kernel.org> <aRs-DaayhtQTtFXj@pengutronix.de>
 <9e14fb8e-af84-4072-b0ac-9ead882782be@kernel.org> <CAL_Jsq+=v96eP6V+5Ehi9EQT3iKKU7=t7kvJ-WSA+1WCHDuHEA@mail.gmail.com>
 <07ee3540-d0c1-436e-9e1d-db1952f609a6@kernel.org> <bcb359cf-0e8a-46ec-9f69-51c4c9e8874e@pengutronix.de>
 <6638e499-2320-41c9-b720-faf4f976e476@kernel.org> <34bd1a0d8e579aba0a6a88039006500fe822ef3d.camel@ew.tq-group.com>
 <dd589476-56df-4565-b4cb-e34f0d7d5559@kernel.org> <47903a88-8de9-4ac6-9111-c85ed1428ff0@pengutronix.de>
In-Reply-To: <47903a88-8de9-4ac6-9111-c85ed1428ff0@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Dec 2025 11:51:28 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+9s7UTXU8YLsX=_z1fnc2H4PmReb+2mHx=+uuonqM7xQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmS_JWVNCGQZnqg2TRVyQIbBacXh8MhBDhhsfFAV4-C3_H-zXYNtuWuhIY
Message-ID: <CAL_Jsq+9s7UTXU8YLsX=_z1fnc2H4PmReb+2mHx=+uuonqM7xQ@mail.gmail.com>
Subject: Re: SoC-specific device tree aliases?
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree-spec@vger.kernel.org, quentin.schulz@cherry.de, 
	Marc Kleine-Budde <mkl@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 5:37=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix.d=
e> wrote:
>
> Hi,
>
> On 12/3/25 12:08 PM, Krzysztof Kozlowski wrote:
> > On 03/12/2025 11:36, Matthias Schiffer wrote:
> >> On Wed, 2025-12-03 at 11:25 +0100, Krzysztof Kozlowski wrote:
> >>> On 03/12/2025 11:16, Ahmad Fatoum wrote:
> >>>> Hello Krzysztof,
> >>>>
> >>>> On 11/17/25 5:29 PM, Krzysztof Kozlowski wrote:
> >>>>> On 17/11/2025 17:06, Rob Herring wrote:
> >>>>>>> So you want it to be an ABI for barebox, sure, just make it a bin=
ding.
> >>>>>>
> >>>>>> What do you have in mind? Other than standard names for the aliase=
s,
> >>>>>> what can we check here? That a specific alias points to a specific
> >>>>>> path? That would be a bit too much IMO. That would be equivalent t=
o
> >>>>>> specifying possible values in 'reg' for all devices.
> >>>>>
> >>>>> Binding with pattern or list of needed alias names, referenced by g=
iven
> >>>>> soc-platform top-level schema.
> >>>>>
> >>>>> One of the points is to make it explicit and obvious (e.g. to Arnd =
or to
> >>>>> me if I forget, because I follow the same logic of aliases per boar=
d)
> >>>>> that these aliases are used outside of kernel.
> >>>>>
> >>>>> Just because ufs/mmc/spi can be used that way, does not mean we sho=
uld
> >>>>> accept any possible alias into soc.dtsi.
> >>>>
> >>>> I can't see how this could work. A number of boards renumber MMC dev=
ices
> >>>> in a different manner than the SoC reference manual:
> >>>>
> >>>> - Changing the alias numbering is an ABI break, because Linux derive=
s
> >>>> its /dev/mmcblkX numbering from it
> >>>
> >>> First, why the alias would change? Isn't the board following the SoC
> >>> numbering in 99.9% cases?
> >>
> >> At least for our TQ-Systems boards, we have a convention based on usag=
e (mmc0:
> >> eMMC, mmc1: SD card; serial0 is often the console) rather than followi=
ng the SoC
> >> numbering; that is, we're using the aliases as a form of hardware abst=
raction
> >> rather than hardware description.
> >
> > Huh, does it even match numbering on the schematics / board / user-guid=
es?
> >
> > I would prefer not to create bindings purely because some existing DTS
> > code is not matching our expectations. However there could be a case
> > where board numbering is different than soc number and we want to keep
> > aliases configured for board.
> >
> > Basically what you propose here is the discouraged instance ID disguise=
d
> > under one more 'alias' which is not really alias. It's just an instance
> > ID. There is no other use of soc-aliases beside instance ID.
> >
> > I see the problem you want to solve, I agree it is worth solving and I
> > agree that DT is the place for this mapping between register value and
> > device node. However solution of discouraged instance ID is just...
> > well, discouraged, so not optimal. I don't have particular advice expec=
t
> > a dedicated property for each device in such case.
>
> How do we move forward here? I don't think we can change the nature of
> /aliases being board-specific now without breaking users.
>
> Does this make the addition of /soc-aliases (or /soc/aliases?) more
> palatable?

No.

Thinking about this some more, I'm not sure that something aliases
based is even the right approach. Let's back up to the original
problem instead of talking about a problem concerning a possible
solution.

You have a platform specific register with values (or from 1 or
multiple fields) that you need to map to devices in DT. That's it.
That could be solved like this:

bootsource-map =3D
  <0x2 &mmc0>,
  <0x3 &mmc1>,
  <0x10 &spi0>,
  ...;

Simple. The first value is platform specific. Maybe it is several
fields (e.g. device type, instance) merged together. Doesn't matter.

And where do we put 'bootsource-map'? That could be either in the node
of the device with the boot source register(s) or alongside bootsource
in chosen. In chosen is a bit weird because that's supposed to be
things the bootloader fills in.

Now I'm pretty annoyed because like what happens many times, I
accepted bootsource and you all turn right around want to add on to
it. IOW, it didn't completely solve the problem or give me the whole
picture. Why does that matter? Because now I might say 'bootsource'
can just be the index into 'bootsource-map', but now we're stuck with
it (forever). Anything else needed in this area?

Rob
