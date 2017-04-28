From: Freddie Chopin <freddie_chopin-FWhLrETftxM@public.gmane.org>
Subject: Re: How to describe internal flash (ROM) in the microcontroller
Date: Fri, 28 Apr 2017 17:20:46 +0200
Message-ID: <1493392846.1425.12.camel@op.pl>
References: <1492886823.1240.5.camel@op.pl>
         <20170424012734.GB16882@umbus.fritz.box> <1493364100.1425.6.camel@op.pl>
         <CAL_Jsq+Gbu35bps2VcQ=pO3WyQE9VZhsuvpKtZ3TJ++B10jPWA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1493392847; bh=zaizlyxUHcQvI6mp1uro143ar3/tzYk+JAzZLUsMXl8=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=AGn/Z++IEO632eQKV2jCYmggHJj6dN9zW75gPEbJUAHZbCMA0zCg6OaP/NSNvihm6
         GH64Vka51OPunD1qiYTh3fIQd2kGNPQyxN+FkNCtXKmKDFX55IUNRookqnRiZW9nSA
         e97Zmh3P+QVDJmCpOQv8kdQZzy4t7acRCGsLqc38=
In-Reply-To: <CAL_Jsq+Gbu35bps2VcQ=pO3WyQE9VZhsuvpKtZ3TJ++B10jPWA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: devicetree-spec <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hello Rob!

On Fri, 2017-04-28 at 07:59 -0500, Rob Herring wrote:
> > I'm not so sure about the "standardization" and "publication" part.
> > I
> > do realize that primary usage of devicetrees will be on "desktop
> > PC"
>=20
> PC's use ACPI.

Yes, what I wrote was wrong, because I was thinking about something
else (; I was thinking about devices capable of running a general
purpose operating system (like Linux), which are quite different from
microcontrollers. Sorry for the confusion, I have no idea why I wrote
about "PC" (;

> uC's capable of running Linux generally use DT, too.

You're right, and I'm targeting some of these microcontrollers too
(like STM32F4 or STM32F7). But my needs are a little bit different when
it comes to the "basics" (like on-chip flash memory, which is
completely ignored in Linux). I hope that's only an initial obstacle,
as I think using DT for typical peripherals like USART, SPI, DMA,
external hardware and so on will be very similar.

Generally my problems are not related to the hardware itself - it
doesn't really matter whether it's a small microcontroller of a
multicore applications processor. I think the root cause of the issues
I'm facing is that my "use case" (small embedded RTOS for
microcontrollers) is completely different from the use case of a huge
general purpose OS like Linux. I hope that this use case of mine is not
so different to be completely incompatible with devicetree (;

> > Anyway - a few more days with devicetree and I have another
> > question. I
> > don't want to start a new thread for that, as it is related to the
> > first one anyway. This one is harder, as I found no examples at
> > all, so
> > I have absolutely nothing to start with. There are microcontroller
> > cores which may or may not contain a floating-point unit (FPU) -
> > for
> > example ARM Cortex-M4 may have one or none. There are also
> > microcontroller cores which may contain either a single-precision
> > or
> > double-precision FPU - for example ARM Cortex-M7, which may have
> > either
> > fpv5-sp-d16 or fpv5-d16 FPU. Currently I include that info in the
> > kconfig system, where appropriate hidden options are set when
> > selecting
> > a particular chip model/family. As you may imagine I would also
> > like to
> > have that info in the devicetree. I see several options to express
> > that
> > information, but I'm not sure which one fits best.
>=20
> Doesn't the M7 have ID registers registers with define the FP
> capabilities? It should not be in DT if the feature is discoverable.
>=20
> Or are you trying to use DT at build time like Zephyr?

This is exactly my plan here. As I'm also targeting much smaller
devices, I'm planning to use DT only during compilation, with no
support for embedded binary devicetree blobs handled at run-time.
That's why I actually need some of the things which are discoverable to
be known during the build. For example if the device has no FPU, the
code to do context switching is much smaller (and faster) and uses less
stack space to save context. Other than that I will also need different
compiler flags to build the RTOS for targets with or without FPU. It
wouldn't be a good RTOS if the code size would be needlessly big... For
Linux is doesn't really matter whether the binary size is 10 or 11MB,
but here I'm dealing with targets which can have as little as a few
dozen kB of flash space for the whole executable, and typically
something around 128-256kB.

But you mentioned an important thing here - indeed DT contains (at
least it should) only the things which cannot be discovered during run-
time... So maybe my plan to add info about FPU to DT is not such a good
idea.

Generally for my project I need some way to easily describe "board"
(interfaces, external devices, GPIO pins, DMA channels, interrupts,
...), preferably in a single file, easily editable by hand. My current
plan is to use such "board description" to generate some real C++ code
with Python scripts - this code will define global objects (like serial
ports, GPIOs, EEPROM chips, ...), perform some low-level
initialization, configure interrupts and GPIOs, ... Some of that
functionality is already present and uses *.json file as input. But
after some reading I come to conclusion that there's no point in
inventing my own format to describe hardware, when there already is one
- devicetree. *.dts generally fits my needs pretty good, there are just
some small details which I need to handle somehow, and I'm still
thinking about the best way to integrate my concepts with kconfig and
build system.

> > 2. I could just add a non-standard property to cpu nodes (or maybe
> > to
> > cpus node?), something like:
> >=20
> > distortos,fpu =3D "fpv5-d16";
>=20
> Please don't. That would not scale if every OS out there did that.
>=20
> I would probably append something to the cpu compatible if you must.
> In any case, Zephyr folks are going to have the same problem, so we
> should have a common solution.

Do you mean "append" as "add suffix" (compatible =3D "arm,cortex-m7f";)
or "append" as "add another value" (compatible =3D "arm,cortex-m7",
"arm,fpv5-d16";)?

In case of Zephyr - from what I understand - for now part of the
configuration is inside kconfig anyway, and this includes the FPU
information. Maybe I should do the same and just associate the
"compatible" property of the chip with some kconfig part? For example I
would require the board's compatible to have the chip model like that:

/ {
    compatible =3D "some-board", "st,stm32f407vg";
    ...

Which I would then map somehow to a kconfig fragment, which would be
just:

select HAS_FPU
select HAS_MPU
...

This way I wouldn't have to "pollute" the devicetree with that info. Do
you think this would be the preferable solution here?

I'm still trying to get a good grasp of devicetree, so some of my
questions and ideas are probably completely dumb (I hope they don't
make you mad (; ). As I wrote above - probably 90% of my needs are
already covered by DT, but some of the concepts important for small
platforms require me to improvise (; These would generally stem from
the fact that OS like Linux uses "compiled" *.dts file in run-time,
while I want to use *.dts file only as an input format for source code
generator and maybe during project configuration/compilation (for
example to select proper piece of code=C2=A0to be compiled - like context
switching routine  for appropriate core, with or without FPU).

Another idea - maybe I should just include every such "non-standard"
information in /chosen?

Thanks for the advices already offered and thanks in advance for any
further guidance you could share with me!

Regards,
FCh
