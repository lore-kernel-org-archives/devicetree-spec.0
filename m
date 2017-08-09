From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Add a Travis CI config
Date: Wed, 09 Aug 2017 13:39:54 -0700
Message-ID: <150231119447.29244.17286240817028373744@sboyd-linaro>
References: <20170808235109.4099-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:from:user-agent:to
         :references:in-reply-to:message-id:subject:date;
        bh=KdE4uwgxTMiI+ezs7xwwVHtZeGpJ5F0aVc5lISI/s5w=;
        b=SvWSRjOrpm5eWl4aUq7Qe3B5z46oLGJ8cwe3n5XqAkpULu3u8UIHiSYD9nYXAnYH+E
         Z1MCEtsZRFEzbS1tkbNIMQ0FYQGK2cK7nv0hSk/fDLFhokOXQDkQYKy2ok4EUbrONN1X
         ez4kRXpUpiBGuqE7JEbKIXajvpk4WBn2ABG+0=
In-Reply-To: <20170808235109.4099-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Quoting Rob Herring (2017-08-08 16:51:09)
> Add an initial Travis CI configuration file. Currently, the output is
> not deployed anywhere, so it's just pass/fail for the building of pdf
> and html. The CI build is here:
> =

> https://travis-ci.org/devicetree-org/devicetree-specification
> =

> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  .travis.yml | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 .travis.yml
> =

> diff --git a/.travis.yml b/.travis.yml
> new file mode 100644
> index 000000000000..8426aa80db66
> --- /dev/null
> +++ b/.travis.yml
> @@ -0,0 +1,34 @@
> +language: c

Can't use python? O well.

> +
> +sudo: false
> +dist: trusty
> +
> +cache:
> +  apt: true
> +
> +env:
> +  global:
> +      - SPHINXBUILD=3D~/.local/bin/sphinx-build
> +
> +addons:
> +  apt:
> +    packages:
> +      - python-pip
> +      - latexmk
> +      - latexdiff
> +      - texlive =


Trailing whitespace.

> +      - texlive-latex-extra
> +      - texlive-humanities
> +      - texlive-generic-recommended
> +      - graphviz
> +      - texlive-generic-extra
> +
> +install:
> +  - pip install --user mako =

> +  - pip install --user Sphinx =


Trailing whitespace on these two lines as well.

> +
> +script:
> +  - make latexpdf
> +  - make html
> +  - make singlehtml
> +

Can we add the CI badge to the Readme too?

---8<----
diff --git a/README.md b/README.md
index 7eb3437f8260..55717b49582e 100644
--- a/README.md
+++ b/README.md
@@ -8,7 +8,7 @@ This [repository](https://github.com/devicetree-org/devicet=
ree-specification) ho
    * Use this mailing list for submitting patches, questions and general d=
iscussion
    * Sign up to the mailing list at http://vger.kernel.org/vger-lists.html=
#devicetree-spec
 =

-## Build Instructions ##
+## Build Instructions [![Build Status](https://travis-ci.org/devicetree-or=
g/devicetree-specification.svg)](https://travis-ci.org/devicetree-org/devic=
etree-specification) ##
 =

 Requirements:
 * Sphinx: http://sphinx-doc.org/contents.html
