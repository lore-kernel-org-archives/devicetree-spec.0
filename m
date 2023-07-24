From: Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Device tree usage in TF-A & OP-Tee consultation
Date: Mon, 24 Jul 2023 18:02:14 +0800
Message-ID: <CABOkjxLSKT3NvCUfxdWnMBVyaY9qCYdFupr+CRn=HXetRaWD2A@mail.gmail.com>
References: <CABOkjxJnzTm=jJUy4Zgi9kGxLTBHvmrkM80UhgSdzyYcL4xfzA@mail.gmail.com>
 <CAPnjgZ1inUgJ94kugnGSDbQ0dhfxouObyr=VjdUYG81+bv5DjQ@mail.gmail.com>
 <CABOkjxLK7udsUW=12pq36ftoRTc1ULC6r9uAzM-gFR4BDJwJ=A@mail.gmail.com>
 <CAPnjgZ1ZNb=P5Py2RvGEpE3osQ86FPs8Fdh89TVm9zD_FYhNDw@mail.gmail.com>
 <CAODwPW9-ueC6e-A766fRbiWJpiuN07WrRWVKJEoR-zRg7WYK6A@mail.gmail.com> <CAL_Jsq+SeqSVTP89idwo8fNUvzk_H+WcbNW7R+yasMk26EW+hA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690192946; x=1690797746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtT4gEzirPpoDZvukhLATIYuuqj987ZGvDpIx7FDitk=;
        b=cv40/E1DRvTGins3Tj86pC0u/XthjfQY2roB10o7PkS/oSRo/E3mbLxByW7T8yDDYP
         l/fvRC3/CKlBxVF0OSlY8C4LqgbtKSLjrPoMA7KsDFJKw87c2btFE6wb35I9CU0LtKgQ
         IZw78FyKi1xlzTRTS7Ukn6YbKFQsxPvm/aDFc=
In-Reply-To: <CAL_Jsq+SeqSVTP89idwo8fNUvzk_H+WcbNW7R+yasMk26EW+hA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeffrey Kardatzke <jkardatzke-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Yi-An Chen <chenyian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Sorry for the late reply,
this is the new version that moved the bindings to the /options node.

From 1662ec6c6a9cbb07d83157ad9411897b4acaf1f0 Mon Sep 17 00:00:00 2001
From: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Date: Wed, 14 Jun 2023 14:49:46 +0800
Subject: [PATCH] dt-bindings: Add Google Widevine initialize parameters

The necessary fields to initialize the widevine related functions in
OP-TEE.

Change-Id: Iceb6c533bcb60034e811d4fdf9310d9df48507de
Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/options/google,widevine.yaml     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644
Documentation/devicetree/bindings/options/google,widevine.yaml

diff --git a/Documentation/devicetree/bindings/options/google,widevine.yaml
b/Documentation/devicetree/bindings/options/google,widevine.yaml
new file mode 100644
index 0000000000000..acfc96d162c88
--- /dev/null
+++ b/Documentation/devicetree/bindings/options/google,widevine.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/options/google,widevine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Widevine initialize parameters.
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
+  huk:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The encryption key of the Widevine OP-TEE storage.
+
+  tpm-auth-pk:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The TPM auth public key. Used to communicate the TPM from OP-TEE.
+
+  widevine-dice:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The Widevine boot certificate chain(Device Identifier Composition
+      Engine) of this device. Used to provision the device status with
+      the Widevine server in OP-TEE.
+
+  widevine-ta-key:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The Widevine private key corresponding to the widevine-dice.
+      Used to signing the widevine request in OP-TEE.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |+
+    options {
+      widevine: {
+        compatible =3D "google,widevine";
+
+        huk =3D [00 de ad be af aa bb cc],
+        tpm-auth-pk =3D [00 de ad be af aa bb cc],
+        widevine-dice =3D [00 de ad be af aa bb cc],
+        widevine-ta-key =3D [00 de ad be af aa bb cc],
+      };
+    };
--
2.39.2

Sincerely,
Yi

On Sat, Jul 8, 2023 at 4:35=E2=80=AFAM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Tue, Jun 20, 2023 at 1:11=E2=80=AFPM Julius Werner <jwerner@chromium.o=
rg> wrote:
> >
> > Wouldn't something like /firmware/widevine make most sense for this? It=
 seems similar in nature to what other bindings in /firmware already do.
>
> /firmware is generally consumed by the OS containing providers
> implemented by firmware.
>
> >
> > On Tue, Jun 20, 2023, 9:50=E2=80=AFAM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wr=
ote:
> >>
> >> Hi Yi,
> >>
> >> On Wed, 14 Jun 2023 at 08:52, Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >> >
> >> > Hi,
> >> >
> >> > On Tue, Jun 13, 2023 at 10:38=E2=80=AFPM Rob Herring <robh-DgEjT+Ai2yhQFI55V6+gNQ@public.gmane.org=
g> wrote:
> >> > >
> >> > > On Mon, Jun 12, 2023 at 10:29=E2=80=AFPM Yi Chou <yich-F7+t8E8rja8pug/h7KTFAQ@public.gmane.org=
g> wrote:
> >> > > >
> >> > > > Hi, Linux device tree maintainers,
> >> > >
> >> > > devicetree-spec is not Linux specific.
> >> > >
> >> > > > I am writing to you today to request a review of some custom dev=
ice
> >> > > > tree bindings that we have developed. These bindings are not use=
d by
> >> > > > the Linux kernel, but they are used by OP-TEE[1], a secure execu=
tion
> >> > > > environment for embedded systems.
> >> > > >
> >> > > > We have placed these bindings under the "chosen" node in the dev=
ice
> >> > > > tree, as suggested by Jeffrey Kardatzke.[2]
> >> > > > The full bindings path would be "chosen/widevine/{tpm-auth-pk, h=
uk,
> >> > > > widevine-dice, widevine-ta-key}".
> >> > >
> >> > > I would advise against using /chosen as it is pretty much geared t=
o be
> >> > > consumed by a single client (typically "the OS"). Instead, /option=
s
> >> > > node[1] may be a better option which is what we did for u-boot
> >> > > configuration. It somewhat depends on what components consume the =
DT.
> >> > > If the DT is only ever going to be consumed by OP-TEE, then using
> >> > > /chosen is probably fine. However, if say TF-A and OP-TEE use the =
same
> >> > > DT, then you have 2 components to configure.
> >> >
> >> > In our use case, the TF-A will generate the DT, and the DT will only=
 be
