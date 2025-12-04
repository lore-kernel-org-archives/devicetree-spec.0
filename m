Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344E8342C8E
	for <devicetree-spec@vger.kernel.org>; Thu,  4 Dec 2025 13:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764855888; cv=none; b=aZiJ60raHNfv+VkAgJpukAAnF7SjIWPB347I/nKqzUX6s6Rt3YjhOGnfPPBzh/B95NCfeS6sStzJfw62R1JZAdbMVf3UEjRhp/gD8Pv5w9NNn229gOX//pAuRWWCKmYwS/HpyGQEiPMj/OprfRwFdiyhEiuPqKqVlldNR1FHXrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764855888; c=relaxed/simple;
	bh=ZvM10WshWr8JGROdGApepYVp78yczlk6/NQPqN4tIMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lNq6GZlEHQ3xzwb6C8mwN1UtPah3aynToVVKKYFHgQv3YuDFRSxdsbcuyvI9R2T13cdd2RGQB2OSd+zo1BSwW6qzeMVD+zHPJikf6TNM5edQEGqVPX98JL2CmtGnqm2snAnvsXJaNsFDGALZkJgQonm/+Pl/Zfk9uSUHPUMed+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ulUa4rlc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ulUa4rlc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DCFC19421
	for <devicetree-spec@vger.kernel.org>; Thu,  4 Dec 2025 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764855887;
	bh=ZvM10WshWr8JGROdGApepYVp78yczlk6/NQPqN4tIMw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ulUa4rlcj25AUdnF3m53zWl27kkxUtIoQqdc1NdzeOPu75V8cLDLUuOXGSlZJytzW
	 6MtGWPPnkQUlNBhXxILGH18y91RPQvZa2OmWo0k9o/ylVusVNN8+/kW38AvPjQiGJw
	 ZUK46W2FWrbXYJ7LxKTwZ+OEm4n1aO92fViR3ZhgzjI9EsyHyeojMxJGKxSkHmH7Q+
	 1Y4wKhcgQfPihUpH4V2yUnA3GnqXjQSvWxGOpv9k9TernORZOFI6g/TdhkZUOsQSgV
	 JsPeQQOphqvzNqTYSFOQl0uQIyRJ8ZgAbv4eXc656/PUKcyEsXdt77jx8NIrrb/y3c
	 6DWRINaQBsd+A==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so1342789a12.0
        for <devicetree-spec@vger.kernel.org>; Thu, 04 Dec 2025 05:44:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmFnOxhmvUEznu4V2Ym+x2Ek7AQlAmwpzPUL/kuiqOjSjKAbwbWT2hFnatuelgq9xUv642kYzI4xF2f2Lc+5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA52my+R7SCsbVCFRf7h3f5zO3TTxtqnOxn4doc3i/OzsgS7ai
	RaCE9WkSGVUqOksFvtFQ1mSvBwH2M0obHRiTtwjPYdWFVlZLprVoGFez4OY4M5S+q0yjBiKBk2H
	95RLXOahyg94I0JlII/q0zW/5gmBpEw==
X-Google-Smtp-Source: AGHT+IHV2mFwouZ30hgrfnPQadEB8qUPgVCkNAwHE4hpseB76CwRzh29W5r89Oe79KUjBiYxuTFK/LQvTRxq2ECiTJ0=
X-Received: by 2002:a05:6402:34c5:b0:647:9945:634b with SMTP id
 4fb4d7f45d1cf-6479c55339emr6199215a12.30.1764855885212; Thu, 04 Dec 2025
 05:44:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aRs-DaayhtQTtFXj@pengutronix.de> <9e14fb8e-af84-4072-b0ac-9ead882782be@kernel.org>
 <CAL_Jsq+=v96eP6V+5Ehi9EQT3iKKU7=t7kvJ-WSA+1WCHDuHEA@mail.gmail.com>
 <07ee3540-d0c1-436e-9e1d-db1952f609a6@kernel.org> <bcb359cf-0e8a-46ec-9f69-51c4c9e8874e@pengutronix.de>
 <6638e499-2320-41c9-b720-faf4f976e476@kernel.org> <34bd1a0d8e579aba0a6a88039006500fe822ef3d.camel@ew.tq-group.com>
 <dd589476-56df-4565-b4cb-e34f0d7d5559@kernel.org> <47903a88-8de9-4ac6-9111-c85ed1428ff0@pengutronix.de>
 <CAL_Jsq+9s7UTXU8YLsX=_z1fnc2H4PmReb+2mHx=+uuonqM7xQ@mail.gmail.com> <aTE_Y_JWs8kBuIE7@pengutronix.de>
