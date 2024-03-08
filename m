Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7582C2E3E4
	for <devicetree-spec@vger.kernel.org>; Fri,  8 Mar 2024 06:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709881144; cv=none; b=Oo2s4SYh8iEdqztPn2J2RgpAsoFDnQDyy5L+lGsuekw/vn6FRTxryDIRPYrUEPjYhjQqPlA0fhxUJ8OmSkb2d0J5zorXIOnXO/AIlhF5ZV9cTLZh37mXBKvLA8WNI4e1l8Sly7+95QQaA3QNFmLc+dWUaBejMtReQpjoD5XTGDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709881144; c=relaxed/simple;
	bh=Fk3CjfkOoRzmReZOtk3LZgvr9vo3d3ctj1cfr80aEeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJKCLq2Xgthng4qwkM/2LZ8tAMX0VmgUV/QrDO9mBYuuy60FKGhAtGE0CCec1JRQtUOIlJFBe0W3HQjAQajU1v/0+S1brcfeuc/MxHOIXWApyUMqs74+eDLBEyCPlXtlB9PgxmrcVwmN391rILQ1RyIJwzZzz6HGUj4WOHyqEY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rsawIuLI; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rsawIuLI"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-42ef8193ae6so145511cf.1
        for <devicetree-spec@vger.kernel.org>; Thu, 07 Mar 2024 22:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709881141; x=1710485941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZ+kIo0A5GOLkFEu+nkK9DmVXZAgsAyWCH+73sTxTdk=;
        b=rsawIuLId2DQ/PPcAl1PeJ1sGP6TZ0dphbeidIJqZPzlJifirYgnVz3wdhNAAzbrta
         OCJAP7ADIe6lF1fun3niBsU9Rctb+UrczJzjcZuEsCaZxzlLa/N75XMvXKKgDd90Ua5G
         /0BhI+vcGoxxKUYdqV3YbUfqwP4YRvbClujesPO5oQx286COY5IVfbC6HMpSQVfsN1NA
         avc2JqXa0U7lPj6sL7ltp0dHV71naBxLxKQgXBVGYaJ8JwOqo37Rr/QGaSSb0ztPbYcC
         sV1dlrxhRpISr0dwfruuUnWE4+ISVme1skaQ6v7OqoJuZHy4qHzhfFIlUOBEbNygvBYS
         oefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709881141; x=1710485941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZ+kIo0A5GOLkFEu+nkK9DmVXZAgsAyWCH+73sTxTdk=;
        b=FamWq22BwLvfoYtrG1zhPbUytC7NrLlwg+RJ6FUE62z0zO5t6rUUVJeDVjVMFYQDgP
         5WkeFiXVPNedsCsJc0M4O5KQAZDcDQ+GEjw+VTwysxEoUjHuWthf3f0Zv3Wv5aMZ566Y
         aUkUSdjPQZHr43P6NO/CLTx72dEvDvWr0GSh3FW8upUE8NzLXq3gUyxGSGrgWpjk/6Pv
         /imcARYSlgAvkdHdrZz7XgWGEtpjEBtOVeGxzmuuAyQyy2HtzlX8kUt7n80wUBW0oeBC
         NwDGGP01u5X3jHVtURPg7huxyuM2RAMHYhRU/J9HNe0Tc9pQ821yBCeJvyKsYmN3ZAZZ
         J6lQ==
X-Gm-Message-State: AOJu0Yzyt8hUJB62wMgSgY+qdM+0FIbYiWeE86J/Ar8sMkad5kOk+ZDf
	I1YjJNfTnvyverzZSIKyjdGyr/JJnwHzq8/5nLhuAy5tzZKtWrme4Xgn5V367wumiTx/05lK5Zm
	0VDU1tMZ85pjyU3PVpsGdD3zputqRBMKBnDSa
X-Google-Smtp-Source: AGHT+IEo6RUumyemHqeTtKrsaKvQ8+hvxLy5RR+Bs9185T7nip/F5RRy7iNxNm0cFhlbxQAFpgGmGjM3lIuJs3RSVSo=
X-Received: by 2002:a05:622a:295:b0:42e:b2a8:e239 with SMTP id
 z21-20020a05622a029500b0042eb2a8e239mr528391qtw.21.1709881141281; Thu, 07 Mar
 2024 22:59:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308065633.2180623-1-saravanak@google.com>
In-Reply-To: <20240308065633.2180623-1-saravanak@google.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 7 Mar 2024 22:58:22 -0800
Message-ID: <CAGETcx8fdJWE1BT-OCXQwVyDURSeJfXvvNS6fWfWG9z-MNZykA@mail.gmail.com>
Subject: Re: [PATCH v2] schemas: Add schema for post-init-providers
To: Rob Herring <robh@kernel.org>
Cc: devicetree-spec@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 10:56=E2=80=AFPM Saravana Kannan <saravanak@google.c=
om> wrote:
>
> The post-init-providers property can be used to break a dependency cycle =
by
> marking some provider(s) as a post-device-initialization provider(s). Thi=
s
> allows an OS to do a better job at ordering initialization and
> suspend/resume of the devices in a dependency cycle.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  dtschema/schemas/post-init-providers.yaml | 105 ++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 dtschema/schemas/post-init-providers.yaml
>
> diff --git a/dtschema/schemas/post-init-providers.yaml b/dtschema/schemas=
/post-init-providers.yaml
> new file mode 100644
> index 0000000..a329776
> --- /dev/null
> +++ b/dtschema/schemas/post-init-providers.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020, Google LLC. All rights reserved.

