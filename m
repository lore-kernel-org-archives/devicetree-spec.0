From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: /aliases node and valid property names
Date: Mon, 20 Mar 2017 16:27:05 +1100
Message-ID: <20170320052705.GB29814@umbus.fritz.box>
References: <20170318011906.GA19897@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1489988843;
        bh=lOsfQDU4KYFpnE5V287zIi+iEZ1NIIejGxDLS+a1gKU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bqKgdbNFsDsYv5eiyQ7cyCRQ2K/AW2qjloOoGdpxCgntuFBK97sGm6UD434R4O1xk
         3+Jddhfz06DwhXW8aWUEJZOOtmaLt0hw34nfYNfCNbneG3ikHhyC9zO5qtnm5hXSyF
         adz/kPwjOU5PEwuOmlm4Tzx0ytd7mGH5Gjg3E37A=
Content-Disposition: inline
In-Reply-To: <20170318011906.GA19897@bill-the-cat>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 09:19:06PM -0400, Tom Rini wrote:
> Hey all,
>=20
> I found out about https://github.com/raspberrypi/firmware/issues/613 and
> in digging a little harder, this is not the first case where 'ethernet'
> has been added rather than 'ethernet0'.  Looking at the spec, it's
> implied (by all the examples) that property names end in a number but
> it's certainly allowable by the way things are worded to not.  Is it
> worth adding any further words here, another example, or just leaving
> everything alone?  Thanks!

Numbers shouldn't be required.  Certainly on old OF-era machines,
aliases called simply 'net' or 'disk' were both common and useful.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYz2gmAAoJEGw4ysog2bOSsacP/iib/ZignsbUHzkYlXd913f7
LtiFcJDuhd5+9j5VimQIgs8J5xi3ryP6pIFjaYQx5yfkQXXiTpgoxGczC0+bXdMD
oKNqR+l28yBXSvIEBY81lgExy3PyRWoBZIKLlfOPnCCmDlcmqyQEY4gBkgBnh2aV
gnLXzQmPIsowR3fQoMqbBzRvR/pO3wsCLRC+KX9yBcJNWOEv5gCVUihG5zHUxRPP
Cj+M0oUAGFpC7C3A9mpC+4Fk0MP3LKJSW7caHIwXghalQf0hyINjAUKSTVUFJG0T
8ryvsgQ7+JjpbVZLL2Kh7GT+TC/lBynxlpsSbqHrq+9PiZ9TZXG1C9US1H25mmaj
cSdqR8QZaO+3opQoaQKzxXwoi7ThcMxl/EsCcAgUa5lMIPv4oE+gbyEiYTe2An5+
Xlof8+1xprlHoapNXl1qG+VwEhrKZMcovZUcwlZUpprccWkdtaq7+5EMOQGQifUr
rRwpd2jLifHY92zOeuGre3VW6so/AHsp5EYDQf/6CI7Lq/K+ffDqEfg3U/c4cbMv
26rfdGULn9hFBx2nxKOEFzyZGW+j7SlIJPbYkAXeE+V/qpS8cZQnVWeNlb/T2lXj
VrMBQMI11xBthXLUveBj+JrfPdp3jCmmC5fUtsClYpKkhcO7LrwnhypcO+DHb8R/
as3Tiq1+K1FB2hw42GNE
=dDjP
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
