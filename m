From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH] dt-bindings: add a jsonschema binding example
Date: Mon, 23 Apr 2018 18:49:59 +0200
Message-ID: <CAMuHMdU8q0VUxw-EXDqjjYbjeCwCkKuDJUjO0vSaCVrYLXqX4A@mail.gmail.com>
References: <20180418222905.10414-1-robh@kernel.org> <e7a2f4ca-40c2-05ef-097c-2cecd31fb731@gmail.com>
 <CAL_JsqKVCdk8nFwmtfNt4mMOVYFVxefgafP6JtXThvFhROFB8w@mail.gmail.com> <d2ed3578-ca09-15a6-e688-ffb9a097c2aa@arm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=NhA6ZOGhT7JCXlaIi1e41SORkkocpsVIfMcmBZ3TFQE=;
        b=SmH/Qh+YLRKYDpsbD4fdmAhNfHcSHh+Wp+8I9c8t4pdY6UXI/dffnRMkJkBsa1xiYs
         vMxBOFX2e/+6dJKng2R40VxD8dwnCOJa1jP9WfCN7EP/mkGrAvfntvyVn5U3PBNKV/0R
         gsis7Q6e7EwMdEa0kK56MKHb/C1/lo02aSc9O1YsK1wOubCk7kBn+dnEbeDzFlOp4ozM
         i31uKSpeENXnEdkWXX8i7fxiQ/aRhNc1Ey+05+F8q1S1gh0KI/WKmW7j6d5kc6ULC1S0
         CkFq0oi5Bm5+NlIw0C+kiBMkZsAf+ny8sZMCkfBLIRlbFc+IoMXIBbLk/Wrv3VtXiBXY
         keog==
In-Reply-To: <d2ed3578-ca09-15a6-e688-ffb9a097c2aa@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@arm.com>
Cc: Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, devicetree-spec@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>, Jonathan Cameron <jic23@kernel.org>

Hi Grant,

On Mon, Apr 23, 2018 at 4:47 PM, Grant Likely <grant.likely@arm.com> wrote:
> On 21/04/2018 02:28, Rob Herring wrote:
>> On Fri, Apr 20, 2018 at 4:00 PM, Frank Rowand <frowand.list@gmail.com>
>> wrote:
>>>> +  interrupts:
>>>> +    # Either 1 or 2 interrupts can be present
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>>> +    items:
>>>> +      - description: tx or combined interrupt
>>>> +      - description: rx interrupt
>>>> +
>>>> +    description: |
>>>> +      A variable number of interrupts warrants a description of what
>>>> conditions
>>>> +      affect the number of interrupts. Otherwise, descriptions on
>>>> standard
>>>> +      properties are not necessary.
>>>> +
>>>> +  interrupt-names:
>>>> +    # minItems must be specified here because the default would be 2
>>>> +    minItems: 1
>>>
>>> Why the difference between the interrupts property and the
>>> interrupt-names
>>> property (specifying maxItems for interrupt, but not interrupt-names)?
>>
>> I should probably have maxItems here too.
>>
>>> Others have already commented on a desire to have a way to specify that
>>> number of interrupts should match number of interrupt-names.
>>
>> Yeah, but I don't see a way to do that. You could stick the array size
>> constraints in a common definition and have a $ref to that definition
>> from both, but that doesn't really save you too much.
>
>
> There has been discussions in the jsonschema community regarding
> referencing data in the document when applying the schema.
>
> https://github.com/json-schema-org/json-schema-spec/issues/549
>
> However, those discussions are ongoing and have been pushed back to
> after draft-8 (the current release is draft-7). We can instead define
> DT-specific keywords and extend the validator to make it do what we
> want. We need to do something very similar to validate that the length
> of tuples in 'reg', 'interrupts', and '*gpios' match the '#*-cells' values.

Checking that property lengths match the corresponding #*-cells cannot
be done for a schema, but only for the final DTS, as #*-cells is a property
of the target node, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
