From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Tue, 25 Jul 2017 17:50:34 +1000
Message-ID: <20170725075034.GD8978@umbus.fritz.box>
References: <ok4f5h$qg1$1@blaine.gmane.org>
 <180baf3e-9e7b-c791-3be2-81d807b14759@gmail.com>
 <ok6su1$pdq$1@blaine.gmane.org>
 <4594fc97-9b9f-267e-ee8e-8cbe89341fe7@gmail.com>
 <20170716053548.GL17539@umbus.fritz.box>
 <597629DC.5060800@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EP0wieDxd4TSJjHq"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1500981669;
        bh=3tkQ4An0DujTj6arREEg+AwgDcvfkxLZZtECVvj8MlY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PzsyUemL+BU/P6jvh30AhAFHK44wAA8qxTfWDCLwe/eEepHLwvsqf8NTLbRBLO6Y+
         xn5TVEyeetDS518w06/YHuhwq30m75yMMEziFTs4O0VFMYTKT35ZhJj/qLv3dAtNdY
         j3wEftbbwI6VOwGpQqrh548OLJl6TjlfPb5oBKJM=
Content-Disposition: inline
In-Reply-To: <597629DC.5060800-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>


--EP0wieDxd4TSJjHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2017 at 10:09:48AM -0700, Frank Rowand wrote:
> Hi David,
>=20
> (Adding Pantelis and Tom, since I'm going somewhat off-topic from
> the original thread, and they are impacted by what I am asking.)
>=20
> On 07/15/17 22:35, David Gibson wrote:
> > On Thu, Jul 13, 2017 at 09:47:01AM -0700, Florian Fainelli wrote:
> >> On 07/12/2017 09:23 PM, Cyril Novikov wrote:
> >>> On 7/12/2017 10:10 AM, Florian Fainelli wrote:
> >>>> On 07/11/2017 11:15 PM, Cyril Novikov wrote:
> >>>>> Hi, all!
> >>>>>
>=20
> < snip >
>=20
> >   The
> > phandle fixup information goes into the special __local_fixups__ and
> > __fixups__ nodes (which have gratuitiously different format, but
> > that's a rant for elsewhere).
>=20
> < snip >
>=20
> And in another email, David describes the __local_fixups__ format
> nicely, so I'll just copy that here instead of re-inventing it:
>=20
>=20
> > Well, I don't want to invent a new encoding if we can possibly avoid
> > it.  The current encoding used for overlay generation looks like this
> >=20
> > / {
> > 	target: node@0 {
> > 	};
> > 	node@1 {
> > 		ref =3D <&target>;
> > 	};
> > 	__local_fixups__ =3D {
> > 		node@1 {
> > 			ref =3D <0>;
> > 		};
> > 	};
> > };
> >=20
> > Basically, __local_fixups__  has a subtree which paralells the main
> > tree.  Each property found under __local_fixups__ is a list of offsets
> > at which phandle references appear in the corresponding property in
> > the main tree.
>=20
> I share your desire to rant about the different formats between
> __local_fixups__ and __fixups__.  But I have not come up with an
> alternate format for __local_fixups__ that makes me happy.  The
> best format that I have come up with so far would be:

Well to fix it minimally, I'd go the other way - make __fixups__ look
like __local_fixups__ but augmented with labels.  Strings that need
parsing aren't a normal thing in the DT.

> / {
> 	target: node@0 {
> 	};
> 	node@1 {
> 		ref =3D <&target>;
>                 ref2 =3D <&target 42 &target_2>;
> 	};
>         target_2: node@2 {
>         };
> 	__local_fixups__ =3D {
> 		x1 =3D <"node@1/ref" 0>;
>                 x2 =3D <"node@1/ref2" 0 8>;
> 		};
> 	};
> };
>=20
> x1 and x2 are abitrary property names.
> The format of each __local_fixups__ property is
>    - path of property referencing a phandle
>    - list of offsets of the phandle in the property
>=20
> As another alternative, Grant was thinking about adding
> a new block to the FDT format to contain the phandle
> information.  That would remove the need to come up
> with a convoluted dts syntax, but adds in the problem
> of bootloaders corrupting the new block if they were
> not aware of it.  He had thoughts about versioning
> and checksums to detect the corruption it if did
> occur.
>=20
> If we were starting from scratch, do you have any other
> approach that might be fruitful?  It seems like maybe
> I am missing something that requires thinking outside
> the box.

I thought about this the other day a bit.  If going from scratch, I
think the way to do it would be to add a new FDT_REF tag to the
structure block stream.  After the FDT_PROP tag and its contents,
you'd have an arbitrary number of FDT_REF tags, each giving an offset
in the preceding property  and a label to fix it up to match.  Not
sure if you'd want separate FDT_REF and FDT_LOCAL_REF or just use an
empty label to describe a local ref.

This would also allow for extension to say FDT_PATH_REF to insert
paths rather than phandles (i.e. a runtime equivalent of prop =3D &foo;
rather than prop =3D < &foo >;).

For encoding the fragments of an overlay, I'd suggest giving them
simply as separate subtrees in the structure block, all before the
FDT_END tag. At the moment there has to be only a single subtree
before the FDT_END, and the top-level FDT_BEGIN is expected to have an
empty name.  We can extend that to overlays by allowing multiple
subtrees, and making the top-level "name" the target label instead.

Incidentally, I'd take "label" in all the above to be represented as
an old-style OF path.  That is, either an absolute path /foo/bar/baz,
or a path relative to an alias, alias/foo/bar/baz.  That means we can
just use the existing defined /aliases, rather than re-inventing it as
__symbols__.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EP0wieDxd4TSJjHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll2+EgACgkQbDjKyiDZ
s5KO5A//dujPOvrJEBOXQr+iWpbybDUuY0hQihItvsBLpatBFHoTcaJg6vUIowzS
JW7Nl5VEDJqUjKn74Op3Hcoyjxhc9C+2YSmZIXUM2/DiWRhM40iOp2mzmc9eOjet
ANJ44+nCQBWVq9HQWpOfT3+OtJ1G0C157ukrcRnTmoc+vvuy5FQfvLzwQvRnmFNw
ZKPR1f0D4sms35QPRbEWlarb3o5kUXLFvTPTSh9P9P0J+8299K+0YEzL7cNqYVn0
s3tqDpsv4VxrfPzcoubv7WSXiRQQPR+Y8OTLKyyxCWL3rdY6fWLEcH4mPbrDelg2
CW0zaw0TgwaPhSHX5jmEkZLyeUQM3UfbMdzqo7/WschAM1jCbucP3l8FI5FCooqn
7LfXk6UiXQpSb1EsA0ojfddy985q6K8ROS0ysx5oWQb1B5eYUH29Mlbo1YAQfd9E
24BgEQq56/QlP0mvB2QCvmB7afcI6gXOnyxZmvvKPv++Pt23qJEGdoW+70OR2+NR
umI6PGBrXDaFi4t+l1D3c5jyVSVxCq7hn3deV3vhWrD5vDADLHIvTj2Porw95LZ6
tEl/nSHI5sRmJl30GJdCZxtRLeB0yfNFXFfdAag1DxopllrsgFYHrw0GZmKxw27H
b+5UT7MKQXWNJoG2gBSRZz4onWgWMGNA/H8AO4C4xAUk8kJz49M=
=+ult
-----END PGP SIGNATURE-----

--EP0wieDxd4TSJjHq--
