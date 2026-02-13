Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9766275870
	for <devicetree-spec@vger.kernel.org>; Fri, 13 Feb 2026 06:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770963277; cv=none; b=coDjBau0uS5CuzBz1UGKGQ7UwP1W7PWmLYvf8s9aQwPbj2KZ/Wnkmhy4E9S95ZLMEa8NcSTzPmGBLVCejhW80soa/tp7po274C17OlbNOdjEcs09Ifam3xiO7Lczj8JddDBGBy/fSzFICL1ggkxItjdgS57ZdRwWvncVSkd345s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770963277; c=relaxed/simple;
	bh=spCy31IL8myHuBSyJSpd6fMfKjCTNBgbex3Y1uMDaqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9MBscp8Feo2twXrgxatz9mx3lC1qGspeBPf5w260sOPvuTlcphUODpcH22tp5yLijSzfub0Pq38Ir9teHuPG0sS7gwfr8ts3kGl0NVMX/dcrwoF9ztYecdKpBYW0YdxuoRgc6BkBFf4GNzbjMi1HQ2cHejmZl7uiN+fFmuL/Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=MbCMSAQl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="MbCMSAQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1770963267;
	bh=6lih/soOQLT0IASnOkxydfP8yu4mvx6Jlp2kt942dmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MbCMSAQlnv7VOtpfyLPsApF0pZGMNXWOZiG+1C1PsxYz9atVq83d+ohl8ypMHu7MN
	 nEeadmxWKCVaFsIEWhv6hujQtsw8dQsy7/J2ZwYZQJaAtpJySuvU6HQIL7lu5lb8TV
	 QhanciQFbApcO+OaRexYls3rqnriy6O1JPDZlz3A17K5eBvNjQRo3rdeDkXsFFgBoH
	 jQRzsWRCA9lP7/Qhk9yUtWC0QHk5xHGG6iJe7v6o3dk4AOCOt3LtqmxY14rVP3Xy0I
	 Yx8Uslp4y8sXp6ao5Tg0LCXxRXzQhCzZc2uJtoMFzD/mAv3VyACHpisLElgt83qcML
	 Sfgszr/UCqWqg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fC21v5PfBz4vyg; Fri, 13 Feb 2026 17:14:27 +1100 (AEDT)
Date: Fri, 13 Feb 2026 16:16:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: Yao Zi <me@ziyao.cc>, Kyle Bonnici <kylebonnici@hotmail.com>,
	"devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Subject: Re: Ranges - Intended use case
Message-ID: <aY6zs4_vvemGd5eK@zatzit>
References: <7CB259ED-7AFC-4EE1-A926-54A5F6DCD97B@hotmail.com>
 <aY3yzUGLHU-wxue9@pie>
 <CAL_JsqJOO9c5HVmHcFC5COE6nJQ4wDrpvwhtTPXvGmFYjL2ySA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IS8tP/3deCdLzXAg"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJOO9c5HVmHcFC5COE6nJQ4wDrpvwhtTPXvGmFYjL2ySA@mail.gmail.com>


--IS8tP/3deCdLzXAg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 01:24:20PM -0600, Rob Herring wrote:
> On Thu, Feb 12, 2026 at 9:33=E2=80=AFAM Yao Zi <me@ziyao.cc> wrote:
> >
> > On Thu, Feb 12, 2026 at 01:14:33PM +0000, Kyle Bonnici wrote:
> > > Hi
> > >
> > > I have been trying to understand how ranges should/should not be used.
> > >
> > > Looking at the spec
> > >
> > > > The ranges property provides a means of defining a mapping or trans=
lation between the address space of the
> > > bus (the child address space) and the address space of the bus node=
=E2=80=99s parent (the parent address space).
> > >
> > > This to me the spec leave some space for interpretation on if ranges =
should be used on just buses or not. Below are some examples to try to get =
a better understanding.
> >
> > I'd like to say ranges literally specifies the translation process
> > between the children address space and the parent one, regardless
> > whether the parent is a "bus".
>=20
> Yes.
>=20
> To put it simply, "ranges" should be used whenever the child nodes
> have memory-mapped CPU addresses.

That's the most common case, but others exist.  You can encode cases
where a device's registers are mapped into its parent's bus address
space, but that parent address space is never mapped into the CPU MMIO
space.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--IS8tP/3deCdLzXAg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmmOs6kACgkQzQJF27ox
2GdqihAAnm2SEblGkpXJG1QA38VeFTUusdoKJX4Or85aEkaqPDcO9YTSgkGBh8Fi
734+Z0DLWWUsddLmfR+sPB49UcxWtZLBJSYrcSoiytZLMsnOo76CV4l7G8x9yMV/
zsyeoiK6wdlBjhblyh+1IbIn7I4qzGN9EmaUOVHIyUTFk9Xzj/Jj0tVue1xcfMet
Je2WXClIVsjxBsjNAoSzHEJkaUZ/lmmFg+oruvtRgTz5v52wMoS/XPU96qSpACJY
5f+vFn7KSeBqhvuhwoiSEUoV7cxfybCK8JfjoOtQoSviWChSK19Qi2LEdRamHMZT
0KO4/51UnwDG2XrDkO0yJ/qpDVr2p/wJBAGvYh8F2G0grfiNaCFNVpGnYPQtM1GC
c7Zq349KH64IoyC/HCHTqASI/Unqqlf2USR6bacpQJB2fLjMfYJ0SxNGUPng/7ue
5uWKaIWq8XVCH1L6zSGBPRg9l6uzMA0eqa/FMgkwMs1DS8gxypDJ/R7IbSKISDmM
8+XeckfMEQ+8m8r7TJ0IDoieJKJOkN8D3H6ZauN9zDbgvPRHtHUVpsm/j8MKws4m
mpws83PwCdvfxQ3yptdo7uNv6DNx/iDNaV8m2AfcAA2Oyp23jAlMgPKA3NfZMlHl
chToAY48CnpVGm5jveHlqklU6JdGXdqu70e0Y1OlOVGuDzeU4v8=
=fbky
-----END PGP SIGNATURE-----

--IS8tP/3deCdLzXAg--
