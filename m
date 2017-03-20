From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: /aliases node and valid property names
Date: Mon, 20 Mar 2017 07:21:55 -0400
Message-ID: <20170320112155.GT19897@bill-the-cat>
References: <20170318011906.GA19897@bill-the-cat>
 <20170320052705.GB29814@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="isv1rEufa9FNa3Qd"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=58+O8RqOhGxWCDkG333We1NbTBBzN8yQ94EyCvJKsZ8=;
        b=OOxa31cLaX9bp7Qqi7JALfUmevIpe1tA/DAWwk6+9sZX5WeVIo8FYdKfhEOuWBjfHU
         WMSZ872GjSIAW46Cp9BQf0RC1UbqeZYp2wsqwlFSSFEsrgiLpkEHrxL+AEzpQLD9Aa5H
         /AcmaXQaPAmeeTWlP7K5Qcyj33oI5USAL8vJA=
Content-Disposition: inline
In-Reply-To: <20170320052705.GB29814-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--isv1rEufa9FNa3Qd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2017 at 04:27:05PM +1100, David Gibson wrote:
> On Fri, Mar 17, 2017 at 09:19:06PM -0400, Tom Rini wrote:
> > Hey all,
> >=20
> > I found out about https://github.com/raspberrypi/firmware/issues/613 and
> > in digging a little harder, this is not the first case where 'ethernet'
> > has been added rather than 'ethernet0'.  Looking at the spec, it's
> > implied (by all the examples) that property names end in a number but
> > it's certainly allowable by the way things are worded to not.  Is it
> > worth adding any further words here, another example, or just leaving
> > everything alone?  Thanks!
>=20
> Numbers shouldn't be required.  Certainly on old OF-era machines,
> aliases called simply 'net' or 'disk' were both common and useful.

OK.  So leave things alone, or add a sentence / example without (and
assume that this thread will be enough for anyone in the future who sees
the occasional alias without a number and wonders if that's valid) ?
Thanks!

--=20
Tom

--isv1rEufa9FNa3Qd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYz7tTAAoJEIf59jXTHXZSAt4P/1SnlBTZYlEHVLiMHWv3DI/K
4rEfs1mQAoN7ctgP/hINH3TzUCyBn+gerSWWnwqFC1cOsujT+RgVmwEjz0miZgaP
8l5dN/6d3O7VQMVMBZX4bmlSPDE5uy0s5OWjJhdoz07K311ZpM1yIBllSkMbbzvi
rjXaa54H9mgkaevMP8R+Fmi5Q5pU6l+BszIkqbQDv/wAkUQHngNpAh4pLJHkOOw8
YlOWQ/X28ZD5f3mvdvnEbX9ACr/MdbyjDWnGrNJ23T2KEGSTblskn8XlHNTmZ8wa
h19zMMckSY5iVp2rJo6cFKGCEP5LpjiAK4C+1IThlTQr2/HamF4OhHwg8PrP1GMH
8iji09sF1DGgkIeO6qHjLqrxheGdrtL6Swc0DXMK7KlLkyzQS8VdfD4BW8+Wbb++
iGoJeOhUZx5Z+ClbqtB3DJuw+T6knkqPeX3Typu3vZ77WUkBOY5bXzpwfg1D/E61
7mh7Sb9qVOTXfhlWmGQoeQNUci+nhGBlxoMfaMMqS0eO5RCszcQ4/sG4CU7T/Duj
/NEd1eqfhA9m4IBuafAY3EQS5CjdWDVGIyGeKCu9Lo1d4CBqpDedHiNrz4k1ykv7
Kr8/aJL6fa5k8PI0JsODLzanaxC6t1NtB6fX9czP7oWJu/UWooDb0yG7iav7Dsyv
0gW6jQmMFyyUUhZrO2tH
=tfWS
-----END PGP SIGNATURE-----

--isv1rEufa9FNa3Qd--
