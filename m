Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F3251C45
	for <devicetree-spec@vger.kernel.org>; Thu,  7 Mar 2024 20:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709844937; cv=none; b=LAGtPfdKBDLt+popLjUbjYympLwA+eXYvkUuPuzMA97WGD6S3PhPmYLmlG530CnDc7zyXDxrxseEnvRs4tqSrRBYQfDB+rEr0u8gNzoo1N1D3+LrsKwq08Zy9XOUP1InGXBYgy8Lum/vxHFjakUwVS9bXMkaShRvI4Xz8ls/ibI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709844937; c=relaxed/simple;
	bh=QDOPBdHCIMr4ACNaTyxJQbGuRwMMN/wQY3sS+ntEHgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YV9HON1pdFEr8q/SRs7Yna1W5phsI2ZDpBRG73WMckzanheBR+KYnbenljOi60BY0yXhfNzQEB90k4FEKIUTmKGbchuwBv8gn5iwVlXV/hKx4igHXbw35Du2g53kiPdkC9gSv9yS35LZiH5bj/4yVKUb0myvqbnwtaNdm5R8GHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jlzewHQ/; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jlzewHQ/"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5a12060fb59so118513eaf.1
        for <devicetree-spec@vger.kernel.org>; Thu, 07 Mar 2024 12:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709844934; x=1710449734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt4UCmwW9ld8To/DY8BrInBnMzefHnSK7J28hs7ecQs=;
        b=jlzewHQ/U9RWRk/TemVLClxYrPqqxDHQNwHP04xUquA/Y3m0ai4BaS9tyHoxvVopz2
         Gq+WBjaPGZbEeyA6ehtqeU9jDoHrKcYoTE+DmdO04pErGBLpz2DMaHIbt46i/Lpym6w4
         y2Yxj7ZAxriW02OiqoVi425N67MwqwAnlfF34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709844934; x=1710449734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt4UCmwW9ld8To/DY8BrInBnMzefHnSK7J28hs7ecQs=;
        b=TTC9ES6san0wq5andQjicty3KSpf9kn67Se2e8bJ3M4GmJS+FUF0Eze2/pvzUpLhti
         4OR2tTa/1+NJBPne9hKxxseZfxm90CtxoTSTBJpkxifAst3GSz70k67MVHSAGi7VTcoD
         wO6QXwhu96vUZ5IO1J4+Y9EDzSiQBxSL7gVY6wtVDz9PoQfAwU3r/PSF0VhtrVbDUASt
         OBCyWElhPNGxugehwWI9pKNxnLr6IaOTGr8bTEVp2izxU2S1fiRo3q90Zmc41u9ao9v+
         T5fD+6qi4gHTzy+D27MFRl5469r7niss42nzqeqki4sZMPi9gAwIn+XDFFB3VUdGzoXD
         MkWA==
X-Forwarded-Encrypted: i=1; AJvYcCWDvj0zhECgHs5NCkR/Qs93qk7ewlgL31eR+zEI5FJJJiirbaNviOC9PXwWr4xfN7m8P19T8Qu6PgmcwtxMWrGSUBByU4ez58vmR8ylowwP
X-Gm-Message-State: AOJu0YwCyxSxfxghNHtjOHP68qOYn4hPHybDkOKImik/KlcDx4BNw7ef
	D6DQIeIeahnRkJZvlsXhdpFhsdRzUs65EQ+iYOT1DzlfPnvqkwsxebj8ezOE63B6yijFNuZ14PS
	gm62blKIV+H90A5JzydH8tkow04+tz6ojh8m5
