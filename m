From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] Import /reserved-memory specification text
Date: Thu, 17 Sep 2020 11:09:19 +0200
Message-ID: <20200917090919.GA3511606@ulmo>
References: <20200915170455.32520-1-grant.likely@arm.com>
 <20200915170455.32520-2-grant.likely@arm.com>
 <17b980e5-97e7-8afa-3d51-c462f2fe91ff@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <17b980e5-97e7-8afa-3d51-c462f2fe91ff-5wv7dgnIgG8@public.gmane.org>
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600333724; bh=64pBnAgP7m/ouLsulacS1qOSNusPfBWQUq36oaYpmBU=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:In-Reply-To:X-NVConfidentiality:User-Agent:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Disposition;
        b=gHP0gzLROwoppYjIkzU2LNQO4NqOTJ5RInX6ZLz4REZY1tEHP+U/2verTYUmXZKmZ
         bTJDC2DZ194aD123TsiyLRpBxSo4/qRGfHPnJKhlMPjpGgp6rWpoIyT/RO2mPG1rMy
         B41x4BPu+I/2kTuY5+CLmnBbwGxh78tSrpdZc8Qs/eVNK80IDcgWVLp1jcSOdxvgru
         u1bYujpJoalW5wEQ29Kq/k7nPxCPQIekY0SGF8NYlf07CslXCJwawucRsHFQV5nflX
         j5IueIYA0ZoOw1CJxPxK3E5XaqdL99fXTl9cxLNXiVdXRcM/st3Utum/U1PSHg6hM6
         WPuIvPypU7fXA==
List-ID: <devicetree-spec.vger.kernel.org>
To: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nd-5wv7dgnIgG8@public.gmane.org, Ard Biesheuvel <ardb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif-e2DmVA6dwcVWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 10:00:35AM +0100, Grant Likely wrote:
> [+Thierry]
>=20
> Thierry, earlier this year you added the memory-region-names property to =
the
> reserved-memory binding. I'd like to move the whole binding into the
> devicetree specification (the patch below). Since you're one of the people
> who touched this document, can I get an 'Acked-by' from you to confirm I =
can
> copy your text over into a CC-BY-SA licensed document?

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> On 15/09/2020 18:04, Grant Likely wrote:
> > Imported from linux kernel source:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> >=20
> > Very minor editorial changes made while importing, with one exception.
> > Added clause that the 'no-map' and 'reusable' properties are mutually
> > exclusive.
> >=20
> > Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
> > Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> > Cc: Ard Biesheuvel <ardb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> >   source/chapter3-devicenodes.rst | 203 +++++++++++++++++++++++++++++++-
> >   1 file changed, 202 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-deviceno=
des.rst
> > index 3aa4650..3043b8a 100644
> > --- a/source/chapter3-devicenodes.rst
> > +++ b/source/chapter3-devicenodes.rst
> > @@ -161,7 +161,8 @@ If the VLE storage attribute is supported, with VLE=
=3D0.
> >      :ref:`sect-standard-properties`) are allowed but are optional.
> > -**Examples**
> > +``/memory`` Examples
> > +~~~~~~~~~~~~~~~~~~~~
> >   Given a 64-bit Power system with the following physical memory layout:
> > @@ -200,6 +201,206 @@ memory ranges. The 2 GB I/O region is skipped. No=
te that the
> >   value of 2, which means that two 32-bit cells are required to define =
the
> >   address and length for the ``reg`` property of the memory node.
> > +``/reserved-memory`` Node
> > +-------------------------
> > +
> > +Reserved memory is specified as a node under the ``/reserved-memory`` =
node.
> > +The operating system shall exclude reserved memory from normal usage
> > +one can create child nodes describing particular reserved (excluded fr=
om
> > +normal use) memory regions.
> > +Such memory regions are usually designed for the special usage by vari=
ous
> > +device drivers.
> > +
> > +Parameters for each memory region can be encoded into the device tree
> > +with the following nodes:
> > +
> > +/reserved-memory parent node
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
> > +.. table:: /reserved-memory Parent Node Properties
> > +
> > +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +   Property Name       Usage Value Type        Definition
> > +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +   ``#address-cells``  R     ``<u32>``         Specifies the number of=
 ``<u32>`` cells to
> > +                                               represent the address i=
n the ``reg`` property in
> > +                                               children of root.
> > +   ``#size-cells``     R     ``<u32>``         Specifies the number of=
 ``<u32>`` cells to
