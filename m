From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Add GPIO binding
Date: Tue, 12 Dec 2017 12:44:20 +0000
Message-ID: <CACxGe6tC7f20G4KEuzEfJNU__R+qPZKCOnSL3WQ+mZcPSD3yEg@mail.gmail.com>
References: <20171207171059.24845-1-grant.likely@arm.com> <CAL_JsqJcCtAzV06BE_tuzQu6pz+3zNjfaE_EqU-5Ogw37WRLmg@mail.gmail.com>
 <CACRpkdbntaEysFnHxZ1mVAnGTagy8Ek=a7dL0r_ciXjGZJR4ZQ@mail.gmail.com> <CAL_JsqKLYe7e8kqXYWXXQ6mMY7CVXPDZYgCqZOfz3UCvUApkCg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=o7XJA7Sf05iQe9at37S399KTbOaLmZC0Tw/4Eg8y1T8=;
        b=qKLRTtDMNa+xA5bIuiZdzhGrVjlmkAg+ZF7l7nvlqZadn8WUnY/OxZTzzM9lOfqEY9
         W5XaDXZvBJfKPtRe9Qaxw7WAM8KEgop/KUhTY2NtjtbHc87wXtGmK3bHr5RDAHEM5rUF
         i3kWPTrOjtuRhOoJo4reN9BMfbyeESv4xO/fLVU0VFr6ADgk0H5Qib7zWFXoBp5KbKUe
         JkwR9efdMwfLuK1FdJVS/BKg3Rd17gvwYCASTOUo95iocz98QPsKqDmWE+FJG2F2AQ9X
         t4dKsEdDr+yCYC5RNxPz5Nc9lyYEDAlgoTalmjFgcUu2rnfgEAs7dr3QWu21nJcfZ9Ye
         mS+w==
In-Reply-To: <CAL_JsqKLYe7e8kqXYWXXQ6mMY7CVXPDZYgCqZOfz3UCvUApkCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

On Mon, Dec 11, 2017 at 3:46 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Dec 11, 2017 at 3:07 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Thu, Dec 7, 2017 at 9:51 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>
>> I don't really know the context but I guess devicetree.org standards
>> document so I need to read it close :)
>>
>>> +Linus W
>>>
>>> On Thu, Dec 7, 2017 at 11:10 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>>>> Add the GPIOs binding as described in the Linux kernel. All of the
>>>> binding except pinmux has been included. Pinmux is omitted until the
>>>> pinmux binding is similar transferred.
>>
>> Two words: pin control - pin multiplexing is just half of the things
>> pin control does. It also does electrical configuration of pins
>> (pull ups etc) and that is not pinmux.
>>
>> But I get what you mean.

I could use help with rewriting the section to properly reflect pin
control. In this patch I've mostly just transcoding what has already
been written.

[...]
>>>> +General Purpose IO (GPIO)
>>>> +-------------------------
>>>> +
>>>> +GPIO signals are modelled in |spec| as a point to point connection between
>>>> +a GPIO controller node which provides the GPIO signal,
>>>> +and a GPIO consumer node.
>>>> +A connection is described with a ``single-gpio`` which is placed in the
>>>> +consumer node, and identifies a specific GPIO controller and signal.
>>
>> This reads like a textual form of the BNF-form specification that we have
>> in the kernel. I assume other resources such as interrupts, clocks, regulators
>> etc are described in similar wording so OK.

Correct. The published document will probably continue to be formatted
into something like BNF, but I want to move the source towards a
usefully parseable syntax that can be used by tools

>>
>>>> +In this model, the purpose of a GPIO signal is determined by the GPIO consumer
>>>> +node, which is entirely dependant on what device the consumer node represents.
>>>> +The GPIO controller does not make any assumptions about how GPIOs will be used.
>>
>> Good. That is a way of saying that when we say something is general purpose,
>> it is actually general purpose. Should be evident from the name, but given how
>> some electronics people call everything GPIO it needs to be pointed out
>> I guess.

hahaha

>>
>>>> +For example, an MMC controller may use a GPIO connection to communicate the RW/RO pin state.
>>>> +In this case the MMC controller node would identify the specific GPIO signal
>>>> +used to detect RW/RO state,
>>>> +and the MMC controller driver would know to configure it as an input.
>>>> +The GPIO controller node has no knowledge of how the pin should be used and
>>>> +merely provides a pin control interface to the MMC driver.
>>
>> This kind of mandates that the OS implementing GPIO must provide accessors
>> for setting pin direction and reading/writing lines. I guess mandating what an
>> OS driver "must do" is not the scope of the spec but it is kind of hard to avoid
>> it creeping in.
>>
>>>> +To conform to the generic GPIO binding, both the GPIO controller and consumer
>>>> +nodes must conform to this binding as detailed below.
>>>> +
>>>> +GPIO Definitions
>>>> +^^^^^^^^^^^^^^^^
>>>> +
>>>> +.. tabularcolumns:: | l l J |
>>>> +.. table:: GPIO Binding Datatype Definitions
>>>> +
>>>> +   =================== ============================== ================================================
>>>> +   Type                Definition                     Description
>>>> +   =================== ============================== ================================================
>>>> +   ``gpio-list``       ``single-gpio [gpio-list]``    Array of one or more ``gpio-single``.
>>
>> Should it be "single-gpio" in the end there?

It's a recursive definition. :-)

This was from the original text. It could be reworded.

>>
>> As it is named here:
>>
>>>> +   ``single-gpio``     ``<phandle> <gpio-specifier>`` Reference to a single GPIO signal specifying
>>>> +                                                      both GPIO controller (``phandle``) and GPIO
>>>> +                                                      signal from that controller (``gpio-specifier``)
>>>> +   ``gpio-specifier``  ``<u32>[0..#gpio-cells]``      Array of ``cells``. Array size defined by
>>>> +                                                      value of *#gpio-cells* in GPIO controller node.
>>>> +                                                      In other words, the size of a ``gpio-specifier``
>>>> +                                                      is dependent on the GPIO controller.
>>>> +   =================== ============================== ================================================
>>>> +
>>>> +A ``gpio-specifier`` is an array of 1 or more ``cells`` indicating the specific GPIO signal and configuration of that signal.
>>
>> I would prefer to hammer down the gpio-specifier to 2 cells where the
>> first cell specifies the line/signal and the second specifier electric
>> properties, such as active low, open drain etc.

As Rob pointed out, this binding needs to account for more complicated
scenarios, but it can be reworded to strongly recommend the 2-cell
version.


>>>> +GPIO Hogging
>>>> +~~~~~~~~~~~~
>>>> +
>>>> +A GPIO controller may provide automatic configuration information for one or more GPIO
>>>> +signals by adding ``GPIO hog`` child nodes.
>>>> +GPIO hogging informs the GPIO controller driver that some pins must be configured in a
>>>> +particular way at driver initialization time, without requiring a reference from a GPIO
>>>> +consumer node.
>>
>> They even *MUST NOT* be referenced from consumer nodes.
>>
>> Hogs are hoggy hogs that hog around. Very greedily.
>>
>> So we need to say that hogs exclude a GPIO line from any use by
>> any consumer node.
>>
>> There has been a lot of back-and-forth of another type of self-reference
>> specifying initial values and/or directions to a GPIO line, later to be
>> taken (or not) by some consumer.
>>
>> These discussions have stalled. It didn't lead anywhere.
>
> I would suggest we leave hogs out for now. I think the above needs to
> be resolved first. I'm not a fan of the gpio hogs binding so much, but
> I don't really have a better suggestion on how to handle it.

Okay, will drop

g.
