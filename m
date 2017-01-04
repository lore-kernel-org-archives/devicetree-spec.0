From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Describe interrupts-extended property
Date: Wed, 4 Jan 2017 11:31:47 +1100
Message-ID: <20170104003147.GW12761@umbus.fritz.box>
References: <20170103192423.5838-1-f.fainelli@gmail.com>
 <20170103230436.GS12761@umbus.fritz.box>
 <f04c76d4-996b-6ffd-d59e-eb992d0a912d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z8OPzjJiggy3JOV2"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1483490187;
        bh=sQJ1iBAK5ebvD3s6JErTNyuJiYBkt6K6p434YOfnE2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YHYrouvmQQ5pJBd259T75Q4ibV5WbzeU5GK+U11uGVtb4vLeA4+A9glslwq7JrP4r
         wQ9pRyRHrFanw5HDedOGl0GVu6l1k6RQ6S/V2Raghhf3ke88ya6PJKhkKkVWPAe/VF
         J0YGO2tYDcEaKv7nlx39bUD9usNBs4n5JSgUUiMQ=
Content-Disposition: inline
In-Reply-To: <f04c76d4-996b-6ffd-d59e-eb992d0a912d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org


--z8OPzjJiggy3JOV2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2017 at 03:44:28PM -0800, Florian Fainelli wrote:
> On 01/03/2017 03:04 PM, David Gibson wrote:
> > On Tue, Jan 03, 2017 at 11:24:23AM -0800, Florian Fainelli wrote:
> >> The interrupts-extended property is a common property used when
> >> interrupt generating devices having interrupt lines in several interru=
pt
> >> controllers with possibly distinct interrupt specifiers.
> >>
> >> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >=20
> > Hmm.  Is this actually used in the wild already?
>=20
> Yes, we have been using this for nearly 3 years now, primarily with
> devices that have a "main" interrupt and a "wake-up" interrupt in
> separate interrupt controllers. There are existing in kernel tree users
> of this as well.

Ok, fair enough then.

> > I'm just wondering if it's really needed, since you can work around
> > the limitations with the ordinary interrupts property by setting
> > interrupt-parent to the node itself putting an interrupt nexus
> > (interrupt-map and interrupt-map-mask properties) in there to redirect
> > those to different interrupt controllers.
>=20
> Well, sure you could do that, and this actually serves a similar, if not
> identical purpose, it just appeared that interrupts-extended got
> introduced to solve that problem, is supported by Linux, and therefore
> may deserve a documentation in the Device Tree spec. I'd have to double
> check, but it does not appear to me that the solution you are proposing
> is supported by Linux for instance.

Right.  The point is I used this workaround to avoid inventing
something like interrupts-extended nearly 10 years ago (for the Bamboo
440EP board I think).  Admittedly the workaround is pretty ugly.

> Digression: I was actually wondering if we may not have a need to do the
> same thing for "reg" properties, where a given device may have memory
> mapped I/O registers in one place, and another address in another bus,
> with a different address space, this is actually pretty common for e.g:
> PHY (Ethernet, PCIe, SATA or USB).

I've wondered about something like that for some time (my working name
was 'bus-reg').  The use cases I encountered were on PPC4xx machines
which had lots of things controlled (at least partially) by the
sideband "DCR" (Device Control Register) bus.  We did invent a
'dcr-reg' property to cover that specific case, and I think something
similar has been done for some other sideband busses.  Something like
'bus-reg' would be a more general solution to the problem.

I believe the "classic" IEEE1275 way of solving this is to have
separate nodes on each of the relevant busses, with phandle pointers
linking them together.  The relevant driver would claim all the
related nodes.  Again, it gets pretty messy, though.

