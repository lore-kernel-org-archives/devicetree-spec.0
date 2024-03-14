Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4151C01
	for <devicetree-spec@vger.kernel.org>; Thu, 14 Mar 2024 01:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710380224; cv=none; b=hgtzMK70SloaHYu4TQbyqfwIb8VN6uPaWQa1FXmsenrhOKuQVyCLEy0ugCLFjehLgN7FeepfUvFVq0fEkAEKSj11dQlfN/uxM0Yf+kVrJr0Kcnf2AoKx2wCw/JPxUo618sro4MxD6GmyXk+2uaYv/jwlLj6VaKdgX+JzNJRxaxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710380224; c=relaxed/simple;
	bh=TbHy6PEbrIYlQsb0qxY72zJD0QDXyUJHVM0sRQoE61I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhc+GpWtjOfhanYRjW5a7YcyoJ3xHEZTQQ2JXFEJVXkEZemeGBN43qwYb5RzN+MxMymkbko2sfqoUSqQnLC2MQ4iLI1WWOnRwBSQZpYqv/aY5AUSN4zHlSuYCIapQEqq+/zl5j3tv7QzrAK5hrh76MKHIAHr9gTO+2AB3LWo4mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lkNSTmdI; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lkNSTmdI"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-43095dcbee6so130181cf.0
        for <devicetree-spec@vger.kernel.org>; Wed, 13 Mar 2024 18:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710380222; x=1710985022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okQC/6d+X46pCnjND7q5HDWiaqJC25um3O/i5Ve0cIg=;
        b=lkNSTmdIi9TmLO+7pZnH3q+nZc8hezw+Y3QrZ7ibmfHS3z1LQaIEVO8bdYoXU7aIC9
         6+rH76aNyzY+qdm65PhxcqbdTkaHSzkjNpUTwe+oopzAAZIrkO/2bFBkjPnomjxdtJDH
         23JMylO2dNZGBDFjaTtUw7843gNo9VS9AE4LpBRUWiTs663LcYC+dKdbXvWU0tN1c4k9
         tYxbzoWRnwC8rWr6LawUQDRXWhcLvPj9knyvg3jTe0LHefSArxrQBT2oZ+uGdZ2pBQUB
         iSTMSiIWvQ6Y8n5AgTFqhi1bdwTl8dBFftmpiXn6gqG8RcsrcHz/bZR6QkK2hYVJMTdO
         eqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710380222; x=1710985022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okQC/6d+X46pCnjND7q5HDWiaqJC25um3O/i5Ve0cIg=;
        b=J0+OuHnXJTfTUoAJtblBpFHBr9KOKx/XDSZa55rc9ESlA6ETgHlqIwPSgEc1OmWzCS
         x71P2ChrQEFyefY2uSc/NQosQOGx6BYHbiu0q3BKN333KvH4cI9DImsMWqs9M4qQxCtO
         PLFh5a2plOE5dhDoAKl4kykHw1eeh5Oz/zB915N9pmjE6h5VVrRBzdxXsBEUS1pBZl1r
         d7sZWRzja/JazQCPKYXk3qQ2+CWpE/S1A9CG/343jGUohQ7sFkwbDRpUyUKO9PYIfZpk
         7QGyg8tfIz0a6N7Yq4e2GXwQ89BzWip1+BTRiNF26wpSBr6mZOIKfyVYi9yFVaUMBjK5
         Wrbw==
X-Forwarded-Encrypted: i=1; AJvYcCUOlCzT1CxBCbkuwrBT8TqPFULNn1/aE2qJhrEYoQ0wqgQzCRhpvYUS7X7qaTTB0Rppn8ECMYZfLqwXZOWkn+QcLIo59D1J5asvsQpcCWlV
X-Gm-Message-State: AOJu0YyOqvfQqe4T/2XKjYkCdL9CQgk18n/a8G37TpLRzvp6jMoC5jk3
	jla4Yw44ocwwwMRfqYcbrCjTZzmNZTew+6jOKwd07qRedxngOwupKaNTRUCDvpAWcxlBoSBdkDA
	7ElFYKU0ax59KokDbETCKub9EZxbuNKOZGUMplLLsmnhM/u3RkA==
