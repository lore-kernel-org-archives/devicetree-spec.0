From: Alain Volmat <alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [dtschema PATCH] schemas: i2c: Add missing properties and
 descriptions
Date: Fri, 3 Jun 2022 16:41:17 +0200
Message-ID: <20220603144057.GA61492@gnbcxd0016.gnb.st.com>
References: <20220427175956.362987-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=uKXAhTX/XHiE04v74SMmqfPx+51MyTryS135+G2X98E=;
 b=58K0yMKOFWXG3vwAileDSrwj22O4OECR6e4cBgFwctDTleO0Xy1ddD1ngzzDh9peHdtI
 7aSig99+AfSB6jAFOQrUPmS82k45bU4L/GwA/TDVAuqQOWXjtQcd6OicG6Q3IkBfwihL
 Lck1rDe+M6iP2gRRDviKcAd0MkZff4P9HdwiszsfwrbZlAcNgdai6shVD/HN8LU5H4YL
 FsKHGE0EJuasefjkJu3My/A2vtnOSJBYWa8zWvApXg94+Pv+jyL+Xya2/c1/klgTprY2
 81iOawhU1aFYT8O8FAcS26UhJl40p0TfKjQNPpwkSkZH+4pt4nj74ryqgYU2zBvSSL9s QQ== 
Content-Disposition: inline
In-Reply-To: <20220427175956.362987-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Codrin Ciubotariu <codrin.ciubotariu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matt Johnston <matt-KrQt6mEI6EMUxA4j4dw1vfQIK84fMopw@public.gmane.org>

Hi,

Acked-by: Alain Volmat <alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>

Thanks.
Alain

