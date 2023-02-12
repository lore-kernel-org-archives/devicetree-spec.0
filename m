From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: net: Add network-class schema for
 mac-address properties
Date: Sun, 12 Feb 2023 16:39:26 +0100
Message-ID: <Y+kILknqMmR6+GXO@lunn.ch>
References: <20230203-dt-bindings-network-class-v2-0-499686795073@jannau.net>
 <20230203-dt-bindings-network-class-v2-1-499686795073@jannau.net>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=6O+UuieJiqrqN8b+Jb4GL1MHOB3Fu+wejYkm3MKiKZs=; b=zVqRPIHa7Fd8aBKSeDGdpJrwuU
        nnpM2/LLxyc0jo150A976XoGkGIxo/Uf0HLi4TmqXPAIgnmkxe9ElLSPRjfuwbTF0dJPRAv7Ypvm4
        hktdh6pFGaDcHi1g6EYBPP0IV1BSyvZ74CW4F2SYfyEC2Iz/PlMxUecV2fM9AZype0fo=;
Content-Disposition: inline
In-Reply-To: <20230203-dt-bindings-network-class-v2-1-499686795073-w2YMFpIX6D+sTnJN9+BGXg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Janne Grunau <j@jannau.net>
Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Chee Nouk Phoon <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> +  max-frame-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Maximum transfer unit (IEEE defined MTU).

Do you have a reference you can include here to a clause in an IEEE
802 document? We need this unambiguously defined otherwise more DT
blobs are going to use the wrong value.

      Andrew
