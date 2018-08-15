From: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH 01/10] dm: fdt: scan for devices under
 /firmware too
Date: Wed, 15 Aug 2018 11:43:27 -0400
Message-ID: <20180815154327.GM30947@bill-the-cat>
References: <20180813155347.13844-1-jens.wiklander@linaro.org>
 <20180813155347.13844-2-jens.wiklander@linaro.org>
 <20180815141726.GI30947@bill-the-cat>
 <edcdc49b-8fd0-8862-dc6d-8f66b04be4ba@xilinx.com>
 <20180815143422.GL30947@bill-the-cat>
 <86d61eb1-e038-622b-fe6b-d4a1345619da@xilinx.com>
 <CAL_JsqKTEgG7vV8PLzDkksQA8E60T6X6o1KT5_bD3m2S4P6WEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8095861445362737062=="
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jAFr27qVUaZbASygjEjHwQDsIUEcHgY0lftESDhlH5M=;
 b=Es9I8YjgkJdh+s4kU2H+9alZhLX4EVQ13ZscTIXVXe/uzemUwTTzrajrfZN6Of46cb
 0pDRnreZ9z7/o5R98t9tCuSI9IfrU+pqIeIWx7SOw3wdKNlgkVzO73b/F7op3UdZZ4Na
 KjTtVQrAwCCo3r36rJTSpWjfmOKHLisTMYhas=
In-Reply-To: <CAL_JsqKTEgG7vV8PLzDkksQA8E60T6X6o1KT5_bD3m2S4P6WEA@mail.gmail.com>
List-Id: <devicetree-spec.vger.kernel.org>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Rob Herring <robh@kernel.org>
Cc: devicetree-spec@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, p.aubert@staubli.com, Michal Simek <michal.simek@xilinx.com>


--===============8095861445362737062==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJAclU0AInkryoed"
Content-Disposition: inline


--IJAclU0AInkryoed
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2018 at 09:31:30AM -0600, Rob Herring wrote:
> On Wed, Aug 15, 2018 at 8:51 AM Michal Simek <michal.simek@xilinx.com> wr=
ote:
> >
> > Hi Rob,
> >
> > On 15.8.2018 16:34, Tom Rini wrote:
> > > On Wed, Aug 15, 2018 at 04:30:15PM +0200, Michal Simek wrote:
> > >> On 15.8.2018 16:17, Tom Rini wrote:
> > >>> On Mon, Aug 13, 2018 at 05:53:38PM +0200, Jens Wiklander wrote:
> > >>>
> > >>>> Just as /chosen may contain devices /firmware may contain devices,=
 scan
