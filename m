From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Tue, 28 Nov 2017 17:10:09 +0000
Message-ID: <CACxGe6uBx4F8WznVxa8MS_Vio-FYEdDYGr7LToKhkFUE-1tnHg@mail.gmail.com>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=rmyTggzCe0AbLsgPO+p4mSCH66/80P+dz06h01qZO6U=;
        b=Zvy/mE8IJuYXPX8JTCgJ50YcWUr+sMbP3eq+t1KKUWG3repMEAvIiFThXWDBkhRWMn
         wq7jjLbLvZui9XajgGw6MhP/88LRjbeoQN13Q4HPgM38zaa3U+uAtyvHiKQ2pOtTA+On
         SKDX1O2zH9Rxm5QxprvfnB8YdZk4EXND+3mO9r48Vr1+FEDnnGNSbFmYan3StW8GY6e9
         1WuHHKE23AehNSVnJijxcng5kI3ZjvDd7EUJrZUO4X8VZkyR3674elMLDC3MiBG2elIy
         bSDAZjQnebSUcbE7TtPzLMEIlniFCpFZiZYpHxV+IqC8HwGGJ/gfPTnIhWO+U6126CqT
         v/Fg==
In-Reply-To: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Nov 2, 2017 at 4:44 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> The yaml encoding produced by yamldt is a good start, but some changes
> need to be made from the current code to be workable:
> - The redefinition of the anchor/alias syntax needs to be dropped.
>   - We need a labels/reference syntax instead.
>   - I'm using a $labels property to contain a list of labels which is
> working for me, but I'm open to other suggestions
>   - A YAML style !phandle or !path type definition would work for
> parsing references.
> - At the top level, the yaml-encoded-dt needs to be structured as a
> list, not a map.
>   - Using a list will properly accounts for how multiple top level
> trees are overlayed to create the final tree.
>   - I'm using a $path property to encode the path of each top level
> node. Again, I'm open to suggestions for a different approach

I've come across another issue, this time with the property encoding.
Originally I thought to just encode properties in whatever form looks
best to us humans. So, for example a node might look like this:

uart@1000000:
    compatible: ["acme,uart", "ns16550"]  # list of strings
    model: "Fancy UART" .   # single string
    gpio-controller: true       # Boolean
    #gpio-cells: [ 2 ]            # Weird UART, it provides GPIOs.
Single integer value
    reg: [ 0xc0001000 0x1000 ];   # list of single values
    interrupt-parent: [ !phandle "intc1" ] .   # single phandle
    interrupts: [ [ 1, 0 ], [2, 0x2] [5, 0x6] ]  # 3 interrupt lines

However, I discovered it is tough to know how to go from .dts to yaml
in a consistent way because there is information missing about how it
should be encoded.

For example, should a property with a single string in it be encoded
as a single string (prop: strvalue) or as a list of strings (prop:
[strvalue]). The .dts syntax doesn't give us any clues about whether a
property is only ever going to be a single value (model,
interrupt-parent, #gpio-cells), or if it might be a list of
values/tuples (compatible, reg, interrupts). For validation, it
becomes a lot more complex if a value can be encoded in multiple ways.
For example, here are two ways to encode compatible:
        compatible: "acme,uart"
        compatible: [ "acme,uart" ]
The first is more concise, but it means the validator has to account
for both encodings.
        compatible: [ "acme,uart", "ns16550" ]

I hit a similar problem with groups of cells. While it looks better to
encode a single value without a sequence, the tool doesn't have any
information to know which properties are single values, and which are
sequences, but the validator still needs to deal with it. For example,
the following two lines are arguably equivalent, but which form should
the tooling emit?
        reg: 1
        reg: [1]

I also want to preserve grouping information as it appears in the dts.
Most of the time dts files already have things like reg and interrupt
tuples grouped for each entry. That information is very useful for
validation, and that grouping should be preserved. For example,
interrupts could be encoded as one of the following:

        (translating from dts:    interrupts = <1 0>, <2 2> <5 6>;)
        interrupts: [ 1 0 2 2 5 6 ]
        interrupts: [ [1,0], [2,2], [5,6]]

Both would be valid encodings, but the later carries information
useful for validation and helps to match what the writer intends to
the schema being used. I want to get that into the YAML output.

So, I propose the following:
- The yaml format should always encode properties as a sequences,
regardless of whether or not it contains only a single value. That
means that consumers don't need to handle both sequence and
non-sequence variants of a property. A single value will always
dereference as a sequence containing only one value. No ambiguity. So,
a list of strings would be encoded in the form:
        str-prop: [ "str1" ]
        str-prop: [ "str1", "str2" ]
        str-prop: [ "str1", "str2", "str3" ]
- Integer values (bytes, u16, cells, u64) will always be contained in
another sequence to represent the grouping from the .dts file. For
example:
        int-prop: [ [0] ]        # int-prop = <0>;
        int-prop: [ [0, 1] ]    # int-prop = <0 1>;
        int-prop: [ [0], [2] ]        # int-prop = <0>, <2>;
        int-prop: [ [0, 1], [2, 3] ]    # int-prop = <0 1>, <2 3>;
- I'm encoding other bit sizes with a tag at the group level to match
up with what is done in the .dts files:
        bytes: [ !u8 [ 0 1 2 3 4 5 ] ]     # bytes = [ 0 1 2 3 4 5 ]
        uint16: [ !u16 [ 6 7 8 9 ] ]        # uint16 = /bits/ 16 [ 6 7 8 9 ]
        uint32: [ [ 0 1 2 3 4 5 ] ]          # uint32 = [ 0 1 2 3 4 5 ]
        uint64: [ !u16 [ 6 7 8 9 ] ]        # uint64 = /bits/ 64 [ 6 7 8 9 ]
I could instead attach the tag to each number value, which is arguably
more flexibly for future refinement, but that would result in a lot of
tags in the case of a large byte property. For example:
        mac-address: [ [ !u8 0xA0, !u8 0xB0, !u8 0xC0, !u8 0xD0, !u8
0xE0, !u8 0xF0 ] ]

Finally, an example using a mixed property:
        mixed: [ "string1", !u8 [0xde, 0xad, 0xca, 0xfe], "string2",
[0x12345678, 0x9abcdef0], !u64 [0xA000B000C000D000] ]

Using this scheme, there will only ever be one way to encode a
property and the validation code doesn't need to account for all the
different variations.

Thoughts?

Cheers,
g.