> >> ---
> >>  source/devicetree-basics.rst | 34 ++++++++++++++++++++++++++++++++++
> >>  1 file changed, 34 insertions(+)
> >>
> >> diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.r=
st
> >> index be80af3d825b..1bda0fa54e7a 100644
> >> --- a/source/devicetree-basics.rst
> >> +++ b/source/devicetree-basics.rst
> >> @@ -955,6 +955,40 @@ Description:
> >>     to the interrupt parent. If this property is missing from a device=
, its
> >>     interrupt parent is assumed to be its devicetree parent.
> >> =20
> >> +interrupts-extended
> >> +^^^^^^^^^^^^^^^^^^^
> >> +
> >> +Property: ``interrupts-extended``
> >> +
> >> +Value type: ``<phandle> <prop-encoded-array>``
> >> +
> >> +Description:
> >> +
> >> +   The *interrupts-extended* property of a device node defines the in=
terrupt or
> >> +   the interrupts that are generated by the device. In case where an =
interrupt
> >> +   generating devices has several interrupt lines, some of them havin=
g distinct
> >> +   interrupt parents, the *interrupts-extended* property should be us=
ed to
> >> +   fully describe the interrupts of this device, relative to the inte=
rrupt
> >> +   controller(s), which is encoded by the phandle part of the propert=
y. The non
> >> +   phandle part of the property encodes the interrupt specifiers and =
obeys to
> >> +   the *interrupts* property description.
> >> +
> >> +   If both *interrupts-extended* and *interrupts* properties are pres=
ent, the
> >> +   *interrupts-extended* properties takes precedence, and the *interr=
upts*
> >> +   property may be provided to a client program for compatibility pur=
poses.
> >> +
> >> +Example:
> >> +
> >> +   A device with several interrupt lines in distinct interrupt contro=
llers,
> >> +   having different interrupt specifiers is illustrated below. In thi=
s example
> >> +   ``pic`` is an interrupt controller with an *#interrupt-cells* spec=
ifier
> >> +   of 2, while ``gic`` is an interrupt controller with an *#interrupt=
s-cells*
> >> +   specifier of 1.
> >> +
> >> +
> >> +      ``interrupts-extended =3D <&pic 0xA 8>, <&gic 0xda>;``
> >> +
> >> +
> >>  Properties for Interrupt Controllers
> >>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> =20
> >=20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--z8OPzjJiggy3JOV2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYbEJxAAoJEGw4ysog2bOS71kQAKlfeq4Dr/eJA5zoBN1ParL2
ItxZMq/heU3bggSJhtm/SpV/Awv0lXQdMKXhOG0fpVg9lAKMTcFrNRanaVvYEHv9
/iHU9MCytEXbNKkrxyfN3sLdd4rjqGyZUthrCJowdcEoNZSKQoJOwm5HIff0KoC+
OvYVfWt115qFCUx9+fPQ50BGN/U2Ct7crchMQHpbLksqLzysDDvPv8A3Xjtd7RHW
8gsmRHnOMVNgM+29Suo03iU/K094dzjFi5gHGX8mDq7hmo2Bsa3BLiIAevaH0orU
z+4SOX3WbHh3xIyeVV18lWLzAiOmfswJ0NlobEjaXXCnAWgqXI9yXRtTIkXXmIBC
tjUcVQn6SpNMq9HO/qCqlCEmDQHw+IffNBhBUfHy30uvE/eSfK0I8ByjelFx+zF/
Fw03vp2N5g5jKgjY4yNsAEnECXmpYnh/8sooViE+KlPUYfYprlgvcQayR6x8Dj0H
hpjwDALd6p4KARPffoNHYVeO1ZXy+D4ybdTos08OUrcdYPRpEvulcmkEcxCT50pr
a9DheeR4fmbA9jCdy4b+PUP4VrJyA9wpFNqvbuURlPYKMDW909OCb27az2wawm73
gnXCQ56RkB8kl8Zl3jimmFIAg+4e62RHLIXyn3kXTjO8uzQIjCtlX7LpVFTLrEtU
vgQv43SnfqeUt6QTIZka
=h+ke
-----END PGP SIGNATURE-----

--z8OPzjJiggy3JOV2--
