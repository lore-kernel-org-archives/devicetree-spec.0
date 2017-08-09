From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Add a Travis CI config
Date: Wed, 09 Aug 2017 16:07:37 -0700
Message-ID: <150232005798.32400.15126616491999695987@sboyd-linaro>
References: <20170808235109.4099-1-robh@kernel.org>
 <150231119447.29244.17286240817028373744@sboyd-linaro>
 <CAL_JsqKx2kVXNa9VfA6G9vL=4E0CuPH1mo28s60xsdB62XYJeA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:to:from:in-reply-to:cc
         :references:message-id:user-agent:subject:date;
        bh=BP5P4/+KtQxMzsChMRuA/f/rxDaq34QzeBt6tmu4CQ0=;
        b=jtdxf21DGDwsxLeRVQKMNK/2iCkB1lpEu2v4jxG1Opo0/SfQB3fZV9B9v0Ub1DVWcu
         6kufPCqAIY/knyMha3mcbD6FnPhTIbawW6c+YaQIt1Hzct8TMpCWdL9h2XdNkkcSf8dn
         hohjgqBIyrrpVYbfxtB/37GSF5trgAB36W+ic=
In-Reply-To: <CAL_JsqKx2kVXNa9VfA6G9vL=4E0CuPH1mo28s60xsdB62XYJeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Quoting Rob Herring (2017-08-09 15:43:28)
> On Wed, Aug 9, 2017 at 3:39 PM, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wr=
ote:
> > Quoting Rob Herring (2017-08-08 16:51:09)
> >> Add an initial Travis CI configuration file. Currently, the output is
> >> not deployed anywhere, so it's just pass/fail for the building of pdf
> >> and html. The CI build is here:
> >>
> >> https://travis-ci.org/devicetree-org/devicetree-specification
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >>  .travis.yml | 34 ++++++++++++++++++++++++++++++++++
> >>  1 file changed, 34 insertions(+)
> >>  create mode 100644 .travis.yml
> >>
> >> diff --git a/.travis.yml b/.travis.yml
> >> new file mode 100644
> >> index 000000000000..8426aa80db66
> >> --- /dev/null
> >> +++ b/.travis.yml
> >> @@ -0,0 +1,34 @@
> >> +language: c
> >
> > Can't use python? O well.
> =

> All this does is set CC. I don't think setting to python helps unless
> I wanted to test with specific python versions, but what's in trusty
> is fine.
> =

> If I remove it, looks like the default is ruby (seems like a good default=
 ;) ).

Heh ok.

> =

> Yes, I'll fold that in! I was wondering how that gets added. This is
> my first foray into travis-ci...
> =

> Updated version is here:
> https://github.com/devicetree-org/devicetree-specification/tree/travis-ci=
-testing
> =


Awesome! FWIW,

Reviewed-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