On Wed, Apr 27, 2022 at 12:59:56PM -0500, Rob Herring wrote:
> Add remaining properties and descriptions from i2c.txt binding in Linux
> kernel tree. The Cc list are the authors of i2c.txt.
> 
> Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
> Cc: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Codrin Ciubotariu <codrin.ciubotariu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Alain Volmat <alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>
> Cc: Matt Johnston <matt-KrQt6mEI6EMUxA4j4dw1vfQIK84fMopw@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Cc list, 
> 
> I need your or your company's permission to relicense i2c.txt contents 
> (used in 'description') to BSD-2-Clause. Please ack and provide a 
> copyright if desired.
> 
>  dtschema/schemas/i2c/i2c-controller.yaml | 143 +++++++++++++++++++++++
>  1 file changed, 143 insertions(+)
> 
> diff --git a/dtschema/schemas/i2c/i2c-controller.yaml b/dtschema/schemas/i2c/i2c-controller.yaml
> index 91eac62a6bc8..c2e803ebcc3f 100644
> --- a/dtschema/schemas/i2c/i2c-controller.yaml
> +++ b/dtschema/schemas/i2c/i2c-controller.yaml
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: BSD-2-Clause
>  # Copyright 2018 Linaro Ltd.
> +# Copyright 2022 Arm Ltd.
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
> @@ -28,6 +29,91 @@ properties:
>      minimum: 1000
>      maximum: 3000000
>  
> +  i2c-scl-falling-time-ns:
> +    description:
> +      Number of nanoseconds the SCL signal takes to fall; t(f) in the I2C
> +      specification.
> +
> +  i2c-scl-internal-delay-ns:
> +    description:
> +      Number of nanoseconds the IP core additionally needs to setup SCL.
> +
> +  i2c-scl-rising-time-ns:
> +    description:
> +      Number of nanoseconds the SCL signal takes to rise; t(r) in the I2C
> +      specification.
> +
> +  i2c-sda-falling-time-ns:
> +    description:
> +      Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
> +      specification.
> +
> +  i2c-analog-filter:
> +    type: boolean
> +    description:
> +      Enable analog filter for i2c lines.
> +
> +  i2c-digital-filter:
> +    type: boolean
> +    description:
> +      Enable digital filter for i2c lines.
> +
> +  i2c-digital-filter-width-ns:
> +    description:
> +      Width of spikes which can be filtered by digital filter
> +      (i2c-digital-filter). This width is specified in nanoseconds.
> +
> +  i2c-analog-filter-cutoff-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Frequency that the analog filter (i2c-analog-filter) uses to distinguish
> +      which signal to filter. Signal with higher frequency than specified will
> +      be filtered out. Only lower frequency will pass (this is applicable to a
> +      low-pass analog filter). Typical value should be above the normal i2c bus
> +      clock frequency (clock-frequency). Specified in Hz.
> +
> +  mctp-controller:
> +    type: boolean
> +    description:
> +      Indicates that the system is accessible via this bus as an endpoint for
> +      MCTP over I2C transport.
> +
> +  multi-master:
> +    type: boolean
> +    description:
> +      States that there is another master active on this bus. The OS can use
> +      this information to adapt power management to keep the arbitration awake
> +      all the time, for example. Can not be combined with 'single-master'.
> +
> +  scl-gpios:
> +    maxItems: 1
> +    description:
> +      Specifies the GPIO related to SCL pin. Used for GPIO bus recovery.
> +
> +  sda-gpios:
> +    maxItems: 1
> +    description:
> +      Specifies the GPIO related to SDA pin. Optional for GPIO bus recovery.
> +
> +  single-master:
> +    type: boolean
> +    description:
> +      States that there is no other master active on this bus. The OS can use
> +      this information to detect a stalled bus more reliably, for example. Can
> +      not be combined with 'multi-master'.
> +
> +  smbus:
> +    type: boolean
> +    description:
> +      States that additional SMBus restrictions and features apply to this bus.
> +      An example of feature is SMBusHostNotify. Examples of restrictions are
> +      more reserved addresses and timeout definitions.
> +
> +  smbus-alert:
> +    type: boolean
> +    description:
> +      states that the optional SMBus-Alert feature apply to this bus.
> +
>    no-detect:
>      type: boolean
>      description:
> @@ -38,4 +124,61 @@ patternProperties:
>    '@[0-9a-f]+$':
>      type: object
>  
> +    properties:
> +      reg:
> +        items:
> +          items:
> +            - oneOf:
> +                - maximum: 0x7f
> +                - minimum: 0x40000000
> +                  maximum: 0x4000007f
> +                - minimum: 0x80000000
> +                  maximum: 0x800003ff
> +                - minimum: 0xc0000000
> +                  maximum: 0xc00003ff
> +        description: |
> +          One or many I2C slave addresses. These are usually a 7 bit addresses.
> +          However, flags can be attached to an address. I2C_TEN_BIT_ADDRESS is
> +          used to mark a 10 bit address. It is needed to avoid the ambiguity
> +          between e.g. a 7 bit address of 0x50 and a 10 bit address of 0x050
> +          which, in theory, can be on the same bus.
> +          Another flag is I2C_OWN_SLAVE_ADDRESS to mark addresses on which we
> +          listen to be devices ourselves.
> +
> +      host-notify:
> +        description:
> +          Device uses SMBus host notify protocol instead of interrupt line.
> +          Requires being connected to an adapter that supports this feature.
> +
> +      interrupts:
> +        description:
> +          I2C core will treat "irq" interrupt (or the very first interrupt if
> +          not using interrupt names) as primary interrupt for the slave.
> +
> +      interrupt-names:
> +        anyOf:
> +          - {} # Any name is allowed.
> +          - items:
> +              enum:
> +                - irq
> +                - wakeup
> +                - smbus_alert
> +            description:
> +              Names which are recognized by I2C core,	other names are	left to
> +              individual bindings.
> +
> +      wakeup-source:
> +        description:
> +          Device can be used as a wakeup source. The device should also have
> +          "wakeup" interrupt for the device. If "wakeup" interrupt name is not
> +          present in the binding, then primary interrupt will be used as wakeup
> +          interrupt.
> +
> +    required:
> +      - reg
> +
> +dependentRequired:
> +  i2c-analog-filter-cutoff-frequency: [ i2c-analog-filter ]
> +  i2c-digital-filter-width-ns: [ i2c-digital-filter ]
> +
>  additionalProperties: true
> -- 
> 2.34.1
> 
