From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Tue, 14 Nov 2017 11:11:14 +1100
Message-ID: <20171114001114.GC32308@umbus.fritz.box>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
 <CAL_JsqK1rtc81+=vzc36w4MRmQGYXBeib+QCj0TxtxEMVN2bKQ@mail.gmail.com>
 <8DE272D8-6004-4A47-B49C-D3DFB7D9E23C@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1510622437;
        bh=xnAs2tQCU53TI5XnQ0qPYnL4bcSapPDG+f93gKwcprg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xb3lg7YIERBlqWE9P8hSbQ71ovDeolA6c5TpCYWTC2BLPBNmJEGxWZb0T/hXor7Dk
         w4Kp93ppCPek5TFWdds1DR8jMxxPAZB2p0vfGVCz374KSNdU3mXEwmXYj3v+NZh6kt
         YxtuqiRrnNqyUUTwRLtxY4z4c/Nmtz1QwezkKP3A=
Content-Disposition: inline
In-Reply-To: <8DE272D8-6004-4A47-B49C-D3DFB7D9E23C-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 03, 2017 at 04:11:46PM +0200, Pantelis Antoniou wrote:
> Hi Rob,
>=20
> > On Nov 3, 2017, at 15:59 , Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >=20
> > On Thu, Nov 2, 2017 at 11:44 AM, Grant Likely <grant.likely@secretlab.c=
a> wrote:
> >> Hi Pantelis and Rob,
> >>=20
> >> After the workshop next week, I'm trying to capture the direction
> >> we're going for the schema format. Roughly I think we're aiming
> >> towards:
> >>=20
> >> - Schema files to be written in YAML
> >> - DT files shall remain written in DTS for the foreseeable future.
> >> YAML will be treated as an intermediary format
> >>  - That said, we'll try to make design decisions that allow YAML to
> >> be used as a source format.
> >> - All schema files and yaml-encoded-dt files must be parsable by stock
> >> YAML parsers
> >> - Schema files to use the jsonschema vocabulary
> >>  - (jsonschema assumes json files, but YAML is a superset so this will=
 be okay)
> >>  - Extended to add vocabulary for DT concepts (ignored by stock valida=
tors)
> >>    - C-like expressions as used in Pantelis' yamldt could be added in =
this way
> >>  - Need to write a jsonschema "metaschema" do define DT specific exten=
sions
> >>    - metaschema will be used to validate format of schema files
> >>    - Existing tools can confirm is schema files are in the right forma=
t.
> >>    - will make review a lot easier.
> >=20
> > I want to start small here with defining top-level board/soc bindings.
> > This is essentially just defining the root node compatible strings.
> > Seems easy enough, right? However, I quickly run into the problem of
> > how to match for when to apply the schema. "compatible" is the obvious
> > choice, but that's also what I'm checking. We can't key off of what we
> > are validating. So we really need 2 schema. The first is for matching
> > on any valid compatible for board, then 2nd is checking for valid
> > combinations (e.g. 1 board compatible followed by 1 SoC compatible). I
> > don't like that as we'd be listing compatibles twice. An alternative
> > would be we apply every board schema and exactly 1 must pass. Perhaps
> > we generate a schema that's a "oneOf" of all the boards? Then we just
> > need to tag board schemas in some way.
> >=20
>=20
> I=E2=80=99ve run into this as the first problem with validation using com=
patible properties.
>=20
> The way I=E2=80=99ve solved it is by having a =E2=80=98selected=E2=80=99 =
property that is generating
> a test for when to check a binding against a node.
>=20
> For a concrete example using the spi-slave binding
>=20
> =E2=80=94- spi-slave.yaml ---
> ...
> inherings: *device-compatible
> =E2=80=A6
>=20
> Where device compatible is:
>=20
> %YAML 1.1
> ---
> device-compatible: &device-compatible
>   title: Contraint for devices with compatible properties
>   # select node for checking when the compatible constraint and
>   # the device status enable constraint are met.
>   selected: [ "compatible", *device-status-enabled ]
>=20
>   class: constraint
>   virtual: true
>=20
> The selected property here declares that any =E2=80=9Ccompatible=E2=80=9D=
 property constraint