X-Google-Smtp-Source: AGHT+IGZjsaCXl91XnzXk5pmLUa9iL4CQwX0HZVsd6DNaQkF3irutpNPeuMckAmv203bidYnDwAsA4W27qpKd07CQIs=
X-Received: by 2002:ac8:4899:0:b0:42e:b6df:819d with SMTP id
 i25-20020ac84899000000b0042eb6df819dmr105472qtq.24.1710380221441; Wed, 13 Mar
 2024 18:37:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306002951.1601630-1-saravanak@google.com>
 <CAFLszTiv7bHumx7T2y3CNaWPE=tkttQU2Uak-uu1foeZZr+KEw@mail.gmail.com>
 <CAL_JsqLueXDRS7LPr3gHGSc4vYmt2TeteAm9d=wiO4kWEe3G6g@mail.gmail.com>
 <CAFLszThOtKK43RGmyYCvd0+pQB8fby9Bsv_tX4jNuMi3L91AnQ@mail.gmail.com>
 <CAGETcx8cNP-xYFKbjvUnRgm7vPP9iHEqOUAhQBG+V8axOKVB4A@mail.gmail.com> <CAFLszTgiyQXqVF48GnHAt1ANwKQK_GxwTrOXQVUrpuOYpocCqw@mail.gmail.com>
In-Reply-To: <CAFLszTgiyQXqVF48GnHAt1ANwKQK_GxwTrOXQVUrpuOYpocCqw@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 13 Mar 2024 18:36:22 -0700
Message-ID: <CAGETcx-zOi7HHA+RYBD_CK99er9W4CYGY3qKz5WmAEYpwMdTGA@mail.gmail.com>
Subject: Re: [PATCH v1] schemas: Add schema for post-init-providers
To: Simon Glass <sjg@chromium.org>
Cc: Rob Herring <robh@kernel.org>, devicetree-spec@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 3:09=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Saravana,
>
> On Fri, 8 Mar 2024 at 19:48, Saravana Kannan <saravanak@google.com> wrote=
:
> >
> > On Thu, Mar 7, 2024 at 12:55=E2=80=AFPM Simon Glass <sjg@chromium.org> =
wrote:
> > >
> > > Hi Rob,
> > >
> > > On Thu, 7 Mar 2024 at 11:23, Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Wed, Mar 6, 2024 at 1:17=E2=80=AFPM Simon Glass <sjg@chromium.or=
g> wrote:
> > > > >
> > > > > Hi Saravana,
> > > > >
> > > > > On Wed, 6 Mar 2024 at 13:30, Saravana Kannan <saravanak@google.co=
m> wrote:
> > > > > >
> > > > > > The post-init-providers property can be used to break a depende=
ncy cycle by
> > > > > > marking some provider(s) as a post device initialization provid=
er(s). This
> > > > >
> > > > > Please can you add hyphens to avoid confusion? I believe this sho=
uld
> > > > > be 'post-device-initialization' throughout. There is no 'post' de=
vice.
> > > >
> > > > There is no 'post-device-initialization' thing either. Shrug.
> > >
> > > 'post-device-initialization' is intended to be an adjective and the
> > > hyphens help to make that clear.
> >
> > I think it's clear enough, but I'll do it just for you :)
>
> :)
>
> >
> > > >
> > > > > > allows an OS to do a better job at ordering initialization and
> > > > > > suspend/resume of the devices in a dependency cycle.
> > > > > >
> > > > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > > > ---
> > > > > >  dtschema/schemas/post-init-providers.yaml | 105 ++++++++++++++=
++++++++
> > > > > >  1 file changed, 105 insertions(+)
> > > > > >  create mode 100644 dtschema/schemas/post-init-providers.yaml
> > > > > >
> > > > > > diff --git a/dtschema/schemas/post-init-providers.yaml b/dtsche=
ma/schemas/post-init-providers.yaml
> > > > > > new file mode 100644
> > > > > > index 0000000..92eb9a0
> > > > > > --- /dev/null
> > > > > > +++ b/dtschema/schemas/post-init-providers.yaml
> > > > > > @@ -0,0 +1,105 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +# Copyright (c) 2020, Google LLC. All rights reserved.
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/post-init-providers.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Post device initialization providers
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Saravana Kannan <saravanak@google.com>
> > > > > > +
> > > > > > +description: |
> > > > > > +  This property is used to indicate that the device(s) pointed=
 to by the
