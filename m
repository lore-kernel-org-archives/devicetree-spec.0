From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Tue, 19 Dec 2017 15:57:46 +1100
Message-ID: <20171219045746.GL4786@umbus.fritz.box>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
 <CAL_JsqK1rtc81+=vzc36w4MRmQGYXBeib+QCj0TxtxEMVN2bKQ@mail.gmail.com>
 <8DE272D8-6004-4A47-B49C-D3DFB7D9E23C@konsulko.com>
 <CAL_JsqLx7fDZGNnxc-DXTajvDWGojNFDEUZeBG3A8LMduDNLtQ@mail.gmail.com>
 <E863FAFC-7613-4262-9C9D-0D2A4EF5F880@konsulko.com>
 <CAL_Jsq+zkKA-78WH0fPTstCfPZhvxdcOCd74uqwu=xNvr++1aA@mail.gmail.com>
 <CACxGe6t7CebKJqq+-nOa_adYJM2QL9hn74k5HhseTPR5G1hHRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VBq/nvTu32OVLBUP"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1513659551;
        bh=rScGnk62NxBkwigR8hraPgmymYQjK2hen971PFJS668=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q7TNDqiariX2cL/9KXEi3+bpAHdU2+QTGVrZAeXnJ4pJvwz1yUI25mO4KXzJ9MEJp
         aCpsjDgyq5kqXAPhAVkMYm7pKO5MCn5+QdoXwbi+6wCcTHSmBM1n6SrJeTE9/ZQKbN
         CiY/K2xIekl0bYaW/B519sYxH6ZSrXNu8AaJ6m1k=
Content-Disposition: inline
In-Reply-To: <CACxGe6t7CebKJqq+-nOa_adYJM2QL9hn74k5HhseTPR5G1hHRg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


--VBq/nvTu32OVLBUP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2017 at 01:46:38PM +0000, Grant Likely wrote:
> On Mon, Nov 6, 2017 at 4:12 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Fri, Nov 3, 2017 at 9:41 AM, Pantelis Antoniou
> > <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >> Hi Rob,
> >>
> >>> On Nov 3, 2017, at 16:31 , Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >>>
> >>> On Fri, Nov 3, 2017 at 9:11 AM, Pantelis Antoniou
> >>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >>>> Hi Rob,
> >>>>
> >>>>> On Nov 3, 2017, at 15:59 , Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >>>>>
> >>>>> On Thu, Nov 2, 2017 at 11:44 AM, Grant Likely <grant.likely@secretl=
ab.ca> wrote:
> >>>>>> Hi Pantelis and Rob,
> >>>>>>
> >>>>>> After the workshop next week, I'm trying to capture the direction
> >>>>>> we're going for the schema format. Roughly I think we're aiming
> >>>>>> towards:
> >>>>>>
> >>>>>> - Schema files to be written in YAML
> >>>>>> - DT files shall remain written in DTS for the foreseeable future.
> >>>>>> YAML will be treated as an intermediary format
> >>>>>> - That said, we'll try to make design decisions that allow YAML to
> >>>>>> be used as a source format.
> >>>>>> - All schema files and yaml-encoded-dt files must be parsable by s=
tock
> >>>>>> YAML parsers
> >>>>>> - Schema files to use the jsonschema vocabulary
> >>>>>> - (jsonschema assumes json files, but YAML is a superset so this w=
ill be okay)
> >>>>>> - Extended to add vocabulary for DT concepts (ignored by stock val=
idators)
> >>>>>>   - C-like expressions as used in Pantelis' yamldt could be added =
in this way
> >>>>>> - Need to write a jsonschema "metaschema" do define DT specific ex=
tensions
> >>>>>>   - metaschema will be used to validate format of schema files
> >>>>>>   - Existing tools can confirm is schema files are in the right fo=
rmat.
> >>>>>>   - will make review a lot easier.
> >>>>>
> >>>>> I want to start small here with defining top-level board/soc bindin=
gs.
> >>>>> This is essentially just defining the root node compatible strings.
> >>>>> Seems easy enough, right? However, I quickly run into the problem of
> >>>>> how to match for when to apply the schema. "compatible" is the obvi=
ous
> >>>>> choice, but that's also what I'm checking. We can't key off of what=
 we
> >>>>> are validating. So we really need 2 schema. The first is for matchi=
ng
> >>>>> on any valid compatible for board, then 2nd is checking for valid
> >>>>> combinations (e.g. 1 board compatible followed by 1 SoC compatible)=
=2E I
> >>>>> don't like that as we'd be listing compatibles twice. An alternative
> >>>>> would be we apply every board schema and exactly 1 must pass. Perha=
ps
> >>>>> we generate a schema that's a "oneOf" of all the boards? Then we ju=
st
> >>>>> need to tag board schemas in some way.
>=20
> Creating a big top level schema that includes every board as a "oneOf"
> is a non-starter for me. It gets unwieldy in a hurry and doesn't
> account for how to bring in device bindings.

