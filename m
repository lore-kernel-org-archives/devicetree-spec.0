From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Sun, 16 Jul 2017 15:35:48 +1000
Message-ID: <20170716053548.GL17539@umbus.fritz.box>
References: <ok4f5h$qg1$1@blaine.gmane.org>
 <180baf3e-9e7b-c791-3be2-81d807b14759@gmail.com>
 <ok6su1$pdq$1@blaine.gmane.org>
 <4594fc97-9b9f-267e-ee8e-8cbe89341fe7@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fDERRRNgB4on1jOB"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1500183365;
        bh=GGN4JUqdVzlyZ2IaTDkDcwzMK9rHJaxO5jRKYSAE7SQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pU5xwV5VCj9W4GFUwPGD72Xl0vaF8346jc8I+bejZasqjfcFeAplIy4QLcJUERI02
         ZPMD6/mMLYzJ3EYvcqLRXYBcf6lP3KoyErmI6P22N1mDOZHqkasejKiAauBD43LCM0
         heEW3m24FhGr7wfrqavzhvi/q8VgNh45d88zxxeo=
Content-Disposition: inline
In-Reply-To: <4594fc97-9b9f-267e-ee8e-8cbe89341fe7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--fDERRRNgB4on1jOB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2017 at 09:47:01AM -0700, Florian Fainelli wrote:
> On 07/12/2017 09:23 PM, Cyril Novikov wrote:
> > On 7/12/2017 10:10 AM, Florian Fainelli wrote:
> >> On 07/11/2017 11:15 PM, Cyril Novikov wrote:
> >>> Hi, all!
> >>>
> >>> The product that I work on supports physical device assignment (aka
> >>> "pass-through") to virtual machines, which means we need to take
> >>> portions of the physical FDT and include them in the guest FDT. This
> >>> needs to happen automatically in software.
> >>>
> >>> The problem is phandles, because we cannot identify them in the blob =
and
> >>> therefore can't find any dependent devices/nodes that also need to be
> >>> included in the guest FDT. So the process cannot be fully automated. =
We
> >>> can't even advise the user what other devices should be assigned to t=
he
> >>> VM. The hypervisor runs or bare metal, so having to parse the source =
DTS
> >>> files for this is very inconvenient.
> >>>
> >>> Would it be possible to add metadata properties to the binary FDT
> >>> format, which would identify other property cells that are in fact
> >>> phandles? It could be a per-node property or a single root node
> >>> property, up to you guys. DTC would then automatically generate the
> >>> metadata property along with the phandle property when compiling the
> >>> DTS.
> >>
> >> phandles are already per-node properties, they are not quite different
> >> from normal properties actually. If a node is referred to by other
> >> nodes, the DTC compiler would add a phandle =3D <N> (and maybe even
> >> linux,phandle =3D <N> depending on options passed to it) where N is a
> >> global integer that keeps being incremented every time a new phandle is
> >> generated.
> >>
> >> When you strip or create new nodes from a base blob for your virtual
> >> machine, either the node is still existing, in which case its phandle
> >> property (if existing) is still valid and can still be referenced to, =
or
> >> it is a new node and then you can control how to allocate new phandle
> >> integers.
> >>
> >> I guess I am just not clear on what problem you are seeing with phandl=
es
> >> based on your description of what you want to do?
> >=20
> > Maybe I should have worded it differently: the problem is with phandle
> > references rather than phandle properties themselves, does it make it
> > more clear?
>=20
> It does, thanks.
>=20
> > There is no way to know that a certain aligned 4 byte
> > sequence is a phandle that references another part of the FDT.

In fact a phandle reference doesn't even have to be 4-byte aligned.

> You can
> > for some standard properties whose format is known not only to the
> > driver, but you can't in general. That makes it impossible to analyze
> > and detect dependencies between different parts of the FDT automaticall=
y.
>=20
> I see what you mean now, there is indeed no way to tell whether a
> property that has an integer is just a normal integer versus an integer
> corresponding to a phandle.

Right.  Device tree properties are simply bytestrings until you use a
binding to interpret them.

