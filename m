From: Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Device tree usage in TF-A & OP-Tee consultation
Date: Wed, 16 Aug 2023 07:58:02 +0800
Message-ID: <CABOkjx+DT99NgWCWmKyexDvDR8-RLOdjnXpoOr5MOBeFwdwd9w@mail.gmail.com>
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
 <CAL_JsqKOEELQR6G4egrC=d94o9ZHsfuaSz0cVP8gzakZORjh7w@mail.gmail.com>
 <CABOkjxKwnS5K082dZgcxqZ+x5+AMeuDsW_u7mVko81_td9u_uw@mail.gmail.com> <CAPnjgZ2QUEDqOkWyDm=tvBAxJRxH+TrQWDfmC8rQsSNdxR=iCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692143895; x=1692748695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA1u7AquqwTmlV63O2kGzBfpa2IOBUkNmg2x34vLmpw=;
        b=gzl/ZRTI0QobKHfZIe3RqGb6BQ7UxXwVAt2wPwgxd0FjaKWvLGAPcrWVzAXe8k09eh
         ffpw6oruZsVXb/wwaYAMBZmxQQAli3+DXuY/qpM8Bqg0siMr5U6Dfwzaty6BBeITJ0fL
         Kt5Wsq4Ojiq9RcX7f0B9Un66ZSRFwSuZRSzzE=
In-Reply-To: <CAPnjgZ2QUEDqOkWyDm=tvBAxJRxH+TrQWDfmC8rQsSNdxR=iCQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeffrey Kardatzke <jkardatzke-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Yi-An Chen <chenyian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

On Tue, Aug 15, 2023 at 10:44=E2=80=AFPM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wro=
te:
>
> Hi,
>
> On Thu, 10 Aug 2023 at 01:39, Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >
> > On Wed, Aug 9, 2023 at 10:58=E2=80=AFPM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> w=
rote:
> > >
> > > On Tue, Aug 8, 2023 at 2:08=E2=80=AFAM Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wr=
ote:
> > > >
> > > > On Wed, Jul 26, 2023 at 12:37=E2=80=AFAM Rob Herring <robh@kernel.o=
rg> wrote:
> > > > >
> > > > > On Tue, Jul 25, 2023 at 8:52=E2=80=AFAM Simon Glass <sjg@chromium=
.org> wrote:
> > > > > >
> > > > > > On Mon, 24 Jul 2023 at 04:02, Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote=
:
> > > > > > >
> > > > > > > Sorry for the late reply,
> > > > > > > this is the new version that moved the bindings to the /optio=
ns node.
> > > > > > >
> > > > > > > From 1662ec6c6a9cbb07d83157ad9411897b4acaf1f0 Mon Sep 17 00:0=
0:00 2001
> > > > > > > From: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > > > > > > Date: Wed, 14 Jun 2023 14:49:46 +0800
> > > > > > > Subject: [PATCH] dt-bindings: Add Google Widevine initialize =
parameters
> > > > > > >
> > > > > > > The necessary fields to initialize the widevine related funct=
ions in
> > > > > > > OP-TEE.
> > > > > > >
> > > > > > > Change-Id: Iceb6c533bcb60034e811d4fdf9310d9df48507de
> > > > > > > Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > > > > > > ---
> > > > > > >  .../bindings/options/google,widevine.yaml     | 61 +++++++++=
++++++++++
> > > > > > >  1 file changed, 61 insertions(+)
> > > > > > >  create mode 100644
> > > > > > > Documentation/devicetree/bindings/options/google,widevine.yam=
l
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/options/google=
,widevine.yaml
> > > > > > > b/Documentation/devicetree/bindings/options/google,widevine.y=
aml
> > > > > > > new file mode 100644
> > > > > > > index 0000000000000..acfc96d162c88
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/options/google,widevi=
ne.yaml
> > > > > > > @@ -0,0 +1,61 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/options/google,widevine.y=
aml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: Google Widevine initialize parameters.
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > > > > +  - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > > > > +
> > > > > > > +description:
> > > > > > > +  The necessary fields to initialize the widevine related fu=
nctions in
> > > > > > > +  OP-TEE. This node does not represent a real device, but se=
rves as a
> > > > > > > +  place for passing data between firmware and OP-TEE.
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    const: google,widevine
> > > > > > > +
> > > > > > > +  huk:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > > > > +    description:
> > > > > > > +      The encryption key of the Widevine OP-TEE storage.
> > > > > > > +
> > > > > > > +  tpm-auth-pk:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > > > > +    description:
> > > > > > > +      The TPM auth public key. Used to communicate the TPM f=
rom OP-TEE.
> > > > > >
> > > > > > Can you add more details about this key. What format is it in? =
How is
> > > > > > it created?
> > > > > >
> > > > > > > +
> > > > > > > +  widevine-dice:
> > > > > >
> > > > > > We should avoid the 'widevine-' prefix since it is already this=
 node.
