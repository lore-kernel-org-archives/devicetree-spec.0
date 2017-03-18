From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: /aliases node and valid property names
Date: Fri, 17 Mar 2017 21:19:06 -0400
Message-ID: <20170318011906.GA19897@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BvvXV5nz0HrS6QiS"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=zweKfladLMyYOrJdo5MCkJhXpF26IKEB6+gPAfUZRo8=;
        b=WYuAMQvjMNQj++n8M+sXlv1GOHxMX6I+Q3vnT3yjaKjoArz6SwdS74Agh+PGuG7J8c
         +EkVEpmd1SNthHLEwEgdND8cnGnHvGHtRtSjFzrL03g71HZ1ftTQt7MzZiPQgNiHVqUs
         zQ6AG0yHn6zTQQWjCErT3qcxTAWa9SaMFsiu0=
Content-Disposition: inline
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--BvvXV5nz0HrS6QiS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey all,

I found out about https://github.com/raspberrypi/firmware/issues/613 and
in digging a little harder, this is not the first case where 'ethernet'
has been added rather than 'ethernet0'.  Looking at the spec, it's
implied (by all the examples) that property names end in a number but
it's certainly allowable by the way things are worded to not.  Is it
worth adding any further words here, another example, or just leaving
everything alone?  Thanks!

--=20
Tom

--BvvXV5nz0HrS6QiS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYzIsKAAoJEIf59jXTHXZSUToP/ilcvAhdaVH6ZHHyGO6McGsB
3YVjfNAifNbyiQOEnQJlAEZD8v3dsAaQ4h4g2xO682pEf3x3Od6f56l36Pgagv3b
ZQteYvxlfCHFrZLqC/nk32AaybAiu/RE4co9tdG5RhTuN6Ek1i49a8JYjaL1WtYM
GQt8rAQue7YfN7EiBwhx6ckV6vT9oYFpzDMH3jLrxDrgKsimHLoiXBjIHsiPOgNz
qOmqCTOzcRCTuBo7eggJaQgvaipNubwMg9/0xeEAwZjvIkm0zcKz5SMuYe/i7xT4
xwh+hYmN5E0zXCBXb9CewY7uoEYvX8BE2fG4IewZHKXjL0uetCkzVQPPCebAzraf
YQqpu30mhttev8Z6sAXS4C1/fabZFFL+XqjVsjuWvWZVGQAj0FJPp/pNsU+UDtLv
ZqxfarW6qeYAmP+M9e2Ok9x85xnTBKAbA+KwyZXUFg6KVEqdr7net2nALbPy/MQ8
bmVFmd5bheSiA+k4yNi6SOOMJDnVSXiRaLuZdblOLsNcnRmBh+00hgJNLIel4UbD
elV14AWjmH7cORv55P5coY9SfAFErj5hO/Z0R+bJIRxWIiFp1lrfRHlhvcy+Gw31
fCF6V0BZRU7bMIfyUdPh0zyqmRD+YDT6oeHF37XLLIDCGJNyWklJTRtQ+XhBr2Ch
TXBrVkMjKo+Bz+gG/MvJ
=inSF
-----END PGP SIGNATURE-----

--BvvXV5nz0HrS6QiS--
