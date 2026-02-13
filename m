Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B965B208D0
	for <devicetree-spec@vger.kernel.org>; Fri, 13 Feb 2026 06:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770963277; cv=none; b=cCVX9H+/FmUepSC6lT/iPKofAiDbJBS1iCtRkDT4SrA3etOUcb5KYmS6Pcc2Jt3m80nIvtk9XYefC3x9t1bhDaK4R3WCDhlgWeziPEg5q4e6W1FizKIW5L0DIJjr1I+LzUG4QQGZMM4VzV4/ILlXQxGFATIvxlcr0xt/ng4hQWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770963277; c=relaxed/simple;
	bh=UK1nAz2Kgo4UVIivVJg7brDVOrbK3CfQPlCFuTdgqmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+/yCqFlZONsIz0xrV8tdJCoXQpzvZ/XcGHzZmPYZvWVtPQuqVvfQ7f/yknbAFiOzu5/BtlpdnDfRkEQKPBVYfyCgbuYngLRbZdHOYjOuNxWZA7S6xrhHDlfYzDQ9IwTAqE+fEyN7qr1h5e0ahnEjiVj/4dXCA9vMzJ1nsfGcPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=V0nswjwV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="V0nswjwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1770963267;
	bh=qMabVyBV1+BHpSgSfjOcUWdlh1Q54lEAbwndnH+iDCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0nswjwViTZNXg5lyr9SU2ZcIMvxhZJkBRNnesa7ovfDUcE/l+BrhYNWLvYaKHIEt
	 gi3QacYmliC82qK4i/T2sbWrV1nE237E3DTbqo/pXBFoYINFlmLDbOk7Sxe8q9zGKg
	 5CxxDJ4TmGO//8JC7H/TTvA2YNwH1hDn2K8EljlOFmmKJcSLsuKIa0XXkuixHP4VsB
	 Hkr4H3tXQc9IWeIj04Ua96WZwIJObUovlaOJKE0ao+x4SDg2yHbDDy1UH8z7IXZ1HW
	 OLXh0+f87ZgvKMopriMThkSV7RfAMTfDr5cAW83tajAcOLDiCAQLonlqTGxYcsQYgB
	 /fWgR6wF6Hmgg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fC21v5FRTz4wB9; Fri, 13 Feb 2026 17:14:27 +1100 (AEDT)
Date: Fri, 13 Feb 2026 16:13:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Kyle Bonnici <kylebonnici@hotmail.com>
Cc: "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Subject: Re: Ranges - Intended use case
Message-ID: <aY6zC7IHuLTjqIEj@zatzit>
References: <7CB259ED-7AFC-4EE1-A926-54A5F6DCD97B@hotmail.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rA3yM6Rw9LKJ2/zG"
Content-Disposition: inline
In-Reply-To: <7CB259ED-7AFC-4EE1-A926-54A5F6DCD97B@hotmail.com>


