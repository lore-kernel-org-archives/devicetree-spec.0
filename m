Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1144A1BDC9
	for <devicetree-spec@vger.kernel.org>; Fri, 10 Nov 2023 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UT9zoEev"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A700C433CA
	for <devicetree-spec@vger.kernel.org>; Fri, 10 Nov 2023 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699626454;
	bh=GV5r+eA0RUY5kz5iMlofvtS++t1eSZublfd81T2MDMs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UT9zoEev06qWOthG59ndP71Av2s2jFY3La6/lV9NdNBrZuflCCQh1ZU0I2Dy73gA6
	 N4oJjtzuVIU+bIsAi7M0UnP/PCINM8u78LnvCeUrU1K0rrXwZrQzW9zHSXoPI0Cpam
	 fs0PI9o+FT6+N6JE3G4FnlAVe3w0v9/mcRFl1Nc6cMN2pR0HmEV4HeaJqjMq7KNgw7
	 ok5SAIKAPqC0hfvyzVmyQ4fhps+7+wYoT4J8GvThpvZVnmEx7yzyMPsDFk5abOM2Nz
	 JDkmHvliIYhdGMJQqRC6q98UtDy47BQ3KsUG3dhcxqqs7jftiWhtQT1FWducCatgUo
	 y9MwWhWlbORXA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-507bd19eac8so2708887e87.0
        for <devicetree-spec@vger.kernel.org>; Fri, 10 Nov 2023 06:27:34 -0800 (PST)
X-Gm-Message-State: AOJu0Yx5euMMUYT6lVsZK/NIWb4YyhGmxVQ694gU7Gou/USLoxjclATp
	7/YTNIYqRQfg1cRCLxEuBnUHiEU/7hIqNuxMHg==
X-Google-Smtp-Source: AGHT+IEc3o73MfT0n+gvTpLvKiQn+Omfd2Q0akLIBID9Mu9H6u+mzfdLHgwPBMEdmhmTxEjbls4aYjvApr8PIKFefsk=
X-Received: by 2002:ac2:5e25:0:b0:507:96e7:c08d with SMTP id
 o5-20020ac25e25000000b0050796e7c08dmr3689702lfg.61.1699626452708; Fri, 10 Nov
 2023 06:27:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231110043241.2920553-1-yich@chromium.org>
In-Reply-To: <20231110043241.2920553-1-yich@chromium.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Nov 2023 08:27:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ6fTOg+B2RhRgtTR3g9Po-4qu2c39V9zws3otTp2aZ7w@mail.gmail.com>
Message-ID: <CAL_JsqJ6fTOg+B2RhRgtTR3g9Po-4qu2c39V9zws3otTp2aZ7w@mail.gmail.com>
Subject: Re: [PATCH] schemas: Add Google Widevine initialization parameters
To: Yi Chou <yich@chromium.org>
Cc: jkardatzke@google.com, yich@google.com, krzysztof.kozlowski+dt@linaro.org, 
	devicetree-spec@vger.kernel.org, chenyian@google.com, sjg@chromium.org, 
	jwerner@chromium.org, jens.wiklander@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 9, 2023 at 10:33=E2=80=AFPM Yi Chou <yich@chromium.org> wrote:
>
> The necessary fields to initialize the widevine related functions in
> OP-TEE.
>
> Signed-off-by: Yi Chou <yich@chromium.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>
>
> ---
> There's no plan to add more optee stuff now.
> This is it.
>
>  dtschema/schemas/options/op-tee/widevine.yaml | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 dtschema/schemas/options/op-tee/widevine.yaml
>
> diff --git a/dtschema/schemas/options/op-tee/widevine.yaml b/dtschema/sch=
emas/options/op-tee/widevine.yaml
> new file mode 100644
> index 0000000..925c214
> --- /dev/null
> +++ b/dtschema/schemas/options/op-tee/widevine.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/options/op-tee/widevine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Widevine initialization parameters
> +
> +maintainers:
> +  - Jeffrey Kardatzke <jkardatzke@chromium.org>
> +  - Yi Chou <yich@chromium.org>
> +
> +description:
> +  The necessary fields to initialize the widevine related functions in
> +  OP-TEE. This node does not represent a real device, but serves as a
> +  place for passing data between firmware and OP-TEE.
> +
> +properties:
> +  google,optee-hardware-unique-key:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 32
> +    description: |
> +      The hardware-unique key of the Widevine OP-TEE. It will be used
> +      to derive the secure storage key.
> +      For more information, please reference:
> +      https://optee.readthedocs.io/en/latest/architecture/porting_guidel=
ines.html#hardware-unique-key

Reading this, it says: "in the best case the HUK should never ever be
readable directly from software, not even from the secure side"

Putting it in DT is certainly "readable directly from software".

Also, wouldn't widevine be calling tee_otp_get_hw_unique_key(...)? So
if you do put this in DT, it should be consumed by optee rather than
widevine?

I'd like to see an ack from Jens or other optee maintainer on this
before merging.

> +  google,tcg-tpm-auth-public-key:

I believe I said as this is defined by TCG, TCG is the vendor. So:
tcg,tpm-auth-public-key

> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 1024
> +    description: |
> +      The TPM auth public key. Used to communicate the TPM from OP-TEE.
> +      The format of data should be TPM2B_PUBLIC.
> +      For more information, please reference the 12.2.5 section:
> +      https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1p5=
9_Part2_Structures_pub.pdf
> +  google,widevine-root-of-trust-ecc-p256:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 32
> +    description: |
> +      The Widevine root of trust secret. Used to sign the widevine
> +      request in OP-TEE. The value is an ECC NIST P-256 scalar.
> +      For more information, please reference the G.1.2 section:
> +      https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-=
186.pdf
> +required:
> +  - google,optee-hardware-unique-key
> +  - google,tcg-tpm-auth-public-key
> +  - google,widevine-root-of-trust-ecc-p256
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    options {
> +      widevine {
> +        google,optee-hardware-unique-key =3D [
> +          12 f7 98 d2 0e d2 85 92 a5 82 bf 98 b8 99 2b c0
> +          c6 6f 19 85 79 86 65 18 55 eb ff 9b 6c c0 ac 27
> +        ];
> +        google,tcg-tpm-auth-public-key =3D [
> +          00 76 00 23 00 0b 00 02 04 b2 00 20 e1 47 bf 27
> +          e1 74 30 c8 16 ab 72 4d 5c 77 e1 5c 61 2d 56 81
> +          b3 35 cd 9d eb 67 41 37 69 f0 32 41 00 10 00 10
> +          00 03 00 10 00 20 70 9a df 50 f9 0f d5 f4 40 e0
> +          ea 2c e8 f2 26 9f 0e 5c 02 70 16 c3 6c c1 83 03
> +          2d 04 10 bd 85 7a 00 20 83 03 c2 66 6e 01 32 34
> +          5c 5e 80 22 c7 48 24 3c 70 6b b8 e4 24 42 74 a9
> +          cf fc ab f8 30 e9 de 51
> +        ];
> +        google,widevine-root-of-trust-ecc-p256 =3D [
> +          ac 0d 86 c3 d7 b5 b7 a2 6f c3 d9 93 f7 de bc bb
> +          d5 c4 25 9b 21 5f 36 af b5 dd 6d 29 9d 08 c0 10
> +        ];
> +      };
> +    };
> --
> 2.42.0.869.gea05f2083d-goog
>
