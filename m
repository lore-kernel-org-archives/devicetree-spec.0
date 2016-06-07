From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [DTSpec PATCH v2] Add items to Devicetree Source Format chapter
Date: Wed, 8 Jun 2016 09:50:13 +1000
Message-ID: <20160607235013.GP9226@voom.fritz.box>
References: <57573377.4010001@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qSHHer9gQ0dtepKr"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465343418;
	bh=rJ254TQ1L6v2lxJ3BFF/rMD27RgBaRoR5HvWNv6MsFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qvn/m7usPL2RfTOE/kw4LVbDnE0Bzcsz46m9jqiGL7Ap6IAxsk3NCEOCiosyNqGmD
	 owGZjojoIOQCa8YkU2BW1sy31K9y72PDW38+wX9Os6ux/l3fFyN3j9JttWkJ+IhMsy
	 Aau/DSDoWaq/NSSF5zxxsr2Vzhh22o9uphXK5ZRw=
Content-Disposition: inline
In-Reply-To: <57573377.4010001-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


--qSHHer9gQ0dtepKr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2016 at 01:49:59PM -0700, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>=20
> Add items to Devicetree Source Format chapter
>=20
> - Add naming convention for DTS files and DTS include files
> - Add /include/ compiler directive
> - Add ";" to end of node definition
> - Add /delete-node/ and /delete-property/
> - Add arithmetic, bitwise, logical, and ternary expressions
>=20
> Note that cpp directives are not included in this patch, and
> are not yet specified in this appendix.
>=20
> Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
> ---
>=20
> changes in v2
>   - arithmetic operators "and", "or" were incorrectly listed as as bitwise
>   - thus bitwise operators "and", "or" were incorrectly shown
>   - "exclusive or" operator added
>   - logical and arithmetic "not" operators added
>   - ternary operator added
>   - moved shift operators from arithmetic to bitwise
>=20
>=20
>  source/source-language.rst |   70 ++++++++++++++++++++++++++++++++++++++=
++++++-
>  1 file changed, 69 insertions(+), 1 deletion(-)
>=20
> Index: b/source/source-language.rst
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/source/source-language.rst
> +++ b/source/source-language.rst
> @@ -9,6 +9,19 @@ devicetree in the form expected by the k
>  not a formal syntax definition of DTS, but describes the basic
>  constructs used to represent devicetrees.
> =20
> +The name of DTS files should end with ".dts".
> +
> +Compiler directives
> +-------------------
> +
> +Other source files can be included from a DTS file.  The name of include
> +files should end with ".dtsi".  Included files can in turn include
> +additional files.
> +
> +::
> +
> +    /include/ "FILE"
> +
>  Node and property definitions
>  -----------------------------
> =20
> @@ -21,11 +34,18 @@ preceded by a label.
>      [label:] node-name[@unit-address] {
>          [properties definitions]
>          [child nodes]
> -    }
> +    };
> =20
>  Nodes may contain property definitions and/or child node definitions. If
>  both are present, properties shall come before child nodes.
> =20
> +Previously defined nodes may be deleted.
> +
> +::
> +
> +    /delete-node/ node-name;
> +    /delete-node/ &label;
> +
>  Property definitions are name value pairs in the form:
> =20
>  ::
> @@ -39,6 +59,12 @@ form:
> =20
>          [label:] property-name;
> =20
> +Previously defined properties may be deleted.
> +
> +::
> +
> +    /delete-property/ property-name;
> +
>  Property values may be defined as an array of 32-bit integer cells, as
>  null-terminated strings, as bytestrings or a combination of these.
> =20
> @@ -48,6 +74,48 @@ null-terminated strings, as bytestrings
>  ::
> =20
>          interrupts =3D <17 0xc>;
> +-  values may be represented as arithmetic, bitwise, or logical expressi=
ons
> +   within parenthesis.
> +
> +::
> +
> +    Arithmetic operators
> +
> +    +   add
> +    -   subtract
> +    *   multiply
> +    /   divide
> +
> +::
> +
> +    Bitwise operators
> +
> +    &    and
> +    |    or
> +    ^    exclusive or
> +    ~    not
> +    <<  left shift
> +    >>  right shift
> +
> +::
> +
> +    Logical operators
> +
> +    <    less than
> +    >    greater than
> +    <=3D   less than or equal
> +    >=3D   greater than or equal
> +    =3D=3D   equal
> +    !=3D   not equal
> +    &&   and
> +    ||   or
> +    !    not

Fwiw, I think &&, || and ! usually get classified as "logical
operators" but <, > etc. get classified as "relational operators"
rather than putting them in the same category.

Hrm.. given that you're listing them all here, I wonder if it would
make sense to do so in precedence order (should be the same as for C).

> +::
> +
> +    Ternary operators
> +
> +    ?:   (condition ? value_if_true : value_if_false)
> =20
>  -  A 64-bit value is represented with two 32-bit cells. Example:
> =20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qSHHer9gQ0dtepKr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXV121AAoJEGw4ysog2bOShdEQAOEL37yIINc+BoXV5vSM3d5f
pn2Je82cXJ8kb4Xw827mP4a+z0/NB9qjAtBifmsfnHeRt7GEOCIjYckUU7XLkho1
/DePjxsBmorir15tlmVayRm3o3MoTu5y0sTF9UsVkvioA8Ka8AVt+/eM6NONzQne
y7BTB7+cDlSTJKZ2w1eGz1VERyVNAoBD/76ujqfHSGPB95bBJ+afPr0r1ToIPio9
zRMvcwmAlTZNsVN644iobnrYlZ5EHRe0/OgjaD/BtI96J0SNuxdycR5+slHN6ywJ
eK3FJRWMvvgoJyi48ppa1XzAl+5RiOa/ZYZ1ktcC41OOqnfHE5wohnozWC1LWvi0
wxisSF6oInx27qQCyWNx340Dp/YbbcEEqSEI7/rtv+9SQYMEIqPjvhtpgFIkx4pH
7QN1Nag/lPoqi/wk0/oQkkS+GV+gmTWTo6Io2R3FBaPTZqgEguyE/M8PtBwfdEQ9
1uG3D9XjhNIHZ/dxexudAOyMLV6BbMPxjZtw8JRNiDVm9A0cyqwuNreOIo07lv7V
D/zP3t8joz04AKCwQ1J0x63p7SC8dIynRTRPM4IkTem8Xz2S5D4YF2RU2pgpve/M
eqW5OyQ2z8iFhs/3b2RZ6BS0lDc+KDz5mGAVg8gf8AtBgrr9RqOPZCrA7zcWGFYz
zqEnKxFy12NM1UnQljzf
=q97u
-----END PGP SIGNATURE-----

--qSHHer9gQ0dtepKr--
