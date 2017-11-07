From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Tue, 7 Nov 2017 09:34:48 -0600
Message-ID: <CAL_Jsq+t=bk+W5uekojsX9KzLUp6MGqgVeR5gC-H5L-hnm6SAA@mail.gmail.com>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
 <CAL_JsqK1rtc81+=vzc36w4MRmQGYXBeib+QCj0TxtxEMVN2bKQ@mail.gmail.com>
 <8DE272D8-6004-4A47-B49C-D3DFB7D9E23C@konsulko.com> <CAL_JsqLx7fDZGNnxc-DXTajvDWGojNFDEUZeBG3A8LMduDNLtQ@mail.gmail.com>
 <E863FAFC-7613-4262-9C9D-0D2A4EF5F880@konsulko.com> <CAL_Jsq+zkKA-78WH0fPTstCfPZhvxdcOCd74uqwu=xNvr++1aA@mail.gmail.com>
 <CACxGe6t7CebKJqq+-nOa_adYJM2QL9hn74k5HhseTPR5G1hHRg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6t7CebKJqq+-nOa_adYJM2QL9hn74k5HhseTPR5G1hHRg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Tue, Nov 7, 2017 at 7:46 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Mon, Nov 6, 2017 at 4:12 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Fri, Nov 3, 2017 at 9:41 AM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> Hi Rob,
>>>
>>>> On Nov 3, 2017, at 16:31 , Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>>
>>>> On Fri, Nov 3, 2017 at 9:11 AM, Pantelis Antoniou
>>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>>> Hi Rob,
>>>>>
>>>>>> On Nov 3, 2017, at 15:59 , Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>>>>
>>>>>> On Thu, Nov 2, 2017 at 11:44 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>>>>>>> Hi Pantelis and Rob,
>>>>>>>
>>>>>>> After the workshop next week, I'm trying to capture the direction
>>>>>>> we're going for the schema format. Roughly I think we're aiming
>>>>>>> towards:
>>>>>>>
>>>>>>> - Schema files to be written in YAML
>>>>>>> - DT files shall remain written in DTS for the foreseeable future.
>>>>>>> YAML will be treated as an intermediary format
>>>>>>> - That said, we'll try to make design decisions that allow YAML to
>>>>>>> be used as a source format.
>>>>>>> - All schema files and yaml-encoded-dt files must be parsable by stock
>>>>>>> YAML parsers
>>>>>>> - Schema files to use the jsonschema vocabulary
>>>>>>> - (jsonschema assumes json files, but YAML is a superset so this will be okay)
>>>>>>> - Extended to add vocabulary for DT concepts (ignored by stock validators)
>>>>>>>   - C-like expressions as used in Pantelis' yamldt could be added in this way
>>>>>>> - Need to write a jsonschema "metaschema" do define DT specific extensions
>>>>>>>   - metaschema will be used to validate format of schema files
>>>>>>>   - Existing tools can confirm is schema files are in the right format.
>>>>>>>   - will make review a lot easier.
>>>>>>
>>>>>> I want to start small here with defining top-level board/soc bindings.
>>>>>> This is essentially just defining the root node compatible strings.
>>>>>> Seems easy enough, right? However, I quickly run into the problem of
>>>>>> how to match for when to apply the schema. "compatible" is the obvious
>>>>>> choice, but that's also what I'm checking. We can't key off of what we
>>>>>> are validating. So we really need 2 schema. The first is for matching
>>>>>> on any valid compatible for board, then 2nd is checking for valid
>>>>>> combinations (e.g. 1 board compatible followed by 1 SoC compatible). I
>>>>>> don't like that as we'd be listing compatibles twice. An alternative
>>>>>> would be we apply every board schema and exactly 1 must pass. Perhaps
>>>>>> we generate a schema that's a "oneOf" of all the boards? Then we just
>>>>>> need to tag board schemas in some way.
>
> Creating a big top level schema that includes every board as a "oneOf"
> is a non-starter for me. It gets unwieldy in a hurry and doesn't
> account for how to bring in device bindings.
>
> I'm working with the model of loading all the schema files
> individually and iterating over all the nodes in the DT. For each
> node, check which schemas are applicable (sometimes more than one) and
> use them to validate the node. All applicable schemas must pass.
>
> An upshot of this model is that bindings don't need to define
> absolutely everything, only what isn't covered by more generic
> schemas. For instance, bindings don't need to define the format of
> interrupts, #*-cells, reg, etc because the core schema already defines
> those. Instead they only need to list the properties that are
> required, and can add constraints on the values in standard
> properties.
>
>>>>> I’ve run into this as the first problem with validation using compatible properties.
>>>>>
>>>>> The way I’ve solved it is by having a ‘selected’ property that is generating
>>>>> a test for when to check a binding against a node.
>>>>
>>>> Okay, but what's the "jsonschema way" to do this is my question really.
>
> The most recent pre-release jsonschema draft defines if/then/else[1]
> keywords for conditional validation, but I'm using a draft-4 validator
> which doesn't implement that. Instead I did something similar to
> Pantelis by adding a "select" property that contains a schema. If the
> select schema matches, then the DT node must match the entire schema.
>
> [1] http://json-schema.org/work-in-progress/WIP-jsonschema-validation.html#rfc.section.6.6
>
> the "jsonschema way" would also be to compose a single schema that
> validates the entire document, but that doesn't work in the DT context
> simply because we are going to have a tonne of binding files. It will
> be unmanageable to create a single overarching schema that explicitly
> includes all of the individual device binding files into a single
> validator instance.

