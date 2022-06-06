From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [dtschema PATCH] schemas: clock: Add example for 'clock-indices'
Date: Mon, 6 Jun 2022 15:04:45 -0500
Message-ID: <CAL_JsqK4Z0QBowJrFWbWPyfWZyxqNtDV7_QwfubNYCCuMPVkUQ@mail.gmail.com>
References: <20220428152719.2263164-1-robh@kernel.org>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654545897;
        bh=5aJVFO/sTJdAi2jLXXYvc/yW2UHoYPJFra6Dk2+5WnY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DoWVmVRitvCQobQsuicMy8434K/lq8spTm2sWnLfgdsHiJevDQ28W1DoCgKSob46v
         dw6X+QZDY/TbkLozRcaeTjqwluLR9kRbm/PWOFp7qau3Vev6o+g4BUppTjAS4rKA8m
         NHUoHhVvaNGazdIZVU7shHYqM9I/n+GDK/Nw7cBUFNJxGur/41BUJGHVfmKzzWbbwi
         sZpjlPocVIIfxvtF/E85c+OmxxZqEwxs7zSXLgzqmtxjwx13Nfi9XjtMmamIHfSrlc
         LRjvcxE8AneSuGu3SNi0idVNg6+CAyrNkESdBaDSY61oPKtGWHzrGiFL8H2xM9pJik
         ijGOCU7XVAjjA==
In-Reply-To: <20220428152719.2263164-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

On Thu, Apr 28, 2022 at 10:27 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> Add description for assigned-clocks properties from clock-binding.txt in
> the Linux kernel.
>
> This is relicensed from GPL-2.0 (the default) to BSD-2-Clause. The Cc list
> are the original authors.
>
> Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Please ack the license change.

Ben, need your ack on this please.

>
>  dtschema/schemas/clock/clock.yaml | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/dtschema/schemas/clock/clock.yaml b/dtschema/schemas/clock/clock.yaml
> index 5299653b80b6..433a858ef31e 100644
> --- a/dtschema/schemas/clock/clock.yaml
> +++ b/dtschema/schemas/clock/clock.yaml
> @@ -94,9 +94,21 @@ properties:
>
>    clock-indices:
>      $ref: "/schemas/types.yaml#/definitions/uint32-array"
> -    description: If the identifying number for the clocks in the node
> -      is not linear from zero, then this allows the mapping of identifiers
> -      into the clock-output-names array.
> +    description: |
> +      If the identifying number for the clocks in the node is not linear from
> +      zero, then this allows the mapping of identifiers into the
> +      clock-output-names array.
> +
> +      For example, if we have two clocks <&oscillator 1> and <&oscillator 3>:
> +
> +        oscillator {
> +            compatible = "myclocktype";
> +            #clock-cells = <1>;
> +            clock-indices = <1>, <3>;
> +            clock-output-names = "clka", "clkb";
> +        }
> +
> +      This ensures we do not have any empty strings in clock-output-names
>
>    # Consumer properties
>    clocks:
> --
> 2.34.1
>
