From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] schemas: pci-bus: make reg optional for Marvell PCI controllers
Date: Mon, 29 Aug 2022 15:48:34 -0500
Message-ID: <CAL_JsqL94_wp13DdZ_jVOU-AFt1mJ_ZL-eVnrDWMvY0qBxeybw@mail.gmail.com>
References: <20220823200033.3428436-1-andrew@lunn.ch>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661806127;
        bh=nN56nUu5rPlarBKgFpY5WcorPRIEbleLQTV+QvJTAn0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NMAsbNNxqegpYkA7fwXTJcvafG9/RCR8kGHyMoa82o+NYknRReGWof7bozqPYZpgT
         XybG3D60Isf2YlAx+XQ6pyHHy8zvcz+60+HJhAOzBjBnlDoJDGCXGWbmEUYwwzGkO3
         LhBDJaygNukjNzGeYJGzJeIbjxOD2gGY0zEiXCaZjC+r5Djek3S1yzUns8uvplfzHH
         BhhPLWy4o5UZ90SWQVfv+dsWLKePpvdzNqU+rTJx86qeMat1IOkjxL7SbROcuG3QnT
         8kbOMxhYMsKpILD+ec4As1xaX81ScsbHk19S89xX2uvEbTX8FEKcZl2K8hCER4phy0
         eCThxxSBTU4yg==
In-Reply-To: <20220823200033.3428436-1-andrew-g2DYL2Zd6BY@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Aug 23, 2022 at 3:00 PM Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
>
> Marvell devices have PCE endpoints, but no PCI controller. The driver
> provides an emulated PCI controller. As such, it does not have a reg
> property.
>
> Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> ---
>
> I've not posted the conversion of the Marvell PCI driver from .txt to
> .yaml yet. When i do, i will need something like this.
>
> dtschema/schemas/pci/pci-bus.yaml | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/dtschema/schemas/pci/pci-bus.yaml b/dtschema/schemas/pci/pci-bus.yaml
> index 31bc1b9..0481bf6 100644
> --- a/dtschema/schemas/pci/pci-bus.yaml
> +++ b/dtschema/schemas/pci/pci-bus.yaml
> @@ -178,10 +178,23 @@ patternProperties:
>  required:
>    - device_type
>    - ranges
> -  - reg
>    - "#address-cells"
>    - "#size-cells"
>
> +if:
> +  not:
> +    properties:
> +      compatible:

This will also be true if compatible is not present which makes the 'if' false.

I think I'd just skip all this and just drop reg as required. There's
pending work to split pci-bus.yaml into host bridge,PCI-to-PCI bridge,
and PCI device schemas, so we can make it required for PCI devices and
bridges, but not host bridges which I think would work for you.

> +        contains:
> +          enum:
> +            - marvell,armada-370-pcie
> +            - marvell,armada-xp-pcie
> +            - marvell,dove-pcie
> +            - marvell,kirkwood-pcie
> +then:
> +  required:
> +    - reg
> +
>  dependentRequired:
>    msi-map-mask: [ msi-map ]
>
> --
> 2.37.2
>
