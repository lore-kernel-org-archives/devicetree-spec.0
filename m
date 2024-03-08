Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAF32E3E4
	for <devicetree-spec@vger.kernel.org>; Fri,  8 Mar 2024 06:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709880521; cv=none; b=FaRgbgTOM5zRHXt+AJH4cyIf/iCo+3b+RczSOiY4DO4VUt2Dji/CEc5XanrvbRXfvnh0Y0YO0quNcikYM2at8D1W9k23HWBRjUBbrLGu3lkVGzn4sLIHmsin1ojTRqLZwJa/1n62gj5Xtrtmw/QxeJ2+4G7e6FhWl+CUP9qBiBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709880521; c=relaxed/simple;
	bh=2PSIS8/zpn1NPe7iwWkZ85TCIOrC7g8jmlo3T4LVRqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1jztmTrsi7jV5YZSvCNvAqrbN6ttcWji9qrdERCCs9KUYAAaFcFoeBxjhtuqZzQzMcnpzKeG3NprJFERhD54d2wotH8jPqxk/SnhvpEAqCGk0NGUdfRuipgeHOFewlIEDm0yyN7gtHHpedQj0HGqAlfAs3ZYF24up8EXN/siGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z/SseqO0; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z/SseqO0"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-428405a0205so158091cf.1
        for <devicetree-spec@vger.kernel.org>; Thu, 07 Mar 2024 22:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709880518; x=1710485318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCnLrWBatKoUpa6EytxdL1Bgtat5S5FcJysXLqiSztQ=;
        b=Z/SseqO0mtDuH/FUgsL68aXwoTJEoZp0YZUZhR5FOIUoS+mgTlNhRjKesLQcBTBHjF
         Voa9YAtvtRmSpIltN57Wb5il3Qe++Pl27xwDcuzY5c81deCYJA6F4siu8/L/bPf7vfDZ
         3xZIoUzybc7ltuFcgm/SyqRE9rYucbARdwGzZfolNH12QWlgDoJWV20666JcnW+XXXDF
         eQUwwjCHjZgIYQLwP6Y+cDR738vYbFsqpu/0knNBGJ261GJX3W+hovEHGCSRSDIl+h9K
         P5qqnY+2XfFltfUTkEqggEuPJXHJlP7XAhFvFkENeY6TV38ggowENfgd/wxmuqOdflmR
         plGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709880518; x=1710485318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCnLrWBatKoUpa6EytxdL1Bgtat5S5FcJysXLqiSztQ=;
        b=d2+vkiWtX3j/zBCqfk8yaW4TGjeCdi+GT7HDVPgiJVVjSY0ZNevDgSpv1xyUzeLUHW
         IGOVDioRD9ebQYnH9cNAIpH+LSasS5i3y+XhInacGPnV4GILQsca+6K2OprVGf8kYWEA
         I5/dIQBHqgSXFYZ7cRfK2deYvNiYWP9X6Q0COcZP7UBrUaSh/eeOvfTx8wUNGBr/P+ng
         H2Uhx/v7Y/v2yqt5UVHy5lA2IvDG5KK8CJ/IeU8t8iHL5l6L0MIQA6BHV7Awijmb3TsA
         KHvGjZj0a5GMmWOFIgzvzzJeipRo/Kdgjl3DyklFdyYZR1XKwxw2R/pu0QJ7+n2HugJS
         kM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjY99yGhk+PaCDQjijXo5CRqXkK3wFGtGyiNX3bMv+FXYzXAajc0TXOTB+2Ep0jXMp+arbXKHhA+ByoO85tFT/QVID8MO8Qz8K0nrWdzY3
X-Gm-Message-State: AOJu0YxjXjK84iHHVKdlTWC3lcXnqHbmZahXqoxyQ3CUnRgttjzZBml1
	HYTQEzQ5qORWJLZPWKcug4ped16REtjdjT/uo7Tp4C+jjdf/zaApoECQ4ByuM8UyRHVCldUnmya
	SciLaZfwjImf8a/fWaJoSNwX8AmlS9PIoBSSH
