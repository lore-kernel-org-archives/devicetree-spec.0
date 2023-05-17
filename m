From: Konrad Dybcio <konrad.dybcio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] of: reserved_mem: Implement
 alloc-{bottom-up,top-down}
Date: Wed, 17 May 2023 21:28:24 +0200
Message-ID: <15df78fc-c35b-aae0-fd64-917c9882c815@linaro.org>
References: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed@gerhold.net>
 <20230510-dt-resv-bottom-up-v1-2-3bf68873dbed@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684351706; x=1686943706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AoCBXCVisneTJ/xKyGw/fzqU76GzvlUnibRbCGUPltc=;
        b=yFJ3jImtIluIRduy/GMhEyappIoBnHVZuVVSjpeXSPp9AXhSb9p40kyjEnIPnc7OBW
         OUUqzaYv4WCJ2o7nYWBOd1pZifrcjwb6w7JhND8HhAX4DdNm88gWwbHoTwYH7bnDZott
         g0Sw0qXOY4XQTPavkPeGUcgNF4d4XomEUAb4x9SU++2a+qMPMlfBl3p+EN5Ytjlj7/U4
         cYe/WnzkQEAZaZYYw2lGBup40s5kdfiLeUVJQWZ/T5xzgxGKT9yumt7wDHyrXAzqu+P9
         HXfdNoJnJFyq8Sy99wCs0/+SonCRzP+JpZwLwFyNcHWsVzm6C9P4PDycucwhPkVmCzDO
         d8yQ==
Content-Language: en-US
In-Reply-To: <20230510-dt-resv-bottom-up-v1-2-3bf68873dbed-3XONVrnlUWDR7s880joybQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On 15.05.2023 12:12, Stephan Gerhold wrote:
> Use memblock_set_bottom_up() to specify an explicit allocation order for
> dynamic reservations with "alloc-ranges". Since the default value varies
> between architectures the previous value is saved and restored after
> trying the allocations.
> 
> If neither alloc-bottom-up or alloc-top-down are specified the previous
> implementation-defined allocation order is preserved.
> 
> Signed-off-by: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Konrad
>  drivers/of/of_reserved_mem.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 948efa9f99e3..6443140deacf 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -89,7 +89,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
>  	phys_addr_t base = 0, align = 0, size;
>  	int len;
>  	const __be32 *prop;
> -	bool nomap;
> +	bool nomap, prev_bottom_up;
>  	int ret;
>  
>  	prop = of_get_flat_dt_prop(node, "size", &len);
> @@ -130,6 +130,12 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
>  			return -EINVAL;
>  		}
>  
> +		prev_bottom_up = memblock_bottom_up();
> +		if (of_get_flat_dt_prop(node, "alloc-bottom-up", NULL))
> +			memblock_set_bottom_up(true);
> +		if (of_get_flat_dt_prop(node, "alloc-top-down", NULL))
> +			memblock_set_bottom_up(false);
> +
>  		base = 0;
>  
>  		while (len > 0) {
> @@ -148,6 +154,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
>  			len -= t_len;
>  		}
>  
> +		memblock_set_bottom_up(prev_bottom_up);
>  	} else {
>  		ret = early_init_dt_alloc_reserved_memory_arch(size, align,
>  							0, 0, nomap, &base);
> 