> > > > >
> > > > > Should this be 'device node' instead of 'device'?
> >
> > I think device is more appropriate. Not every device node is a device
> > (eg: the pinctrl map, the remote endpoints pointed to by
> > remote-endpoints, etc). And with the property you are pointing to a
> > device node that represents a device.
>
> I see what you are saying. It's just that this is a devicetree with
> nodes, not a device model. So whether a particular node produces a
> device is really a separate issue..
>
> Anyway, it is only a minor thing.
>
> >
> > > > >
> > > > > > +  property are not needed for the initialization of the device=
 that lists this
> > > > > > +  property. This property does not make a device (that's previ=
ously not a
> > > > > > +  provider) into a provider. It simply downgrades an existing =
provider to a
> > > > > > +  post device initialization provider.
> > > > > > +
> > > > > > +  A device can list its providers in devicetree using one or m=
ore of the
> > > > > > +  standard devicetree bindings. By default, it is assumed that=
 the provider
> > > > > > +  device can be initialized before the consumer device is init=
ialized.
> > > > > > +
> > > > > > +  However, that assumption cannot be made when there are cycli=
c dependencies
> > > > > > +  between devices. Since each device is a provider (directly o=
r indirectly) of
> > > > > > +  the others in the cycle, there is no guaranteed safe order f=
or initializing
> > > > > > +  the devices in a cycle. We can try to initialize them in an =
arbitrary order
> > > > > > +  and eventually successfully initialize all of them, but that=
 doesn't always
> > > > > > +  work well.
> > > > > > +
> > > > > > +  For example, say,
> > > > > > +  * The device tree has the following cyclic dependency X -> Y=
 -> Z -> X (where
> > > > > > +    -> denotes "depends on").
> > > > > > +  * But X is not needed to fully initialize Z (X might be need=
ed only when a
> > > > > > +    specific functionality is requested post initialization).
> > > > >
> > > > > How about 'is requested after initialization of Z'
> >
> > Sure.
> >
> > > > >
> > > > > > +
> > > > > > +  If all the other -> are mandatory initialization dependencie=
s, then trying to
> > > > > > +  initialize the devices in a loop (or arbitrarily) will alway=
s eventually end
> > > > > > +  up with the devices being initialized in the order Z, Y and =
X.
> > > > > > +
> > > > > > +  However, if Y is an optional provider for X (where X provide=
s limited
> > > > > > +  functionality when Y is not initialized and providing its se=
rvices), then
> > > > > > +  trying to initialize the devices in a loop (or arbitrarily) =
could end up with
> > > > > > +  the devices being initialized in the following order:
> > > > > > +
> > > > > > +  * Z, Y and X - All devices provide full functionality
> > > > > > +  * Z, X and Y - X provides partial functionality
> > > > > > +  * X, Z and Y - X provides partial functionality
> > > > > > +
> > > > > > +  However, we always want to initialize the devices in the ord=
er Z, Y and X
> > > > > > +  since that provides the full functionality without interrupt=
ions.
> > > > > > +
> > > > > > +  One alternate option that might be suggested is to have the =
driver for X
> > > > > > +  notice that Y became available at a later point and adjust t=
he functionality
> > > > > > +  it provides. However, other userspace applications could hav=
e started using X
> > > > > > +  with the limited functionality before Y was available and it=
 might not be
