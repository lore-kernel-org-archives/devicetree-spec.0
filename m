Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF35416FF3B
	for <devicetree-spec@vger.kernel.org>; Tue, 12 Mar 2024 22:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710281361; cv=none; b=KO0+x+1Zzy3eWehmdJJXHodH0Z211MUH14iM29u72gJTL1uLWINUbdzBf07NtiEizdg4AajbwlpSoPChXHN6HtiwZZWAnA2Z9hjSsUksjSsEmpJiPq2wup5ZYjzHEPNgoXCzNRfqmsF3xSFihp3NVQ5NFI7/Xd12dl9xQpjAhds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710281361; c=relaxed/simple;
	bh=uBF21fTiFJ6PA+VJn4yQo1vItlX+KzjgfThA3T+KWTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpE2xKRisPfMlGfXWXDNN4aljvs5zh7y8Q3eKodQVu7Io9lbmZFWUC4ICR9APcKdI7XXjuZYhPpNfa4zoE/LfcqRnPMxvsQ5fcGov9r24xsKqy+ApgcmCZpAfvWecZ/fdN4TOxS8fgC47vI/IKlF83/BOSeS+bnuEE/BU+LjwnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MukkzQAF; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MukkzQAF"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-68f571be9ddso49457106d6.0
        for <devicetree-spec@vger.kernel.org>; Tue, 12 Mar 2024 15:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710281359; x=1710886159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+i+Q37AUM+QepQId9N1f4bADag39sMOKFltfh/oWOM=;
        b=MukkzQAFT1s/4Qcm2r7ilErm5v3YsBkDrS/e+vwVdFKhGjKTdiP7oDt2zWG9JYSiru
         wzQEOq+CwXQ4SCsyCWedNsKctoEgy9kzU/gEdVcMaWRyG7Ud4ZKIv6ayvW1f+75HxWkO
         YAFQNh14kQFB2WNE9rSUvu0/XrCesPI+7b274=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710281359; x=1710886159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+i+Q37AUM+QepQId9N1f4bADag39sMOKFltfh/oWOM=;
        b=EYlDr+CQLOFU62ULYs7E/iTJwJ0CLaUy1W//ekheJwL49aBGmU10O7lpbRy0pAl0GP
         hvQ8CX6CNtKhlpezd/ruHhGD6/8sfcqeWZKhHRKpOfW8MXwS/n/HAxd3xzhN0X733YtE
         PrjGJ1yQARm+iCPQ8yVlXkrbTqwmXKfJ+hDfl+Wsxg/2MxIX+fKXxfxyLNU+q9twRvyK
         hDi5k+5J6ZR7uKiPo990IOohGIvyin+L2uyn/lSBAC7RLJVGgaBgR+j6EMle39MSb29P
         ouxylEPyYpb64Jfd+aFygAumU1tbAg1SB9HI6HJpDptLc+L4n/F1CzRiyP6awaWZL9/2
         k0ng==
X-Forwarded-Encrypted: i=1; AJvYcCViOSRNiK5F2RBSvCzCrClXAMjFlpBg+ITLuU7eYXbHcj2TR5TyZEZuPMLuNpWInLjwfm7L0EojpWD5zeRrZbfnq9Jn/8NC7usNMAeejF5f
X-Gm-Message-State: AOJu0YyQ/OQTGCe2OAwmglbAmxj9bTi5XQzBLkHV9/yuBI6KkdxUoji8
	UyVoo1gi78Bstc1KaCEJsV7HVDcF9JS+lpBOB1IybcuARVWHrqcdIRqp/WYkDemkrY9He3YWfkP
	hAMvGZEGcEP3zmoqGkpcEcbfqY6qRPir77eFr
X-Google-Smtp-Source: AGHT+IGsbGIIZ1gW4ILgja/D3B7hYhLK45NhAsK8wxjjXMexRGGF1c9a1F57xBmKuKEeDDrpR4g1Afn8luV0qorV/yE=
X-Received: by 2002:a0c:8bc2:0:b0:68f:6410:99d7 with SMTP id
 a2-20020a0c8bc2000000b0068f641099d7mr11458952qvc.64.1710281358853; Tue, 12
 Mar 2024 15:09:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306002951.1601630-1-saravanak@google.com>
 <CAFLszTiv7bHumx7T2y3CNaWPE=tkttQU2Uak-uu1foeZZr+KEw@mail.gmail.com>
 <CAL_JsqLueXDRS7LPr3gHGSc4vYmt2TeteAm9d=wiO4kWEe3G6g@mail.gmail.com>
 <CAFLszThOtKK43RGmyYCvd0+pQB8fby9Bsv_tX4jNuMi3L91AnQ@mail.gmail.com> <CAGETcx8cNP-xYFKbjvUnRgm7vPP9iHEqOUAhQBG+V8axOKVB4A@mail.gmail.com>
