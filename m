From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/54] dt-bindings: Convert Reserved Memory binding to a schema
Date: Wed, 18 Aug 2021 07:54:59 -0500
Message-ID: <CAL_JsqK8ZDy=4_KmB_5ce4Z1=XcKH7EgydAVuC5Cko6F63ACrQ@mail.gmail.com>
References: <20210721140424.725744-1-maxime@cerno.tech> <20210721140424.725744-6-maxime@cerno.tech>
 <CAL_JsqKAZLBK2UDDUNrO4aaYr886oODB_N_yF70X44gPXs=k5Q@mail.gmail.com> <20210818100021.yzzcuadkowy4tfv4@gilmour>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629291314;
        bh=qfimuz/xc2ShyihFDgQNSAdTOIIZ4oK4XRr5EFm9R2I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OFrXhTd4g/bAi0QZbPFyVKqhN00Z7DB0yuYoMnE7e4ge7IjKWkVa3VPATTyBcyGmP
         8IbxWtoB7NQ3f/QXGJP0BwrF5fAmcEN1WdFHZfq9F9XGnrQEt9ovqUMrg5IL6WdGcT
         C74RBdriBjr0wnMB8eI0qMTTwBdbaz7nBu4C/bbri2fvoqc3Aj9Jy6yE5mEJSax5Nz
         Fc3ZLPn4wggTpoPPNVNXsphcbNAj4AZ5vFCEZNoD3wzeDBSyGe0ChPfMc2Mg9TKRiJ
         PNBhNL3b0Gl9TuxPk7dgbcfNX89SLmFHvRoraFGbI6vxjATeCq//S7ECcQJcKrqC1L
         MFjR9yKlimV5g==
In-Reply-To: <20210818100021.yzzcuadkowy4tfv4@gilmour>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, Aug 18, 2021 at 5:00 AM Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org> wrote:
>
> Hi Rob,
>
> On Wed, Jul 21, 2021 at 08:30:43AM -0600, Rob Herring wrote:
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: /reserved-memory Node
> > > +
> > > +maintainers:
> > > +  - Devicetree Specification Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> > > +
> > > +description: >
> > > +  Reserved memory is specified as a node under the /reserved-memory node. The
> > > +  operating system shall exclude reserved memory from normal usage one can
> > > +  create child nodes describing particular reserved (excluded from normal use)
> > > +  memory regions. Such memory regions are usually designed for the special
> > > +  usage by various device drivers.
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    const: reserved-memory
> > > +
> > > +  "#address-cells": true
> > > +  "#size-cells": true
> > > +  ranges: true
> > > +
> > > +patternProperties:
> > > +  "^(?!(ranges))[a-z,-]*(@[0-9]+)?$":
> >
> > Note that you could drop this and put under 'additionalProperties'.
> > You would lose some node name checking, but there's really little
> > standard on these nodes.
>
> I didn't realise it could be used that way too, I'll change it.
>
> > > +    type: object
> > > +
> > > +    description: >
> > > +      Each child of the reserved-memory node specifies one or more regions of
> > > +      reserved memory. Each child node may either use a 'reg' property to
> > > +      specify a specific range of reserved memory, or a 'size' property with
> > > +      optional constraints to request a dynamically allocated block of memory.
> > > +
> > > +      Following the generic-names recommended practice, node names should
> > > +      reflect the purpose of the node (ie. "framebuffer" or "dma-pool"). Unit
> > > +      address (@<address>) should be appended to the name if the node is a
> > > +      static allocation.
> > > +
> > > +    properties:
> > > +      reg: true
> > > +
> > > +      size:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        description: >
> > > +          Length based on parent's \#size-cells. Size in bytes of memory to
> > > +          reserve.
> > > +
> > > +      alignment:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        description: >
> > > +          Length based on parent's \#size-cells. Address boundary for
> > > +          alignment of allocation.
> > > +
> > > +      alloc-ranges:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        description: >
> > > +          Address and Length pairs. Specifies regions of memory that are
> > > +          acceptable to allocate from.
> > > +
> > > +      compatible:
> > > +        oneOf:
> > > +          - const: shared-dma-pool
> > > +            description: >
> > > +              This indicates a region of memory meant to be used as a shared
> > > +              pool of DMA buffers for a set of devices. It can be used by an
> > > +              operating system to instantiate the necessary pool management
> > > +              subsystem if necessary.
> > > +
> > > +          # Vendor-specific compatibles in the form <vendor>,[<device>-]<usage>
> > > +          - const: mediatek,trustzone-bootinfo
> >
> > I think these should be separate schema files. At least, we're going
> > to need to support separate files because I don't think we want ones
> > adding custom properties here. This would fail unless we add every
> > compatible here. We could also be a bit more exact as to which
> > properties below apply (e.g. linux,.*-default is only valid for
> > shared-dma-pool).
>
> I'm not entirely sure how we can just ignore the vendor compatibles
> without raising a warning. Do you have any suggestion?

You need 1 schema file with all the common (child) properties and then
1 schema file for each compatible (maybe some can be grouped) that
references the common schema.

You'd lose checking that the child nodes are actually children of
/reserved-memory, but I'm not too worried about that.

Rob
