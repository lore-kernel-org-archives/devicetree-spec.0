From: Janne Grunau <j@jannau.net>
Subject: [PATCH v2 2/4] dt-bindings: wireless: bcm4329-fmac: Use
 network-class.yaml schema
Date: Sun, 12 Feb 2023 13:16:30 +0100
Message-ID: <20230203-dt-bindings-network-class-v2-2-499686795073@jannau.net>
References: <20230203-dt-bindings-network-class-v2-0-499686795073@jannau.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20230203-dt-bindings-network-class-v2-0-499686795073-w2YMFpIX6D+sTnJN9+BGXg@public.gmane.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073; i=j@jannau.net;
 h=from:subject:message-id; bh=hIczjgZ3j0WKhMWdXkOeVhlbmC36N4y+R9jOPHgn32g=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuQXN+Yx/fzayzud8evC3W8fuis3KKU49Tg9/vVV/pptq
 X5J9FSXjlIWBjEOBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABMxM2VkOPZhQn/eIfUDBsd9
 fS24jTMEz9/z75X7+ML73IGrjqnKDxj+e67+LX7itQnH3027Dyxiu/o1pffS6+yuaaFrHzKoxPL
 xMAMA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Chee Nouk Phoon <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Janne Grunau <j@jannau.net>

The network-class schema specifies local-mac-address as used in the
bcm4329-fmac device nodes of Apple silicon devices
(arch/arm64/boot/dts/apple).
Fixes `make dtbs_check` for those devices.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
index fec1cc9b9a08..55b0a21acb96 100644
--- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
@@ -116,11 +116,14 @@ properties:
       NVRAM. This would normally be filled in by the bootloader from platform
       configuration data.
 
+allOf:
+  - $ref: /schemas/net/network-class.yaml#
+
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.39.1

