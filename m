From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] Describe chosen modules for hypervisor booting
Date: Mon, 24 Apr 2023 17:40:22 -0500
Message-ID: <CAL_JsqJeRO_Nz29RsF_rEZ6DK+h80VJsaGeWOUJr2Qv5hKeNBQ@mail.gmail.com>
References: <20230421164012.2867267-1-alex.bennee@linaro.org>
 <CAL_JsqJmtcmsqRB_oiFm-cx8KU-4FgywHxK+qUn=-FvKz1d0xw@mail.gmail.com> <alpine.DEB.2.22.394.2304241434130.3419@ubuntu-linux-20-04-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682376035;
        bh=EfQ2oviBMKFXpRuwHhoms6ABFpAm3yDmnb41IBx+N1o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SYjM/uckW7oKmtsth4RDxwtLpoYiNSJ6GK9+dsBw54yfNFw/LM9rn83+K4Mswqtan
         YB82lib6CiRTxwJP8ldj1v5HgonH1X/jv9TI1592WLCuXq24FdIZ4HzH7cM/2cnVFo
         L3L+8udPCP3Kk+16VUXhjd6jZQURARy1Uw6RcRTQEhjlpjX5yDLs3MCKuVEpODyIjT
         q2MDCp4ZMrFCzZS5oDdMwGsSg3FmS7WbOktiAWM42I9QAUp/+5JDPG1fb9hY8V7Fy9
         UGTPupYyCoSBZYrKQVC2cEQ8LBf0llsPac5XXEh67hVS2sZsFLcSJ63xP7ZOEwbVY1
         zWzVQRhIenX2w==
In-Reply-To: <alpine.DEB.2.22.394.2304241434130.3419@ubuntu-linux-20-04-desktop>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julien Grall <julien-LM2mM/qkH7s@public.gmane.org>, Carl van Schaik <cvanscha-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>

On Mon, Apr 24, 2023 at 4:49=E2=80=AFPM Stefano Stabellini
<sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Fri, 21 Apr 2023, Rob Herring wrote:
> > On Fri, Apr 21, 2023 at 11:40=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@=
linaro.org> wrote:
> > >
> > > When booting something like a hypervisor there is need to communicate
> > > to it how the first guest will be loaded. Typically the firmware or
> > > boot loader will put the kernel and ramdisk in memory and pass the
> > > information to the hypervisors boot code. This mechanism currently
> > > works with Xen on the Arm platform and would be equally applicable to
> > > other such hypervisors.
> >
> > This is probably something to discuss on the boot-architecture list.
> >
> > >
> > > However this specification doesn't address the needs of a dom0less
> > > system (where there is no "root" guest to launch the others) so is
> > > currently very much an RFC.
> >
> > In the end, whatever you want to add will need a DT schema. Really,
> > just a schema would be fine. Much of /chosen is not in the spec.
> >
> > > Signed-off-by: Alex Benn=C3=A9e <alex.bennee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > Cc: Julien Grall <julien-LM2mM/qkH7s@public.gmane.org>
> > > Cc: Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > Cc: Carl van Schaik <cvanscha-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>
> > > ---
> > >  source/chapter3-devicenodes.rst | 55 +++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 55 insertions(+)
> > >
> > > diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-device=
nodes.rst
> > > index 958257e..3c021a4 100644
> > > --- a/source/chapter3-devicenodes.rst
> > > +++ b/source/chapter3-devicenodes.rst
> > > @@ -488,6 +488,61 @@ For compatibility, a client program might want t=
o support
> > >  *linux,stdout-path* if a *stdout-path* property is not present. The =
meaning
> > >  and use of the two properties is identical.
> > >
> > > +``chosen`` modules
> > > +~~~~~~~~~~~~~~~~~~
> > > +
> > > +In a multi-stage boot, for example booting a hypervisor directly, th=
e
> > > +firmware may need to describe where the booting stage can find the
> > > +next bit of software. These are described with one or more ``module`=
`
> > > +nodes which describe where in memory the module can be found and how
> > > +to boot it. The ``module`` nodes should be filtered out from the DT
> > > +passed to the next stage.
> >
> > I think 'image' would be a bit clearer than 'module'.
>
> This is the existing documentation of the interface on the Xen side:
> docs/misc/arm/device-tree/booting.txt under xen.git.

Then is that something you want/need to maintain? Very much less an
RFC if that's the case.

> It was called "module" because it can be more than an image. For
> instance it could be an XSM binary configuration for the hypervisor, or
> it could be a device assignment configuration file.
>
>
> This brings me to raise the next point with Alex: we originally had the
> modules under /chosen but moved to using "domains" subnodes as described
> under "Creating Multiple Domains directly from Xen". So now the topology
> that we use is /chosen/domain0/module@e00000.
>
> The reason is that you can easily have half a dozen VMs each of them
> with their own kernel, ramdisk, and extra configuration modules. The
> domain subnode is necessary to figure out what belongs to what.
>
> If we are going to introduce modules, I think it would be a good idea to
> introduce domain nodes too. Modules without domains are very limited.
>
>
> Domains are interesting because system device tree has a very similar
> concept. In fact, system device tree domains were inspired by Xen
> domains too. However, thanks to community feedback in S-DT domain nodes
> were moved to /domains (originally they were under /chosen as described
> by docs/misc/arm/device-tree/booting.txt.) Whatever we decide to do, it
> would be good to keep the specs aligned.

Probably was my suggestion to move them out of /chosen.

> Note that domains in system device tree don't yet have modules
> described in the spec, because system device tree has been used at
> build time so far. Modules are typically dynamically populated by U-Boot
> at boot time. I would see it as a positive to also add modules to S-DT.

There is also now the old/new /option node which is for components
(u-boot) to configure themselves. Maybe that's a fit here?

> > > +
> > > +.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
> > > +.. table:: ``/chosen/module`` Node Properties
> > > +
> > > +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > +   Property Name           Usage Value Type            Definition
> > > +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > +   ``bootargs``            O     ``<string>``          A string that=
 specifies the boot arguments for
> > > +                                                       the client pr=
ogram. The value could
> > > +                                                       potentially b=
e a null string if no boot
> > > +                                                       arguments are=
 required.
> > > +   ``compatible``          OR    ``<string>``          Describes the=
 module, may contain the following
> > > +                                                       strings:
> > > +
> > > +                                                       - ``multiboot=
,kernel``: This indicates the
> > > +                                                         module is a=
 multiboot compatible
> > > +                                                         kernel imag=
e
> >
> > What does "multiboot compatible" mean?
>
> multiboot is an old grub specification used on x86 and other archs to
> load multiple binaries at boot (multiple as in more than 2). This
> specification came originally from our effort to introduce "multiboot"
> on ARM. We are talking about things done 10+ years ago now.

Not really looking for an explanation here, but the term needs to be
defined in the spec if it is used in the spec.

Convention is "vendor,foo" and I don't know that I'd call multiboot a vendo=
r.

Rob
