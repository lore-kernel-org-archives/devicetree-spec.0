From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Device tree usage in TF-A & OP-Tee consultation
Date: Wed, 9 Aug 2023 08:58:29 -0600
Message-ID: <CAL_JsqKOEELQR6G4egrC=d94o9ZHsfuaSz0cVP8gzakZORjh7w@mail.gmail.com>
References: <CABOkjxJnzTm=jJUy4Zgi9kGxLTBHvmrkM80UhgSdzyYcL4xfzA@mail.gmail.com>
 <CAPnjgZ1inUgJ94kugnGSDbQ0dhfxouObyr=VjdUYG81+bv5DjQ@mail.gmail.com>
 <CABOkjxLK7udsUW=12pq36ftoRTc1ULC6r9uAzM-gFR4BDJwJ=A@mail.gmail.com>
 <CAPnjgZ1ZNb=P5Py2RvGEpE3osQ86FPs8Fdh89TVm9zD_FYhNDw@mail.gmail.com>
 <CAODwPW9-ueC6e-A766fRbiWJpiuN07WrRWVKJEoR-zRg7WYK6A@mail.gmail.com>
 <CAL_Jsq+SeqSVTP89idwo8fNUvzk_H+WcbNW7R+yasMk26EW+hA@mail.gmail.com>
 <CABOkjxLSKT3NvCUfxdWnMBVyaY9qCYdFupr+CRn=HXetRaWD2A@mail.gmail.com>
 <CAPnjgZ3d7-hKVZ_isAFXp_MxnNq4phWsAdJ19qKSHS7CAwp1qA@mail.gmail.com>
 <CAL_Jsq+k=7eHmta-0OqmSP8wZVErkS6zyuJ5D5V1YVKciv0Zwg@mail.gmail.com> <CABOkjxKG=qfgSwDpY5+=jsS4K68maPYKZA4DkKHxaJ_XHRdfNA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691593123;
        bh=FJm7DPoUB5C0qliZ99AKLVkGAWEVDtmLeD3LW7kORck=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qrA/np8+V2H2XYnYrPwNp7kMWFVnmbOAybr8scciDsXik7p6L93cbo6Q/k4Qd75Il
         eT+75QK8H9olABI0kf2+zzthi+gf0vBMvcZspc6VfCdtFwWJsO0iTMv2hKTEBwqNQp
         8Ch4mUsDYTWGBVqbLWvxWb+SBUaamVJsdvTZ8BVe0mpMJIPkQcY3KbIKUtyqUX44IT
         7sRLl6i320SvmM95Z3PGLnD3qZnzUM/aXfUTuHu/YYD3zGZkS7oN4Nh4dhq4mcVQFh
         +2Au/BdUn0+WhGwSUuI02flbHQmuZYfwXC+HITgOOGlWapWWjgEzWmhZeBn52PHb3N
         iH+8DFyXMP91Q==
In-Reply-To: <CABOkjxKG=qfgSwDpY5+=jsS4K68maPYKZA4DkKHxaJ_XHRdfNA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeffrey Kardatzke <jkardatzke-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Yi-An Chen <chenyian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