--rA3yM6Rw9LKJ2/zG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 01:14:33PM +0000, Kyle Bonnici wrote:
> Hi=20
>=20
> I have been trying to understand how ranges should/should not be used.
>=20
> Looking at the spec=20
>=20
> > The ranges property provides a means of defining a mapping or translati=
on between the address space of the
> bus (the child address space) and the address space of the bus node=E2=80=
=99s parent (the parent address space).
>=20
> This to me the spec leave some space for interpretation on if ranges shou=
ld be used on just buses or not. Below are some examples to try to get a be=
tter understanding.
>=20
> ```
> / {
> 	foo { // not a bus
> 		#address-cells =3D <1>;
> 		#size-cells =3D <1>;
> 		ranges; // does this ranges have any meaning?

An empty ranges property is a special case, which means there is an
identity mapping between parent and child.  In this case, this is
invalid - / has no #address-cells or #size-cells properties, meaning
the parent bus has the default values of 2 and 1 respectively.  Since
#address-cells is different from the child bus, you can't use an empty
ranges property here.

> 		bar@10 {
> 			reg<0x10 =E2=80=A6>=20
> 		};
> 	};
> };
> ```
>=20
> ```
> / {
> 	foo { // not a bus

I'm not sure that there's really any hard distinction between a "bus"
and "not a bus".

> 		#address-cells =3D <1>;
> 		#size-cells =3D <1>;
> 		reg =3D <0x100 0x50>;
> 		ranges =3D <0x0 0x100 0x50>; // is this an intended use case?

It's a perfectly valid use case.  In this case again, the format is
invalid since the parent's #address-cells defaults to 2.  It should be:
	ranges =3D <0x0 0x0 0x100 0x50>;

> 		bar@10 {
> 			reg<0x10 =E2=80=A6> // hence abs address is 0x110.=20
> 		};
> 	};
> };
> ```
>=20
> ```
> / {
> 	foo { // bus
> 		compatible =3D <simple-bus>;
> 		#address-cells =3D <1>;
> 		#size-cells =3D <1>;
> 		ranges; // this I understand to declare that children will have direct =
mapping
>=20
> 		bar {
> 			ranges; // is this needed? Or is it implied that the foobar is in the =
same address space of bar?

It is needed.  If there is no ranges property, the child registers are
not directly accessible from the parent address space (they might be
indirectly accessible via registers in the bus bridge).

This is again technically invalid: bar has no #address-cells so it
defaults to 2, which differs from the parent.

> 			foobar@10 {
> 				reg<0x10 =E2=80=A6>  // hence abs address is 0x10.=20
> 			};
> 		};
> 	};
> };
> ```
>=20
> ```
> / {
> 	soc { // bus
> 		compatible =3D <simple-bus>;
> 		#address-cells =3D <1>;
> 		#size-cells =3D <1>;
> 		ranges; // this I understand to declare that children will have direct =
mapping
>=20
> 		flash@1000 {
> 			reg<0x1000 =E2=80=A6>=20
> 			ranges =3D <0x0 0x1000 =E2=80=A6>;
> 	=09
> 			partitions {
> 				ranges;  // is this needed? Or is it implied that the partition1 is i=
n the same address space of partitions?
>=20
> 				partition1@10 {
> 					reg<0x10 =E2=80=A6>   // hence abs address is 0x1010.=20
> 				};
> 			};
> 		};
> 	};
> };
> ```
>=20
> Looking forward to explanations on this topic to extend my understanding =
of devicetree
>=20
> Regards
> Kyle

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--rA3yM6Rw9LKJ2/zG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmmOsvoACgkQzQJF27ox
2Gcepw/8DDvgp+wZmpxJsQ588VhpwiLrF2ldgxkophiGEX8zCsfElkMFNT4HYaCp
IOUOUwAdayIyZIsT4XPMyij6ePDwsyKr/uqwQXWUVn1dfES6byNEKK+GAdk1SKxJ
+Y3fxUFIxlwcdXJOZuSEdkZVa6x+6kFrO0jl3pi2h0CtjcEj5SiyO+ZzDjklEX2u
jjctcnK8Cn+4JG7U+y0FB1ZSIePbzFH4wvz9jR5/PAEBNnwpVYg7R48bHyHtmbwJ
uJgmM+LbTNXSv0eLgVc3n80k60IgNANeKjzm5qBcTSJrYPFPsWyXeclPAOihaHAF
I7BAGXNtB1Uf2MG2+FE2MxmdEuP9bZ5gXg19t5Ux+z9d/02M36UIpq9cLmWug+3O
DvE7E2970iSvSF6bb2LT7WWBH89bAphfDJcLeRL1JG33NCX422vv3XrgOptBiS3d
fbmImzBEypUBPjt9O5ig0Dpf8pwcBocEO++7IvEeKwtY+Cu8ViB2Jlhihn3ecDR/
8sXDt0W4W7w0yervMxNSu4BOOaaNGiJO91zYRrtBirvpKLNh8xNMveq+Qtloua3K
yvny40BjXnFWrvErAh0qZ14vLTWOvVPzufAjf1PffAZOKQhCrOMdQLrHtvmDYRea
cBkZGlcRVwQ3XUSL4AtF5NzP+W5GNjzk4u2hud8mBJa9efzCmNk=
=LnPG
-----END PGP SIGNATURE-----

--rA3yM6Rw9LKJ2/zG--
