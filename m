From: Francois Ozog <francois.ozog-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: System DT - thinking a sprint would help
Date: Thu, 6 Feb 2020 18:04:56 +0100
Message-ID: <CAHFG_=Xtz6cZUUiSCCRLzhTEVmY-STZSKp6zTzDtcGj3svMAbg@mail.gmail.com>
References: <20200206155907.GQ6796@tack.einval.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=okU+4suaoRbjuQgA/sfq9lj6rWCemMIvcjg8SeY57yU=;
        b=b7MAvk/Fn4kMlxyycygtUBCpkWqVoom2vv/ry+q36/TZX5lcKr6HQpfaFqCGwKQLVL
         3A7O1oYmlnU5fZ6kVDdoFyTXMFLkM9Jp8tU98hGcUBGE4Hr9qfTLz0mAl5Xe5RY9XyZI
         kBYAua4aoUUhp9vkZhLHeNd1ItfsPEOy9NnpOME4KpeLS1g+6FKLzTFjFv70H08n0Oj8
         pAbC+67EtNg80Ae0KxVBEArElSIKP+39y/rN9C9BanEJb2oG5TxQ/lLRXeoA6LU86x+x
         UCk0Ml3fxMLSfBXRtf2Wgab2fvdzZstn3GJrof2J3nyvqPd8DTcs2MPZZAOjGRCzpAl1
         L4mg==
In-Reply-To: <20200206155907.GQ6796-RWaXQMOneMVkKwkEErXb8g@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, system-dt-ZwoEplunGu1b+pB8xrm1Mtaxn9tAw+E3@public.gmane.org, Grant Likely <Grant.Likely-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <Rob.Herring-5wv7dgnIgG8@public.gmane.org>, Mark Brown <mark.brown-5wv7dgnIgG8@public.gmane.org>, Stefano Stabellini <stefanos-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

count me in.


On Thu, 6 Feb 2020 at 16:59, Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
>
> Hi all!
>
> [ tl;dr - we're trying to organise a sprint - see the end ]
>
> Due to the Linux on Arm meetup this week, quite a few of our DT
> community happened to be in Cambridge together last night. We took the
> opportunity to get together for food and beer, and we naturally ended
> up mulling over a whole range of things, not least the ongoing System
> DT design work.
>
> As is the nature of this kind of gathering, we had a whole range of
> opinions and ideas, much more than I can faithfully recall to share
> here in great detail. Grant has been keen to try and keep system-dt
> compatible with Linux DT usage if that's possible, and Stefano has
> been working with that in mind. Rob is concerned about how things
> might scale with lots of domains, for example. Olof is keen to talk
> about a higher-level design to make it easier to express complex
> layouts. And so on.
>
> There is one thing that *did* stand out: we agreed that it's probably
> time to try and get all of the interested people in a room together
> for a few days with a whiteboard, to really thrash out what's needed
> and how to achieve it. With the right people, we can go through all
> our needs, pick up the ideas we have and hopefully get some prototypes
> ready to evaluate.
>
> So, who's interested? I believe all the people in CC here are likely
> keen to be involved. Anybody else?
>
> Although we have Linaro Connect in Budapest at the end of March,
> that's really *not* a good place to try and meet up, for a couple of
> reasons: not everybody will be there, and we'll have too many
> distractions to be able to focus on this. Let's *not* do that.
>
> AFAICS we're geographically roughly split between US/Canada and
> Europe, so I'm thinking a week in either the US or Europe, some time
> in the next 2-3 months:
>
>  * Would a week before or after Connect work, in Europe (16th-20th
>    March, or 30th March to 3rd April)? I can look for options in the
>    UK easily, with maybe either Arm or Linaro hosting.
>
>  * Alternatively, a week's meeting in the US, deliberately avoiding
>    the Connect week so we don't wipe people out with travel: Maybe 2-6
>    or 9-13 March? Or push back into April if that's too short notice,
>    of course. Would Xilinx be able to host something for us, maybe? Or
>    another possibility might be the Linaro office in Nashua?
>
> I'm open to other suggestions for time and venue. Let's try to make
> something work here?
>
> Cheers,
>
> Steve
>
> --
> Steve McIntyre                                steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
> <http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs
>
>


--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Linaro Edge & Fog Computin=
g Group
T: +33.67221.6485
francois.ozog-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org | Skype: ffozog
