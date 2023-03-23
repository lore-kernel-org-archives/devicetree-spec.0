From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] meta-schemas: Allow 'not' keyword
Date: Thu, 23 Mar 2023 11:13:21 -0500
Message-ID: <CAL_Jsq+nSSMSuOqRzfBiNL4LkxCpcuuNRMOHLeF_LoMO8EYH6w@mail.gmail.com>
References: <20230323150947.947-1-Sergey.Semin@baikalelectronics.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679588014;
        bh=5p5jko5qjoF+tKuSX7AnTA3OpiS7U0Mmzwp1aEbFZkE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PEr+h6MogRMQdBM8/UuyikzM2Wn02gGt/DZun3TJ0nwwk74VV0aSYB8zzR4MXfqar
         1nTzMqK0SWF++bCYE2ufXYqPC7TBUmcSU85zgfozLIHQZ73hViP4Kr9MniO/g3PdQN
         5S2a10XzahIHRkyd999V3NMnxHNtN3egknrrW2lncVtZJ01rns8Zzq1QN6IJIMJoya
         SyjbqVfaT7QibgVVq9qBJhApK8NIWJ/tG8HTds5mljl6LjA71An//x4yPVvZhe/wDH
         SrVKpFn1tSRZ3ftY8T+WPmFk2i8ub6ViNmIndEzcDzW0Vfhdlz/BnZvjbEH0zfjNVn
         DjEmWcDeQKMbg==
In-Reply-To: <20230323150947.947-1-Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Serge Semin <Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexey Malahov <Alexey.Malahov-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>, Pavel Parkhomenko <Pavel.Parkhomenko-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Mar 23, 2023 at 10:12=E2=80=AFAM Serge Semin
<Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org> wrote:
>
> Root- and sub-node schemas are supposed to be allowed to use the 'not'
> keyword directly to express a schema against which the instance isn't
> supposed to be successfully validated. It shall work in the same way as
> the allOf, anyOf, oneOf-based validation except the keyword implies a
> single sub-schema against which an instance will be anti-evaluated.
>
> Signed-off-by: Serge Semin <Sergey.Semin-UN2wsyeM1qLJ45LvJ/SUn8gurn75+9Lz@public.gmane.org>
>
> ---
>
> Please see the next email message for the patch context:
> Link: https://lore.kernel.org/netdev/20230313225103.30512-16-Sergey.Semin=
@baikalelectronics.ru
> ---
>  dtschema/meta-schemas/base.yaml  | 2 +-
>  dtschema/meta-schemas/nodes.yaml | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.
