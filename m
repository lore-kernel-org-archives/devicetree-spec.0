From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Formal grammar for DTS
Date: Mon, 2 Mar 2015 15:54:03 +1100
Message-ID: <20150302045403.GE29409@voom.fritz.box>
References: <54F1DD4F.3080304@codesourcery.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UnaWdueM1EBWVRzC"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54F1DD4F.3080304-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Stefan Seefeld <stefan-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--UnaWdueM1EBWVRzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2015 at 10:22:55AM -0500, Stefan Seefeld wrote:
> Hello,
>=20
> I would like to write a tool / library that allows me to
> (programmatically) edit .dts files, with the ability to regenerate the
> source files, preserving the original formatting (including comments and
> other non-semantic content).
>=20
> To that end I need a formal definition of the DTS grammar. While I have
> found the dtc tool, all its source files (in particular the dtc-lexer.l
> and dtc-parser.y files) are released under GPL, so it isn't entirely
> clear whether I may use the grammar encoded in those and transcribe that
> into my own (I'm writing my tool in Java, most likely using the JavaCC
> parser generator tool).
>=20
> So, is there another place where the grammar of Device Tree source files
> is formally defined in ways that allows tools developers to use that ?
> Any help and advice would be highly appreciated.

I'm not aware of any other presentation of the dts grammar than in the
source files.

IANAL, but fwiw, I wouldn't consider transcribing the grammar rules
(without the semantic actions) into some other form to be a derived
work triggering the GPL.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UnaWdueM1EBWVRzC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU8+zrAAoJEGw4ysog2bOS40MQAMoXCJoyeuhzw9yeI8wrXRea
WCorGIbFzUVBQWAS/02Nep4WYb1M1pXxQIOTw3kyZ9gm38li4GHfWnraiIdwRTpT
u0hyODELF3lB7fXS64PaLWI616IIcD2C/B6tJHLzTyfrN1kdxIMa8T3iouj6aPVg
3UnsTMPYlq1Yzh6p34UMq5mpgZzQk65ioz++GrKCplIhmvuM1Wl6fVwTHJJUC60O
XfpBqDw1UYYlkvNod0sQu8FUn6oNIpHxKHoZ5u+TJnffNA+iy/s+1bbYIDI8Pah8
35imGd2AL8A8THNn0nhAJP4O/uXlQkIKqs3z1hTrktJnLQYvDqZk0qh051a1Gpf3
DfhVCvzzXXo5V+o0eYxPI0EJGwpqz6csBPZAc5fO4LbQUkd4tsgDHsHDu5cHZl4v
Ri887TzSRFmpXHx3Hez3/ffuhxbcppPx/L2jQZayYcVA9tmtlQr3rtBrRMC3ciGQ
T2a2XmGKai0gS9nxnpIPS/hPJ7PJIlQbiLTFBpdKO23dnP9Gh4H11so4JkIwMS1b
sgXm1nwpew7V41V5f5mjrsV6Yyjw8wgEHhtMpH4btMaLwmf4exbOBOStwI9wpeKb
+9wsJTdQ6NsrW936fdVkFfJGLJs17+KnRoRJxtKdvcK/oNaKJtHc1SUyFJ5V2kar
5CXtu5phmqEFDLRIHwr1
=Rnwt
-----END PGP SIGNATURE-----

--UnaWdueM1EBWVRzC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
