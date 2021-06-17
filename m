From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] Add Github Action CI workflow
Date: Thu, 17 Jun 2021 18:31:05 -0400
Message-ID: <20210617223105.GQ9516@bill-the-cat>
References: <20210614173623.1125220-1-robh@kernel.org>
 <CAPnjgZ27P9mXRBzcHeoVHF1OyLqS95NnJQ7dAvNnhMf-6XUa-w@mail.gmail.com>
 <CAL_JsqJrvFUiqL_ehzbU3r8M+PfcjbL7Bx8a4afWN3F6-xFLbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V0UVtYtGm5R6mXNF"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TfcPRVtb1bUBG+NqgmTYCR0j4nbRWAQqdJTcQ9Qz8Fc=;
        b=DDJzNFGfHfcqKrKZCP/nLCWuKOrrHHhyd9yNNHFNZSZ8SIlbqKOrCOwaZrARsTqER+
         3tDhxjksYT16MribcK/zyYvOcb839JN5ZbIczkHel3pmFbFBURjuxwLd3/R4+2mUjXMW
         czhzxet2YfC0xLNRrrc3rRZLJtsIVkRyrmQ/U=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJrvFUiqL_ehzbU3r8M+PfcjbL7Bx8a4afWN3F6-xFLbg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bill Mills <bill.mills-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


--V0UVtYtGm5R6mXNF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 04:24:12PM -0600, Rob Herring wrote:
> On Thu, Jun 17, 2021 at 1:19 PM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> >
> > Hi Rob,
> >
> > On Mon, 14 Jun 2021 at 11:36, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > >
> > > Travis-ci.org is going away and moving to Travis-ci.com requires some
> > > work. It would probably involve fixing authentication issues yet agai=
n.
> > > Instead, let's just move to a GH actions job which is fairly trivial =
to
> > > setup. This has the side benefit of CI will run on anyone's fork with=
out
> > > further setup.
> > >
> > > As part of this, the specification file name gains a 'git-describe'
> > > based version number.
> > >
> > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > ---
> > >  .github/workflows/ci.yml | 60 ++++++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 60 insertions(+)
> > >  create mode 100644 .github/workflows/ci.yml
> >
> > Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> Thanks for looking.
>=20
> >
> > Questions below
> >
> > >
> > > diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
> > > new file mode 100644
> > > index 000000000000..f8fe08d52cb0
> > > --- /dev/null
> > > +++ b/.github/workflows/ci.yml
> > > @@ -0,0 +1,60 @@
> > > +name: Github Action CI
> > > +
> > > +on:
> > > +  push:
> > > +    branches:
> > > +    - '*'
> > > +    tags:
> > > +    - 'v*'
> > > +  pull_request:
> > > +    branches:
> > > +      master
> > > +
> > > +jobs:
> > > +  build:
> > > +    runs-on: ubuntu-latest
> > > +
> > > +    steps:
> > > +    - uses: actions/checkout@v2
> > > +      with:
> > > +        fetch-depth: 0
> > > +
> > > +    - name: install
> > > +      run: |
> > > +        sudo apt-get update
> > > +        sudo apt-get install latexmk libalgorithm-diff-perl texlive =
texlive-latex-extra texlive-humanities graphviz
> > > +        pip3 install --user mako
> > > +        pip3 install --user typing
> > > +        pip3 install --user Sphinx
> >
> > Does this need the capital S ?
>=20
> I believe so. This is copy-paste from the TravisCI job.
>=20
> > Can we use apt install instead?
>=20
> Perhaps. I think the issue here was the TravisCI using ancient ubuntu
> versions and we needed a newer version of Sphinx at some point. GH is
> the latest LTS, so it should be new enough.

On a slight tangent, perhaps a requirements.txt so that in CI you just:
pip3 install --user --requirement path/to/requirements.txt

and as a bonus it documents what modules someone needs to build outside
of CI and future module needs are handled without a CI change.

--=20
Tom

--V0UVtYtGm5R6mXNF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmDLzSYACgkQFHw5/5Y0
tyywwQwAoInkTkb7Oj0szOw2TaQGIPdSL4/hqvrT/pZyjSYip4u0Bgzx7MgVOhTh
pNXmdNjp4yJ7SySfb6fB/WwsfEGsU8j5+KKVEahKqW+al0UBhlKc0Y6AB0kAtW7s
YRThR1hA67uQljlZ4bm5BZRb6Qo4FsKfZEQGnMqdOj7XmPvw+AsOwK4TX1aUQRVf
3KS4U3S3e3Q8AH6rXGk8ApQAffvffla8LQKT2vSSEu+LAArPScZPiVR+24zhkbud
dMMx9NobvEkarPOUf6mcOmxRPgMRCoCrKHicqgBRykQXg4uORh/WOsgrniEaFn12
1y7VJAl//eig5ei4bgZ1CZynJ+NT8rU8kk0J4UgDo0tR0DaftNruOXpm/XA1nRt+
sqP+ZfYQt1J5NVukDfI0HsfTxxzxA8tJvLqxr1z9J4IyyuWOAhHJfyRgo3owe/cJ
DWSv6V+FtpUAMZxktWUDJMP+vyc3bsuVItBpKhrxgKcZFoqlL6eFItWReVOm5TtH
xUMnrBUc
=AOpf
-----END PGP SIGNATURE-----

--V0UVtYtGm5R6mXNF--