> > > > >
> > > > > Yes, but then 'dice' is pretty vague. It is preferred that proper=
ty
> > > > > names are unique enough to only have 1 type globally (at least wi=
thin
> > > > > a defined size). This allows using the schemas to decode DT data.
> > > > >
> > > > > >
> > > > > > I don't know what the words mean in the description, so I canno=
t offer
> > > > > > a better idea.
> > > > > >
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > > > > +    description:
> > > > > > > +      The Widevine boot certificate chain(Device Identifier =
Composition
> > > > > > > +      Engine) of this device. Used to provision the device s=
tatus with
> > > > > > > +      the Widevine server in OP-TEE.
> > > > > >
> > > > > > Ditto
> > > > > >
> > > > > > > +
> > > > > > > +  widevine-ta-key:
> > > > > >
> > > > > > As above
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > > > > +    description:
> > > > > > > +      The Widevine private key corresponding to the widevine=
-dice.
> > > > > > > +      Used to signing the widevine request in OP-TEE.
> > > > > >
> > > > > > Again, more details please
> > > > > >
> > > > > > > +
> > > > > > > +required:
> > > > > > > +  - compatible
> > > > >
> > > > > What's the point of this binding if none of the other properties =
are required?
> > > > >
> > > > > > > +
> > > > > > > +additionalProperties: false
> > > > > > > +
> > > > > > > +examples:
> > > > > > > +  - |+
> > > > > > > +    options {
> > > > > > > +      widevine: {
> > > > > > > +        compatible =3D "google,widevine";
> > > > > > > +
> > > > > > > +        huk =3D [00 de ad be af aa bb cc],
> > > > > > > +        tpm-auth-pk =3D [00 de ad be af aa bb cc],
> > > > > > > +        widevine-dice =3D [00 de ad be af aa bb cc],
> > > > > > > +        widevine-ta-key =3D [00 de ad be af aa bb cc],
> > > > > > > +      };
> > > > > > > +    };
> > > > > > > --
> > > > > > > 2.39.2
> > > > > > >
> > > > > >
> > > > > > [..]
> > > > > >
> > > > > > Regards,
> > > > > > Simon
> > > >
> > > > Sorry for the late reply.
> > > > We changed the internal format of the "widevine-dice" from COSE to
> > > > X.509 recently.
> > > > And here is the new patch with the corresponding changes.
> > > >
> > > > From 9f754c8872c411e3e4216a181b4028875f1f54fc Mon Sep 17 00:00:00 2=
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
> > > > .../bindings/options/google,widevine.yaml | 63 +++++++++++++++++++
> > > > 1 file changed, 63 insertions(+)
> > > > create mode 100644
> > > > Documentation/devicetree/bindings/options/google,widevine.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/options/google,widev=
ine.yaml
> > > > b/Documentation/devicetree/bindings/options/google,widevine.yaml
> > > > new file mode 100644
> > > > index 0000000000000..874f62598b087
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/options/google,widevine.yam=
l
> > > > @@ -0,0 +1,63 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/options/google,widevine.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Google Widevine initialize parameters.
> > > > +
> > > > +maintainers:
> > > > + - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > + - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > +
> > > > +description:
> > > > + The necessary fields to initialize the widevine related functions=
 in
