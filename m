From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Device Tree Evolution Project - call notes - 29th January
Date: Tue, 11 Feb 2020 16:24:02 -0500
Message-ID: <20200211212402.GK13379@bill-the-cat>
References: <20200130135605.GQ3697@linaro.org>
 <3b257f2a0ccc4f9f9ca0be2de8c9e382@ti.com>
 <CAL_JsqLNHi0ac0E5k9-355vS_GObz7Tu5Av2FLKZ6b-1wjm1Jw@mail.gmail.com>
 <CAHFG_=UhJzrBqZy1+-Jm0uKaCN+SMgXKryWG17xN=29s1W2Umw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PMPTwArMYYd3KsYs"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W0xEBj/prhLquB6exdlDS+r7lZTfXbR7m0vE+NTj0UM=;
        b=EiXbVeCkR9IlOlfQQ6wnt9/iBd47+lqE52V+Ihxmnxmqvf6lK5WG7nH8GFhjvxCb6j
         ZO+hZ7IjV4+Cv5H8uP28mIbd6Xx1cg6aVP9X3i1xQMace5eg/geXfhYxVO4TnP9IJPyL
         VqKf4GFAw/z0GiBylz37tXrImI+bQTU3UvAcY=
Content-Disposition: inline
In-Reply-To: <CAHFG_=UhJzrBqZy1+-Jm0uKaCN+SMgXKryWG17xN=29s1W2Umw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Francois Ozog <francois.ozog-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Mills, William" <wmills-l0cyMroinI0@public.gmane.org>, Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Kristo, Tero" <t-kristo-l0cyMroinI0@public.gmane.org>, "Valkeinen, Tomi" <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, "Murphy, Dan" <dmurphy-l0cyMroinI0@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>


--PMPTwArMYYd3KsYs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 06:44:31PM +0100, Francois Ozog wrote:
> On Tue, 11 Feb 2020 at 17:32, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > On Mon, Feb 10, 2020 at 10:58 AM Mills, William <wmills-l0cyMroinI0@public.gmane.org> wrote:
> > >
> > > Steve,
> > >
> > > Can TI get on the agenda for this week's meeting?
> > >
> > > We have a simple approach to make progress on boot loader applied ove=
rlays.
> > > It is a small repo with just the overlays.
> > > It builds the dtb's from the upstream kernel repo and the overlays fr=
om this repo.
> > > We are going to do this at git.ti.com so we can make progress.
> > > However we would like to suggest this as a simple way forward to coll=
ectively host things the kernel maintainers do not want in the kernel.
> >
> > For the record, I'm in favor of hosting overlays in the kernel (of
> > course I have opinions on the details). Frank is not in favor IIRC,
> > but Frank is only maintainer of 'drivers/of/' so ultimately not his
> > decision.
> >
> > > Does it make sense to host something like this in devicetree.org gith=
ub account?
> >
> > Yes, but I would like to see this coordinated with hosting
> > 'devicetree-rebasing' there. We should be able to use the same
> > makefiles from it. Perhaps the overlay repo should work as a git
> > submodule of it as well. That would help keep things in sync.
> >
> > A concern I have is what happens when someone wants to split some
> > portions of an existing dts into an overlay? Then the base dts becomes
> > incomplete. Users will have regressions from missing functionality if
> > they don't know to apply some overlay. And how do we track what base
> > DTs overlays apply to? Not that we have a solution when they are in
> > one tree, but 2 trees makes that harder.
>=20
> DT lifecycle shall be selectable by the board vendor. If, for any reason
> (and there may be plenty), a vendor believes it is a better organization =
to
> handle the DT assembly (static + overlays) outside the kernel, then it
> should be possible to do so.
> Note: On the ACPI front, a form of overlays (needed for DT too) will
> be handled by U-Boot:
> https://lists.denx.de/pipermail/u-boot/2020-January/397886.html

I'll be on the next call as well, but I do want to caution against
reading too much in to what we're doing to deal with x86 / ACPI and its
different set of challenges.

--=20
Tom

--PMPTwArMYYd3KsYs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl5DG28ACgkQh/n2NdMd
dlKnlw//bhteNjcD8W9q3ArrGhn8uhoaTRWlKHc/Z7Wr3HYs9npf6w5TNWVk+gwq
Ue0/ussBYab/mH/5sEljEZlOA98Q53Yvi759mwFM+WZFVenpp6nlXbsqDCt5MKEI
Cp70n4Zb6pcGsLouOqFJcJsUMzJaVsUEVyC4xKkyikO+umgtfiz74ypy0Z2A2FKs
U2lgF7wW5T1wJPfYZsWHMbt4pbYW0mlKqQpV5IGYSVQHX18bjhzXX54VopwvvGRI
WfxOLbNpFgWJbxUnUznNMXLfF+KtIfNEc5CJQbHNLtOqi/R2mLO1O60AA4WOvuiT
pcGe50VyiTge3zTWfYviH8yY/1VsxaWoyYkbBLAvpnZqN52sranmciVep/DU8q/1
hGozpBBOrfQTknuAxgwGnyz9dAL65lpZepWZ4Ic5VMEa/CdQfVtq56TnyuGV7ETt
Q7A0SphtWpaOK7zEcKCgf+FOzdA067sdKdZi9STnTNmfTsUa6la86uOHwXAXgNYa
9gRADa3kZN9ZjL9OFhGLoW+9rIIbfRnLIErJxJvgKOHh19eoH4yRyFk7AEw1shaU
JQOYppE/nevBYfw9k2lDHVWaC0XHPgKMG13vh4EanZnCNoLJFQMmy6b53RMNk35y
NHAcScK70kI3vf6SXACFirGvJpUk5i2B7n40rVLOeUmDW1zc7Ek=
=6XoW
-----END PGP SIGNATURE-----

--PMPTwArMYYd3KsYs--
