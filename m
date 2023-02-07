From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH RFC 0/3] dt-bindings: net: Add network-class.yaml schema
Date: Tue, 7 Feb 2023 02:34:41 +0100
Message-ID: <Y+GqsTLXRKyg0BdV@lunn.ch>
References: <20230203-dt-bindings-network-class-v1-0-452e0375200d@jannau.net>
 <CAL_JsqKD7gD86_B93M19rBCWn+rmSw24vOGEhqi9Nvne1Xixwg@mail.gmail.com>
 <20230206163154.GA9004@jannau.net>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=tZWkCJrGrg0CgOQ/KDtg58bqJacvpTUQpLyNlTnrySs=; b=duOAIAbGYd5mxT4ixKQCZRLbCb
        lrCA8ogNU46SpMPvMKMnuwUEopuVnJRdNEBeZV7nE3qTWsp0fkNpRqwolaN8Rl5FCc+Zo9t0QFUz8
        f2vDD42t06VYQ7XoBg17UtNGokleyafXrAkg6OoEiTGIP+sJPg39KOTKxhet7pd52fOM=;
Content-Disposition: inline
In-Reply-To: <20230206163154.GA9004-w2YMFpIX6D+sTnJN9+BGXg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> > > I've ignored "max-frame-size" since the description in
> > > ethernet-controller.yaml claims there is a contradiction in the
> > > Devicetree specification. I suppose it is describing the property
> > > "max-frame-size" with "Specifies maximum packet length ...".
> > 
> > Please include it and we'll fix the spec. It is clearly wrong. 2 nios
> > boards use 1518 and the consumer for them says it is MTU. Everything
> > else clearly uses mtu with 1500 or 9000.
> 
> Ok, the example in the pdf is 'max-frame-size = <1518>;'. I'll include 
> it with the description of ethernet-controller.yaml which specifies it 
> as MTU.

You need to be careful here. Frame and MTU are different things.

The IEEE 802.3 standard says nothing about MTU. I believe MTU is an IP
concept. It is the size of the SDU an Ethernet PDU can carry. This is
typically 1500.

Historically, the max Ethernet frame size was 1518. But with 802.1Q
which added the VLAN header, all modern hardware actual uses 1522 to
accommodate the extra 4 bytes VLAN header. So i would not actually put
max-frame-size = <1518> anywhere, because it will get copy/pasted and
break VLAN setups.

It looks like the ibm,emac.txt makes this error, max-frame-size =
<5dc>; 0x5dc is 1500. And there are a few powerpc .dtc using
1500/0x5dc, which are probably broken.

      Andrew
