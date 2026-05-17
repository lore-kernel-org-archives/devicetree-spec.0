Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3511816A956
	for <devicetree-spec@vger.kernel.org>; Sun, 17 May 2026 22:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779058397; cv=pass; b=YGBTidbum4zfoqzs6GY9pRUPS5S7hz+1bZ1HQuFL8zPvAsi1Dmnv7YGxj1f983m6nrEKSuFGxhsG15zVw9Py7Pazdcbchq9xyC94LJ7SZroCMHltSOP0sLIcfrxEkJMNNnAC4E2xVCn1y02gybTUfoJeyKNAV0I9TsLoUqCeKjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779058397; c=relaxed/simple;
	bh=DANe3b1Lrx5r4db/7fNp7XG/tly0BIceUpq9A7Pt+OM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACspNMVJ2OCyQGS+D6wmQNFEG1aOyz8TKq5lr88uW+dE1ktMSGC0pfkQZV/fFI6FpST3eLOOfYiK0KwRjqp2q5RaQnqWHlrhhdrKJDZZihOhyNGEcST1o5dK8GOs5980PT34zbUEfdmCxGj8xhpchn8lJqHd8VgEHqAo60TaXGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LV5w78JT; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LV5w78JT"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bd0fc4c336eso363119666b.3
        for <devicetree-spec@vger.kernel.org>; Sun, 17 May 2026 15:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779058393; cv=none;
        d=google.com; s=arc-20240605;
        b=GV6v5T1Qsb+EQQKQNUcxZUZefro6cb+QKkSIl2g9SRTSHgqDTXZ8oGBeXGTRmSDrzH
         jgE3TwC8dayFeh+6L9hjkWMvI5JFkx+bUG7NdekIF8oCZlUR8K3ruwuqrXavyUew6kTb
         V/yA4/zynK4GHaJBelOBdC3EVa3Ic/ozPdbqB2DMfh0YzP73ATProppdCIGkAt9HXVL0
         8WroSzP77NaFLYnCLQN4KFnBL3CSC2eQkB2mjtCKRayEPHP3oSiI1CfqbDK1rNx/pGFO
         1wTGw+bVeIui0adP96bPt1uHE8GgMonR3lOd8N1ywBMNz1DLwYL3V7krO7ibcHNB3q0W
         5FqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dqHCarJKoTYsYs2GgG6/OergL7eHJ2mPr9aCS4gATf4=;
        fh=XrFx+ZM/5ElGT8FgWEGl/RjSjCiaYy2rk4toLdoKrmM=;
        b=SvquDfDmuOewLjcgTVj6C43F/NSRg6iZngnrlTGubnR7XfqgtEitGAGAdvaobZjbsS
         lNZ0Db90yeFB+cyyiaSytBrtbpEGnHfpAWmaKApPD4fq8ZD8eZ29FhrqscbFRXnZrgZo
         k+Pqz41d1eP3+4otdF6bwwKX1znSwQfxCDsGzX9b2mSusMRQT2DgTiSs9R9cgMmFUSVl
         1s/Fv0Yl828C71hBFBbfhd5CAxx0outpyqvDFqfIrz2lKK+17gad/xJMmvSz+LKWF1E5
         lak/wRaxYIM79Kod4mIwNq0q21QQ0wWbmtY78+t9lXS9pQsyMm15cZ3xU/qjOTrHkvGP
         PhKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779058393; x=1779663193; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dqHCarJKoTYsYs2GgG6/OergL7eHJ2mPr9aCS4gATf4=;
        b=LV5w78JTToreKjGF2TvLVckv/UnPpjHeiqLBWUMtVrK/BJfKki8eHBFSTqJDyENep/
         6QooNepDY27FDCc8M4OwLrgBCZ/wH1BhoEYirCdmqqwvG9+NOXwPFfuXR3YmuaP1Z/gD
         /TKQSRz0jhM7AAUm5f1jwr+jmgxfXoVzFvvbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779058393; x=1779663193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqHCarJKoTYsYs2GgG6/OergL7eHJ2mPr9aCS4gATf4=;
        b=PyS/EgEDs5B+9jhMsFpOqgQyvOJn3OI2NimSkxt390z8mmENnlLzi+8RdpAa6saSBM
         ho/VgrXUUwSV6elIfF+kne+++Ax838vR78D2T5ZZIWevW+14Ay38nYCDEDfm9vQdVEEy
         4CD6Azqcv8QdPjnvXQJnfQ1/PeVGsJkCizVCtMhoNeNiQWUcy7eO/RgKaTr4O7FX9VOM
         MSRkj/R6vrV5PSro5dHBu2JLU2kgbfJqFQbU9TapQLZfjxPI/EU6InWWftsr95lGwe1h
         NxE4z7zYT+QzIeelPkkGh0fBKX2SGf43CrdHerB2JMUXOwMzJTADteoxDERQJLhXOWW2
         IgQg==