X-Google-Smtp-Source: AGHT+IHtS9oZ0cGF0MOJRfR1gGJw3jTr8K4yx3dwdF6W4ACWDd/lEWEjCXpsUvsyiGYyZYhWtm7rjPVSEATMnLX61fA=
X-Received: by 2002:a05:622a:1ba4:b0:42f:a3c:2d4d with SMTP id
 bp36-20020a05622a1ba400b0042f0a3c2d4dmr654295qtb.14.1709880517835; Thu, 07
 Mar 2024 22:48:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306002951.1601630-1-saravanak@google.com>
 <CAFLszTiv7bHumx7T2y3CNaWPE=tkttQU2Uak-uu1foeZZr+KEw@mail.gmail.com>
 <CAL_JsqLueXDRS7LPr3gHGSc4vYmt2TeteAm9d=wiO4kWEe3G6g@mail.gmail.com> <CAFLszThOtKK43RGmyYCvd0+pQB8fby9Bsv_tX4jNuMi3L91AnQ@mail.gmail.com>
In-Reply-To: <CAFLszThOtKK43RGmyYCvd0+pQB8fby9Bsv_tX4jNuMi3L91AnQ@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 7 Mar 2024 22:47:58 -0800
Message-ID: <CAGETcx8cNP-xYFKbjvUnRgm7vPP9iHEqOUAhQBG+V8axOKVB4A@mail.gmail.com>
Subject: Re: [PATCH v1] schemas: Add schema for post-init-providers
To: Simon Glass <sjg@chromium.org>
Cc: Rob Herring <robh@kernel.org>, devicetree-spec@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 12:55=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Rob,
>
> On Thu, 7 Mar 2024 at 11:23, Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Mar 6, 2024 at 1:17=E2=80=AFPM Simon Glass <sjg@chromium.org> w=
rote:
> > >
> > > Hi Saravana,
> > >
> > > On Wed, 6 Mar 2024 at 13:30, Saravana Kannan <saravanak@google.com> w=
rote:
> > > >
> > > > The post-init-providers property can be used to break a dependency =
cycle by
> > > > marking some provider(s) as a post device initialization provider(s=
). This
> > >
> > > Please can you add hyphens to avoid confusion? I believe this should
> > > be 'post-device-initialization' throughout. There is no 'post' device=
.
> >
> > There is no 'post-device-initialization' thing either. Shrug.
>
> 'post-device-initialization' is intended to be an adjective and the
> hyphens help to make that clear.

I think it's clear enough, but I'll do it just for you :)

> >
> > > > allows an OS to do a better job at ordering initialization and
> > > > suspend/resume of the devices in a dependency cycle.
> > > >
> > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > ---
> > > >  dtschema/schemas/post-init-providers.yaml | 105 ++++++++++++++++++=
++++
> > > >  1 file changed, 105 insertions(+)
> > > >  create mode 100644 dtschema/schemas/post-init-providers.yaml
> > > >
> > > > diff --git a/dtschema/schemas/post-init-providers.yaml b/dtschema/s=
chemas/post-init-providers.yaml
> > > > new file mode 100644
> > > > index 0000000..92eb9a0
> > > > --- /dev/null
> > > > +++ b/dtschema/schemas/post-init-providers.yaml
> > > > @@ -0,0 +1,105 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +# Copyright (c) 2020, Google LLC. All rights reserved.
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/post-init-providers.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Post device initialization providers
> > > > +
> > > > +maintainers:
> > > > +  - Saravana Kannan <saravanak@google.com>
> > > > +
> > > > +description: |
> > > > +  This property is used to indicate that the device(s) pointed to =
by the
> > >
> > > Should this be 'device node' instead of 'device'?

I think device is more appropriate. Not every device node is a device
(eg: the pinctrl map, the remote endpoints pointed to by
remote-endpoints, etc). And with the property you are pointing to a
device node that represents a device.

> > >
> > > > +  property are not needed for the initialization of the device tha=
t lists this
> > > > +  property. This property does not make a device (that's previousl=
y not a
> > > > +  provider) into a provider. It simply downgrades an existing prov=
ider to a
> > > > +  post device initialization provider.
> > > > +
> > > > +  A device can list its providers in devicetree using one or more =
of the
> > > > +  standard devicetree bindings. By default, it is assumed that the=
 provider
> > > > +  device can be initialized before the consumer device is initiali=
zed.
> > > > +
> > > > +  However, that assumption cannot be made when there are cyclic de=
pendencies
> > > > +  between devices. Since each device is a provider (directly or in=
directly) of
> > > > +  the others in the cycle, there is no guaranteed safe order for i=
nitializing
> > > > +  the devices in a cycle. We can try to initialize them in an arbi=
trary order
> > > > +  and eventually successfully initialize all of them, but that doe=
sn't always
> > > > +  work well.
> > > > +
> > > > +  For example, say,
> > > > +  * The device tree has the following cyclic dependency X -> Y -> =
Z -> X (where
> > > > +    -> denotes "depends on").
> > > > +  * But X is not needed to fully initialize Z (X might be needed o=
nly when a
> > > > +    specific functionality is requested post initialization).
> > >
> > > How about 'is requested after initialization of Z'

