From: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
Subject: Re: [dtschema PATCH] schemas: i2c: Add missing properties and
 descriptions
Date: Fri, 3 Jun 2022 17:53:06 +0200
Message-ID: <YpouYnc6ctdHx3Vk@shikoro>
References: <20220427175956.362987-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bYOJk5iawzv5tc2Z"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=gTxr78nfX1vGkC/Q/hYH9BH8EFvP
        hdI7CbV3iwbBq/8=; b=u+F8WPewBMlCJ5QJQZHyg7fgfTmcUh5FDcu29XpO4KmR
        W69LazUJ9XKRPe3zpu1SDC58/FKWg/wSr1dfhAidFwXkL5/kMXOa7zOM1LEW7EZ/
        y40fe2jfgivC9XpgAJVHA2Shq06rTMobeXwp2zNk2GP26Alr6KyKJPvOoaUTzK0=
Content-Disposition: inline
In-Reply-To: <20220427175956.362987-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Codrin Ciubotariu <codrin.ciubotariu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alain Volmat <alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>, Matt Johnston <matt-KrQt6mEI6EMUxA4j4dw1vfQIK84fMopw@public.gmane.org>


--bYOJk5iawzv5tc2Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 12:59:56PM -0500, Rob Herring wrote:
> Add remaining properties and descriptions from i2c.txt binding in Linux
> kernel tree. The Cc list are the authors of i2c.txt.
>=20
> Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
> Cc: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Codrin Ciubotariu <codrin.ciubotariu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Alain Volmat <alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>
> Cc: Matt Johnston <matt-KrQt6mEI6EMUxA4j4dw1vfQIK84fMopw@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Cc list,=20
>=20
> I need your or your company's permission to relicense i2c.txt contents=20
> (used in 'description') to BSD-2-Clause. Please ack and provide a=20
> copyright if desired.

In general:

Acked-by: Wolfram Sang <wsa-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>

In what from should I add the copyright? Basically it needs "Acked-by:"
=66rom above replaced with "(C)", or?


--bYOJk5iawzv5tc2Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKaLl8ACgkQFA3kzBSg
KbaQZw//Ycef03IvbTiBInHH4pPwwWJ/MoeCd0FXHG8DfsqFS3qpHaePL18ousrO
m7Bk+uKDTyXaD6mjPJVqGRs18zhR2epuAQxuynb4IlngZpf2TZREnaZVkmi2j2N5
e6AB6Ng32PkKrpJhyTwTGlBB3yC6ipMRg7bEIdGhucX42RXBVSqM8RztPY85PaCx
Q6duho9+ZFERLL8+8NNjVo8EESyFC77QwT8qFF7Eoh4lYxTiIlXpnjYuKDJ4uLUb
vHjdODTmk0qzBxHZfMnRg5aHSgRLdOZW5Zmsgl9U1TSfuhpbHfQ/ktX2+l6WwZ5I
NELM+dGl8DnhrsVdR7i889oEi6y1xginNbw1eyBoQ74w2ViicFoYPjALkeDxVNHh
UUi2bqdeab/hgND7fHeuoqUSOVGTk9v2NG23mQ5pL5EuytFFgajGPShdVyCVzKVQ
+LrHoDn2LEElMaw6nESKzid5WPciDEJYZN9fndX1RVMV5v9aMAWbQSUohRLIog15
vcD1T7/Kobnx5WkOqWVdygNbFN3ZJVTsM7tRZwKVTG1vkvipezgy5ShlKJSu8bdA
8h9Qk2FLgLmUbCbIz17yi8NbLNWwr2lA5Skz2QLIsn+th+8uWlxb8Hjjn5Yy5qYx
Krh+uUhSjNx1qRj9xq9jXhOVXDVCH3JHLbk+1fo51vnU33eK0No=
=RZrF
-----END PGP SIGNATURE-----

--bYOJk5iawzv5tc2Z--