On Tue, Aug 8, 2023 at 2:08=E2=80=AFAM Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> On Wed, Jul 26, 2023 at 12:37=E2=80=AFAM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wr=
ote:
> >
> > On Tue, Jul 25, 2023 at 8:52=E2=80=AFAM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> =
wrote:
> > >
> > > On Mon, 24 Jul 2023 at 04:02, Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > > >
> > > > Sorry for the late reply,
> > > > this is the new version that moved the bindings to the /options nod=
e.
> > > >
> > > > From 1662ec6c6a9cbb07d83157ad9411897b4acaf1f0 Mon Sep 17 00:00:00 2=
001
> > > > From: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > > > Date: Wed, 14 Jun 2023 14:49:46 +0800
> > > > Subject: [PATCH] dt-bindings: Add Google Widevine initialize parame=
ters
> > > >
> > > > The necessary fields to initialize the widevine related functions i=
n
> > > > OP-TEE.
> > > >
> > > > Change-Id: Iceb6c533bcb60034e811d4fdf9310d9df48507de
> > > > Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > >  .../bindings/options/google,widevine.yaml     | 61 +++++++++++++++=
++++
> > > >  1 file changed, 61 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/options/google,widevine.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/options/google,widev=
ine.yaml
> > > > b/Documentation/devicetree/bindings/options/google,widevine.yaml
> > > > new file mode 100644
> > > > index 0000000000000..acfc96d162c88
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/options/google,widevine.yam=
l
> > > > @@ -0,0 +1,61 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/options/google,widevine.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Google Widevine initialize parameters.
> > > > +
> > > > +maintainers:
> > > > +  - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > +  - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > +
> > > > +description:
> > > > +  The necessary fields to initialize the widevine related function=
s in
> > > > +  OP-TEE. This node does not represent a real device, but serves a=
s a
> > > > +  place for passing data between firmware and OP-TEE.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: google,widevine
> > > > +
> > > > +  huk:
> > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > +    description:
> > > > +      The encryption key of the Widevine OP-TEE storage.
> > > > +
> > > > +  tpm-auth-pk:
> > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > +    description:
> > > > +      The TPM auth public key. Used to communicate the TPM from OP=
-TEE.
> > >
> > > Can you add more details about this key. What format is it in? How is
> > > it created?
> > >
> > > > +
> > > > +  widevine-dice:
> > >
> > > We should avoid the 'widevine-' prefix since it is already this node.
> >
> > Yes, but then 'dice' is pretty vague. It is preferred that property
> > names are unique enough to only have 1 type globally (at least within
> > a defined size). This allows using the schemas to decode DT data.
> >
> > >
> > > I don't know what the words mean in the description, so I cannot offe=
r
> > > a better idea.
> > >
> > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > +    description:
> > > > +      The Widevine boot certificate chain(Device Identifier Compos=
ition
> > > > +      Engine) of this device. Used to provision the device status =
with
> > > > +      the Widevine server in OP-TEE.
> > >
> > > Ditto
> > >
> > > > +
> > > > +  widevine-ta-key:
> > >
> > > As above
> > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > +    description:
> > > > +      The Widevine private key corresponding to the widevine-dice.
> > > > +      Used to signing the widevine request in OP-TEE.
> > >
> > > Again, more details please
> > >
> > > > +
> > > > +required:
> > > > +  - compatible
> >
> > What's the point of this binding if none of the other properties are re=
quired?
> >
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |+
> > > > +    options {
> > > > +      widevine: {
> > > > +        compatible =3D "google,widevine";
> > > > +
> > > > +        huk =3D [00 de ad be af aa bb cc],
> > > > +        tpm-auth-pk =3D [00 de ad be af aa bb cc],
> > > > +        widevine-dice =3D [00 de ad be af aa bb cc],
> > > > +        widevine-ta-key =3D [00 de ad be af aa bb cc],
> > > > +      };
> > > > +    };
> > > > --
> > > > 2.39.2
> > > >
> > >
> > > [..]
> > >
> > > Regards,
> > > Simon
>
> Sorry for the late reply.
> We changed the internal format of the "widevine-dice" from COSE to
> X.509 recently.
> And here is the new patch with the corresponding changes.
>
> From 9f754c8872c411e3e4216a181b4028875f1f54fc Mon Sep 17 00:00:00 2001
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
> .../bindings/options/google,widevine.yaml | 63 +++++++++++++++++++
> 1 file changed, 63 insertions(+)
> create mode 100644
> Documentation/devicetree/bindings/options/google,widevine.yaml
>
> diff --git a/Documentation/devicetree/bindings/options/google,widevine.ya=
ml
> b/Documentation/devicetree/bindings/options/google,widevine.yaml
> new file mode 100644
> index 0000000000000..874f62598b087
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/options/google,widevine.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/options/google,widevine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Widevine initialize parameters.
> +
> +maintainers:
> + - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> + - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> +
> +description:
> + The necessary fields to initialize the widevine related functions in
> + OP-TEE. This node does not represent a real device, but serves as a
> + place for passing data between firmware and OP-TEE.
> +
> +properties:
> + compatible:
> + const: google,widevine

This isn't valid json-schema as the indentation is wrong. Please test
your schema with the tools.

> +
> + huk:

As mentioned previously, this is too vague.

> + $ref: /schemas/types.yaml#/definitions/string

Doesn't look like a string from the example.

> + description:
> + The encryption key of the Widevine OP-TEE storage. The length
> + should be 32 bytes.

Your example is 8 bytes.

> +
> + tpm-auth-pk:
> + $ref: /schemas/types.yaml#/definitions/string
> + description:
> + The TPM auth public key. Used to communicate the TPM from OP-TEE.
> + The format of data should be TPM2B_PUBLIC.
> +
> + rot:
> + $ref: /schemas/types.yaml#/definitions/string
> + description:
> + The Widevine root of trust secret. Used to signing the widevine
> + request in OP-TEE. The length should be 32 bytes.
> +
> + rot-cert:
> + $ref: /schemas/types.yaml#/definitions/string
> + description:
> + The X.509 certificate of the Widevine root of trust on this
> + device. Used to provision the device status with the Widevine
> + server in OP-TEE.
> +
> +required:
> + - compatible
> + - huk
> + - rot
> +
> +additionalProperties: false
> +
> +examples:
> + - |+
> + options {
> + widevine: {
> + compatible =3D "google,widevine";
> +
> + huk =3D [00 de ad be af aa bb cc],
> + rot =3D [00 de ad be af aa bb cc],
> + };
> + };
> --
> 2.39.2
>
> Sincerely,
> Yi
