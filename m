From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/54] dt-bindings: Convert Reserved Memory binding to a schema
Date: Wed, 21 Jul 2021 08:30:43 -0600
Message-ID: <CAL_JsqKAZLBK2UDDUNrO4aaYr886oODB_N_yF70X44gPXs=k5Q@mail.gmail.com>
References: <20210721140424.725744-1-maxime@cerno.tech> <20210721140424.725744-6-maxime@cerno.tech>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626877857;
        bh=ItoMV2w0siUwl28cOzY8vDd1juPLnJDPTjp4OHicjsY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ClvtVxu6OzSCTr6zmptraNDY5OLNM624UREm7ezvDoU7BW5bC7r8V6ZGzAZy4bz+s
         sJmW+LWR+x+z38wxw+FmxcRcR3VpAili1h7VPCl3/irV2M+zsa6ltHGlpNRW3joXxb
         qiGO227LA3oUUwE+OoUR5Fu8ZX+U03rbDw2VN5xN/OfXGUj4oZJLRs7BhcNb9PHRHa
         lMOv2MfIHgkGFQInTs+9K/XPN8JjjdnzcYx83pg5Go6wg10Pw7FlgESAqmTDqVrVDX
         vXdI0cnQYmzHSoBs+o0R54zCBZ3MKEfh4VhiWFx5NPNp2fXiHaImlqF/qOEP0ti2ob
         j+9LQ+FyekYLw==
In-Reply-To: <20210721140424.725744-6-maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, Jul 21, 2021 at 8:04 AM Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org> wrote:
>
> The Reserved Memory mechanism is supported by Linux thanks to its device
> tree binding.
>
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.

Thanks for this!

>
> Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
> ---
>  .../reserved-memory/reserved-memory.txt       | 141 ---------------
>  .../reserved-memory/reserved-memory.yaml      | 167 ++++++++++++++++++
>  2 files changed, 167 insertions(+), 141 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml

> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> new file mode 100644
> index 000000000000..b61527f11953
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: GPL-2.0

I think this is okay to dual license. Grant (Linaro) is the original
author and there's only a few lines from other authors.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: /reserved-memory Node
> +
> +maintainers:
> +  - Devicetree Specification Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> +
> +description: >
> +  Reserved memory is specified as a node under the /reserved-memory node. The
> +  operating system shall exclude reserved memory from normal usage one can
> +  create child nodes describing particular reserved (excluded from normal use)
> +  memory regions. Such memory regions are usually designed for the special
> +  usage by various device drivers.
> +
> +properties:
> +  $nodename:
> +    const: reserved-memory
> +
> +  "#address-cells": true
> +  "#size-cells": true
> +  ranges: true
> +
> +patternProperties:
> +  "^(?!(ranges))[a-z,-]*(@[0-9]+)?$":

Note that you could drop this and put under 'additionalProperties'.
You would lose some node name checking, but there's really little
standard on these nodes.

> +    type: object
> +
> +    description: >
> +      Each child of the reserved-memory node specifies one or more regions of
> +      reserved memory. Each child node may either use a 'reg' property to
> +      specify a specific range of reserved memory, or a 'size' property with
> +      optional constraints to request a dynamically allocated block of memory.
> +
> +      Following the generic-names recommended practice, node names should
> +      reflect the purpose of the node (ie. "framebuffer" or "dma-pool"). Unit
> +      address (@<address>) should be appended to the name if the node is a
> +      static allocation.
> +
> +    properties:
> +      reg: true
> +
> +      size:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: >
> +          Length based on parent's \#size-cells. Size in bytes of memory to
> +          reserve.
> +
> +      alignment:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: >
> +          Length based on parent's \#size-cells. Address boundary for
> +          alignment of allocation.
> +
> +      alloc-ranges:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: >
> +          Address and Length pairs. Specifies regions of memory that are
> +          acceptable to allocate from.
> +
> +      compatible:
> +        oneOf:
> +          - const: shared-dma-pool
> +            description: >
> +              This indicates a region of memory meant to be used as a shared
> +              pool of DMA buffers for a set of devices. It can be used by an
> +              operating system to instantiate the necessary pool management
> +              subsystem if necessary.
> +
> +          # Vendor-specific compatibles in the form <vendor>,[<device>-]<usage>
> +          - const: mediatek,trustzone-bootinfo

I think these should be separate schema files. At least, we're going
to need to support separate files because I don't think we want ones
adding custom properties here. This would fail unless we add every
compatible here. We could also be a bit more exact as to which
properties below apply (e.g. linux,.*-default is only valid for
shared-dma-pool).

> +
> +      no-map:
> +        type: boolean
> +        description: >
> +          Indicates the operating system must not create a virtual mapping of
> +          the region as part of its standard mapping of system memory, nor
> +          permit speculative access to it under any circumstances other than
> +          under the control of the device driver using the region.
> +
> +      reusable:
> +        type: boolean
> +        description: >
> +          The operating system can use the memory in this region with the
> +          limitation that the device driver(s) owning the region need to be
> +          able to reclaim it back. Typically that means that the operating
> +          system can use that region to store volatile or cached data that
> +          can be otherwise regenerated or migrated elsewhere.
> +
> +      linux,cma-default:
> +        type: boolean
> +        description: >
> +          If this property is present, then Linux will use the region for the
> +          default pool of the contiguous memory allocator.
> +
> +      linux,dma-default:
> +        type: boolean
> +        description: >
> +          If this property is present, then Linux will use the region for the
> +          default pool of the consistent DMA allocator.
> +
> +    allOf:
> +      - if:
> +          required:
> +            - no-map
> +
> +        then:
> +          not:
> +            required:
> +              - reusable
> +
> +      - if:
> +          required:
> +            - reusable
> +
> +        then:
> +          not:
> +            required:
> +              - no-map
> +
> +    oneOf:
> +      - required:
> +          - reg
> +
> +      - required:
> +          - size
> +
> +    additionalProperties: true
> +
> +additionalProperties: true

This should be false, right?

> +
> +examples:
> +  - |
> +      / {
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +          model = "MediaTek MT2701 evaluation board";
> +          compatible = "mediatek,mt2701-evb", "mediatek,mt2701";
> +
> +          reserved-memory {
> +              #address-cells = <1>;
> +              #size-cells = <1>;
> +              ranges;
> +
> +              /* global autoconfigured region for contiguous allocations */
> +              linux,cma {
> +                  compatible = "shared-dma-pool";
> +                  reusable;
> +                  size = <0x4000000>;
> +                  alignment = <0x2000>;
> +                  linux,cma-default;
> +              };
> +
> +              display_reserved: framebuffer@78000000 {
> +                  reg = <0x78000000 0x800000>;
> +              };
> +
> +              trustzone-bootinfo@80002000 {
> +                  compatible = "mediatek,trustzone-bootinfo";
> +                  reg = <0x80002000 0x1000>;
> +              };
> +          };
> +      };
> +
> +...
> --
> 2.31.1
>
