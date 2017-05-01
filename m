From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: How to describe internal flash (ROM) in the microcontroller
Date: Mon, 1 May 2017 14:38:19 +1000
Message-ID: <20170501043819.GE13773@umbus.fritz.box>
References: <1492886823.1240.5.camel@op.pl>
 <20170424012734.GB16882@umbus.fritz.box>
 <1493364100.1425.6.camel@op.pl>
 <CAL_Jsq+Gbu35bps2VcQ=pO3WyQE9VZhsuvpKtZ3TJ++B10jPWA@mail.gmail.com>
 <1493392846.1425.12.camel@op.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="brEuL7wsLY8+TuWz"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1493613954;
        bh=OMbLLXoh1na0+OmFqvdPUEaAOzaL8Hovti1lF+L/AJY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lyqnJcDKov5PSut9Yd6cBGqK4d4tQKVaYM3lV4BUBCSTl1s2xfM3KlfsXX1kUjgwg
         cingmBa/kKEHEM8Rf0lrMZhn0oI053+j3SXkqPBYqj0baClF97Sfs+MUvXD3L7i3wW
         Dqjcjz5cm6mR9Auva38jkmcBIJZoK4U2w/xqpeI0=
Content-Disposition: inline
In-Reply-To: <1493392846.1425.12.camel-FWhLrETftxM@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Freddie Chopin <freddie_chopin-FWhLrETftxM@public.gmane.org>
Cc: devicetree-spec <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--brEuL7wsLY8+TuWz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2017 at 05:20:46PM +0200, Freddie Chopin wrote:
> Hello Rob!
>=20
> On Fri, 2017-04-28 at 07:59 -0500, Rob Herring wrote:
> > > I'm not so sure about the "standardization" and "publication" part.
> > > I
> > > do realize that primary usage of devicetrees will be on "desktop
> > > PC"
> >=20
> > PC's use ACPI.
>=20
> Yes, what I wrote was wrong, because I was thinking about something
> else (; I was thinking about devices capable of running a general
> purpose operating system (like Linux), which are quite different from
> microcontrollers. Sorry for the confusion, I have no idea why I wrote
> about "PC" (;
>=20
> > uC's capable of running Linux generally use DT, too.
>=20
> You're right, and I'm targeting some of these microcontrollers too
> (like STM32F4 or STM32F7). But my needs are a little bit different when
> it comes to the "basics" (like on-chip flash memory, which is
> completely ignored in Linux). I hope that's only an initial obstacle,
> as I think using DT for typical peripherals like USART, SPI, DMA,
> external hardware and so on will be very similar.
>=20
> Generally my problems are not related to the hardware itself - it
> doesn't really matter whether it's a small microcontroller of a
> multicore applications processor. I think the root cause of the issues
> I'm facing is that my "use case" (small embedded RTOS for
> microcontrollers) is completely different from the use case of a huge
> general purpose OS like Linux. I hope that this use case of mine is not
> so different to be completely incompatible with devicetree (;

So far it doesn't sound like it.  It really just seems that you need
some details that have so far been left out because Linux doesn't
typically need them.

> > > Anyway - a few more days with devicetree and I have another
> > > question. I
> > > don't want to start a new thread for that, as it is related to the
> > > first one anyway. This one is harder, as I found no examples at
> > > all, so
> > > I have absolutely nothing to start with. There are microcontroller
> > > cores which may or may not contain a floating-point unit (FPU) -
> > > for
> > > example ARM Cortex-M4 may have one or none. There are also
> > > microcontroller cores which may contain either a single-precision
> > > or
> > > double-precision FPU - for example ARM Cortex-M7, which may have
> > > either
> > > fpv5-sp-d16 or fpv5-d16 FPU. Currently I include that info in the
> > > kconfig system, where appropriate hidden options are set when
> > > selecting
> > > a particular chip model/family. As you may imagine I would also
> > > like to
> > > have that info in the devicetree. I see several options to express
> > > that
> > > information, but I'm not sure which one fits best.
> >=20
> > Doesn't the M7 have ID registers registers with define the FP
> > capabilities? It should not be in DT if the feature is discoverable.
> >=20
> > Or are you trying to use DT at build time like Zephyr?
>=20
> This is exactly my plan here. As I'm also targeting much smaller
> devices, I'm planning to use DT only during compilation, with no
> support for embedded binary devicetree blobs handled at run-time.
> That's why I actually need some of the things which are discoverable to
> be known during the build. For example if the device has no FPU, the
> code to do context switching is much smaller (and faster) and uses less
> stack space to save context. Other than that I will also need different
> compiler flags to build the RTOS for targets with or without FPU. It
> wouldn't be a good RTOS if the code size would be needlessly big... For
> Linux is doesn't really matter whether the binary size is 10 or 11MB,
> but here I'm dealing with targets which can have as little as a few
> dozen kB of flash space for the whole executable, and typically
> something around 128-256kB.

Ok.  Using the DT at build time does complicate things a bit, but
probably not fatally.

> But you mentioned an important thing here - indeed DT contains (at
> least it should) only the things which cannot be discovered during run-
> time... So maybe my plan to add info about FPU to DT is not such a good
> idea.

So, usually, yes, leaving out run-time discoverable information is a
good idea.  But again, there are definitely some grey areas and
trade-offs here.  In fact on POWER servers (where the device tree
content originates, though not the flattened encoding) it's quite
common to have run-time discoverable things duplicated in the device
tree.  Generally that's either because they wanted to encourage OSes
to generalize to allow them to support potential future devices
without code changes, or because they wanted to allow firmware to
filter the available features by changing what was advertised.

There can be some overlap there: virtualization can give you guest
cpus that are missing features that the model theoretically always
has, because the hypervisor won't let you have access to it.

So I don't think it's unreasonable for you to add some information
like this, even if it's theoretically runtime discoverable.  Some more
discussion of this below..

> Generally for my project I need some way to easily describe "board"
> (interfaces, external devices, GPIO pins, DMA channels, interrupts,
> ...), preferably in a single file, easily editable by hand. My current
> plan is to use such "board description" to generate some real C++ code
> with Python scripts - this code will define global objects (like serial
> ports, GPIOs, EEPROM chips, ...), perform some low-level
> initialization, configure interrupts and GPIOs, ... Some of that
> functionality is already present and uses *.json file as input. But
> after some reading I come to conclusion that there's no point in
> inventing my own format to describe hardware, when there already is one
> - devicetree. *.dts generally fits my needs pretty good, there are just
> some small details which I need to handle somehow, and I'm still
> thinking about the best way to integrate my concepts with kconfig and
> build system.

So.  The disctinction between runtime discoverable and not information
is actually not super important.  It's ok for the dt to have redundant
information, as long as it has enough; the OS will just ignore bits it
doesn't need, after all.

What is important is to distinguish between true hardware information
- what the hardware is capable of - and configuration information -
a suggested way to use it.  Restricting the DT to the former and the
latter is pretty important.  But even there, there's quite a lot of
grey areas.

For example, is the way firmware has set things up hardware
information or configuration.  In some cases the "firmware" might
include the hypervisor, so how you use things is enforced and might
not otherwise be discoverable.  In other cases it might be technically
not hardware information - the OS could use things a different way -
but doing so would badly violate platform conventions.  For example it
would mean the OS doing low-level reprogramming of board logic which
is usually set up by the firmware and left that way.  In that case
it can be best on balance to include the information in the device
tree, even though it's technically configuration and not hardware.

Then there's things that really are OS configuration, but it's just
awkward not to include.  Those can be ok if 1) kept to a minimum, 2)
clearly prefixed with vendor/OS tags, 3) are present *as well as* all
the necessary hardware information, not instead of.

