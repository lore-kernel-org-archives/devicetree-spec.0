From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v2 0/4] dt-bindings: net: Add network-class.yaml schema
Date: Mon, 20 Feb 2023 11:40:16 -0800
Message-ID: <20230220114016.71628270@kernel.org>
References: <20230203-dt-bindings-network-class-v2-0-499686795073@jannau.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676922018;
        bh=YJ5kJ4vkFCQ16X2IONf54Y/l4uUJnjGgf7NKBiwI380=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CbiGJ6GDUR7jHG+eDUsEysOa1xu+B6zcw17RR0JddkMTyYFPzkS/6OswFPKcTEK/w
         YZqxlMHSs9X5x0x2lW+BUqxt6VvELOZa4bbt6tNVZa7d0DFEhFRzyNLT2614LzMi/H
         dKfv8VTq/gA3kFyxlU7y2wHm3IML197ebqln04pD7e1U98F5tPtKWd+pxYFnf283bG
         v8iAdnsTf+Ho6/jQjHKCVUYTb1/xz79GCGO/B3EH+cwfuM6C4Jo1LgGBtFKWUG6oRC
         1pQUmAbMn5htEauAZxFph6kwtpxDsfriDHTDF76ShoIEtCagODtXjn8oaWY0IUnmIm
         SakJHejm7u1ug==
In-Reply-To: <20230203-dt-bindings-network-class-v2-0-499686795073@jannau.net>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Janne Grunau <j@jannau.net>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mailing List <devicetree-spec@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>, van Spriel <arend@broadcom.com>, =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>, Dinh Nguyen <dinguyen@kernel.org>, Ley Foon Tan <lftan@altera.com>, Chee Nouk Phoon <cnphoon@altera.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org

On Sun, 12 Feb 2023 13:16:28 +0100 Janne Grunau wrote:
> The Devicetree Specification, Release v0.3 specifies in section 4.3.1
> a "Network Class Binding". This covers MAC address and maximal frame
> size properties. "local-mac-address" and "mac-address" with a fixed
> "address-size" of 48 bits are already in the ethernet-controller.yaml
> schema so move those over.
> 
> Keep "address-size" fixed to 48 bits as it's unclear if network protocols
> using 64-bit mac addresses like ZigBee, 6LoWPAN and others are relevant for
> this binding. This allows mac address array size validation for ethernet
> and wireless lan devices.
> 
> "max-frame-size" in the Devicetree Specification is written to cover the
> whole layer 2 ethernet frame but actual use for this property is the
> payload size. Keep the description from ethernet-controller.yaml which
> specifies the property as MTU.

Rob, Krzysztof - is this one on your todo list? It's been hanging
around in my queue, I'm worried I missed some related conversation.
