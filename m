From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: How to describe internal flash (ROM) in the microcontroller
Date: Mon, 8 May 2017 15:38:21 +1000
Message-ID: <20170508053821.GD25748@umbus.fritz.box>
References: <1492886823.1240.5.camel@op.pl>
 <20170424012734.GB16882@umbus.fritz.box>
 <1493364100.1425.6.camel@op.pl>
 <CAL_Jsq+Gbu35bps2VcQ=pO3WyQE9VZhsuvpKtZ3TJ++B10jPWA@mail.gmail.com>
 <1493392846.1425.12.camel@op.pl>
 <20170501043819.GE13773@umbus.fritz.box>
 <1493806658.9572.2.camel@op.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wLAMOaPNJ0fu1fTG"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1494222010;
        bh=hPIfhX+xfW1tLV+TVKaQ43t4H9XXiB4ftN4+1VAniSM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NfwVbMqrxAxKCDUk8Pd2YPK316GUuY5ou88C6GsRc2UTqVcMizGs8t59hVByIKnh3
         GNDx0xS8iwZ9c2vknfa1Pdlbbdnach9WEp2nic77aBUBEJMIAHKIUlQIHllXwNVe1u
         VcAwbUmOaX6Yu/6VRFehgR7EwkbZ8ArzwVjsVjqk=
Content-Disposition: inline
In-Reply-To: <1493806658.9572.2.camel-FWhLrETftxM@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Freddie Chopin <freddie_chopin-FWhLrETftxM@public.gmane.org>
Cc: devicetree-spec <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--wLAMOaPNJ0fu1fTG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2017 at 12:17:38PM +0200, Freddie Chopin wrote:
> Hi!
>=20
> On Mon, 2017-05-01 at 14:38 +1000, David Gibson wrote:
> > There are existing CPU bindings which include additional properties
> > giving lists or bitmasks of optional features.=A0=A0For example the PAPR
> > standard requires this for guest device trees on POWER.=A0=A0It also
> > requires that there be a 'cpu-version' property which gives the
> > "logical PVR" which the OS is supposed to look at in most cases
> > instead of the physically discoverable PVR register contents.=A0=A0This
> > has applications for CPUs put into compatibility modes for
> > virtualization, so the use case isn't a perfect match, but the ideas
> > may be adaptable.
> >=20
> > What *is* a really good rule of thumb is don't invent a new way of
> > encoding this information if you can possibly avoid it.=A0=A0I don't kn=
ow
> > if the few cases of DT being used on x86 have something similar, but
> > if they do I'd expect it to use the same bitmask as the cpuid
> > instruction returns.=A0=A0In your case, if there are existing (read onl=
y)
> > registers that give the information you need, you could mirror their
> > value into the device tree
>=20
> I've just browsed the manual for ARMv7-M architecture and there are 3
> read-only registers which have that info, but with a small twist (;
>=20
> If the core has single-precision FPU, MVFR0-MVFR2 register values are
> 0x10110021, 0x11000011 and 0x00000000. This would be ARM Cortex-M4 with
> FPv4-SP-D16 or ARM Cortex-M7 with FPv5-SP-D16. If the core has double-
> precision FPU, the values of these registers are 0x10110221, 0x12000011
> and 0x00000040. This is a case for ARM Cortex-M7 with FPv5-D16. The
> slight twist is when the core has no FPU at all, as in that case the
> manual says these registers are not implemented at all, but I haven't
> checked yet whether any attempt to read them causes a fault or just
> returns zeroes.

That's ok - you can encode "register not present" by simply leaving
the property out, or leaving it empty (these are different and
distinguishable options).

> Could you point me to the binding which describes the properties you
> mentioned? I couldn't find 'cpu-version' in the device-tree-rebasing
> repository...

That should be in the LoPAPR spec, which you can get from

https://members.openpowerfoundation.org/document/dl/469

> Maybe - after all - it would be easier and more readable to have FPU as
> a subnode of the CPU? Sth like:
>=20
> cpus {
> 	cpu@0 {
> 		compatible =3D "arm,cortex-m4";
>=20
> 		fpu@0 {
> 			compatible =3D "arm,fpv4-sp-d16";
> 		};
> 	};
> };
>=20
> In this case it's pretty easy to extend that with an optional 'status =3D
> "okay";' / 'status =3D "disabled";' for the cases where the user doesn't
> want FPU to be "globally enabled" (useful when only one thread uses
> FPU, so there's no point in saving its context).

Urgh..

So, if this was a completely new binding for a completely new CPU, I'd
say that sounds like an excellent way of doing it.  But it's not.

There are lots and lots of existing ARM bindings out there for lots of
ARM CPUs, mostly higher end ones, many of which I presume include an
FPU, but which won't have this new proposed node.  This is pretty much
what I mean when I say "don't invent new ways of encoding things".

I think this is an argument for using "empty property" rather than
"missing property" for encoding a missing FPU.  That way your DT
client code has these options:

    no property =3D> unknown FPU state =3D> this DT is not suitable
    empty property =3D> no FPU
    properties present =3D> FPU present, tells you which type

In the first case you can at least error out sensibly   =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wLAMOaPNJ0fu1fTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZEARKAAoJEGw4ysog2bOScNsQAKvJC/KyjPOzQauGJNS53F8E
7YNHb2havWQ5vGWKgvz7nuz8Wg6b+NXiOefd2KeKo2UXxDDUzTQIM7tUWjgT6tMI
CxWkHo93aL9PTclCJxQlaZfjP7CsfE8UzIElfE7U18M1xI/vTW1x3RrrkJO2ZR95
oqBKmcxnV+i2sD393cWgTvcEJrfgOQmU5v9JR35PrrX4J3UPZMRNVVWtNgVQgznE
aykgoneoF7rMrSeXlybS1ncWt6QnsFK5BciMoGkg3xftinK7/QWtdLk2eEDjkQQD
rL37YwoMR7m3oyi3v7dYQjZotvk9v0C/U++2Dk8pwUz3U1EJzL6lApcEiuipxvCy
PasfIs7+eKq3ALP8S6NcAqtzH4fJq4fA2NPQnfZ5uH5gW6LiqK1JJ6gYUbXem/0w
WDhtf+/NNy0FwfQrsR3shZw2iXtdpcmq56ITYea8y9g21MOxFcuLwq3s0A7Z0pZ7
xFp3G9QCAAKLIbDjVYFTCnClfcL2CAEPIOhuoYCI3CpDnuE7BpiRzbV0qu2qprkC
5aeL2r4o0T23VqaZc7JaLB8fLqdD/J1tvaNJzYNx6ZyvJIAnJkgco7V6rWBPiTuI
JTB5hciXC+nmsU6sWG5a5J1F8Gi+XWsRX964BdfP3Or46hEbS9WFVVib24kuFRKT
Y0grt8anCVaMvAlIrLLB
=JEk0
-----END PGP SIGNATURE-----

--wLAMOaPNJ0fu1fTG--
