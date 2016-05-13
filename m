From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Node names and properties names collision
Date: Fri, 13 May 2016 22:17:55 +0100
Message-ID: <20160513211755.GA6799@littlecatz>
References: <57343365.6080000@baylibre.com>
 <HE1PR04MB1641C4DB11CDF2618E27BEF18D730@HE1PR04MB1641.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1463174624;
	bh=BJ27qzWKHQdeHHLiSIpDy8CtQ9e55rsKat3aLsbq1Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QKrKAYA3GZ1VQVieDGzUNM0/1SKiPSYBgTme88l9AC/8B6W3wMuXU/haNhc/go5ws
	 jDUs8BKqbTM7z7mAxKOqtp8x/r5hed0+aSbKV3d6kYFfb5exuGx8JS9d3q1uT6vKoz
	 4ELUf8EWa3H0J+W+wQWD4GCZcuRPPtx7sRUa8cPc=
Content-Disposition: inline
In-Reply-To: <HE1PR04MB1641C4DB11CDF2618E27BEF18D730-6LN7OEpIatU5tNmRkpaxD89NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2016 at 04:22:39PM +0000, Stuart Yoder wrote:
>=20
>=20
> > -----Original Message-----
> > From: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:devicetree-spec-own=
er-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of
> > Neil Armstrong
> > Sent: Thursday, May 12, 2016 2:40 AM
> > To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Subject: Node names and properties names collision
> >=20
> > Hi,
> >=20
> > I'm working on a full python device tree library to load blobs and mani=
pulate the tree in-memory as an
> > object tree (http://github.com/superna9999/pyfdt).
> > My testsuite strategy was to run the DTC testsuite and load every DTC g=
enerated dtbs, re-generate a DTS
> > and compare the DTC dtb-to-dts output.
> >=20
> > But I have a strange case using the Amlogic out-of-tree BSP dts where t=
hey use the same name for a sub-
> > node and a property :
> >=20
> > 	efusekey:efusekey{
> > 		keynum =3D <4>;
> > 		key0 =3D <&key0>;
> > 		key1 =3D <&key1>;
> > 		key2 =3D <&key2>;
> > 		key3 =3D <&key3>;
> > 		key0:key0{
> > 			keyname =3D "mac";
> > 			offset =3D <0>;
> > 			size =3D <6>;
> > 		};
> > 		key1:key1{
> > 			keyname =3D "mac_bt";
> > 			offset =3D <6>;
> > 			size =3D <6>;
> > 		};
> > 		key2:key2{
> > 			keyname =3D "mac_wifi";
> > 			offset =3D <12>;
> > 			size =3D <6>;
> > 		};
> > 		key3:key3{
> > 			keyname =3D "usid";
> > 			offset =3D <18>;
> > 			size =3D <16>;
> > 		};
> > 	};
> >=20
> > While reading the original ePAPR and the new linaro specifications, I w=
as not able to find an answer....
> >=20
> > Is it authorized ? Could this be clarified in the new specifications ?
>=20
> Nodes and properties can inherently be differentiated, so there should be
> no ambiguity if they happen to have the same name.

Yes, it's permitted.  Properties and subnodes of a node live in
different logical namespaces.

> That being said, in practice
> I don't think this situation happens.

It's rare, but it has occurred in practice.  A number of old PowerMac
machines had DTs with (IIRC it was both an "l2-cache" property and
"l2-cache" subnode under the cpu nodes).

> A device tree describes hardware.  A node
> name "should describe the general class of the device".  Property names
> should be meaninful and if they are non-standard should have a organizati=
on
> specific prefix.
>=20
> The DTS example above seems to be a horrible example and follows none of =
those conventions.
> There are no compatible strings, the node names don't seem to be describi=
ng
> hardware.  And not sure why you would need properties pointing to subnode=
s.  So,
> the syntax/semantics of device tree allows it, but nothing like that exam=
ple would
> ever pass a public review.

That particular example does indeed look horrible.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXNkSDAAoJEGw4ysog2bOSqXkP/i4/wi6YvNANyh7KUb6oNpv4
clxOSY6HaP4A/io2t4vIu+620gbHx0+gmImZcMUqxJOUR/dXVUX8kZgADVl02lHy
FHn3BQ4dN6BDDIAZDE56Y4cdElmtZM5VRqUMiQwT6fVWVq0FQrQlTcETXIL7FIT9
auYBhRK4OJHXpzdLnUFLKS4AIiXBfJsywUXSVtU+74K+s/GjtJqhi7BLUzvdOP0B
jX53cRyov/3Ic2SCMFP79pIrkLxXE8o6iDZiaw5X181D7HEHgnW4QLesMgsdWyFo
z9EHLaph5ODEr3L0jb8fqqnquVcvbY8h5GlSB+XhdDBZYfEUzz8DSudxBt3z9uko
bEsRJjalZB7XTskv4SNXEbGQ16Y0TnDqVimnqMPFFHNdYhWreZP3nndsOqe3z3Sn
VCI8T5q7CXk04CChlbbwy3cayDbOZPAK4TtnDfk/O3H/3KfGPepHPc27zNsjT4RW
Z8WHWxGDgxVa/W0ra7NeOuurGgSNQ9ovEIvLRE9mDPmXUfBSWxCEB5Vrrg7Hh6I3
ecYn3IAvTcLfzjwVR72vwL8Kt3XX0bZi1qUCtrfXwefWz1C1Zb7ozR9F0Jc0yptx
qxo5gYgzvVe45KokB/pMfiDTekIp/5dftEQTn7OGRwOf0Xmp0oJLepZqTu0jtrBr
+S0P4Su2WmW6fI0cRLsb
=cc+K
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
