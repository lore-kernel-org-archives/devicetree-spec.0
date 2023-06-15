From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: Remove last usage of "binding" or "schema"
 in titles
Date: Fri, 16 Jun 2023 00:22:53 +0200
Message-ID: <44c41dff-31c9-9d4a-9a44-eec9e5689aed@denx.de>
References: <20230615213154.1753313-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1686867776;
        bh=73RYwg9Cvb/ETFjrgPGXzFwhwmQvzx5PYELjo6ENv/g=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KusWaHDbPqRq3uF7moqmAjpQxuG3jf4l412/nX/jK1AS/gIVX0yIiKXfnwDFVE2Gi
         G16Gelh5Oh/wHvcP9Uy9muv5f9BZMvwmCCQ3AbAqvjRaoy+ZFYzk207AlxI3iu6QUZ
         G22HMQ8bsODd4dzmmChlMf8pdtHXVH/arxN56D21JqmUZE2dF1MC2fjuinCbtL3yTp
         miLP6MFgFGhHMM4nyVDo2EQMOAtijZ2Gg9He3tBpQwzQ+rg/CZmtp5fjfLYnqFSNKC
         ZFBaOwMhkOzGCcSFS9PJDqASR3G0eJYvGU/t1MvOxluqIBgCsoGPdg88M1D43Hdc3p
         gokdcmHw+2MIA==
Content-Language: en-US
In-Reply-To: <20230615213154.1753313-1-robh@kernel.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Rob Herring <robh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Suman Anna <s-anna@ti.com>, - <devicetree-spec@vger.kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org

On 6/15/23 23:31, Rob Herring wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding", but instead just describe the hardware.
> 
> Most of these have been fixed already, so fix the handful that snuck in.
> With this, a meta-schema check can be enabled to catch these
> automatically.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml   | 2 +-
>   Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml    | 2 +-
>   .../devicetree/bindings/power/reset/restart-handler.yaml        | 2 +-
>   .../devicetree/bindings/remoteproc/ti,pru-consumer.yaml         | 2 +-
>   .../devicetree/bindings/reserved-memory/framebuffer.yaml        | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml
> index 199818b2fb6d..cd0d763ce2f3 100644
> --- a/Documentation/devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml
> +++ b/Documentation/devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml
> @@ -4,7 +4,7 @@
>   $id: http://devicetree.org/schemas/clock/brcm,bcm63268-timer-clocks.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: Broadcom BCM63268 Timer Clock and Reset Device Tree Bindings
> +title: Broadcom BCM63268 Timer Clock and Reset
>   
>   maintainers:
>     - Álvaro Fernández Rojas <noltari@gmail.com>
> diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> index ff9600474df2..0a6dc1a6e122 100644
> --- a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> @@ -4,7 +4,7 @@
>   $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: NXP i.MX8MP AudioMIX Block Control Binding
> +title: NXP i.MX8MP AudioMIX Block Control

For AudioMIX:
Reviewed-by: Marek Vasut <marex@denx.de>