> > > 2. I could just add a non-standard property to cpu nodes (or maybe
> > > to
> > > cpus node?), something like:
> > >=20
> > > distortos,fpu =3D "fpv5-d16";
> >=20
> > Please don't. That would not scale if every OS out there did that.
> >=20
> > I would probably append something to the cpu compatible if you must.
> > In any case, Zephyr folks are going to have the same problem, so we
> > should have a common solution.

Hm.  So, I'm not terribly familiar with ARM, so that might mislead
me.  But this actually wouldn't be my first choice.

There are existing CPU bindings which include additional properties
giving lists or bitmasks of optional features.  For example the PAPR
standard requires this for guest device trees on POWER.  It also
requires that there be a 'cpu-version' property which gives the
"logical PVR" which the OS is supposed to look at in most cases
instead of the physically discoverable PVR register contents.  This
has applications for CPUs put into compatibility modes for
virtualization, so the use case isn't a perfect match, but the ideas
may be adaptable.

What *is* a really good rule of thumb is don't invent a new way of
encoding this information if you can possibly avoid it.  I don't know
if the few cases of DT being used on x86 have something similar, but
if they do I'd expect it to use the same bitmask as the cpuid
instruction returns.  In your case, if there are existing (read only)
registers that give the information you need, you could mirror their
value into the device tree


