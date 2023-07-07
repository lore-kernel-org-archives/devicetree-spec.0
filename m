From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Device tree usage in TF-A & OP-Tee consultation
Date: Fri, 7 Jul 2023 14:35:17 -0600
Message-ID: <CAL_Jsq+SeqSVTP89idwo8fNUvzk_H+WcbNW7R+yasMk26EW+hA@mail.gmail.com>
References: <CABOkjxJnzTm=jJUy4Zgi9kGxLTBHvmrkM80UhgSdzyYcL4xfzA@mail.gmail.com>
 <CAPnjgZ1inUgJ94kugnGSDbQ0dhfxouObyr=VjdUYG81+bv5DjQ@mail.gmail.com>
 <CABOkjxLK7udsUW=12pq36ftoRTc1ULC6r9uAzM-gFR4BDJwJ=A@mail.gmail.com>
 <CAPnjgZ1ZNb=P5Py2RvGEpE3osQ86FPs8Fdh89TVm9zD_FYhNDw@mail.gmail.com> <CAODwPW9-ueC6e-A766fRbiWJpiuN07WrRWVKJEoR-zRg7WYK6A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688762132;
        bh=tfophVOw2p/ZNKbkr/09lZPH9NoXNP53GQ2f2fH2Jvc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IeW/vFg/Rek8MCDeo00exIZyH2o7Fjx56IRpxH36ETJz42Ja58eGdIR4qjFmjzvBA
         6M/JQqag8ud2iDGFzfHhOeeHn+1OPGpFUdyG4cJBiitcMpty1lqxYzITyNlmoQ3N0B
         sHDYYuiH78gqb1m9KMRz+VVW8U/ATgdaUYwYt1/6MW5VHZ/9A2NbNzIBKjBu3UQBQJ
         WRN6U4jbxVQAa5IS53ALJO5ETKJw8GjP47ZWO6GVwQhDa8v8Cx5i26Bia7XdpwDQT3
         jJ3++8sYlMlAtMiaFd5qUnyDFZolauBDFgWTEoUajAJ4iFdXsmTt0N+TGXqYUXaFQ/
         aTFhyOYxLz+DQ==
In-Reply-To: <CAODwPW9-ueC6e-A766fRbiWJpiuN07WrRWVKJEoR-zRg7WYK6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeffrey Kardatzke <jkardatzke-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Yi-An Chen <chenyian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

On Tue, Jun 20, 2023 at 1:11=E2=80=AFPM Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org=
> wrote:
>
> Wouldn't something like /firmware/widevine make most sense for this? It s=
eems similar in nature to what other bindings in /firmware already do.

/firmware is generally consumed by the OS containing providers
implemented by firmware.

>
> On Tue, Jun 20, 2023, 9:50=E2=80=AFAM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrot=
e:
>>
>> Hi Yi,
>>
>> On Wed, 14 Jun 2023 at 08:52, Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> >
>> > Hi,
>> >
>> > On Tue, Jun 13, 2023 at 10:38=E2=80=AFPM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>=
 wrote:
>> > >
>> > > On Mon, Jun 12, 2023 at 10:29=E2=80=AFPM Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>=
 wrote:
