From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Tue, 28 Nov 2017 15:45:16 +0000
Message-ID: <CACxGe6uGjvi=VEHNaKUamz294Y=mGq7OPXfmzrkGHmCbjq-GGw@mail.gmail.com>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
 <1509646427.5500.6.camel@hp800z> <CACxGe6vRSGbXAVo2TDvX0t+CiZFYcLfWTQsHt5LD3oaKL=4qew@mail.gmail.com>
 <1510222587.5500.57.camel@hp800z>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=+wzvTRkPLh1JeggKkGn81JREvcGzxxLIujebaP7WOjU=;
        b=2GwUq3dK5j0/5l5J2Wb+9qa9wV9scwYUbnJLILpz/ODTtVu85w/iSb85Z6+Egg9+dh
         dNLVembUIxII25ptyibT/fKBGdedYZB678/nzPKODowpMttBSFdDhOIuNI2Uo8r0LyW8
         l6n2Tww2q0Ugv8IGClNbs15tDcJXFESmKxUiCmkaNII98AHvv3+Vf3g0gmX4ecFDox3i
         BDp0x8ArPSZcrUvwHeG1yW8KTx/xUv57ICnmmvjXkm+qpQgSFN9lC8x1LKAJ2jaFjzjP
         4rEq9+dqDFvSWI5BVJLrS3hsLw8d9iX67GUNobPmu10fCSZ0q3xqGcStZtPlbVG6T1aa
         ZU+g==
In-Reply-To: <1510222587.5500.57.camel@hp800z>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Pantelis,

Thanks for the update. Comments below...

On Thu, Nov 9, 2017 at 10:16 AM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi Grant,
>
> Just pushed a few changes to yamldt which among other things enables
> JSON support. Note that JSON is strictly an output format for now.
>
> Notable features are:
>
> - JSON output is now supported.
>
> - '$' is supported as well as a reference indicator on bare scalars
> similar to '*'
>
>     property: *ref
>     property: $ref
>
> are equivalent.
>
> - Labels can be declared using the /label/ special property.
> The use of /label/ was used since it's similar to the way /memreserve/
> is a special keyword. Internally it's the same as declaring an
> anchor.

I'm not a fan of the /.../ style for the yaml encoding. It was part of
the tokenization in the .dts format, but is not necessary here. I
prefer a simpler form like '$labels'. I think prefixing metadata
property names with '$' because the YAML parser can handle $ without
special escaping, and $ does not conflict with the DT node/property
namespace.

>
>   foo: &label
>   foo:
>     /label/: label
>
> You can also use a sequence for multiple label declaration in one go.
>
>   foo:
>     /label/: [ label1, label2 ]

The $labels property should always be a sequence, regardless of if
there is one or more labels. Otherwise a parser needs to know about
both forms.

> - !ref as a long form method for a reference:
>
>   foo: *label
>   foo: $label
>   foo: !ref label
>
> Are all equivalent.

The *label and $label forms should be dropped entirely, and only the
tagged !ref form be supported. *label is ambiguous for a reader as to
whether it is a DT reference or an alias. $label doesn't differentiate
between a reference and a string that just happens to start with '$'.
The !ref form is unambiguous as to what it is for.

>
> - JSON does not support tags; so yaml tags are transformed to a tuple
> sequence:
>
>   foo: !int16 10
>
>   foo: [ "\f!int16", 10 ]
>
> The form feed escape and ! at the start of a string scalar allows
> detection that this is a type declaration. This is arguably ugly but
> then again, JSON is not meant to be used as a source format.

so... this is problematic because it makes the json data model
different from the yaml one. The offsets to datum in a property array
are different depending on if it is loaded from a json file or a yaml
file. In the json case, because it is a simpler format which doesn't
have the ability to specify type, I think integer data needs to be
emitted as plain bytes because that is the lowest common denominator.

If we're going through json, I don't think we need to try and preserve
all the datatype information. It would only be for communicating with
really-simple-software. (Yes, I know that's not the direction I was
going before, but JSON just is too limited a format to consider
anything other than a lossy output)

