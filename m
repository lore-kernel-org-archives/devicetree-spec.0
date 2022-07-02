From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] Add 'dma-noncoherent' property as a standard property
Date: Sat, 02 Jul 2022 11:30:20 +0200
Message-ID: <4344746.jZfb76A358@phil>
References: <20220619203719.3604757-1-heiko@sntech.de> <3674511.kQq0lBPeGt@diego> <1729137.VLH7GnMWUR@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1729137.VLH7GnMWUR@diego>
List-ID: <devicetree-spec.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Hi Rob,

Am Dienstag, 28. Juni 2022, 13:22:31 CEST schrieb Heiko St=FCbner:
> Am Montag, 27. Juni 2022, 17:51:51 CEST schrieb Heiko St=FCbner:
> > Am Montag, 27. Juni 2022, 17:14:45 CEST schrieb Rob Herring:
> > > On Sun, Jun 19, 2022 at 2:37 PM Heiko Stuebner <heiko-4mtYJXux2i+zQB+=
pC5nmwQ@public.gmane.org> wrote:
> > > >
> > > > Similar to the 'dma-coherent' property, some architectures may be c=
oherent
> > > > by default with some devices being non-coherent. Add a property for=
 this
> > > > case tool.
> > >=20
> > > Looks fine, but I also need a schema.
> > >=20
> > > Yeah, that's redundant unfortunately. Maybe someday someone will care
> > > enough to generate the spec from the schemas.
> >=20
> > No worries and sorry I didn't think of where the schema comes from
> > in the first place. I'll do the relevant schema work as well.
>=20
> Done in https://github.com/devicetree-org/dt-schema/pull/78 .
>=20
> I wasn't sure about the "development model" of dt-schema [0] but there
> were already github pull-requests pending, so I've added another one
> for the new property :-) .

so as the dt-schema patch did go through the github-pull,. I've converted
this patch as well, so there is now a matching pull-request on github for
the spec addition.

Heiko


