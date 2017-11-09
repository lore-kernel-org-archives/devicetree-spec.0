From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Thu, 09 Nov 2017 12:27:31 +0200
Message-ID: <1510223251.5500.67.camel@hp800z>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
         <1509646427.5500.6.camel@hp800z>
         <CACxGe6vRSGbXAVo2TDvX0t+CiZFYcLfWTQsHt5LD3oaKL=4qew@mail.gmail.com>
         <20171109064850.GE7732@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UiHh3zC9lz4P86a/jYuLe90tKVLMFuZSpLwCiBkF4z0=;
        b=fuJHIQvQnfRRjlwlIaTdUgiGziwGaT+u4I6LYR6gKabLQ23nNebIUWiEGHL3UUbY7F
         1fz9ajcFlFQI4jqxxcNJFN1eS8nZzIHAe/rY5vQTvcfLM1FKEwIkLUuii3s4XdEtEOQw
         3ngQSoiZvwg9Y6LlWJh+e6CcStAq36IFTZBzo=
In-Reply-To: <20171109064850.GE7732-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi David,

On Thu, 2017-11-09 at 17:48 +1100, David Gibson wrote:
> On Tue, Nov 07, 2017 at 02:14:06PM +0000, Grant Likely wrote:
> > On Thu, Nov 2, 2017 at 6:13 PM, Pantelis Antoniou
> > <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > > Hi Grant,
> > >
> > > Mostly agree, some notes below.
> > >
> > > On Thu, 2017-11-02 at 16:44 +0000, Grant Likely wrote:
> > >> Hi Pantelis and Rob,
> > >>
> > >> After the workshop next week, I'm trying to capture the direction
> > >> we're going for the schema format. Roughly I think we're aiming
> > >> towards:
> > >>
> > >> - Schema files to be written in YAML
> > >> - DT files shall remain written in DTS for the foreseeable future.
> > >> YAML will be treated as an intermediary format
> > >>   - That said, we'll try to make design decisions that allow YAML to
> > >> be used as a source format.
> > >> - All schema files and yaml-encoded-dt files must be parsable by stock
> > >> YAML parsers
> > >> - Schema files to use the jsonschema vocabulary
> > >>   - (jsonschema assumes json files, but YAML is a superset so this will be okay)
> > >>   - Extended to add vocabulary for DT concepts (ignored by stock validators)
> > >>     - C-like expressions as used in Pantelis' yamldt could be added in this way
> > >>   - Need to write a jsonschema "metaschema" do define DT specific extensions
> > >>     - metaschema will be used to validate format of schema files
> > >>     - Existing tools can confirm is schema files are in the right format.
> > >>     - will make review a lot easier.
> > >>
> > >> The yaml encoding produced by yamldt is a good start, but some changes
> > >> need to be made from the current code to be workable:
> > >> - The redefinition of the anchor/alias syntax needs to be dropped.
> > >>   - We need a labels/reference syntax instead.
> > >>   - I'm using a $labels property to contain a list of labels which is
> > >> working for me, but I'm open to other suggestions
> > >
> > > I'm working on supporting just that. Should be ready for testing in a
> > > couple of days. Do note that I think we should keep the old '*' usage
> > > for supporting the binding files that are YAML.
> > 
> > Not sure what you mean here. Do you mean allowing native YAML
> > anchors/aliases in binding files to reduce duplication? If so, I think
> > that should be discouraged in favour of jsonschema's native $ref
> > keyword for referencing other nodes. It's not quite as expressive as
> > anchors/alias, but it is portable for anyone who needs to transcode
> > into strict JSON.
> 
> Yeah, I'm not sure what's meant here either.  I think the anchor alias
> syntax should be supported in the standard YAML way, with the alias
> expanding to the full object referenced.  It doesn't help us for
> phandle/path references, but it's useful in its own right.
>
> Note that the problem with using alias syntax for references is purely
> on the alias side.  I don't see a reason we can't use standard YAML
> anchor syntax then something else to construct a reference to that
> anchor.
> 


Yes, that make sense to keep both IMO.

The '*' as the expanding version, and the '$' as the non-expanding (like
DT uses).

> The $labels magic property is pretty yucky, it'd be good to avoid it
> if we can.
> 

I'm not a big fond of it either. However if you have more than one label
in a node it's cleaner than re-declaring the same name node as empty
with the additional label.

