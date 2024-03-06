Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B570F639
	for <devicetree-spec@vger.kernel.org>; Wed,  6 Mar 2024 22:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709763780; cv=none; b=uEcxNVwN66OXyhS7dkbCbZtOZeWyfJ9nOcRpn6MPahyeogqQt3ARakzFvSvNAhFKtVmimLxlGHVs/r0RHQzBh6L3IaRErmrJPZrPuxGT60HW8ECCXE+xnjTrXguoqRxL7RAea5H51Egn6e72UKSGq4NsL1O9YzLlVFARtvB3+Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709763780; c=relaxed/simple;
	bh=WrlyPHJ64vcEYsb5iw8Ou+j8/qxR5F/sUmd+OeFjWoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LgR/DNLMAAoHxWA/tkOelP8NLRzs75KAb9bZCeKnxVQpRMlAZKQdbSHsywP3t1Orp8btHeeUjPLh8tgs7DRWX/BptOPs6K7QVHmRvgyDf+qPV8wLMv9L3eCTwR/1jOYa8v/QU1qaEaBRcp3aLbb4Eu/gTG+5xSr41UN0DomSd2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUYUxMqM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUYUxMqM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B26C43394
	for <devicetree-spec@vger.kernel.org>; Wed,  6 Mar 2024 22:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709763780;
	bh=WrlyPHJ64vcEYsb5iw8Ou+j8/qxR5F/sUmd+OeFjWoc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kUYUxMqMS4/PHxopiveM/SFmffZWrUij73G4U0MOtnm0OLlgFt5hre5NyZmpqiEg/
	 e+9VMTVRIYF46G7D/iIUEWJI96+JsWuKBmBjkNXRXqQ7yusbdadM4LMYwnyAW6EfYD
	 vQ3WyHpI3mzhNpnrcx/BZYCCdtf6vSmacN+OxGNxP1AdkvDjZGnNKoUBdAsZrKiHyK
	 S9/3L8InBrNBi1fpDVMC72vVxj7CbyGbDwQYmvBrxyWkYPOheeXz/02XzBc/0koidp
	 6akfNjpEhiaunnlw0Lvz9/cOZZ8ftkh6YYb34QIwLCVyY1IW9ny1KHq2uwqf7HeNZa
	 u2vKpAF0OWNiA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d3fd0e6832so1663311fa.2
        for <devicetree-spec@vger.kernel.org>; Wed, 06 Mar 2024 14:23:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5GBazkSZ8XU3b4vq8/pTkYCzH0Ybq3gtunxKtXwMpFxLAjB8nz4ORJlTp26bjzKuga7fAzydqvQ8veDv85WtlWrm7piYYVXvG/Z94OjtT
X-Gm-Message-State: AOJu0Yw4/AXghAa+zOipIFwhCRf21JrQD5a3Mxd4EHFEWpwNtXJWPEe8
	DrwbpCmlFyDKf6KJa+mbfQcX3m7U9YBaVvYaIKqPu2ThcyOtJFlsp9AXzcStX8+xikV/tm2gUFu
	vw8163v0iOAq7ILhX+z3BAx2wgw==
X-Google-Smtp-Source: AGHT+IENUzQgAh+52Pz6OuJu2YWcIi+oWrZEP/YFB8w20VrWaN+iawfo2iS7hhLunyF2cAv63qzOBSoNecNBLFmeDKI=
X-Received: by 2002:a05:651c:20a:b0:2d3:3b37:db78 with SMTP id
 y10-20020a05651c020a00b002d33b37db78mr194235ljn.16.1709763778304; Wed, 06 Mar
 2024 14:22:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306002951.1601630-1-saravanak@google.com> <CAFLszTiv7bHumx7T2y3CNaWPE=tkttQU2Uak-uu1foeZZr+KEw@mail.gmail.com>
In-Reply-To: <CAFLszTiv7bHumx7T2y3CNaWPE=tkttQU2Uak-uu1foeZZr+KEw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Mar 2024 16:22:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLueXDRS7LPr3gHGSc4vYmt2TeteAm9d=wiO4kWEe3G6g@mail.gmail.com>
Message-ID: <CAL_JsqLueXDRS7LPr3gHGSc4vYmt2TeteAm9d=wiO4kWEe3G6g@mail.gmail.com>
Subject: Re: [PATCH v1] schemas: Add schema for post-init-providers
To: Simon Glass <sjg@chromium.org>
Cc: Saravana Kannan <saravanak@google.com>, devicetree-spec@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 1:17=E2=80=AFPM Simon Glass <sjg@chromium.org> wrote=
:
>
> Hi Saravana,
>
> On Wed, 6 Mar 2024 at 13:30, Saravana Kannan <saravanak@google.com> wrote=
:
> >
> > The post-init-providers property can be used to break a dependency cycl=
e by
> > marking some provider(s) as a post device initialization provider(s). T=
his
>
> Please can you add hyphens to avoid confusion? I believe this should
> be 'post-device-initialization' throughout. There is no 'post' device.

There is no 'post-device-initialization' thing either. Shrug.

