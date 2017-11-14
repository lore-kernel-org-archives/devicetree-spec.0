From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Tue, 14 Nov 2017 08:48:37 +0000
Message-ID: <CACxGe6upG=p5SuiyPUGHejCFAj8XACpYfvzdTdHSLWkoikHFdA@mail.gmail.com>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
 <CAL_JsqK1rtc81+=vzc36w4MRmQGYXBeib+QCj0TxtxEMVN2bKQ@mail.gmail.com>
 <8DE272D8-6004-4A47-B49C-D3DFB7D9E23C@konsulko.com> <20171114001114.GC32308@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=meWiZMOJUjhJLeIJhxQMsAtd0dYIsTJ+pf6iDD6mR3o=;
        b=CcLn5ehZtpGbx00xA2sfBN7JklI26FyPP6dSoVR3gcFM6hUy7/Uvag9naw3ypKOein
         R0X/NEBYh07Q4qJUQqm8KRu1xQOaeflto+yS1Fo5ZmlOn9mL3NSHJIvjA/vTxWxmEi17
         URJwK1LkA/qf8sOzKpSnvZv4JYtM8XzZxqZ8jWVY66Ddr0NjISwioLgZZYDQzB4i9apk
         7vVdquRdeQk2BcyEOhNN578WRf23qyYPf5XdhmkQry7CtHBlu/YS4naaQ5BcG9vdYv7W
         /9bPn0ow2NimdUY9yQ3MMS6bm1ac03OThigyc0SwRMk63wAhABQyW/De7rP6rIiMMfZG
         NBxQ==
In-Reply-To: <20171114001114.GC32308-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Nov 14, 2017 at 12:11 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Nov 03, 2017 at 04:11:46PM +0200, Pantelis Antoniou wrote:
>> Hi Rob,
>>
>> > On Nov 3, 2017, at 15:59 , Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> >
>> > On Thu, Nov 2, 2017 at 11:44 AM, Grant Likely <grant.likely@secretlab.=
ca> wrote:
>> >> Hi Pantelis and Rob,
>> >>
>> >> After the workshop next week, I'm trying to capture the direction
>> >> we're going for the schema format. Roughly I think we're aiming
>> >> towards:
>> >>
>> >> - Schema files to be written in YAML
>> >> - DT files shall remain written in DTS for the foreseeable future.
>> >> YAML will be treated as an intermediary format
>> >>  - That said, we'll try to make design decisions that allow YAML to
>> >> be used as a source format.
>> >> - All schema files and yaml-encoded-dt files must be parsable by stoc=
k
>> >> YAML parsers
>> >> - Schema files to use the jsonschema vocabulary
>> >>  - (jsonschema assumes json files, but YAML is a superset so this wil=
l be okay)
>> >>  - Extended to add vocabulary for DT concepts (ignored by stock valid=
ators)
>> >>    - C-like expressions as used in Pantelis' yamldt could be added in=
 this way
>> >>  - Need to write a jsonschema "metaschema" do define DT specific exte=
nsions
>> >>    - metaschema will be used to validate format of schema files
>> >>    - Existing tools can confirm is schema files are in the right form=
at.
>> >>    - will make review a lot easier.
>> >
>> > I want to start small here with defining top-level board/soc bindings.
>> > This is essentially just defining the root node compatible strings.
>> > Seems easy enough, right? However, I quickly run into the problem of
>> > how to match for when to apply the schema. "compatible" is the obvious
>> > choice, but that's also what I'm checking. We can't key off of what we
>> > are validating. So we really need 2 schema. The first is for matching
>> > on any valid compatible for board, then 2nd is checking for valid
>> > combinations (e.g. 1 board compatible followed by 1 SoC compatible). I
>> > don't like that as we'd be listing compatibles twice. An alternative
>> > would be we apply every board schema and exactly 1 must pass. Perhaps
>> > we generate a schema that's a "oneOf" of all the boards? Then we just
>> > need to tag board schemas in some way.
>> >
>>
>> I=E2=80=99ve run into this as the first problem with validation using co=
mpatible properties.
>>
>> The way I=E2=80=99ve solved it is by having a =E2=80=98selected=E2=80=99=
 property that is generating
>> a test for when to check a binding against a node.
>>
>> For a concrete example using the spi-slave binding
>>
>> =E2=80=94- spi-slave.yaml ---
>> ...
>> inherings: *device-compatible
>> =E2=80=A6
>>
>> Where device compatible is:
>>
>> %YAML 1.1
>> ---
>> device-compatible: &device-compatible
>>   title: Contraint for devices with compatible properties
>>   # select node for checking when the compatible constraint and
>>   # the device status enable constraint are met.
>>   selected: [ "compatible", *device-status-enabled ]
>>
>>   class: constraint
>>   virtual: true
>>
>> The selected property here declares that any =E2=80=9Ccompatible=E2=80=
=9D property constraint
>> for the node under test must match and that the device-status-enabled
>> rule matches too.
>
> I think the basic idea of having a "selector" that says when the
> binding applies is correct.  However, I think the details of this
> verison (AFAICT) are a bit too ad hoc.
>
> I think of it in terms of "patterns" which a node might or might not
> match.  Those can be simple {compatible includes "blah"} or complex -
> a full set of binding requirements.
>
> Bindings will generally be of the form:
>         if (PatternA) matches
>                 then (PatternB) must match
>
> e.g.
>         if (compatible includes "blah")
>                 then ("blah" binding details) must match
>
> or
>         if ("interrupts" exists)
>                 then (irq binding must apply)
>
> But in order to keep things general, both the "selector" and the
> "requirements" patterns should be specified in the same way.
>
> I had the feeling that jsonschema worked that way from Grant's talk,
> although I'm not 100% certain.

Yes, but it is only in the pre-release draft version at the moment.
jsonschema is proposing if/then/else keywords which behave pretty much
exactly as you describe. There is good discussion here:

https://github.com/json-schema-org/json-schema-spec/issues/180#issuecomment=
-266986089

g.

>
>>
>> The device-status-enabled is declared as follows:
>>
>> %YAML 1.1
>> ---
>> device-enabled:
>>   title: Contraint for enabled devices
>>
>>   class: constraint
>>   virtual: true
>>
>>   properties:
>>     status: &device-status-enabled
>>       category: optional
>>       type: str
>>       description: Marks device state as enabled
>>       constraint: |
>>         !exists || streq(v, "okay") || streq(v, "ok=E2=80=9D)
>>
>> This declares that the constraint matches when either the optional
>> status property is not present or if it is, it=E2=80=99s either =E2=80=
=9Cokay=E2=80=9D or =E2=80=9Cok=E2=80=9D.
>>
>> Taken together when the spi-slave binding is inherited (for instance
>> by the jedec,spi-nor binding:
>>
>> =E2=80=94 jedec,spi-nor.yaml =E2=80=94
>>
>> =E2=80=A6
>> inherits: *spi-slave
>>
>> =E2=80=A6
>>   compatible: &jedec-spi-nor-compatible
>>   category: required
>>   type: strseq
>>   constraint: |
>>     anystreq(v,  "at25df321a") ||
>>      =E2=80=A6.
>>
>>
>> > I'm thinking of this very specific case, but no doubt it is going to
>> > apply in other places. This has been one of the harder problems with
>> > writing dtc checks. What to key off of to trigger checks and how to
>> > check errors in the key itself.
>> >
>> > Rob
>>
>> Regards
>>
>> =E2=80=94 Pantelis
>>
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _othe=
r_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
