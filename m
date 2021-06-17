From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] Add Github Action CI workflow
Date: Thu, 17 Jun 2021 13:18:46 -0600
Message-ID: <CAPnjgZ27P9mXRBzcHeoVHF1OyLqS95NnJQ7dAvNnhMf-6XUa-w@mail.gmail.com>
References: <20210614173623.1125220-1-robh@kernel.org>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=agbMLXMUgqzgl7+u3lVBgiVR1AM9TeVLyuh5KH08Zhg=;
        b=CQRZEMXFQPCZqR1D5Hf8rny1JsFIp8bjAenqkUR7iOKWbyV+w7wh4tQsb27bbXsyXg
         em627C6hli9YDSnZXpjjvavH0SH+90RWShKF4mLqoFc3RBVPE3AauT287o1uvaiNBneH
         vki7lwXECnaEgrbPquIw8EA6Tme1/MdFQ4IuM=
In-Reply-To: <20210614173623.1125220-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bill Mills <bill.mills-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Hi Rob,

On Mon, 14 Jun 2021 at 11:36, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> Travis-ci.org is going away and moving to Travis-ci.com requires some
> work. It would probably involve fixing authentication issues yet again.
> Instead, let's just move to a GH actions job which is fairly trivial to
> setup. This has the side benefit of CI will run on anyone's fork without
> further setup.
>
> As part of this, the specification file name gains a 'git-describe'
> based version number.
>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  .github/workflows/ci.yml | 60 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 .github/workflows/ci.yml

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Questions below

>
> diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
> new file mode 100644
> index 000000000000..f8fe08d52cb0
> --- /dev/null
> +++ b/.github/workflows/ci.yml
> @@ -0,0 +1,60 @@
> +name: Github Action CI
> +
> +on:
> +  push:
> +    branches:
> +    - '*'
> +    tags:
> +    - 'v*'
> +  pull_request:
> +    branches:
> +      master
> +
> +jobs:
> +  build:
> +    runs-on: ubuntu-latest
> +
> +    steps:
> +    - uses: actions/checkout@v2
> +      with:
> +        fetch-depth: 0
> +
> +    - name: install
> +      run: |
> +        sudo apt-get update
> +        sudo apt-get install latexmk libalgorithm-diff-perl texlive texlive-latex-extra texlive-humanities graphviz
> +        pip3 install --user mako
> +        pip3 install --user typing
> +        pip3 install --user Sphinx

Does this need the capital S ? Can we use apt install instead?

> +        pip3 install --user codespell
> +
> +    - name: build pdf
> +      run: |
> +        make latexpdf
> +        git fetch --tags --force # Needed to make git-describe work
> +        mv build/latex/devicetree-specification.pdf build/latex/devicetree-specification-$(git describe).pdf
> +    - name: build html
> +      run: make html
> +    - name: build singlehtml
> +      run: make singlehtml
> +
> +    - name: upload
> +      uses: actions/upload-artifact@v2
> +      with:
> +        name: artifacts
> +        path: |
> +          build/latex/devicetree-specification-*.pdf
> +
> +    - name: deploy
> +      uses: peaceiris/actions-gh-pages@v3
> +      with:
> +        github_token: ${{ secrets.GITHUB_TOKEN }}

What do the spaces instead the {} do? From the docs it looks like this
is a quirk of github?

> +        publish_dir: ./build/singlehtml
> +
> +    - name: release
> +      uses: softprops/action-gh-release@v1
> +      if: startsWith(github.ref, 'refs/tags/')

So we don't need ${{}} around this one?

> +      with:
> +        files: build/latex/devicetree-specification-*.pdf
> +      env:
> +        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
> --
> 2.27.0
>

Regards,
Simon
