From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Add Github Action CI workflow
Date: Thu, 17 Jun 2021 16:24:12 -0600
Message-ID: <CAL_JsqJrvFUiqL_ehzbU3r8M+PfcjbL7Bx8a4afWN3F6-xFLbg@mail.gmail.com>
References: <20210614173623.1125220-1-robh@kernel.org> <CAPnjgZ27P9mXRBzcHeoVHF1OyLqS95NnJQ7dAvNnhMf-6XUa-w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623968665;
        bh=e1DIFlUcQcPb/2debnpb1UaTLZodwGDZbkdCD3X34eA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VckcU32TOEGkwO693Zb6OcKUO62I9pPB4Hypj+62XkvmGyxuEiz5FgxEPGS+9mIJh
         PaA426q+ARhzwBsVqQweT2FhH0U+OC7Lw67BhQr/LE1sg9b0uImQLiEnIv2vJeF3yN
         xwJRTEn0PU5Gg/3E7CTo5W87Y/zS2J8cMDCsn2Xy4p2ibsfSnJ7w52q2JV7yI5ge4D
         5Z/ViHupPZqm6Fb8IfFofD9ke6kwCyq6WsZgvUkoSxq6gufmwMAlUYNpRZIVpwD75c
         Qt2bffAJrEYiLpTdQuBKYV99+aGQlolVqndKFHeUlms/qVXtV0EPwyqjwBvbGsXQ96
         nOS8x10W+GKkw==
In-Reply-To: <CAPnjgZ27P9mXRBzcHeoVHF1OyLqS95NnJQ7dAvNnhMf-6XUa-w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bill Mills <bill.mills-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

On Thu, Jun 17, 2021 at 1:19 PM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> Hi Rob,
>
> On Mon, 14 Jun 2021 at 11:36, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > Travis-ci.org is going away and moving to Travis-ci.com requires some
> > work. It would probably involve fixing authentication issues yet again.
> > Instead, let's just move to a GH actions job which is fairly trivial to
> > setup. This has the side benefit of CI will run on anyone's fork without
> > further setup.
> >
> > As part of this, the specification file name gains a 'git-describe'
> > based version number.
> >
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> >  .github/workflows/ci.yml | 60 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >  create mode 100644 .github/workflows/ci.yml
>
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Thanks for looking.

>
> Questions below
>
> >
> > diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
> > new file mode 100644
> > index 000000000000..f8fe08d52cb0
> > --- /dev/null
> > +++ b/.github/workflows/ci.yml
> > @@ -0,0 +1,60 @@
> > +name: Github Action CI
> > +
> > +on:
> > +  push:
> > +    branches:
> > +    - '*'
> > +    tags:
> > +    - 'v*'
> > +  pull_request:
> > +    branches:
> > +      master
> > +
> > +jobs:
> > +  build:
> > +    runs-on: ubuntu-latest
> > +
> > +    steps:
> > +    - uses: actions/checkout@v2
> > +      with:
> > +        fetch-depth: 0
> > +
> > +    - name: install
> > +      run: |
> > +        sudo apt-get update
> > +        sudo apt-get install latexmk libalgorithm-diff-perl texlive texlive-latex-extra texlive-humanities graphviz
> > +        pip3 install --user mako
> > +        pip3 install --user typing
> > +        pip3 install --user Sphinx
>
> Does this need the capital S ?

I believe so. This is copy-paste from the TravisCI job.

> Can we use apt install instead?

Perhaps. I think the issue here was the TravisCI using ancient ubuntu
versions and we needed a newer version of Sphinx at some point. GH is
the latest LTS, so it should be new enough.

>
> > +        pip3 install --user codespell
> > +
> > +    - name: build pdf
> > +      run: |
> > +        make latexpdf
> > +        git fetch --tags --force # Needed to make git-describe work
> > +        mv build/latex/devicetree-specification.pdf build/latex/devicetree-specification-$(git describe).pdf
> > +    - name: build html
> > +      run: make html
> > +    - name: build singlehtml
> > +      run: make singlehtml
> > +
> > +    - name: upload
> > +      uses: actions/upload-artifact@v2
> > +      with:
> > +        name: artifacts
> > +        path: |
> > +          build/latex/devicetree-specification-*.pdf
> > +
> > +    - name: deploy
> > +      uses: peaceiris/actions-gh-pages@v3
> > +      with:
> > +        github_token: ${{ secrets.GITHUB_TOKEN }}
>
> What do the spaces instead the {} do? From the docs it looks like this
> is a quirk of github?

I don't know really.

> > +        publish_dir: ./build/singlehtml
> > +
> > +    - name: release
> > +      uses: softprops/action-gh-release@v1
> > +      if: startsWith(github.ref, 'refs/tags/')
>
> So we don't need ${{}} around this one?

Evidently not. On both of these, I just follow what the action's docs
say to add.

It's nice and worrying at the same time to just use other people's actions.

Rob
