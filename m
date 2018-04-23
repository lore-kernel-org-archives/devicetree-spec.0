From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH] dt-bindings: add a jsonschema binding example
Date: Mon, 23 Apr 2018 09:25:05 +0200
Message-ID: <CAMuHMdVG542FbRgrEnSa6TeiDxXDxB3Fh1ZFd8UGB2c4UxZUcg@mail.gmail.com>
References: <20180418222905.10414-1-robh@kernel.org> <e7a2f4ca-40c2-05ef-097c-2cecd31fb731@gmail.com>
 <CAL_JsqKVCdk8nFwmtfNt4mMOVYFVxefgafP6JtXThvFhROFB8w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=N2pwRUl+8TYUe312Lg8uZWjdyZvogGEXHz9rvrRaqVE=;
        b=h0/C50XrgOKYqBFBShGy+rsIXixSt163VzpYOC8ilwxIp+XtDoQASxmLS69qOUsxi+
         r0xWq/D62G1J+CeXRKMwvVEnkAovxJKW6WH8Jn+Rd6e5ENE7HQq5Q9H8gvwXScKfgmRL
         NZ1l0a9e4e6XTRZYI0KLdebJo2iHMqLtYEJ3QtYeHh6A/tCsIWIVGROlIKpBY1sXmiP9
         I6OTDmE5Z3j0rEu5BvM/b+0SU4BFJehn9OZ19JsWqycmD+mwAqn2bcaG5zl+KG1oMVvz
         At/n2f4pphhD8tAU+Kue1AJlzSQ6mv1zbcuqfNjtkx4trGpMOt8G+YG/VE3/D2oONtO8
         pX8Q==
In-Reply-To: <CAL_JsqKVCdk8nFwmtfNt4mMOVYFVxefgafP6JtXThvFhROFB8w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, devicetree-spec@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@arm.com>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>, Jonathan Cameron <jic23@kernel.org>

Hi Rob,

On Sat, Apr 21, 2018 at 3:28 AM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Apr 20, 2018 at 4:00 PM, Frank Rowand <frowand.list@gmail.com> wrote:
>> Others have already commented on a desire to have a way to specify that
>> number of interrupts should match number of interrupt-names.
>
> Yeah, but I don't see a way to do that. You could stick the array size
> constraints in a common definition and have a $ref to that definition
> from both, but that doesn't really save you too much.

As Bjorn said, this could be handled in the validation tool, for the myriad of
standard list properties that have an accompanying names property.

That avoids having to specify the relation in each and every binding document.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
