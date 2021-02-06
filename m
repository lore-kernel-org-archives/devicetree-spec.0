From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Node name & property name collusion - json/yaml implications
Date: Sat, 6 Feb 2021 18:11:31 +1100
Message-ID: <20210206071131.GA61463@yekko.fritz.box>
References: <C008DF92-364E-4892-A1C0-68A2C97BE946@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1612596337;
        bh=vjMrJ2nW/eVk1j0XPyUifQrlWQqNIG4CIOxzG7dhMno=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OqyifqcZEJyx/mPiKITkL7gabmuwWuOWYxklVyy4TXsJJmRgbTlMvbigRbiYPYfZ/
         uQcV6TjABIOiJbfNF/GgjW1Dg5JO+5V8wbKz7ayE92SC+j+YawEMaFZaoAe1s+IqqY
         wuihf2f9UNNV0Q9obBAgCjwWnJT3TssBkJmjukPg=
Content-Disposition: inline
In-Reply-To: <C008DF92-364E-4892-A1C0-68A2C97BE946-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
To: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "Bolivar, Marti" <Marti.Bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>, Grant Likely <Grant.Likely-5wv7dgnIgG8@public.gmane.org>, Rob.Herring-5wv7dgnIgG8@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 06:57:54AM -0600, Kumar Gala wrote:
> There=E2=80=99s an old thread about this from 2016:
>=20
> https://www.spinics.net/lists/devicetree-spec/msg00296.html

That is not the only case of this - IIRC old Apple machine device
trees had both an 'l2-cache' property and an 'l2-cache' node under
each CPU node.

> In which its clearly stated that node names and property names technicall=
y can be the same.  However, as we=E2=80=99ve starting utilizing tooling li=
ke JSON for validation, does it make sense to maintain this and should we u=
pdate the specification to require that a node name and property name at th=
e same hierarchy in the tree is not allowed?
>=20
> Otherwise we get into fun situations like, being valid DTS, but invalid Y=
AML, and various tools not working correct as the YAML loaders have to pick=
 one or there the other version of =E2=80=98foo=E2=80=99:
>=20
> [Example is from Marti]
>=20
> /dts-v1/;
> / {
> 	foo;
> 	foo {
> 		bar =3D <0>;
> 	};
> };
>=20
> (Using pyYAML)
>=20
> $ dtc -I dts -O yaml ./foo.dts | python -c 'import sys, yaml; print(yaml.=
safe_load(sys.stdin.read()))=E2=80=99
> [{'foo': {'bar': [[0]]}}]
>=20
> (Using ruamel, w/allow_duplicate_keys as dt-schema does)
>=20
> $ dtc -I dts -O yaml ./foo.dts | python -c 'import sys, ruamel.yaml; yaml=
 =3D ruamel.yaml.YAML(typ=3D"safe"); yaml.allow_duplicate_keys =3D True; pr=
int(yaml.load(sys.stdin.read()))=E2=80=99
> [{'foo': True}]
>=20
> - k

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAeQR8ACgkQbDjKyiDZ
s5ImoQ/+KsSG5yE7zqjlMNxc9e/uHeHr5B8k1JQ4jklmUjJoVKr7D/2Z90B5nd0o
K+4jotkGKVc5GKpNt4x3C/7CxDU4fWgf8m2CoagB4poenNj7EGtURmDffC3+lquW
vcVRfJdY4vRkgSWxRsZM6nMzqVVEI509CFIx7KjCl804beazi268uwqU9wS+ZB0F
+U6oWg2pcQyNr4w7OSJkkQi4rzOb8n2AzFr/jcy184BubFiIz7GqNCOzEu7Bf1hM
GUa7QykYXbPXbndgtHmsrnBIUGGJbVgQcWVKfQqePpSjHLK4PDRJ7n3NYdpIGofI
69u4wWiTUPFOU6os+liws1TVxuetUmQ2YUC3XLa1Zwm5tHx6FakFctNIWkFI5ZVZ
VJ9a3bSSed98ZOBAtBXgCi5BYqQoNRN288MztLdoG51l2W8PBAuSSuZLyUwAOq5Y
dkUCmAFqugjFIGFBmG34Qr4R1iE2rvIf/ywDrPu6AhlH5DyDtsxwR8GFV/GbRaW8
iZFs3p9kiFFZf7/vl3DG4JT5f+AIJ6u2sSd24t891hqO87Daasyl1HhWTFyBrUWI
Atgv/AuqSeqMzRuY35X8EkhIbj0M6dg/SijK4+2cV8tFpAHxTKRZB3a4wtWXzGn3
VFypu969kl/5k3XVN+Bk4RJS2jz3VpogzH+keZ9LFjxv80S/rHc=
=iGWC
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
