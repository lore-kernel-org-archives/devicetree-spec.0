From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Fri, 3 Nov 2017 16:11:46 +0200
Message-ID: <8DE272D8-6004-4A47-B49C-D3DFB7D9E23C@konsulko.com>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
 <CAL_JsqK1rtc81+=vzc36w4MRmQGYXBeib+QCj0TxtxEMVN2bKQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=7dOwOPy8kbmspBu+09w1DOaVvIYyIB+Vv/e1eGT6TEk=;
        b=cat7bgPzoGKsAUKb/JKxu9//IG6d68IR/oe1RpHBLxL5vmH9w8YgmAMkGpPvFfJC/F
         Uz0NrrxMJ8bR8OT4elVrfb8Y+BjQm4T/BN7zcGPN9dW70Ai03Tg3RdX6pZz8Mpd/U9dH
         +lLsur24ZSGf2WspfMuTD6/iyTFmdfn2aPFpw=
In-Reply-To: <CAL_JsqK1rtc81+=vzc36w4MRmQGYXBeib+QCj0TxtxEMVN2bKQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Rob,

> On Nov 3, 2017, at 15:59 , Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>=20
> On Thu, Nov 2, 2017 at 11:44 AM, Grant Likely =
<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> Hi Pantelis and Rob,
>>=20
>> After the workshop next week, I'm trying to capture the direction
>> we're going for the schema format. Roughly I think we're aiming
>> towards:
>>=20
>> - Schema files to be written in YAML
>> - DT files shall remain written in DTS for the foreseeable future.
>> YAML will be treated as an intermediary format
>>  - That said, we'll try to make design decisions that allow YAML to
>> be used as a source format.
>> - All schema files and yaml-encoded-dt files must be parsable by =
stock
>> YAML parsers
>> - Schema files to use the jsonschema vocabulary
>>  - (jsonschema assumes json files, but YAML is a superset so this =
will be okay)
>>  - Extended to add vocabulary for DT concepts (ignored by stock =
validators)
>>    - C-like expressions as used in Pantelis' yamldt could be added in =
this way
>>  - Need to write a jsonschema "metaschema" do define DT specific =
extensions
>>    - metaschema will be used to validate format of schema files
>>    - Existing tools can confirm is schema files are in the right =
format.
>>    - will make review a lot easier.
>=20
> I want to start small here with defining top-level board/soc bindings.
> This is essentially just defining the root node compatible strings.
> Seems easy enough, right? However, I quickly run into the problem of
> how to match for when to apply the schema. "compatible" is the obvious
> choice, but that's also what I'm checking. We can't key off of what we
> are validating. So we really need 2 schema. The first is for matching
> on any valid compatible for board, then 2nd is checking for valid
> combinations (e.g. 1 board compatible followed by 1 SoC compatible). I
> don't like that as we'd be listing compatibles twice. An alternative
> would be we apply every board schema and exactly 1 must pass. Perhaps
> we generate a schema that's a "oneOf" of all the boards? Then we just
> need to tag board schemas in some way.
>=20

I=E2=80=99ve run into this as the first problem with validation using =
compatible properties.

The way I=E2=80=99ve solved it is by having a =E2=80=98selected=E2=80=99 =
property that is generating
a test for when to check a binding against a node.

For a concrete example using the spi-slave binding

=E2=80=94- spi-slave.yaml ---
...
inherings: *device-compatible
=E2=80=A6

Where device compatible is:

%YAML 1.1
---
device-compatible: &device-compatible
  title: Contraint for devices with compatible properties
  # select node for checking when the compatible constraint and
  # the device status enable constraint are met.
  selected: [ "compatible", *device-status-enabled ]

  class: constraint
  virtual: true

The selected property here declares that any =E2=80=9Ccompatible=E2=80=9D =
property constraint
for the node under test must match and that the device-status-enabled
rule matches too.

The device-status-enabled is declared as follows:

%YAML 1.1
---
device-enabled:
  title: Contraint for enabled devices
=20
  class: constraint
  virtual: true
 =20
  properties:
    status: &device-status-enabled
      category: optional
      type: str
      description: Marks device state as enabled
      constraint: |
        !exists || streq(v, "okay") || streq(v, "ok=E2=80=9D)

This declares that the constraint matches when either the optional
status property is not present or if it is, it=E2=80=99s either =
=E2=80=9Cokay=E2=80=9D or =E2=80=9Cok=E2=80=9D.

Taken together when the spi-slave binding is inherited (for instance
by the jedec,spi-nor binding:

=E2=80=94 jedec,spi-nor.yaml =E2=80=94

=E2=80=A6
inherits: *spi-slave

=E2=80=A6
  compatible: &jedec-spi-nor-compatible
  category: required
  type: strseq
  constraint: |=20
    anystreq(v,  "at25df321a") ||
     =E2=80=A6.


> I'm thinking of this very specific case, but no doubt it is going to
> apply in other places. This has been one of the harder problems with
> writing dtc checks. What to key off of to trigger checks and how to
> check errors in the key itself.
>=20
> Rob

Regards

=E2=80=94 Pantelis
