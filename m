Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEBC54BC2
	for <devicetree-spec@vger.kernel.org>; Thu, 11 Jan 2024 18:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T1MpeZAn"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d3fde109f2so9935ad.1
        for <devicetree-spec@vger.kernel.org>; Thu, 11 Jan 2024 10:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704997868; x=1705602668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQDwnD1/olN4Utenx3K8zHIsbFRmXYnhLxNAhuxyx1g=;
        b=T1MpeZAnKq1hoIxOXuDFjQ3jxxxkLkiN+yhRVU+aZhoOrkH4O+w80+tBU/uO8EW+gO
         ao5ZkLfNaFXIBCaHzNb+wozsDu0lpYrRRLESqSytowxsLdSeDLFnxf7MyfUfARpJ29Ox
         fPxKgaT2SxKH77vpTm4jAvWrwyJGp5LDUsMaRHMH7+xkQYLuRR8SKO2ZgkQVgClkdALU
         +/HJrthKOp9Jq/czVD1ASNtTVBYZbzqi96WGYZanMK8VrwmNXTnhq2N2U9RZzguPDX+X
         VXyAceHIhEkErgYY8K4P3DVpoJvqiMmQg8dyv1fJNzEadH3cTSZqIrBGJJgDnCe84E4W
         y0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704997868; x=1705602668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQDwnD1/olN4Utenx3K8zHIsbFRmXYnhLxNAhuxyx1g=;
        b=qaO2SIkD3bsdc/cP8+dnnMdJW++TFwgwN2dF9xR4N2/lRDeiLU5M7DBfHozquq/LfM
         W71hUrieMiFbzc0MNcfq5+OqfH9OBz6v9sHqhNpKiDzufjvj50ebQ3UMudwd1525+eCb
         L2sI5SLpla8m0PUxYBeBstTNnceRBxr8alCEZyx9v9TUwPjdCE3H7z51Yh8+z04YCr/M
         s4RoIGqaShkFGJdcJprD/BVqkZoxXkz6NTdvdTeX7gP0qUl2w8pRTvyZLK+AIbwCcObL
         2z1nhXEv+1ZjKfz6+TFf4VgpQXtDQro2X0dkbRUnMVLEVqD3d5MmautNe/H8aYFc2mfv
         vlmw==
X-Gm-Message-State: AOJu0YyIQ+m+0soG9y52A29tag1Jbe7UzDLTrb+I7Voojnizt0HaxW/6
	1rUX2GBErsqJrTuXkIIutSIndbKYDJi8k5cs8+wwh9Bi4Nk=
X-Google-Smtp-Source: AGHT+IGuV4qgJJVOnRobCrAmNWTRYS9gtrLPFw631gY6oCDoibxrf1E09SABYM1D96VwkV4bqb/wvfuukfZWoHk90sA=
X-Received: by 2002:a17:902:d2cc:b0:1d5:4b86:69e2 with SMTP id
 n12-20020a170902d2cc00b001d54b8669e2mr177520plc.23.1704997868282; Thu, 11 Jan
 2024 10:31:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABOkjxLPvtknz4XxfjCdnjvLCpbz5OF1U+x8AgoU7RnRe95TVA@mail.gmail.com>
In-Reply-To: <CABOkjxLPvtknz4XxfjCdnjvLCpbz5OF1U+x8AgoU7RnRe95TVA@mail.gmail.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Thu, 11 Jan 2024 10:30:56 -0800
Message-ID: <CA+ddPcN-p=cCQUcDRt-33s0=EhZkBMPRFOqULbZS3YMfeP9=Fw@mail.gmail.com>
Subject: Re: [PATCH v2] schemas: Add Google Widevine initialization parameters
To: Yi Chou <yich@chromium.org>
Cc: devicetree-spec@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	krzysztof.kozlowski+dt@linaro.org, Yi Chou <yich@google.com>, 
	Yi-An Chen <chenyian@google.com>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Simon Glass <sjg@chromium.org>, etienne.carriere@linaro.org, 
	Julius Werner <jwerner@chromium.org>, joakim.bech@linaro.org, etienne.carriere@foss.st.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can we get a review from maintainers now that we've posted this again?


On Mon, Jan 8, 2024 at 7:44=E2=80=AFPM Yi Chou <yich@chromium.org> wrote:
>
> The necessary fields to initialize the Widevine related functions in
> OP-TEE.
> Widevine is Google's content protection system for DRM (Digital rights
> management) contents.
>
> Signed-off-by: Yi Chou <yich@chromium.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>
>
> ---
> The previous discussion in the OP-TEE:
> https://github.com/OP-TEE/optee_os/pull/6418
> The reviewers prefer us to remove the compatible string.
> And they prefer the /options/op-tee/widevine node.
>
> Changes in v2:
> - Change all "widevine" to "Widevine".
> - Fix the prefix of properties.
> - Add the explanation of Widevine in the description section.
> - Add the usage restriction in the description section.
>
>  .../options/op-tee/google,widevine.yaml       | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 dtschema/schemas/options/op-tee/google,widevine.yaml
>
> diff --git a/dtschema/schemas/options/op-tee/google,widevine.yaml
> b/dtschema/schemas/options/op-tee/google,widevine.yaml
> new file mode 100644
> index 0000000..742e519
> --- /dev/null
> +++ b/dtschema/schemas/options/op-tee/google,widevine.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/options/op-tee/google,widevine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Widevine initialization parameters
> +
> +maintainers:
> +  - Jeffrey Kardatzke <jkardatzke@chromium.org>
> +  - Yi Chou <yich@chromium.org>
> +
> +description:
> +  Widevine is Google's content protection system for DRM (digital rights
> +  management) contents.
> +  The necessary fields to initialize the Widevine related functions in
> +  OP-TEE. This node does not represent a real device, but serves as a
> +  place for passing data between firmware and OP-TEE.
> +  The content of this node should not be shared with the Linux kernel.
> +
> +properties:
> +  op-tee,hardware-unique-key:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 32
> +    description: |
> +      The hardware-unique key of the OP-TEE. It will be used to derive
> +      the secure storage key.
> +      For more information, please reference:
> +      https://optee.readthedocs.io/en/latest/architecture/porting_guidel=
ines.html#hardware-unique-key
> +
> +  tcg,tpm-auth-public-key:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 1024
> +    description: |
> +      The TPM auth public key. Used to communicate the TPM from OP-TEE.
> +      The format of data should be TPM2B_PUBLIC.
> +      For more information, please reference the 12.2.5 section:
> +      https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1p5=
9_Part2_Structures_pub.pdf
> +
> +  google,widevine-root-of-trust-ecc-p256:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 32
> +    description: |
> +      The Widevine root of trust secret. Used to sign the Widevine
> +      request in OP-TEE. The value is an ECC NIST P-256 scalar.
> +      For more information, please reference the G.1.2 section:
> +      https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-=
186.pdf
> +
> +required:
> +  - op-tee,hardware-unique-key
> +  - tcg,tpm-auth-public-key
> +  - google,widevine-root-of-trust-ecc-p256
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    options {
> +      google,widevine {
> +        op-tee,hardware-unique-key =3D [
> +          12 f7 98 d2 0e d2 85 92 a5 82 bf 98 b8 99 2b c0
> +          c6 6f 19 85 79 86 65 18 55 eb ff 9b 6c c0 ac 27
> +        ];
> +        tcg,tpm-auth-public-key =3D [
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
