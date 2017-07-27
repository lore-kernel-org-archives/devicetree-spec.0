From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Fri, 28 Jul 2017 00:59:15 +0300
Message-ID: <1501192755.1055.62.camel@hp800z>
References: <ok4f5h$qg1$1@blaine.gmane.org>
         <180baf3e-9e7b-c791-3be2-81d807b14759@gmail.com>
         <ok6su1$pdq$1@blaine.gmane.org>
         <4594fc97-9b9f-267e-ee8e-8cbe89341fe7@gmail.com>
         <20170716053548.GL17539@umbus.fritz.box> <597629DC.5060800@gmail.com>
         <20170725075034.GD8978@umbus.fritz.box> <597A53E1.4010002@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dWMi4QANyFrbZ0B8M8nk65efASr61bjekOf7Ut0i3xc=;
        b=miext5HtvNw3iC27LTr3KSgyi8CUB8Vjec7K9fwM8C2Q1MXQUTTooRHnVuM4hmy6tC
         xNpz7gg1I7Zv73OLPb36CnbfeCLP2II3+css8QBVRO5qke4pu4ilWRkhxomVvOxSG8Vs
         23h26qJXPiyp+FkSOs0ToKdW6C4VkurDoL7Oo=
In-Reply-To: <597A53E1.4010002-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Hi Frank,

On Thu, 2017-07-27 at 13:58 -0700, Frank Rowand wrote:
> On 07/25/17 00:50, David Gibson wrote:
> > On Mon, Jul 24, 2017 at 10:09:48AM -0700, Frank Rowand wrote:
> >> Hi David,
> >>
> >> (Adding Pantelis and Tom, since I'm going somewhat off-topic from
> >> the original thread, and they are impacted by what I am asking.)
> >>
> >> On 07/15/17 22:35, David Gibson wrote:
> >>> On Thu, Jul 13, 2017 at 09:47:01AM -0700, Florian Fainelli wrote:
> >>>> On 07/12/2017 09:23 PM, Cyril Novikov wrote:
> >>>>> On 7/12/2017 10:10 AM, Florian Fainelli wrote:
> >>>>>> On 07/11/2017 11:15 PM, Cyril Novikov wrote:
> >>>>>>> Hi, all!
> >>>>>>>
> >>
> >> < snip >
> >>
> >>>   The
> >>> phandle fixup information goes into the special __local_fixups__ and
> >>> __fixups__ nodes (which have gratuitiously different format, but
> >>> that's a rant for elsewhere).
> >>
> >> < snip >
> >>
> >> And in another email, David describes the __local_fixups__ format
> >> nicely, so I'll just copy that here instead of re-inventing it:
> >>
> >>
> >>> Well, I don't want to invent a new encoding if we can possibly avoid
> >>> it.  The current encoding used for overlay generation looks like this
> >>>
> >>> / {
> >>> 	target: node@0 {
> >>> 	};
> >>> 	node@1 {
> >>> 		ref = <&target>;
> >>> 	};
> >>> 	__local_fixups__ = {
> >>> 		node@1 {
> >>> 			ref = <0>;
> >>> 		};
> >>> 	};
> >>> };
> >>>
> >>> Basically, __local_fixups__  has a subtree which paralells the main
> >>> tree.  Each property found under __local_fixups__ is a list of offsets
> >>> at which phandle references appear in the corresponding property in
> >>> the main tree.
> >>
> >> I share your desire to rant about the different formats between
> >> __local_fixups__ and __fixups__.  But I have not come up with an
> >> alternate format for __local_fixups__ that makes me happy.  The
> >> best format that I have come up with so far would be:
> > 
> > Well to fix it minimally, I'd go the other way - make __fixups__ look
> > like __local_fixups__ but augmented with labels.  Strings that need
> > parsing aren't a normal thing in the DT.
> 
> On the string parsing issue, I agree that string parsing is not normal
> in the DT.  If changing format in other ways, I would maybe also change
> the __fixups__ format so that (for an example with two tuples), instead
> of
> 
>    "A:B:C", "D:E:F"
> 
> the format would be
> 
>    "A", "B", <C>, "D", "E", <F>.
> 
> Or a more concrete example, change:
> 
>    i2c1 = "/fragment@1:target:0";
> 
> to 
> 
>    i2c1 = "/fragment@1", "target", <0>;
> 
> or (to bikeshed) even change the order to:
> 
>    i2c1 = <0>, "/fragment@1", "target">;
> 
> This may look a little awkward in source form, but in my version
> of what the world should look like, this would not be hand coded
> in a DTS source file, but instead created by dtc in a DTB.  Of
> course it could still be viewed as DTS format by de-compiling
> the DTB.
> 
> I admit this may be a really bad idea from a human usability
> standpoint, because the source fragment (for example):
> 
>         __fixups__ {
>                 i2c1 = <0>, "/fragment@1", "target";
>                 i2c2 = <8>, "/fragment@1", "target";
>                 i2c3 = "/fragment@1", "target", <0>;
>                 i2c4 = "/fragment@1", "target", <8>;
>         };
> 
> decompiles (via 'dtc -O dts') somewhat cryptically as:
> 
> 	__fixups__ {
> 		i2c1 = "", "", "", "", "/fragment@1", "target";
> 		i2c2 = "", "", "", "\b/fragment@1", "target";
> 		i2c3 = "/fragment@1", "target", "", "", "", "";
> 		i2c4 = [2f 66 72 61 67 6d 65 6e 74 40 31 00 74 61 72 67 65 74 00 00 00 00 08];
> 	};
> 
> 

The format of the fixups was originally proposed as it was precisely for
this reason. Yes, parsing strings are icky but parsing strings
interspersed with integers is even ickier.

This problem would be easily solvable if there was a method to record
type information about the sequence of property elements. You would
never even need fixups.

For example you could generate a shadow property for each property that
is encountered and fill it with information about the type of the
original named property.

For instance for ref2 = <&target 42 &target_2> you could generate a
.ref2 = "rcl" property that encodes <remote-reference>, <cell>,
<local-reference>.

It would be pretty efficient too since the second property can a)
eliminated in most cases when the auto type detection (like the one used
in fdtdump) is used and b) the name contains the original property name
so it can be reused in the string table.

