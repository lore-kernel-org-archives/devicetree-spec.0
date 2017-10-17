From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague (26
 Oct 2017)
Date: Tue, 17 Oct 2017 19:24:13 +0200
Message-ID: <CAMuHMdW-=-CdnD5Eb_w7fc7=c64i+bu=yv9_c0cj3UM940d8EA@mail.gmail.com>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <20171017114823.58476908@bbrezillon> <CACxGe6tPQxwzN14TZtgNhw7OOuePLJxODrn-_b4gMDGzAFEf1Q@mail.gmail.com>
 <1508257276.74236.38.camel@freebsd.org> <2D4E6B6D-8F07-46D0-BB36-D97916802893@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=3lzZD0zhZAv7ot6QE2zoy9QNPw25xIEh1/mxYMHjAJI=;
        b=oiOga6IWKNqLYOa3+EoT/fNGW+10seJeBlqps9EC1cYudSqg+NLX68UFu/AdPgA5OE
         G0ItsOgXCKe2y9qkLqDrvprXx7tV9390sBEs89ovOjLoYIAqGr0axLp6xC/kZ07eQ8Ro
         urBvkON3b3K7IiYv+8Jr7CkDKShXrPWfOlq8b7t94UmuPMd2qIjYTOaEpf3vMNKf/juI
         2o4XZlpA/jj4fXsnkzlj2Ou4nhRYQUfZAFkBEHFP9oXLz7ixFJyfwSdPYNoSZ8d8bxtc
         ID/3acm1BSL/3dlMWwD8F8yVRTnWJfoiJnjhfkrLWrug8gH/4NmL58eumVMfMor6Jgiy
         /iNQ==
In-Reply-To: <2D4E6B6D-8F07-46D0-BB36-D97916802893-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>

Hi Kumar,

On Tue, Oct 17, 2017 at 7:02 PM, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> I think this also gets to having bindings described in a structured way s=
o they can be utilized for validation of dts files.  We are doing a little =
of this in Zephyr since we are using a structured binding spec to generate =
code from .dts (since we don=E2=80=99t utilize a runtime dtb).

So you are basically generating board files from .dts?
(closing the loop ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