> > +                                               represent the size in t=
he ``reg`` property in
> > +                                               children of root.
> > +   ``ranges``          R     ``<prop encoded   This property represent=
s the mapping between
> > +                             array>``          parent address to child=
 address spaces (see
> > +                                               section :ref:`sect-stan=
dard-properties-ranges`,
> > +                                               ranges).
> > +   Usage legend: R=3DRequired, O=3DOptional, OR=3DOptional but Recomme=
nded, SD=3DSee Definition
> > +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +``#address-cells`` and ``#size-cells`` should use the same values as f=
or the root node,
> > +and ``ranges`` should be empty so that address translation logic works=
 correctly.
> > +
> > +/reserved-memory/ child nodes
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Each child of the reserved-memory node specifies one or more regions of
> > +reserved memory. Each child node may either use a ``reg`` property to
> > +specify a specific range of reserved memory, or a ``size`` property wi=
th
> > +optional constraints to request a dynamically allocated block of memor=
y.
> > +
> > +Following the generic-names recommended practice, node names should
> > +reflect the purpose of the node (ie. "*framebuffer*" or "*dma-pool*").
> > +Unit address (``@<address>``) should be appended to the name if the no=
de
> > +is a static allocation.
> > +
> > +A reserved memory node requires either a ``reg`` property for static
> > +allocations, or a ``size`` property for dynamics allocations.
> > +Dynamic allocations may use ``alignment`` and ``alloc-ranges`` propert=
ies
> > +to constrain where the memory is allocated from.
> > +If both ``reg`` and ``size`` are present, then the region is treated a=
s a
> > +static allocation with the ``reg`` property taking precedence and ``si=
ze``
> > +is ignored.
> > +
> > +.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
> > +.. table:: ``/reserved-memory/`` Child Node Properties
> > +
> > +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +   Property Name           Usage Value Type                Definition
> > +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +   ``reg``                 O      ``<prop-encoded-array>`` Consists of=
 an arbitrary number of address and
> > +                                                           size pairs =
that specify the physical address
> > +                                                           and size of=
 the memory ranges.
> > +   ``size``                O      ``<prop-encoded-array>`` Size in byt=
es of memory to reserve for
> > +                                                           dynamically=
 allocated regions.
> > +                                                           Size of thi=
s property is based on parent node's
> > +                                                           ``#size-cel=
ls`` property.
> > +   ``alignment``           O      ``<prop-encoded-array>`` Address bou=
ndary for alignment of allocation.
> > +                                                           Size of thi=
s property is based on parent node's
> > +                                                           ``#size-cel=
ls`` property.
> > +   ``alloc-ranges``        O      ``<prop-encoded-array>`` Specifies r=
egions of memory that are acceptable
> > +                                                           to allocate=
 from.
> > +                                                           Format is (=
address, length pairs) tuples in
> > +                                                           same format=
 as for ``reg`` properties.
> > +   ``compatible``          O      ``<stringlist>``         May contain=
 the following strings:
> > +
> > +                                                           - ``shared-=
dma-pool``: This indicates a region of
> > +                                                             memory me=
ant to be used as a shared pool of DMA
> > +                                                             buffers f=
or a set of devices.
> > +                                                             It can be=
 used by an operating system to
> > +                                                             instantia=
te the necessary pool management
> > +                                                             subsystem=
 if necessary.
> > +
> > +                                                           - vendor sp=
ecific string in the form
> > +                                                             ``<vendor=
>,[<device>-]<usage>``
> > +   ``no-map``              O      ``<empty>``              If present,=
 indicates the operating system must
> > +                                                           not create =
a virtual mapping of the region as
> > +                                                           part of its=
 standard mapping of system memory,
> > +                                                           nor permit =
speculative access to it under any
> > +                                                           circumstanc=
es other than under the control of
> > +                                                           the device =
driver using the region.
> > +   ``reusable``            O      ``<empty>``              The operati=
ng system can use the memory in this
> > +                                                           region with=
 the limitation that the device
