From: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH] dt-bindings: Remove last usage of "binding" or "schema"
 in titles
Date: Thu, 15 Jun 2023 18:19:13 -0500
Message-ID: <8d966915-301e-7728-a8ff-db19cecfa9af@ti.com>
References: <20230615213154.1753313-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1686871155;
        bh=ron0yTFP9tS1tz+dksMbJ6CQO1+vivWHLKGGTZLpBaM=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=XvLIBwWMRs6qiujxn4WaAVAKKPBa+n0z3IJnnF/d6CZYz8AaSZZlqQFMX+3Q7BH6K
         M31h9Rr346Hd0TEx+LCf/5tWPx3/Fb3g4bGdCGYHN870wtZc53sXn1UFJleBNYkXdK
         t7djQmLIInsgxa8LRxpxgTqrmJG0CUMU1yKFIuu0=
Content-Language: en-US
In-Reply-To: <20230615213154.1753313-1-robh@kernel.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Marek Vasut <marex@denx.de>, - <devicetree-spec@vger.kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org

On 6/15/23 16:31, Rob Herring wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding", but instead just describe the hardware.
> 
> Most of these have been fixed already, so fix the handful that snuck in.
> With this, a meta-schema check can be enabled to catch these
> automatically.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml   | 2 +-
>  Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml    | 2 +-
>  .../devicetree/bindings/power/reset/restart-handler.yaml        | 2 +-
>  .../devicetree/bindings/remoteproc/ti,pru-consumer.yaml         | 2 +-
>  .../devicetree/bindings/reserved-memory/framebuffer.yaml        | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 

...

> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> index c6d86964b72a..35f0bb38f7b2 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/remoteproc/ti,pru-consumer.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Common TI PRU Consumer Binding
> +title: TI PRU Consumer Common Properties
>  
>  maintainers:
>    - Suman Anna <s-anna@ti.com>

For PRU Consumer binding,
Reviewed-by: Suman Anna <s-anna@ti.com>

regards
Suman