>
> On Tue, 2017-11-07 at 14:14 +0000, Grant Likely wrote:
>> On Thu, Nov 2, 2017 at 6:13 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> > Hi Grant,
>> >
>> > Mostly agree, some notes below.
>> >
>> > On Thu, 2017-11-02 at 16:44 +0000, Grant Likely wrote:
>> >> Hi Pantelis and Rob,
>> >>
>> >> After the workshop next week, I'm trying to capture the direction
>> >> we're going for the schema format. Roughly I think we're aiming
>> >> towards:
>> >>
>> >> - Schema files to be written in YAML
>> >> - DT files shall remain written in DTS for the foreseeable future.
>> >> YAML will be treated as an intermediary format
>> >>   - That said, we'll try to make design decisions that allow YAML to
>> >> be used as a source format.
>> >> - All schema files and yaml-encoded-dt files must be parsable by stock
>> >> YAML parsers
>> >> - Schema files to use the jsonschema vocabulary
>> >>   - (jsonschema assumes json files, but YAML is a superset so this will be okay)
>> >>   - Extended to add vocabulary for DT concepts (ignored by stock validators)
>> >>     - C-like expressions as used in Pantelis' yamldt could be added in this way
>> >>   - Need to write a jsonschema "metaschema" do define DT specific extensions
>> >>     - metaschema will be used to validate format of schema files
>> >>     - Existing tools can confirm is schema files are in the right format.
>> >>     - will make review a lot easier.
>> >>
>> >> The yaml encoding produced by yamldt is a good start, but some changes
>> >> need to be made from the current code to be workable:
>> >> - The redefinition of the anchor/alias syntax needs to be dropped.
>> >>   - We need a labels/reference syntax instead.
>> >>   - I'm using a $labels property to contain a list of labels which is
>> >> working for me, but I'm open to other suggestions
>> >
>> > I'm working on supporting just that. Should be ready for testing in a
>> > couple of days. Do note that I think we should keep the old '*' usage
>> > for supporting the binding files that are YAML.
>>
>> Not sure what you mean here. Do you mean allowing native YAML
>> anchors/aliases in binding files to reduce duplication? If so, I think
>> that should be discouraged in favour of jsonschema's native $ref
>> keyword for referencing other nodes. It's not quite as expressive as
>> anchors/alias, but it is portable for anyone who needs to transcode
>> into strict JSON.
>>
>
> Sorry, didn't express my self clearly there. I meant using $ as a
> reference prefix.
>
>> >>   - A YAML style !phandle or !path type definition would work for
>> >> parsing references.
>> >
>> > !phandle is a bad name IMO. It assumes that the implementation is going
>> > to always be a cell integer containing a phandle. I think !ref is
>> > better.
>>
>> Sure, I'm fine with that
>>
>
> Done.
>
>> > Note that we must come with a way to encode types in JSON, since
>> > they are not natively supported.
>>
>> Agreed.
>>
>
> So, I've come up with a way ^^^
>
> Not very aesthetically pleasing though. I'm open to suggestions.
>
>> >
>> >> - At the top level, the yaml-encoded-dt needs to be structured as a
>> >> list, not a map.
>> >>   - Using a list will properly accounts for how multiple top level
>> >> trees are overlayed to create the final tree.
>> >
>> >
>> > This is true only for non-resolved files. Resolved files are going to
>> > be guaranteed a map. Does this cause problems for your validator?
>>
>> Make the resolved file a list with only one entry at the top level,
>> then the problem goes away.
>>
>
> Err, isn't that a bit of a hack? :)

Not really. Having the top level be a list of trees means the exact
same structure is used regardless of whether it is a resolved or an
unresolved tree. However, I have softened on this. The majority of the
validator will work on a resolved tree. It will get passed just the
tree portion, not the entire structure. Also, since yaml won't be the
source format for the foreseeable future, any decision made now can be
changed later.

>> Regardless, I'm finding that the validator needs to walk the tree(s)
>> and be able to apply a binding at any level, so driver bindings won't
>> be affected by the structure at the top level. Board and SoC bindings
>> might.
>>
>
> Hmm, definitely for board and SoC bindings.
>
>> >>   - I'm using a $path property to encode the path of each top level
>> >> node. Again, I'm open to suggestions for a different approach
>> >>
>> >
>> > A bare scalar that starts with / can always be deduced to be a path.
>>
>> I don't understand what you mean. That scalar still needs to be
>> encoded in some way.
>>
>
> OK, let me explain.
>
> In yaml strings need not be quoted if they are 'simple'
>
> So:
>
>   property: "foo"
>   property: foo
>
> Are equivalent, but the first one is a quoted string while the second is
> a bare scalar that since it's not null, boolean, or a number, is a
> string.
>
> We can use this to deduce that a bare string that looks like a path is a
> path.
>
>   path-property: !path "/foo"
>   path-property: /foo
>
> We can safely deduce that these are equivalent.

No, we cannot because we don't know what it is a path for! Is it a
Linux path or a devicetree path? Without knowing the binding for the
property, we cannot deduce if the path refers to another node in the
tree. It might just be data used by the driver that happens to start
with a '/'.

