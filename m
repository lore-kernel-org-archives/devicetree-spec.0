From: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/4] nios2: dts: Fix tse_mac "max-frame-size" property
Date: Thu, 16 Feb 2023 09:54:02 -0600
Message-ID: <c4ca87f9-6603-444c-f95d-deff8c8b36b0@kernel.org>
References: <20230203-dt-bindings-network-class-v2-0-499686795073@jannau.net>
 <20230203-dt-bindings-network-class-v2-4-499686795073@jannau.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676562845;
        bh=zpw4rUtbOctUQatpRCHmdOEHG4xfpTTWwocYPyMJoQs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Yo3T9rTzjPHT5JNP0yXY3jvF6d8pbQURi+Fzdtt6JbCxr7HdvE4gz9/jsPxrLjDYS
         qq2zaZRin40p9UQtlwPtezXCNJ8noVIqLtNS8PsvjNkwZqWBfxMnZLuaYhePyhCJpP
         cyfpHD2jqVW3ftNVpCSfmlsdPVez/RJkghqYgz867v7CoYog1xZSJ81tPWQnLrr3Nn
         IqjmuPjtz9P2KflZL45O8UwqlWoQAcgszzfaOhpsv0YPaWP+EhFJ9UF2a6OjI/mpqk
         NN+NUwngX/uErWDCoQbUlokIoAT9rpseEvHnI/yc+smKP3w0XVeiWURdgU2VxJXG1+
         EoOmjcn84mMuA==
Content-Language: en-US
In-Reply-To: <20230203-dt-bindings-network-class-v2-4-499686795073-w2YMFpIX6D+sTnJN9+BGXg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Janne Grunau <j@jannau.net>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Chee Nouk Phoon <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On 2/12/23 06:16, Janne Grunau wrote:
> The given value of 1518 seems to refer to the layer 2 ethernet frame
> size without 802.1Q tag. Actual use of the "max-frame-size" including in
> the consumer of the "altr,tse-1.0" compatible is the MTU.
> 
> Fixes: 95acd4c7b69c ("nios2: Device tree support")
> Fixes: 61c610ec61bb ("nios2: Add Max10 device tree")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>   arch/nios2/boot/dts/10m50_devboard.dts | 2 +-
>   arch/nios2/boot/dts/3c120_devboard.dts | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/nios2/boot/dts/10m50_devboard.dts b/arch/nios2/boot/dts/10m50_devboard.dts
> index 56339bef3247..0e7e5b0dd685 100644
> --- a/arch/nios2/boot/dts/10m50_devboard.dts
> +++ b/arch/nios2/boot/dts/10m50_devboard.dts
> @@ -97,7 +97,7 @@ rgmii_0_eth_tse_0: ethernet@400 {
>   			rx-fifo-depth = <8192>;
>   			tx-fifo-depth = <8192>;
>   			address-bits = <48>;
> -			max-frame-size = <1518>;
> +			max-frame-size = <1500>;
>   			local-mac-address = [00 00 00 00 00 00];
>   			altr,has-supplementary-unicast;
>   			altr,enable-sup-addr = <1>;
> diff --git a/arch/nios2/boot/dts/3c120_devboard.dts b/arch/nios2/boot/dts/3c120_devboard.dts
> index d10fb81686c7..3ee316906379 100644
> --- a/arch/nios2/boot/dts/3c120_devboard.dts
> +++ b/arch/nios2/boot/dts/3c120_devboard.dts
> @@ -106,7 +106,7 @@ tse_mac: ethernet@4000 {
>   				interrupt-names = "rx_irq", "tx_irq";
>   				rx-fifo-depth = <8192>;
>   				tx-fifo-depth = <8192>;
> -				max-frame-size = <1518>;
> +				max-frame-size = <1500>;
>   				local-mac-address = [ 00 00 00 00 00 00 ];
>   				phy-mode = "rgmii-id";
>   				phy-handle = <&phy0>;
> 

Applied!

Thanks,
Dinh
