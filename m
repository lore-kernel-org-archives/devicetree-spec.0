From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC 0/3] dt-bindings: net: Add network-class.yaml schema
Date: Fri, 3 Feb 2023 08:41:28 -0600
Message-ID: <CAL_JsqKD7gD86_B93M19rBCWn+rmSw24vOGEhqi9Nvne1Xixwg@mail.gmail.com>
References: <20230203-dt-bindings-network-class-v1-0-452e0375200d@jannau.net>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675435301;
        bh=aSsCAsgpLn8Nh2RoLgCu1FwifDval96mr38LdqDofP4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lQARH19+JJc/qQ657fHWRjoOsZ7uM7xGiTACSr4Z7TpaOID0SQHPeDW1QSfCSSE+y
         a7bvfj0+8l0DsbwuGhkXfD6tLSaqmaapz01S1pmZeBEzDTxoLUaWXrDIoLXfSjBN1u
         SEInskwTuXKoSXMlk5EkrMREPMPc0BkoN/609UxQYw4JQaBy/5+J3AlbBZWXlrBq9v
         MaDKx8xxgipmb23CH6Qp5lITlrfLoMdfZ3hrxaWijHjU/N6z+E+oqrrRXDBazAvz5s
         HYsR/VzG4OSByOG/aDq9RSIKohWhmqU2Lhsv08cHrA6ll/XsfyGCdukZmgZlOK+0ZA
         9NNAmk+GRo9Fw==
In-Reply-To: <20230203-dt-bindings-network-class-v1-0-452e0375200d-w2YMFpIX6D+sTnJN9+BGXg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Janne Grunau <j@jannau.net>
Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, Feb 3, 2023 at 7:56 AM Janne Grunau <j@jannau.net> wrote:
>
> The Devicetree Specification, Release v0.3 specifies in section 4.3.1
> a "Network Class Binding". This covers MAC address and maximal frame
> size properties. "local-mac-address" and "mac-address" with a fixed
> address-size of 48 bits is already in the ethernet-controller.yaml
> schema so move those over.
> I think the only commonly used values for address-size are 48 and 64
> bits (EUI-48 and EUI-64). Unfortunately I was not able to restrict the
> mac-address size based on the address-size. This seems to be an side
> effect of the array definition and I was not able to restrict "minItems"
> or "maxItems" based on the address-size value in an "if"-"then"-"else"
> block.
> An easy way out would be to restrict address-size to 48-bits for now.

I've never seen 64-bits used...

> I've ignored "max-frame-size" since the description in
> ethernet-controller.yaml claims there is a contradiction in the
> Devicetree specification. I suppose it is describing the property
> "max-frame-size" with "Specifies maximum packet length ...".

Please include it and we'll fix the spec. It is clearly wrong. 2 nios
boards use 1518 and the consumer for them says it is MTU. Everything
else clearly uses mtu with 1500 or 9000.

> My understanding from the dt-schema README is that network-class.yaml
> should live in the dt-schema repository since it describes properties
> from the Devicetree specification. How is the synchronization handled in
> this case? The motivation for this series is to fix dtbs_check failures
> for Apple silicon devices both in the tree and upcoming ones.

Let's add it to the kernel, then later we can copy it to dtschema,
bump the minimum version the kernel requires, and delete the kernel
copy.

Rob
