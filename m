From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Fri, 28 Jul 2017 14:25:17 +1000
Message-ID: <20170728042517.GL3098@umbus.fritz.box>
References: <ok4f5h$qg1$1@blaine.gmane.org>
 <180baf3e-9e7b-c791-3be2-81d807b14759@gmail.com>
 <ok6su1$pdq$1@blaine.gmane.org>
 <4594fc97-9b9f-267e-ee8e-8cbe89341fe7@gmail.com>
 <20170716053548.GL17539@umbus.fritz.box>
 <597629DC.5060800@gmail.com>
 <20170725075034.GD8978@umbus.fritz.box>
 <597A53E1.4010002@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5LiOUhUlsRX0HDkW"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1501215983;
        bh=KaLUPuJXrVDdfYK6r7FBoTAU05FFUj5RwC+RB34hUiM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KTwLcpNC4WX0bVSaFxvFE/54NRGg3/O6QtYaL2fNIKx12aXqDUNeMJ7sjetZo8Gpy
         v1Qskp5+b0y4Yv1PtcyRgzahVAw+hOWaoASyi6bmeWB4c5YYt+krPdOjxut37ofERI
         wqzTA5HZmnNWxRDB8slUSP96dvxTJ5H7xwXKkAK0=
Content-Disposition: inline
In-Reply-To: <597A53E1.4010002-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>


