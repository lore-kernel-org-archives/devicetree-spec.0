From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] Describe chosen modules for hypervisor booting
Date: Mon, 24 Apr 2023 17:41:56 -0500
Message-ID: <CAL_JsqJ40WQWTZi5tq7k40UNTksGATtWmnisX=nFGdxrrzRMxg@mail.gmail.com>
References: <20230421164012.2867267-1-alex.bennee@linaro.org>
 <CAL_JsqJmtcmsqRB_oiFm-cx8KU-4FgywHxK+qUn=-FvKz1d0xw@mail.gmail.com> <87jzy1a15e.fsf@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682376128;
        bh=KJUNnL1sStP1HfaijD3FSW/i/dBVx52KTL6Wok9UotQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BJcEyJ2hjrcHzo9ErXESWZRalqa753Pyvd/cUM0PMinL4DNjmYlF47BriYEttGIwa
         +oeqgAKIPrwozmfsyWT8FUFbVum0kte016/R45Gf1JKVrXjSmpUsSNnFps2xflOvl7
         xXkBKgGxkpqQ5ERZOT+pRX5nxgEHkQrwesIOIyX0RNhDZ0fBytoP/TopNcE7wo2jE1
         LRVox24zCMLnVdOzvWoy+dxpiwxNpW3n2Ke/0hnpasBwJPu2U4mYFrxjudf3gD+Wbj
         6vxjJvCDpotYnOMhNkuyDAK1qMuPEIvnphTGlFhVn8vXdWS08qpxKdsoJp6aWVNep2
         CEib3bx/08G2w==
In-Reply-To: <87jzy1a15e.fsf-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julien Grall <julien-LM2mM/qkH7s@public.gmane.org>, Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Carl van Schaik <cvanscha-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>

On Mon, Apr 24, 2023 at 7:57=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
>
> Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
>
> > On Fri, Apr 21, 2023 at 11:40=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@=
linaro.org> wrote:
> >>
> >> When booting something like a hypervisor there is need to communicate
> >> to it how the first guest will be loaded. Typically the firmware or
> >> boot loader will put the kernel and ramdisk in memory and pass the
> >> information to the hypervisors boot code. This mechanism currently
> >> works with Xen on the Arm platform and would be equally applicable to
> >> other such hypervisors.
> >
> > This is probably something to discuss on the boot-architecture list.
> >
> >>
> >> However this specification doesn't address the needs of a dom0less
> >> system (where there is no "root" guest to launch the others) so is
> >> currently very much an RFC.
> >
> > In the end, whatever you want to add will need a DT schema. Really,
> > just a schema would be fine. Much of /chosen is not in the spec.
>
> Where are these schema's stored?

Next door to the spec[1].

Rob

[1] https://github.com/devicetree-org/dt-schema
