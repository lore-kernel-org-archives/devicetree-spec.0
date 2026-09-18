Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA42367D3
	for <devicetree-spec@vger.kernel.org>; Fri, 18 Sep 2026 05:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707784; cv=none; b=DSLTvJgCUro0Mg5N+4+5hxxG+3tYFvAIkJJzblyN0QBasveyJqNi00h9CvHVs1IM3i3bGbDkJAQnq5U5c/3Y6ltcIcE8OACu9S2DAD60V/i864R359e5Biaiq+rTsQL5eMq9iGiqjGT4+4GdhurkfwLUGl1vu70rbl7O6NkOfjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707784; c=relaxed/simple;
	bh=giRoxYVuua6EFjAf9eejoo7CBLNuZ0YDA5M0ZMwKlpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuqCVol+RDcPRRTaYfPP8sgDNEjSGk5BAFCryUR27x4yP6WMwQa2ZwdlxoENfnjBYJYFhCWX093os5o/6drGKIsC0jBoqpkdJqGpBdIHveBwiyJCB46EhvRUkgjsHQuwU7y+t/vjgIdb++sqNrTNsWDZPxfUQLPekuCjub53hmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=TAODFvLQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="TAODFvLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789707759;
	bh=3r8Jnyu+iSQYO5w954UlSpsQEueC7ugKk3EYVWaV9KI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAODFvLQhiyaLE9OPAue1TvbUj/OGh+RShqfWZwJla8/u8n+4ofrBkqrDNsnyDC0m
	 A5DPC8dETlAoy0ldhFePt3cen4ZXpJ9laix2u/Ca3Zu13JjGEVtQ1ypkdo4I/1jRx4
	 9ZbJgO4nzxBoQ/cOcJU4xR1Mtz2doSN2PSXbyW2CtxYUz8S+HBJ2gyFPN38u1NT7HI
	 MbjjxrfAVOslgy7H6Gf7P4iI1+3uL+Xwc/cEAB+SvP55TSBK76dEHagUbG5XugLMzH
	 1K60epNtub3tceJBRTMU6M8Ofv91aTYJfwgk4hpicyKlmxweFRf7/jnd8jOjm23qaK
	 xIINbzxVWvxxQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hmL8v6L71z4wSq; Fri, 18 Sep 2026 15:02:39 +1000 (AEST)
Date: Fri, 18 Sep 2026 15:02:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robh@kernel.org>,
	devicetree-spec@vger.kernel.org
Subject: Re: [PATCH] chapter2: add generic name requirement for multiple
 nodes w/o unit addr
Message-ID: <aqzF-U499nWyVyih@gractus.seuss>
References: <20260915142340.3131310-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4JavREMjY6egeocb"
Content-Disposition: inline
In-Reply-To: <20260915142340.3131310-1-zhengxingda@iscas.ac.cn>

--4JavREMjY6egeocb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 10:23:40PM +0800, Icenowy Zheng wrote:
> Sometimes multiple nodes matching the same generic name will coexist at
> the same level (e.g. multiple GPIO-controlled regulators).
>=20
> Document the common practice used in existing device trees in this case.
>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  source/chapter2-devicetree-basics.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devi=
cetree-basics.rst
> index ca716a1..003b37b 100644
> --- a/source/chapter2-devicetree-basics.rst
> +++ b/source/chapter2-devicetree-basics.rst
> @@ -303,6 +303,10 @@ name should be one of the following choices:
>     * watchdog
>     * wifi
> =20
> +When multiple nodes matching the same generic name and no unit addresses=
 exist
> +at the same level in the tree, the node names should start with the gene=
ric
> +name and a dash, follows either a sequence number or short descriptive n=
ames.

If that situation arises, it seems like a real warning sign, though
whether the problem is in the specific tree or the relevant bindings
is less clear.

Presumably there must be some way for the OS to separately address
each of these otherwise identical devices.  In which case, that
addressing should appear in reg, in which case there _should_ be a
unit address.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--4JavREMjY6egeocb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqsxfkACgkQzQJF27ox
2Gdraw//dlFQybiV94vaURoCTijRn/M9M1d8FNqcOxKPqt6AmoIiX05ehDvRfydW
NErzFSeqOKdqnpK0OgqeCfbnW5r4+dt/Xu1QvvEvWrhDPLJ+/ZR5M5TL58DKsoSH
lkN2QayIcQsV9Y7HQZuZWapcpotVS3mhyZbOoT5al5lHwtx4HLB37Y1/93ycXUkI
f0b6jK9awbJsyt4yyvG4HkgxJaGpHfj343Luytu6uygqxiLAxkVjtkT32SrQX63k
sAK7IGXcBen3KR2ZbOi/FpKdxNoF446HIr4TRJ/Mo9I+RrS5rovu0MUxoxYiugR8
ZTQUAQUK2F3HaWJSdsAiTnhIoMN44QvtBrg5LKlCprjxqOOga7u0jUD1cxk3u9Qh
KnKVsXD5b8KWJt+uRKWqMYaAJyJoGWSipv8azLmmp7ebuON3RZ4GDII8bPbb8gBt
3mb3aQZDepp0g6c5eWkVX8kQ+zzEJgN9D2EkEGgBNJZkKaIeQpgwP4YT5ktyyyGP
5v/oBSjeWuq5q6Ej/pBFwRlw81rlNgAiKRhR5yGCZ3mrgB/AhDpuonumRq4sUvcv
9YVLh4QLJIpyPvUQhDumsNcPQ0En6DrxZYybbc5/xroCppQs4zJL4frLuwWzbBEV
TeWHS9ZXI4iSLH1D3/OyiDtLCFO3ih5jKewWuYEHQ/cQDPkLD8I=
=BV/b
-----END PGP SIGNATURE-----

--4JavREMjY6egeocb--