In-Reply-To: <CAGETcx8cNP-xYFKbjvUnRgm7vPP9iHEqOUAhQBG+V8axOKVB4A@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 13 Mar 2024 11:09:07 +1300
Message-ID: <CAFLszTgiyQXqVF48GnHAt1ANwKQK_GxwTrOXQVUrpuOYpocCqw@mail.gmail.com>
Subject: Re: [PATCH v1] schemas: Add schema for post-init-providers
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh@kernel.org>, devicetree-spec@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Saravana,

On Fri, 8 Mar 2024 at 19:48, Saravana Kannan <saravanak@google.com> wrote:
>
> On Thu, Mar 7, 2024 at 12:55=E2=80=AFPM Simon Glass <sjg@chromium.org> wr=
ote:
> >
> > Hi Rob,
> >
> > On Thu, 7 Mar 2024 at 11:23, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Wed, Mar 6, 2024 at 1:17=E2=80=AFPM Simon Glass <sjg@chromium.org>=
 wrote:
> > > >
> > > > Hi Saravana,
> > > >
> > > > On Wed, 6 Mar 2024 at 13:30, Saravana Kannan <saravanak@google.com>=
 wrote:
> > > > >
> > > > > The post-init-providers property can be used to break a dependenc=
y cycle by
> > > > > marking some provider(s) as a post device initialization provider=
(s). This
> > > >
> > > > Please can you add hyphens to avoid confusion? I believe this shoul=
d
> > > > be 'post-device-initialization' throughout. There is no 'post' devi=
ce.
> > >
> > > There is no 'post-device-initialization' thing either. Shrug.
> >
> > 'post-device-initialization' is intended to be an adjective and the
> > hyphens help to make that clear.
>
> I think it's clear enough, but I'll do it just for you :)

:)

>
> > >
> > > > > allows an OS to do a better job at ordering initialization and
> > > > > suspend/resume of the devices in a dependency cycle.
> > > > >
> > > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > > ---
> > > > >  dtschema/schemas/post-init-providers.yaml | 105 ++++++++++++++++=
++++++
> > > > >  1 file changed, 105 insertions(+)
> > > > >  create mode 100644 dtschema/schemas/post-init-providers.yaml
> > > > >
> > > > > diff --git a/dtschema/schemas/post-init-providers.yaml b/dtschema=
/schemas/post-init-providers.yaml
> > > > > new file mode 100644
> > > > > index 0000000..92eb9a0
> > > > > --- /dev/null
> > > > > +++ b/dtschema/schemas/post-init-providers.yaml
> > > > > @@ -0,0 +1,105 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +# Copyright (c) 2020, Google LLC. All rights reserved.
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/post-init-providers.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Post device initialization providers
> > > > > +
> > > > > +maintainers:
> > > > > +  - Saravana Kannan <saravanak@google.com>
> > > > > +
> > > > > +description: |
> > > > > +  This property is used to indicate that the device(s) pointed t=
o by the
> > > >
> > > > Should this be 'device node' instead of 'device'?
>
> I think device is more appropriate. Not every device node is a device
> (eg: the pinctrl map, the remote endpoints pointed to by
> remote-endpoints, etc). And with the property you are pointing to a
> device node that represents a device.

I see what you are saying. It's just that this is a devicetree with
nodes, not a device model. So whether a particular node produces a
device is really a separate issue..

Anyway, it is only a minor thing.

>
> > > >
> > > > > +  property are not needed for the initialization of the device t=
hat lists this
> > > > > +  property. This property does not make a device (that's previou=
sly not a
> > > > > +  provider) into a provider. It simply downgrades an existing pr=
ovider to a
> > > > > +  post device initialization provider.
> > > > > +
> > > > > +  A device can list its providers in devicetree using one or mor=
e of the
> > > > > +  standard devicetree bindings. By default, it is assumed that t=
he provider
> > > > > +  device can be initialized before the consumer device is initia=
lized.
> > > > > +
> > > > > +  However, that assumption cannot be made when there are cyclic =
dependencies
> > > > > +  between devices. Since each device is a provider (directly or =
indirectly) of
> > > > > +  the others in the cycle, there is no guaranteed safe order for=
 initializing
> > > > > +  the devices in a cycle. We can try to initialize them in an ar=
bitrary order
> > > > > +  and eventually successfully initialize all of them, but that d=
oesn't always
> > > > > +  work well.
> > > > > +
> > > > > +  For example, say,
> > > > > +  * The device tree has the following cyclic dependency X -> Y -=
> Z -> X (where
> > > > > +    -> denotes "depends on").
> > > > > +  * But X is not needed to fully initialize Z (X might be needed=
 only when a
> > > > > +    specific functionality is requested post initialization).
> > > >
> > > > How about 'is requested after initialization of Z'
>
> Sure.
>
> > > >
> > > > > +
> > > > > +  If all the other -> are mandatory initialization dependencies,=
 then trying to
