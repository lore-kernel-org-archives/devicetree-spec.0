From: Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] Describe chosen modules for hypervisor booting
Date: Mon, 24 Apr 2023 14:49:30 -0700 (PDT)
Message-ID: <alpine.DEB.2.22.394.2304241434130.3419@ubuntu-linux-20-04-desktop>
References: <20230421164012.2867267-1-alex.bennee@linaro.org> <CAL_JsqJmtcmsqRB_oiFm-cx8KU-4FgywHxK+qUn=-FvKz1d0xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-470876047-1682372972=:3419"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682372973;
        bh=OTMwkwwB/dhXscNo8O4puqcv1yaU0FIQtQ/FIkc97jA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=UHzSB76UmREOkbQL2SoSKY7nMeJSTzm3RcE7imgyE1S7g2sHkk5PYGGaehRCjGTN9
         C/R+BE3Q4j8z7rb2lGleycPOBAaY2r+UsFrhZMIhhB2crbTWJp+nnAld2RbcsKeSZz
         y9th3LyzgLWsw51BxRwVwWbhFP+/4EFgLCBIlTHCR3zokzVyzQv0R70VcotiX4QtOP
         tAyuUzbAvARD+7N7K9kck5VGqK7Wz5vH5agQ9CqMSuLsDRopj/xLja1v9mOr7Wa92T
         To+Aym3fXJdDk2rqa1YF+eL8jGHr0kAzuZwdN6ekkxA4h1OdtsC/PA3ZSrfnJrnbXX
         LtYBRq0CRLusA==
In-Reply-To: <CAL_JsqJmtcmsqRB_oiFm-cx8KU-4FgywHxK+qUn=-FvKz1d0xw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julien Grall <julien-LM2mM/qkH7s@public.gmane.org>, Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Carl van Schaik <cvanscha-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-470876047-1682372972=:3419
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 21 Apr 2023, Rob Herring wrote:
> On Fri, Apr 21, 2023 at 11:40 AM Alex Bennée <alex.bennee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >
> > When booting something like a hypervisor there is need to communicate
> > to it how the first guest will be loaded. Typically the firmware or
> > boot loader will put the kernel and ramdisk in memory and pass the
> > information to the hypervisors boot code. This mechanism currently
> > works with Xen on the Arm platform and would be equally applicable to
> > other such hypervisors.
> 
> This is probably something to discuss on the boot-architecture list.
> 
> >
> > However this specification doesn't address the needs of a dom0less
> > system (where there is no "root" guest to launch the others) so is
> > currently very much an RFC.
> 
> In the end, whatever you want to add will need a DT schema. Really,
> just a schema would be fine. Much of /chosen is not in the spec.
> 
> > Signed-off-by: Alex Bennée <alex.bennee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Julien Grall <julien-LM2mM/qkH7s@public.gmane.org>
> > Cc: Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Carl van Schaik <cvanscha-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>
> > ---
> >  source/chapter3-devicenodes.rst | 55 +++++++++++++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >
> > diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenodes.rst
> > index 958257e..3c021a4 100644
> > --- a/source/chapter3-devicenodes.rst
> > +++ b/source/chapter3-devicenodes.rst
> > @@ -488,6 +488,61 @@ For compatibility, a client program might want to support
> >  *linux,stdout-path* if a *stdout-path* property is not present. The meaning
> >  and use of the two properties is identical.
> >
> > +``chosen`` modules
> > +~~~~~~~~~~~~~~~~~~
> > +
> > +In a multi-stage boot, for example booting a hypervisor directly, the
> > +firmware may need to describe where the booting stage can find the
> > +next bit of software. These are described with one or more ``module``
> > +nodes which describe where in memory the module can be found and how
> > +to boot it. The ``module`` nodes should be filtered out from the DT
> > +passed to the next stage.
> 
> I think 'image' would be a bit clearer than 'module'.

This is the existing documentation of the interface on the Xen side:
docs/misc/arm/device-tree/booting.txt under xen.git.

It was called "module" because it can be more than an image. For
instance it could be an XSM binary configuration for the hypervisor, or
it could be a device assignment configuration file.


This brings me to raise the next point with Alex: we originally had the
modules under /chosen but moved to using "domains" subnodes as described
under "Creating Multiple Domains directly from Xen". So now the topology
that we use is /chosen/domain0/module@e00000.

The reason is that you can easily have half a dozen VMs each of them
with their own kernel, ramdisk, and extra configuration modules. The
domain subnode is necessary to figure out what belongs to what.

If we are going to introduce modules, I think it would be a good idea to
introduce domain nodes too. Modules without domains are very limited.


Domains are interesting because system device tree has a very similar
concept. In fact, system device tree domains were inspired by Xen
domains too. However, thanks to community feedback in S-DT domain nodes
were moved to /domains (originally they were under /chosen as described
by docs/misc/arm/device-tree/booting.txt.) Whatever we decide to do, it
would be good to keep the specs aligned.

Note that domains in system device tree don't yet have modules
described in the spec, because system device tree has been used at
build time so far. Modules are typically dynamically populated by U-Boot
at boot time. I would see it as a positive to also add modules to S-DT.


> > +
> > +.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
> > +.. table:: ``/chosen/module`` Node Properties
> > +
> > +   ======================= ===== ===================== ===============================================
> > +   Property Name           Usage Value Type            Definition
> > +   ======================= ===== ===================== ===============================================
> > +   ``bootargs``            O     ``<string>``          A string that specifies the boot arguments for
> > +                                                       the client program. The value could
> > +                                                       potentially be a null string if no boot
> > +                                                       arguments are required.
> > +   ``compatible``          OR    ``<string>``          Describes the module, may contain the following
> > +                                                       strings:
> > +
> > +                                                       - ``multiboot,kernel``: This indicates the
> > +                                                         module is a multiboot compatible
> > +                                                         kernel image
> 
> What does "multiboot compatible" mean?

multiboot is an old grub specification used on x86 and other archs to
load multiple binaries at boot (multiple as in more than 2). This
specification came originally from our effort to introduce "multiboot"
on ARM. We are talking about things done 10+ years ago now.


> > +
> > +                                                       - ``multiboot,ramdisk``:
> > +                                                         This indicates the module is a ramdisk
> > +                                                         image. Kernels confirming to the
> > +                                                         multiboot spec will expect to be
> > +                                                         pointed to the ramdisk as part of
> > +                                                         the boot information
> 
> Why don't the existing initrd properties work?
> 
> > +   Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
> > +   ===================================================================================================
> > +
> > +**Example**
> > +
> > +.. code-block:: dts
> > +
> > +    chosen {
> > +            bootargs = "dom0_mem=128M loglvl=all guest_loglvl=all";
> > +            stdout-path = "/pl011@9000000";
> > +
> > +            module@0x47000000 {
> > +                    bootargs = "console=hvc0";
> > +                    compatible = "multiboot,module\0multiboot,kernel";
> > +                    reg = <0x00 0x47000000 0x00 0xe47a00>;
> > +            };
> > +    };
> > +
> > +In this example the root bootargs are passed to the first stage and
> > +configure the hypervisor with the module being a kernel image that the
> > +hypervisor will boot with specific arguments for the guests kernel.
> > +
> >  ``/cpus`` Node Properties
> >  -------------------------
> >
> > --
> > 2.39.2
> >
> 
--8323329-470876047-1682372972=:3419--