X-Google-Smtp-Source: AGHT+IFaN2jrX8oE9DQyjFO8XwZWnluZuTB6yl4Nc+ZOtiJLFV1fK3hfpPPLVzLls266MwAmtCnmt7pcs2Wn/nctwqk=
X-Received: by 2002:a05:6359:4105:b0:17c:314b:c80b with SMTP id
 kh5-20020a056359410500b0017c314bc80bmr8436391rwc.9.1709844934569; Thu, 07 Mar
 2024 12:55:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306002951.1601630-1-saravanak@google.com>
 <CAFLszTiv7bHumx7T2y3CNaWPE=tkttQU2Uak-uu1foeZZr+KEw@mail.gmail.com> <CAL_JsqLueXDRS7LPr3gHGSc4vYmt2TeteAm9d=wiO4kWEe3G6g@mail.gmail.com>
In-Reply-To: <CAL_JsqLueXDRS7LPr3gHGSc4vYmt2TeteAm9d=wiO4kWEe3G6g@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 8 Mar 2024 09:55:23 +1300
Message-ID: <CAFLszThOtKK43RGmyYCvd0+pQB8fby9Bsv_tX4jNuMi3L91AnQ@mail.gmail.com>
Subject: Re: [PATCH v1] schemas: Add schema for post-init-providers
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, devicetree-spec@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, 7 Mar 2024 at 11:23, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Mar 6, 2024 at 1:17=E2=80=AFPM Simon Glass <sjg@chromium.org> wro=
te:
> >
> > Hi Saravana,
> >
> > On Wed, 6 Mar 2024 at 13:30, Saravana Kannan <saravanak@google.com> wro=
te:
> > >
> > > The post-init-providers property can be used to break a dependency cy=
cle by
> > > marking some provider(s) as a post device initialization provider(s).=
 This
> >
> > Please can you add hyphens to avoid confusion? I believe this should
> > be 'post-device-initialization' throughout. There is no 'post' device.
>
> There is no 'post-device-initialization' thing either. Shrug.

'post-device-initialization' is intended to be an adjective and the
hyphens help to make that clear.

>
> > > allows an OS to do a better job at ordering initialization and
> > > suspend/resume of the devices in a dependency cycle.
> > >
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > ---
> > >  dtschema/schemas/post-init-providers.yaml | 105 ++++++++++++++++++++=
++
> > >  1 file changed, 105 insertions(+)
> > >  create mode 100644 dtschema/schemas/post-init-providers.yaml
> > >
> > > diff --git a/dtschema/schemas/post-init-providers.yaml b/dtschema/sch=
emas/post-init-providers.yaml
> > > new file mode 100644
> > > index 0000000..92eb9a0
> > > --- /dev/null
> > > +++ b/dtschema/schemas/post-init-providers.yaml
> > > @@ -0,0 +1,105 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +# Copyright (c) 2020, Google LLC. All rights reserved.
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/post-init-providers.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Post device initialization providers
> > > +
> > > +maintainers:
> > > +  - Saravana Kannan <saravanak@google.com>
> > > +
> > > +description: |
> > > +  This property is used to indicate that the device(s) pointed to by=
 the
> >
> > Should this be 'device node' instead of 'device'?
> >
> > > +  property are not needed for the initialization of the device that =
lists this
> > > +  property. This property does not make a device (that's previously =
not a
> > > +  provider) into a provider. It simply downgrades an existing provid=
er to a
> > > +  post device initialization provider.
> > > +
> > > +  A device can list its providers in devicetree using one or more of=
 the
