From: Krzysztof Kozlowski <krzysztof.kozlowski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: Add Google Widevine initialization
 parameters
Date: Sun, 17 Sep 2023 10:40:27 +0200
Message-ID: <2ec056f3-e8a8-c5f3-b132-4b9d2beb616e@linaro.org>
References: <20230908101539.2622864-1-yich@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree+bounces-828-gldd-devicetree-discuss-3=m.gmane-mx.org-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694940029; x=1695544829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phjZMXXQGBT1PWKlmZw5Yn4FYGfgtcbWgls+p3VRN5o=;
        b=GVIGoun+TmUqLpe/6klQ+UJEfcF9srklRV7qTAQD0NkMfvL7u3cRbOOn5mGeMbwRvY
         hmVga+mvypBDSAAA7BmUk5xQMakiNgA8gxLGHp1HpD6wZIOhkGXoooTORBpCdt3rIS8d
         bZ45Lv/XM40n4VpDyUp1pPLXGhAqfof+KIt+pCRf+V9crU8C+Wl5IXiUkbuK5YGIWJwr
         8cbCiftZm4DkMG1ICVw9WoyuQDdiua8vPaJfvISNO3VQW3ye5exccQUQ9IrQrWk/isvq
         6Qg1uSiw0S4iLpmWq6waxFf+izf6lahXfbnnA/2/+xsuEhtBli29M247Bjn83CxQ0DCP
         YHeA==
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
In-Reply-To: <20230908101539.2622864-1-yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Content-Type: text/plain; charset="us-ascii"
To: Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, chenyian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jkardatzke-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

On 08/09/2023 12:15, Yi Chou wrote:
> The necessary fields to initialize the widevine related functions in
> OP-TEE.
> 
> Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  .../bindings/options/google,widevine.yaml     | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/options/google,widevine.yaml
> 
> diff --git a/Documentation/devicetree/bindings/options/google,widevine.yaml b/Documentation/devicetree/bindings/options/google,widevine.yaml
> new file mode 100644
> index 0000000000000..bf2b834cb1454
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/options/google,widevine.yaml

There is no such hardware as "options". What is this supposed to be for?
firmware?

> @@ -0,0 +1,124 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/options/google,widevine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Widevine initialization parameters.

This is a title, drop full stop.

> +
> +maintainers:
> +  - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> +  - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> +
> +description:
> +  The necessary fields to initialize the widevine related functions in
> +  OP-TEE. This node does not represent a real device, but serves as a
> +  place for passing data between firmware and OP-TEE.
> +  The public fields (e.g. tpm-auth-public-key & root-of-trust-cert) can
> +  be ignored because it's safe to pass the public information with the
> +  other methods(e.g. userland OP-TEE plugins).

Then why isn't this a property of optee node?

> +
> +properties:
> +  compatible:
> +    const: google,widevine

From the description I have no clue what is "widevine". The more
surprising is to see it as "not hardware" but having its node and
compatible, like it was a hardware node.

> +
> +  hardware-unique-key:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: |
> +      The hardware-unique key of the Widevine OP-TEE. It will be used
> +      to derive the secure storage key. The length should be 32 bytes.
> +      For more information, please reference:
> +      https://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html#hardware-unique-key

Why would you store it in DT? This is world readable... or you mean this
is some seed?

> +
> +  tpm-auth-public-key:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: |
> +      The TPM auth public key. Used to communicate the TPM from OP-TEE.
> +      The format of data should be TPM2B_PUBLIC.
> +      For more information, please reference the 12.2.5 section:
> +      https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1p59_Part2_Structures_pub.pdf
> +
> +  root-of-trust:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: |
> +      The Widevine root of trust secret. Used to sign the widevine
> +      request in OP-TEE. The length should be 32 bytes. The value
> +      is an ECC NIST P-256 scalar.
> +      For more information, please reference the G.1.2 section:
> +      https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-186.pdf
> +
> +  root-of-trust-cert:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: |
> +      The X.509 certificate of the Widevine root of trust on this
> +      device. Used to provision the device status with the Widevine
> +      server in OP-TEE.
> +      For more information, please reference:
> +      https://www.itu.int/rec/T-REC-X.509
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

Why + ?

> +    options {

There is no such node as "options".


Best regards,
Krzysztof


