Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58981217723;
	Sun,  5 Apr 2026 04:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775364237; cv=none; b=QQlsDiZzeDzOnmYk0W/ky5KNl/uiDECzLQWwCyTOWq/D/jc/EkG5KmJq1yPqZkH2Hd7N7Yf6mQVf5X6zy+kGKzeXcFo4hYjGbFKQkUdDaShdkOVzK6WFU3zQPb/5+Ue3KfUG8oJYSx/d8np+VyY/q+AoyuSKkuOD9j/xU0Mx12M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775364237; c=relaxed/simple;
	bh=xYWWsOBq/IkUyYw0rCAR2gU4/9JzimFlNsdSfiYKC7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZIo3YVwl9p9FeUk4qQPcYI9leq94CstN6U/zvxVuhp4AkPylsCgth3GoH/QrYfwma6kCOanzCHSYa/5uGjqOWgXdqomaH6/BCuVnDBhm924NNdHOuZaG3gglrL6ELjzll7SPoKt8ADHfa0mQaE9954Q4erwHgJth5GLrzhY64Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=CkxUvMHE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="CkxUvMHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1775364227;
	bh=y7CXeBOuYe7WW5GdJ5bUQa9x8GPB//iu+ag7v6WwImM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CkxUvMHERx8K+4quCntCV8tA+ksMqAuXA21UMHBASyuWyc7WPF5uaLSY6HVtiLsa7
	 FLNsPC//21tEB44uSbO6/Ck0ilqvcf4IJEhpfd6iWx+ba+5S18NN1qK8rcJhQq/lMW
	 vPzM63K2ytFabUDmmpMekBOzl7AzK4NexdULEn62xyBE2V9kFimoGMRWgNgClwttEY
	 RXGgIOkx/EZAQNz/atdVrcVkKHK/qoz/EWWtCkkjdket3471Bl8qmumi8kuFn3Ifvq
	 R8Kl0kxeLbikpbCJQVylOzi/As5z3hzFeQawv59/d2uDfLa4hJOp86wcXp16qWEijY
	 WxHlmQGnBBIjw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fpKbl6rR1z4wHv; Sun, 05 Apr 2026 14:43:47 +1000 (AEST)
Date: Sun, 5 Apr 2026 14:43:41 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: devicetree-spec@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
Subject: Re: Devicetree spec: Specifying /cpus/cpu@* unit address format?
Message-ID: <adHofcKAr7C5YCSA@zatzit>
References: <00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F/G3fJTJhrM6n45B"
Content-Disposition: inline
In-Reply-To: <00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn>


--F/G3fJTJhrM6n45B
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 06:06:17PM +0800, Vivian Wang wrote:
> (Also posted at: https://github.com/devicetree-org/devicetree-specificati=
on/issues/86 )
>=20
> Hi all,
>=20
> Presently, there seems to be some confusion in the community about the
> format of unit addresses for "/cpus/cpu@*" nodes for a CPU with ID > 9, e=
=2Eg.
>=20
> =A0 =A0 cpu@??? {
> =A0 =A0 =A0 =A0 reg =3D <10>;
> =A0 =A0 =A0 =A0 /* reg =3D <0xa>; */ /* This should be equivalent */
> =A0 =A0 }
>=20
>=20
> Should this be a decimal "cpu@10", or hexadecimal "cpu@a"? I can't find
> any explicit specification.

It should be hex.  That's a general convention for unit addresses.
Before flattened trees, OF essentially never used decimal
representations of things.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--F/G3fJTJhrM6n45B
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmnR6G4ACgkQzQJF27ox
2GfawxAAniXNBqMHwatrWhZhfnBwYG+zYbBqBPr3X8wjwwpBWhglY0IXR8XkdoUk
Zn0gfxCLzh1cKBLzSlDvXte2b1FFcgIPu6V8jEV9kdYkQrClCknZA7KRjmZlDni7
xpUXHgLW2SZDHT2d9Ao3Rg/MWqrS+DAUPfzwElR1ZLIHXM0FRkREpnJfWFja9m/0
aH1JgDwHz+FUGUieeh9RrdnyWVjl5rdlO8DAogTFNOgrn239rsv7El/fm/7aZSvc
iX+XKowv2EW2xIk6/UzaoHFXQ4FQN00NIZPZnfaxO7txWzpyyqH+NNoKYw9257zC
83/hPTWsIzYQ2jSsXKbRG3WQomA+gpkQ28XW7fPHOCNWLLnleSIYhHAK4iWCwlwH
41VhtpLiB/zn7NiS+t/rto0aGC72AW139lcCoJTtS9BsvOoOVt9PG3Bje23v1NRs
/MsLFAtesDSRj/xNMGQzRag2NK9yRd/yh/Wm2PdmT7LmDHUrukmjHlwGLz85/Ck7
s+2pzKzVRYsiMbqv7m3SPWtWTl6y16tin3KHcBZx+V4eh+oT9ZI6dDTfC1YqvNuk
ywT5aHxWfDeFvPPklQC8TzrTwK55twcgL3SJ3g5RcmORt1T8+nNRI4zkXZmFzn2/
aJ6HgJFHo7XBCRGBtuAcI3A7RXAJieqItx8g+O5ER2SfzPBi8FA=
=Fs1W
-----END PGP SIGNATURE-----

--F/G3fJTJhrM6n45B--