But regardless, that's not what I'm talking about with the $path
property. I've been using $path as a way to encode where a top level
node lives in the tree. This of course is only an issue for unresolved
trees. Resolved trees only have one top level node, and we know it
lives at "/". It is only when loading a .dts file with multiple top
level nodes does the location of each node need to be stored in $path.

>
> If you're doing this in JSON, then you have no other way than what
> you're using now.
>
>> > Can you share some examples about your usage?
>>
>> Consider an unresolved tree that has successive trees applied to
>> different levels:
>>
>> / { ... };
>> &etm0 { ... };
>> &etm1 { ... };
>> / { ... };
>> /aliases { ... };
>>
>> To transcode this into YAML the path/reference needs to be stored
>> somewhere. As already discussed, it cannot be a map because keys can
>> appear more than once and order of application matters, so it must be
>> a list. Some possible options for storing the path/reference in the
>> array structure are:
>>
>> Store the path/tree pair as a tuple (an array of arrays)
>> - [ / , {...} ]
>> - [ &etm0, {...} ]
>> - [ &etm1 , {...} ]
>> - [ / , {...} ]
>> - [ /aliases , {...} ]
>>
>> Or it could be stored as a special property in the node, something
>> that doesn't collide with child/property names. An array of maps:
>>
>> - $path: "/"
>>   ...
>> - $path: "&etm0"
>>   ...
>> - $path: "&etm1"
>>   ...
>> - $path: "/"
>>   ...
>> - $path: "/aliases"
>>   ...
>>
>> Personally, I prefer embedding the path right into the node because it
>> drops a level of nesting.
>>
>
> Expanding your example:
>
> / {
>   one;
>   etm0: etm0 { etm0_one; };
>   etm1: etm1 { etm1_one; };
>   aliases { nada; }
> };
> &etm0 { two; };
> &etm1 { three; };
> / { four; };
> /aliases { five; };
>
> For yamldt would encode it as:
>
> one: true
> etm0: &etm0
>   etm0_one: true
> etm1: &etm1
>   etm1_one: true
> aliases:
>   nada: true
> *etm0:
>   two: true
> *etm1:
>   three: true
> four: true
> /aliases:
>   five: true

> The resulting yaml output would be:
>
> one: true
> four: true
> etm0:
>   etm0_one: true
>   two: true
> etm1:
>   etm1_one: true
>   three: true
> aliases:
>   nada: true
>   five: true

Yes, I have no issue with this yaml encoding of the resolved tree.

> Note that the output file is proper YAML, it's the source that we are
> talking about.
>
> I think a very simple way to encode it would be (using $ for ref and
> labels with the new style):
>
> - /:
>     one: true
>     etm0:
>       /label/: etm0
>       etm0_one: true
>     etm1:
>       /label/: etm1
>       etm1_one: true
>     aliases:
>       nada: true
> - $etm0:
>     two: true
> - $etm1:
>     three: true
> - /:
>     four: true
> - /aliases:
>     five: true

I've been encoding the same structure like this:

unresolved_tree:
- $path: /
  one: true
  etm0:
    $labels: [ etm0 ]
    etm0_one: true
  etm1:
    $labels: [ etm1 ]
    etm1_one: true
 aliases:
    nada: true
- $path: !ref etm0
  two: true
- $path: !ref etm1
  three: true
- $path: /
  four: true
- $path: /aliases:
  five: true

The difference between our two approaches is:

Your structure:
  [ { (node ref/path): { prop1: val, prop2: val, ... } } ]
My structure:
  [ { $path: (node ref/path), prop1: val, prop2: val, ... } ]

The difference is the amount of nesting. You're using two maps, and
the outer one has only one key; the node ref. I'm using a single map
and a special property to encode the node ref. Visually the two maps
looks better, but in terms of accessing the data I far prefer the
single map approach.

>
> You can even get rid of the sequence indicators and keep the first
> one if you're sure about indentation
> - /:
>     one: true
>     etm0:
>       /label/: etm0
>       etm0_one: true
>     etm1:
>       /label/: etm1
>       etm1_one: true
>     aliases:
>       nada: true
>   $etm0:
>     two: true
>   $etm1:
>     three: true
>   /:
>     four: true
>   /aliases:
>     five: true

This is where it falls down again. The sequence indicators must be
there, otherwise it is just back to trying to use a map to encode
ordered top level trees. The ordering is lost because yaml doesn't
guarantee ordering in maps, which is needed in unresolved trees. While
it works for you in yamldt, a generic yaml parser will mess it up.

Cheers,
g.
