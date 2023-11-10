Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E157A1946E
	for <devicetree-spec@vger.kernel.org>; Fri, 10 Nov 2023 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6p0kDAM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6313DC433C8
	for <devicetree-spec@vger.kernel.org>; Fri, 10 Nov 2023 14:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699627024;
	bh=cYqxXJodQpvlzgV3ue9HH+5cgwZxoq9jl29C/ifYnKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N6p0kDAMwFkigbOT9uYBkJ949lPpTSz1vmC8SRa7FhWN/kQ0DLsY2L/KMxylRk87r
	 K2xP1srcqT1ynCfdej6iVI4aD6H26ErOGo4szpSyJ5BfKSzyLZRFl0EKFS826jhqdt
	 +GYEkEyGMBlSLM0bp359WR4BpEF+blQqLfq7eVGNh3COuL6bdhWvyvjH/NUIaUKOdq
	 ChFhnhGwEFBtGOEHMwjCi6/t7M8uuwXUSqYL8UeQYll1TgJpYO22XmkeRrbI2I2/F3
	 1xKpPD4MwrOJnfJz4I0NQGuUoDAv23uON+n6xToPAdJrEzj5xEJBz7f6iyi/1slzdC
	 jgKSnXlzBC6ZA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50943ccbbaeso2954904e87.2
        for <devicetree-spec@vger.kernel.org>; Fri, 10 Nov 2023 06:37:04 -0800 (PST)
X-Gm-Message-State: AOJu0YxifP5Grwt627K/lGlsPZ3q8QwaHXD6h7ofodepcNhWwv/i9/s+
	7X49nSLaR3FeNeeCJCfh3WxhADBTSI0FN6qA4g==
X-Google-Smtp-Source: AGHT+IGEJZg6jThh3PqG5Vx5NlKXf9tYj/4xBZvSxAw7VG78w5FTUPJcwehqCl1A010hMVwHmfTHUfUpbqINUBdOGIY=
X-Received: by 2002:a19:6d09:0:b0:507:9608:4a87 with SMTP id
 i9-20020a196d09000000b0050796084a87mr3935335lfc.56.1699627022570; Fri, 10 Nov
 2023 06:37:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231110043241.2920553-1-yich@chromium.org> <f9db6da9-99ee-43e6-ad13-cf26b8c1e7fa@linaro.org>
In-Reply-To: <f9db6da9-99ee-43e6-ad13-cf26b8c1e7fa@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Nov 2023 08:36:50 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL9aU+aC+WWn-6Q+Z-jiV8guS0-JQw2DVPYefVeiYKw8A@mail.gmail.com>
Message-ID: <CAL_JsqL9aU+aC+WWn-6Q+Z-jiV8guS0-JQw2DVPYefVeiYKw8A@mail.gmail.com>
Subject: Re: [PATCH] schemas: Add Google Widevine initialization parameters
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Yi Chou <yich@chromium.org>, jkardatzke@google.com, yich@google.com, 
	krzysztof.kozlowski+dt@linaro.org, devicetree-spec@vger.kernel.org, 
	chenyian@google.com, sjg@chromium.org, jwerner@chromium.org, 
	jens.wiklander@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 1:51=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/11/2023 05:32, Yi Chou wrote:
> > The necessary fields to initialize the widevine related functions in
> > OP-TEE.
> >
> > Signed-off-by: Yi Chou <yich@chromium.org>
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> >
> > ---
>
> Please provide version log and proper background for this patch. This
> was already sent to Linux kernel, so we should not spend time to figure
> it out.
>
> > There's no plan to add more optee stuff now.
> > This is it.
> >
> >  dtschema/schemas/options/op-tee/widevine.yaml | 73 +++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 dtschema/schemas/options/op-tee/widevine.yaml
> >
> > diff --git a/dtschema/schemas/options/op-tee/widevine.yaml b/dtschema/s=
chemas/options/op-tee/widevine.yaml
> > new file mode 100644
> > index 0000000..925c214
> > --- /dev/null
> > +++ b/dtschema/schemas/options/op-tee/widevine.yaml
>
> Missing vendor prefix - google,
>
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/options/op-tee/widevine.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Widevine initialization parameters
>
> What is Widevine? You write it once "widevine", once "Widevine" but
> never explain what it is.
>
> > +
> > +maintainers:
> > +  - Jeffrey Kardatzke <jkardatzke@chromium.org>
> > +  - Yi Chou <yich@chromium.org>
> > +
> > +description:
> > +  The necessary fields to initialize the widevine related functions in
> > +  OP-TEE. This node does not represent a real device, but serves as a
> > +  place for passing data between firmware and OP-TEE.
> > +
> > +properties:
> > +  google,optee-hardware-unique-key:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    maxItems: 32
> > +    description: |
> > +      The hardware-unique key of the Widevine OP-TEE. It will be used
> > +      to derive the secure storage key.
> > +      For more information, please reference:
> > +      https://optee.readthedocs.io/en/latest/architecture/porting_guid=
elines.html#hardware-unique-key
>
> Blank line
>
> > +  google,tcg-tpm-auth-public-key:
>
> Missing tcg prefix as asked by Rob.
>
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    maxItems: 1024
> > +    description: |
> > +      The TPM auth public key. Used to communicate the TPM from OP-TEE=
.
> > +      The format of data should be TPM2B_PUBLIC.
> > +      For more information, please reference the 12.2.5 section:
> > +      https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1=
p59_Part2_Structures_pub.pdf
>
> Blank line
>
>
> > +  google,widevine-root-of-trust-ecc-p256:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    maxItems: 32
> > +    description: |
> > +      The Widevine root of trust secret. Used to sign the widevine
> > +      request in OP-TEE. The value is an ECC NIST P-256 scalar.
> > +      For more information, please reference the G.1.2 section:
> > +      https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.80=
0-186.pdf
>
> Blank line
>
>
> > +required:
> > +  - google,optee-hardware-unique-key
> > +  - google,tcg-tpm-auth-public-key
> > +  - google,widevine-root-of-trust-ecc-p256
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    options {
> > +      widevine {
>
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation

Yes, but 'options' nodes are for software components and named for the
component. So I think 'widevine' is okay here.

However, I think the schema path/filename should match the DT path. So
either need to add 'optee' to the DT path or remove it from the schema
path. It's really up to the optee community to decide. They are the
ones who will be stuck with whatever is created here.

Rob
