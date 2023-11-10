Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082D56FCD
	for <devicetree-spec@vger.kernel.org>; Fri, 10 Nov 2023 07:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RifgdX3+"
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF1B86B6
	for <devicetree-spec@vger.kernel.org>; Thu,  9 Nov 2023 23:51:00 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9c2a0725825so294941766b.2
        for <devicetree-spec@vger.kernel.org>; Thu, 09 Nov 2023 23:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699602659; x=1700207459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lx1qrUIOcggShjnVZ2XmLTGJ/PJnetVfyjCXJgQC/Oc=;
        b=RifgdX3+ecCUst+g1ASHk/BZw4ULKwVhhSnkIkw1Ssg1/uVBb7SmSR6BYGMr1RG9T/
         mEpUBoE8ME+bTo9+s36hIzmcZe5RRJs2YiPxM0OoDWDsJJxlIdWc72SpIQJjaK1YIC/M
         rNAWgSweJXdKdjmo7u3IY9ASyZKWQ0T1osd7GFqdxGre4t9CwmCQT2w4dWqTPPoJoVgn
         7Kzvz4DyVp99onZhXztKfrBYqV+ONVbOuAjBv9DDpBn4lV3uf8RrAGXlMGbTBa1Jh2YR
         E+XAec4mufUSwE7yovDnCHHGzpwrTg4tOdmOMT7t4Q1BeE78tpuuPqXnyuYp4Cl95B1L
         DZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699602659; x=1700207459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lx1qrUIOcggShjnVZ2XmLTGJ/PJnetVfyjCXJgQC/Oc=;
        b=vcVllpNkeNGKOuO4/W3e7XLG5mjHLx4cSO8twVPlKVrRy0R+q/hWf0RrTPJHWmPSrh
         oaGlt5rKTjD4rUbDPKUt0qabXDWE4SQEdSvzs5jyzP/g/dYpTjX7KkpWaC09rE+ELgXv
         0QG+KXaAuZryKgBEbGjf3/e4TaWe7WptR4Y4/LWJfZG1N3QNV6N8cuC4n1up23717SFP
         houeGuZ6rtN7rxbqhSFBQ/QL1I/PFK1DPSuaHkgRzqbnecpOCqQh6SswgmNqFfCtStV6
         MBgdU7VLznpmEi4Kwi4IJmc9rd5TUybZMC/UpUb2oiFZUO8cGsCsMipgXJnmYt9BhpqG
         Cnig==
X-Gm-Message-State: AOJu0YzIkkaaQSDyzPsgn/uiKNmKAqEM8hPPR3Ckn9UbmR8fCzZZylrG
	+oHKVChIfYtHynoJLDMR8yJIxw==
X-Google-Smtp-Source: AGHT+IFc+p/z+8OJy8/vHCVfFwkch261GE+bUT7PexXeYPac1UZUT8rDXHo2ncV0XiREenDKDhRIYQ==
X-Received: by 2002:a17:907:9287:b0:9be:705:d7d0 with SMTP id bw7-20020a170907928700b009be0705d7d0mr6135055ejc.0.1699602659133;
        Thu, 09 Nov 2023 23:50:59 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id p27-20020a056402501b00b0053f9578ec97sm793876eda.56.2023.11.09.23.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 23:50:58 -0800 (PST)
Message-ID: <f9db6da9-99ee-43e6-ad13-cf26b8c1e7fa@linaro.org>
Date: Fri, 10 Nov 2023 08:50:57 +0100
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] schemas: Add Google Widevine initialization parameters
Content-Language: en-US
To: Yi Chou <yich@chromium.org>, Rob Herring <robh@kernel.org>
Cc: jkardatzke@google.com, yich@google.com,
 krzysztof.kozlowski+dt@linaro.org, devicetree-spec@vger.kernel.org,
 chenyian@google.com, sjg@chromium.org, jwerner@chromium.org,
 jens.wiklander@linaro.org
References: <20231110043241.2920553-1-yich@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231110043241.2920553-1-yich@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2023 05:32, Yi Chou wrote:
> The necessary fields to initialize the widevine related functions in
> OP-TEE.
> 
> Signed-off-by: Yi Chou <yich@chromium.org>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> ---

Please provide version log and proper background for this patch. This
was already sent to Linux kernel, so we should not spend time to figure
it out.

> There's no plan to add more optee stuff now.
> This is it.
> 
>  dtschema/schemas/options/op-tee/widevine.yaml | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 dtschema/schemas/options/op-tee/widevine.yaml
> 
> diff --git a/dtschema/schemas/options/op-tee/widevine.yaml b/dtschema/schemas/options/op-tee/widevine.yaml
> new file mode 100644
> index 0000000..925c214
> --- /dev/null
> +++ b/dtschema/schemas/options/op-tee/widevine.yaml

Missing vendor prefix - google,

> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/options/op-tee/widevine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Widevine initialization parameters

What is Widevine? You write it once "widevine", once "Widevine" but
never explain what it is.

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
> +      https://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html#hardware-unique-key

Blank line

> +  google,tcg-tpm-auth-public-key:

Missing tcg prefix as asked by Rob.

> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 1024
> +    description: |
> +      The TPM auth public key. Used to communicate the TPM from OP-TEE.
> +      The format of data should be TPM2B_PUBLIC.
> +      For more information, please reference the 12.2.5 section:
> +      https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1p59_Part2_Structures_pub.pdf

Blank line


> +  google,widevine-root-of-trust-ecc-p256:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 32
> +    description: |
> +      The Widevine root of trust secret. Used to sign the widevine
> +      request in OP-TEE. The value is an ECC NIST P-256 scalar.
> +      For more information, please reference the G.1.2 section:
> +      https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-186.pdf

Blank line


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

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



> +        google,optee-hardware-unique-key = [
> +          12 f7 98 d2 0e d2 85 92 a5 82 bf 98 b8 99 2b c0
> +          c6 6f 19 85 79 86 65 18 55 eb ff 9b 6c c0 ac 27
> +        ];
> +        google,tcg-tpm-auth-public-key = [
> +          00 76 00 23 00 0b 00 02 04 b2 00 20 e1 47 bf 27
> +          e1 74 30 c8 16 ab 72 4d 5c 77 e1 5c 61 2d 56 81
> +          b3 35 cd 9d eb 67 41 37 69 f0 32 41 00 10 00 10
> +          00 03 00 10 00 20 70 9a df 50 f9 0f d5 f4 40 e0
> +          ea 2c e8 f2 26 9f 0e 5c 02 70 16 c3 6c c1 83 03
> +          2d 04 10 bd 85 7a 00 20 83 03 c2 66 6e 01 32 34
> +          5c 5e 80 22 c7 48 24 3c 70 6b b8 e4 24 42 74 a9
> +          cf fc ab f8 30 e9 de 51
> +        ];
> +        google,widevine-root-of-trust-ecc-p256 = [
> +          ac 0d 86 c3 d7 b5 b7 a2 6f c3 d9 93 f7 de bc bb
> +          d5 c4 25 9b 21 5f 36 af b5 dd 6d 29 9d 08 c0 10
> +        ];
> +      };
> +    };

Best regards,
Krzysztof