X-Forwarded-Encrypted: i=1; AFNElJ9gBMoXNt0f1S6rKiUWaStqwyT0U3uwmU/0Yi4gDv0PoEKcy3Sud6plQzmKF/FwYqFhsr2HsvTXdA9/DFgZwy0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq0vTvrehFPAFzu/eij9LsKLg6avsmLBj2TLTGpsJeIwRezVpc
	xckMMKBNtKSTI07yURDEtzLSjMJXphs3LB6ptDvK/P4Do19a7FWntxt6DfbOBCfGewX5n9s9r+A
	Ux17qeh57Mwd1nyrB+LxnTH3BckgGLQIyOSCXpOqm
X-Gm-Gg: Acq92OFpq5rWUEq6BWNS+yCMko5t38imaLyKdm89DjswTAYo29LP4hpYNtdEwRKCRxi
	pipl6I+uuc1t3SUpVWHQ0ezEsqT3GjR5RXqUZFUwwFL7khWhtCYP9j2dDyOBLZzLyk/15j8vUV0
	3bvULQHCK/os8SgTVia3kuCOqrTVjYEQUW7pJJdIF5vul2l53zH8m6V7lVJZb3aNV+rVK2NYRR3
	EVGJlRaLLctNSakwy/ANG2hhceUuXtDm5+66Sp07nGYhevTW+k/zV9Y/KlGgMMRM+0UiEW/mHQA
	Hcywa4Ae1rC4A13nHk8=
X-Received: by 2002:a17:907:c291:b0:bd2:8386:2a39 with SMTP id
 a640c23a62f3a-bd517930618mr681196366b.36.1779058393523; Sun, 17 May 2026
 15:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <579fcbc186ad2aeea3c206aebc901b64fc665db1.camel@siemens.com>
 <2775464f-9da6-4e6f-b6ac-e84901cc3727@cherry.de> <f73b05656a7ce16e8aaa7d8fbfdc37716f5d025c.camel@siemens.com>
In-Reply-To: <f73b05656a7ce16e8aaa7d8fbfdc37716f5d025c.camel@siemens.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 17 May 2026 16:53:00 -0600
X-Gm-Features: AVHnY4L8BSGPjNxulnzFMFGoywEzwgk0uULnGG16f9D8rcNal7ZZ_-HjMJDKkxg
Message-ID: <CAFLszTikS-QjMidEtZTcjG_t4YB_3m9aXpsRutvt6WbLyw8Lsg@mail.gmail.com>
Subject: Re: [RFC] Pass reset reason to Linux via FDT
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>, 
	"devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>, 
	"a.fatoum@pengutronix.de" <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 13 May 2026 at 02:57, Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hi Quentin,
>
> On Tue, 2026-05-12 at 17:29 +0200, Quentin Schulz wrote:
> > > I would like to receive your opinion on the new /chosen/reset-reason property
> > > I would like to introduce in the spec and consequently in the U-Boot.
> > >
> > > I've posted an U-Boot patchset [1] with the proposed implementation which
> > > would work on TI K3 SoCs initially.
> > >
> > > - Do you think I need to send a formal patch to device tree spec?
> >
> > We (U-Boot) are not merging new Device Tree nodes or properties without
> > them being accepted in either the spec or in Linux kernel Device Tree
> > bindings, so it's not that we think you need to send a formal patch, is
> > that you must and it needs to be merged before we can use it.
> >
> > Yes, this can take months and be cumbersome but Device Tree is supposed
> > to represent the HW and be system-agnostic so we should make sure all
> > bootloaders or OSes understand and fill the Device Tree as intended.
> >
> > > - Do you think /chosen/reset-reason is the proper location for the SoC/platform
> > >     agnostic reset cause information?
> >
> > /chosen is likely the right place considering /chosen/bootsource which
> > is also added by the bootloader.
> >
> > > - Do you think having an opaque string there is OK, bearing in mind that there
> >
> > No.
> >
> > >     is no standard approach up to now to this topic, neither in Linux nor in
> > >     U-Boot, taking into account different SoCs and vendors provide very different
> >
> > In Barebox there is a way though. Strings are bad, and even more so if
> > they are free-form as vendors will either be very inventive and there
> > can also be typos.
> >
> > >     information regarding reset cause, which is barely possible to unify?
> > >
> >
> > I think you want to have a read of common/oftree.c in Barebox,
> > specifically the /chosen/reset-source-device, /chosen/reset-source,
> > /chosen/reset-source-instance properties as well as
> > common/reset_source.c where they also read /chosen/reset-source-priority.
>
> thanks for the reference! Barebox implementation looks nice, populates exactly
> /chosen/reset-source with a string and covers most of the reset sources with their
> - unknown
> - POR
> - RST
> - WDG
> - WKE
> - JTAG
> - THERM
> - EXT
> - BROWNOUT

