From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Device tree usage in TF-A & OP-Tee consultation
Date: Tue, 25 Jul 2023 08:51:48 -0600
Message-ID: <CAPnjgZ3d7-hKVZ_isAFXp_MxnNq4phWsAdJ19qKSHS7CAwp1qA@mail.gmail.com>
References: <CABOkjxJnzTm=jJUy4Zgi9kGxLTBHvmrkM80UhgSdzyYcL4xfzA@mail.gmail.com>
 <CAPnjgZ1inUgJ94kugnGSDbQ0dhfxouObyr=VjdUYG81+bv5DjQ@mail.gmail.com>
 <CABOkjxLK7udsUW=12pq36ftoRTc1ULC6r9uAzM-gFR4BDJwJ=A@mail.gmail.com>
 <CAPnjgZ1ZNb=P5Py2RvGEpE3osQ86FPs8Fdh89TVm9zD_FYhNDw@mail.gmail.com>
 <CAODwPW9-ueC6e-A766fRbiWJpiuN07WrRWVKJEoR-zRg7WYK6A@mail.gmail.com>
 <CAL_Jsq+SeqSVTP89idwo8fNUvzk_H+WcbNW7R+yasMk26EW+hA@mail.gmail.com> <CABOkjxLSKT3NvCUfxdWnMBVyaY9qCYdFupr+CRn=HXetRaWD2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690296720; x=1690901520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jSjQ6SP6cUOxbMjou7TJpndbiBeVf3XdOwvjRN2BTN0=;
        b=OI7go//QSULvmRCiCAfyi9vCudy0mwh/8sIdsE2HWAE8vpQ5/EgO2dvtxbcMNWphUK
         2PQ2YTWov1VtNRWr8HYKv88r+BGymy1ktnqTCejgOJ1Ry68cFwIj0jf7Ekj9t3hT2kTi
         AQFhFnKOZzrGT+LKmk1G6w0kR1m+HM6/sAF38=
In-Reply-To: <CABOkjxLSKT3NvCUfxdWnMBVyaY9qCYdFupr+CRn=HXetRaWD2A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeffrey Kardatzke <jkardatzke-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Yi-An Chen <chenyian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

On Mon, 24 Jul 2023 at 04:02, Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> Sorry for the late reply,
> this is the new version that moved the bindings to the /options node.
>
> From 1662ec6c6a9cbb07d83157ad9411897b4acaf1f0 Mon Sep 17 00:00:00 2001
> From: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Date: Wed, 14 Jun 2023 14:49:46 +0800
> Subject: [PATCH] dt-bindings: Add Google Widevine initialize parameters
>
> The necessary fields to initialize the widevine related functions in
> OP-TEE.
>
> Change-Id: Iceb6c533bcb60034e811d4fdf9310d9df48507de
> Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/options/google,widevine.yaml     | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/options/google,widevine.yaml
>
> diff --git a/Documentation/devicetree/bindings/options/google,widevine.yaml
> b/Documentation/devicetree/bindings/options/google,widevine.yaml
> new file mode 100644
> index 0000000000000..acfc96d162c88
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/options/google,widevine.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/options/google,widevine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Widevine initialize parameters.
> +
> +maintainers:
> +  - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> +  - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> +
> +description:
> +  The necessary fields to initialize the widevine related functions in
> +  OP-TEE. This node does not represent a real device, but serves as a
> +  place for passing data between firmware and OP-TEE.
> +
> +properties:
> +  compatible:
> +    const: google,widevine
> +
> +  huk:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The encryption key of the Widevine OP-TEE storage.
> +
> +  tpm-auth-pk:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The TPM auth public key. Used to communicate the TPM from OP-TEE.

Can you add more details about this key. What format is it in? How is
it created?

> +
> +  widevine-dice:

We should avoid the 'widevine-' prefix since it is already this node.

I don't know what the words mean in the description, so I cannot offer
a better idea.

> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The Widevine boot certificate chain(Device Identifier Composition
> +      Engine) of this device. Used to provision the device status with
> +      the Widevine server in OP-TEE.

Ditto

> +
> +  widevine-ta-key:

As above
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The Widevine private key corresponding to the widevine-dice.
> +      Used to signing the widevine request in OP-TEE.

Again, more details please

> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |+
> +    options {
> +      widevine: {
> +        compatible = "google,widevine";
> +
> +        huk = [00 de ad be af aa bb cc],
> +        tpm-auth-pk = [00 de ad be af aa bb cc],
> +        widevine-dice = [00 de ad be af aa bb cc],
> +        widevine-ta-key = [00 de ad be af aa bb cc],
> +      };
> +    };
> --
> 2.39.2
>

[..]

Regards,
Simon
