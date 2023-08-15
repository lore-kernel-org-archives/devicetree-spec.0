From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Device tree usage in TF-A & OP-Tee consultation
Date: Tue, 15 Aug 2023 08:44:16 -0600
Message-ID: <CAPnjgZ2QUEDqOkWyDm=tvBAxJRxH+TrQWDfmC8rQsSNdxR=iCQ@mail.gmail.com>
References: <CABOkjxJnzTm=jJUy4Zgi9kGxLTBHvmrkM80UhgSdzyYcL4xfzA@mail.gmail.com>
 <CAPnjgZ1inUgJ94kugnGSDbQ0dhfxouObyr=VjdUYG81+bv5DjQ@mail.gmail.com>
 <CABOkjxLK7udsUW=12pq36ftoRTc1ULC6r9uAzM-gFR4BDJwJ=A@mail.gmail.com>
 <CAPnjgZ1ZNb=P5Py2RvGEpE3osQ86FPs8Fdh89TVm9zD_FYhNDw@mail.gmail.com>
 <CAODwPW9-ueC6e-A766fRbiWJpiuN07WrRWVKJEoR-zRg7WYK6A@mail.gmail.com>
 <CAL_Jsq+SeqSVTP89idwo8fNUvzk_H+WcbNW7R+yasMk26EW+hA@mail.gmail.com>
 <CABOkjxLSKT3NvCUfxdWnMBVyaY9qCYdFupr+CRn=HXetRaWD2A@mail.gmail.com>
 <CAPnjgZ3d7-hKVZ_isAFXp_MxnNq4phWsAdJ19qKSHS7CAwp1qA@mail.gmail.com>
 <CAL_Jsq+k=7eHmta-0OqmSP8wZVErkS6zyuJ5D5V1YVKciv0Zwg@mail.gmail.com>
 <CABOkjxKG=qfgSwDpY5+=jsS4K68maPYKZA4DkKHxaJ_XHRdfNA@mail.gmail.com>
 <CAL_JsqKOEELQR6G4egrC=d94o9ZHsfuaSz0cVP8gzakZORjh7w@mail.gmail.com> <CABOkjxKwnS5K082dZgcxqZ+x5+AMeuDsW_u7mVko81_td9u_uw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692110669; x=1692715469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1Z9tdjTGVMBAGRu1JvywOrIddCUk+vF/FRZ1DrgiBw=;
        b=ixPu8wGQNEfrY6Hsdr6ilfeD4++G+lKJYiSI/FZrrTmlh6BmZfZ/r5o4+ArdwZKNZG
         Qp19EOsDpXWctH0y7fA/mtSN5DeEZs7j5bXK5CXYXGLZIQxhiSh+nbL7Yq7IP/e3PMg5
         HLuUItL3tMJY7e0t1RdHfaSXJDo6DUH66j54I=
In-Reply-To: <CABOkjxKwnS5K082dZgcxqZ+x5+AMeuDsW_u7mVko81_td9u_uw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeffrey Kardatzke <jkardatzke-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Yi-An Chen <chenyian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Hi,

On Thu, 10 Aug 2023 at 01:39, Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> On Wed, Aug 9, 2023 at 10:58=E2=80=AFPM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wro=
te:
> >
> > On Tue, Aug 8, 2023 at 2:08=E2=80=AFAM Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrot=
e:
> > >
> > > On Wed, Jul 26, 2023 at 12:37=E2=80=AFAM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org=
> wrote:
> > > >
> > > > On Tue, Jul 25, 2023 at 8:52=E2=80=AFAM Simon Glass <sjg@chromium.o=
rg> wrote:
> > > > >
> > > > > On Mon, 24 Jul 2023 at 04:02, Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > > > > >
> > > > > > Sorry for the late reply,
> > > > > > this is the new version that moved the bindings to the /options=
 node.
