From: Janne Grunau <j@jannau.net>
Subject: [PATCH RFC 0/3] dt-bindings: net: Add network-class.yaml schema
Date: Fri, 03 Feb 2023 14:56:25 +0100
Message-ID: <20230203-dt-bindings-network-class-v1-0-452e0375200d@jannau.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135; i=j@jannau.net;
 h=from:subject:message-id; bh=OyjiYcL5gloli8dGEKyGMwu4GJoVIhGXxdEvMCrHIM8=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuS7QhOif7TdVFU9tO/djdrEmQq6x5wmCdx6MtPlFD/3a
 q9Vk4w0OkpZGMQ4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAEzkVD4jw7zZ86qao5f/2Lf/
 +/veuqt3f0qs45jLyL2+o/k/R6Lcp2iG/ynl5d1Vuh3rJnmf7eT5cb1W+b3WhXtZW6vbU2ZtlOY
 O4AEA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Janne Grunau <j@jannau.net>

The Devicetree Specification, Release v0.3 specifies in section 4.3.1
a "Network Class Binding". This covers MAC address and maximal frame
size properties. "local-mac-address" and "mac-address" with a fixed
address-size of 48 bits is already in the ethernet-controller.yaml
schema so move those over.
I think the only commonly used values for address-size are 48 and 64
bits (EUI-48 and EUI-64). Unfortunately I was not able to restrict the
mac-address size based on the address-size. This seems to be an side
effect of the array definition and I was not able to restrict "minItems"
or "maxItems" based on the address-size value in an "if"-"then"-"else"
block.
An easy way out would be to restrict address-size to 48-bits for now.

I've ignored "max-frame-size" since the description in
ethernet-controller.yaml claims there is a contradiction in the
Devicetree specification. I suppose it is describing the property
"max-frame-size" with "Specifies maximum packet length ...".

My understanding from the dt-schema README is that network-class.yaml
should live in the dt-schema repository since it describes properties
from the Devicetree specification. How is the synchronization handled in
this case? The motivation for this series is to fix dtbs_check failures
for Apple silicon devices both in the tree and upcoming ones.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (3):
      dt-bindings: net: Add network-class schema for mac-address properties
      dt-bindings: wireless: bcm4329-fmac: Use network-class.yaml schema
      dt-bindings: wireless: silabs,wfx: Use network-class.yaml

 .../bindings/net/ethernet-controller.yaml          | 18 +---------
 .../devicetree/bindings/net/network-class.yaml     | 40 ++++++++++++++++++++++
 .../bindings/net/wireless/brcm,bcm4329-fmac.yaml   |  5 ++-
 .../bindings/net/wireless/silabs,wfx.yaml          |  5 +--
 4 files changed, 46 insertions(+), 22 deletions(-)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230203-dt-bindings-network-class-8367edd679d2

Best regards,
-- 
Janne Grunau <j@jannau.net>