> for the node under test must match and that the device-status-enabled
> rule matches too.

I think the basic idea of having a "selector" that says when the
binding applies is correct.  However, I think the details of this
verison (AFAICT) are a bit too ad hoc.

I think of it in terms of "patterns" which a node might or might not
match.  Those can be simple {compatible includes "blah"} or complex -
a full set of binding requirements.

Bindings will generally be of the form:
	if (PatternA) matches
		then (PatternB) must match

e.g.
	if (compatible includes "blah")
		then ("blah" binding details) must match

or
	if ("interrupts" exists)
		then (irq binding must apply)

But in order to keep things general, both the "selector" and the
"requirements" patterns should be specified in the same way.

I had the feeling that jsonschema worked that way from Grant's talk,
although I'm not 100% certain.

>=20
> The device-status-enabled is declared as follows:
>=20
> %YAML 1.1
> ---
> device-enabled:
>   title: Contraint for enabled devices
> =20
>   class: constraint
>   virtual: true
>  =20
>   properties:
>     status: &device-status-enabled
>       category: optional
>       type: str
>       description: Marks device state as enabled
>       constraint: |
>         !exists || streq(v, "okay") || streq(v, "ok=E2=80=9D)
>=20
> This declares that the constraint matches when either the optional
> status property is not present or if it is, it=E2=80=99s either =E2=80=9C=
okay=E2=80=9D or =E2=80=9Cok=E2=80=9D.
>=20
> Taken together when the spi-slave binding is inherited (for instance
> by the jedec,spi-nor binding:
>=20
> =E2=80=94 jedec,spi-nor.yaml =E2=80=94
>=20
> =E2=80=A6
> inherits: *spi-slave
>=20
> =E2=80=A6
>   compatible: &jedec-spi-nor-compatible
>   category: required
>   type: strseq
>   constraint: |=20
>     anystreq(v,  "at25df321a") ||
>      =E2=80=A6.
>=20
>=20
> > I'm thinking of this very specific case, but no doubt it is going to
> > apply in other places. This has been one of the harder problems with
> > writing dtc checks. What to key off of to trigger checks and how to
> > check errors in the key itself.
> >=20
> > Rob
>=20
> Regards
>=20
> =E2=80=94 Pantelis
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloKNJ8ACgkQbDjKyiDZ
s5Ltcw/+PyUxWo8P5JxDRvCDVP8huMFEhTQkaCEKAP4P1+WmWb9t69bI9yBQgiU2
Dw4CIByA03bm9hio58ky8mfSOU43Wsz/cbxhV1ie/GudGxe0MIRfMomJkJM6KTC3
Ou9Gz9aYeP4CqxMDg3fL5NuXC3L98uqp81nTJYZD5Q44xM6Zv9QFKZxAOhq1l1z9
Hc0LPXA9/OG05KLGiNv+chjonbAj8/5wY1ofywhKQvEzWoDkojYkVAvICKhQBSrF
ntPj1FCCtFD655mKe+weIVbo8jU/JdmhP7RQtJLPG1duj/I1tGoRUNorcP5nCKQS
c5isT2E0/jx/nZ4J9E+2b6e9SR0e5yuKwdjBp0hdunAeXliEftGjsun/IvpIu40J
N0aEL9UqzKAeIQLopGktm73MQYSMDEA5fxWjh6uI0TrNEW8qL4BiiB2zbye9W23y
c16GA0WIHBTwcGA9Q2jIwAUlHD67EuzOpX02g2v/4eWcD3bWMaM+z75+4qyohwVO
rVqZrRhPZON82YHloV/NQ2H2pTxp7usr3tlurSRKgto4KVFT2CzhpN7+r8DTl1Bw
bzbaJs0PcegZnw0BFhV5H3UxcyZ98rXAmOrD1PYt5ffcoVolJO5zZp9P8UftWEqM
x78VBrFejpZtCRRoR0JZS9n19qKWZAAhjB0RKH4/eZ2gqIs1E0g=
=m0mC
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
