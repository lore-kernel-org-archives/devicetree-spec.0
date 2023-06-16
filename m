From: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: Remove last usage of "binding" or "schema" in titles
Date: Fri, 16 Jun 2023 11:34:03 -0700
Message-ID: <6f5220ef3ec3c05f32b5d6085d2e8adf.sboyd@kernel.org>
References: <20230615213154.1753313-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686940446;
        bh=UmQb6FNQc3kZycxaRrEf208LD6H0d3VHH/7wjn/eZgs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sSoW856XRyhhdpubOu3eCtjd9oQuJCLRRSOTHJ64BN7eYjN110eUBx5J29lBoRd6v
         VdB7I6tExsuxllymfO3U9Z8/PTbOP34HVvgN5JJqS7sB77KgUrmZfzXWkHA5cLqFXQ
         63Wl7L4yiHa3u7Hw1du1K5igyEh2uvZXsvhKOfu8a+BTc4OH2cCswgcZZLrP23DH/Y
         QtZSmuhMbDgzrtCN8u8IIfOh7P1Xbym/QN+md+32n2KnvCbmDZ6wboNmch1SckcLB6
         fxaHWx+Ns4yZGnRwnVJWmkE4qpjUQLCFpsUMON+lAhPy8/x73cR8gqaMLwnENSAYyw
         hBL9QTb9Hza+A==
In-Reply-To: <20230615213154.1753313-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: - <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Abel Vesa <abelvesa-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?q?Fern=C3=A1ndez?= Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Quoting Rob Herring (2023-06-15 14:31:54)
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding", but instead just describe the hardware.
>=20
> Most of these have been fixed already, so fix the handful that snuck in.
> With this, a meta-schema check can be enabled to catch these
> automatically.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---

Acked-by: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
