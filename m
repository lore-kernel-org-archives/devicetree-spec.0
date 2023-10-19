Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E23191
	for <devicetree-spec@vger.kernel.org>; Fri, 20 Oct 2023 00:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="gsAP5eBt"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE5D511B
	for <devicetree-spec@vger.kernel.org>; Thu, 19 Oct 2023 17:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1697760594;
	bh=XX/RdGguz23P7yyARmxBQj9+mRc2KeDVfq7wdlJ99ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gsAP5eBtxDwSwQgiS8ey/z2uBqkf3PgmWJLPziTsq4ddUl3Zeu1PeNbPKSRZObdHt
	 CFRpDZD0D9FTIGUcI5se+T5WJZL4GnNIg3TYkGlP8Fb8BCzb40Fol5msVEvbxHJf5a
	 gIZUXnptYcbAVWoI/S1kpHjiXAzo1xiZHFeAJrJk=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4SBQ2B2xXmz4wnx; Fri, 20 Oct 2023 11:09:54 +1100 (AEDT)
Date: Fri, 20 Oct 2023 10:33:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: devicetree spec mailing list <devicetree-spec@vger.kernel.org>
Subject: Re: Definition of "should" seems inconsistent with idea of
 "deprecated"
Message-ID: <ZTG8szcUghDU12ZZ@zatzit>
References: <cddc5065-42d2-11f6-9195-296361c8aef7@crashcourse.ca>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Eu5eEsZyVrvwKIL1"
Content-Disposition: inline
In-Reply-To: <cddc5065-42d2-11f6-9195-296361c8aef7@crashcourse.ca>


--Eu5eEsZyVrvwKIL1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 07:03:56AM -0400, Robert P. J. Day wrote:
>=20
>   Reading DTSpec v0.4, near the beginning:
>=20
> "The word should is used to indicate that among several possibilities
> one is recommended as particularly suitable, without mentioning or
> excluding others; or that a certain course of action is preferred but
> not necessarily required; or that (in the negative form) a certain
> course of action is deprecated but not prohibited (should equals is
> recommended that)."
>=20
>   It seems contradictory to suggest that "should" implies
> "recommended" but, in the negative sense, it can also support

I believe that by "in the negative form", it means when something says
"should not"..

> "deprecated", which typically suggests something that is *not*
> recommended but is nonetheless acceptable.

=2E.in which case being similar to "deprecated" makes sense.

I will agree that saying "in the negative form", parenthesized,
amongst a cluster of interacting clauses is probably not a great way
of expressing this, and it might be clearer to explicitly give a
meaning to "should not".

>=20
>   It just seems like that's giving off mixed messages.
>=20
> rday
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Eu5eEsZyVrvwKIL1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmUxvKAACgkQzQJF27ox
2GeVVQ//Y4kJILmMa3cS7Tg1MBs/IhBGPQ1iKVYUOyvCTJR1ya7DQyGjyXccoeqU
RX0vnxVsnWWmV453eGob+07xltWynysViwIomHn8RkdXbOctVZ9UN9tqZt+A/OAC
9pnHlukZUWu//UFG1B5vuxWYfawvoYzZQs5w9TXt+ik6s1x1WTS3V2ssgDp+RM2n
l9+LBxLcpzIwNaBiEkVqQbyfgSdOndC3CticmTGtMOQ1qtpi5ECvBIaa5WgjCwCV
/meb3mmCWbfy7g3tYrzD+t2TjmdWtIxW9xQoOkNMM+O5DtTRrjOLt0SYWFPsf3Ll
SitdVfhAYKrR7of50TuK8b0umBq4Yl2D7INvgwqMn625oOqG4ZJ6ujW823qR7eVS
UvMvrmikm3ivnmALn6JPbUKL8CNJuzeo4wReyVn4KDeo7TWtcY3tOzIim1VPmaUV
gw+3Rb36oyik9Xd6Ojdpao5k5x4e0JYxvBPo7Ck7QFxZtFtcQlIMSC6ZPut6S7CR
flFl5sAbH7okv162wo2ZLkiChUpx9381qkuB3wpHrLKI5XgCEgvABa5ITF2UKDEa
F/jsNhZINF5tKe4QheJs4prglzGhp2/e24SmQU0P1oNsYg4InSZ9KaB0rVXcQbu6
W+Y5DotG/U7SQayZqO+H0ElTrIUQJM3n3U5vqqnG7XfF6j4qpWU=
=ESMM
-----END PGP SIGNATURE-----

--Eu5eEsZyVrvwKIL1--
