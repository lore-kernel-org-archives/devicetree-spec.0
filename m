From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Mon, 6 Nov 2017 21:22:08 +0000
Message-ID: <CACxGe6tNukjHO=fMeg6k-9L9+gHfnfEok7+RHiy=MvfU5QLORw@mail.gmail.com>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
 <CAL_JsqK1rtc81+=vzc36w4MRmQGYXBeib+QCj0TxtxEMVN2bKQ@mail.gmail.com>
 <8DE272D8-6004-4A47-B49C-D3DFB7D9E23C@konsulko.com> <CAL_JsqLx7fDZGNnxc-DXTajvDWGojNFDEUZeBG3A8LMduDNLtQ@mail.gmail.com>
 <E863FAFC-7613-4262-9C9D-0D2A4EF5F880@konsulko.com> <CAL_Jsq+zkKA-78WH0fPTstCfPZhvxdcOCd74uqwu=xNvr++1aA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=092aOyDA4T4hbeV6KgDXjqASqCvN3IgjxVrojfBA70Q=;
        b=SPqnMHXLFBAmEuaCPrq5/HBstrxd5s0aYVWKigFqT/CUlWrHawY46kZsgO0C0Z125W
         KJq7dn6ibH/vu8F0aD07srJHL2pck+AiFcx/Jn3Ajw6CgXvptcNjuwnJ5JlGD71DGQEx
         7JwQYDb59sTwML53MsYuXRowj3vpoQocN6UNh5wspCad/DCK1QerJZCKBy69Qy9Ue/OF
         YtIZrxoQSbEQh5/M50bwyCmwx3eSoSD3WeEDALMBBQNnQfLncaARxxFDJUQWVVDWce3l
         CTvxiSdptCODqAO01UeHf0erBglJXTqns4nq/w7PPMjpv1TaFQwkIzo82HbOBfIpFL60
         /sHQ==
In-Reply-To: <CAL_Jsq+zkKA-78WH0fPTstCfPZhvxdcOCd74uqwu=xNvr++1aA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Hi folks,

I've also been playing with the schemas, and have created a bit of a
framework for actually validating that binding files are valid
schemas, and that a DT validates against all the available schemas.
However, I haven't had time to respond on this thread, or write up
much of what I've done. I'll do that tomorrow. For now, if you're
interested, you can find the code I've written here:

https://github.com/glikely/yaml-bindings

I forked the repo that Rob created for this test code. It will load
all the schema files that it can find in the schemas subtree. To run
it just pass the DT file into the script:

$ ./dt-validate.py test/juno.cpp.yaml

Cheers,
g.

On Mon, Nov 6, 2017 at 4:12 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Nov 3, 2017 at 9:41 AM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> Hi Rob,
>>
>>> On Nov 3, 2017, at 16:31 , Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>
>>> On Fri, Nov 3, 2017 at 9:11 AM, Pantelis Antoniou
>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>> Hi Rob,
>>>>
>>>>> On Nov 3, 2017, at 15:59 , Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>>>
>>>>> On Thu, Nov 2, 2017 at 11:44 AM, Grant Likely <grant.likely@secretlab=
.ca> wrote:
>>>>>> Hi Pantelis and Rob,
>>>>>>
>>>>>> After the workshop next week, I'm trying to capture the direction
>>>>>> we're going for the schema format. Roughly I think we're aiming
>>>>>> towards:
>>>>>>
>>>>>> - Schema files to be written in YAML
>>>>>> - DT files shall remain written in DTS for the foreseeable future.
>>>>>> YAML will be treated as an intermediary format
>>>>>> - That said, we'll try to make design decisions that allow YAML to
>>>>>> be used as a source format.
>>>>>> - All schema files and yaml-encoded-dt files must be parsable by sto=
ck
>>>>>> YAML parsers
>>>>>> - Schema files to use the jsonschema vocabulary
>>>>>> - (jsonschema assumes json files, but YAML is a superset so this wil=
l be okay)
>>>>>> - Extended to add vocabulary for DT concepts (ignored by stock valid=
ators)
>>>>>>   - C-like expressions as used in Pantelis' yamldt could be added in=
 this way
>>>>>> - Need to write a jsonschema "metaschema" do define DT specific exte=
nsions
>>>>>>   - metaschema will be used to validate format of schema files
>>>>>>   - Existing tools can confirm is schema files are in the right form=
at.
>>>>>>   - will make review a lot easier.
>>>>>
>>>>> I want to start small here with defining top-level board/soc bindings=
.
>>>>> This is essentially just defining the root node compatible strings.
>>>>> Seems easy enough, right? However, I quickly run into the problem of
>>>>> how to match for when to apply the schema. "compatible" is the obviou=
s
>>>>> choice, but that's also what I'm checking. We can't key off of what w=
e
>>>>> are validating. So we really need 2 schema. The first is for matching
>>>>> on any valid compatible for board, then 2nd is checking for valid
>>>>> combinations (e.g. 1 board compatible followed by 1 SoC compatible). =
I
>>>>> don't like that as we'd be listing compatibles twice. An alternative
>>>>> would be we apply every board schema and exactly 1 must pass. Perhaps
>>>>> we generate a schema that's a "oneOf" of all the boards? Then we just
>>>>> need to tag board schemas in some way.
>>>>>
>>>>
>>>> I=E2=80=99ve run into this as the first problem with validation using =
compatible properties.
>>>>
>>>> The way I=E2=80=99ve solved it is by having a =E2=80=98selected=E2=80=
=99 property that is generating
>>>> a test for when to check a binding against a node.
>>>
>>> Okay, but what's the "jsonschema way" to do this is my question really.
>>>
>>
>> No idea :)
>>
>> DT is weird enough that there might not be a way to describe this in
>> a regular jsonschema form. I would wait until Grant pitches in.
>
> I've played around with things a bit and the more I do the less happy
> I am with jsonschema. Maybe this is not what Grant has in mind, but
> here's the snippet of the compatible check I have:
>
> properties:
>   compatible:
>     description: |
>       Compatible strings for the board example.
>
>     type: array
>     items:
>       type: string
>       oneOf:
>         - enum:
>           - "example,board"
>           - "example,board2"
>         - enum:
>           - "example,soc"
>
>
> First, it is more verbose than I'd like and not a language immediately
> intuitive to low-level C developers (at least for me). My first
> mistake was that *Of values have to be schema objects when I really
> want logic ops for values. Second, the constraints are not complete
> and and I've not come up with how you would express them. Essentially,
> we need to express at least one of each set is required and
> "example,soc" must be last. I suppose we can come up with custom
> expressions, but it seems to me that if we can't even express a simple
> example like this with standard jsonschema then it is not a good
> choice.
>
> Don't take this as we should use eBPF either. Given the reasoning so
> far for picking it, I'm not sold on it. Seems like a nice shiny hammer
> looking for a problem.
>
> Rob