And the jsonschema way would be with $ref, right? I can see both ways
being needed. For example, an I2C controller binding would want to
pull in an I2C bus schema. Otherwise, you'd need some tag to mark the
binding as an I2C bus and then apply the I2C bus based on that.

> Instead, I think the validator tool needs to load a directory of
> binding files and be intelligent about when each one needs to be
> applied to a node (such as keyed off compatible). That's what I'm
> doing with the prototype code I pushed out yesterday. The validator
> loads all the schema files it can find and then iterates over the
> devicetree. When a node validates against the "select" schema, then it
> checks the entire schema against the node. For example:
>
> %YAML 1.1
> ---
> id: "http://devicetree.org/schemas/soc/example.yaml#"
> $schema: "http://json-schema.org/draft-04/schema#"
> version: 1
> title: ARM Juno boards
> description: >
>   A board binding example. Matches on a top-level compatible string and model.
>
> # this binding is selected when the compatible property constraint matches
> select:
>   required: ["compatible", "$path"]
>   properties:
>     $path: { const: "/" }

See my pull request. This isn't actually working. :)

>     compatible:
>       contains:
>         enum: [ "arm,juno", "arm,juno-r1", "arm,juno-r2" ]
>
> required:
> - model
> - psci
> - cpus
>
> properties:
>   model:
>     enum:
>       - "ARM Juno development board (r1)"
>       - "ARM Juno development board (r2)"
>
> This is a board level binding file for the Juno board. There are three
> important top level properties:
> == select ==
> Contains a schema. If the node is at the root ($path=='/') and
> compatible is one of the juno boards, then this binding applys
>
> == required ==
> List of properties/nodes that must be present. In this case model,
> psci, and cpus. compatible isn't listed because it is already
> guaranteed to be present because it was in the select node. Also note
> that the contents of the nodes/properties doesn't have to be
> specified. The format of a lot of standard properties will already be
> validated by the core DT schema.
>
> For example, model must always be a simple string.
>
> == properties ==
> Schemas for specific properties can go here. In this case I've
> constrained model to contain one of two strings, and in the test repo
> this demonstrates a validation failure because the juno.cpp.dts
> contains (r0) instead of (r1) or (r2).
>
>
>>> No idea :)
>>>
>>> DT is weird enough that there might not be a way to describe this in
>>> a regular jsonschema form. I would wait until Grant pitches in.
>>
>> I've played around with things a bit and the more I do the less happy
>> I am with jsonschema. Maybe this is not what Grant has in mind, but
>> here's the snippet of the compatible check I have:
>>
>> properties:
>>   compatible:
>>     description: |
>>       Compatible strings for the board example.
>>
>>     type: array
>>     items:
>>       type: string
>>       oneOf:
>>         - enum:
>>           - "example,board"
>>           - "example,board2"
>>         - enum:
>>           - "example,soc"
>
>
> I modified this one a bit to show how it would work with the select
> property. In this case the binding matches against two possible
> compatible strings, but the properties list also enforces
> "example,soc" to appear in the compatible list.
>
> # this binding is selected when the compatible property constraint matches
> select:
>   required: ["compatible"]
>   properties:
>     compatible:
>       contains:
>         enum: [ "example,board", "example,board2" ]
>
> properties:
>   # The "select" keyword above already ensures the board compatible is in the
>   # list. This entry makes sure the soc compatible string is also there. It is
>   # also a place to put the description for documentation purposes.
>   compatible:
>     contains:
>         const: "example,soc"