> >> > consumed by the OP-TEE. The Linux kernel should not see these data f=
or
> >> > security reasons, I'm still not sure if it is a good idea to put the=
 bindings
> >> > in the Linux source tree.
> >> >
> >> > >
> >> > > > We would like to have our bindings reviewed by a device tree
> >> > > > maintainer to ensure that they are correct. We would also like t=
o get
> >> > > > your feedback on the best way to document these bindings.
> >> > > >
> >> > > > Thank you for your time and consultation.
> >> > > >
> >> > > > Sincerely,
> >> > > > Yi
> >> > > >
> >> > > > [1]: https://github.com/OP-TEE/optee_os
> >> > > > [2]: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-=
a/+/20442
> >> > >
> >> > > I don't see any bindings here. Am I supposed to study the code to
> >> > > figure out the binding? Please write a binding doc/schema if you w=
ant
> >> > > it reviewed.
> >> > >
> >> > > Rob
> >> > >
> >> > > [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema=
/schemas/options.yaml
> >> >
> >> > Here is the patch of the binding, but I'm still not sure where is th=
e
> >> > correct place to put the binding.
> >> >
> >> > From 2b828cc3c5aad0ff2c5bc2baea874d3a3fe8f1c3 Mon Sep 17 00:00:00 20=
01
> >> > From: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> >> > Date: Wed, 14 Jun 2023 14:49:46 +0800
> >> > Subject: [PATCH] dt-bindings: Add Google Widevine initialize paramet=
ers
> >> >
> >> > The necessary fields to initialize the widevine related functions in=
 OP-TEE.
> >> >
> >> > Change-Id: Iceb6c533bcb60034e811d4fdf9310d9df48507de
> >> > Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> >> > ---
> >> >  .../bindings/chosen/google,widevine.yaml      | 61 ++++++++++++++++=
+++
> >> >  1 file changed, 61 insertions(+)
> >> >  create mode 100644
> >> > Documentation/devicetree/bindings/chosen/google,widevine.yaml
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/chosen/google,widevin=
e.yaml
> >> > b/Documentation/devicetree/bindings/chosen/google,widevine.yaml
> >> > new file mode 100644
> >> > index 0000000000000..2fc16b1a1fcc4
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/chosen/google,widevine.yaml
> >> > @@ -0,0 +1,61 @@
> >> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> > +%YAML 1.2
> >> > +---
> >> > +$id: http://devicetree.org/schemas/chosen/google,widevine.yaml#
> >> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> > +
> >> > +title: Google Widevine initialize parameters.
> >> > +
> >> > +maintainers:
> >> > +  - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> > +  - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> > +
> >> > +description:
> >> > +  The necessary fields to initialize the widevine related functions=
 in
> >> > +  OP-TEE. This node does not represent a real device, but serves as=
 a
> >> > +  place for passing data between firmware and OP-TEE.
> >> > +
> >> > +properties:
> >> > +  compatible:
> >> > +    const: google,widevine
> >> > +
> >> > +  huk:
> >> > +    $ref: /schemas/types.yaml#/definitions/string
> >> > +    description:
> >> > +      The encryption key of the Widevine OP-TEE storage.
> >> > +
> >> > +  tpm-auth-pk:
> >> > +    $ref: /schemas/types.yaml#/definitions/string
> >> > +    description:
> >> > +      The TPM auth public key. Used to communicate the TPM from OP-=
TEE.
> >> > +
> >> > +  widevine-dice:
> >> > +    $ref: /schemas/types.yaml#/definitions/string
> >> > +    description:
> >> > +      The Widevine boot certificate chain(Device Identifier Composi=
tion
> >> > +      Engine) of this device. Used to provision the device status w=
ith
> >> > +      the Widevine server in OP-TEE.
> >> > +
> >> > +  widevine-ta-key:
> >> > +    $ref: /schemas/types.yaml#/definitions/string
> >> > +    description:
> >> > +      The Widevine private key corresponding to the widevine-dice.
> >> > +      Used to signing the widevine request in OP-TEE.
> >> > +
> >> > +required:
> >> > +  - compatible
> >> > +
> >> > +additionalProperties: false
> >> > +
> >> > +examples:
> >> > +  - |+
> >> > +    chosen {
> >> > +      widevine: {
> >> > +        compatible =3D "google,widevine";
> >> > +
> >> > +        huk =3D [00 de ad be af aa bb cc],
> >> > +        tpm-auth-pk =3D [00 de ad be af aa bb cc],
> >> > +        widevine-dice =3D [00 de ad be af aa bb cc],
> >> > +        widevine-ta-key =3D [00 de ad be af aa bb cc],
> >> > +      };
> >> > +    };
> >> > --
> >> > 2.39.2
> >>
> >> The binding looks OK to me, but I'm not sure about using /chosen since
> >> that is intended for the OS.
> >>
> >> Perhaps we could use /options instead?
> >>
> >> Regards,
> >> Simon
