From: Janne Grunau <j@jannau.net>
Subject: [PATCH RFC 2/3] dt-bindings: wireless: bcm4329-fmac: Use
 network-class.yaml schema
Date: Fri, 03 Feb 2023 14:56:27 +0100
Message-ID: <20230203-dt-bindings-network-class-v1-2-452e0375200d@jannau.net>
References: <20230203-dt-bindings-network-class-v1-0-452e0375200d@jannau.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20230203-dt-bindings-network-class-v1-0-452e0375200d@jannau.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073; i=j@jannau.net;
 h=from:subject:message-id; bh=hIczjgZ3j0WKhMWdXkOeVhlbmC36N4y+R9jOPHgn32g=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuS7QhO4fPPWehkeKeScrxe+LtBjz/xSpw/ZS/7fyJIP6
 rNcGMndUcrCIMbBICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCJtBxkZWhfvzUtOlPz4+q9J
 sPry1dJtP3IE9N5Ilc+uuLbQ4BvnWqAKteccIQb28jst3shlHDpWfULjPjcvv/89fg9Hl97GH1w A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mailing List <devicetree-spec@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>, van Spriel <arend@broadcom.com>, =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, Janne Grunau <j@jannau.net>

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