> > allows an OS to do a better job at ordering initialization and
> > suspend/resume of the devices in a dependency cycle.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  dtschema/schemas/post-init-providers.yaml | 105 ++++++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644 dtschema/schemas/post-init-providers.yaml
> >
> > diff --git a/dtschema/schemas/post-init-providers.yaml b/dtschema/schem=
as/post-init-providers.yaml
> > new file mode 100644
> > index 0000000..92eb9a0
> > --- /dev/null
> > +++ b/dtschema/schemas/post-init-providers.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2020, Google LLC. All rights reserved.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/post-init-providers.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Post device initialization providers
> > +
> > +maintainers:
> > +  - Saravana Kannan <saravanak@google.com>
> > +
> > +description: |
> > +  This property is used to indicate that the device(s) pointed to by t=
he
>
> Should this be 'device node' instead of 'device'?
>
> > +  property are not needed for the initialization of the device that li=
sts this
> > +  property. This property does not make a device (that's previously no=
t a
> > +  provider) into a provider. It simply downgrades an existing provider=
 to a
> > +  post device initialization provider.
> > +
> > +  A device can list its providers in devicetree using one or more of t=
he
> > +  standard devicetree bindings. By default, it is assumed that the pro=
vider
> > +  device can be initialized before the consumer device is initialized.
> > +
> > +  However, that assumption cannot be made when there are cyclic depend=
encies
> > +  between devices. Since each device is a provider (directly or indire=
ctly) of
> > +  the others in the cycle, there is no guaranteed safe order for initi=
alizing
> > +  the devices in a cycle. We can try to initialize them in an arbitrar=
y order
> > +  and eventually successfully initialize all of them, but that doesn't=
 always
> > +  work well.
> > +
> > +  For example, say,
> > +  * The device tree has the following cyclic dependency X -> Y -> Z ->=
 X (where
> > +    -> denotes "depends on").
> > +  * But X is not needed to fully initialize Z (X might be needed only =
when a
> > +    specific functionality is requested post initialization).
>
> How about 'is requested after initialization of Z'
>
> > +
> > +  If all the other -> are mandatory initialization dependencies, then =
trying to
> > +  initialize the devices in a loop (or arbitrarily) will always eventu=
ally end
> > +  up with the devices being initialized in the order Z, Y and X.
> > +
> > +  However, if Y is an optional provider for X (where X provides limite=
d
> > +  functionality when Y is not initialized and providing its services),=
 then
> > +  trying to initialize the devices in a loop (or arbitrarily) could en=
d up with
> > +  the devices being initialized in the following order:
> > +
> > +  * Z, Y and X - All devices provide full functionality
> > +  * Z, X and Y - X provides partial functionality
> > +  * X, Z and Y - X provides partial functionality
> > +
> > +  However, we always want to initialize the devices in the order Z, Y =
and X
> > +  since that provides the full functionality without interruptions.
> > +
> > +  One alternate option that might be suggested is to have the driver f=
or X
> > +  notice that Y became available at a later point and adjust the funct=
ionality
> > +  it provides. However, other userspace applications could have starte=
d using X
> > +  with the limited functionality before Y was available and it might n=
ot be
> > +  possible to transparently transition X or the users of X to full
> > +  functionality while X is in use.
>
> This seems strange to me. It seems like something that could be
> implemented. That said, I understand that such an implementation could
> become painful.

It has been implemented. And cycle detection has been implemented. And
yet we are still here needing something more.


> > +  Similarly, when it comes to suspend (resume) ordering, it's unclear =
which
> > +  device in a dependency cycle needs to be suspended/resumed first and=
 trying
> > +  arbitrary orders can result in system crashes or instability.
> > +
> > +  Explicitly calling out which link in a cycle needs to be broken when
> > +  determining the order, simplifies things a lot, improves efficiency,=
 makes
> > +  the behavior more deterministic and maximizes the functionality that=
 can be
> > +  provided without interruption.
> > +
> > +  This property is used to provide this additional information between=
 devices
> > +  in a cycle by telling which provider(s) is not needed for initializi=
ng the
> > +  device that lists this property.
> > +
> > +  In the example above, Z would list X as a post-init-providers and th=
e
> > +  initialization dependency would become X -> Y -> Z -/-> X. So the be=
st order
> > +  to initialize them becomes clear: Z, Y and then X.
> > +
> > +select: true
> > +
> > +properties:
> > +  post-init-providers:
>
> What is 'init'? It seems to mean when Linux probes the device. In
> U-Boot, devices all are bound at the start, but only probed (lazilly)
> when used. For some device types there is then an 'init' step which
> actually starts using the device, before which no hardware is
> accessed. So the use of the word 'init' seems a bit vague to me.
>
> In general this binding seems liable to be specific to the OS being
> used. It also seems to be a hint, rather than something that must be
> parsed and used. However I suppose adding the suffix '-hint' would
> just confuse things.
>
> How about 'secondary-providers' or 'minor-providers' or
> 'delayed-providers' or 'deferred-providers'?
>
> Separately/alternatively I wonder if the target node is always going
> to be inited later, for any device that uses it. If so, perhaps a
> property in the target node would be better, something like:
>
> dispcc: clock-controller@2000 {
>    ...
>    minor-provider;

That doesn't work if a node is 2 or more providers and only some of
them are optional/post-init/deferred.

Rob