> You could argue that property that specify a phandle should have a name
> that suggests so, like "phy-handle" but then this stops working with
> e.g: gpios that are (at least with Linux) specified as e.g: reset-gpios.

Not to mention that it doesn't help with properties which include
phandle references along with other information.

> In any case, you would have to have some sort of heuristic built into
> your FDT mangling code that tries to check if a given property is
> designating a phandle as opposed to having a more robust approach...

> > I think this situation is solvable with automatically DTC-generated
> > metadata. I'm also interested if there are other hypervisor vendors that
> > had to deal with this and how big is the demand for a solution. If we
> > are the first one, at least let it register that there's a problem and
> > interest in addressing it.
>=20
> That would work, I have not heard of a similar problem with the
> hypervisor folks that I worked with, but AFAIR they were generating
> their DTS almost from scratch as opposed to mangling/passing through
> parts of an existing one.

So.  dtc in fact already has code to add metadata which marks phandle
references - so far it's only used in "plugin" files which are
intended to compile into overlays which can be runtime applied.  The
phandle fixup information goes into the special __local_fixups__ and
__fixups__ nodes (which have gratuitiously different format, but
that's a rant for elsewhere).

I've had a request from someone else to add __local_fixups__
information in a non-plugin tree for yet another application, and it
would be pretty straightforward to implement that.

But.. I'm very uneasy about the idea.

The first thing, is that this relies on the dts file containing the
&whatever phandle reference syntax wherever there should be a phandle
reference.  That's normal, but nothing stops a user from simply
putting an actual number there, manually assigning that number to
another node's phandle and generating a valid dtb that way.

More importantly, it won't detect phandles if the tree comes from a
source other than a dts - for example if you flatten /proc/device-tree
with -I fs, or have code which flattens a tree presented by real Open
Firmware it won't have that phandle metadata, just integer values.

Now those might not be something that happens in your use case, but
I'm pretty concerned that if I added this functionality, people are
going to forget that properties are all, fundamentally, bytestrings
and get surprised when tools don't magically know where the phandles
are in some cases.

That said, I'm open to persuasion if a good enough case is made for
this functionality.


But then, as Mark Rutland says in his other replies, locating phandles
is far from the only problem in trying to passthrough random DT nodes
to a guest.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fDERRRNgB4on1jOB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAllq+zIACgkQbDjKyiDZ
s5JZfg//cBbTywyiN6Fe1dXrwPQwC1EJBqrjf7n+M18u2yA/tMt1pslW4VESaInZ
XDYcP0rcovRPsMZUQX5nq33O+IC8TuofcnUlENANBmlGHavA2e9OeGk2JjqNPtp9
3NZdSvPLP9MvkRKMHfrtX1dWxx2C7lZwkA/82lZ+n644va818w49nIpy1JmfBDZU
3zz1/krWaepcZeu8JFycNRSWTI3SKuqscXGjgt9cz+x8U0N6R5PYzJWG+xvzBD16
9BADm7QIcawD386e0xb5sFjpIsKq5YjUtJUu35Cazt2OKdd6xl9uqW2VDwOTsyjt
14kp9U/r89ZuJ4FKz5Gs8SBNzPpl9mnPIae77exiEYMtlIe/PgaVWzz0P0Jhudg6
yrhBXPsteDoGl6qB5PvJtGJSLRnFB0ctfZIZUbGZsJDXDlamvuEtKKfGiKUhonIG
G4A9d+ty8NXvKpctc5l4HJ+iTLTbZ782zhko/2URmrYSafcbKmqijKOikNM24DTz
lgahqISJLEFdMCfo4LKYtNVCUEje7Yu2scWWtgrdOIx3TRCWcsbB+n7ma0YzXFyn
+NmYmvkXbcZhPt4jhuDRUDDWMYIKq9cNMPy496geo4SKRPye2R9vVKSYhqRIFYOe
p9HxpiRQSedH/8zbLdPor5ZNY6F2lakDxidCULe0Vguz6CK+z0w=
=o1TQ
-----END PGP SIGNATURE-----

--fDERRRNgB4on1jOB--
