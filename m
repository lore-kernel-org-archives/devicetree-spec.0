From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] dt-bindings: Remove last usage of "binding" or "schema"
 in titles
Date: Fri, 16 Jun 2023 02:37:10 +0200
Message-ID: <20230616003710.arsee2k3732kdhfk@mercury.elektranox.org>
References: <20230615213154.1753313-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="po5r3akfx43ntm5u"
Return-path: <linux-clk-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686875833;
        bh=J55ESfNtGwwnrR+cNXZIBNS0rU9QKWNkSjf07aIrJEQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iyfDZSJFtZ2hl+gEx08XuqQZYJbKs9nmgyKESWbNzvnUE1dtWMAwRPLIP/D4VMvuO
         9KxIfRXXj7amb7jFeM7ZDcfzoRxKw7f/TsjJ9bU5l3fLJyoM3SgsCtQnIghCizTVDv
         ztQB7PTqMLmx1tNFAIVuxOMU6FZbMPpHa8IslPLPIVoc5Tdc0sFhfLcIHgVVBpe01e
         NA0v1+/orrFhyqNr5ePIaEZyn10l7ml8gMoh/74Fq4sgqd6eALMeFpL0FCnPRkiBbJ
         Ydvn9Nk0yFeGtMUFlAt71Myl/R/I4Ai4UXTUm8f1yqdjkTGLlaZ545d8PwsgOvm0pe
         167t8SGNre9rA==
Content-Disposition: inline
In-Reply-To: <20230615213154.1753313-1-robh@kernel.org>
List-ID: <devicetree-spec.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, =?utf-8?Q?Fern=C3=A1ndez?= Rojas <noltari@gmail.com>, Marek Vasut <marex@denx.de>, Suman Anna <s-anna@ti.com>, - <devicetree-spec@vger.kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.


--po5r3akfx43ntm5u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 15, 2023 at 03:31:54PM -0600, Rob Herring wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding", but instead just describe the hardware.
>=20
> Most of these have been fixed already, so fix the handful that snuck in.
> With this, a meta-schema check can be enabled to catch these
> automatically.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/clock/brcm,bcm63268-timer-clocks.yaml   | 2 +-
>  Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml    | 2 +-
>  .../devicetree/bindings/power/reset/restart-handler.yaml        | 2 +-
>  .../devicetree/bindings/remoteproc/ti,pru-consumer.yaml         | 2 +-
>  .../devicetree/bindings/reserved-memory/framebuffer.yaml        | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

=2E..

> diff --git a/Documentation/devicetree/bindings/power/reset/restart-handle=
r.yaml b/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> index 1f9a2aac53c0..f2ffdd29d52a 100644
> --- a/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/power/reset/restart-handler.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Restart and shutdown handler generic binding
> +title: Restart and shutdown handler Common Properties
> =20
>  maintainers:
>    - Sebastian Reichel <sre@kernel.org>

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--po5r3akfx43ntm5u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmSLrrAACgkQ2O7X88g7
+ppshA//WlBWN4mcN0Kg9SD3Ko+IPfh7SzWZCTvjwXzfW1GBH5T5FIJDYgGMesO1
YIq0TI4Afr3wWEQxYbNR4PBDnflE/gtkrK7Pwr59d1ft4yid54na8T0Ax6S8R3Ru
FTW1dufmjQ7pT0QuqIyOH5GPTt5VPZNOGrh0ph9Un09PO2y3IzJ3BJ4XO8vEB4sc
cN2UebftqaC6UcsHKl5Ux9BdrS8bI83/e7SbvMwdsaGN6CPrGgyZdmroD5MKRw/4
SgswJZkElUnUlAisaO9h9ii7WlTlD1L90mr8xrNAfvuMg46HtRWP1z8xEkfsnj+N
cnwBW+hhCXUq7jEW4Yw9ShgAYvxi74gxKGglnBNCdSjEFxMOQWqCeGlzg1ta+AAm
bpVzc7M9OG1I/qjUVWlAQm4jgPSo9Vy7M55rwjzkxdXe2UsKeCxxbqx1gZsEgg/C
e7QHGixSMhh1Q+UagP2UF1M15qdHL+gV2FoAyU9Al4oPIb/+N+tcM1yVbdf2oAJk
8esyAD88tMZant9M6musxltBcaqS67X8xR7j44nFTnp3sbN5Y8WX9B6IyKOc6p9F
xhH70cEACDHpbNQBpv70U51dR36gnf4UIFoDKHMqqIUsG0muvKldcu596zu/IR96
xYrnu+5SUIla3pxG2ZJ5nhmLjoToTOHPSNduRFArX4EYNr+hwaM=
=bwes
-----END PGP SIGNATURE-----

--po5r3akfx43ntm5u--
