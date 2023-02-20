From: Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/4] dt-bindings: net: Add network-class.yaml schema
Date: Mon, 20 Feb 2023 14:02:01 -0800
Message-ID: <20230220140201.20450889@kernel.org>
References: <20230203-dt-bindings-network-class-v2-0-499686795073@jannau.net>
        <20230220114016.71628270@kernel.org>
        <CAL_Jsq+2_gQzAjAZQVux1GOff5ocdSz5qQMhjRzvtyD+9C-TQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676930523;
        bh=fQRoiH/vfT+YhxHdQBo3IjRJtBv45VLnzgTpqQ2GMnY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ktZMNexkwbQT7SSP4qmLKo8Uvlirzq4lFcth9KK5SGKvDKCcvZDxPyAWicz0jb+qp
         2Xs1MYD2YHUHUvHDDxuYSrbKfvvz0baUTb/A51kevnKuvdUw/HMTT8UspZVONCOAEK
         M1vEVzt/sJ7RZ5/w/SEKo02Z9sdhqRT3C7TmNhWX6ScUwa/8+bPuva1AXSLLtb9YDl
         Zezp7qA6+jG2r2Ml1zOA6ENCb1Qe+T1yM80YYHmjnEVhdhypUJd+SzJkJThC8+qaBr
         KMxMrLjO51IH3JsJUtWJ2FKSTY0nglSR9vbNaVvvgjvk+lXVSBHFooFxgFrjEpQp4P
         qrI242eJkucqA==
In-Reply-To: <CAL_Jsq+2_gQzAjAZQVux1GOff5ocdSz5qQMhjRzvtyD+9C-TQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Janne Grunau <j@jannau.net>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Chee Nouk Phoon <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, 20 Feb 2023 15:49:44 -0600 Rob Herring wrote:
> > Rob, Krzysztof - is this one on your todo list? It's been hanging
> > around in my queue, I'm worried I missed some related conversation.  
> 
> Andrew suggested changes on 1 and 2 which seem reasonable to me.

Ah, thank you! I see them in lore but not in my MUA.
