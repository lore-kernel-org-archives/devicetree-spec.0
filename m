Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D830718FC97
	for <devicetree-spec@vger.kernel.org>; Sat, 14 Feb 2026 02:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771035447; cv=none; b=l/8NInjtSpNzxZJ/1mG0XVg8zgWxKDcaMI4sXEt9ObQeMaKI2vQsBgQsoN40cvZBzjNpbp5uf4M9g5mpHCxL8r7+gEHq7u1a66vn1Q+PKNkWSAPkI/fF+N831Mzh+lPpOznIDw0gy/CFQOujIsNYW2m5MVYjO2gG8bbEmTXl0kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771035447; c=relaxed/simple;
	bh=yVTxMjh3WN7gdZQ4cDzBqEUvuIwCEwf2Vzy/RmMwKDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiZy4rDVpHSBH2P3KewuzAzEKVLlCGBzTFSets2+QFECXbrTTJOx7L+Z7YFugLoaABFAsAjTFaz4z4MY2DASzB73ZrItabUbvUBMMvl4kmL3EjBEPGYEskHCkrb/XH3zIhMF0xUsxhtxzBpJCzzco3jxKU6hxXsD29l05FOXyIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=cugbCZs5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="cugbCZs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1771035442;
	bh=tuL67DOXFNcH4SFRgFGbcqV8j0hNY2utdbIgbZ+kkyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cugbCZs5iAV2C1KrC/F0Q1tHHlYIMWxDCPZJT0qa7tw1bbi4z/GhgvNzYgwfhyaXL
	 TU+FPzcl+VO89E5dFgER9dcFi++XvaWK//nw1gRsWhgVcLI1oWYh6McJ9XOvJFNeZt
	 LrDVa+9Wy7isM1Mty1MrDtvMbUn+RWGij+EzwYn1ABi2zF+9LrFmzl4ZlbsNOXiHcg
	 yCr85Gj8ha1Z969kxRHDeYlj2efckRIPnsY8rU4KKsuxXIU0dh8Cy7nYRAtYSZ9ruk
	 kbm90NhhySFpsFr5mq+ZSrKVHC7dOVsB/zfxsHlVMCv8rrecX1GxK32q9J2GwnucYr
	 jAW+1FkX7z5tw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fCXjt4DgPz4wph; Sat, 14 Feb 2026 13:17:22 +1100 (AEDT)
Date: Sat, 14 Feb 2026 13:02:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: "McCrae, Jamie" <jamie.mccrae@nordicsemi.no>
Cc: "robh@kernel.org" <robh@kernel.org>, "me@ziyao.cc" <me@ziyao.cc>,
	"kylebonnici@hotmail.com" <kylebonnici@hotmail.com>,
	"devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Subject: Re: Ranges - Intended use case
Message-ID: <aY_XxHMzWyJLqWog@zatzit>
References: <7CB259ED-7AFC-4EE1-A926-54A5F6DCD97B@hotmail.com>
 <aY3yzUGLHU-wxue9@pie>
 <CAL_JsqJOO9c5HVmHcFC5COE6nJQ4wDrpvwhtTPXvGmFYjL2ySA@mail.gmail.com>
 <939c2ed886c7516eeb76f30a7ecc193a734458e3.camel@nordicsemi.no>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oDyXetiYyAKOqi+e"
Content-Disposition: inline
In-Reply-To: <939c2ed886c7516eeb76f30a7ecc193a734458e3.camel@nordicsemi.no>


