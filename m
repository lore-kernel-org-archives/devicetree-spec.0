From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Mon, 24 Jul 2017 16:14:54 +1000
Message-ID: <20170724061454.GL17228@umbus.fritz.box>
References: <ok4f5h$qg1$1@blaine.gmane.org>
 <20170714105856.GB16128@leverpostej>
 <okjplq$7kf$1@blaine.gmane.org>
 <20170719034029.GT3140@umbus.fritz.box>
 <okukd4$i1o$1@blaine.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z9sQuz+HmDh2hVO4"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1500876899;
        bh=gAlFzLIqyMm3+ENcLsdZ16CoT2OFQeYkWN9kZk7AmjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aVLtnWRP7ouDLaP9Lp7xGI7aDE7CCkeaQKIm2hICxVqmRke23+HUM655qrV+R8v+j
         qL0xRtROzeuskPkca8RKj1pYlo6xmlh5MB8p5ISJfjfcg+cD9CzHGcFpnxhCzTWlcW
         aNuVhigBsaDblIOo5fECRx/tC4Yo3cux0n3vFWRk=
Content-Disposition: inline
In-Reply-To: <okukd4$i1o$1@blaine.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--z9sQuz+HmDh2hVO4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2017 at 09:24:35PM -0700, Cyril Novikov wrote:
> On 7/18/2017 8:40 PM, David Gibson wrote:
>=20
> > Well, I don't want to invent a new encoding if we can possibly avoid
> > it.  The current encoding used for overlay generation looks like this
> >=20
> > / {
> > 	target: node@0 {
> > 	};
> > 	node@1 {
> > 		ref =3D <&target>;
> > 	};
> > 	__local_fixups__ =3D {
> > 		node@1 {
> > 			ref =3D <0>;
> > 		};
> > 	};
> > };
> >=20
> > Basically, __local_fixups__  has a subtree which paralells the main
> > tree.  Each property found under __local_fixups__ is a list of offsets
> > at which phandle references appear in the corresponding property in
> > the main tree.
> >=20
> > That seems like it would survive most likely bootloader
> > transformations as well, I think.
> >=20
> > > Even if they do, like I said in my reply to David, we don't strive to
> > > achieve a full automation, so it's probably tolerable. Oh well, we've=
 missed
> > > some dependencies. It's still better than what we have now.
> >=20
> > Ok.  I'm tentatively convinced that it's worth adding a switch to dtc
> > to generate __local_fixups__even for a non-plugin source.
> >=20
> > Next step is for someone to propose a concrete patch.
>=20
> Do you mean a patch to the DTC utility or a patch to the Devicetree
> Specification?

I was meaning a patch to dtc.  Exactly what's mean by the "Devicetree
Specification" is a bit unclear.  There's the spec of the flattened
encoding, the spec of what goes in the tree (i.e. the collected
bindings).  And then there's the spec of formats using the flattened
tree format to encode something that's not a traditional device tree
(though it might be related), like FIT and overlays.

> I suppose we want this specced, so that alternative
> incompatible implementations do not appear?

Well sort of, but it's not clear where to put it.  This is basically a
new option to make dtc add "overlay style" __local_fixups__
information to a non-overlay.  Does that belong in the overlay spec
(such as it is) or somewhere else.

> The engineer looking at it told
> me it's only a few lines change for the DTC.

Maybe a little more than that to make something polished, but not
complex, no.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--z9sQuz+HmDh2hVO4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll1kF4ACgkQbDjKyiDZ
s5JEJg//Qn7mhqBgxfNKA87WOBp5EDQJ4dogvMKGn+4xw9sUy30kZ2Xa0eLcfRZ1
BtczVTnR3iKdhscwqX1KcYBj+6FQGf66QiOUhMkDJxf7YtYiWeRdkTtdYwFybiq+
RhloCNp0grLj6u17mh728k5X2m07oPlqX3olaekVVhc0oy08/ejtQY/0EKs+ieqY
RzYbvTQWIBUI/hdIlft+t5lpG8Q14GM8z6kM6sEayiEQmmepiKsbloX64LYo/c0w
bBkMWs9MxrUUAn+4uJBNRwtFHiICNe6kccwxjuXrKSkEOBXhAj/s0zy3lw0l7hpG
ZxHVxKxoqnhvEEjZ3APzEjEkTIALWGEWL897iBCD47PUNrRIYthUZz+qpu9OL1hS
jzvAfuoVWOOmWslfW5CKHB5+UE732eCkGwicHagSw38MJxLczRnwnLt/oO2t8Tmo
QtGl2dT/rLDXU9jDX3Yz9bbbRJIvY2YZZz99b0NAKV9lnmogYxsrsZaTkic0X6m1
JSTivPDpwf+yeOjKAHg/e8ezQcz8+9LoJG0ZDKftD7347kfMIk4dVjKm6VAgzCbT
h+7+GNtdNYipiBBWdVqvJYkmF7MFmGTJwNsYatZY4YMXDMLg5LD2nGjOH3ZJMn4X
qy+/63lV6vyODs3zFxGSMQixV30IS+ze5DSfXwZtTuOs5JhztAE=
=uada
-----END PGP SIGNATURE-----

--z9sQuz+HmDh2hVO4--
