From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/4] dt-bindings: net: Add network-class.yaml schema
Date: Mon, 20 Feb 2023 15:49:44 -0600
Message-ID: <CAL_Jsq+2_gQzAjAZQVux1GOff5ocdSz5qQMhjRzvtyD+9C-TQQ@mail.gmail.com>
References: <20230203-dt-bindings-network-class-v2-0-499686795073@jannau.net> <20230220114016.71628270@kernel.org>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676929798;
        bh=jynWOqndAYviDgNMr9Apo3QCedjur8URGys30KxSl6U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KYg/8Q0W0WpxC/zGOt1U3KVF/UKoNdSu42UHUqTyl6P0p35XUES19jLknCCdbwJmP
         l1XPM6bySbGP3tVO9gTQUf5yvrFwC1ui5LS/Anu8LwLaihr8N4wiSws28yZbKWxIr5
         +XPnGEVFFFHwis1ZxGddz4NCpQg4CsMW7vXzBUgeTVt0Qo8AFJGZdQ2Pe1zIYerA5X
         L3kOzQB0niYK1e+yCU+ZEFgBncO1SNMi/f5Rox+cUH0yCqCUQfehHR/6p0bKpLrjYe
         mTO02q4yFdd7L1JzXeBnIYkrbPQOUF/5auzqw21QFw0REgOi4OC0ENOn+iz/vdM5rK
         s0PadLj6PHIgQ==
In-Reply-To: <20230220114016.71628270-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Janne Grunau <j@jannau.net>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Chee Nouk Phoon <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, Feb 20, 2023 at 1:40 PM Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Sun, 12 Feb 2023 13:16:28 +0100 Janne Grunau wrote:
> > The Devicetree Specification, Release v0.3 specifies in section 4.3.1
> > a "Network Class Binding". This covers MAC address and maximal frame
> > size properties. "local-mac-address" and "mac-address" with a fixed
> > "address-size" of 48 bits are already in the ethernet-controller.yaml
> > schema so move those over.
> >
> > Keep "address-size" fixed to 48 bits as it's unclear if network protocols
> > using 64-bit mac addresses like ZigBee, 6LoWPAN and others are relevant for
> > this binding. This allows mac address array size validation for ethernet
> > and wireless lan devices.
> >
> > "max-frame-size" in the Devicetree Specification is written to cover the
> > whole layer 2 ethernet frame but actual use for this property is the
> > payload size. Keep the description from ethernet-controller.yaml which
> > specifies the property as MTU.
>
> Rob, Krzysztof - is this one on your todo list? It's been hanging
> around in my queue, I'm worried I missed some related conversation.

Andrew suggested changes on 1 and 2 which seem reasonable to me.

Rob