> > > > > +  initialize the devices in a loop (or arbitrarily) will always =
eventually end
> > > > > +  up with the devices being initialized in the order Z, Y and X.
> > > > > +
> > > > > +  However, if Y is an optional provider for X (where X provides =
limited
> > > > > +  functionality when Y is not initialized and providing its serv=
ices), then
> > > > > +  trying to initialize the devices in a loop (or arbitrarily) co=
uld end up with
> > > > > +  the devices being initialized in the following order:
> > > > > +
> > > > > +  * Z, Y and X - All devices provide full functionality
> > > > > +  * Z, X and Y - X provides partial functionality
> > > > > +  * X, Z and Y - X provides partial functionality
> > > > > +
> > > > > +  However, we always want to initialize the devices in the order=
 Z, Y and X
> > > > > +  since that provides the full functionality without interruptio=
ns.
> > > > > +
> > > > > +  One alternate option that might be suggested is to have the dr=
iver for X
> > > > > +  notice that Y became available at a later point and adjust the=
 functionality
> > > > > +  it provides. However, other userspace applications could have =
started using X
> > > > > +  with the limited functionality before Y was available and it m=
ight not be
> > > > > +  possible to transparently transition X or the users of X to fu=
ll
> > > > > +  functionality while X is in use.
> > > >
> > > > This seems strange to me. It seems like something that could be
> > > > implemented. That said, I understand that such an implementation co=
uld
> > > > become painful.
> > >
> > > It has been implemented. And cycle detection has been implemented. An=
d
> > > yet we are still here needing something more.
> >
> > Sure, I understand that.
> >
> > >
> > >
> > > > > +  Similarly, when it comes to suspend (resume) ordering, it's un=
clear which
> > > > > +  device in a dependency cycle needs to be suspended/resumed fir=
st and trying
> > > > > +  arbitrary orders can result in system crashes or instability.
> > > > > +
> > > > > +  Explicitly calling out which link in a cycle needs to be broke=
n when
> > > > > +  determining the order, simplifies things a lot, improves effic=
iency, makes
> > > > > +  the behavior more deterministic and maximizes the functionalit=
y that can be
> > > > > +  provided without interruption.
> > > > > +
> > > > > +  This property is used to provide this additional information b=
etween devices
> > > > > +  in a cycle by telling which provider(s) is not needed for init=
ializing the
> > > > > +  device that lists this property.
> > > > > +
> > > > > +  In the example above, Z would list X as a post-init-providers =
and the
> > > > > +  initialization dependency would become X -> Y -> Z -/-> X. So =
the best order
> > > > > +  to initialize them becomes clear: Z, Y and then X.
> > > > > +
> > > > > +select: true
> > > > > +
> > > > > +properties:
> > > > > +  post-init-providers:
> > > >
> > > > What is 'init'? It seems to mean when Linux probes the device. In
> > > > U-Boot, devices all are bound at the start, but only probed (lazill=
y)
> > > > when used. For some device types there is then an 'init' step which
> > > > actually starts using the device, before which no hardware is
> > > > accessed. So the use of the word 'init' seems a bit vague to me.
>
> I'm using the word init as a short form of English word
> "initialization" to mean the device has been initialized and ready to
> provide its services. Whether that means you do stuff lazily or touch
> the hardware is irrelevant. For example, you can probe a device in
> Linux without ever touching any hardware register of that specific
> device.
>
> I intentionally didn't use the word probe (Linux specific) or get into
> specifics because it can depends on the bootloader/OS/whatever driver
> model.

Sure, I understand that init means initialisation...my point is that
this depends on what is initialised at this point.

'probe' is used in U-Boot to mean that a bound device is activated.

>
> So, I'd keep the naming as is. All the other suggestions are more
> confusing in my opinion.

OK. I am not claiming that my suggestions are a lot better. I just
worry that post-initialisation is pretty vague, e.g. devices can go
through a few init steps. Anyway, I suppose we can deal with it later,
if this binding is not enough to get things working.

Regards,
Simon

>
> -Saravana
>
> > > >
> > > > In general this binding seems liable to be specific to the OS being
> > > > used. It also seems to be a hint, rather than something that must b=
e
> > > > parsed and used. However I suppose adding the suffix '-hint' would
> > > > just confuse things.
> > > >
> > > > How about 'secondary-providers' or 'minor-providers' or
> > > > 'delayed-providers' or 'deferred-providers'?
> > > >
> > > > Separately/alternatively I wonder if the target node is always goin=
g
> > > > to be inited later, for any device that uses it. If so, perhaps a
> > > > property in the target node would be better, something like:
> > > >
> > > > dispcc: clock-controller@2000 {
> > > >    ...
> > > >    minor-provider;
> > >
> > > That doesn't work if a node is 2 or more providers and only some of
> > > them are optional/post-init/deferred.
> >
> > That's right. It would be nice though, if the situation you describe
> > does not actually happen in practice currently.
