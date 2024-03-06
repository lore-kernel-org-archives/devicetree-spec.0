Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BF913BAE2
	for <devicetree-spec@vger.kernel.org>; Wed,  6 Mar 2024 19:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709752647; cv=none; b=UU6NJK3TDP/aaSfpVUN0x9GYBEfnGgXSIG0OLpBkEDNwuGSI9iBaY1seEGSXjNioZR7dRw6U2k+fND0t43KWbLQO9tmTTRWFE9Wm6p3Cf9u1Ri2MwdopHjBoeuzopM4HN2G5mSYQnludtvdpTBGAuL9PJrceu526+LUV4Rx6ORw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709752647; c=relaxed/simple;
	bh=0PleTyjEH6B3JO/3+fR7WbnvWBwyQ22xkHIGHJLOwFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEPcnUrKAvHsSv4VdC3ywZnMn0wl7EgdURkeTjpt3eiMRZ7zIRy3yxd9o4OnYF0cP2nMoqWJFDlLsjajKrGkCcW2/JyuoFmYn0w3C+P3/Pq7JfirpS4Et+JM5Zhsb8WU0kM2oFo/DrMT+Pi1cSJxzpQFu3CrK7WQKZBbDLOgoK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ECoCANbr; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ECoCANbr"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-68fb730fdd5so248486d6.2
        for <devicetree-spec@vger.kernel.org>; Wed, 06 Mar 2024 11:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709752644; x=1710357444; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wehZZTGiE99oWCeH0RGh0oBm3yK/Rn02LMpuFoWyiNA=;
        b=ECoCANbriN0S4HDiaxO9EymvazZTs+KJ0koXiuu9uXKYm5x6Q4MYOsmoSrUkyIZcia
         I4DvgBRD6FrvfKx2Yy6Cmyi1iC5Q3/BqesRRTHz6yN0yeolDomLz5gx0VM3Iliw8tGCc
         6iKZfmEKCYe/Vou0+UZhgjE3VqjAv47kQEdpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709752644; x=1710357444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wehZZTGiE99oWCeH0RGh0oBm3yK/Rn02LMpuFoWyiNA=;
        b=DDgInganWEr8lqfuc4MMeGQHybQrM9NtQvG3sj1x86XXbapIQIA90bWE0sD58r7yc2
         rybODjNC6YFixDpx8klLTLhJ3lPTnJ4xOcYkeHUR4JBbuZkAP43hBaQkogK7ZUSDUkyM
         vbNeiJ4R80oBXueL1fvmf75pPvp+zPwqkugMhVnybhDUeXEXQf9VCLMZyHDoHZFZFdo/
         0++eyZpUMy3hDJPAT7z8uUtinHx4aqZtkH0lui9d0+ePK9vQNQD4nf5zC3AR6/7+sST8
         irzKQxjf2GlfvCpGXeTl+Oe207VjJrQdsS//3Fi/cvwg9hl8Thw900Fd9SSIXqH3ie0N
         toJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGN9BTwC4hznNa6PpUmIYEtYVku599Y4pbNxIlIepZXFpsp3G+rl77lQEUvPjl3ZdKBPs/2kNcUnK9Q3Owif2mksQt8pKAVHvkzZGWILwk
X-Gm-Message-State: AOJu0YyG/AaNbRcWstyIg5tBSkfDIp7rZHfTqLtVkiIgtC1GscYsZWyG
	eRVlLN1hTIxMk5t5Sd5oIhrrHaAGeejSirslMVXDJ99LLrQi0M6Lc+rJv3J6sfUb3fiatI44Wm+
	xkI3XZhFHpgYDTIYWDHmKqQ36hFVZ5Rjxh6XC4mPcYQUT4mUUuA==
X-Google-Smtp-Source: AGHT+IEpn4b/wjezkFTI9EhOexjttctXoL5tfBZYZI2C6aVnHjeLTOUrmucaletD0YJ625gwa+UKNr2kD/hImdJt7FI=
X-Received: by 2002:a0c:cb03:0:b0:68f:f0ce:3619 with SMTP id
 o3-20020a0ccb03000000b0068ff0ce3619mr5994463qvk.29.1709752644322; Wed, 06 Mar
 2024 11:17:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306002951.1601630-1-saravanak@google.com>
In-Reply-To: <20240306002951.1601630-1-saravanak@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 7 Mar 2024 08:17:13 +1300
Message-ID: <CAFLszTiv7bHumx7T2y3CNaWPE=tkttQU2Uak-uu1foeZZr+KEw@mail.gmail.com>
Subject: Re: [PATCH v1] schemas: Add schema for post-init-providers
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh@kernel.org>, devicetree-spec@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Saravana,

On Wed, 6 Mar 2024 at 13:30, Saravana Kannan <saravanak@google.com> wrote:
>
> The post-init-providers property can be used to break a dependency cycle by
> marking some provider(s) as a post device initialization provider(s). This

Please can you add hyphens to avoid confusion? I believe this should
be 'post-device-initialization' throughout. There is no 'post' device.