> > >>>> for devices under /firmware too.
> > >>>>
> > >>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > >>>> ---
> > >>>>  drivers/core/root.c | 15 ++++++++++-----
> > >>>>  1 file changed, 10 insertions(+), 5 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/core/root.c b/drivers/core/root.c
> > >>>> index 72bcc7d7f2a3..0dca507e1187 100644
> > >>>> --- a/drivers/core/root.c
> > >>>> +++ b/drivers/core/root.c
> > >>>> @@ -265,9 +265,15 @@ static int dm_scan_fdt_node(struct udevice *p=
arent, const void *blob,
> > >>>>    for (offset =3D fdt_first_subnode(blob, offset);
> > >>>>         offset > 0;
> > >>>>         offset =3D fdt_next_subnode(blob, offset)) {
> > >>>> -          /* "chosen" node isn't a device itself but may contain =
some: */
> > >>>> -          if (!strcmp(fdt_get_name(blob, offset, NULL), "chosen")=
) {
> > >>>> -                  pr_debug("parsing subnodes of \"chosen\"\n");
> > >>>> +          const char *node_name =3D fdt_get_name(blob, offset, NU=
LL);
> > >>>> +
> > >>>> +          /*
> > >>>> +           * The "chosen" and "firmware" nodes aren't devices
> > >>>> +           * themselves but may contain some:
> > >>>> +           */
> > >>>> +          if (!strcmp(node_name, "chosen") ||
> > >>>> +              !strcmp(node_name, "firmware")) {
> > >>>> +                  pr_debug("parsing subnodes of \"%s\"\n", node_n=
ame);
> > >>>>
> > >>>>                    err =3D dm_scan_fdt_node(parent, blob, offset,
> > >>>>                                           pre_reloc_only);
> > >>>
> > >>> So, the /firmware node seems special.  Have you talked with the
> > >>> devicetree folks to get it listed in the spec?  That would seem rat=
her
> > >>> valuable for something used by many parties.  Thanks!
> > >>>
> > >>
> > >> some days ago we have sent a patch for this too.
> > >> https://lists.denx.de/pipermail/u-boot/2018-August/338049.html
> > >>
> > >> It is using different way but it should do the same thing.
> > >
> > > OK, so it sounds like in terms of code clean-ups, we need something l=
ike
> > > what you reference and then some further clean-ups on top of that
> > > perhaps for other places to call dm_scan_fdt_ofnode_path() for special
> > > cases.  And in terms of formalized specification bits, I do think
> > > /firmware should perhaps get kicked up to the spec itself so that it's
> > > very clear to all consumers.
> >
> > I was also checking latest devicetree spec and there is no record about
> > /firmware node and how it is supposed to be used.
>=20
> Patches welcome. :)
>=20
> It's really only a container to define non-discoverable firmware
> interfaces. Typically accessed thru a secure call (for ARM) or a
> mailbox. It is primarily just convention rather than a strict
> requirement. We have to support firmware nodes at the top-level too
> anyways.

Right.  To be clear, I'm suggesting that someone (I was thinking Jens)
pop over to the devicetree-spec list and ask about adding _something_
there as "firmware" isn't even on the list of generic names and may even
warrant something in section 3 under base device node types.

--=20
Tom

--IJAclU0AInkryoed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbdEofAAoJEIf59jXTHXZSdEUQAJtk7mLCjTNIOTwXHnmVtMHE
pdvzler/l+UIthY16XUFeDDy6cwvhoxQLwP8JQl4rUKUVitHiaFfcGnRbi2xLmqX
4kFTd/flE3NuZxDsZbIlXlUqMKop6H50fDpyz3mlD3d7br+eM0P8FdTQmsVlFTeh
0Dr6l0/wWujq2tyv56DzsG7AoKuDnWQmksd6Rl7EDQYeuVVFNdf/fH10L9BEFei5
aa8//7xzE5QlCi9IwkVGMXmls8Oc6r2p5SBUwaN1cjdfinbA48BvTSCdTfqteVtf
5S7s9FVK0ofSySv7YFxUSdvw9qUa8Y42iBiAMG6a+6DnRpmeP3sddbYuCCfs9vIW
6ZSPvRga0QngiaBQqZF0Ol1yRl+tm6eLpu0BhLGYI8PGyeShPgT6dPLwwMRcPgor
TQZ0ktWDJtF3aFJZyFaEHapqZEiQrJDUopa1Xop8yaixS3dtbLwHlXaa36F2sEqo
/5l1PZ/j24QmU+efll6T8qeuZXpDOmT40WYvKg44vxuC/8qTMfa7ml6Rkun+KAEi
2NIDcQz4vNJeKbYLOFSiiaMgg7ZIFtrp0ptSlQ5Zo54oW4lCALj3l122MpiCe+wQ
ti2pbzKyNo1im4OY/R9nvRgG/kxdAPszF05oMl+aHBWk88YvCwvVLyQK3hYIVLoF
r1dqFipQAdbfGo0RxWsh
=kSWe
-----END PGP SIGNATURE-----

--IJAclU0AInkryoed--

--===============8095861445362737062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVS1Cb290IG1h
aWxpbmcgbGlzdApVLUJvb3RAbGlzdHMuZGVueC5kZQpodHRwczovL2xpc3RzLmRlbnguZGUvbGlz
dGluZm8vdS1ib290Cg==

--===============8095861445362737062==--