> > > +  standard devicetree bindings. By default, it is assumed that the p=
rovider
> > > +  device can be initialized before the consumer device is initialize=
d.
> > > +
> > > +  However, that assumption cannot be made when there are cyclic depe=
ndencies
> > > +  between devices. Since each device is a provider (directly or indi=
rectly) of
> > > +  the others in the cycle, there is no guaranteed safe order for ini=
tializing
> > > +  the devices in a cycle. We can try to initialize them in an arbitr=
ary order
> > > +  and eventually successfully initialize all of them, but that doesn=
't always
> > > +  work well.
> > > +
> > > +  For example, say,
> > > +  * The device tree has the following cyclic dependency X -> Y -> Z =
-> X (where
> > > +    -> denotes "depends on").
> > > +  * But X is not needed to fully initialize Z (X might be needed onl=
y when a
> > > +    specific functionality is requested post initialization).
> >
> > How about 'is requested after initialization of Z'
> >
> > > +
> > > +  If all the other -> are mandatory initialization dependencies, the=
n trying to
> > > +  initialize the devices in a loop (or arbitrarily) will always even=
tually end
> > > +  up with the devices being initialized in the order Z, Y and X.
> > > +
> > > +  However, if Y is an optional provider for X (where X provides limi=
ted
> > > +  functionality when Y is not initialized and providing its services=
), then
> > > +  trying to initialize the devices in a loop (or arbitrarily) could =
end up with
> > > +  the devices being initialized in the following order:
> > > +
> > > +  * Z, Y and X - All devices provide full functionality
> > > +  * Z, X and Y - X provides partial functionality
> > > +  * X, Z and Y - X provides partial functionality
> > > +
> > > +  However, we always want to initialize the devices in the order Z, =
Y and X
> > > +  since that provides the full functionality without interruptions.
> > > +
> > > +  One alternate option that might be suggested is to have the driver=
 for X
> > > +  notice that Y became available at a later point and adjust the fun=
ctionality
> > > +  it provides. However, other userspace applications could have star=
ted using X
> > > +  with the limited functionality before Y was available and it might=
 not be
> > > +  possible to transparently transition X or the users of X to full
> > > +  functionality while X is in use.
> >
> > This seems strange to me. It seems like something that could be
> > implemented. That said, I understand that such an implementation could
> > become painful.
>
> It has been implemented. And cycle detection has been implemented. And
> yet we are still here needing something more.

Sure, I understand that.

>
>
> > > +  Similarly, when it comes to suspend (resume) ordering, it's unclea=
r which
> > > +  device in a dependency cycle needs to be suspended/resumed first a=
nd trying
> > > +  arbitrary orders can result in system crashes or instability.
> > > +
> > > +  Explicitly calling out which link in a cycle needs to be broken wh=
en
> > > +  determining the order, simplifies things a lot, improves efficienc=
y, makes
> > > +  the behavior more deterministic and maximizes the functionality th=
at can be
> > > +  provided without interruption.
> > > +
> > > +  This property is used to provide this additional information betwe=
en devices
> > > +  in a cycle by telling which provider(s) is not needed for initiali=
zing the
> > > +  device that lists this property.
> > > +
> > > +  In the example above, Z would list X as a post-init-providers and =
the
> > > +  initialization dependency would become X -> Y -> Z -/-> X. So the =
best order
> > > +  to initialize them becomes clear: Z, Y and then X.
> > > +
> > > +select: true
> > > +
> > > +properties:
> > > +  post-init-providers:
> >
> > What is 'init'? It seems to mean when Linux probes the device. In
> > U-Boot, devices all are bound at the start, but only probed (lazilly)
> > when used. For some device types there is then an 'init' step which
> > actually starts using the device, before which no hardware is
> > accessed. So the use of the word 'init' seems a bit vague to me.
> >
> > In general this binding seems liable to be specific to the OS being
> > used. It also seems to be a hint, rather than something that must be
> > parsed and used. However I suppose adding the suffix '-hint' would
> > just confuse things.
> >
> > How about 'secondary-providers' or 'minor-providers' or
> > 'delayed-providers' or 'deferred-providers'?
> >
> > Separately/alternatively I wonder if the target node is always going
> > to be inited later, for any device that uses it. If so, perhaps a
> > property in the target node would be better, something like:
> >
> > dispcc: clock-controller@2000 {
> >    ...
> >    minor-provider;
>
> That doesn't work if a node is 2 or more providers and only some of
> them are optional/post-init/deferred.

That's right. It would be nice though, if the situation you describe
does not actually happen in practice currently.

Regards,
Simon