> allows an OS to do a better job at ordering initialization and
> suspend/resume of the devices in a dependency cycle.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  dtschema/schemas/post-init-providers.yaml | 105 ++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 dtschema/schemas/post-init-providers.yaml
>
> diff --git a/dtschema/schemas/post-init-providers.yaml b/dtschema/schemas/post-init-providers.yaml
> new file mode 100644
> index 0000000..92eb9a0
> --- /dev/null
> +++ b/dtschema/schemas/post-init-providers.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020, Google LLC. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/post-init-providers.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Post device initialization providers
> +
> +maintainers:
> +  - Saravana Kannan <saravanak@google.com>
> +
> +description: |
> +  This property is used to indicate that the device(s) pointed to by the

Should this be 'device node' instead of 'device'?

> +  property are not needed for the initialization of the device that lists this
> +  property. This property does not make a device (that's previously not a
> +  provider) into a provider. It simply downgrades an existing provider to a
> +  post device initialization provider.
> +
> +  A device can list its providers in devicetree using one or more of the
> +  standard devicetree bindings. By default, it is assumed that the provider
> +  device can be initialized before the consumer device is initialized.
> +
> +  However, that assumption cannot be made when there are cyclic dependencies
> +  between devices. Since each device is a provider (directly or indirectly) of
> +  the others in the cycle, there is no guaranteed safe order for initializing
> +  the devices in a cycle. We can try to initialize them in an arbitrary order
> +  and eventually successfully initialize all of them, but that doesn't always
> +  work well.
> +
> +  For example, say,
> +  * The device tree has the following cyclic dependency X -> Y -> Z -> X (where
> +    -> denotes "depends on").
> +  * But X is not needed to fully initialize Z (X might be needed only when a
> +    specific functionality is requested post initialization).

How about 'is requested after initialization of Z'

> +
> +  If all the other -> are mandatory initialization dependencies, then trying to
> +  initialize the devices in a loop (or arbitrarily) will always eventually end
> +  up with the devices being initialized in the order Z, Y and X.
> +
> +  However, if Y is an optional provider for X (where X provides limited
> +  functionality when Y is not initialized and providing its services), then
> +  trying to initialize the devices in a loop (or arbitrarily) could end up with
> +  the devices being initialized in the following order:
> +
> +  * Z, Y and X - All devices provide full functionality
> +  * Z, X and Y - X provides partial functionality
> +  * X, Z and Y - X provides partial functionality
> +
> +  However, we always want to initialize the devices in the order Z, Y and X
> +  since that provides the full functionality without interruptions.
> +
> +  One alternate option that might be suggested is to have the driver for X
> +  notice that Y became available at a later point and adjust the functionality
> +  it provides. However, other userspace applications could have started using X
> +  with the limited functionality before Y was available and it might not be
> +  possible to transparently transition X or the users of X to full
> +  functionality while X is in use.

This seems strange to me. It seems like something that could be
implemented. That said, I understand that such an implementation could
become painful.

> +
> +  Similarly, when it comes to suspend (resume) ordering, it's unclear which
> +  device in a dependency cycle needs to be suspended/resumed first and trying
> +  arbitrary orders can result in system crashes or instability.
> +
> +  Explicitly calling out which link in a cycle needs to be broken when
> +  determining the order, simplifies things a lot, improves efficiency, makes
> +  the behavior more deterministic and maximizes the functionality that can be
> +  provided without interruption.
> +
> +  This property is used to provide this additional information between devices
> +  in a cycle by telling which provider(s) is not needed for initializing the
> +  device that lists this property.
> +
> +  In the example above, Z would list X as a post-init-providers and the
> +  initialization dependency would become X -> Y -> Z -/-> X. So the best order
> +  to initialize them becomes clear: Z, Y and then X.
> +
> +select: true
> +
> +properties:
> +  post-init-providers:

What is 'init'? It seems to mean when Linux probes the device. In
U-Boot, devices all are bound at the start, but only probed (lazilly)
when used. For some device types there is then an 'init' step which
actually starts using the device, before which no hardware is
accessed. So the use of the word 'init' seems a bit vague to me.

In general this binding seems liable to be specific to the OS being
used. It also seems to be a hint, rather than something that must be
parsed and used. However I suppose adding the suffix '-hint' would
just confuse things.

How about 'secondary-providers' or 'minor-providers' or
'delayed-providers' or 'deferred-providers'?

Separately/alternatively I wonder if the target node is always going
to be inited later, for any device that uses it. If so, perhaps a
property in the target node would be better, something like:

dispcc: clock-controller@2000 {
   ...
   minor-provider;
};

Another reason for this approach would be that it could be easier to
parse / process. With the binding as you have written, each type of
device (clocks, powerdomain, etc.) will presumably have to parse the
post-init-providers piece, or have it provided as a function
parameter.

> +    # One or more providers can be marked as post initialization provider
> +    description:
> +      List of phandles to providers that are not needed for initializing or
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
> +        compatible = "vendor,soc4-gcc", "vendor,soc1-gcc";
> +        reg = <0x1000 0x80>;
> +        clocks = <&dispcc 0x1>;
> +        #clock-cells = <1>;
> +        post-init-providers = <&dispcc>;
> +    };
> +    dispcc: clock-controller@2000 {
> +        compatible = "vendor,soc4-dispcc", "vendor,soc1-dispcc";
> +        reg = <0x2000 0x80>;
> +        clocks = <&gcc 0xdd>;
> +        #clock-cells = <1>;
> +    };
> --
> 2.44.0.278.ge034bb2e1d-goog
>
>

Regards,
Simon