> > +                                                           driver(s) o=
wning the region need to be able to
> > +                                                           reclaim it =
back.
> > +                                                           Typically t=
hat means that the operating system
> > +                                                           can use tha=
t region to store volatile or cached
> > +                                                           data that c=
an be otherwise regenerated or
> > +                                                           migrated el=
sewhere.
> > +   Usage legend: R=3DRequired, O=3DOptional, OR=3DOptional but Recomme=
nded, SD=3DSee Definition
> > +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +.. note:: All other standard properties (section
> > +   :ref:`sect-standard-properties`) are allowed but are optional.
> > +
> > +The ``no-map`` and ``reusable`` properties are mutually exclusive and =
both must
> > +not be used together in the same node.
> > +
> > +Linux implementation notes:
> > +
> > +- If a ``linux,cma-default`` property is present, then Linux will use =
the
> > +  region for the default pool of the contiguous memory allocator.
> > +
> > +- If a ``linux,dma-default`` property is present, then Linux will use =
the
> > +  region for the default pool of the consistent DMA allocator.
> > +
> > +Device node references to reserved memory
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Regions in the ``/reserved-memory`` node may be referenced by other de=
vice
> > +nodes by adding a ``memory-region`` property to the device node.
> > +
> > +.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
> > +.. table:: Properties for referencing reserved-memory regions
> > +
> > +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +   Property Name           Usage Value Type                Definition
> > +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +   ``memory-region``       O     ``<prop-encoded-array>``  phandle, sp=
ecifier pairs to children of
> > +                                                           ``/reserved=
-memory``
> > +   ``memory-region-names`` O     ``<stringlist>>``         A list of n=
ames, one for each corresponding
> > +                                                           entry in th=
e ``memory-region`` property
> > +   Usage legend: R=3DRequired, O=3DOptional, OR=3DOptional but Recomme=
nded, SD=3DSee Definition
> > +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +``/reserved-memory`` Example
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +This example defines 3 contiguous regions are defined for Linux kernel:
> > +one default of all device drivers (named ``linux,cma@72000000`` and 64=
MiB in size),
> > +one dedicated to the framebuffer device (named ``framebuffer@78000000`=
`, 8MiB), and
> > +one for multimedia processing (named ``multimedia-memory@77000000``, 6=
4MiB).
> > +
> > +.. code-block:: dts
> > +
> > +   / {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <1>;
> > +
> > +      memory {
> > +         reg =3D <0x40000000 0x40000000>;
> > +      };
> > +
> > +      reserved-memory {
> > +         #address-cells =3D <1>;
> > +         #size-cells =3D <1>;
> > +         ranges;
> > +
> > +         /* global autoconfigured region for contiguous allocations */
> > +         linux,cma {
> > +            compatible =3D "shared-dma-pool";
> > +            reusable;
> > +            size =3D <0x4000000>;
> > +            alignment =3D <0x2000>;
> > +            linux,cma-default;
> > +         };
> > +
> > +         display_reserved: framebuffer@78000000 {
> > +            reg =3D <0x78000000 0x800000>;
> > +         };
> > +
> > +         multimedia_reserved: multimedia@77000000 {
> > +            compatible =3D "acme,multimedia-memory";
> > +            reg =3D <0x77000000 0x4000000>;
> > +         };
> > +      };
> > +
> > +      /* ... */
> > +
> > +      fb0: video@12300000 {
> > +         memory-region =3D <&display_reserved>;
> > +         /* ... */
> > +      };
> > +
> > +      scaler: scaler@12500000 {
> > +         memory-region =3D <&multimedia_reserved>;
> > +         /* ... */
> > +      };
> > +
> > +      codec: codec@12600000 {
> > +         memory-region =3D <&multimedia_reserved>;
> > +         /* ... */
> > +      };
> > +   };
> > +
> >   ``/chosen`` Node
> >   ----------------
> >=20

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jJ7wACgkQ3SOs138+
s6HopQ//W/xqRFWD9z3B1PT1v63/ntRxPPSxDpQuW6EhSATVlNFWJVqjP4RLNhZy
nC2R770/+kzLuZfRS/zziQlYxOgHC6BrqTJf1XsYiKAapYhH7x9CYRW7Pj23WMcX
T2r9G0K/nGh8p/Wu5/ZWn2UnQdJl5YKtdbL6Id6HZijFkD/kTsJ4/SvGUnlJfxJ1
szQtRxd1DY1r17k4sP5QYrKC70KoBThOVwqsEYEmXIexE1MoDKJqrPJduoQR/xnd
r6R9IqwoCUnK/EnbjqKc7PrIctK6XHhIQV7r8nxpoc/9sLJ5bSR40nLaq5T8FJcJ
sUWTzOk29vb2fDQ0FRTN5hSrfJX6iwBcW9h4+Z7s8daPDuRbkL4cNXaJywfBoaNL
3mWoCARaE2XENqLK5Ax2HQvUAvtqBXeoDwDAL6pxe6t9SqxayJdWzySMsDJu5aQL
LvkpD5u3x7ZLioUxCmb695i2NDDJ+eFTAcI5fcUPY/IfbZMNBob4YMPFB9rhPZKn
09gIsATolWkomiPw1+05Xc27X2N1lmY9u3OlAzVIc9Ux7Jm0eTIOeE5ebrY7Npof
51DTmuLXqd4AY18uwJ99ai9x9fa+8RpOR3QfVOCdVE+vy+m1St7e5yLjMwjbJW5d
hEI11M49cn5c7YWtkifepHwvkwtIX1l4bvg0Lc9tX4zI8a6YuiY=
=z2/P
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
