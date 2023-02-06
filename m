From: Janne Grunau <j@jannau.net>
Subject: Re: [PATCH RFC 0/3] dt-bindings: net: Add network-class.yaml schema
Date: Mon, 6 Feb 2023 17:31:54 +0100
Message-ID: <20230206163154.GA9004@jannau.net>
References: <20230203-dt-bindings-network-class-v1-0-452e0375200d@jannau.net>
 <CAL_JsqKD7gD86_B93M19rBCWn+rmSw24vOGEhqi9Nvne1Xixwg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKD7gD86_B93M19rBCWn+rmSw24vOGEhqi9Nvne1Xixwg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 2023-02-03 08:41:28 -0600, Rob Herring wrote:
> On Fri, Feb 3, 2023 at 7:56 AM Janne Grunau <j@jannau.net> wrote:
> >
> > The Devicetree Specification, Release v0.3 specifies in section 4.3.1
> > a "Network Class Binding". This covers MAC address and maximal frame
> > size properties. "local-mac-address" and "mac-address" with a fixed
> > address-size of 48 bits is already in the ethernet-controller.yaml
> > schema so move those over.
> > I think the only commonly used values for address-size are 48 and 64
> > bits (EUI-48 and EUI-64). Unfortunately I was not able to restrict the
> > mac-address size based on the address-size. This seems to be an side
> > effect of the array definition and I was not able to restrict "minItems"
> > or "maxItems" based on the address-size value in an "if"-"then"-"else"
> > block.
> > An easy way out would be to restrict address-size to 48-bits for now.
> 
> I've never seen 64-bits used...

ZigBee and 6LoWPAN use 64-bits for example. Let's hardcode 48 bits for 
now as that's what all in-tree devicetrees implicitly use. If needed it 
can be changed later.

> > I've ignored "max-frame-size" since the description in
> > ethernet-controller.yaml claims there is a contradiction in the
> > Devicetree specification. I suppose it is describing the property
> > "max-frame-size" with "Specifies maximum packet length ...".
> 
> Please include it and we'll fix the spec. It is clearly wrong. 2 nios
> boards use 1518 and the consumer for them says it is MTU. Everything
> else clearly uses mtu with 1500 or 9000.

Ok, the example in the pdf is 'max-frame-size = <1518>;'. I'll include 
it with the description of ethernet-controller.yaml which specifies it 
as MTU.

Janne