I agree.

> I'm working with the model of loading all the schema files
> individually and iterating over all the nodes in the DT. For each
> node, check which schemas are applicable (sometimes more than one) and
> use them to validate the node. All applicable schemas must pass.

Yes, I think this is the right approach.  I'd elaborate to say there
are basically two ways a schema becomes applicable:

  1) The schema "self selects".  This will usually be a schema saying
     it should apply because of the value of compatible, but could
     also include things like the generic interrupts binding saying it
     applies to any nodes with an "interrupts" property.

  2) One schema which applies specifies that another schema should
     also apply.  The common case is where one schema "inherits" from
     another - the more specific schema can say when it applies, then
     force the base schema to also apply.  This is useful in cases
     where there's a general pattern for things used across a bunch of
     devices, but not a clear common comaptible value or similar to
     know when it applies.

     The more complex case of this is a schema applying to one node
     saying that another schema applies to another node.  e.g. a PCI
     bridge saying that the PCI device schema must apply to all its
     subnodes.  Or, in a more complex example still, the schema for an
     interrupt controller saying that a schema defining the specific
     format of its interrupt specifiers must apply to nodes which have
     this intc as their interrupt parent.
>=20
> An upshot of this model is that bindings don't need to define
> absolutely everything, only what isn't covered by more generic
> schemas. For instance, bindings don't need to define the format of
> interrupts, #*-cells, reg, etc because the core schema already defines
> those. Instead they only need to list the properties that are
> required, and can add constraints on the values in standard
> properties.
>=20
> >>>> I=E2=80=99ve run into this as the first problem with validation usin=
g compatible properties.
> >>>>
> >>>> The way I=E2=80=99ve solved it is by having a =E2=80=98selected=E2=
=80=99 property that is generating
> >>>> a test for when to check a binding against a node.
> >>>
> >>> Okay, but what's the "jsonschema way" to do this is my question reall=
y.
>=20
> The most recent pre-release jsonschema draft defines if/then/else[1]
> keywords for conditional validation, but I'm using a draft-4 validator
> which doesn't implement that. Instead I did something similar to
> Pantelis by adding a "select" property that contains a schema. If the
> select schema matches, then the DT node must match the entire schema.
>=20
> [1] http://json-schema.org/work-in-progress/WIP-jsonschema-validation.htm=
l#rfc.section.6.6
>=20
> the "jsonschema way" would also be to compose a single schema that
> validates the entire document, but that doesn't work in the DT context
> simply because we are going to have a tonne of binding files. It will
> be unmanageable to create a single overarching schema that explicitly
> includes all of the individual device binding files into a single
> validator instance.
>=20
> Instead, I think the validator tool needs to load a directory of
> binding files and be intelligent about when each one needs to be
> applied to a node (such as keyed off compatible). That's what I'm
> doing with the prototype code I pushed out yesterday. The validator
> loads all the schema files it can find and then iterates over the
> devicetree. When a node validates against the "select" schema, then it
> checks the entire schema against the node. For example:
>=20
> %YAML 1.1
> ---
> id: "http://devicetree.org/schemas/soc/example.yaml#"
> $schema: "http://json-schema.org/draft-04/schema#"
> version: 1
> title: ARM Juno boards
> description: >
>   A board binding example. Matches on a top-level compatible string and m=
odel.
>=20
> # this binding is selected when the compatible property constraint matches
> select:
>   required: ["compatible", "$path"]
>   properties:
>     $path: { const: "/" }
>     compatible:
>       contains:
>         enum: [ "arm,juno", "arm,juno-r1", "arm,juno-r2" ]
>=20
> required:
> - model
> - psci
> - cpus
>=20
> properties:
>   model:
>     enum:
>       - "ARM Juno development board (r1)"
>       - "ARM Juno development board (r2)"
>=20
> This is a board level binding file for the Juno board. There are three
> important top level properties:
> =3D=3D select =3D=3D
> Contains a schema. If the node is at the root ($path=3D=3D'/') and
> compatible is one of the juno boards, then this binding applys
>=20
> =3D=3D required =3D=3D
> List of properties/nodes that must be present. In this case model,
> psci, and cpus. compatible isn't listed because it is already
> guaranteed to be present because it was in the select node. Also note
> that the contents of the nodes/properties doesn't have to be
> specified. The format of a lot of standard properties will already be
> validated by the core DT schema.
>=20
> For example, model must always be a simple string.
>=20
> =3D=3D properties =3D=3D
> Schemas for specific properties can go here. In this case I've
> constrained model to contain one of two strings, and in the test repo
> this demonstrates a validation failure because the juno.cpp.dts
> contains (r0) instead of (r1) or (r2).
>=20
>=20
> >> No idea :)
> >>
> >> DT is weird enough that there might not be a way to describe this in
> >> a regular jsonschema form. I would wait until Grant pitches in.
> >
> > I've played around with things a bit and the more I do the less happy
> > I am with jsonschema. Maybe this is not what Grant has in mind, but
> > here's the snippet of the compatible check I have:
> >
> > properties:
> >   compatible:
> >     description: |
> >       Compatible strings for the board example.
> >
> >     type: array
> >     items:
> >       type: string
> >       oneOf:
> >         - enum:
> >           - "example,board"
> >           - "example,board2"
> >         - enum:
> >           - "example,soc"
>=20
>=20
> I modified this one a bit to show how it would work with the select
> property. In this case the binding matches against two possible
> compatible strings, but the properties list also enforces
> "example,soc" to appear in the compatible list.
>=20
> # this binding is selected when the compatible property constraint matches
> select:
>   required: ["compatible"]
>   properties:
>     compatible:
>       contains:
>         enum: [ "example,board", "example,board2" ]
>=20
> properties:
>   # The "select" keyword above already ensures the board compatible is in=
 the
