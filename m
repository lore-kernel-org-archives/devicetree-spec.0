Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AC3uv8e9"
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A65E1FCA
	for <devicetree-spec@vger.kernel.org>; Tue, 28 Nov 2023 02:29:25 -0800 (PST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1f03d9ad89fso3041938fac.1
        for <devicetree-spec@vger.kernel.org>; Tue, 28 Nov 2023 02:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701167364; x=1701772164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezVpTdoHR4K2Q3/sMNLF3v782y/O0eLsZY3Sy0FlAhw=;
        b=AC3uv8e9q0YNtfId3oZHv//xUco42ahsJJAMtuTveGPgn2+eTSYPd7T3Y96aOZYmbo
         VVknuwvev1LvvRf1vgxitS90rnSj9PZ0XTQuTQpbkJTTo3JJW9iIv94hdP3KCG8MakHu
         tnchEUCYldhbwCHYrH6hTstiw/mxB5SWXnEIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701167364; x=1701772164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezVpTdoHR4K2Q3/sMNLF3v782y/O0eLsZY3Sy0FlAhw=;
        b=CVnCeUPLdBi4pO7Y50J8AoZ7c77IwP7TPHCukaPwQIoqOVRI71kncNQEZSRuTGCXza
         fudT06Q6k+sG5NmPuRUY4z8hV73pyzWQNgGZky2+bwqclKbtPWxbgJxHL5vx52ymvjm3
         vHzJ1ueFPu3guszJuzZnOLb7W83W9YZ0t1dmPcxbPBrjBHj+Alns5qMQ/kPpCS/ZMEss
         xLHJ0iNE8Lglc0NvthHxziZP3r0w5sr3sV15TGWQc5JW7JO7FD6cCkObILdTZcBxKxg4
         /afu590zMvO2jnoA8qcbdTeJ15uW4wDXrqgPh1yV7jxGXTZTaWrmnmDtM6TzELWvxA6c
         EfHw==
X-Gm-Message-State: AOJu0YxHX2n2BU3e3UZA1LkHCfXwfMZHhnN3GUuYEgNBhgaC/sX0YNiL
	nCGNcgx7nk6Moog5m4OwhjgvrutHfSwuiMjskZppVw==
X-Google-Smtp-Source: AGHT+IEJN28zWV0nIi5802T7vo3bM+fInho9mNPYFBcW5AOEuBvWSxuvKPwQI7OfW27X751BTrL7Chy7JCyHtUdp6jM=
X-Received: by 2002:a05:6870:418c:b0:1fa:135e:f140 with SMTP id
 y12-20020a056870418c00b001fa135ef140mr14683481oac.34.1701167364716; Tue, 28
 Nov 2023 02:29:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231110043241.2920553-1-yich@chromium.org> <f9db6da9-99ee-43e6-ad13-cf26b8c1e7fa@linaro.org>
 <CAL_JsqL9aU+aC+WWn-6Q+Z-jiV8guS0-JQw2DVPYefVeiYKw8A@mail.gmail.com>
In-Reply-To: <CAL_JsqL9aU+aC+WWn-6Q+Z-jiV8guS0-JQw2DVPYefVeiYKw8A@mail.gmail.com>
From: Yi Chou <yich@chromium.org>
Date: Tue, 28 Nov 2023 18:29:12 +0800
Message-ID: <CABOkjxLVU+YJODXBU=x8SXtOAyW86rePEkrw_cETzRJbAc+etg@mail.gmail.com>
Subject: Re: [PATCH] schemas: Add Google Widevine initialization parameters
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, jkardatzke@google.com, yich@google.com, 
	krzysztof.kozlowski+dt@linaro.org, devicetree-spec@vger.kernel.org, 
	chenyian@google.com, sjg@chromium.org, jwerner@chromium.org, 
	jens.wiklander@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 10:37=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Fri, Nov 10, 2023 at 1:51=E2=80=AFAM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 10/11/2023 05:32, Yi Chou wrote:
> > > The necessary fields to initialize the widevine related functions in
> > > OP-TEE.
> > >
> > > Signed-off-by: Yi Chou <yich@chromium.org>
> > > Reviewed-by: Simon Glass <sjg@chromium.org>
> > >
> > > ---
> >
> > Please provide version log and proper background for this patch. This
> > was already sent to Linux kernel, so we should not spend time to figure
> > it out.
> >

Sent out a new patch that has the version log and background for this patch=
.
https://lore.kernel.org/all/20231113075249.3807225-1-yich@chromium.org

> > > There's no plan to add more optee stuff now.
> > > This is it.
> > >
> > >  dtschema/schemas/options/op-tee/widevine.yaml | 73 +++++++++++++++++=
++
> > >  1 file changed, 73 insertions(+)
> > >  create mode 100644 dtschema/schemas/options/op-tee/widevine.yaml
> > >
> > > diff --git a/dtschema/schemas/options/op-tee/widevine.yaml b/dtschema=
/schemas/options/op-tee/widevine.yaml
> > > new file mode 100644
> > > index 0000000..925c214
> > > --- /dev/null
> > > +++ b/dtschema/schemas/options/op-tee/widevine.yaml
> >
> > Missing vendor prefix - google,
> >
> > > @@ -0,0 +1,73 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/options/op-tee/widevine.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Google Widevine initialization parameters
> >
> > What is Widevine? You write it once "widevine", once "Widevine" but
> > never explain what it is.
> >
> > > +
> > > +maintainers:
> > > +  - Jeffrey Kardatzke <jkardatzke@chromium.org>
> > > +  - Yi Chou <yich@chromium.org>
> > > +
> > > +description:
> > > +  The necessary fields to initialize the widevine related functions =
in
> > > +  OP-TEE. This node does not represent a real device, but serves as =
a
> > > +  place for passing data between firmware and OP-TEE.
> > > +
> > > +properties:
> > > +  google,optee-hardware-unique-key:
> > > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > > +    maxItems: 32
> > > +    description: |
> > > +      The hardware-unique key of the Widevine OP-TEE. It will be use=
d
> > > +      to derive the secure storage key.
> > > +      For more information, please reference:
> > > +      https://optee.readthedocs.io/en/latest/architecture/porting_gu=
idelines.html#hardware-unique-key
>
> Reading this, it says: "in the best case the HUK should never ever be
> readable directly from software, not even from the secure side"
>
> Putting it in DT is certainly "readable directly from software".
>
> Also, wouldn't widevine be calling tee_otp_get_hw_unique_key(...)? So
> if you do put this in DT, it should be consumed by optee rather than
> widevine?
>
> I'd like to see an ack from Jens or other optee maintainer on this
> before merging.

Yes, it will be consumed by the OP-TEE.
The OP-TEE side PR is this: https://github.com/OP-TEE/optee_os/pull/6379
There is a new flag in OP-TEE called "CFG_WIDEVINE_HUK", and it will
let the OP-TEE consume the HUK in DT.

And in our use case, it is not "readable directly from software",
because the DT will be generated at the runtime in TF-A, and we will
only pass it into the OP-TEE.
https://github.com/OP-TEE/optee_os/pull/6379#discussion_r1368844405

> >
> > Blank line
> >
> > > +  google,tcg-tpm-auth-public-key:
> >
> > Missing tcg prefix as asked by Rob.
> >
> > > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > > +    maxItems: 1024
> > > +    description: |
> > > +      The TPM auth public key. Used to communicate the TPM from OP-T=
EE.
> > > +      The format of data should be TPM2B_PUBLIC.
> > > +      For more information, please reference the 12.2.5 section:
> > > +      https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_=
r1p59_Part2_Structures_pub.pdf
> >
> > Blank line
> >
> >
> > > +  google,widevine-root-of-trust-ecc-p256:
> > > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > > +    maxItems: 32
> > > +    description: |
> > > +      The Widevine root of trust secret. Used to sign the widevine
> > > +      request in OP-TEE. The value is an ECC NIST P-256 scalar.
> > > +      For more information, please reference the G.1.2 section:
> > > +      https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.=
800-186.pdf
> >
> > Blank line
> >
> >
> > > +required:
> > > +  - google,optee-hardware-unique-key
> > > +  - google,tcg-tpm-auth-public-key
> > > +  - google,widevine-root-of-trust-ecc-p256
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    options {
> > > +      widevine {
> >
> > Node names should be generic. See also an explanation and list of
> > examples (not exhaustive) in DT specification:
> > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devi=
cetree-basics.html#generic-names-recommendation
>
> Yes, but 'options' nodes are for software components and named for the
> component. So I think 'widevine' is okay here.
>
> However, I think the schema path/filename should match the DT path. So
> either need to add 'optee' to the DT path or remove it from the schema
> path. It's really up to the optee community to decide. They are the
> ones who will be stuck with whatever is created here.
>

The previous discussion in the optee:
https://github.com/OP-TEE/optee_os/pull/6418#pullrequestreview-1714399006
I believe they prefer the "/options/op-tee/widevine" path.

> Rob

Thanks,
Yi