> > > > + OP-TEE. This node does not represent a real device, but serves as=
 a
> > > > + place for passing data between firmware and OP-TEE.
> > > > +
> > > > +properties:
> > > > + compatible:
> > > > + const: google,widevine
> > >
> > > This isn't valid json-schema as the indentation is wrong. Please test
> > > your schema with the tools.
> > >
> > > > +
> > > > + huk:
> > >
> > > As mentioned previously, this is too vague.
> > >
> > > > + $ref: /schemas/types.yaml#/definitions/string
> > >
> > > Doesn't look like a string from the example.
> > >
> > > > + description:
> > > > + The encryption key of the Widevine OP-TEE storage. The length
> > > > + should be 32 bytes.
> > >
> > > Your example is 8 bytes.
> > >
> > > > +
> > > > + tpm-auth-pk:
> > > > + $ref: /schemas/types.yaml#/definitions/string
> > > > + description:
> > > > + The TPM auth public key. Used to communicate the TPM from OP-TEE.
> > > > + The format of data should be TPM2B_PUBLIC.
> > > > +
> > > > + rot:
> > > > + $ref: /schemas/types.yaml#/definitions/string
> > > > + description:
> > > > + The Widevine root of trust secret. Used to signing the widevine
> > > > + request in OP-TEE. The length should be 32 bytes.
> > > > +
> > > > + rot-cert:
> > > > + $ref: /schemas/types.yaml#/definitions/string
> > > > + description:
> > > > + The X.509 certificate of the Widevine root of trust on this
> > > > + device. Used to provision the device status with the Widevine
> > > > + server in OP-TEE.
> > > > +
> > > > +required:
> > > > + - compatible
> > > > + - huk
> > > > + - rot
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > + - |+
> > > > + options {
> > > > + widevine: {
> > > > + compatible =3D "google,widevine";
> > > > +
> > > > + huk =3D [00 de ad be af aa bb cc],
> > > > + rot =3D [00 de ad be af aa bb cc],
> > > > + };
> > > > + };
> > > > --
> > > > 2.39.2
> > > >
> > > > Sincerely,
> > > > Yi
> >
> > Thanks for the reply, this is the new version of this patch.
> >
> > From 360c63617c8cd595da41b04430993b9d435b0865 Mon Sep 17 00:00:00 2001
> > From: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > Date: Wed, 14 Jun 2023 14:49:46 +0800
> > Subject: [PATCH] dt-bindings: Add Google Widevine initialize parameters
> >
> > The necessary fields to initialize the widevine related functions in
> > OP-TEE.
> >
> > Change-Id: Iceb6c533bcb60034e811d4fdf9310d9df48507de
> > Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../bindings/options/google,widevine.yaml     | 68 +++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/options/google,widevine.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/options/google,widevine.=
yaml
> > b/Documentation/devicetree/bindings/options/google,widevine.yaml
> > new file mode 100644
> > index 0000000000000..e77e9ac5be29a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/options/google,widevine.yaml
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/options/google,widevine.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Widevine initialize parameters.
>
> 'initialization' would be better I think
>
> > +
> > +maintainers:
> > +  - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > +  - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > +
>
> The property names you have used seem good to me.
>
> > +description:
> > +  The necessary fields to initialize the widevine related functions in
> > +  OP-TEE. This node does not represent a real device, but serves as a
> > +  place for passing data between firmware and OP-TEE.
> > +
> > +properties:
> > +  compatible:
> > +    const: google,widevine
> > +
> > +  hardware-unique-key:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    description:
> > +      The hardware unique key of the Widevine OP-TEE. It will be used
>
> hardware-unique key
>
> > +      to derive the secure storage key. The length should be 32 bytes.
>
> What is the format of this? Do you have a link?
>
> > +
> > +  tpm-auth-public-key:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    description:
> > +      The TPM auth public key. Used to communicate the TPM from OP-TEE=
.
> > +      The format of data should be TPM2B_PUBLIC.
>
> Same here. I tried to look up TPM2B_PUBLIC but didn't get very far.
>
> If this is omitted, what does it mean?
>
> > +
> > +  root-of-trust:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    description:
> > +      The Widevine root of trust secret. Used to sign the widevine
> > +      request in OP-TEE. The length should be 32 bytes.
>
> What is the format of this? Do you have a link?
>
> > +
> > +  root-of-trust-cert:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    description:
> > +      The X.509 certificate of the Widevine root of trust on this
> > +      device. Used to provision the device status with the Widevine
> > +      server in OP-TEE.
>
> Which format is used for the X.509 certificate?
>
> If this is omitted, what does it mean?
>
> > +
> > +required:
> > +  - compatible
> > +  - hardware-unique-key
> > +  - root-of-trust
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |+
> > +    options {
> > +      widevine {
> > +        compatible =3D "google,widevine";
> > +        hardware-unique-key =3D /bits/ 8 <
> > +          0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5
> > +          6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
> > +        >;
> > +        root-of-trust =3D /bits/ 8 <
> > +          0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5
> > +          6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
> > +        >;
>
> Can you please add the other fields to your example? Perhaps this
> would be better to use the [] encoding for the bytes?
>
> > +      };
> > +    };
> > --
> > 2.39.2
> >
> > Sincerely,
> > Yi
>
> Regards,
> Simon