In-Reply-To: <aTE_Y_JWs8kBuIE7@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Dec 2025 07:44:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLFjF7F1eCxL8CzyitGogB0Ee7iHLGf79RHbwTpo6za7g@mail.gmail.com>
X-Gm-Features: AWmQ_bmXcrNfWidfRXN-Kbl2S4Z8b86UjOh9o58O1LH_1LS4vs1VCiNQYe9oxok
Message-ID: <CAL_JsqLFjF7F1eCxL8CzyitGogB0Ee7iHLGf79RHbwTpo6za7g@mail.gmail.com>
Subject: Re: SoC-specific device tree aliases?
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree-spec@vger.kernel.org, quentin.schulz@cherry.de, 
	Marc Kleine-Budde <mkl@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 1:59=E2=80=AFAM Sascha Hauer <s.hauer@pengutronix.de=
> wrote:
>
> On Wed, Dec 03, 2025 at 11:51:28AM -0600, Rob Herring wrote:
> > On Wed, Dec 3, 2025 at 5:37=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutron=
ix.de> wrote:
> > >
> > > Hi,
> > >
> > > On 12/3/25 12:08 PM, Krzysztof Kozlowski wrote:
> > > > On 03/12/2025 11:36, Matthias Schiffer wrote:
> > > >> On Wed, 2025-12-03 at 11:25 +0100, Krzysztof Kozlowski wrote:
> > > >>> On 03/12/2025 11:16, Ahmad Fatoum wrote:
> > > >>>> Hello Krzysztof,
> > > >>>>
> > > >>>> On 11/17/25 5:29 PM, Krzysztof Kozlowski wrote:
> > > >>>>> On 17/11/2025 17:06, Rob Herring wrote:
> > > >>>>>>> So you want it to be an ABI for barebox, sure, just make it a=
 binding.
> > > >>>>>>
> > > >>>>>> What do you have in mind? Other than standard names for the al=
iases,
> > > >>>>>> what can we check here? That a specific alias points to a spec=
ific
> > > >>>>>> path? That would be a bit too much IMO. That would be equivale=
nt to
> > > >>>>>> specifying possible values in 'reg' for all devices.
> > > >>>>>
> > > >>>>> Binding with pattern or list of needed alias names, referenced =
by given
> > > >>>>> soc-platform top-level schema.
> > > >>>>>
> > > >>>>> One of the points is to make it explicit and obvious (e.g. to A=
rnd or to
> > > >>>>> me if I forget, because I follow the same logic of aliases per =
board)
> > > >>>>> that these aliases are used outside of kernel.
> > > >>>>>
> > > >>>>> Just because ufs/mmc/spi can be used that way, does not mean we=
 should
> > > >>>>> accept any possible alias into soc.dtsi.
> > > >>>>
> > > >>>> I can't see how this could work. A number of boards renumber MMC=
 devices
