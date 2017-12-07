From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Force Travis-CI to use sphinx 1.5.6
Date: Thu, 7 Dec 2017 14:15:38 +0000
Message-ID: <CACxGe6vu68M9eiJLDH+9=1hy+qvcBM=+G_eiHJXpXvwXXC5=Gg@mail.gmail.com>
References: <20171207133942.5810-1-grant.likely@arm.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=GYtKxH0dEw/zOmoGMEYWt+QO/LAUsPZ0p4wXjFkSJD8=;
        b=qrzYRfqUam270MXNg+LM+lo1hs9BrMv1ezXRQLPUR+quZjFUVMKDHb6o78aThn/Fc8
         WbKdOc3U2QaiTtYKDr98btrB8b3sBzG8LlHTfnX+BqPqJLIYFE0ayR/XlXOO311O8Khu
         bbx1o80XpBmrlXJGsSzzrowQl7qyZ/7GKCy9TTYTREn8PZ/Q+bJKqIzAkOzsP11nrREt
         bUanuFqc3b7dUu6Wg8W204oRiDc2U6eaFh85aV1V2lh4vWJke3lH9D3Vz2AXlEBPSOzH
         ESU4vIRlQwtZKfzrXoQGfCUWghEQ9kvHbo8opfFerVZf71gFQ6PM6rh0WO4RWlwCWzxy
         Z/9w==
In-Reply-To: <20171207133942.5810-1-grant.likely-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

On Thu, Dec 7, 2017 at 1:39 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> Sphinx versions 1.6.1 and later have switched to using the mklatex
> script which seems to interact badly with the graphviz output and the
> graphics end up being too wide. Until a fix can be found, force Travis
> CI to use the older release of Sphinx.
>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
> ---
>
> Rob, can you try this out and see if it solves the image size problem on Travis CI?

Oh, wait. You've already fixed this in the main tree. I only just did
a git update. Sorry for the noise.

g.

>
> Thanks,
> g.
>
>  .travis.yml |  2 +-
>  README.md   | 12 ++++++++----
>  2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/.travis.yml b/.travis.yml
> index 3be8381..e9538d4 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -23,7 +23,7 @@ addons:
>
>  install:
>    - pip install --user mako
> -  - pip install --user Sphinx
> +  - pip install --user Sphinx==1.5.6
>
>  script:
>    - make latexpdf
> diff --git a/README.md b/README.md
> index 55717b4..6fcb16f 100644
> --- a/README.md
> +++ b/README.md
> @@ -12,10 +12,14 @@ This [repository](https://github.com/devicetree-org/devicetree-specification) ho
>
>  Requirements:
>  * Sphinx: http://sphinx-doc.org/contents.html
> - * version 1.2.3 or later
> + * version 1.2.3 or later, but no later than version 1.5.6
>  * LaTeX (and pdflatex, and various LaTeX packages)
>  * Graphviz (in particular, "dot"): http://www.graphviz.org/
>
> +There is a problem with image layout on Sphinx version 1.6.1 and later that
> +causes images to be too wide.
> +The problem is being investigated, but in the mean time use the older release.
> +
>  On Debian and Ubuntu:
>
>  >```
> @@ -29,7 +33,7 @@ On Debian and Ubuntu:
>  >
>  >```
>  >$ apt-get install python-pip
> ->$ pip install --user --upgrade Sphinx
> +>$ pip install --user --upgrade Sphinx==1.5.6
>  >$ export SPHINXBUILD=~/.local/bin/sphinx-build
>  >```
>  >
> @@ -45,9 +49,9 @@ On Mac OS X:
>  >```
>  >Install Sphinx
>  >```
> ->pip install --user --upgrade Sphinx
> +>pip install --user --upgrade Sphinx==1.5.6
>  >Or
> ->sudo pip install --upgrade Sphinx
> +>sudo pip install --upgrade Sphinx==1.5.6
>  >```
>  >
>  >If you are using [brew](http://brew.sh) then you can install graphviz like this:
> --
> 2.11.0
>
