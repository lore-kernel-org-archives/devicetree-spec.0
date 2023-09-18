From: Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: Add Google Widevine initialization parameters
Date: Mon, 18 Sep 2023 12:20:55 +0800
Message-ID: <CABOkjxJpcOUyyh9vjRuqrhmd=EdQdnyyuBX-++0R+UdENfqw9A@mail.gmail.com>
References: <20230908101539.2622864-1-yich@google.com> <2ec056f3-e8a8-c5f3-b132-4b9d2beb616e@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree+bounces-931-gldd-devicetree-discuss-3=m.gmane-mx.org-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695010887; x=1695615687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSAM1wAdtshDQfCXiQwF4h/ka9KcanO5IUqHuu9JJ+g=;
        b=ijOj9c6sXyE0ShivHl2XAHQRQFS3UpiMZeEzAfBcuNOBLVJx+GiOzNCa27/ZP7czO5
         ER4QtpI9JS/WM9saTt+TpeCHrD0pS5OiU5jd/7H5pgjEkG0vOCKbvGBkDjEwCTTBid8h
         w/ORzn+8xERXDwnStvawtMkks08IHVyMEEkOo=
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2ec056f3-e8a8-c5f3-b132-4b9d2beb616e-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Type: text/plain; charset="windows-1252"
To: Krzysztof Kozlowski <krzysztof.kozlowski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, chenyian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jkardatzke-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

On Sun, Sep 17, 2023 at 4:40=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> On 08/09/2023 12:15, Yi Chou wrote:
> > The necessary fields to initialize the widevine related functions in
> > OP-TEE.
> >
> > Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> >  .../bindings/options/google,widevine.yaml     | 124 ++++++++++++++++++
> >  1 file changed, 124 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/options/google,wi=
devine.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/options/google,widevine.=
yaml b/Documentation/devicetree/bindings/options/google,widevine.yaml
> > new file mode 100644
> > index 0000000000000..bf2b834cb1454
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/options/google,widevine.yaml
>
> There is no such hardware as "options". What is this supposed to be for?
> firmware?

These DT fields would not be consumed by the OS.
https://www.spinics.net/lists/devicetree-spec/msg01195.html
The previous discussion tended to use the "options" node.
Do we have any better place for these widevine related fields?

>
> > @@ -0,0 +1,124 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/options/google,widevine.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Widevine initialization parameters.
>
> This is a title, drop full stop.

Got it, will be fixed in the next patch.

>
> > +
> > +maintainers:
> > +  - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > +  - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > +
> > +description:
> > +  The necessary fields to initialize the widevine related functions in
> > +  OP-TEE. This node does not represent a real device, but serves as a
> > +  place for passing data between firmware and OP-TEE.
> > +  The public fields (e.g. tpm-auth-public-key & root-of-trust-cert) ca=
n
> > +  be ignored because it's safe to pass the public information with the
> > +  other methods(e.g. userland OP-TEE plugins).
>
> Then why isn't this a property of optee node?

Are you talking about the /firmware/optee node?
If I understand correctly, that node was talking about how the kernel
communicates with the OP-TEE.
But what we are doing here is passing some secrets from trusted
firmware into OP-TEE, and the data would not go through the linux
kernel.
I'm not sure if it is a good idea to mix two different purpose fields
in the same node...

>
> > +
> > +properties:
> > +  compatible:
> > +    const: google,widevine
>
> From the description I have no clue what is "widevine". The more
> surprising is to see it as "not hardware" but having its node and
> compatible, like it was a hardware node.

We already have a "chosen" node that is "not hardware" in the DT.
Should we just remove the compatible field from this node?

BTW, Widevine is a digital rights management (DRM) system to make sure
the video stream can only be decoded on the valid devices.

>
> > +
> > +  hardware-unique-key:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    description: |
> > +      The hardware-unique key of the Widevine OP-TEE. It will be used
> > +      to derive the secure storage key. The length should be 32 bytes.
> > +      For more information, please reference:
> > +      https://optee.readthedocs.io/en/latest/architecture/porting_guid=
elines.html#hardware-unique-key
>
> Why would you store it in DT? This is world readable... or you mean this
> is some seed?

We will not pass this node to the linux kernel.
This DT node is only intended to be used between the ARM trusted
firmware(BL31) and the OPTEE.

>
> > +
> > +  tpm-auth-public-key:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    description: |
> > +      The TPM auth public key. Used to communicate the TPM from OP-TEE=
.
> > +      The format of data should be TPM2B_PUBLIC.
> > +      For more information, please reference the 12.2.5 section:
> > +      https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1=
p59_Part2_Structures_pub.pdf
> > +
> > +  root-of-trust:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    description: |
> > +      The Widevine root of trust secret. Used to sign the widevine
> > +      request in OP-TEE. The length should be 32 bytes. The value
> > +      is an ECC NIST P-256 scalar.
> > +      For more information, please reference the G.1.2 section:
> > +      https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.80=
0-186.pdf
> > +
> > +  root-of-trust-cert:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    description: |
> > +      The X.509 certificate of the Widevine root of trust on this
> > +      device. Used to provision the device status with the Widevine
> > +      server in OP-TEE.
> > +      For more information, please reference:
> > +      https://www.itu.int/rec/T-REC-X.509
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
>
> Why + ?

The extra "+" will be removed in the next patch.

>
> > +    options {
>
> There is no such node as "options".

This is a new node that was suggested in this thread:
https://www.spinics.net/lists/devicetree-spec/msg01195.html

>
>
> Best regards,
> Krzysztof
>

Thanks,
Yi

