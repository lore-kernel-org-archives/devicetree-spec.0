From: Matt Johnston <matt-KrQt6mEI6EMUxA4j4dw1vfQIK84fMopw@public.gmane.org>
Subject: Re: [dtschema PATCH] schemas: i2c: Add missing properties and
 descriptions
Date: Thu, 28 Apr 2022 17:11:13 +0800
Message-ID: <176814ee51d7f238e5137606f50a99904e9017cb.camel@codeconstruct.com.au>
References: <20220427175956.362987-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1651137075;
        bh=r9m7rv7lfE3EHiTyUyYvwKe0vUFfozsaK1tPrKsB9Rs=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=NO48EukKOgboE5Bo0Xy43GxN0KspOHsoGvSYZIHnVW3GTKzOA8SY7nbVs+/YyVfXd
         lQirDyLs/CMzav3FIpaEi5Gw95SoI2zVGg2m2NaIZsm0SkxHNuQ8eMgERGDfF5MSJa
         MLwCBXlDrCFcYh2KhQYqPXqh1Hs2dE/iYOXcA1HkE3k+d8eLMut7ZC2dIeEruhK9eV
         UaUtdGdpKeniBmFo6TEhqHGDrgxrAzzBY5jIvHvunlibcKg7Z+bErc0HwXLQET5Phx
         zilrvT8Etxw53Yq8KLHmcaPBioOBViXzqmF2iFIHCb9BNKwP7SxS6QX9I1IO6sVd2q
         xb1HXEzRittnA==
In-Reply-To: <20220427175956.362987-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Codrin Ciubotariu <codrin.ciubotariu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alain Volmat <alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>

On Wed, 2022-04-27 at 12:59 -0500, Rob Herring wrote:
> Add remaining properties and descriptions from i2c.txt binding in Linux
> kernel tree. The Cc list are the authors of i2c.txt.
> 
> Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
> Cc: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Codrin Ciubotariu <codrin.ciubotariu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Alain Volmat <alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>
> Cc: Matt Johnston <matt-KrQt6mEI6EMUxA4j4dw1vfQIK84fMopw@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Cc list, 
> 
> I need your or your company's permission to relicense i2c.txt contents 
> (used in 'description') to BSD-2-Clause. Please ack and provide a 
> copyright if desired.

Acked-by: Matt Johnston <matt-KrQt6mEI6EMUxA4j4dw1vfQIK84fMopw@public.gmane.org>

Cheers,
Matt


