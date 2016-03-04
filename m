From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot] [PATCH V2 5/6] ARM: dts: k2g: Add support for PMMC
Date: Fri, 4 Mar 2016 17:08:53 -0500
Message-ID: <20160304220853.GA23166@bill-the-cat>
References: <1456426427-23166-1-git-send-email-nm@ti.com>
 <1456426427-23166-6-git-send-email-nm@ti.com>
 <20160226181827.GB23166@bill-the-cat>
 <CAGo_u6o0V6PgurVvs5cL9iDMM1w-8m9z7npmv=7LiAhaFwXXtw@mail.gmail.com>
 <20160227002736.GG23166@bill-the-cat>
 <CAGo_u6oS-WqukK9crkevH_DWVY=bZtdVd8kTpfFiZKZL+rWj5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L1q7c0b5dK0vsO5K"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8/ccs6iC/qvKJ3O1svzUL5/VRWq3hUlPNHAprqZmcI0=;
        b=kQ73jQ5fglh/apXeiGUy4jGt651Bdd9bp96OqpSHQ1sLsKjxQ2r/+gFKZxvwsxevJf
         SJT+Qtzju5Z+RRF1r3dH3+SV0PYZXRrAqzqokETFvbh+VF4Q5GaxWmnNXrQd7Khurpn3
         e6Y7IJb3YJm3FnIezi/LhC7Dda/Wa5hCpdSTU=
Content-Disposition: inline
In-Reply-To: <CAGo_u6oS-WqukK9crkevH_DWVY=bZtdVd8kTpfFiZKZL+rWj5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: u-boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>


--L1q7c0b5dK0vsO5K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=2E.. adding in devicetree-spec,
http://lists.denx.de/pipermail/u-boot/2016-February/246542.html for the
first part of this

On Fri, Feb 26, 2016 at 07:10:23PM -0600, Nishanth Menon wrote:
> Tom,
>=20
>=20
> On Fri, Feb 26, 2016 at 6:27 PM, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > On Fri, Feb 26, 2016 at 06:18:30PM -0600, Nishanth Menon wrote:
> >> On Fri, Feb 26, 2016 at 12:18 PM, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >> > On Thu, Feb 25, 2016 at 12:53:46PM -0600, Nishanth Menon wrote:
> [...]
> >> >
> >> > ... and this will match whatever is in the kernel, right?
> >>
> >> The Linux kernel will not need to access PMMC similar to how bootloade=
r has to.
> >>
> >> Bootloader looks to load up the peripheral - so, it's view of the
> >> hardware is as a programmable core (similar to how we'd look at a
> >> DSP/other remote proc), however, linux kernel only cares about the
> >> communication link (which is the message manager) and the protocol on
> >> top to communicate and does not need to access PMMC directly (it is
> >> only done once by bootloader).
> >>
> >> So the the current u-boot dt binding will not even need to be send
> >> upstream kernel, instead a protocol level definition (similar to SCPI)
> >> will be exposed to linux kernel.
> >
> > So is the kernel community going to be unhappy about getting what it
> > might consider extraneous information in the device tree?  The goal here
> > is to be able to just copy in the DT files from $upstream and really
> > really not have local changes without a good reason (and yes, we need to
> > revisit u-boot,dm-pre-reloc at some point).  Maybe a question for one of
> > the higher level DT lists...
>=20
> Hmmm... I can switch to platform data if maintenance is an concern. I
> dont think PMMC will be an unique experience for DT view of the
> hardware where every  piece of software looks at things differently.
> For example: if we move DDR configuration to device tree (which dt is
> pretty capable of doing), then we are stuck with the same issue yet
> again. DDR configuration is not necessary for kernel device tree since
> it has nothing to do there - and we dont provide that information
> (since it becomes a maintenance pain in kernel world as well), but
> u-boot SPL will need to have that information.
>=20
> Device tree is a representation of hardware is exactly what we do,
> except that view depends on what we need to expose to each software
> solution. Even in Linux, in a hypervisor world, a guest OS may only
> have access to certain peripherals of the SoC - we dont expose all the
> peripherals to the OS via dt, instead a custom guest OS dt view of the
> world is created. This is one problem we all have with DT -> the
> extent to which we "describe hardware" - there is no objective rules
> for the same that can get blindly applied..
>=20
> Do let me know if I need to bring this device outside of dt into
> platform data world. It wont be my first preference, but if it does
> create a severe maintenance burden, then maybe that is what needs to
> happen -> only resources that are shared between kernel and bootloader
> can reside in dt... just my 2 cents..

So, I would like to see this particular bit stay in the DT, and I would
like to see this part of the DT not be only in the U-Boot tree but
rather the authorative DT which today resides in the Linux kernel.  But
I'm not the person to make that final call, so adding in more people
here.

--=20
Tom

--L1q7c0b5dK0vsO5K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJW2gd1AAoJEIf59jXTHXZSUHAQAJuDnN8g0ZqQFK+GTRGsCy7i
QInwoULIj8ckJ8hfgyY8Qn4jiydNAOaxDCF1LTM6W2voWb5NOJvG6XP/zRqrhJuv
Y4l5pbP4CTszc9V3DyMCBHPPsG1d5mE7bxcVhy96yVhj0FvcCt3hR2fxhJnbFlYF
fVsyrQCamRuIhgNRoT34/qSGbAtG15d7KY/Y0aZIQIV2X/kTEaBb38IPO53g4P34
ARaRzmOamBwYYxbD5DrI8cyN7U0x95/K4RZsProCR75jzjTWDJ5A8qh1NUzrS/dZ
aSvGv7O7qwxp/lbiJRy4w2JQeJwBpPYmI4QuBMfNOrSvumCJjLhohW+uaUguCJwG
g9sVtjWk4sK5ihR6xEpu8aR7f63V3jXhqTyPywe1+HpGdvUT/AcoBXTSc7AXh8AM
OXx1QC/anE91YEBKIb9O9xai75g/DtJQ7z/xi7va4yNG1lj48Iqiq45vEqF+Hd+z
toKZPrNQQWmI+KFYz9fUaTjZgzYbZtqZuAPO5ZRwTqVc39ROzvBgBJkkCtSkIBVb
xk9xKBnt9qB7w4jb70z2BHEYru27rMU77LTGG/DEAfAEfMcmW0pEhrt4ooKTUxi8
b/8CFzad4ugpjOXpmdCNB4AHIJ9P85RPx+kKQLoTfGIPOQ04y4KwopH1F6XeRL/o
msbGE/RvoQPRs2OB6H4h
=2zhP
-----END PGP SIGNATURE-----

--L1q7c0b5dK0vsO5K--
