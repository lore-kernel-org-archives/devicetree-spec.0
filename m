From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Intended use of "model" property?
Date: Tue, 13 Sep 2022 16:21:47 +1000
Message-ID: <YyAhe9r1Tq9xmpdA@yekko>
References: <dfc5b413eba67844ae65b27e0f926451.marti.bolivar@nordicsemi.no>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6Tz5q+EYH688fUEo"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1663050371;
        bh=sVQmtdnvu3IFp8L7ZbESlhiYcWvzgRpJBcU6D5vGDWg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c5pw9yNurHlJPKt4QLe1qgZNN0+X5p31oJ3cM27DRPqw3DDh+Od4ExdzaWVF4u8uH
         bkvQN25xGMQz8/NTAKEO7yD4uMj0c4UhHtj6sIHl8yLFz10EUVJiRhOeWP6R+/6jJM
         t2UU7/TMBgOK5frWPtkRr0HbL6e4Ty9z7S817ZXo=
Content-Disposition: inline
In-Reply-To: <dfc5b413eba67844ae65b27e0f926451.marti.bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
To: Marti Bolivar <marti.bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org


--6Tz5q+EYH688fUEo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 12, 2022 at 01:18:08PM -0700, Marti Bolivar wrote:
> I'm trying to understand the intended use of the model property
> in DT spec v0.4-rc1 =A72.3.2.
>=20
> Specifically, can "model" be a property in any node of the devicetree?
> The spec seems to indicate so, but grepping around the DTS files in
> Linux, it seems to be primarily used as a property of the root node, as
> a model name for the entire device.
>=20
> There are a few exceptions in Documentation/devicetree/bindings/, but
> they are mostly in sound/, so it's not clear to me whether this is the
> "model" I'm referring to here, especially since that isn't present next
> to "compatible", "reg", and friends in dt-schema/meta-schemas/core.yaml.
>=20
> Is "model" in the =A72.3.2 sense meant to be a property of the root node
> only, or can it appear anywhere with the meaning defined there?

It can be used anywhere, but it's relatively rare.  It's usually for
human interest rather than signifying anything to driver software
(that's what "compatible" is for).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6Tz5q+EYH688fUEo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMgIXQACgkQgypY4gEw
YSLJzxAAoOdwlNouMaWQYv2pG5faYV9m3ST1wc97YHH2Dzsy4Xkqn2IbdF5tB83n
SehTkIjfaMTefHDGZAl6+flJYcnsRr9oBTAQCZytXWNBPbFRS8kdhHHF7tk2k4z7
WQ7kMpwlXG9pjy4Qbx3bGQN4rwxm9DpYxbLUKBNPE8Yzkbk9k/Vxv1x4K0hD8Ldr
Vwr2XgHvmPiLe3hhjoM2iSJ1xRntYnWcMHXtZMMg6GN+m2TYPPCNnC2zFYuWGcrD
o5shWI4MNmLT6IfviWDIFKIBYouTbTaa3tCHX8HoxVMXSnDBY0yx2HGAVKvXo1KZ
pbwwBqRTndbTAZacu+w053YFtF5Hj6ZmSh+iSKqWaSScQYmEjJ/Cl67oWX0Y6O94
O6jj1Dxge+0HZJ+/MLYsIArazm/Cy9OdfWFRIEKX/lfo+lhQ1PqTKHcMWsTKWw7U
cWuKR5/GzEoRmczW3xYVeB7unEPE1SFSgCaMneuX3uXKkzhgJoH9Idu/NpGMm1xb
v1UWV3Vgflj0FQ/w4GByed1pw9YADDYPOtfM9AdT25AaA6o4fKHf+vnHsZlk7qzw
EaffjvYrAoMqRFsEnl9doWghBu7mj8O8IpZdHbsRU/hnPa90egldLIvpkfaVhADz
0ppLWyE7kaf0jpZPr7PeOMxMi1pJhJge+bzpbeVTFboFpy2wjX0=
=yPQS
-----END PGP SIGNATURE-----

--6Tz5q+EYH688fUEo--