> > > >>>> in a different manner than the SoC reference manual:
> > > >>>>
> > > >>>> - Changing the alias numbering is an ABI break, because Linux de=
rives
> > > >>>> its /dev/mmcblkX numbering from it
> > > >>>
> > > >>> First, why the alias would change? Isn't the board following the =
SoC
> > > >>> numbering in 99.9% cases?
> > > >>
> > > >> At least for our TQ-Systems boards, we have a convention based on =
usage (mmc0:
> > > >> eMMC, mmc1: SD card; serial0 is often the console) rather than fol=
lowing the SoC
> > > >> numbering; that is, we're using the aliases as a form of hardware =
abstraction
> > > >> rather than hardware description.
> > > >
> > > > Huh, does it even match numbering on the schematics / board / user-=
guides?
> > > >
> > > > I would prefer not to create bindings purely because some existing =
DTS
> > > > code is not matching our expectations. However there could be a cas=
e
> > > > where board numbering is different than soc number and we want to k=
eep
> > > > aliases configured for board.
> > > >
> > > > Basically what you propose here is the discouraged instance ID disg=
uised
> > > > under one more 'alias' which is not really alias. It's just an inst=
ance
> > > > ID. There is no other use of soc-aliases beside instance ID.
> > > >
> > > > I see the problem you want to solve, I agree it is worth solving an=
d I
> > > > agree that DT is the place for this mapping between register value =
and
> > > > device node. However solution of discouraged instance ID is just...
> > > > well, discouraged, so not optimal. I don't have particular advice e=
xpect
> > > > a dedicated property for each device in such case.
> > >
> > > How do we move forward here? I don't think we can change the nature o=
f
> > > /aliases being board-specific now without breaking users.
> > >
> > > Does this make the addition of /soc-aliases (or /soc/aliases?) more
> > > palatable?
> >
> > No.
> >
> > Thinking about this some more, I'm not sure that something aliases
> > based is even the right approach. Let's back up to the original
> > problem instead of talking about a problem concerning a possible
> > solution.
> >
> > You have a platform specific register with values (or from 1 or
> > multiple fields) that you need to map to devices in DT. That's it.
> > That could be solved like this:
> >
> > bootsource-map =3D
> >   <0x2 &mmc0>,
> >   <0x3 &mmc1>,
> >   <0x10 &spi0>,
> >   ...;
> >
> > Simple. The first value is platform specific. Maybe it is several
> > fields (e.g. device type, instance) merged together. Doesn't matter.
>
> That's an interesting approach and I like it.
>
> I am not sure though how the platform specific value could be composed.

It's platform specific, so however it wants and not my problem.

> The easiest way would be if it maps to some register values. This works
> well when there's a bitfield with only a few bits which specifies the
> bootsource, but not so when there are many bits. On TI AM62x for example
> we have 4 bits specifying the primary bootsource, 3 bits specifying the
> backup bootsource and 1 bit specifying if we are booting from the
> primary or from the backup bootsource. This means we have an array with
> potentially 256 entries with many holes and many different values
> pointing to the same bootsource. We could reduce the number of array
> entries by specifying a mask for each value. I am worried also that the
> initial contributor might for example forget about the backup bootsource
> and only upstreams primary bootsource, so we would have to modify
> existing values for the primary bootsource when adding the backup
> bootsource.

It's a map, not an array so there should be no holes. The entry index
is not significant. In this example, the platform just defines the
cell as:

<primary_or_sec:16><sec_source:15:8><primary_source:7:0>

You could fit it all in 8-bits, but I spaced it out in case the next
SoC needs another bit.

A mask value would be okay until you have 2 different registers and
then you need a variable number of cells. And then I could imagine
someone will want to define the register address for each cell in the
name of a 'generic binding'. That's not what I want to see.

> How about only adding the phandles to bootsource-map, like
>
> bootsource-map =3D <&mmc0>, <&mmc2>, <&spi0>, ...;
>
> New entries must then only be added at the end, existing entries must
> never be changed.

That would work too. Then you just have the index to register value
lookup in code. Doesn't matter to me too much. The only downside I see
is having to enforce that people don't try to insert entries in the
middle.

Rob
