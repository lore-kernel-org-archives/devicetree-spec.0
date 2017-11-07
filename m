From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Tue, 7 Nov 2017 14:14:06 +0000
Message-ID: <CACxGe6vRSGbXAVo2TDvX0t+CiZFYcLfWTQsHt5LD3oaKL=4qew@mail.gmail.com>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
 <1509646427.5500.6.camel@hp800z>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=QRixWZk+ugut4bTOfm/w79Ws7skyZrfLPzGYOPekBDM=;
        b=hztk/5Bi9FXORRyQxyadxpYfLw52/gSYiG9sO9xVV5M0dy1ZdKFl7TllvOfoq1KUOZ
         rTF2AEGBIY2u9S3V7O+Uuf0rTbfA/97qRSDV/9QiXwpnlkyIh9lwgdoVUVl697nEwA2B
         Yw7r2yJquUPELoNXUUwQJQsb5A+VoQDIs7G00zf3j8pa+pLX2ArESCbL9i6v5dpV2ba3
         OS/5DG3PE7AUs+4mHNCY52HGgAHqec9V8p9oiG/AAtNOrhejg/8cVyZpeNbE9GTGU6m0
         sQLE1zAqWdvzgFPiubpX+wjdXt4Hv/SXk/rCQg1lY5GUUbmcbQRSeZA1HZraWJFM19eK
         1Thg==
In-Reply-To: <1509646427.5500.6.camel@hp800z>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Nov 2, 2017 at 6:13 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi Grant,
>
> Mostly agree, some notes below.
>
> On Thu, 2017-11-02 at 16:44 +0000, Grant Likely wrote:
>> Hi Pantelis and Rob,
>>
>> After the workshop next week, I'm trying to capture the direction
>> we're going for the schema format. Roughly I think we're aiming
>> towards:
>>
>> - Schema files to be written in YAML
>> - DT files shall remain written in DTS for the foreseeable future.
>> YAML will be treated as an intermediary format
>>   - That said, we'll try to make design decisions that allow YAML to
>> be used as a source format.
>> - All schema files and yaml-encoded-dt files must be parsable by stock
>> YAML parsers
>> - Schema files to use the jsonschema vocabulary
>>   - (jsonschema assumes json files, but YAML is a superset so this will be okay)
>>   - Extended to add vocabulary for DT concepts (ignored by stock validators)
>>     - C-like expressions as used in Pantelis' yamldt could be added in this way
>>   - Need to write a jsonschema "metaschema" do define DT specific extensions
>>     - metaschema will be used to validate format of schema files
>>     - Existing tools can confirm is schema files are in the right format.
>>     - will make review a lot easier.
>>
>> The yaml encoding produced by yamldt is a good start, but some changes
>> need to be made from the current code to be workable:
>> - The redefinition of the anchor/alias syntax needs to be dropped.
>>   - We need a labels/reference syntax instead.
>>   - I'm using a $labels property to contain a list of labels which is
>> working for me, but I'm open to other suggestions
>
> I'm working on supporting just that. Should be ready for testing in a
> couple of days. Do note that I think we should keep the old '*' usage
> for supporting the binding files that are YAML.

Not sure what you mean here. Do you mean allowing native YAML
anchors/aliases in binding files to reduce duplication? If so, I think
that should be discouraged in favour of jsonschema's native $ref
keyword for referencing other nodes. It's not quite as expressive as
anchors/alias, but it is portable for anyone who needs to transcode
into strict JSON.

>>   - A YAML style !phandle or !path type definition would work for
>> parsing references.
>
> !phandle is a bad name IMO. It assumes that the implementation is going
> to always be a cell integer containing a phandle. I think !ref is
> better.

Sure, I'm fine with that

> Note that we must come with a way to encode types in JSON, since
> they are not natively supported.

Agreed.

>
>> - At the top level, the yaml-encoded-dt needs to be structured as a
>> list, not a map.
>>   - Using a list will properly accounts for how multiple top level
>> trees are overlayed to create the final tree.
>
>
> This is true only for non-resolved files. Resolved files are going to
> be guaranteed a map. Does this cause problems for your validator?

Make the resolved file a list with only one entry at the top level,
then the problem goes away.

Regardless, I'm finding that the validator needs to walk the tree(s)
and be able to apply a binding at any level, so driver bindings won't
be affected by the structure at the top level. Board and SoC bindings
might.

>>   - I'm using a $path property to encode the path of each top level
>> node. Again, I'm open to suggestions for a different approach
>>
>
> A bare scalar that starts with / can always be deduced to be a path.

I don't understand what you mean. That scalar still needs to be
encoded in some way.

> Can you share some examples about your usage?

Consider an unresolved tree that has successive trees applied to
different levels:

/ { ... };
&etm0 { ... };
&etm1 { ... };
/ { ... };
/aliases { ... };

To transcode this into YAML the path/reference needs to be stored
somewhere. As already discussed, it cannot be a map because keys can
appear more than once and order of application matters, so it must be
a list. Some possible options for storing the path/reference in the
array structure are:

Store the path/tree pair as a tuple (an array of arrays)
- [ / , {...} ]
- [ &etm0, {...} ]
- [ &etm1 , {...} ]
- [ / , {...} ]
- [ /aliases , {...} ]

Or it could be stored as a special property in the node, something
that doesn't collide with child/property names. An array of maps:

- $path: "/"
  ...
- $path: "&etm0"
  ...
- $path: "&etm1"
  ...
- $path: "/"
  ...
- $path: "/aliases"
  ...

Personally, I prefer embedding the path right into the node because it
drops a level of nesting.

Thoughts?
g.
