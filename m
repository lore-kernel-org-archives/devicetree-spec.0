From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Node name & property name collusion - json/yaml implications
Date: Wed, 10 Feb 2021 12:35:56 +1100
Message-ID: <20210210013556.GD4450@yekko.fritz.box>
References: <C008DF92-364E-4892-A1C0-68A2C97BE946@linaro.org>
 <20210206071131.GA61463@yekko.fritz.box>
 <9B77D509-0790-4210-9B24-24527A8743D8@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1612921805;
        bh=PbXgPGICJKCiY/z/+XbbMp1uvc+EyvsNvUbr7A5es9k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a5rwnrsIqv+V6xay2h9kdt+uIPIjY6/BqI9+pFY0/3OLkpZ/dXE/XhYQpRIYfcU8k
         urbbJVGczDmKNUz/gnJny92EJ8cOdANAkNbs1YYY9fhnGmZ2wKLu7Pimdeck5xEGii
         Sm+M0CMP0+BmxrNIKl2Q5yVT5fi4c3B7dLfHzIE0=
Content-Disposition: inline
In-Reply-To: <9B77D509-0790-4210-9B24-24527A8743D8-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
To: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "Bolivar, Marti" <Marti.Bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>, Grant Likely <Grant.Likely-5wv7dgnIgG8@public.gmane.org>, Rob.Herring-5wv7dgnIgG8@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2021 at 08:39:55AM -0600, Kumar Gala wrote:
>=20
>=20
> > On Feb 6, 2021, at 1:11 AM, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >=20
> > On Fri, Feb 05, 2021 at 06:57:54AM -0600, Kumar Gala wrote:
> >> There=E2=80=99s an old thread about this from 2016:
> >>=20
> >> https://www.spinics.net/lists/devicetree-spec/msg00296.html
> >=20
> > That is not the only case of this - IIRC old Apple machine device
> > trees had both an 'l2-cache' property and an 'l2-cache' node under
> > each CPU node.
>=20
> Sure, but I assume this is an OpenFirmware machine, so does dts need
> to maintain support for it?

dtc needs to maintain support for it, yes, because dtc is still useful
for investigating device tree related things on OF machines, not just
for building flattened trees from scratch.

>=20
> >=20
> >> In which its clearly stated that node names and property names technic=
ally can be the same.  However, as we=E2=80=99ve starting utilizing tooling=
 like JSON for validation, does it make sense to maintain this and should w=
e update the specification to require that a node name and property name at=
 the same hierarchy in the tree is not allowed?
> >>=20
> >> Otherwise we get into fun situations like, being valid DTS, but invali=
d YAML, and various tools not working correct as the YAML loaders have to p=
ick one or there the other version of =E2=80=98foo=E2=80=99:
> >>=20
> >> [Example is from Marti]
> >>=20
> >> /dts-v1/;
> >> / {
> >> 	foo;
> >> 	foo {
> >> 		bar =3D <0>;
> >> 	};
> >> };
> >>=20
> >> (Using pyYAML)
> >>=20
> >> $ dtc -I dts -O yaml ./foo.dts | python -c 'import sys, yaml; print(ya=
ml.safe_load(sys.stdin.read()))=E2=80=99
> >> [{'foo': {'bar': [[0]]}}]
> >>=20
> >> (Using ruamel, w/allow_duplicate_keys as dt-schema does)
> >>=20
> >> $ dtc -I dts -O yaml ./foo.dts | python -c 'import sys, ruamel.yaml; y=
aml =3D ruamel.yaml.YAML(typ=3D"safe"); yaml.allow_duplicate_keys =3D True;=
 print(yaml.load(sys.stdin.read()))=E2=80=99
> >> [{'foo': True}]
> >>=20
> >> - k
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAjOHwACgkQbDjKyiDZ
s5JsERAAj2pualgPSip9Z6RYDLLipg/MZJGGVRTbUQ5wLBsy/5DHimHsceTydd2H
5VpNUC5ila9b+Mbx/Sl+6rRGhMJ4smNG6d5zcogYhh3T/9YltxFlpoKlLP0imG9f
b3N0pgpe45/Biogm0iwWFlqs0s6jOJMyF04aLUkiFBisyNWAkLZ+Eh/5Cp864LYA
TOnRsNB2yzlgHASHpXrHvzhawknGxPjI6HXwViivYJHnJVS93FLnsjZdaNiSQLlH
jnkYwSJiTsvNZ6weKy94PlT2NCZ8pmLTY2u9zCF2L68ufOd+9fq/RmdY3+SGj5X1
nNVXn8JB7xzOHTXHcqIAzx1xuBCRvzDrq83zOzpjBqZZbun7fVvHaQWbwpDgWjwy
dCuA0Lxd5kf0G1tgSaEtlDse/xo7UAxLhGEdsHAP0mL686c1eFC6o6RDIuHLzCXQ
GyukXb7pGa9VAxWLWgh90iAl7UgDFd+BwR3vDcXcPM4FMhJA8oaqLTZBnOE1qsAs
MBEdCOJVAZc+3y0rhTBy/eZDX91UC0M9e40KihAiKAQ6qp0xYEJauIWdPThEAXFq
nvLUtszQ0/fKpUfo/iLiCAfhMeH0025uML25NF2pOC40liIfe9Dn0pBtUPgtExD2
p1z5eJZ771ra2ZRhRLCbBVpDFyP8CyG/iZNEFLFJlOin8VTNLYY=
=LXVr
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--
