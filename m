From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] schemas: chosen: Add 'boot-hart-id' property
Date: Tue, 3 Jan 2023 09:22:12 -0600
Message-ID: <CAL_JsqLaSS=TG23Xh1gPR1ooGBmAgia1c-p7JtAdvsUZskiqNw@mail.gmail.com>
References: <20230103032522.36353-1-weiliang.lim@starfivetech.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672759344;
        bh=/T0M1+mXRHAojOE79FnaGmVvwXNF4ZcKSs/WkKRJ5SY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=StzoudLfLNkzQD1wPE55ijmTWucUbLApFZmrGgUyGQpoIHILLC3VoDNbxC3mTX7t9
         ztTF0sR+LpROXXex8O3DmJXzHmjd76x0kjZ3LETPOp94uKb/HyaSxtVi51kEsRPjDv
         9Atz3VRaqxZgTWlRkZGZV8c7HzqfIVX4Opq1OXkFqBRE7J97t3tK+kF3k4uRGSwhFR
         SvUzzfwZ801Y+1BaA/Dtd5NzwXTJe0RGrWd5eENH6VTMw4ivQI8dtcRhqMgUTyABUB
         oTT8USvnE3WmEnmTDFL8yzmLirVX9JBzid1dsVoGom6VxSGNjhS8u9CK4vzSbJyQ+K
         Wg0V9Hxqs5ckA==
In-Reply-To: <20230103032522.36353-1-weiliang.lim-bONrM45KWFOXmMXjJBpWqg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Liang Lim <weiliang.lim-bONrM45KWFOXmMXjJBpWqg@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cheehong.ang-bONrM45KWFOXmMXjJBpWqg@public.gmane.org, junliang.tan-bONrM45KWFOXmMXjJBpWqg@public.gmane.org

On Mon, Jan 2, 2023 at 9:25 PM Wei Liang Lim
<weiliang.lim-bONrM45KWFOXmMXjJBpWqg@public.gmane.org> wrote:
>
> Add 'boot-hart-id' property to allow user to specify preferred cold boot HART in OpenSBI for StarFive JH7110 platform.

The commit message should answer why is this needed, not what is the
change. Present the problem you are trying to solve with this change,
not just the solution you came up with.

> Signed-off-by: Wei Liang Lim <weiliang.lim-bONrM45KWFOXmMXjJBpWqg@public.gmane.org>
> Reviewed-by: Chee Hong Ang <cheehong.ang-bONrM45KWFOXmMXjJBpWqg@public.gmane.org>
> Reviewed-by: Jun Liang Tan <junliang.tan-bONrM45KWFOXmMXjJBpWqg@public.gmane.org>
> ---
>  dtschema/schemas/chosen.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
> index 86194dd..f88feb5 100644
> --- a/dtschema/schemas/chosen.yaml
> +++ b/dtschema/schemas/chosen.yaml
> @@ -31,6 +31,19 @@ properties:
>
>    bootargs:
>      $ref: types.yaml#/definitions/string
> +
> +   boot-hart-id:
> +    type: integer

Never the right type for a property.

> +    description:
> +      This property allows user to specify preferred cold boot HART in OpenSBI
> +      for StarFive JH7110 platform. If unspecified, the existing lottery mechanism

Specific to StarFive JH7110?

A HART in DT terms is just a CPU, so I think whatever we have should
be generic. Possibly other arches could use this.

Who consumes this? /chosen is consumed by the OS. When you boot into
the OS, you already know the boot CPU because it is the one you are
running on. So this is meant to be consumed by OpenSBI firmware?

Also, read how 'status' is supposed to work for CPUs in the DT spec.
That didn't get followed for Arm, but could possibly work here. The DT
passed to OpenSBI has all but the boot CPU disabled and OpenSBI can
enable the other CPUs. Just guessing since you've given no details of
the problem this solves...

> +      will be used. e.g.
> +
> +      /{
> +              chosen {
> +                      boot-hart-id = <1>;
> +              };
> +      };

Drop the example.

>
>    kaslr-seed:
>      $ref: types.yaml#/definitions/uint64
> --
> 2.25.1
>