Thanks for the reply, I added more references of the format into the doc.
And also added examples of tpm-auth-public-key and root-of-trust-cert.

From fb8fa5684a36e4b59a9543691cd17e201ab9a226 Mon Sep 17 00:00:00 2001
From: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Date: Wed, 14 Jun 2023 14:49:46 +0800
Subject: [PATCH] dt-bindings: Add Google Widevine initialization parameters

The necessary fields to initialize the widevine related functions in
OP-TEE.

Change-Id: Iceb6c533bcb60034e811d4fdf9310d9df48507de
Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/options/google,widevine.yaml     | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644
Documentation/devicetree/bindings/options/google,widevine.yaml

diff --git a/Documentation/devicetree/bindings/options/google,widevine.yaml
b/Documentation/devicetree/bindings/options/google,widevine.yaml
new file mode 100644
index 0000000000000..233f5756f2c48
--- /dev/null
+++ b/Documentation/devicetree/bindings/options/google,widevine.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/options/google,widevine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Widevine initialization parameters.
+
+maintainers:
+  - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
+  - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
+
+description:
+  The necessary fields to initialize the widevine related functions in
+  OP-TEE. This node does not represent a real device, but serves as a
+  place for passing data between firmware and OP-TEE.
+
+properties:
+  compatible:
+    const: google,widevine
+
+  hardware-unique-key:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: |
+      The hardware-unique key of the Widevine OP-TEE. It will be used
+      to derive the secure storage key. The length should be 32 bytes.
+      For more information, please reference:
+      https://optee.readthedocs.io/en/latest/architecture/porting_guidelin=
es.html#hardware-unique-key
+
+  tpm-auth-public-key:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: |
+      The TPM auth public key. Used to communicate the TPM from OP-TEE.
+      The format of data should be TPM2B_PUBLIC.
+      For more information, please reference the 12.2.5 section:
+      https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1p59_=
Part2_Structures_pub.pdf
+
+  root-of-trust:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: |
+      The Widevine root of trust secret. Used to sign the widevine
+      request in OP-TEE. The length should be 32 bytes. The value
+      is an ECC NIST P-256 scalar.
+      For more information, please reference the G.1.2 section:
+      https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-18=
6.pdf
+
+  root-of-trust-cert:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: |
+      The X.509 certificate of the Widevine root of trust on this
+      device. Used to provision the device status with the Widevine
+      server in OP-TEE.
+      For more information, please reference:
+      https://www.itu.int/rec/T-REC-X.509
+
+required:
+  - compatible
+  - hardware-unique-key
+  - root-of-trust
+
+additionalProperties: false
+
+examples:
+  - |+
+    options {
+      widevine {
+        compatible =3D "google,widevine";
+        hardware-unique-key =3D [
+          12 f7 98 d2 0e d2 85 92 a5 82 bf 98 b8 99 2b c0
+          c6 6f 19 85 79 86 65 18 55 eb ff 9b 6c c0 ac 27
+        ];
+        tpm-auth-public-key =3D [
+          00 76 00 23 00 0b 00 02 04 b2 00 20 e1 47 bf 27
+          e1 74 30 c8 16 ab 72 4d 5c 77 e1 5c 61 2d 56 81
+          b3 35 cd 9d eb 67 41 37 69 f0 32 41 00 10 00 10
+          00 03 00 10 00 20 70 9a df 50 f9 0f d5 f4 40 e0
+          ea 2c e8 f2 26 9f 0e 5c 02 70 16 c3 6c c1 83 03
+          2d 04 10 bd 85 7a 00 20 83 03 c2 66 6e 01 32 34
+          5c 5e 80 22 c7 48 24 3c 70 6b b8 e4 24 42 74 a9
+          cf fc ab f8 30 e9 de 51
+        ];
+        root-of-trust =3D [
+          ac 0d 86 c3 d7 b5 b7 a2 6f c3 d9 93 f7 de bc bb
+          d5 c4 25 9b 21 5f 36 af b5 dd 6d 29 9d 08 c0 10
+        ];
+        root-of-trust-cert =3D [
+          30 82 01 f4 30 82 01 9b a0 03 02 01 02 02 10 11
+          01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 30
+          0a 06 08 2a 86 48 ce 3d 04 03 02 30 0f 31 0d 30
+          0b 06 03 55 04 03 0c 04 54 69 35 30 30 22 18 0f
+          32 30 30 30 30 31 30 31 30 30 30 30 30 30 5a 18
+          0f 32 30 39 39 31 32 33 31 32 33 35 39 35 39 5a
+          30 0f 31 0d 30 0b 06 03 55 04 03 0c 04 54 69 35
+          30 30 59 30 13 06 07 2a 86 48 ce 3d 02 01 06 08
+          2a 86 48 ce 3d 03 01 07 03 42 00 04 ec ef cb 0c
+          68 7e 30 f4 d5 8f 2c 88 16 f4 7f b5 8b 5b 06 77
+          d7 47 fe 1e 91 4c a3 c5 a1 54 f5 40 9c f8 a5 4e
+          85 a0 fa 05 1a 01 98 da e4 b1 e5 ff 95 0d cf 8f
+          d9 c1 ce 28 0f 91 75 ca 06 e4 91 3b a3 81 d4 30
+          81 d1 30 1a 06 0a 2b 06 01 04 01 d6 79 02 01 21
+          04 0c 5a 53 5a 56 a5 ac a5 a9 7f 7f 00 00 30 0f
+          06 0a 2b 06 01 04 01 d6 79 02 01 22 04 01 21 30
+          2e 06 0a 2b 06 01 04 01 d6 79 02 01 23 04 20 23
+          e1 4d d9 bb 51 a5 0e 16 91 1f 7e 11 df 1e 1a af
+          0b 17 13 4d c7 39 c5 65 36 07 a1 ec 8d d3 7a 30
+          2e 06 0a 2b 06 01 04 01 d6 79 02 01 24 04 20 00
+          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30
+          2e 06 0a 2b 06 01 04 01 d6 79 02 01 25 04 20 00
+          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30
+          12 06 0a 2b 06 01 04 01 d6 79 02 01 26 04 04 00
+          00 00 00 30 0a 06 08 2a 86 48 ce 3d 04 03 02 03
+          47 00 30 44 02 20 62 a8 d3 23 db 1e 9c 64 91 49
+          45 5e b3 49 8d cc 1a ae 76 70 e3 12 d2 25 65 69
+          df f1 7e bc 4b d8 02 20 25 99 7c 36 cb b3 fd ce
+          6e 84 ee d7 ea eb 05 cf 69 cf 72 75 20 f3 ba 7f
+          8b 9f 06 f3 e4 11 bc cd
+        ];
+      };
+    };
