From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: wireless: bcm4329-fmac: Use
 network-class.yaml schema
Date: Sun, 12 Feb 2023 16:49:13 +0100
Message-ID: <Y+kKeTBw/Vmap0MH@lunn.ch>
References: <20230203-dt-bindings-network-class-v2-0-499686795073@jannau.net>
 <20230203-dt-bindings-network-class-v2-2-499686795073@jannau.net>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=4ENNKNgGMla2jgQ0hM3x3OTfeS7knIzg4lDu/hDJhGs=; b=pjaD8GgURVm2ZZeYXWXhmoy2N3
        PgbU+sjLUnirG2jKrbaQFSH451K0vx3vO8oAv1m4CJ1Sf4usvEi3CZcfPVXZuPIzW+7yLIMIcp2pe
        4/LfgR4XxkEcRUNhQwycLFHmE+QhcDQd3cako+wKpxYOGk79VKWGm3AcuJOxoD3gld6I=;
Content-Disposition: inline
In-Reply-To: <20230203-dt-bindings-network-class-v2-2-499686795073-w2YMFpIX6D+sTnJN9+BGXg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Janne Grunau <j@jannau.net>
Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Chee Nouk Phoon <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sun, Feb 12, 2023 at 01:16:30PM +0100, Janne Grunau wrote:
> The network-class schema specifies local-mac-address as used in the
> bcm4329-fmac device nodes of Apple silicon devices
> (arch/arm64/boot/dts/apple).
> Fixes `make dtbs_check` for those devices.

Maybe a more hierarchical approach would be better? Add a
wireless-controller.yaml which includes ieee80211.yaml and
network-class.yaml? It would then follow the structure of Ethernet
controllers, bluetooth controllers, and can controllers.

	Andrew