I am not a fan of capital letters and abbreviations in device-tree
properties. I think we should have

cold
warm
watchdog
wakeup
jtag
thermal
external
brownout

>
> but TI K3 has also
> - ESM (Error Signalling Module)
> - DMSC (how U-Boot calls it now, I suppose Device Management something) or SMS (Security Management Subsystem, how TRM names it)
>
> and i.MX9 brings some
> - *LOCKUP (secure core's lockup)
> - [unhandled] exception (on a secure core)
> - FCCU (Fault Collection and Control Unit, similar to TI's ESM?)
> - ELE (EdgeLock Enclave)
> - BBM (Battery-Backed Module)
>
> If we do not want to intentionally lose this information, how can we accommodate
> for the above and future development in the device tree bindings?

You can add more options to the binding as needed.

>
> > There are multiple issues with the suggested implementation here. How do
> > we handle a device with multiple IPs possibly triggering the same kind
> > of reset? E.g. there can be a CPU watchdog but also a PMIC watchdog. The
> > difference is really important as on some system, you need to reset the
> > PMIC so the power-rails are reset and in the expected state.
>
> Obviously it will not be possible to satisfy the most sophisticated requirements
> with just one implementation. But as usual, we probably could cover 80% of
> use cases with 20% of effort.

I would expect 'watchdog' to mean SoC watchdog. If we need to specify
a PMIC watchdog we could perhaps add a 'reset-source' property?

But as Quentin mentions, we should get the bindings in first.

>
> > What about an SoC with multiple watchdogs (Rockchip SoCs have many
> > different sources for triggering the watchdog)?
>
> Probably Barebox implementation has an answer for this providing their
> /chosen/reset-source-instance and /chosen/reset-source-device (as a full
> DT node name), but implementing /chosen/reset-source neither strictly
> requires to implement reset-source-instance or reset-source-device now,
> nor does it block them from being implemented later.
>
> > Considering Barebox has had support for this for a very long time, I'm
> > sure they have some opinions on what to do and what not to do :)
> >
> > Cheers,
> > Quentin
> >
> > > The proposed change would look like following:
> > >
> > > diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
> > > index 63f3c12..d908426 100644
> > > --- a/dtschema/schemas/chosen.yaml
> > > +++ b/dtschema/schemas/chosen.yaml
> > > @@ -183,6 +183,20 @@ properties:
> > >          will assign devices in its usual manner, otherwise it will not try to
> > >          assign devices and instead use them as they are configured already.
> > >
> > > +  reset-reason:
> > > +    $ref: types.yaml#/definitions/string
> > > +    description:
> > > +      This property is set by the bootloader to indicate the reason for the
> > > +      most recent system reset, e.g. "POR" (power-on reset), "WDOG" (watchdog),
> > > +      "PIN" (external reset pin), "RST" (software warm reset), "THERMAL", etc.
> > > +      The set of possible values is platform-specific.
> > > +
> > > +      / {
> > > +              chosen {
> > > +                      reset-reason = "WDOG";
> > > +              };
> > > +      };
> > > +
> > >      smbios3-entrypoint:
> > >        $ref: types.yaml#/definitions/address
> > >        maxItems: 1
> > >
> > > [1] https://www.mail-archive.com/u-boot@lists.denx.de/msg573811.html
> > >
>

Regards,
Simon
