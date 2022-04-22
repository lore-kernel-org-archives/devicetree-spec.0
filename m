From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Memory aliasing and nodes
Date: Fri, 22 Apr 2022 11:40:49 +1000
Message-ID: <YmIHoY3kTAbsGHv4@yekko>
References: <CAGi-RUL4FJBXYUMbpdMo=XNd7DE1wD6aUqXUt5Y+5BY1KO-FYg@mail.gmail.com>
 <CAK8P3a3AjEbFE1D-n4Q53_UjBwRk3D-XdaaEqVJs3QOWLHOeqg@mail.gmail.com>
 <CAGi-RUJ5rn5Zn_rv6JX4XhGSfxUw_QcWe=M80ET5sYbi11e7GA@mail.gmail.com>
 <CAL_JsqLXRcQa_h8JiUWHK=Gph=vvMvmsbq4OACLKT==iPgaYqg@mail.gmail.com>
 <CAK8P3a2KGkH0Sf7fzWBAByTRnSXSy_u22=_s6Y7WLhrWNvJuyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ArqzMQBr9cYyo/XE"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1650592228;
        bh=bouGQW3ONaZZgUvh6ract4dnIjuvlh+glmsDkOeQnNc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L6X2uHY+eh4/rcNaS7jr+tulD1TnUikERejua5aCgYZf8pP0ZJ8LbFwn0KeMTLfge
         HQRiAl6+qPkEIZZTc/U6hfPZ7nrJioFTCjlPDgGJ24uIhQ07pZh0oY47Btn1/khuFy
         vd+ecHNOl1jPGgxtvjtGddzStwTDmHk5heTT7CnQ=
Content-Disposition: inline
In-Reply-To: <CAK8P3a2KGkH0Sf7fzWBAByTRnSXSy_u22=_s6Y7WLhrWNvJuyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ramon Fried <rfried.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--ArqzMQBr9cYyo/XE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 10:15:46PM +0200, Arnd Bergman wrote:
> On Thu, Apr 21, 2022 at 9:28 PM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > On Thu, Apr 21, 2022 at 12:25 PM Ramon Fried <rfried.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> > >
> > > On Thu, Apr 21, 2022 at 3:55 PM Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > > >
> > > > On Thu, Apr 21, 2022 at 12:33 PM Ramon Fried <rfried.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> > > > >
> > > > > Hi all,
> > > > > This is the second time in my career that I've stumbled upon a SOC
> > > > > which has 32bit memory aliasing for high memory for the usage of
> > > > > drivers that can only address 32bit address space.
> > > > >
> > > > > Basically, a subset of a memory higher than 4GB can be accessed a=
lso
> > > > > through a range in the low 4GB addresses.
> > > > >
> > > > > I didn't see any support for this neither Linux kernel nor in dev=
ice
> > > > > tree. I'm wondering if you considered adding a way to describe su=
ch
> > > > > addressing in the device tree, and maybe later Linux can add supp=
ort
> > > > > for it.
> > > >
> > > > I think we have some of those already, notably the TI Keystone plat=
form,
> > > > which only lists one of the two areas in the DT.
> > > >
> > > > It probably does not matter which one it is, but it may help to have
> > > > at least some memory in the lower address range.
> > > >
> > > > In either case, make sure to add the correct dma-ranges properties =
to
> > > > describe which memory is visible to which devices at a given addres=
s.
> > > >
> > > What you suggest will of course work, and this is how I planned to im=
plement it.
> > > The problem, IMO, is that the addressing of the SOC it's not obvious
> > > from the device tree.
> > > My understanding is that device-tree should describe the hardware, it
> > > just looks like a workaround to me.
> >
> > The h/w has some translation from one address to another and that's
> > exactly what 'dma-ranges' is for. How is that not describing the h/w?
>=20
> I think he was just referring to the memory nodes that don't let you
> describe how the same physical memory appears at two addresses.

> I don't think it's a big deal though, as memory nodes are somewhat
> special to start with, and the problem is more with the hardware
> being badly designed than the dt failing to describe it.

I don't think you need to appeal to special cases here - this can be
described in the dt.  Just put the memory on a sub-ordinate bus, and
have the top-level bus with a 'ranges' property that maps the two
aliased windows to the same place in the memory's address space.

Of course... at present Linux might not react well to having memory
nodes somewhere other than top-level nodes.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ArqzMQBr9cYyo/XE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJiB5cACgkQgypY4gEw
YSJEURAAoiEqAxg0fG4xMEZGHe/qq6ZMGEBkS8m25GtBUFgww/p2CkeabyvAKsTu
Jw+mRJ4xedFallCY/IjYspFiJjJGemm8sPEEeRpAVEVHGMyQpRi7DCejOIxW+A4N
79rYjXr9fMqK2etMyHk4pCq8TErd/WszN3CGhtdPoZ8vaQ3ZKIjdzfXTSmuIjN/6
uiHrNHltkVNJ+gbPe9/T7pQ/wHm4dgnu0ZzS/GMJ7Lz5tAfdmhThUtIS++yeuC3v
iESOZjT4DyF2lCyQWnI5wmsAVBkeFBcHauDw936USrCdHamMXD88as2ER7Xz0XR5
1jhUODiwAIdGa3Pd0EbumKkr4OKT6O4AxngpJKG0jHmJZsCkHwDPCCE2GIpu6AqR
oF4gLF7wYHAoAkEPtSfLn+qrd+yahbe4jt0iATS5BsA04XxbhLz7xk3jBJPKLkGj
KqEJjw7WKKOz/o3tyW8/dbBxHvGlxYra24Zy257mPQlxeebiGjpIoBGbsooG7MBn
Ax2/CefoInHqjedxx418kI7f0D/X1ua/X5XQLhBHndyorMFYeSWSoY9C/+OWO8i3
PtUG8wLM47z31rhxRJcDQPn+jyG1CL+fBZpFE4jUxdGFmk/yGtLtK51qbv6haDaN
9iFqEzT9iT+aMmdnzhivxfHiR12KhAzU8BhsmmVx9ESWWlbjobk=
=LBbk
-----END PGP SIGNATURE-----

--ArqzMQBr9cYyo/XE--