Sigh. Forgot to update this.

Rob, can you please just change this to 2024 on your end?

Thanks,
Saravana

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/post-init-providers.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Post-device-initialization providers
> +
> +maintainers:
> +  - Saravana Kannan <saravanak@google.com>
> +
> +description: |
> +  This property is used to indicate that the device(s) pointed to by the
> +  property are not needed for the initialization of the device that list=
s this
> +  property. This property does not make a device (that's previously not =
a
> +  provider) into a provider. It simply downgrades an existing provider t=
o a
> +  post-device-initialization provider.
> +
> +  A device can list its providers in devicetree using one or more of the
> +  standard devicetree bindings. By default, it is assumed that the provi=
der
> +  device can be initialized before the consumer device is initialized.
> +
> +  However, that assumption cannot be made when there are cyclic dependen=
cies
> +  between devices. Since each device is a provider (directly or indirect=
ly) of
> +  the others in the cycle, there is no guaranteed safe order for initial=
izing
> +  the devices in a cycle. We can try to initialize them in an arbitrary =
order
> +  and eventually successfully initialize all of them, but that doesn't a=
lways
> +  work well.
> +
> +  For example, say,
> +  * The device tree has the following cyclic dependency X -> Y -> Z -> X=
 (where
> +    -> denotes "depends on").
> +  * But X is not needed to fully initialize Z (X might be needed only wh=
en a
> +    specific functionality is requested after initialization of Z).
> +
> +  If all the other -> are mandatory initialization dependencies, then tr=
ying to
> +  initialize the devices in a loop (or arbitrarily) will always eventual=
ly end
> +  up with the devices being initialized in the order Z, Y and X.
> +
> +  However, if Y is an optional provider for X (where X provides limited
> +  functionality when Y is not initialized and providing its services), t=
hen
> +  trying to initialize the devices in a loop (or arbitrarily) could end =
up with
> +  the devices being initialized in the following order:
> +
> +  * Z, Y and X - All devices provide full functionality
> +  * Z, X and Y - X provides partial functionality
> +  * X, Z and Y - X provides partial functionality
> +
> +  However, we always want to initialize the devices in the order Z, Y an=
d X
> +  since that provides the full functionality without interruptions.
> +
> +  One alternate option that might be suggested is to have the driver for=
 X
> +  notice that Y became available at a later point and adjust the functio=
nality
> +  it provides. However, other userspace applications could have started =
using X
> +  with the limited functionality before Y was available and it might not=
 be
> +  possible to transparently transition X or the users of X to full
> +  functionality while X is in use.
> +
> +  Similarly, when it comes to suspend (resume) ordering, it's unclear wh=
ich
> +  device in a dependency cycle needs to be suspended/resumed first and t=
rying
> +  arbitrary orders can result in system crashes or instability.
> +
> +  Explicitly calling out which link in a cycle needs to be broken when
> +  determining the order, simplifies things a lot, improves efficiency, m=
akes
> +  the behavior more deterministic and maximizes the functionality that c=
an be
> +  provided without interruption.
> +
> +  This property is used to provide this additional information between d=
evices
> +  in a cycle by telling which provider(s) is not needed for initializing=
 the
> +  device that lists this property.
> +
> +  In the example above, Z would list X as a post-init-providers and the
> +  initialization dependency would become X -> Y -> Z -/-> X. So the best=
 order
> +  to initialize them becomes clear: Z, Y and then X.
> +
> +select: true
> +
> +properties:
> +  post-init-providers:
> +    # One or more providers can be marked as post initialization provide=
r
> +    description:
> +      List of phandles to providers that are not needed for initializing=
 or
> +      resuming this device.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      maxItems: 1
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    gcc: clock-controller@1000 {
> +        compatible =3D "vendor,soc4-gcc", "vendor,soc1-gcc";
> +        reg =3D <0x1000 0x80>;
> +        clocks =3D <&dispcc 0x1>;
> +        #clock-cells =3D <1>;
> +        post-init-providers =3D <&dispcc>;
> +    };
> +    dispcc: clock-controller@2000 {
> +        compatible =3D "vendor,soc4-dispcc", "vendor,soc1-dispcc";
> +        reg =3D <0x2000 0x80>;
> +        clocks =3D <&gcc 0xdd>;
> +        #clock-cells =3D <1>;
> +    };
> --
> 2.44.0.278.ge034bb2e1d-goog
>