I really dislike the split here with the duplication of the data. You
don't check the case where you only have the fallback (a common
error). We also need to check order.

  allOf:
    contains:
      const: "example,soc"
    contains:
      enum: [ "example,board", "example,board2" ]

BTW, this is also silently ignored because "contains" is a v6 keyword
and only v4 is supported. While silently ignoring in some contexts is
a feature, I think here that is a problem.

>> First, it is more verbose than I'd like and not a language immediately
>> intuitive to low-level C developers (at least for me). My first
>> mistake was that *Of values have to be schema objects when I really
>> want logic ops for values.
>
> Yes, more verbose that I would like too, but I have yet to come across
> anything much better. I think defining an extensible schema language
> is just hard and it brings with it a learning curve. Every schema
> system I looked at has the same problem. No matter what we do we're
> going to have the pain of it not being intuitive to people used to
> programming in C.

Did you consider fragments of python or some other language? Not
exactly sure what that would look like, but some subset of the
$language with a set of DT specific functions that can be called.
Perhaps a language that cares about whitespace like python is not a
good thing to embed in YAML/JSON.  I like the syntax of Pantelis' eBPF
constraints (being C like), it's really only the choice of backend
that I'm questioning there. Giving what everyone has said is a
non-goal (in kernel validation) as the primary reason for eBPF hasn't
helped the cause.

Have you looked at the $data keyword? Not sure if that would help
here. That too may be a v6 thing.

At least for this case, we simply have N lists of data and need to
reference the lists in 2 different ways. We need to match on any
element from the N lists and then validate we have only one element
from each list and in list order. The binding writer should only have
to supply those lists. IMO, having the data listed twice and having
boilerplate that's longer than the data are non-starters. It's one
thing for some vendor specific binding to have some verbose
jsonschema, but it's another thing for something that will be in every
single binding document.

Another case that comes to mind is how to implement generic checks for
I2C and SPI buses. Other than node name (which is often not the
generic name), we don't have any properties to match on (for many
common bindings we can use "#*-cells" properties). That leaves us with
needing a list of I2C controller compatible strings to match on.

> For constant values, the const and enum properties seem to be most
> concise way to specify a specific value using stock jsonschema. We can
> however define new keywords for DT specific validation. A stock
> validator will ignore them, but a DT aware validator can use them to
> do more complete validation.

I need to study how to do that. Have you found examples doing that?

>> Second, the constraints are not complete
>> and and I've not come up with how you would express them. Essentially,
>> we need to express at least one of each set is required and
>> "example,soc" must be last. I suppose we can come up with custom
>> expressions, but it seems to me that if we can't even express a simple
>> example like this with standard jsonschema then it is not a good
>> choice.
>
> If the compatible string was a known size then ordering can be
> enforced using the items property, but there isn't anything in the
> spec or proposed for enforcing order in arbitrarily sized arrays. It
> would need to be an extension.
>
> I don't think that makes jsonschema as a whole a bad choice. It does a
> lot of the things we need right away, and not matter what we choose
> we're going to be poking at corner cases where the DT context doesn't
> quite fit. At the very least, I think there needs to be more examples
> converted over to see what it looks like in real world usage.

I'm just highlighting the issues I see some of which may be due to my
what can be counted in hours of experience with jsonschema. I
certainly want to see how it works for specific examples. In
particular, I want to see things that can't be done easily with dtc.

Rob