> > > > > >
> > > > > > From 1662ec6c6a9cbb07d83157ad9411897b4acaf1f0 Mon Sep 17 00:00:=
00 2001
> > > > > > From: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > > > > > Date: Wed, 14 Jun 2023 14:49:46 +0800
> > > > > > Subject: [PATCH] dt-bindings: Add Google Widevine initialize pa=
rameters
> > > > > >
> > > > > > The necessary fields to initialize the widevine related functio=
ns in
> > > > > > OP-TEE.
> > > > > >
> > > > > > Change-Id: Iceb6c533bcb60034e811d4fdf9310d9df48507de
> > > > > > Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > > > > > ---
> > > > > >  .../bindings/options/google,widevine.yaml     | 61 +++++++++++=
++++++++
> > > > > >  1 file changed, 61 insertions(+)
> > > > > >  create mode 100644
> > > > > > Documentation/devicetree/bindings/options/google,widevine.yaml
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/options/google,w=
idevine.yaml
> > > > > > b/Documentation/devicetree/bindings/options/google,widevine.yam=
l
> > > > > > new file mode 100644
> > > > > > index 0000000000000..acfc96d162c88
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/options/google,widevine=
.yaml
> > > > > > @@ -0,0 +1,61 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/options/google,widevine.yam=
l#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Google Widevine initialize parameters.
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > > > +  - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > > > +
> > > > > > +description:
> > > > > > +  The necessary fields to initialize the widevine related func=
tions in
> > > > > > +  OP-TEE. This node does not represent a real device, but serv=
es as a
> > > > > > +  place for passing data between firmware and OP-TEE.
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: google,widevine
> > > > > > +
> > > > > > +  huk:
> > > > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > > > +    description:
> > > > > > +      The encryption key of the Widevine OP-TEE storage.
> > > > > > +
> > > > > > +  tpm-auth-pk:
> > > > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > > > +    description:
> > > > > > +      The TPM auth public key. Used to communicate the TPM fro=
m OP-TEE.
> > > > >
> > > > > Can you add more details about this key. What format is it in? Ho=
w is
> > > > > it created?
> > > > >
> > > > > > +
> > > > > > +  widevine-dice:
> > > > >
> > > > > We should avoid the 'widevine-' prefix since it is already this n=
ode.
> > > >
> > > > Yes, but then 'dice' is pretty vague. It is preferred that property
> > > > names are unique enough to only have 1 type globally (at least with=
in
> > > > a defined size). This allows using the schemas to decode DT data.
> > > >
> > > > >
> > > > > I don't know what the words mean in the description, so I cannot =
offer
> > > > > a better idea.
> > > > >
> > > > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > > > +    description:
> > > > > > +      The Widevine boot certificate chain(Device Identifier Co=
mposition
> > > > > > +      Engine) of this device. Used to provision the device sta=
tus with
> > > > > > +      the Widevine server in OP-TEE.
> > > > >
> > > > > Ditto
> > > > >
> > > > > > +
> > > > > > +  widevine-ta-key:
> > > > >
> > > > > As above
> > > > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > > > +    description:
> > > > > > +      The Widevine private key corresponding to the widevine-d=
ice.
> > > > > > +      Used to signing the widevine request in OP-TEE.
> > > > >
> > > > > Again, more details please
> > > > >
> > > > > > +
> > > > > > +required:
> > > > > > +  - compatible
> > > >
> > > > What's the point of this binding if none of the other properties ar=
e required?
> > > >
> > > > > > +
> > > > > > +additionalProperties: false
> > > > > > +
> > > > > > +examples:
> > > > > > +  - |+
> > > > > > +    options {
> > > > > > +      widevine: {
> > > > > > +        compatible =3D "google,widevine";
> > > > > > +
> > > > > > +        huk =3D [00 de ad be af aa bb cc],
> > > > > > +        tpm-auth-pk =3D [00 de ad be af aa bb cc],
> > > > > > +        widevine-dice =3D [00 de ad be af aa bb cc],
> > > > > > +        widevine-ta-key =3D [00 de ad be af aa bb cc],
> > > > > > +      };
> > > > > > +    };
> > > > > > --
> > > > > > 2.39.2
> > > > > >
> > > > >
> > > > > [..]
> > > > >
> > > > > Regards,
> > > > > Simon
> > >
> > > Sorry for the late reply.
> > > We changed the internal format of the "widevine-dice" from COSE to
> > > X.509 recently.
> > > And here is the new patch with the corresponding changes.
> > >
> > > From 9f754c8872c411e3e4216a181b4028875f1f54fc Mon Sep 17 00:00:00 200=
1
> > > From: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > > Date: Wed, 14 Jun 2023 14:49:46 +0800
> > > Subject: [PATCH] dt-bindings: Add Google Widevine initialize paramete=
rs
> > >
> > > The necessary fields to initialize the widevine related functions in
> > > OP-TEE.
> > >
> > > Change-Id: Iceb6c533bcb60034e811d4fdf9310d9df48507de
> > > Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > > ---
> > > .../bindings/options/google,widevine.yaml | 63 +++++++++++++++++++
> > > 1 file changed, 63 insertions(+)
> > > create mode 100644
> > > Documentation/devicetree/bindings/options/google,widevine.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/options/google,widevin=
e.yaml
> > > b/Documentation/devicetree/bindings/options/google,widevine.yaml
> > > new file mode 100644
> > > index 0000000000000..874f62598b087
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/options/google,widevine.yaml
> > > @@ -0,0 +1,63 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/options/google,widevine.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Google Widevine initialize parameters.
> > > +
> > > +maintainers:
> > > + - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > + - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > +
> > > +description:
> > > + The necessary fields to initialize the widevine related functions i=
n
> > > + OP-TEE. This node does not represent a real device, but serves as a
> > > + place for passing data between firmware and OP-TEE.
> > > +
> > > +properties:
> > > + compatible:
> > > + const: google,widevine
> >
> > This isn't valid json-schema as the indentation is wrong. Please test
> > your schema with the tools.
> >
> > > +
> > > + huk:
> >
> > As mentioned previously, this is too vague.
> >
> > > + $ref: /schemas/types.yaml#/definitions/string
> >
> > Doesn't look like a string from the example.
> >
> > > + description:
> > > + The encryption key of the Widevine OP-TEE storage. The length
> > > + should be 32 bytes.
> >
> > Your example is 8 bytes.
> >
> > > +
> > > + tpm-auth-pk:
> > > + $ref: /schemas/types.yaml#/definitions/string
> > > + description:
> > > + The TPM auth public key. Used to communicate the TPM from OP-TEE.
> > > + The format of data should be TPM2B_PUBLIC.
> > > +
> > > + rot:
> > > + $ref: /schemas/types.yaml#/definitions/string
> > > + description:
> > > + The Widevine root of trust secret. Used to signing the widevine
> > > + request in OP-TEE. The length should be 32 bytes.
> > > +
> > > + rot-cert:
> > > + $ref: /schemas/types.yaml#/definitions/string
> > > + description:
> > > + The X.509 certificate of the Widevine root of trust on this
> > > + device. Used to provision the device status with the Widevine
> > > + server in OP-TEE.
> > > +
> > > +required:
> > > + - compatible
> > > + - huk
> > > + - rot
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > + - |+
> > > + options {
> > > + widevine: {
> > > + compatible =3D "google,widevine";
> > > +
> > > + huk =3D [00 de ad be af aa bb cc],
> > > + rot =3D [00 de ad be af aa bb cc],
> > > + };
> > > + };
> > > --
> > > 2.39.2
> > >
> > > Sincerely,
> > > Yi
>
> Thanks for the reply, this is the new version of this patch.
>
> From 360c63617c8cd595da41b04430993b9d435b0865 Mon Sep 17 00:00:00 2001
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
>  .../bindings/options/google,widevine.yaml     | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/options/google,widevine.yaml
>
> diff --git a/Documentation/devicetree/bindings/options/google,widevine.ya=
ml
> b/Documentation/devicetree/bindings/options/google,widevine.yaml
> new file mode 100644
> index 0000000000000..e77e9ac5be29a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/options/google,widevine.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/options/google,widevine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Widevine initialize parameters.