Sure.

> > >
> > > > +
> > > > +  If all the other -> are mandatory initialization dependencies, t=
hen trying to
> > > > +  initialize the devices in a loop (or arbitrarily) will always ev=
entually end
> > > > +  up with the devices being initialized in the order Z, Y and X.
> > > > +
> > > > +  However, if Y is an optional provider for X (where X provides li=
mited
> > > > +  functionality when Y is not initialized and providing its servic=
es), then
> > > > +  trying to initialize the devices in a loop (or arbitrarily) coul=
d end up with
> > > > +  the devices being initialized in the following order:
> > > > +
> > > > +  * Z, Y and X - All devices provide full functionality
> > > > +  * Z, X and Y - X provides partial functionality
> > > > +  * X, Z and Y - X provides partial functionality
> > > > +
> > > > +  However, we always want to initialize the devices in the order Z=
, Y and X
> > > > +  since that provides the full functionality without interruptions=
.
> > > > +
> > > > +  One alternate option that might be suggested is to have the driv=
er for X
> > > > +  notice that Y became available at a later point and adjust the f=
unctionality
> > > > +  it provides. However, other userspace applications could have st=
arted using X
> > > > +  with the limited functionality before Y was available and it mig=
ht not be
> > > > +  possible to transparently transition X or the users of X to full
> > > > +  functionality while X is in use.
> > >
> > > This seems strange to me. It seems like something that could be
> > > implemented. That said, I understand that such an implementation coul=
d
> > > become painful.
> >
> > It has been implemented. And cycle detection has been implemented. And
> > yet we are still here needing something more.
>
> Sure, I understand that.
>
> >
> >
> > > > +  Similarly, when it comes to suspend (resume) ordering, it's uncl=
ear which
> > > > +  device in a dependency cycle needs to be suspended/resumed first=
 and trying
> > > > +  arbitrary orders can result in system crashes or instability.
> > > > +
> > > > +  Explicitly calling out which link in a cycle needs to be broken =
when
> > > > +  determining the order, simplifies things a lot, improves efficie=
ncy, makes
> > > > +  the behavior more deterministic and maximizes the functionality =
that can be
> > > > +  provided without interruption.
> > > > +
> > > > +  This property is used to provide this additional information bet=
ween devices
> > > > +  in a cycle by telling which provider(s) is not needed for initia=
lizing the
> > > > +  device that lists this property.
> > > > +
> > > > +  In the example above, Z would list X as a post-init-providers an=
d the
> > > > +  initialization dependency would become X -> Y -> Z -/-> X. So th=
e best order
> > > > +  to initialize them becomes clear: Z, Y and then X.
> > > > +
> > > > +select: true
> > > > +
> > > > +properties:
> > > > +  post-init-providers:
> > >
> > > What is 'init'? It seems to mean when Linux probes the device. In
> > > U-Boot, devices all are bound at the start, but only probed (lazilly)
> > > when used. For some device types there is then an 'init' step which
> > > actually starts using the device, before which no hardware is
> > > accessed. So the use of the word 'init' seems a bit vague to me.

I'm using the word init as a short form of English word
"initialization" to mean the device has been initialized and ready to
provide its services. Whether that means you do stuff lazily or touch
the hardware is irrelevant. For example, you can probe a device in
Linux without ever touching any hardware register of that specific
device.

I intentionally didn't use the word probe (Linux specific) or get into
specifics because it can depends on the bootloader/OS/whatever driver
model.

So, I'd keep the naming as is. All the other suggestions are more
confusing in my opinion.

-Saravana

> > >
> > > In general this binding seems liable to be specific to the OS being
> > > used. It also seems to be a hint, rather than something that must be
> > > parsed and used. However I suppose adding the suffix '-hint' would
> > > just confuse things.
> > >
> > > How about 'secondary-providers' or 'minor-providers' or
> > > 'delayed-providers' or 'deferred-providers'?
> > >
> > > Separately/alternatively I wonder if the target node is always going
> > > to be inited later, for any device that uses it. If so, perhaps a
> > > property in the target node would be better, something like:
> > >
> > > dispcc: clock-controller@2000 {
> > >    ...
> > >    minor-provider;
> >
> > That doesn't work if a node is 2 or more providers and only some of
> > them are optional/post-init/deferred.
>
> That's right. It would be nice though, if the situation you describe
> does not actually happen in practice currently.
