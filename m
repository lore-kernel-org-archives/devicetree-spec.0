From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC 1/3] dt-bindings: net: Add network-class schema for
 mac-address properties
Date: Fri, 3 Feb 2023 08:25:37 -0600
Message-ID: <CAL_Jsq+kJA0VS-SF67mhQFg0dS9KcQ-36ctGVsD78=wkrM7GUw@mail.gmail.com>
References: <20230203-dt-bindings-network-class-v1-0-452e0375200d@jannau.net> <20230203-dt-bindings-network-class-v1-1-452e0375200d@jannau.net>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675434354;
        bh=FnFLurR6aD/mKesWSxbnPpuvd9h9JjFxABX7sLbaerw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LypUN7+vWTtApRbYwlIRwDyFFUy4NZfOQX3n4Iuc7sKfAAyX+lrYAykQjof2WQrTW
         FRndf+FaBC4flW6GXdwnFCabsdlzw0ruzcqCfo9eYXUoT25pm89haMBSj+tcZJ+Ahc
         7mCedUfjlFNh2R3b/ygk0eY0cW42Eprn0lrRNc3R2LVvN8AHa8Xrdo8rmjyTi67WdV
         G7N5EdVyS2NX9kLAWWCPiyKx86qzeUlEDH0p/yeNkZOvSeQ/tO7AYn2sow9d+SrJmg
         MK/jS54K0tyRnxC+jicY7BuKH6vSICoRU8ISslV8k95A1xryDrohtcZPM+EjEgYf4p
         2ARiXfjvlybkg==
In-Reply-To: <20230203-dt-bindings-network-class-v1-1-452e0375200d-w2YMFpIX6D+sTnJN9+BGXg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Janne Grunau <j@jannau.net>
Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, Feb 3, 2023 at 7:56 AM Janne Grunau <j@jannau.net> wrote:
>
> The ethernet-controller schema specifies "mac-address" and
> "local-mac-address" but other network devices such as wireless network
> adapters use mac addresses as well.
> The Devicetree Specification, Release v0.3 specifies in section 4.3.1
> a generic "Network Class Binding" with "address-bits", "mac-address",
> "local-mac-address" and "max-frame-size". This schema specifies the
> "address-bits" property and moves "local-mac-address" and "mac-address"
> over from ethernet-controller.yaml.
> The schema currently does not restrict MAC address size based on
> address-bits.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  .../bindings/net/ethernet-controller.yaml          | 18 +---------
>  .../devicetree/bindings/net/network-class.yaml     | 40 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 17 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 00be387984ac..a5f6a09dfdea 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -17,23 +17,6 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/string
>      description: Human readable label on a port of a box.
>
> -  local-mac-address:
> -    description:
> -      Specifies the MAC address that was assigned to the network device.
> -    $ref: /schemas/types.yaml#/definitions/uint8-array
> -    minItems: 6
> -    maxItems: 6
> -
> -  mac-address:
> -    description:
> -      Specifies the MAC address that was last used by the boot
> -      program; should be used in cases where the MAC address assigned
> -      to the device by the boot program is different from the
> -      local-mac-address property.
> -    $ref: /schemas/types.yaml#/definitions/uint8-array
> -    minItems: 6
> -    maxItems: 6
> -
>    max-frame-size:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -226,6 +209,7 @@ dependencies:
>    pcs-handle-names: [pcs-handle]
>
>  allOf:
> +  - $ref: /schemas/net/network-class.yaml#
>    - if:
>        properties:
>          phy-mode:
> diff --git a/Documentation/devicetree/bindings/net/network-class.yaml b/Documentation/devicetree/bindings/net/network-class.yaml
> new file mode 100644
> index 000000000000..676aec1c458e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/network-class.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/network-class.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Network Class Bindings
> +
> +maintainers:
> +  - Devicetree Specification Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> +
> +properties:
> +  address-bits:
> +    description:
> +      Specifies number of address bits required to address the device described
> +      by this node. This property specifies number of bits in MAC address.
> +      If unspecified, the default value is 48.

You can drop the last sentence.

> +    default: 48
> +    enum: [48, 64]

I wonder if we should just deprecate this property. I see 1 occurrence
and no consumer in the kernel tree at least. I guess one could set the
length, but not have mac addresses in the DT. Otherwise you could just
infer the length from the property length. Anyways, a conversation for
another time I guess.

Rob
