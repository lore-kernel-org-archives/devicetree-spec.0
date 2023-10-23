Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD29B372
	for <devicetree-spec@vger.kernel.org>; Mon, 23 Oct 2023 00:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Oz2N1DZJ"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD377EE
	for <devicetree-spec@vger.kernel.org>; Sun, 22 Oct 2023 17:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1698021341;
	bh=RWKjDsK6hwFKGy5XGXtxOgzbqV7DP68Nv7F8oPZvJgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oz2N1DZJqp67CxCudR4gWk9pPftXox8u9JFKPj8UM/nMC1Gh2ZMi3vGuokNtJylZu
	 mjVzT6xxr0P5KOdSPhRqoVwo5XqLN5CwoCppLweObAZq5PmXr0kRW9nqPdpBH/Rjvt
	 d6/jEeyCfmBBaxT12PU4XOYEivQhmSmZl61nq++U=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4SDGSY0GYbz4wxX; Mon, 23 Oct 2023 11:35:41 +1100 (AEDT)
Date: Mon, 23 Oct 2023 11:32:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: devicetree spec mailing list <devicetree-spec@vger.kernel.org>
Subject: Re: Definition of "should" seems inconsistent with idea of
 "deprecated"
Message-ID: <ZTW/JU/fjdgYRkmo@zatzit>
References: <cddc5065-42d2-11f6-9195-296361c8aef7@crashcourse.ca>
 <ZTG8szcUghDU12ZZ@zatzit>
 <e86932a-f08b-e23-bf6-d8b7f688ce3@crashcourse.ca>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5/ni6pho7uCkNCkL"
Content-Disposition: inline
In-Reply-To: <e86932a-f08b-e23-bf6-d8b7f688ce3@crashcourse.ca>


--5/ni6pho7uCkNCkL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 21, 2023 at 05:08:48AM -0400, Robert P. J. Day wrote:
> On Fri, 20 Oct 2023, David Gibson wrote:
>=20
> > On Thu, Oct 19, 2023 at 07:03:56AM -0400, Robert P. J. Day wrote:
> > >
> > >   Reading DTSpec v0.4, near the beginning:
> > >
> > > "The word should is used to indicate that among several possibilities
> > > one is recommended as particularly suitable, without mentioning or
> > > excluding others; or that a certain course of action is preferred but
> > > not necessarily required; or that (in the negative form) a certain
> > > course of action is deprecated but not prohibited (should equals is
> > > recommended that)."
> > >
> > >   It seems contradictory to suggest that "should" implies
> > > "recommended" but, in the negative sense, it can also support
> >
> > I believe that by "in the negative form", it means when something says
> > "should not"..
> >
> > > "deprecated", which typically suggests something that is *not*
> > > recommended but is nonetheless acceptable.
> >
> > ..in which case being similar to "deprecated" makes sense.
> >
> > I will agree that saying "in the negative form", parenthesized,
> > amongst a cluster of interacting clauses is probably not a great way
> > of expressing this, and it might be clearer to explicitly give a
> > meaning to "should not".
>=20
>   Yes, I see that I misread it somewhat and it's not as bad as I
> thought originally, but it definitely would be clearer if the concept
> of "should not" was combined with the idea of, say:
>=20
>   "Should not" means that, even if a particular possibility is
> discouraged or deprecated, it is still acceptable as a viable choice.
>=20
>   Or something like that. "in the negative form" is way too wordy for
> saying simply, "should not".

Yeah.  I guess it covers "shouldn't" as well, and maybe there are
other ways of negating the sense of "should" that I'm not thinking of
at the moment.  Not convinced that's a good trade off, though.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5/ni6pho7uCkNCkL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmU1vwwACgkQzQJF27ox
2GfnCw//V5O0sAjP89GAJaQ+QUSzaehEnnyf5HAvee4lOOqw2MN2rts+drIwm5oB
qdd1r2qq2eWYjtraNFmKieHksVp60GGqGS1ITsK4xri57E+GontRLmnVC3ec6tSf
gctiZFYIeFBKl3QcMceQ+2Jdy+vJ+IfIbEVfsckUnJKsYmHAzxkyEW9zG8bWh36A
h6QEHNFDDe1ZVsU4OUDjSokpsioq9e6r6+xiVLOJ8SI0s57X6RUmGLDqKYouf6de
ZYOuWNsg4h+4vg7T1BRpKZV1cboRDE8GfODJR7NySQk2LloMAQRCSAfupTAJWUhM
KShquCJEChk7t6nuVOmhdxOXd2K+sT126Mh7s888sbtJ6/WtMXi3Swe0+Bv9WOF9
aMxp1zYi3twAh2ZxHfXcW+5FRjQqjLqiq+fUJTUUodCFRsPUJEk6uF1NIHo7+20d
N8nmi73MRKTBYBTeL/tyNGGJ8fcWeHrmeyLEtaMxEY9xxJHFoaVxmoAU3cw/8uhU
tiR2tzot+9p0b8kH39NbQ7BiEyKmEYKek7FMPOA2s+WItv1RcRUjXwYQffWDQfzK
nqP88E3iBXj5v2udFgwBAnBFJDDGaGjKicBEuUZtZFOH2o+PolCLBfIEh+tw69kR
lS1SfcJDOrem7k6SHAdIDAflWt3y8vrROXo5I4LWvY2kdSNpG+4=
=12Ea
-----END PGP SIGNATURE-----

--5/ni6pho7uCkNCkL--
