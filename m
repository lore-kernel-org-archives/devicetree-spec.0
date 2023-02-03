From: Krzysztof Kozlowski <krzysztof.kozlowski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC 1/3] dt-bindings: net: Add network-class schema for
 mac-address properties
Date: Fri, 3 Feb 2023 22:08:38 +0100
Message-ID: <5651774d-3f60-ebb1-0613-83917d8c4bd9@linaro.org>
References: <20230203-dt-bindings-network-class-v1-0-452e0375200d@jannau.net>
 <20230203-dt-bindings-network-class-v1-1-452e0375200d@jannau.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y2BiUcMD8Gl7xNduYrxgFh6P8/MvqGGdxXMYMad5DGg=;
        b=bAoCPRbAJBt+JF6p7NKN9nUbWJCzl9JgjlWwo4oWw0i1RxjTM5Xyd3hBMM4yK0bc1l
         sY9jd40kD0RQ8Zc9pcOCO63jt9iGEOwdzupNjIcDIjKO0HUTpuJtrF0AS5BMKq6thQjC
         xpJNWW49e1Cn9xfM4deqkZhVxJAcSsc2HaWIIxY54hveHg4XwKYLUU1ZTMkdxb4qWrdU
         +RnduDoAsaACX2CEJZaGjADO2ziICn4ZWlPKpvGSWLZ4BGDo+x4uF6muKL7dPTXzIpLT
         wGQRKyV4B5lNBKZF//ENrSNvuaKUPCfnHIrR51Yox+KHXIZqco/qTahBtFps/LzFulf9
         ooOA==
Content-Language: en-US
In-Reply-To: <20230203-dt-bindings-network-class-v1-1-452e0375200d-w2YMFpIX6D+sTnJN9+BGXg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Janne Grunau <j@jannau.net>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 03/02/2023 14:56, Janne Grunau wrote:
> The ethernet-controller schema specifies "mac-address" and
> "local-mac-address" but other network devices such as wireless network
> adapters use mac addresses as well.
> The Devicetree Specification, Release v0.3 specifies in section 4.3.1
> a generic "Network Class Binding" with "address-bits", "mac-address",
> "local-mac-address" and "max-frame-size". This schema specifies the
> "address-bits" property and moves "local-mac-address" and "mac-address"
> over from ethernet-controller.yaml.
> The schema currently does not restrict MAC address size based on
> address-bits.

A nit below

>          phy-mode:
> diff --git a/Documentation/devicetree/bindings/net/network-class.yaml b/Documentation/devicetree/bindings/net/network-class.yaml
> new file mode 100644
> index 000000000000..676aec1c458e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/network-class.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/network-class.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Network Class Bindings

s/Bindings/Common Properties/
Best regards,
Krzysztof

