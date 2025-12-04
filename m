Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D287A316189
	for <devicetree-spec@vger.kernel.org>; Thu,  4 Dec 2025 07:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764835194; cv=none; b=mO3EfnzcRLqe6hQVWpLXOH29I7ySWoGiat5quEjB9Uo3eujgG9KVlGWqW4/CPhe/5y/N4yUathoeVX3Qjqo7bP4fFtx6vYVG4DlP5CXdNA6I1EgwEjiGg/2d9drcXES4PGTfIEVLzSInxUbu4NuatiapKM97RCjxQIoSBoYaR2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764835194; c=relaxed/simple;
	bh=RCWfmqUC9tYTiEfiiaB6MU4TjRdoWbVCg8bm3KwKFC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olmg69WPrauF+L49/QIrwlzvpcU20LjMHyRMw57K5YswmyA4VAB/6GhpMjn3ufBzNBLbkGkO8/lZKpAkoS4i0+SOhm0Hk8tyr0tfP4xMVQHtLTQ9/b/8BOCXcK2+ueHw8GJ6qKiXv5xvks7qSA5N0BUH3/ESVYFt4gPKJA4Wx+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1vR4FQ-00041e-8f; Thu, 04 Dec 2025 08:59:32 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1vR4FP-003uaL-30;
	Thu, 04 Dec 2025 08:59:31 +0100
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1vR4FP-005UrI-2d;
	Thu, 04 Dec 2025 08:59:31 +0100
Date: Thu, 4 Dec 2025 08:59:31 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree-spec@vger.kernel.org,
	quentin.schulz@cherry.de, Marc Kleine-Budde <mkl@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: SoC-specific device tree aliases?
Message-ID: <aTE_Y_JWs8kBuIE7@pengutronix.de>
References: <aRs-DaayhtQTtFXj@pengutronix.de>
 <9e14fb8e-af84-4072-b0ac-9ead882782be@kernel.org>
 <CAL_Jsq+=v96eP6V+5Ehi9EQT3iKKU7=t7kvJ-WSA+1WCHDuHEA@mail.gmail.com>
 <07ee3540-d0c1-436e-9e1d-db1952f609a6@kernel.org>
 <bcb359cf-0e8a-46ec-9f69-51c4c9e8874e@pengutronix.de>
 <6638e499-2320-41c9-b720-faf4f976e476@kernel.org>
 <34bd1a0d8e579aba0a6a88039006500fe822ef3d.camel@ew.tq-group.com>
 <dd589476-56df-4565-b4cb-e34f0d7d5559@kernel.org>
 <47903a88-8de9-4ac6-9111-c85ed1428ff0@pengutronix.de>
 <CAL_Jsq+9s7UTXU8YLsX=_z1fnc2H4PmReb+2mHx=+uuonqM7xQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+9s7UTXU8YLsX=_z1fnc2H4PmReb+2mHx=+uuonqM7xQ@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-spec@vger.kernel.org

