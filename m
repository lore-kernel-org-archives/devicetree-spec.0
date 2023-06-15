From: Conor Dooley <conor-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: Remove last usage of "binding" or "schema"
 in titles
Date: Fri, 16 Jun 2023 00:07:05 +0100
Message-ID: <20230616-skydiver-unwritten-5cc47e04bf07@spud>
References: <20230615213154.1753313-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UYzgGdFRAKyKvt7y"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686870433;
        bh=1PjAQXC6EO6kyUJubG5wMVdHRFYZIFiLVImaErWPjBI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pMgHW0sLFNHkyTREetfSgwDQToYlSsp1sZ8YAWd7yGIa/Ull2kkuyCsUXtTtXl3eV
         vcA+Qx8wNvwW/rlbmyy2notXaHBgobRx7d/1MPrjj251Hg2zJW3g8YPtsgOAnkHpcb
         D+i2nuJqImqv+PV47OVKG4mhnPegQ27xvuOc1Fyw8whi8af3rE+27PXqKXuc/G1qH5
         yLqyWD6+toB//A4PP0y+O3Rf/9d1MvbO+H89bWERcJHXm474jBIIMNaykvQd4uLt3s
         RKHGhA8L+DzFTNibj0HBGi6fy4zvjjZmaqvalrDF6aDABFNLBtQO77OtXZOeaB9W/H
         f1atP3ctfAeyQ==
Content-Disposition: inline
In-Reply-To: <20230615213154.1753313-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Abel Vesa <abelvesa-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?iso-8859-1?Q?Fern=E1ndez?= Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, - <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel@vg


--UYzgGdFRAKyKvt7y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 15, 2023 at 03:31:54PM -0600, Rob Herring wrote:

> -title: Restart and shutdown handler generic binding
> +title: Restart and shutdown handler Common Properties

With the new caps for Common Properties, the title here looks a bit odd.
Should probably be s/shutdown handler/Shutdown Handler/ for title case,
but w/e...
Reviewed-by: Conor Dooley <conor.dooley-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

Cheers,
Conor.


--UYzgGdFRAKyKvt7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIuZmQAKCRB4tDGHoIJi
0vaOAQCvuB+Vy9A841viHe6D4DHohHomPDJhhehcVREBQDS3/wD/W6WhHVSt6J46
5pM/kAhmxxmkyTHVvMdH2/sXzNDawgM=
=Uxoq
-----END PGP SIGNATURE-----

--UYzgGdFRAKyKvt7y--