If one was to expand YAML, there's no significant problem with allowing
multiple label definitions instead of a single one.

> > >>   - A YAML style !phandle or !path type definition would work for
> > >> parsing references.
> > >
> > > !phandle is a bad name IMO. It assumes that the implementation is going
> > > to always be a cell integer containing a phandle. I think !ref is
> > > better.
> 
> Uhh.. I don't understand your point here.  To output something the
> kernel will understand an integer phandle is exactly what the
> reference needs to expand to.
> 
> I'm dubious about changing that implementation, but even if we did
> we'd still need a way to generate the current style for
> compatibility.  So !phandle or !phandlerref (to match the !pathref I
> think you already have) seems like a good name to me.
> 

My point is that this is a reference, that it's encoded as an integer
for the DTB output option is an implementation detail.

> > Sure, I'm fine with that
> > 
> > > Note that we must come with a way to encode types in JSON, since
> > > they are not natively supported.
> > 
> > Agreed.
> 
> I thought the YAML spec had some guidelines for flattening YAML to
> JSON.
> 

It does flatten the content. The type information is thrown away.
Anyway, I've come up with a relatively simple (yet a bit ugly) way.

foo: !int16 10

can be transcribed to JSON type preserving format as

foo: [ "\f!int16", 10 ]

A knowledgeable parser can deduce that the sequence corresponds to the
original source.

> > >> - At the top level, the yaml-encoded-dt needs to be structured as a
> > >> list, not a map.
> > >>   - Using a list will properly accounts for how multiple top level
> > >> trees are overlayed to create the final tree.
> > >
> > >
> > > This is true only for non-resolved files. Resolved files are going to
> > > be guaranteed a map. Does this cause problems for your validator?
> > 
> > Make the resolved file a list with only one entry at the top level,
> > then the problem goes away.
> > 
> > Regardless, I'm finding that the validator needs to walk the tree(s)
> > and be able to apply a binding at any level, so driver bindings won't
> > be affected by the structure at the top level. Board and SoC bindings
> > might.
> > 
> > >>   - I'm using a $path property to encode the path of each top level
> > >> node. Again, I'm open to suggestions for a different approach
> > >>
> > >
> > > A bare scalar that starts with / can always be deduced to be a path.
> > 
> > I don't understand what you mean. That scalar still needs to be
> > encoded in some way.
> > 
> > > Can you share some examples about your usage?
> > 
> > Consider an unresolved tree that has successive trees applied to
> > different levels:
> > 
> > / { ... };
> > &etm0 { ... };
> > &etm1 { ... };
> > / { ... };
> > /aliases { ... };
> > 
> > To transcode this into YAML the path/reference needs to be stored
> > somewhere. As already discussed, it cannot be a map because keys can
> > appear more than once and order of application matters, so it must be
> > a list. Some possible options for storing the path/reference in the
> > array structure are:
> 
> Seems to me you want a type-tagged map for each overlay component,
> something like
> 
> !overlayfragment {
> 	target-label = "etm0";
> 	content = { /* the actual nodes */ };
> }
> 
> > 
> > Store the path/tree pair as a tuple (an array of arrays)
> > - [ / , {...} ]
> > - [ &etm0, {...} ]
> > - [ &etm1 , {...} ]
> > - [ / , {...} ]
> > - [ /aliases , {...} ]
> 
> Works for now, but limited if we ever need more metadata for an
> overlay/fragment.
> 
> > Or it could be stored as a special property in the node, something
> > that doesn't collide with child/property names. An array of maps:
> > 
> > - $path: "/"
> >   ...
> > - $path: "&etm0"
> >   ...
> > - $path: "&etm1"
> >   ...
> > - $path: "/"
> >   ...
> > - $path: "/aliases"
> >   ...
> > 
> > Personally, I prefer embedding the path right into the node because it
> > drops a level of nesting.
> 
> I dislike this because it mixes "in band" and "out of band" info,
> requiring more special handling in tools to separate them again.  I
> really think a type-tagged map is the right (and YAML-ish) way to do
> this.
> 

The example I've posted earlier does work like this.

The form:

- /:
    one: true
  $etm0:
    two: true

Is functionally identical with:

- !ref "/":
    one: true
  !ref "etm0"
    two: true

Regards

-- Pantelis

