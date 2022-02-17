From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: reserved-memory: Add restricted-dma-pool constraints
Date: Thu, 17 Feb 2022 10:05:01 -0600
Message-ID: <CAL_JsqJh26LGyBH34y+68Jq0+NZEm86UfD4-u548YNz=AVYeug@mail.gmail.com>
References: <79d1914ff04b44c3005072a990d14291c9ce6fce.1645103404.git.robin.murphy@arm.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645113914;
        bh=yp2JQQXfSK5ZExa14gRUlnqou0FVYVOfRdER3CmgX9Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ns8uX2PrAj2p4PlfiTl9IoegTE/0y7G/yYzXOfWtb3M4yBCby0PNYXK2zGlQvHYyP
         2UC2+sdgEpf0QWhETWD1YG2/sOOSr3Td1JyPaczOM0Q+TxMDtb7mgFK79l1zoDPsZP
         /XPDAsZnW8TsZAfEaUvb7ng9RIwv3QtZFyDzNB95uFdHYd0Pa0nUipyiNuSgIKRydg
         46nNPicu1rdcyLucpmMdDHHdjrB0+qAeuJgw2pNxch2nAgPyDLjeouWdU+VEA9x4Fb
         Q/6nz7skQYghecPuI6x4MQVv6Xq3NlUTOJ75ozZ1FWvE85zDI6yxoGjJzbH3SxI2kw
         zyCJi5+p91Qzg==
In-Reply-To: <79d1914ff04b44c3005072a990d14291c9ce6fce.1645103404.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Feb 17, 2022 at 7:10 AM Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> wrote:
>
> The "restricted-dma-pool" definition prohibits combination with either
> of the "no-map" and "reusable" properties, but this is only stated in
> the description text. Add those constraints to the schema so we can
> properly validate them.
>
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> ---
>  .../bindings/reserved-memory/shared-dma-pool.yaml   | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
> index a4bf757d6881..01385581f663 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
> +++ b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
> @@ -56,6 +56,19 @@ properties:
>        If this property is present, then Linux will use the region for
>        the default pool of the consistent DMA allocator.
>
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: restricted-dma-pool
> +then:
> +  not:
> +    anyOf:
> +      - required:
> +          - no-map
> +      - required:
> +          - reusable

I think it is a bit clearer to disallow properties like this:

then:
  properties:
    no-map: false
    reusable: false


> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.28.0.dirty
>
