From: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] schemas: clock: Add assigned-clocks description
Date: Fri, 29 Apr 2022 13:22:15 -0700
Message-ID: <20220429202217.95511C385A7@smtp.kernel.org>
References: <20220428152633.2261979-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651263737;
        bh=73DcXxthbc3tJUDPBm6OksBQbW6aVm3NrO5PyrEDct4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Veq91XyCySNZq1euUXQiua0TNpmFeoc8/c+cbrR74bmVBUhCBjiQzI2RqeUi8F0XO
         Ief0jPNcPbi6lqs8E8OIXgpXZEZ+XqmapX3yz08INGcqmVGAkmPlR1eCC+TmZLhanl
         zyaoIoMOJoiqia6lPB+9XJsByZEn9LYm5iX4w9fvSLv8FC6tdvp65oEjO6aRxgJLF2
         YYeidzsuyVla4+GLBCq9WSohs2t8h77eVT1qDlTTDt8lzx+Qup4H/shTGWegJo3foW
         oO2GAy4RdVzfqBiITrlIqPB072sZ+QMymgmq8Ph+dbSyGbUJnvclErZKapJgFihTqE
         UhUJS3+KTwttw==
In-Reply-To: <20220428152633.2261979-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Quoting Rob Herring (2022-04-28 08:26:33)
> Add description for assigned-clocks properties from clock-binding.txt in
> the Linux kernel.
>=20
> This is relicensed from GPL-2.0 (the default) to BSD-2-Clause. The Cc list
> are the original authors.
>=20
> Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---

Reviewed-by: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
