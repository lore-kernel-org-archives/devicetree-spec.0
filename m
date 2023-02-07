From: Janne Grunau <j@jannau.net>
Subject: Re: [PATCH RFC 0/3] dt-bindings: net: Add network-class.yaml schema
Date: Tue, 7 Feb 2023 08:10:09 +0100
Message-ID: <20230207071009.GB9004@jannau.net>
References: <20230203-dt-bindings-network-class-v1-0-452e0375200d@jannau.net>
 <CAL_JsqKD7gD86_B93M19rBCWn+rmSw24vOGEhqi9Nvne1Xixwg@mail.gmail.com>
 <20230206163154.GA9004@jannau.net>
 <Y+GqsTLXRKyg0BdV@lunn.ch>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Y+GqsTLXRKyg0BdV-g2DYL2Zd6BY@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 2023-02-07 02:34:41 +0100, Andrew Lunn wrote:
> > > > I've ignored "max-frame-size" since the description in
> > > > ethernet-controller.yaml claims there is a contradiction in the
> > > > Devicetree specification. I suppose it is describing the property
> > > > "max-frame-size" with "Specifies maximum packet length ...".
> > > 
> > > Please include it and we'll fix the spec. It is clearly wrong. 2 nios
> > > boards use 1518 and the consumer for them says it is MTU. Everything
> > > else clearly uses mtu with 1500 or 9000.
> > 
> > Ok, the example in the pdf is 'max-frame-size = <1518>;'. I'll include 
> > it with the description of ethernet-controller.yaml which specifies it 
> > as MTU.
> 
> You need to be careful here. Frame and MTU are different things.

yes, we are aware. The description in of the property in
Documentation/devicetree/bindings/net/ethernet-controller.yaml is:

| Maximum transfer unit (IEEE defined MTU), rather than the
| maximum frame size (there\'s contradiction in the Devicetree
| Specification).

The description for the property in the Devicetree is:

| Specifies maximum packet length in bytes that the physical interface
| can send and receive.

While the "packet length" in the description is a little confusing this 
seems to refer to the ethernet frame size.

> The IEEE 802.3 standard says nothing about MTU. I believe MTU is an IP
> concept. It is the size of the SDU an Ethernet PDU can carry. This is
> typically 1500.
> 
> Historically, the max Ethernet frame size was 1518. But with 802.1Q
> which added the VLAN header, all modern hardware actual uses 1522 to
> accommodate the extra 4 bytes VLAN header. So i would not actually put
> max-frame-size = <1518> anywhere, because it will get copy/pasted and
> break VLAN setups.
> 
> It looks like the ibm,emac.txt makes this error, max-frame-size =
> <5dc>; 0x5dc is 1500. And there are a few powerpc .dtc using
> 1500/0x5dc, which are probably broken.

I would not say it is an error. The specification/name and use of 
"max-frame-size" has clearly diverged. All 4 in-tree users of this 
property interpret it as MTU. With the exception of the 2 nios2 boards 
Rob found all device trees use either 1500, 3800 or 9000 as 
'max-frame-size'.

I think Rob's plan to deal with this conflict between specification and 
actual use is to accept the use and update the description in the 
specification. This results in a "max-frame-size" property which 
describes the maximal payload / MTU. The upside of this is that we can 
leave all devicetrees and drivers unchanged and avoid breaking 
out-of-tree users.

I'll fix the 2 nios2 boards since those currently end up with a MTU of 
1518 in altera_tse_main.c.

Janne
