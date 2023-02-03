From: Janne Grunau <j@jannau.net>
Subject: [PATCH RFC 3/3] dt-bindings: wireless: silabs,wfx: Use
 network-class.yaml
Date: Fri, 03 Feb 2023 14:56:28 +0100
Message-ID: <20230203-dt-bindings-network-class-v1-3-452e0375200d@jannau.net>
References: <20230203-dt-bindings-network-class-v1-0-452e0375200d@jannau.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20230203-dt-bindings-network-class-v1-0-452e0375200d@jannau.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=j@jannau.net;
 h=from:subject:message-id; bh=ovshDuNDGC464wNETrmVoRhcUISyfcSallBxPCefdv4=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuS7QhOy9Zrt/ltu1Wy+49587t9Hpdrn/u5+ZZsyE67X3
 FhyVEe+o5SFQYyDQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwETMPzIybG6xaS/Y62gZKpC4
 6eA33uAl4alrQ7d4X9sXF+b0OnzRbkaGdz3PZutbz31cU/VTYf+bsFUht/az9jxa9zx2Qb/Nl4+
 9rAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mailing List <devicetree-spec@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>, van Spriel <arend@broadcom.com>, =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, Janne Grunau <j@jannau.net>

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
-
 required:
   - compatible
   - reg
 
 allOf:
+  - $ref: /schemas/net/network-class.yaml#
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 unevaluatedProperties: false

-- 
2.39.1

