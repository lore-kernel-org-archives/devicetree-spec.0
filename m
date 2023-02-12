From: Janne Grunau <j@jannau.net>
Subject: [PATCH v2 3/4] dt-bindings: wireless: silabs,wfx: Use
 network-class.yaml
Date: Sun, 12 Feb 2023 13:16:31 +0100
Message-ID: <20230203-dt-bindings-network-class-v2-3-499686795073@jannau.net>
References: <20230203-dt-bindings-network-class-v2-0-499686795073@jannau.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20230203-dt-bindings-network-class-v2-0-499686795073-w2YMFpIX6D+sTnJN9+BGXg@public.gmane.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=j@jannau.net;
 h=from:subject:message-id; bh=ovshDuNDGC464wNETrmVoRhcUISyfcSallBxPCefdv4=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuQXN+alx3CxLI9rfcnzdlVo2Kd/120/62z43rp4tvDjA
 9uXMd3i6ShlYRDjYJAVU2RJ0n7ZwbC6RjGm9kEYzBxWJpAhDFycAjCRKxcYGVo+Nn9T+74grP+U
 uoHg2Rdb37GsEXnLd2eN7dKEyIeLunUZ/in8fMH7j2dh5ZTtPd+P6uwXY5N/8N1Cu7LQfGfe9Lx
 9elwA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Chee Nouk Phoon <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Janne Grunau <j@jannau.net>

Instead listing local-mac-address and mac-address properties, reference
network-class.yaml schema. The schema brings in constraints for the
property checked during `make dtbs_check`.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/net/wireless/silabs,wfx.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/silabs,wfx.yaml b/Documentation/devicetree/bindings/net/wireless/silabs,wfx.yaml
index 583db5d42226..2ce50b57c096 100644
--- a/Documentation/devicetree/bindings/net/wireless/silabs,wfx.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/silabs,wfx.yaml
@@ -72,15 +72,12 @@ properties:
       "Platform Data Set" in Silabs jargon). Default depends of "compatible"
       string. For "silabs,wf200", the default is 'wf200.pds'.
 
-  local-mac-address: true
-
-  mac-address: true
