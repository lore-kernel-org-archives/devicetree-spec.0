From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Follow up from Plumbers and next steps?
Date: Tue, 15 Nov 2016 12:15:06 -0800
Message-ID: <582B6CCA.3040104@gmail.com>
References: <CAKM2CV+iOGLBtu0MbF+bS=baJ9zz5MOLSMP1ChDOHcmwHs9cTQ@mail.gmail.com>
 <3665B3F0-8C9F-423C-8E7B-0EF7ACAB1DE9@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=LhpvEq9U/mFePHuR9c6FIySEhyqj6wvtW8AkAnElaVM=;
        b=ZfQKLFUHj9t4LFNxGqh4VkaPlPKa4m68SuuW6frNZBP0GyKVeYoyOwWbdomzYsppib
         ESz39WW+4REwIZoypRdJKOoxbsd61uGaGb6IfaCIZeQYrYo3wbuYxl0puZmKgOIfz+9i
         lh4wS8lkjaj9Wx7JRDE0jO+e6tms18Vk1/jcUSsF4yWIK9lO0K7x3ddE4P4EqeRyU01S
         E1UYAq4yWsgySJ4khwkyLzhKLkj/eTseQveyyhuXG8BWjvsnrIUoqHvbYV2KYbmmsX7t
         Clj6OYjNw4iQfmGUV7ZE46i6KSzKOwkr8tjyIxNFhcwDrtuhzzVCq9iFOQpNtNL0WuMh
         TNPQ==
In-Reply-To: <3665B3F0-8C9F-423C-8E7B-0EF7ACAB1DE9-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "darknighte-p1iUmGEPI8RGBRGhe+f61g@public.gmane.org" <darknighte-p1iUmGEPI8RGBRGhe+f61g@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 11/15/16 08:46, Kumar Gala wrote:
> 
>> On Nov 15, 2016, at 10:12 AM, darknighte <darknighte-p1iUmGEPI8RGBRGhe+f61g@public.gmane.org> wrote:
>>
>> Folks,
>>
>>  Sorry that I couldn't make it to LPC this year.  How'd it go and
>> where are we with the spec?
>>  I've got some cycles in the next few weeks, so, I thought I'd check in.
> 
> Grant started doing some hacking on schema and parsing tools here:
> 
> https://github.com/glikely/dtgendoc
> 
> Based on the work Matt Porter started.


Grant's slides are linked from:

http://elinux.org/Device_tree_future#Devicetree_Validation


The etherpad notes for Grant's talk:

Device Tree Schema Discussion - by Grant Likely

New Specification for Device Tree
Linaro started beginning of 2016
old EPAPR spec has been opened and reformatted (sphynx)
Then things stalled...
Uneasy about converting bindings from human form to another human form
We would like mechanical validation.
Matt Porter did some stuff with YAML a year ago.
Didn't want to only do text-based work.
Now have a proposal for schema validation.
Want to talk about schema and tools

Matt Porter proposed a YAML syntax - that's where Grant started.
What is the grammar to use to validate the content of the bindings
How do we write a tool to validate device tree files

Still needs to be human readable, suitable for doc generation

Conceptual model:
Every single node of the tree has been validated
How to map schema files to nodes? How to inherit? How to determine which schemas are applicable?
idea: load or index all schemas available, and then walk the tree
find every schema that matches each node
compatible values can be used for matching
any node/property not validates is flagged as error or warning

Schema example: see slides
key properties: pattern and schema
pattern = criteria for applying schema
schema = validation for attributes

pattern notes:
match property contains a list of things that have to match (at least one)
match needs to be expressive, but most of the time, this will be compatible strings

Question: how to enforce required children?
Answer: can put in schema for parent, or..

envision tool loading everything and then matching nodes to schema items

schema notes:
list of properties that can exist
for each one:

name, whether required, pattern of data in the property, human readable description


can have core schema definitions with general requirements

allow special casing


can inherit schema attributes to avoid repetition


Grammar:
BNF, JSON, something else
Settled on BNF (kind-of)
what kinds of things need to be validated:

bytes, cells, uints, ints, strings, phandle

first thing is to specify the property name itself

2 dots for parent, 3 dots for ancestor path


more grammar elements:

string-list

use #<name>-cells ancestor reference to specify size of cells for this schema definition

more difficult for interrupts, because you have to find which ancestor is the one providing the size info


Implementation:
use of pyparsing - grant like this a lot
can very quickly play around with syntax

Rob Herring started something similar last year based on Matt's work.
Rob looked at how to convert the current documentation.
He used the DTS files and instrumented DTC to dump our each nodes properties
Had mass conversion of the documentation tree
Question: was code released
Answer: commented on Matt's YAML syntax, got no feedback, moved on...

Grant: would like some YAML syntax modifications based on work done so far

Generating the syntax is easy.
Rob recommends worrying about the schema syntax intricacies later. Grand schemes don't work.
Just get started with something.

Need to stop reviewing differences in how people write binding documentation. Would be nice to get to that point.

Question: if you write a syntax that doesn't work, we would have to re-write it later
Answer: could start with a few simple requirements, and add specializations later.
Answer2: once the bindings are parseable we can convert to another format later.
Anything we do now to make bindings parseable would be good progress.

This will change the way we submit bindings. Need to avoid confusion about submission requirements.
Need to communicate clearly, when bindings need to be submitted under the new regime.
There will be lots of work to do once we start applying the validation to existing bindings
Can ask maintainers to help convert existing bindings.

We won't get suffering to zero - still need to validate that the driver is dooing the right thing.
Frank working on a tool to show which properties are being accessed. Tool shows
what properties are being accessed at runtime. Was presented at ELCE. see: http://events.linuxfoundation.org/sites/events/files/slides/dt_debugging_part_3_0.pdf

Comment on rationale: board files used compiler to check validity of structures, types, etc. This
makes up for that loss of functionality in the conversion to DT.
This also helps developers know exactly what they should put into the bindings.

Want to reduce information in documentation files

devicetree-spec is the mail list to use to discuss this. Location of room on Thursday to further discussion will be posted to this mail list.

Optional properties started to get complicated. Grant has thought about this.
Need a way to determine when a property is optional or not. Can possibly use groupings

Can start with small schemas and grow in complexity over time. Can put the human-readable
requirements for properties and values into description nodes (mechanically parsed, but not validated)
As we add syntax, it should not break existing schema files.

Validator will help convert from a system of human validation of dts by intepreting the binding doc,
to one where the computer can help us validate DTS and detect bugs when they are malformed.
