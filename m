From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: How to describe internal flash (ROM) in the microcontroller
Date: Fri, 28 Apr 2017 07:59:43 -0500
Message-ID: <CAL_Jsq+Gbu35bps2VcQ=pO3WyQE9VZhsuvpKtZ3TJ++B10jPWA@mail.gmail.com>
References: <1492886823.1240.5.camel@op.pl> <20170424012734.GB16882@umbus.fritz.box>
 <1493364100.1425.6.camel@op.pl>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493364100.1425.6.camel-FWhLrETftxM@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Freddie Chopin <freddie_chopin-FWhLrETftxM@public.gmane.org>
Cc: devicetree-spec <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Fri, Apr 28, 2017 at 2:21 AM, Freddie Chopin <freddie_chopin-FWhLrETftxM@public.gmane.org> wrote:
> Hello again!
>
> On Mon, 2017-04-24 at 11:27 +1000, David Gibson wrote:
>> Right, so basically you need a binding for your flash device - a
>> binding is the formal description of how a particular sort of device
>> should be represented in the device tree.  It's not uncommon for new
>> ports to require a few new bindings for "system" devices.
>>
>> First off, I think you want option 1, more or less.  Although I think
>> it originally had a wider meaning, for a long time memory@ nodes have
>> been used pretty much exclusively for general purpose RAM.  I
>> wouldn't
>> suggest overloading that binding for something quite different.
>>
>> I guess in theory I should tell you that all bindings shoul be made
>> clearly, standardized, published and so forth.  In practice, well,
>> it's a tradeoff.  Getting a binding reviewed, published and so forth
>> will generally improve its quality, mean less work for others who use
>> the device in the future and other good things.  On the other hand it
>> it can be a lot of work.  It's definitely worth it for common
>> devices;
>> maybe not so much for board-specific one-offs.
>>
>> Obviously, the first step is to look for an existing binding for the
>> device.  How to establish and maintain a canonical repository of
>> bindings is a subject of continuing debate.  In the meantime the
>> places to look are Documentation/devicetree/bindings in the Linux
>> kernel source, and devicetree.org.  There may be other places, but I
>> don't know them off hand.
>>
>> From the description of your device, I kind of doubt there's an
>> existing binding, though.  So you'll need to write one.  Good news is
>> your device is pretty simple - you can probably copy a binding for a
>> similar device, and just change the 'compatible' value and make any
>> few tweaks you need.
>>
>> I do recommend posting your draft binding here and getting at least
>> cursory new.  If you're new to writing bindings, there are a fair few
>> gotchas - things that might not make the binding unusable, but will
>> differ from existing conventions enough to make life harder for
>> people.
>
> Thank you David for your reply! When I have something ready, I'll post
> it here in the hope of some review. As you noticed - this "device" is
> indeed extremely simple, so I hope it won't be that hard (;
>
> I'm not so sure about the "standardization" and "publication" part. I
> do realize that primary usage of devicetrees will be on "desktop PC"

PC's use ACPI.

> and the use in microcontrollers is just an interesting curiosity for
> now. Apart from the Zephyr project which I mentioned, I only found one
> more project for microcontrollers which was using *.dts files - the
> F4OS, which unfortunately seems dead. And if Zephyr didn't bother to
> standarize and publish anything... (; We'll see how things will evolve.

uC's capable of running Linux generally use DT, too.

> Anyway - a few more days with devicetree and I have another question. I
> don't want to start a new thread for that, as it is related to the
> first one anyway. This one is harder, as I found no examples at all, so
> I have absolutely nothing to start with. There are microcontroller
> cores which may or may not contain a floating-point unit (FPU) - for
> example ARM Cortex-M4 may have one or none. There are also
> microcontroller cores which may contain either a single-precision or
> double-precision FPU - for example ARM Cortex-M7, which may have either
> fpv5-sp-d16 or fpv5-d16 FPU. Currently I include that info in the
> kconfig system, where appropriate hidden options are set when selecting
> a particular chip model/family. As you may imagine I would also like to
> have that info in the devicetree. I see several options to express that
> information, but I'm not sure which one fits best.

Doesn't the M7 have ID registers registers with define the FP
capabilities? It should not be in DT if the feature is discoverable.

Or are you trying to use DT at build time like Zephyr?

> 1. In some places the cores which have FPU are suffixed with "F" ("ARM
> Cortex-M4" becomes "ARM Cortex-M4F"), so I'm considering embedding that
> info inside "compatible" string of the cpu nodes (for example
> "arm,cortex-m4" or "arm,cortex-m4f"). The problem here is that this
> naming is not official and this wouldn't allow to differentiate between
> different types of FPU (for example - does "arm,cortex-m7f" have
> single-precision or double-precision FPU).
>
> 2. I could just add a non-standard property to cpu nodes (or maybe to
> cpus node?), something like:
>
> distortos,fpu = "fpv5-d16";

Please don't. That would not scale if every OS out there did that.

I would probably append something to the cpu compatible if you must.
In any case, Zephyr folks are going to have the same problem, so we
should have a common solution.

> 3. I could add FPU as a new node, where I could describe it with the
> standard "compatible" property. I think this is actually the best
> approach, but I'm having hard time thinking about location of such node
> - should it be placed in the root of the devicetree, or maybe as a
> child of the cpu node? The second variant seems to be the best one, as
> it fits the scenario of Asymmetric Multiprocessing, where the FPU may
> be present only on selected cores.
>
> Could anyone share any pointers on that matter? Again - thanks in
> advance!
>
> Regards,
> FCh
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
