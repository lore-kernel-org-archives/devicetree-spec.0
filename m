From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Add 'dma-noncoherent' property as a standard property
Date: Mon, 27 Jun 2022 09:14:45 -0600
Message-ID: <CAL_JsqK20v34ZFWzeicaVoDWmjAsBwPyc89kaV-26Se_1eKtmQ@mail.gmail.com>
References: <20220619203719.3604757-1-heiko@sntech.de>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656342897;
        bh=Q1dfsmzq4xpfXod//OPSwpQ3J/FZRZobYg30Cb42yPg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LvYlh4P1onPcTEQX/k1fvufhRlND4or+20CP1mgzt88DkJXBdHVLxB8Lx7ewq1+9P
         kla/JRy+ZmcXHx8HAtw3xtSYiCba4jPei6s/fjBh0af9zsLE1ZxDlmceq2IhlWSEZJ
         VqRocafmY/w6MEmSeAswYgX1K8eJA/32DeWvCDuNR2gHPsAzlMDsHwgFWh1t9zvUFI
         LJ20x1CfFnW9BYv08Lmyi/S5krhQcEd/BFyIZtjTyI4NO/88qxEiaGCSK+QXzu6AJP
         s48GQJcDahNBwUarmYsMfLvNDorpRSRjVppAwz4xFs5uxbQtmRaDrPHcdoh80dKHX3
         vcOO+J6QZljug==
In-Reply-To: <20220619203719.3604757-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

On Sun, Jun 19, 2022 at 2:37 PM Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
>
> Similar to the 'dma-coherent' property, some architectures may be coherent
> by default with some devices being non-coherent. Add a property for this
> case tool.

Looks fine, but I also need a schema.

Yeah, that's redundant unfortunately. Maybe someday someone will care
enough to generate the spec from the schemas.

>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
> Companion patch to RISC-V Zicbom noncoherent dma support
> https://lore.kernel.org/linux-riscv/20220619203212.3604485-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org/
>
>  source/chapter2-devicetree-basics.rst | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devicetree-basics.rst
> index 47d2fad..bdd7b9f 100644
> --- a/source/chapter2-devicetree-basics.rst
> +++ b/source/chapter2-devicetree-basics.rst
> @@ -832,6 +832,19 @@ Description:
>     coherent DMA operations. Some architectures have coherent DMA by default
>     and this property is not applicable.
>
> +dma-noncoherent
> +~~~~~~~~~~~~
> +
> +Property name: ``dma-noncoherent``
> +
> +Value type: ``<empty>``
> +
> +Description:
> +   For architectures which are by default coherent for I/O, the
> +   *dma-noncoherent* property is used to indicate a device is not capable of
> +   coherent DMA operations. Some architectures have non-coherent DMA by
> +   default and this property is not applicable.
> +
>  name (deprecated)
>  ~~~~~~~~~~~~~~~~~
>
> --
> 2.35.1
>
