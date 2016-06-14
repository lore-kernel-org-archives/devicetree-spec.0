From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: case sensitivity for devicetree node names
Date: Mon, 13 Jun 2016 22:29:35 -0700
Message-ID: <575F963F.8090105@gmail.com>
References: <575B1D84.2010703@gmail.com>
 <20160614011021.GD4882@voom.fritz.box> <575F7FC1.5040508@gmail.com>
 <20160614051028.GL4882@voom.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Bp+QQU68OwMdmFOvTTPiSm8lRIyFym1tkf6pwdI9hGQ=;
        b=t+xHByM20Tp2lIvvDqxRmVDufqXN5aoxugGOYbU0PQvn+527aKNzF252GbOJLfQYNn
         /AMWzhZUDBD8pgA4mx5rVmgoT779sGM2E028rLGITPxlPQXCbOEOOXs2iYwLVzRJzM65
         UTi4np++omGR045tlK/0HNd+v4j3i31jTXRw8ShughZBu6YKa2mDsd5BQYDm/s7Y0XfQ
         N0vQw5nTQOwKFLXD3CySU8AU6DrHJgyMBMMcYrvQ4RNdz491hGHQhcXh8z4LQ/pILZao
         fxd7AcvXIqmYHKGwFak0pb8MZg8XfhAM5SmrXgooHDO3TsQg+w2QeyI2CfwFP8OAb/7g
         6X3w==
In-Reply-To: <20160614051028.GL4882-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 06/13/16 22:10, David Gibson wrote:
> On Mon, Jun 13, 2016 at 08:53:37PM -0700, Frank Rowand wrote:
>> On 06/13/16 18:10, David Gibson wrote:

< snip >

>>> Here's my inclination for how to treat this in dtc for the time being:
>>>     1) Leave the bulk of dtc case sensitive, as now
>>>     2) Add a new check which will generate an error if there are node
>>>        names which differ only in case.
>>>
>>> Any objections to that plan?
>>
>> I think that the kernel should match the current behavior of dtc.
>>
>> I agree with "1)".
>>
>> I don't think that "2)" is required.  I think it is a really dumb idea for
>> anyone to create a dts with node names that differ only in case.  But I
>> don't think it is the compiler's job to protect people from being dumb.
>> An analogue would be the C language and compilers.  The C compiler doesn't
>> error on a program that has variables "foo" and "Foo".
> 
> Hmm.. actually I think protecting you from being dumb is exactly the
> purpose of compiler warnings.  Now that you found that quote from
> 1275, which is pretty definitive as far as I'm concerned, I'd expect
> to reduce that error to a warning (by default).

A warning is ok by me.

-Frank
