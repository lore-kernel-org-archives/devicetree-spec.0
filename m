From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Wed, 19 Jul 2017 13:30:49 +1000
Message-ID: <20170719033049.GS3140@umbus.fritz.box>
References: <ok4f5h$qg1$1@blaine.gmane.org>
 <180baf3e-9e7b-c791-3be2-81d807b14759@gmail.com>
 <ok6su1$pdq$1@blaine.gmane.org>
 <4594fc97-9b9f-267e-ee8e-8cbe89341fe7@gmail.com>
 <20170716053548.GL17539@umbus.fritz.box>
 <okjp46$s1v$1@blaine.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZmeoGP/RI+eIV+cU"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1500435637;
        bh=Fm0LUXUBjhWP/FdeO3ysjyixe8mbmz4N7Ij5qVIMofE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ei+AUeUJd911owb+r9RxGwEaZDPaijd8qTA3EHi8EGo7Mrstp5/rrCS/p/mjbStUQ
         vlLy0U+m6Uw7AwoCJO7ur0ogz9nLXaJpDIx/XLp1d/bIeOE72A1YTMKi9nHDccY+NZ
         xlA3FwC3LsTjnH1Ze/dJMqCPdI6JE2cfde5yOJIE=
Content-Disposition: inline
In-Reply-To: <okjp46$s1v$1@blaine.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ZmeoGP/RI+eIV+cU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2017 at 06:37:47PM -0700, Cyril Novikov wrote:
> On 7/15/2017 10:35 PM, David Gibson wrote:
>=20
> > But.. I'm very uneasy about the idea.
> >=20
> > The first thing, is that this relies on the dts file containing the
> > &whatever phandle reference syntax wherever there should be a phandle
> > reference.  That's normal, but nothing stops a user from simply
> > putting an actual number there, manually assigning that number to
> > another node's phandle and generating a valid dtb that way.
> >=20
> > More importantly, it won't detect phandles if the tree comes from a
> > source other than a dts - for example if you flatten /proc/device-tree
> > with -I fs, or have code which flattens a tree presented by real Open
> > Firmware it won't have that phandle metadata, just integer values.
>=20
> Yeah, so the metadata does not contain full information. That's fine beca=
use
> it's still better than nothing.

Hm, ok.

> > Now those might not be something that happens in your use case, but
> > I'm pretty concerned that if I added this functionality, people are
> > going to forget that properties are all, fundamentally, bytestrings
> > and get surprised when tools don't magically know where the phandles
> > are in some cases.
> >=20
> > That said, I'm open to persuasion if a good enough case is made for
> > this functionality.
>=20
> So, what we need fundamentally is a way to detect dependencies in the
> devicetree. Mark is arguing that we cannot *automate* the assignment of
> dependent devices to the same VM. However, just detecting that there is a
> missing dependency goes a long way. What we have now is guest drivers
> failing in various manners, but what they cannot do is point the user to =
the
> specific device that they need, because they don't have the host FDT in
> their VM.

Makes sense.

> For example, a driver may print something like
>=20
> [    2.035071] xuartps ff000000.serial: pclk clock not found.
>=20
> To resolve this, the user needs to be proficient with the device tree. Of
> course, "pclk" is not a node name in the host FDT. However, if configurat=
ion
> software could detect this at the time the set of the VM's assigned physi=
cal
> devices was created, it could give the user the name of the device that
> *probably* also needs to be assigned to the same VM. The user wouldn't ne=
ed
> to learn anything about devicetree, they would just need to do a few mouse
> clicks to assign the dependent device. And now it's the software's concern
> if that assignment is not trivial, as Mark warns us.
>=20
> To summarize, full automation is unfeasible and it is understood, but just
> the dependency information is very helpful too.

Ok, sounds plausible.

> > But then, as Mark Rutland says in his other replies, locating phandles
> > is far from the only problem in trying to passthrough random DT nodes
> > to a guest.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZmeoGP/RI+eIV+cU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAllu0mkACgkQbDjKyiDZ
s5LyDQ//WQv/F0biBFIeOAJe6ZJWvjqJ4M6CDIBO/hVvZRSR91hqv1Vgh8d1I0Zc
vayePslq4vaoLuFIJVXc6n1jfUQP6J2j44Q306nGoa5BGgQ2d3+BbcZ5WZhoeZDE
+HibwxiLRwjv+Qnu4Fc4IHz8EeaIVeVen6kFeEZlJr3xRpWPVTsCcVB0m/zuZztg
eUDo2Y4uew2/Ys8tSMlmpVL/T9KVWYdylfaDVioMClwlt7UfMXQVqA52GG+TJKyr
lCOeeJ76hqbcFjpniWBYnYXybauWJdopZjHx7WsKnNQyDbpBRu08gNyDySPseiN+
1XIH3xHZErS7ijW4fXZoPiyNOiGuTr4zv4rGoQFUdC6QYggX27SllSKCsvbRVL/x
sAaSIEJFpcxEveZ7gcdpzkXYJTp8N4/TKiNuvyskiZ+wkuOt4VzpnxwCB9ii89wf
BEHwWcgdlhgKM7+NoV+S2krUkzxIXqV1OAKFwHOcrcuTuy6C1NyPpQRNzP8q2SeT
KsQCAlY0ysyyadLmxuwLPRQey6DsZ6s78F4OomWFx/cZhPmwcFLZ3sp+TRkvapfw
RL1xqee8HUCGzdM7faCA58IEJaUieD7Z8SYzuwrpp4ebpoFfqzU0ubL77rIavJNj
3p1jKqikjAhy6p2aTUL5H6vptXYt8TA6aLnaCf8+ox9a1RYLvBo=
=p7hV
-----END PGP SIGNATURE-----

--ZmeoGP/RI+eIV+cU--
