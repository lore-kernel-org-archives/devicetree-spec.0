From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Tue, 28 Nov 2017 13:58:36 +0000
Message-ID: <CACxGe6tgdDm1oNNf0AFrdXK+fhoNxc-7yTO2hcQuCQ4wdeXY-w@mail.gmail.com>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
 <1509646427.5500.6.camel@hp800z> <CACxGe6vRSGbXAVo2TDvX0t+CiZFYcLfWTQsHt5LD3oaKL=4qew@mail.gmail.com>
 <20171109064850.GE7732@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=dZV2r6M2F+QDX7UjP1Hr7OKTGY5kvj8+g/jcPwtX+PM=;
        b=vy8gSU/lx3ITidts3nsYIIxRUPiTXBybwoggOmtKEiC+gKjLZoWbie/HdFKGopJfKU
         0A93PcS0GhseczW71ZWh/hfRW0hmbhoktlmxriTOCMkf6vZIWPxuugecUzUdk7fc6z51
         ruzZluPaHiCy5MSvlpTnt8ILehOWnboggfg3WHoa0Ke3C10G32HFEfr49OXfIczlRSo2
         G+Fu3XL88xrG75avv8KFgZ+MZUJUz01+PsZlRCJGY40UYb3Xy0SOaXYUnVe6tvhAhCFi
         wPzz3GOH1UJFEUA3D0aBkVSFbRuy3nZfzn5xnSarBLI2jkjzIBqIPF+lsaDakyDtdQaQ
         JTeg==
In-Reply-To: <20171109064850.GE7732-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Nov 9, 2017 at 6:48 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Nov 07, 2017 at 02:14:06PM +0000, Grant Likely wrote:
>> On Thu, Nov 2, 2017 at 6:13 PM, Pantelis Antoniou
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

The primary issue is that only one anchor can be applied to a node.
We'd need to drop support for multiple labels on the same node. I'm
not a fan of the trick of using a reference to a node in order to put
another anchor on it. That's pretty nasty too.

>
> The $labels magic property is pretty yucky, it'd be good to avoid it
> if we can.

I think it is a pretty clean way to add metadata to a node. It doesn't
conflict with the node/property name namespace, and it is extensible
for other kinds of metadata.

>
>> >>   - A YAML style !phandle or !path type definition would work for
>> >> parsing references.
>> >
>> > !phandle is a bad name IMO. It assumes that the implementation is going
>> > to always be a cell integer containing a phandle. I think !ref is
>> > better.
>
> Uhh.. I don't understand your point here.  To output something the
> kernel will understand an integer phandle is exactly what the
> reference needs to expand to.
>
> I'm dubious about changing that implementation, but even if we did
> we'd still need a way to generate the current style for
> compatibility.  So !phandle or !phandlerref (to match the !pathref I
> think you already have) seems like a good name to me.

I don't have any strong feelings about the name. As for format, I'm
using the following for path and phandle references. In both cases the
first example uses full path, the second a label, but in both cases
the property is tagged as a reference to another node.

path:
        s1: [!path "/memory@0"]
        s1: [!path "memlabel"]
phandle:
        ref: [[!phandle "/memory@0"]]
        ref: [[!phandle "memlabel"]]




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
>
> Seems to me you want a type-tagged map for each overlay component,
> something like
>
> !overlayfragment {
>         target-label = "etm0";
>         content = { /* the actual nodes */ };
> }
>
>>
>> Store the path/tree pair as a tuple (an array of arrays)
>> - [ / , {...} ]
>> - [ &etm0, {...} ]
>> - [ &etm1 , {...} ]
>> - [ / , {...} ]
>> - [ /aliases , {...} ]
>
> Works for now, but limited if we ever need more metadata for an
> overlay/fragment.
>
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
>
> I dislike this because it mixes "in band" and "out of band" info,
> requiring more special handling in tools to separate them again.  I
> really think a type-tagged map is the right (and YAML-ish) way to do
> this.

Using the same argument, my first take on node format is to separate
nodes and properties because theoretically they are in different
namespaces. Something like this:
node@0:
    $props:
        compatible: [ acme,toaster ]
        reg: [ [0] ]
    child1: { ... }
    child2: { ... }

But I really dislike having the extra level of indentation, and it
turns out it isn't difficult to parse & validate when only one level
is used. Nodes are always maps, properties are always arrays, and the
types do not overlap. (Besides, I think it is a good thing to stop
allowing a node and a property to share the same name). So for this
case, I think it is worth dropping $props to reduce the nesting level
for properties.

For the metadata case, I've got the same leaning. Since there is no
overlap between metadata properties ($...) and node/property
properties (ugh, namespace clash between yaml & dt), I think it is
better to have the metadata at the same level.

g.