>> > > >
>> > > > Hi, Linux device tree maintainers,
>> > >
>> > > devicetree-spec is not Linux specific.
>> > >
>> > > > I am writing to you today to request a review of some custom devic=
e
>> > > > tree bindings that we have developed. These bindings are not used =
by
>> > > > the Linux kernel, but they are used by OP-TEE[1], a secure executi=
on
>> > > > environment for embedded systems.
>> > > >
>> > > > We have placed these bindings under the "chosen" node in the devic=
e
>> > > > tree, as suggested by Jeffrey Kardatzke.[2]
>> > > > The full bindings path would be "chosen/widevine/{tpm-auth-pk, huk=
,
>> > > > widevine-dice, widevine-ta-key}".
>> > >
>> > > I would advise against using /chosen as it is pretty much geared to =
be
>> > > consumed by a single client (typically "the OS"). Instead, /options
>> > > node[1] may be a better option which is what we did for u-boot
>> > > configuration. It somewhat depends on what components consume the DT=
.
>> > > If the DT is only ever going to be consumed by OP-TEE, then using
>> > > /chosen is probably fine. However, if say TF-A and OP-TEE use the sa=
me
>> > > DT, then you have 2 components to configure.
>> >
>> > In our use case, the TF-A will generate the DT, and the DT will only b=
e
>> > consumed by the OP-TEE. The Linux kernel should not see these data for
>> > security reasons, I'm still not sure if it is a good idea to put the b=
indings
>> > in the Linux source tree.
>> >
>> > >
>> > > > We would like to have our bindings reviewed by a device tree
>> > > > maintainer to ensure that they are correct. We would also like to =
get
>> > > > your feedback on the best way to document these bindings.
>> > > >
>> > > > Thank you for your time and consultation.
>> > > >
>> > > > Sincerely,
>> > > > Yi
>> > > >
>> > > > [1]: https://github.com/OP-TEE/optee_os
>> > > > [2]: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/=
+/20442
>> > >
>> > > I don't see any bindings here. Am I supposed to study the code to
>> > > figure out the binding? Please write a binding doc/schema if you wan=
t
>> > > it reviewed.
>> > >
>> > > Rob
>> > >
>> > > [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/s=
chemas/options.yaml
>> >
>> > Here is the patch of the binding, but I'm still not sure where is the
>> > correct place to put the binding.
>> >
>> > From 2b828cc3c5aad0ff2c5bc2baea874d3a3fe8f1c3 Mon Sep 17 00:00:00 2001
>> > From: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>> > Date: Wed, 14 Jun 2023 14:49:46 +0800
>> > Subject: [PATCH] dt-bindings: Add Google Widevine initialize parameter=
s
>> >
>> > The necessary fields to initialize the widevine related functions in O=
P-TEE.
>> >
>> > Change-Id: Iceb6c533bcb60034e811d4fdf9310d9df48507de
>> > Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>> > ---
>> >  .../bindings/chosen/google,widevine.yaml      | 61 ++++++++++++++++++=
+
>> >  1 file changed, 61 insertions(+)
>> >  create mode 100644
>> > Documentation/devicetree/bindings/chosen/google,widevine.yaml
>> >
>> > diff --git a/Documentation/devicetree/bindings/chosen/google,widevine.=
yaml
>> > b/Documentation/devicetree/bindings/chosen/google,widevine.yaml
>> > new file mode 100644
>> > index 0000000000000..2fc16b1a1fcc4
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/chosen/google,widevine.yaml
>> > @@ -0,0 +1,61 @@
>> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/chosen/google,widevine.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > +
>> > +title: Google Widevine initialize parameters.
>> > +
>> > +maintainers:
>> > +  - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> > +  - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> > +
>> > +description:
>> > +  The necessary fields to initialize the widevine related functions i=
n
>> > +  OP-TEE. This node does not represent a real device, but serves as a
>> > +  place for passing data between firmware and OP-TEE.
>> > +
>> > +properties:
>> > +  compatible:
>> > +    const: google,widevine
>> > +
>> > +  huk:
>> > +    $ref: /schemas/types.yaml#/definitions/string
>> > +    description:
>> > +      The encryption key of the Widevine OP-TEE storage.
>> > +
>> > +  tpm-auth-pk:
>> > +    $ref: /schemas/types.yaml#/definitions/string
>> > +    description:
>> > +      The TPM auth public key. Used to communicate the TPM from OP-TE=
E.
>> > +
>> > +  widevine-dice:
>> > +    $ref: /schemas/types.yaml#/definitions/string
>> > +    description:
>> > +      The Widevine boot certificate chain(Device Identifier Compositi=
on
>> > +      Engine) of this device. Used to provision the device status wit=
h
>> > +      the Widevine server in OP-TEE.
>> > +
>> > +  widevine-ta-key:
>> > +    $ref: /schemas/types.yaml#/definitions/string
>> > +    description:
>> > +      The Widevine private key corresponding to the widevine-dice.
>> > +      Used to signing the widevine request in OP-TEE.
>> > +
>> > +required:
>> > +  - compatible
>> > +
>> > +additionalProperties: false
>> > +
>> > +examples:
>> > +  - |+
>> > +    chosen {
>> > +      widevine: {
>> > +        compatible =3D "google,widevine";
>> > +
>> > +        huk =3D [00 de ad be af aa bb cc],
>> > +        tpm-auth-pk =3D [00 de ad be af aa bb cc],
>> > +        widevine-dice =3D [00 de ad be af aa bb cc],
>> > +        widevine-ta-key =3D [00 de ad be af aa bb cc],
>> > +      };
>> > +    };
>> > --
>> > 2.39.2
>>
>> The binding looks OK to me, but I'm not sure about using /chosen since
>> that is intended for the OS.
>>
>> Perhaps we could use /options instead?
>>
>> Regards,
>> Simon
