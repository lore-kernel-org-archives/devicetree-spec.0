From: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [dtschema PATCH] schemas: clock: Add example for 'clock-indices'
Date: Thu, 19 May 2022 16:17:23 -0700
Message-ID: <20220519231725.2BEB3C385AA@smtp.kernel.org>
References: <20220428152719.2263164-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653002245;
        bh=u3LSNocOTwuPd9KtxemKZdkfKzpqcbGjvJH7pyNSGXE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qq15Itd3+U+Id1OdlSaz5bB1NKH5f0V1En2jcJEP5yEvCkwaOh+qYXFmIKcMagt+7
         Yott4qAL+1/WC9ISKm8TAgp9sfWRx2by99tx0B+G+97trzTLImodCUT2UN303IfaLZ
         LkM/gUWCP9Vikl7nU3YjRIZtBnFuQ5qf8rvZR8qTIWzVfJ9yY/Xj53LhHm4WwvtTjD
         wM9Ty2p0hxN3qfqnpgHEsf8YsTLJXx9okehAMPTu4NZ+FlcPvZE8EVybwCKrG9Ff8y
         qmD1Hr+AovKko1sE8yLz9tDHUwr8LcmIvxVkva6+7eO5+ZS2Bn1GVNU40zrfxZkUBL
         L4NnB3OzkNdRw==
In-Reply-To: <20220428152719.2263164-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>

Quoting Rob Herring (2022-04-28 08:27:19)
> Add description for assigned-clocks properties from clock-binding.txt in
> the Linux kernel.
>=20
> This is relicensed from GPL-2.0 (the default) to BSD-2-Clause. The Cc list
> are the original authors.
>=20
> Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---

Acked-by: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
