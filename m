From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [dtschema PATCH] schemas: i2c: Add missing properties and descriptions
Date: Fri, 3 Jun 2022 11:24:11 -0500
Message-ID: <CAL_JsqJEFs5EyzCGHaaC6S=9mfDf9jbo+4=NKh2DO49+RUjBjw@mail.gmail.com>
References: <20220427175956.362987-1-robh@kernel.org> <YpouYnc6ctdHx3Vk@shikoro>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654273464;
        bh=EXbl5y5bKZ+Y91YTXpL+Xiq1fvINn7YwdKljvqjH4sc=;
        h=References:In-Reply-To:From:Date:Subject:To:From;
        b=nmBWymFCEvZr5YYJx0Xk5GTXIXqG/Ubv9UxH+08sfiSMGua8oFg6WGKoWF7y6VJz+
         5w78aKpsfmWZmUrPDzVPHjjVNqkpZewJMwKK6sF2E5K9Ht3ZRiX8g5DpMUREGCccEE
         NEf/aQyqQsZIATdJQAl4UI7qbY75UTDqiAN/s1cLDU/UhZsX7J/OrWFi/BkLXGyRYi
         h++iPdVV2ZdGyG6bU/a0ZuRumjw1Y4LoJ2z/OQNdD5rZo4d9bVaTsUv9/31asA8qlg
         /eEJthLu8zTBXii+/L2AxLNoSPivpC8P0e3f8DzI1rEjKF2T/DCPD1mBuJO1BzeuaR
         L8d+E7HIsEzLw==
In-Reply-To: <YpouYnc6ctdHx3Vk@shikoro>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Codrin Ciubotariu <codrin.ciubotariu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alain Volmat <alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>, Matt Johnston <matt-KrQt6mEI6EMUxA4j4dw1vfQIK84fMopw@public.gmane.org>

On Fri, Jun 3, 2022 at 10:53 AM Wolfram Sang
<wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org> wrote:
>
> On Wed, Apr 27, 2022 at 12:59:56PM -0500, Rob Herring wrote:
> > Add remaining properties and descriptions from i2c.txt binding in Linux
> > kernel tree. The Cc list are the authors of i2c.txt.
> >
> > Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
> > Cc: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> > Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Codrin Ciubotariu <codrin.ciubotariu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> > Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Cc: Alain Volmat <alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>
> > Cc: Matt Johnston <matt-KrQt6mEI6EMUxA4j4dw1vfQIK84fMopw@public.gmane.org>
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> > Cc list,
> >
> > I need your or your company's permission to relicense i2c.txt contents
> > (used in 'description') to BSD-2-Clause. Please ack and provide a
> > copyright if desired.
>
> In general:
>
> Acked-by: Wolfram Sang <wsa-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>

Thanks!

> In what from should I add the copyright? Basically it needs "Acked-by:"
> from above replaced with "(C)", or?

Whatever text your lawyer says. ;) I've heard copyright statements are
meaningless too, but IANAL.

I'll add this aligned with the existing statements if okay with you:

Copyright 2015,2020 Wolfram Sang <wsa-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>


Rob