--oDyXetiYyAKOqi+e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 09:04:00AM +0000, McCrae, Jamie wrote:
> On Thu, 2026-02-12 at 13:24 -0600, Rob Herring wrote:
> > On Thu, Feb 12, 2026 at 9:33=E2=80=AFAM Yao Zi <me@ziyao.cc> wrote:
> > >=20
> > > On Thu, Feb 12, 2026 at 01:14:33PM +0000, Kyle Bonnici wrote:
> > > > Hi
> > > >=20
> > > > I have been trying to understand how ranges should/should not be
> > > > used.
> > > >=20
> > > > Looking at the spec
> > > >=20
> > > > > The ranges property provides a means of defining a mapping or
> > > > > translation between the address space of the
> > > > bus (the child address space) and the address space of the bus
> > > > node=E2=80=99s parent (the parent address space).
> > > >=20
> > > > This to me the spec leave some space for interpretation on if
> > > > ranges should be used on just buses or not. Below are some
> > > > examples to try to get a better understanding.
> > >=20
> > > I'd like to say ranges literally specifies the translation process
> > > between the children address space and the parent one, regardless
> > > whether the parent is a "bus".
> >=20
> > Yes.
> >=20
> > To put it simply, "ranges" should be used whenever the child nodes
> > have memory-mapped CPU addresses.
> >=20
> > > For example, reserved-memory nodes aren't really "buses", but often
> > > come with ranges property, as shown in the example of dt-schema[1].
> > >=20
> > > However it might be a signature of bad device-tree model designs if
> > > you
> > > have to use a ranges property for a random non-bus node.
> > >=20
> > > >=20
> > > > ```
> > > > / {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 foo { // not a bus
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 #address-cells =3D <1>;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 #size-cells =3D <1>;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ranges; // does this ranges have any meaning?
> > >=20
> > > I'd like to say, yes.
> > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 bar@10 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg<0x10 =E2=
=80=A6>
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 };
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > };
> > > > ```
> > > >=20
> > > > ```
> > > > / {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 foo { // not a bus
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 #address-cells =3D <1>;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 #size-cells =3D <1>;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 reg =3D <0x100 0x50>;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ranges =3D <0x0 0x100 0x50>; // is this an intended
> > > > use case?
> > >=20
> > > Depending on what the child node represents, but IMHO it comes with
> > > a
> > > clear meaning.
> > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 bar@10 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg<0x10 =E2=
=80=A6> // hence abs address is 0x110.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 };
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > };
> > > > ```
> > > >=20
> > > > ```
> > > > / {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 foo { // bus
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 compatible =3D <simple-bus>;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 #address-cells =3D <1>;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 #size-cells =3D <1>;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ranges; // this I understand to declare that
> > > > children will have direct mapping
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 bar {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ranges; // is =
this needed? Or is it implied
> > > > that the foobar is in the same address space of bar?
> > >=20
> > > It's necessary. I don't think ranges property is ever implied.
> > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 foobar@10 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg<0x10 =E2=80=A6>=C2=A0 // hence abs ad=
dress
> > > > is 0x10.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 };
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > };
> > > > ```
> > > >=20
> > > > ```
> > > > / {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soc { // bus
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 compatible =3D <simple-bus>;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 #address-cells =3D <1>;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 #size-cells =3D <1>;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ranges; // this I understand to declare that
> > > > children will have direct mapping
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 flash@1000 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg<0x1000 =E2=
=80=A6>
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ranges =3D <0x=
0 0x1000 =E2=80=A6>;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 partitions {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ranges;=C2=A0 // is this needed? Or is
> > > > it implied that the partition1 is in the same address space of
> > > > partitions?
> > >=20
> > > Personally I think it SHOULD be needed, though existing dt-bindings
> > > for
> > > fixed partition layout don't enforce such.
> > >=20
> > > I'm not very familiar with flash partitions and their dt patterns,
> > > so
> > > will leave the question for others :)
> >=20
> > It depends. Usually no, because the partition addresses are just
> > offsets in the flash device. They are their own address space and not
> > part of the CPU address space. An exception would be a parallel
> > nor-flash device that is memory-mapped into the CPU's address space.
> > Even then, it may not be all that useful to be able to translate a
> > specific partition address into a CPU address.
>=20
> In the case of simple MCUs where there isn't an MMU and flash is memory
> mapped, then it seems that using ranges would be the correct approach?
> e.g.

Loosely speaking, yes.  There are a few wrinkles in this example
though.

>=20
> ```
> rram_controller: rram-controller@5004b000 {
>         compatible =3D "nordic,rram-controller";=20
>         reg =3D <0x5004b000 0x1000>;
>         #address-cells =3D <1>;
>         #size-cells =3D <1>;

There's no 'ranges' at this level, so nothing below is memory mapped.
That's not neccessarily wrong, but it doesn't match what you described
above.

>         cpuflpr_rram: rram@165000 {
>                 compatible =3D "soc-nv-flash";      =20
>                 reg =3D <0x165000 0x18000>;   //Non-0 base address
>                 ranges =3D <0x0 0x165000 0x18000>;  //Pass on full range
> to children


Having a ranges entry and reg entry overlap is.. unusual.  There might
be cases where it makes more sense than the alternatives, but I'm not
sure if this is one of them.  My inclination in this case would be to
omit the 'reg', and only leave the ranges.  However it's possible that
would cause conflicts with existing bindings or drivers.

>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
>=20
>                 partitions {
>                         compatible =3D "fixed-partitions";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
>                         ranges;  //Pass parent's addresses on to
> children

This makes sense

>=20
>                         cpuflpr_code_partition: partition@0 {
>                                 label =3D "image-0";
>                                 reg =3D <0x0 0x18000>; //Offset 0 of
> parent (of parent) thus unit address is 0x165000

unit address is 0, because unit address is defined as the reg value.
The address of this device within the rram-controller address space is
0x165000.  Since there's no 'ranges' in the rram-controller node,
that's an abstract address space that has no (direct) mapping into the
CPU's bus address space.

I'd say in principle that you're correct that ranges makes sense for
mapping partitions like this.  I'm not sure if that matches with
existing bindings and conventions - and if it doesn't it's probably
more important to match those than to be correct to the overall
principles of how ranges works.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--oDyXetiYyAKOqi+e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmmP17gACgkQzQJF27ox
2Gc/6w//WCnUfy66PbXXJijowgpMiyFFMGFXd+1rH7YFuCmKbMpAT9zktLgAvbx1
4kmUpx3SrJuVXdPsv6LkDYbYIK9403ZHI/FeNGCNINw7HUeGVFKc5QMNw0akhRSc
MPWXPG7esYtohSJOIgXYdeNawULCEotZ/Y/p0BQoJ6+4OgdKJNiAezSRaEzu6hay
jMlxiYhAgB7eySowMHD62kuTRtiAN7UCRT7zY9PU3dnRvCjZi85RjEivoPJJYrTI
lgBY8xjKdoMXGR6KAtyyILu3+i1fjXLJz0q9Da4HH00Zth3fPgRJzU5qWTyhWB1b
w3Ik7pnoib2utGrrODH8pD5eS5EA8k0BtX71Eecv6Jm2oo/UFRJXNRxm+srnrb2D
ZqAtPoGTFUSPeBVxQiKju1Vbg9S/63JSXkYoIjwfUsr2McbY4RxnzyyhRbqfcBVT
S2B51XRvXAyVQqNjULclYB+iz+PWS4ZTpZVe05thdaDbmpcFpAWOTj+2gSlYwzOB
zYQ2S7PC0oWInX8XukAuBMsG1pk/K4ZQFeI6yda2NrkmS//500zkh+1OGJVjKV36
VoEdDubmWDexXB7hHkVduMz6Xh6kBtcKPOVslBXZO7amSmG16sVQ64ulPw8nOlQD
ft/46L8pqCdrboShP5uZ8PGcE4cEf47RkFuWwBvE1gzea6zTTYI=
=1Jur
-----END PGP SIGNATURE-----

--oDyXetiYyAKOqi+e--