>   # list. This entry makes sure the soc compatible string is also there. =
It is
>   # also a place to put the description for documentation purposes.
>   compatible:
>     contains:
>         const: "example,soc"
>=20
> > First, it is more verbose than I'd like and not a language immediately
> > intuitive to low-level C developers (at least for me). My first
> > mistake was that *Of values have to be schema objects when I really
> > want logic ops for values.
>=20
> Yes, more verbose that I would like too, but I have yet to come across
> anything much better. I think defining an extensible schema language
> is just hard and it brings with it a learning curve. Every schema
> system I looked at has the same problem. No matter what we do we're
> going to have the pain of it not being intuitive to people used to
> programming in C.
>=20
> For constant values, the const and enum properties seem to be most
> concise way to specify a specific value using stock jsonschema. We can
> however define new keywords for DT specific validation. A stock
> validator will ignore them, but a DT aware validator can use them to
> do more complete validation.
>=20
> > Second, the constraints are not complete
> > and and I've not come up with how you would express them. Essentially,
> > we need to express at least one of each set is required and
> > "example,soc" must be last. I suppose we can come up with custom
> > expressions, but it seems to me that if we can't even express a simple
> > example like this with standard jsonschema then it is not a good
> > choice.
>=20
> If the compatible string was a known size then ordering can be
> enforced using the items property, but there isn't anything in the
> spec or proposed for enforcing order in arbitrarily sized arrays. It
> would need to be an extension.
>=20
> I don't think that makes jsonschema as a whole a bad choice. It does a
> lot of the things we need right away, and not matter what we choose
> we're going to be poking at corner cases where the DT context doesn't
> quite fit. At the very least, I think there needs to be more examples
> converted over to see what it looks like in real world usage.
>=20
> > Don't take this as we should use eBPF either. Given the reasoning so
> > far for picking it, I'm not sold on it. Seems like a nice shiny hammer
> > looking for a problem.
> >
> > Rob

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VBq/nvTu32OVLBUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlo4nEoACgkQbDjKyiDZ
s5LZ5w/8CXQta2KL6N6Hyo2lMZj4ATtXoO0Uc4YG0xWSENnC7G6J4bi39DE0RTZU
KAhevhpbwFuzI9pfNO5qngoRXcTG9J2V7AuDkxRDzqqbLQBFjIWEvD2hk9MiNpwf
cJTxN87VDeHlFovUDmrvnXqBbkqmdHsZhYquxJcmTZycwdMTZvvef5OMqEjxvvsK
bSrS1PVjPvM5DLxS3vyg3ZMZvzNPUrLZ5Vn6q9k5T2DCNt06awv1/AYw+RGb6WIS
RQCAgMvXqVbdVit72ixySXissJ7NkoFk3aQm7jerOw9SuFirOrVu3gD5TtU14zBV
L+T0Ga8vbrcJJn0cGDhf6FO7qQDML1n0CIJEZ4ikPUtfk5JTpF36b1vc1C53MiPH
NS4Vi7Q6/l4HeqNf8/h+gUbJWOUi9rL5ygjccnBVmd4xzzMeDcnOCC2ZxETDM2OB
ICBFQSlhWSslErGkShOSJNlipE2OH0EvB8xo3Wms4s5TvXMT5MC9JeXB45G6C350
3T9+Y+10eGf5TloiPZLjSJkY6sppFLSvypmvotLXtRZwX8hUbT3wj/kXNyEF05is
hlN5v8MZm+VB9rSPnJccJ2I98+CjNslLipQTHRGURn4lLoIz/ABsfpGF5mq+VDwG
kAF4fwRhwH/+KR7X3YyVJNzAYUMhF+S8VjXsJOkNN6blGboEzfw=
=yXcg
-----END PGP SIGNATURE-----

--VBq/nvTu32OVLBUP--