You wouldn't need the __fixups__ nodes at all then. The original ref2
property would be encoded in a way that the value placed in the place of
the &target be an offset in the string table that would contain the name
of the remote reference to resolve.

Regards

-- Pantelis

> -Frank
> 
> > 
> >> / {
> >> 	target: node@0 {
> >> 	};
> >> 	node@1 {
> >> 		ref = <&target>;
> >>                 ref2 = <&target 42 &target_2>;
> >> 	};
> >>         target_2: node@2 {
> >>         };
> >> 	__local_fixups__ = {
> >> 		x1 = <"node@1/ref" 0>;
> >>                 x2 = <"node@1/ref2" 0 8>;
> >> 		};
> >> 	};
> >> };
> >>
> >> x1 and x2 are abitrary property names.
> >> The format of each __local_fixups__ property is
> >>    - path of property referencing a phandle
> >>    - list of offsets of the phandle in the property
> >>
> >> As another alternative, Grant was thinking about adding
> >> a new block to the FDT format to contain the phandle
> >> information.  That would remove the need to come up
> >> with a convoluted dts syntax, but adds in the problem
> >> of bootloaders corrupting the new block if they were
> >> not aware of it.  He had thoughts about versioning
> >> and checksums to detect the corruption it if did
> >> occur.
> >>
> >> If we were starting from scratch, do you have any other
> >> approach that might be fruitful?  It seems like maybe
> >> I am missing something that requires thinking outside
> >> the box.
> > 
> > I thought about this the other day a bit.  If going from scratch, I
> > think the way to do it would be to add a new FDT_REF tag to the
> > structure block stream.  After the FDT_PROP tag and its contents,
> > you'd have an arbitrary number of FDT_REF tags, each giving an offset
> > in the preceding property  and a label to fix it up to match.  Not
> > sure if you'd want separate FDT_REF and FDT_LOCAL_REF or just use an
> > empty label to describe a local ref.
> > 
> > This would also allow for extension to say FDT_PATH_REF to insert
> > paths rather than phandles (i.e. a runtime equivalent of prop = &foo;
> > rather than prop = < &foo >;).
> > 
> > For encoding the fragments of an overlay, I'd suggest giving them
> > simply as separate subtrees in the structure block, all before the
> > FDT_END tag. At the moment there has to be only a single subtree
> > before the FDT_END, and the top-level FDT_BEGIN is expected to have an
> > empty name.  We can extend that to overlays by allowing multiple
> > subtrees, and making the top-level "name" the target label instead.
> > 
> > Incidentally, I'd take "label" in all the above to be represented as
> > an old-style OF path.  That is, either an absolute path /foo/bar/baz,
> > or a path relative to an alias, alias/foo/bar/baz.  That means we can
> > just use the existing defined /aliases, rather than re-inventing it as
> > __symbols__.
> > 
> 

