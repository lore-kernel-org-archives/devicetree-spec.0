Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C2A49A3B0
	for <devicetree-spec@vger.kernel.org>; Fri, 18 Sep 2026 07:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715333; cv=none; b=pgMpTwfGfEHcgyBukXapvEWBJV+L4NAOP7YqNbwHmnEv/su3tXx9bxaoA+wcmlsenjiM/TbU1wi17Jz7b2CjsTFZ6kcxGQq1+93L2tHQXDm6LT9QnqbKYmcpoT7fRsksw52fGg3wbDQPrPoay56T45eB3gvcjkmmWsnq/hwUW5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715333; c=relaxed/simple;
	bh=asMYrZ9FNFSQOy6fJvSZ400MPeR8hMgAIuU+1eO6hx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2dImqdk5cIt4VT6HvDg12XbKMqTuwwXNjlVu36LTjOndscaMe0RYHndTShobxe9u/MB9QEg0QQuPQJR9eqnIyTrfgNnBEIflKvhmZD/FYTEd1xxYWoL5uWkrIwHOIY3H2Ui/6eRJ2cjAjLtvWZhxBIEG64/6S/mXxkJjMM36Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=IfsH/dJX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="IfsH/dJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789715308;
	bh=4aNgNvpE5EzZEBqIG3wrtNPHQgZbnXzO+N207skrkjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IfsH/dJXtWny1OqRys/d2EWQZ1vD7vXNHO5O4qlaUAyzi/972QxcnNNAI1tSGXQks
	 D+Q8JeDFcIUvg1AYyWDcXCede2acHbDITf4H0a5Bpq10sZQ9zh0biV6r18dEsOgyYR
	 M5Jqn/jmspFfjM98a7MZ5/+DGAvIlQra5cdOrm+2EyyUav8J9KArX0QDhMjVwnHfWt
	 DWWWTnyZgtOvSQZHLg6ZPva3yF1JYgHLHjORT0mRRokEBhUnFk2eqRSEtW1uhKdR8c
	 Hvp3VPNOOe09602IP7tHrkPVk1+lY9iS8PFN/GpBIoJqKzqV054BSMsFBYBH6s07Wo
	 BHMIOa5VygTAA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hmNy46B2Mz4wTR; Fri, 18 Sep 2026 17:08:28 +1000 (AEST)
Date: Fri, 18 Sep 2026 16:40:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robh@kernel.org>,
	devicetree-spec@vger.kernel.org
Subject: Re: [PATCH] chapter2: add generic name requirement for multiple
 nodes w/o unit addr
Message-ID: <aqzc11ZMeIH4Xcv5@gractus.seuss>
References: <20260915142340.3131310-1-zhengxingda@iscas.ac.cn>
 <aqzF-U499nWyVyih@gractus.seuss>
 <b228fb8c86acd3eddcc9e671071a3d65d8230636.camel@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nhJt5IChLQcPi7di"
Content-Disposition: inline
In-Reply-To: <b228fb8c86acd3eddcc9e671071a3d65d8230636.camel@iscas.ac.cn>

--nhJt5IChLQcPi7di
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 01:51:45PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2026-09-18=E4=BA=94=E7=9A=84 15:02 +1000=EF=BC=8CDavid Gibson=
=E5=86=99=E9=81=93=EF=BC=9A
> > On Tue, Sep 15, 2026 at 10:23:40PM +0800, Icenowy Zheng wrote:
> > > Sometimes multiple nodes matching the same generic name will
> > > coexist at
> > > the same level (e.g. multiple GPIO-controlled regulators).
> > >=20
> > > Document the common practice used in existing device trees in this
> > > case.
> > >=20
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > ---
> > > =C2=A0source/chapter2-devicetree-basics.rst | 4 ++++
> > > =C2=A01 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/source/chapter2-devicetree-basics.rst
> > > b/source/chapter2-devicetree-basics.rst
> > > index ca716a1..003b37b 100644
> > > --- a/source/chapter2-devicetree-basics.rst
> > > +++ b/source/chapter2-devicetree-basics.rst
> > > @@ -303,6 +303,10 @@ name should be one of the following choices:
> > > =C2=A0=C2=A0=C2=A0 * watchdog
> > > =C2=A0=C2=A0=C2=A0 * wifi
> > > =C2=A0
> > > +When multiple nodes matching the same generic name and no unit
> > > addresses exist
> > > +at the same level in the tree, the node names should start with
> > > the generic
> > > +name and a dash, follows either a sequence number or short
> > > descriptive names.
> >=20
> > If that situation arises, it seems like a real warning sign, though
> > whether the problem is in the specific tree or the relevant bindings
> > is less clear.
> >=20
> > Presumably there must be some way for the OS to separately address
> > each of these otherwise identical devices.=C2=A0 In which case, that
> > addressing should appear in reg, in which case there _should_ be a
> > unit address.
>=20
> Sometimes the device are addressed with something other than a real
> address,

What counts as a "real" address?

> e.g. a GPIO controller and its GPIO cells; and I think it's
> currently not supported to use a reg property instead of xxx-gpio
> property to reference a GPIO.

Well, yeah, that's what I mean by it being a problem in the binding
rather than the tree itself.

We may well need something like this to handle existing cases - even
if they exist because of earlier mistakes.  But it seems to me we
shouldn't implicitly normalise that situation in the docs without
encouraging avoiding it first.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--nhJt5IChLQcPi7di
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqs3NcACgkQzQJF27ox
2Gdpsg//a++HVTvSiJF4cwNWdm9db4O3SRyWhN7y+cTz5fZ4GvVBFHU6pKrE5lbv
sUqgEwM3AV2VW+ZEixZzaD0qvVP9yP8mYqsKE4fOPUAhtRw7tv9EazzEWp6tbH8n
dLmOl4VkC3X4uDCRfR5LgqTfxJebLINhzhq7Qg3xnjewFR3dH+ZThThFoS0ZC20M
9y4kM00RkqBD/E6VXaomiwRbuBZJ0C0DyXOb5VXFb2GdyapNeS1vHRtZsqClJydh
2abICiN4Kew99ubEIgTeX9nMWF4oU9ce8Ex+TpRsnxpuAiw6/IZjbdGYXXsYLsDM
mb4Mj6siT5Il4LfzeygyFQC7W8ShIRN0bVXESqjjHduYSUpb1CaHpQ+Xs1kU4DCI
juqjtYb1x3Udw1D/fbX71c7D0i51e64qis0qrOXMV6IwGQUngDic3HFpoRCEWcGF
QytDRFaY1EBa86BZ4cRU8qNekcW2kdCptoMkFcp+6z2JU19tlwCAFoNNzCo1Mg92
1/FbxLsLiS/Ln10UEoGEOv7d3eGSza9cPvRf2+qRTmlOLFft/WHLJjCw/ynlE4uD
hEwSksN4rA8hW5DMXeccLF7NJpqTrTpA+IrrTGVG37LKoOllCOgX3VLZhy2uq/tc
HyttDG2SnVSjLcqxQsdpbfQq393kSmhRI5uUB1wfRhb2rSqik+Y=
=JiNB
-----END PGP SIGNATURE-----

--nhJt5IChLQcPi7di--
