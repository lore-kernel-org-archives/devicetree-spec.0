From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Add a Travis CI config
Date: Wed, 9 Aug 2017 17:43:28 -0500
Message-ID: <CAL_JsqKx2kVXNa9VfA6G9vL=4E0CuPH1mo28s60xsdB62XYJeA@mail.gmail.com>
References: <20170808235109.4099-1-robh@kernel.org> <150231119447.29244.17286240817028373744@sboyd-linaro>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <150231119447.29244.17286240817028373744@sboyd-linaro>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, Aug 9, 2017 at 3:39 PM, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Quoting Rob Herring (2017-08-08 16:51:09)
>> Add an initial Travis CI configuration file. Currently, the output is
>> not deployed anywhere, so it's just pass/fail for the building of pdf
>> and html. The CI build is here:
>>
>> https://travis-ci.org/devicetree-org/devicetree-specification
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  .travis.yml | 34 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>  create mode 100644 .travis.yml
>>
>> diff --git a/.travis.yml b/.travis.yml
>> new file mode 100644
>> index 000000000000..8426aa80db66
>> --- /dev/null
>> +++ b/.travis.yml
>> @@ -0,0 +1,34 @@
>> +language: c
>
> Can't use python? O well.

All this does is set CC. I don't think setting to python helps unless
I wanted to test with specific python versions, but what's in trusty
is fine.

If I remove it, looks like the default is ruby (seems like a good default ;) ).

>
>> +
>> +sudo: false
>> +dist: trusty
>> +
>> +cache:
>> +  apt: true
>> +
>> +env:
>> +  global:
>> +      - SPHINXBUILD=~/.local/bin/sphinx-build
>> +
>> +addons:
>> +  apt:
>> +    packages:
>> +      - python-pip
>> +      - latexmk
>> +      - latexdiff
>> +      - texlive
>
> Trailing whitespace.
>
>> +      - texlive-latex-extra
>> +      - texlive-humanities
>> +      - texlive-generic-recommended
>> +      - graphviz
>> +      - texlive-generic-extra
>> +
>> +install:
>> +  - pip install --user mako
>> +  - pip install --user Sphinx
>
> Trailing whitespace on these two lines as well.

I thought I fixed these, but I failed to add "-a" to "git commit
--amend" it looks like.

>
>> +
>> +script:
>> +  - make latexpdf
>> +  - make html
>> +  - make singlehtml
>> +
>
> Can we add the CI badge to the Readme too?

Yes, I'll fold that in! I was wondering how that gets added. This is
my first foray into travis-ci...

Updated version is here:
https://github.com/devicetree-org/devicetree-specification/tree/travis-ci-testing

>
> ---8<----
> diff --git a/README.md b/README.md
> index 7eb3437f8260..55717b49582e 100644
> --- a/README.md
> +++ b/README.md
> @@ -8,7 +8,7 @@ This [repository](https://github.com/devicetree-org/devicetree-specification) ho
>     * Use this mailing list for submitting patches, questions and general discussion
>     * Sign up to the mailing list at http://vger.kernel.org/vger-lists.html#devicetree-spec
>
> -## Build Instructions ##
> +## Build Instructions [![Build Status](https://travis-ci.org/devicetree-org/devicetree-specification.svg)](https://travis-ci.org/devicetree-org/devicetree-specification) ##
>
>  Requirements:
>  * Sphinx: http://sphinx-doc.org/contents.html
