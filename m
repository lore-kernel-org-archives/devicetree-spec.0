From: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
Subject: Re: [PATCH 05/54] dt-bindings: Convert Reserved Memory
 binding to a schema
Date: Wed, 18 Aug 2021 12:00:21 +0200
Message-ID: <20210818100021.yzzcuadkowy4tfv4@gilmour>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-6-maxime@cerno.tech>
 <CAL_JsqKAZLBK2UDDUNrO4aaYr886oODB_N_yF70X44gPXs=k5Q@mail.gmail.com>
Reply-To: maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n7nlrbexrimtktxt"
Return-path: <linux-sunxi+bncBDBYZUEI7YHBBOVU6OEAMGQECQE6QYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=N/yJCkzIY0BSz6Or3XeRlBh30WJdxGVTIlv9XA+dsKM=;
        b=ZJ/gogesH2SNgUKruErNe6FmukteMtSKfUkpFlhOnOHV+bgv3TXwlgD+RHr7S5Sdof
         JFI4jJmyfu1JLTknYP4jBt3W/bBwZ3UPJiZyPAIPtlB5SA8tkMOS4SDJdaCMxoDDcvgq
         PPrO66bZqdIVhzar4dGicIW3RScyqd2Rr8zy1ZHwsBoykDVl4KiURTTN3OYVF+rT9q3i
         0ulY7Y9ePVLZbDwaNJTJ6oNzjwUnvPcoZXIP0h5IbctDfQHrWMg/1mlTLyX/Kr4ecg59
         VAUeAE+a313HLspMhGxAT5Ffnqx8eJdZpGGj/vLB5+H+HcYSP31WKjMitygPWH9wGMr9
         03iQ==
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAL_JsqKAZLBK2UDDUNrO4aaYr886oODB_N_yF70X44gPXs=k5Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--n7nlrbexrimtktxt
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi Rob,

On Wed, Jul 21, 2021 at 08:30:43AM -0600, Rob Herring wrote:
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: /reserved-memory Node
> > +
> > +maintainers:
> > +  - Devicetree Specification Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> > +
> > +description: >
> > +  Reserved memory is specified as a node under the /reserved-memory node. The
> > +  operating system shall exclude reserved memory from normal usage one can
> > +  create child nodes describing particular reserved (excluded from normal use)
> > +  memory regions. Such memory regions are usually designed for the special
> > +  usage by various device drivers.
> > +
> > +properties:
> > +  $nodename:
> > +    const: reserved-memory
> > +
> > +  "#address-cells": true
> > +  "#size-cells": true
> > +  ranges: true
> > +
> > +patternProperties:
> > +  "^(?!(ranges))[a-z,-]*(@[0-9]+)?$":
> 
> Note that you could drop this and put under 'additionalProperties'.
> You would lose some node name checking, but there's really little
> standard on these nodes.

I didn't realise it could be used that way too, I'll change it.

> > +    type: object
> > +
> > +    description: >
> > +      Each child of the reserved-memory node specifies one or more regions of
> > +      reserved memory. Each child node may either use a 'reg' property to
> > +      specify a specific range of reserved memory, or a 'size' property with
> > +      optional constraints to request a dynamically allocated block of memory.
> > +
> > +      Following the generic-names recommended practice, node names should
> > +      reflect the purpose of the node (ie. "framebuffer" or "dma-pool"). Unit
> > +      address (@<address>) should be appended to the name if the node is a
> > +      static allocation.
> > +
> > +    properties:
> > +      reg: true
> > +
> > +      size:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description: >
> > +          Length based on parent's \#size-cells. Size in bytes of memory to
> > +          reserve.
> > +
> > +      alignment:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description: >
> > +          Length based on parent's \#size-cells. Address boundary for
> > +          alignment of allocation.
> > +
> > +      alloc-ranges:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description: >
> > +          Address and Length pairs. Specifies regions of memory that are
> > +          acceptable to allocate from.
> > +
> > +      compatible:
> > +        oneOf:
> > +          - const: shared-dma-pool
> > +            description: >
> > +              This indicates a region of memory meant to be used as a shared
> > +              pool of DMA buffers for a set of devices. It can be used by an
> > +              operating system to instantiate the necessary pool management
> > +              subsystem if necessary.
> > +
> > +          # Vendor-specific compatibles in the form <vendor>,[<device>-]<usage>
> > +          - const: mediatek,trustzone-bootinfo
> 
> I think these should be separate schema files. At least, we're going
> to need to support separate files because I don't think we want ones
> adding custom properties here. This would fail unless we add every
> compatible here. We could also be a bit more exact as to which
> properties below apply (e.g. linux,.*-default is only valid for
> shared-dma-pool).

I'm not entirely sure how we can just ignore the vendor compatibles
without raising a warning. Do you have any suggestion?

Thanks!
Maxime
--n7nlrbexrimtktxt--
