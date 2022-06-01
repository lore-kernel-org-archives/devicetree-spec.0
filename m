From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [dtschema PATCH] schemas: i2c: Add missing properties and descriptions
Date: Wed, 1 Jun 2022 10:00:23 -0500
Message-ID: <CAL_JsqKxyeWosex+WAPS-e_OTp19-zJHEWnzcCK6wt4jcbb5=A@mail.gmail.com>
References: <20220427175956.362987-1-robh@kernel.org>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654095635;
        bh=YGBTTwSez2bvfmHZWHX0qISMoJt6yn6ld2BIY8Pf8UM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cG//5M4O1K4VQHiu7hcVQVh/4Zxh9AvFFesY8jMGKFRY1mVp/Yny3u+qVZ/1/1g3W
         aGO4g0cl7gtxfSqd+VtIYgrSqZW4LGMhR1dKfh0ye5gc0Z32vSPvIB6GDxtpKKwmC4
         N/5+tFZ+kAADzxzkIN8NT8EmuuuJy1R7TuEImkMbGsNznkKzQbjZhNRgnSR1UFyX9n
         TomfBZlAkUWQJjPidL49cnfqsedJDtVQ7VpBokgCo5XZdPUl7Qssih6/6F7fkG3IUs
         oOXMrj2QvpbjVnwfxF5d2hScJkMnyov8ihXrPZ6JIcQknb1M+AEvL0msMJIshWMns3
         jaF3mTpkSUccQ==
In-Reply-To: <20220427175956.362987-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Codrin Ciubotariu <codrin.ciubotariu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alain Volmat <alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>, Matt Johnston <matt-KrQt6mEI6EMUxA4j4dw1vfQIK84fMopw@public.gmane.org>

On Wed, Apr 27, 2022 at 12:59 PM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> Add remaining properties and descriptions from i2c.txt binding in Linux
> kernel tree. The Cc list are the authors of i2c.txt.
>
> Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
> Cc: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Codrin Ciubotariu <codrin.ciubotariu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Alain Volmat <alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>

Ping!

If you are waiting on company approvals, please let me know.


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
> +              Names which are recognized by I2C core,  other names are left to
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