On Wed, Dec 03, 2025 at 11:51:28AM -0600, Rob Herring wrote:
> On Wed, Dec 3, 2025 at 5:37 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >
> > Hi,
> >
> > On 12/3/25 12:08 PM, Krzysztof Kozlowski wrote:
> > > On 03/12/2025 11:36, Matthias Schiffer wrote:
> > >> On Wed, 2025-12-03 at 11:25 +0100, Krzysztof Kozlowski wrote:
> > >>> On 03/12/2025 11:16, Ahmad Fatoum wrote:
> > >>>> Hello Krzysztof,
> > >>>>
> > >>>> On 11/17/25 5:29 PM, Krzysztof Kozlowski wrote:
> > >>>>> On 17/11/2025 17:06, Rob Herring wrote:
> > >>>>>>> So you want it to be an ABI for barebox, sure, just make it a binding.
> > >>>>>>
> > >>>>>> What do you have in mind? Other than standard names for the aliases,
> > >>>>>> what can we check here? That a specific alias points to a specific
> > >>>>>> path? That would be a bit too much IMO. That would be equivalent to
> > >>>>>> specifying possible values in 'reg' for all devices.
> > >>>>>
> > >>>>> Binding with pattern or list of needed alias names, referenced by given
> > >>>>> soc-platform top-level schema.
> > >>>>>
> > >>>>> One of the points is to make it explicit and obvious (e.g. to Arnd or to
> > >>>>> me if I forget, because I follow the same logic of aliases per board)
> > >>>>> that these aliases are used outside of kernel.
> > >>>>>
> > >>>>> Just because ufs/mmc/spi can be used that way, does not mean we should
> > >>>>> accept any possible alias into soc.dtsi.
> > >>>>
> > >>>> I can't see how this could work. A number of boards renumber MMC devices
> > >>>> in a different manner than the SoC reference manual:
> > >>>>
> > >>>> - Changing the alias numbering is an ABI break, because Linux derives
> > >>>> its /dev/mmcblkX numbering from it
> > >>>
> > >>> First, why the alias would change? Isn't the board following the SoC
> > >>> numbering in 99.9% cases?
> > >>
> > >> At least for our TQ-Systems boards, we have a convention based on usage (mmc0:
> > >> eMMC, mmc1: SD card; serial0 is often the console) rather than following the SoC
> > >> numbering; that is, we're using the aliases as a form of hardware abstraction
> > >> rather than hardware description.
> > >
> > > Huh, does it even match numbering on the schematics / board / user-guides?
> > >
> > > I would prefer not to create bindings purely because some existing DTS
> > > code is not matching our expectations. However there could be a case
> > > where board numbering is different than soc number and we want to keep
> > > aliases configured for board.
> > >
> > > Basically what you propose here is the discouraged instance ID disguised
> > > under one more 'alias' which is not really alias. It's just an instance
> > > ID. There is no other use of soc-aliases beside instance ID.
> > >
> > > I see the problem you want to solve, I agree it is worth solving and I
> > > agree that DT is the place for this mapping between register value and
> > > device node. However solution of discouraged instance ID is just...
> > > well, discouraged, so not optimal. I don't have particular advice expect
> > > a dedicated property for each device in such case.
> >
> > How do we move forward here? I don't think we can change the nature of
> > /aliases being board-specific now without breaking users.
> >
> > Does this make the addition of /soc-aliases (or /soc/aliases?) more
> > palatable?
> 
> No.
> 
> Thinking about this some more, I'm not sure that something aliases
> based is even the right approach. Let's back up to the original
> problem instead of talking about a problem concerning a possible
> solution.
> 
> You have a platform specific register with values (or from 1 or
> multiple fields) that you need to map to devices in DT. That's it.
> That could be solved like this:
> 
> bootsource-map =
>   <0x2 &mmc0>,
>   <0x3 &mmc1>,
>   <0x10 &spi0>,
>   ...;
> 
> Simple. The first value is platform specific. Maybe it is several
> fields (e.g. device type, instance) merged together. Doesn't matter.

That's an interesting approach and I like it.

I am not sure though how the platform specific value could be composed.

The easiest way would be if it maps to some register values. This works
well when there's a bitfield with only a few bits which specifies the
bootsource, but not so when there are many bits. On TI AM62x for example
we have 4 bits specifying the primary bootsource, 3 bits specifying the
backup bootsource and 1 bit specifying if we are booting from the
primary or from the backup bootsource. This means we have an array with
potentially 256 entries with many holes and many different values
pointing to the same bootsource. We could reduce the number of array
entries by specifying a mask for each value. I am worried also that the
initial contributor might for example forget about the backup bootsource
and only upstreams primary bootsource, so we would have to modify
existing values for the primary bootsource when adding the backup
bootsource.

How about only adding the phandles to bootsource-map, like

bootsource-map = <&mmc0>, <&mmc2>, <&spi0>, ...;

New entries must then only be added at the end, existing entries must
never be changed.

But anyway, as with your approach the bootsource would become just
another driver specific binding SoC contributors would be free to choose
whatever suits best for them.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