> Do you mean "append" as "add suffix" (compatible =3D "arm,cortex-m7f";)
> or "append" as "add another value" (compatible =3D "arm,cortex-m7",
> "arm,fpv5-d16";)?
>=20
> In case of Zephyr - from what I understand - for now part of the
> configuration is inside kconfig anyway, and this includes the FPU
> information. Maybe I should do the same and just associate the
> "compatible" property of the chip with some kconfig part? For example I
> would require the board's compatible to have the chip model like that:
>=20
> / {
>     compatible =3D "some-board", "st,stm32f407vg";
>     ...
>=20
> Which I would then map somehow to a kconfig fragment, which would be
> just:
>=20
> select HAS_FPU
> select HAS_MPU
> ...
>=20
> This way I wouldn't have to "pollute" the devicetree with that info. Do
> you think this would be the preferable solution here?
>=20
> I'm still trying to get a good grasp of devicetree, so some of my
> questions and ideas are probably completely dumb (I hope they don't
> make you mad (; ). As I wrote above - probably 90% of my needs are
> already covered by DT, but some of the concepts important for small
> platforms require me to improvise (; These would generally stem from
> the fact that OS like Linux uses "compiled" *.dts file in run-time,
> while I want to use *.dts file only as an input format for source code
> generator and maybe during project configuration/compilation (for
> example to select proper piece of code=A0to be compiled - like context
> switching routine  for appropriate core, with or without FPU).
>=20
> Another idea - maybe I should just include every such "non-standard"
> information in /chosen?
>=20
> Thanks for the advices already offered and thanks in advance for any
> further guidance you could share with me!
>=20
> Regards,
> FCh

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--brEuL7wsLY8+TuWz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZBru4AAoJEGw4ysog2bOS4WAP/0roPLb7x7tLAYAg3FkmSLEH
CHtpchXNHYKXqIpbAjuvAwcVlI4Y+QClayUmUyRglUpaSn8+L200LhtL1MKGv9eu
H/EW8zCU1GC33r2vxcJ3Sy/dU3NTLTS5p2vY7kqzDK2FEO4eyPwVFQdWGJbFG6zw
Pfn8CLM4ZzqDhz+Z3qdbZkA11TOE0Yyb6dnGKBrVM1Q9g87gEB6f1yGDb30Fh9ES
EjTIL/4/sGqUXfPfChUpT2B3PJFwubjbBVqMqQayPHUH4duYW2HuhEY638Ny/1qx
Io9R1MYA/Z3bMBtbbIqnYvW17MbbLa5od51BqDIrxdESigX5ZnjKyLWMtYdZu4yP
+RrOZrFvu3q4fl4f4xgfKV03QM202N2UAnTAdZgMdjwze2qQIHTWAxHSR/cGoQMc
clXsxsthhFQPGci4kgL5CWiimprzRdzcoSLFKaFNED/KdS/kOakw6DKv1u3aTOVo
0D+7RtevgfHQYv+iQzHtujFswcYuuVNigpP7WSRxnMmXMy/yGOIlhRJLTUDOjDs1
s9uC+562XENiKtkyTvjwmqUHFkyLSw7v81ovPD891d7wuU/6vMLKmKzuYS9aaQeE
N5OEas0xnkP4K/DMWYWGxPyFT0HzWzHQRpKAlQm9HXpN0SmHNhyqi0sjkj/Cebvw
AjBbclAR4DUtORbal819
=TFVn
-----END PGP SIGNATURE-----

--brEuL7wsLY8+TuWz--
