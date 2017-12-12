From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Add GPIO binding
Date: Tue, 12 Dec 2017 11:51:33 +0000
Message-ID: <CACxGe6uATzZh5czj_MVjYA0O3MzM3C8P9_L=5M_9WpMEL0Rm9A@mail.gmail.com>
References: <20171207171059.24845-1-grant.likely@arm.com> <CAL_JsqJcCtAzV06BE_tuzQu6pz+3zNjfaE_EqU-5Ogw37WRLmg@mail.gmail.com>
 <CACRpkdbntaEysFnHxZ1mVAnGTagy8Ek=a7dL0r_ciXjGZJR4ZQ@mail.gmail.com> <CAL_JsqKLYe7e8kqXYWXXQ6mMY7CVXPDZYgCqZOfz3UCvUApkCg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=PB2G3XOlNjpjxium4D8lmBJQ6Ia9Je5DTGgiy+uK3rE=;
        b=CksXmUs1IaDFcpHyP/Xo/bu1SnTsxGyUbDIMAk2myv5aqhNSYvI2kyRmBWhDkRZ9k6
         rhhjVRSGhZ+vNwkB5epRO/qJI2AOJpIaFmnPZbygBR7i03X3+8pCuaBdEBpE6LCr1BHV
         rlc6wL0XqwjkjUmMM+BccIDblYzTF+iXeHh64CdUk5QFKXGWQVfCi4+fNne+Zsu7nNOM
         zt/EJLRHKHUpwGXT+DU1kNAweaMYA0BP5Yo3zk7DVWf68XoP8FJC45rhlyuY9Gm+0sPc
         o71RYMJY+8zVLaYARtqTS3Pv+YiKfx4BNy+wte1Pi8m6XQ/zM098l8y6LGVuf/S+Ttdj
         c3lQ==
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
>>
>>>> The source binding in the Linux kernel tree can be found here:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/gpio/gpio.txt
>>>>
>>>> This patch is provided for review, but also as an exploration of
>>>> bringing a full binding file over from the Linux freeform text into the
>>>> specification document, and it shows the weakness of the current
>>>> approach. All of the work done on this patch gives the text more
>>>> structure and more formatting options, but it doesn't do anything to
>>>> make binding files machine readable. I intend to iterate this patch to
>>>> split the binding content off into a machine parsable file that can be
>>>> parsed to emit Sphinx markup. This patch can be considered as the
>>>> baseline.
>>
>> Ambitious! I like.
>>
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
>>
>>>> +In this model, the purpose of a GPIO signal is determined by the GPIO consumer
>>>> +node, which is entirely dependant on what device the consumer node represents.
>>>> +The GPIO controller does not make any assumptions about how GPIOs will be used.
>>
>> Good. That is a way of saying that when we say something is general purpose,
>> it is actually general purpose. Should be evident from the name, but given how
>> some electronics people call everything GPIO it needs to be pointed out
>> I guess.
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
>>
>>>> +The GPIO controller binding must describe what information is encoded into its gpio-specifier,
>>>> +which could include bank number, pin position, driver configuration, or signal inversion.
>>>> +Typically a GPIO controller will set ``#gpio-cells=<2>``, with the first cell encoding the signal number,
>>>> +and the second encoding flags for pin configuration.
>>
>> I don't see why we need to be vague and say "typically" here. It's
>> better if we just
>> mandate it. I think the few existing GPIO drivers using one cell are
>> an historical
>> artifact we should not standardize. We could just write "some older bindings use
>> one cell" or so, and say that this is deprecated.
>>
>> (I see the flags are specified under best practices, good!)
>>
>>>> +GPIO Consumer Nodes
>>
>> Mostly looks good!
>>
>>>> +GPIO Consumer Example
>>>> +~~~~~~~~~~~~~~~~~~~~~
>>>> +
>>>> +.. code-block:: dts
>>>> +
>>>> +    gpio1: gpio1 {
>>>> +        gpio-controller;
>>>> +        #gpio-cells = <2>;
>>>> +    };
>>>> +
>>>> +    gpio2: gpio2 {
>>>> +        gpio-controller;
>>>> +        #gpio-cells = <1>;
>>>> +    };
>>
>> I think maybe we should cut that #gpio-cells = <1> example.
>> Deprecate it IMO.
>>
>>>> +    gpio-consumer {
>>>> +        enable-gpios = <&gpio2 2>;
>>
>> Ditto. Use a twocell example instead.
>>
>>>> +        data-gpios = <&gpio1 12 0>,
>>>> +                     <&gpio1 13 0>,
>>>> +                     <&gpio1 14 0>,
>>>> +                     <&gpio1 15 0>;
>>
>> This is good.
>>
>>>> +GPIO Controller Nodes
>>>> +^^^^^^^^^^^^^^^^^^^^^
>>>> +
>>>> +Every GPIO controller node must contain an empty *gpio-controller* property,
>>>> +and a *gpio-cells* integer property, which indicates the number of cells in a
>>>> +``single-gpio``.
>>>> +
>>>> +.. tabularcolumns:: | l c l J |
>>>> +.. table:: GPIO Controller Properties
>>>> +
>>>> +   =================== ===== ================= ================================================
>>>> +   Property Name       Usage Value Type        Definition
>>>> +   =================== ===== ================= ================================================
>>>> +   ``#gpio-cells``     R     ``<u32>``         Specifies the number of ``<u32>`` cells to
>>>> +                                               represent the address in the ``reg`` property in
>>>> +                                               children of root.
>>
>> I would strongly recommend that this be <2>.
>>
>>>> +   ``gpio-controller`` R     ``<empty>``       Declares the device as a GPIO controller that
>>>> +                                               can be referenced using a ``single-gpio``
>>>> +   ``ngpios``          OR    ``<u32>``         Optional property describing the number
>>>> +                                               of GPIO signals provided by the controller.
>>>> +                                               This property may be used when the controller
>>>> +                                               provides fewer signals than the driver binding
>>>> +                                               supports. For example, a MMIO GPIO controller
>>>> +                                               with 32-bit registers might theoretically
>>>> +                                               support 32 GPIO signals, but only numbers 0
>>>> +                                               through 11 wired up. In this case
>>>> +                                               "ngpios = <12>;" should be set.
>>
>> Good that you include this!
>>
>>>> +   ``gpio-line-names`` O     ``<stringlist>``  An array of names for each of the GPIO signals
>>>> +                                               provided by the controller. This name should be
>>>> +                                               the most meaningful producer name for the
>>>> +                                               system, such as a rail name indicating the
>>>> +                                               usage. Package names such as pin names are
>>>> +                                               discouraged. For example, "MMC-CD",
>>>> +                                               "Red LED Vdd" and "Ethernet RST" are reasonable
>>>> +                                               line names as they describe what the line is
>>>> +                                               used for. Names like "GPIO0" are discouraged.
>>>> +                                               Additionally, placeholder names are discouraged.
>>>> +                                               If a signal does not have a name defined, then
>>>> +                                               use "" (blank string) as the placeholder.
>>
>> Very nice.
>>
>>>> +GPIO Specifier Best Practices
>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>> +
>>>> +How a ``gpio-specifier`` is encoded is defined by the GPIO controller binding,
>>>> +and so it allows quite a bit of flexibility to encode extra information required
>>>> +by the interrupt controller into the ``gpio-specifier`` itself.
>>>> +However, most GPIO controllers encode the same information so it is strongly recommended
>>>> +to follow established convention for ``gpio-specifier`` format.
>>>> +
>>>> +Established convention for ``gpio-specifier`` is to use either 2 or 3 cells to describe
>>>> +a GPIO signal depending on whether or not the GPIO controller provides multiple "banks"
>>>> +of GPIO registers.
>>
>> I don't understand this 3 cell idea here.
>>
>>>> +If the controller does use banks, then 3 cells should be used with the bank encoded
>>>> +into the first cell, the pin within the bank in the second, and the flags in the third
>>>> +cell.
>>
>> I would prefer not to encourage the use of bank specifiers.
>>
>> The best practice IMO is:
>>
>> (A) model the banks as one device node per bank with n (typically 32)
>>      lines per device/bank and reference with two cells (handle and flags).
>>
>> (B) represent all the GPIOs in the device as one long range, so if it is
>>     6 banks of 32 lines, just expose a GPIO device, with two cells and
>>     GPIO numbers 0..191.
>>
>> This is the most common in the kernel and I don't see why we should bring
>> in the three-cell pattern at all. It should be deprecated if present in bindings
>> IMO.
>
> We have to allow for oddball h/w in the spec even if 3 cells usually
> means you are doing it wrong.
>
>>>> +If the controller does not use banks, then 2 cells are sufficient; the first cell
>>>> +encoding the signal number and the second encoding the flags.
>>
>> I disagree per above.
>>
>>>> +Standard encoding for the flags cell are as follows
>>
>> Awesome, thanks for wrapping this up in the spec.
>>
>>>> +Example
>>
>> Example is nice and to the point.
>>
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
>
> Rob