> > > > > > +  possible to transparently transition X or the users of X to =
full
> > > > > > +  functionality while X is in use.
> > > > >
> > > > > This seems strange to me. It seems like something that could be
> > > > > implemented. That said, I understand that such an implementation =
could
> > > > > become painful.
> > > >
> > > > It has been implemented. And cycle detection has been implemented. =
And
> > > > yet we are still here needing something more.
> > >
> > > Sure, I understand that.
> > >
> > > >
> > > >
> > > > > > +  Similarly, when it comes to suspend (resume) ordering, it's =
unclear which
> > > > > > +  device in a dependency cycle needs to be suspended/resumed f=
irst and trying
> > > > > > +  arbitrary orders can result in system crashes or instability=
.
> > > > > > +
> > > > > > +  Explicitly calling out which link in a cycle needs to be bro=
ken when
> > > > > > +  determining the order, simplifies things a lot, improves eff=
iciency, makes
> > > > > > +  the behavior more deterministic and maximizes the functional=
ity that can be
> > > > > > +  provided without interruption.
> > > > > > +
> > > > > > +  This property is used to provide this additional information=
 between devices
> > > > > > +  in a cycle by telling which provider(s) is not needed for in=
itializing the
> > > > > > +  device that lists this property.
> > > > > > +
> > > > > > +  In the example above, Z would list X as a post-init-provider=
s and the
> > > > > > +  initialization dependency would become X -> Y -> Z -/-> X. S=
o the best order
> > > > > > +  to initialize them becomes clear: Z, Y and then X.
> > > > > > +
> > > > > > +select: true
> > > > > > +
> > > > > > +properties:
> > > > > > +  post-init-providers:
> > > > >
> > > > > What is 'init'? It seems to mean when Linux probes the device. In
> > > > > U-Boot, devices all are bound at the start, but only probed (lazi=
lly)
> > > > > when used. For some device types there is then an 'init' step whi=
ch
> > > > > actually starts using the device, before which no hardware is
> > > > > accessed. So the use of the word 'init' seems a bit vague to me.
> >
> > I'm using the word init as a short form of English word
> > "initialization" to mean the device has been initialized and ready to
> > provide its services. Whether that means you do stuff lazily or touch
> > the hardware is irrelevant. For example, you can probe a device in
> > Linux without ever touching any hardware register of that specific
> > device.
> >
> > I intentionally didn't use the word probe (Linux specific) or get into
> > specifics because it can depends on the bootloader/OS/whatever driver
> > model.
>
> Sure, I understand that init means initialisation...my point is that
> this depends on what is initialised at this point.
>
> 'probe' is used in U-Boot to mean that a bound device is activated.
>
> >
> > So, I'd keep the naming as is. All the other suggestions are more
> > confusing in my opinion.
>
> OK. I am not claiming that my suggestions are a lot better. I just
> worry that post-initialisation is pretty vague, e.g. devices can go
> through a few init steps. Anyway, I suppose we can deal with it later,
> if this binding is not enough to get things working.

Thanks Simon. I understand your concerns, but once you hit the need
for this property in U-Boot, it'll be pretty obvious what it means in
that context.

Rob, can you pull this in please?

-Saravana

>
> Regards,
> Simon
>
> >
> > -Saravana
> >
> > > > >
> > > > > In general this binding seems liable to be specific to the OS bei=
ng
> > > > > used. It also seems to be a hint, rather than something that must=
 be
> > > > > parsed and used. However I suppose adding the suffix '-hint' woul=
d
> > > > > just confuse things.
> > > > >
> > > > > How about 'secondary-providers' or 'minor-providers' or
> > > > > 'delayed-providers' or 'deferred-providers'?
> > > > >
> > > > > Separately/alternatively I wonder if the target node is always go=
ing
> > > > > to be inited later, for any device that uses it. If so, perhaps a
> > > > > property in the target node would be better, something like:
> > > > >
> > > > > dispcc: clock-controller@2000 {
> > > > >    ...
> > > > >    minor-provider;
> > > >
> > > > That doesn't work if a node is 2 or more providers and only some of
> > > > them are optional/post-init/deferred.
> > >
> > > That's right. It would be nice though, if the situation you describe
> > > does not actually happen in practice currently.