'initialization' would be better I think

> +
> +maintainers:
> +  - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> +  - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> +

The property names you have used seem good to me.

> +description:
> +  The necessary fields to initialize the widevine related functions in
> +  OP-TEE. This node does not represent a real device, but serves as a
> +  place for passing data between firmware and OP-TEE.
> +
> +properties:
> +  compatible:
> +    const: google,widevine
> +
> +  hardware-unique-key:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      The hardware unique key of the Widevine OP-TEE. It will be used

hardware-unique key

> +      to derive the secure storage key. The length should be 32 bytes.

What is the format of this? Do you have a link?

> +
> +  tpm-auth-public-key:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      The TPM auth public key. Used to communicate the TPM from OP-TEE.
> +      The format of data should be TPM2B_PUBLIC.

Same here. I tried to look up TPM2B_PUBLIC but didn't get very far.

If this is omitted, what does it mean?

> +
> +  root-of-trust:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      The Widevine root of trust secret. Used to sign the widevine
> +      request in OP-TEE. The length should be 32 bytes.

What is the format of this? Do you have a link?

> +
> +  root-of-trust-cert:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      The X.509 certificate of the Widevine root of trust on this
> +      device. Used to provision the device status with the Widevine
> +      server in OP-TEE.

Which format is used for the X.509 certificate?

If this is omitted, what does it mean?

> +
> +required:
> +  - compatible
> +  - hardware-unique-key
> +  - root-of-trust
> +
> +additionalProperties: false
> +
> +examples:
> +  - |+
> +    options {
> +      widevine {
> +        compatible =3D "google,widevine";
> +        hardware-unique-key =3D /bits/ 8 <
> +          0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5
> +          6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
> +        >;
> +        root-of-trust =3D /bits/ 8 <
> +          0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5
> +          6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
> +        >;

Can you please add the other fields to your example? Perhaps this
would be better to use the [] encoding for the bytes?

> +      };
> +    };
> --
> 2.39.2
>
> Sincerely,
> Yi

Regards,
Simon
