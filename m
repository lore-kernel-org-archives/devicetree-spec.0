From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dt-bindings: Remove last usage of "binding" or "schema" in titles
Date: Thu, 15 Jun 2023 15:31:54 -0600
Message-ID: <20230615213154.1753313-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Abel Vesa <abelvesa-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, - <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The Devicetree bindings document does not have to say in the title that
it is a "Devicetree binding", but instead just describe the hardware.

Most of these have been fixed already, so fix the handful that snuck in.
With this, a meta-schema check can be enabled to catch these
automatically.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml   | 2 +-
 Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml    | 2 +-
 .../devicetree/bindings/power/reset/restart-handler.yaml        | 2 +-
 .../devicetree/bindings/remoteproc/ti,pru-consumer.yaml         | 2 +-
 .../devicetree/bindings/reserved-memory/framebuffer.yaml        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml
index 199818b2fb6d..cd0d763ce2f3 100644
--- a/Documentation/devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/brcm,bcm63268-timer-clocks.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Broadcom BCM63268 Timer Clock and Reset Device Tree Bindings
+title: Broadcom BCM63268 Timer Clock and Reset
 
 maintainers:
   - Álvaro Fernández Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
index ff9600474df2..0a6dc1a6e122 100644
--- a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: NXP i.MX8MP AudioMIX Block Control Binding
+title: NXP i.MX8MP AudioMIX Block Control
 
 maintainers:
   - Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
diff --git a/Documentation/devicetree/bindings/power/reset/restart-handler.yaml b/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
index 1f9a2aac53c0..f2ffdd29d52a 100644
--- a/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
+++ b/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/power/reset/restart-handler.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Restart and shutdown handler generic binding
+title: Restart and shutdown handler Common Properties
 
 maintainers:
   - Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
index c6d86964b72a..35f0bb38f7b2 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/remoteproc/ti,pru-consumer.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Common TI PRU Consumer Binding
+title: TI PRU Consumer Common Properties
 
 maintainers:
   - Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
diff --git a/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
index 05b6648b3458..851ec24d6142 100644
--- a/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: /reserved-memory framebuffer node bindings
+title: /reserved-memory framebuffer node
 
 maintainers:
   - devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
2.39.2

