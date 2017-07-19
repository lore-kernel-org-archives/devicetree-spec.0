From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Wed, 19 Jul 2017 13:40:29 +1000
Message-ID: <20170719034029.GT3140@umbus.fritz.box>
References: <ok4f5h$qg1$1@blaine.gmane.org>
 <20170714105856.GB16128@leverpostej>
 <okjplq$7kf$1@blaine.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RlgFhasKO3bfRJ5j"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1500435637;
        bh=JiyI6qJGISn4AhP+TZ94tPyuDwjV3lB0ech18CpCEaw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p/G4p77C/eEdLRJM4KzNQquGJtE7SNuoSukMO9vSV+jhz7yoy34Q1CAJbs6A/8v/l
         I7kPYN4EPO9b/u907J5aUA6NlSpnIFuqXqUim1V0V2Sa1uYjNTnX/8aLNRGUJ/1BPJ
         SnhsBzFchTZiDFcW4rcmiOsl1o1z5xLMqU2YoryM=
Content-Disposition: inline
In-Reply-To: <okjplq$7kf$1@blaine.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--RlgFhasKO3bfRJ5j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2017 at 06:47:07PM -0700, Cyril Novikov wrote:
> On 7/14/2017 3:58 AM, Mark Rutland wrote:
>=20
> > > Would it be possible to add metadata properties to the binary FDT
> > > format, which would identify other property cells that are in fact
> > > phandles? It could be a per-node property or a single root node
> > > property, up to you guys. DTC would then automatically generate the
> > > metadata property along with the phandle property when compiling the
> > > DTS.
> >=20
> > Unfortunately, even ignoring the above, this metadata isn't likely to be
> > reliable, as after compilation, other agents (e.g. the bootloader) may
> > modify the FDT, without updating the metadata that they are not aware
> > of.
>=20
> Well, it depends on the design of said metadata. For example, imagine a n=
ode
> property named ".dependencies", which simply lists all phandles referenced
> by other properties in the same node. I would be very surprised if the
> bootloader does something that breaks that. It would require a major
> intervention into the FDT.

Well, I don't want to invent a new encoding if we can possibly avoid
it.  The current encoding used for overlay generation looks like this

/ {
	target: node@0 {
	};
	node@1 {
		ref =3D <&target>;
	};
	__local_fixups__ =3D {
		node@1 {
			ref =3D <0>;
		};
	};
};

Basically, __local_fixups__  has a subtree which paralells the main
tree.  Each property found under __local_fixups__ is a list of offsets
at which phandle references appear in the corresponding property in
the main tree.

That seems like it would survive most likely bootloader
transformations as well, I think.

> Even if they do, like I said in my reply to David, we don't strive to
> achieve a full automation, so it's probably tolerable. Oh well, we've mis=
sed
> some dependencies. It's still better than what we have now.

Ok.  I'm tentatively convinced that it's worth adding a switch to dtc
to generate __local_fixups__even for a non-plugin source.

Next step is for someone to propose a concrete patch.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RlgFhasKO3bfRJ5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAllu1K0ACgkQbDjKyiDZ
s5KFrg/+NgZR1AMlKUeqCQQMsF5UnouMJlCD/HWYeq/MVt2w9FQ7F3iIVk+7Q4yH
2MJ9XLhWuCis+9NBZTITRmIo2b+CGkgfpkTz+ia+nq4sQ08pyz+49DBJHyg07yzh
TQgPHsXjxzciPfmDmywG7zprO7dQCW9vIWnD3sx80qltSWfkPl/62NT3vMGeL5or
2vjqTi5JHOz+2MdAeMsCUnsG6OwNE2O1gOi4Zryeqys+zTz4GtF+VhaBLv9ekna1
3YXXvWgPkoA2X/IPVuVWj6kGKh8Lj3zo/wOevFZvGvulijyeHxPrm4J4+LVfF7gQ
Q7GRimjK3AjKHW7pIRl6eZIQPzQTEl736rR/4vBWWvxydR7bpomJEnVrYmDuNKxm
fVsBB0djtLD9E5JLicxQEChGVoHDBsqVRzcvRtyCrEHA3RPQ2KRLqYCN5WKXIw59
h4yueAr2RApYyA3PmzwD042hqmMkN/B8saHwKfQha3ksVC1p0ikqNehaFBEQCMR8
O7UU0aOwJneHOMCegt58wv3bDO9Ilo6o2gdh+gwcNmuMQVnX1q02J3GiTZdqOADk
3e11Hzs38pXbS6PsUQ5FHFGi+4529VPRnlcFzfl9wBMJ8lO+UuU2+DneeRZ1KRC+
Yb3tJldUkleXeRaYY7bEt7U6g0zftglhGafdTi49zAtvF/xvtpw=
=t9o4
-----END PGP SIGNATURE-----

--RlgFhasKO3bfRJ5j--