--5LiOUhUlsRX0HDkW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 01:58:09PM -0700, Frank Rowand wrote:
> On 07/25/17 00:50, David Gibson wrote:
> > On Mon, Jul 24, 2017 at 10:09:48AM -0700, Frank Rowand wrote:
> >> Hi David,
> >>
> >> (Adding Pantelis and Tom, since I'm going somewhat off-topic from
> >> the original thread, and they are impacted by what I am asking.)
> >>
> >> On 07/15/17 22:35, David Gibson wrote:
> >>> On Thu, Jul 13, 2017 at 09:47:01AM -0700, Florian Fainelli wrote:
> >>>> On 07/12/2017 09:23 PM, Cyril Novikov wrote:
> >>>>> On 7/12/2017 10:10 AM, Florian Fainelli wrote:
> >>>>>> On 07/11/2017 11:15 PM, Cyril Novikov wrote:
> >>>>>>> Hi, all!
> >>>>>>>
> >>
> >> < snip >
> >>
> >>>   The
> >>> phandle fixup information goes into the special __local_fixups__ and
> >>> __fixups__ nodes (which have gratuitiously different format, but
> >>> that's a rant for elsewhere).
> >>
> >> < snip >
> >>
> >> And in another email, David describes the __local_fixups__ format
> >> nicely, so I'll just copy that here instead of re-inventing it:
> >>
> >>
> >>> Well, I don't want to invent a new encoding if we can possibly avoid
> >>> it.  The current encoding used for overlay generation looks like this
> >>>
> >>> / {
> >>> 	target: node@0 {
> >>> 	};
> >>> 	node@1 {
> >>> 		ref =3D <&target>;
> >>> 	};
> >>> 	__local_fixups__ =3D {
> >>> 		node@1 {
> >>> 			ref =3D <0>;
> >>> 		};
> >>> 	};
> >>> };
> >>>
> >>> Basically, __local_fixups__  has a subtree which paralells the main
> >>> tree.  Each property found under __local_fixups__ is a list of offsets
> >>> at which phandle references appear in the corresponding property in
> >>> the main tree.
> >>
> >> I share your desire to rant about the different formats between
> >> __local_fixups__ and __fixups__.  But I have not come up with an
> >> alternate format for __local_fixups__ that makes me happy.  The
> >> best format that I have come up with so far would be:
> >=20
> > Well to fix it minimally, I'd go the other way - make __fixups__ look
> > like __local_fixups__ but augmented with labels.  Strings that need
> > parsing aren't a normal thing in the DT.
>=20
> On the string parsing issue, I agree that string parsing is not normal
> in the DT.  If changing format in other ways, I would maybe also change
> the __fixups__ format so that (for an example with two tuples), instead
> of
>=20
>    "A:B:C", "D:E:F"
>=20
> the format would be
>=20
>    "A", "B", <C>, "D", "E", <F>.
>=20
> Or a more concrete example, change:
>=20
>    i2c1 =3D "/fragment@1:target:0";
>=20
> to=20
>=20
>    i2c1 =3D "/fragment@1", "target", <0>;
>=20
> or (to bikeshed) even change the order to:
>=20
>    i2c1 =3D <0>, "/fragment@1", "target">;

Right, but by re-using the parallel paths encoding from
__local_fixups__ you can also drop the path element, simplifying this
a bit further.

>=20
> This may look a little awkward in source form, but in my version
> of what the world should look like, this would not be hand coded
> in a DTS source file, but instead created by dtc in a DTB.  Of
> course it could still be viewed as DTS format by de-compiling
> the DTB.
>=20
> I admit this may be a really bad idea from a human usability
> standpoint, because the source fragment (for example):
>=20
>         __fixups__ {
>                 i2c1 =3D <0>, "/fragment@1", "target";
>                 i2c2 =3D <8>, "/fragment@1", "target";
>                 i2c3 =3D "/fragment@1", "target", <0>;
>                 i2c4 =3D "/fragment@1", "target", <8>;
>         };
>=20
> decompiles (via 'dtc -O dts') somewhat cryptically as:
>=20
> 	__fixups__ {
> 		i2c1 =3D "", "", "", "", "/fragment@1", "target";
> 		i2c2 =3D "", "", "", "\b/fragment@1", "target";
> 		i2c3 =3D "/fragment@1", "target", "", "", "", "";
> 		i2c4 =3D [2f 66 72 61 67 6d 65 6e 74 40 31 00 74 61 72 67 65 74 00 00 0=
0 00 08];
> 	};
>=20
>=20
> -Frank
>=20
> >=20
> >> / {
> >> 	target: node@0 {
> >> 	};
> >> 	node@1 {
> >> 		ref =3D <&target>;
> >>                 ref2 =3D <&target 42 &target_2>;
> >> 	};
> >>         target_2: node@2 {
> >>         };
> >> 	__local_fixups__ =3D {
> >> 		x1 =3D <"node@1/ref" 0>;
> >>                 x2 =3D <"node@1/ref2" 0 8>;
> >> 		};
> >> 	};
> >> };
> >>
> >> x1 and x2 are abitrary property names.
> >> The format of each __local_fixups__ property is
> >>    - path of property referencing a phandle
> >>    - list of offsets of the phandle in the property
> >>
> >> As another alternative, Grant was thinking about adding
> >> a new block to the FDT format to contain the phandle
> >> information.  That would remove the need to come up
> >> with a convoluted dts syntax, but adds in the problem
> >> of bootloaders corrupting the new block if they were
> >> not aware of it.  He had thoughts about versioning
> >> and checksums to detect the corruption it if did
> >> occur.
> >>
> >> If we were starting from scratch, do you have any other
> >> approach that might be fruitful?  It seems like maybe
> >> I am missing something that requires thinking outside
> >> the box.
> >=20
> > I thought about this the other day a bit.  If going from scratch, I
> > think the way to do it would be to add a new FDT_REF tag to the
> > structure block stream.  After the FDT_PROP tag and its contents,
> > you'd have an arbitrary number of FDT_REF tags, each giving an offset
> > in the preceding property  and a label to fix it up to match.  Not
> > sure if you'd want separate FDT_REF and FDT_LOCAL_REF or just use an
> > empty label to describe a local ref.
> >=20
> > This would also allow for extension to say FDT_PATH_REF to insert
> > paths rather than phandles (i.e. a runtime equivalent of prop =3D &foo;
> > rather than prop =3D < &foo >;).
> >=20
> > For encoding the fragments of an overlay, I'd suggest giving them
> > simply as separate subtrees in the structure block, all before the
> > FDT_END tag. At the moment there has to be only a single subtree
> > before the FDT_END, and the top-level FDT_BEGIN is expected to have an
> > empty name.  We can extend that to overlays by allowing multiple
> > subtrees, and making the top-level "name" the target label instead.
> >=20
> > Incidentally, I'd take "label" in all the above to be represented as
> > an old-style OF path.  That is, either an absolute path /foo/bar/baz,
> > or a path relative to an alias, alias/foo/bar/baz.  That means we can
> > just use the existing defined /aliases, rather than re-inventing it as
> > __symbols__.
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5LiOUhUlsRX0HDkW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll6vK0ACgkQbDjKyiDZ
s5JywBAA1WzfP+XYTYR8HZ+POBIx3CsH0i2Zauxo0JwXx2QVx73ABMDSI0EhwuGC
+lLDo34pUdzpUdB5qiejJHHqd+beWXtpPSWsTILnGgo6O0h/Rz9VRi899lvl8i3C
NInLOyUvA5AO4eiVcoERwE97MF+8ZMgQu7NXVPZghBtxwVwe5VKswYOZet/jl/wM
9W4zFPGiuVz0PbFRlCeHA7twObAD4ebFfBfMdzaCMzKiOdS6vey78q11E4ymega2
KX99Nk+WdU6jyDkS1VsbcI+S3MIWLQ3si+yhJnhVhvA7ameiE25GkVaeD+CpHFMD
pWMjQXbIOOyOrnoww18XooCgsZFzuOM54jvLFw6dLQC/UmzZu125xkvapaTAAa0o
R8s8LMcpxmuM/q6HOMKug0pm07v5HpKVpeW7CtgkvWN1UwmEeuM+05KlLwid+iAn
U0gaevXBXzObi7k6nMjioi2sNTEP6m19TKoDR/rM6lLz9PsQUEit0E2VqfElNM54
wvRflc5MmbP+XNGReKaTqv/CqvJyz81kIJf9Z6EiA8NrW3MU7YAkwLTmHVW5bqmb
35b93hSXnmt8RffCSOnajcS7M/gqo75OLLMYenWNYxutwCl6mD5iJ1tCp3Wpg1oR
oDfh5Juk4NQ0NqBPkYwd7949jCcjY3BbkiDOj2NnnePxDYVQjf0=
=qagP
-----END PGP SIGNATURE-----

--5LiOUhUlsRX0HDkW--
