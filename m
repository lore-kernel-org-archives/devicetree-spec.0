From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re:  cpp to pre-process dts
Date: Wed, 18 May 2016 14:40:01 -0700
Message-ID: <573CE131.6060101@gmail.com>
References: <CANCZdfow154vh3kHqUNUM6CoBsC9Vu3_+SEjFG1dz=FOkc9vsg@mail.gmail.com> <CAL_Jsq+s3PjzKCaT03EaqNCoyuwDQ6dXHDF808+U=hjvvfRYdg@mail.gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=smQv2g3Pp/D7CiAHYlqDNkyrmaGab/j5SMQcMerYk3o=;
        b=tp/mgPJfRR1n2ZSIB1pH/SX7bC/J5eD0rdK6TnHHBR8qyAVKlYsN4bQr9z5xGKKb0F
         AlQHSk/D4dX9YDPWWYIKMN5vxNW8DcgBiFH+BjVTDKyqse9BfGLab7B/Nm7h3weOgK9Q
         A+mNsFvbZe7VmvhoGDrCSsVI0d/hBzh899rOqFeJFlyaezIRuPeiR9HdsTFb1Qdj/4i1
         UW4JAyJ6PtcuAsr7PUhv47yIDgR0tSCLEJxdwlCL5kjEYcy1aI/etW8pg7sR7Q33vLvo
         vc+ArtFOpIIUhv26o34SzRl9z95EwPYeEMAsdjNSofcG7EEPJMszMR7wQygqdIJ4ivMs
         8G/Q==
In-Reply-To: <CAL_Jsq+s3PjzKCaT03EaqNCoyuwDQ6dXHDF808+U=hjvvfRYdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

And adding a non-blank subject so people won't ignore the thread.

-Frank

On 5/18/2016 11:02 AM, Rob Herring wrote:
> +devicetree-spec which is the right list.
> 
> On Wed, May 18, 2016 at 11:26 AM, Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org> wrote:
>> Greetings,
>>
>> I was looking at the draft link posted here
>> https://github.com/devicetree-org/devicetree-specification-released/blob/master/prerelease/devicetree-specification-v0.1-pre1-20160429.pdf
>> a while ago. I hope this is the right place to ask about it.
>>
>> It raised a bit of a question. There's nothing in it talking about the
>> current
>> practice of using CPP to pre-process the .dts/.dtsi files before passing
>> them
>> into dtc to compile them into dtb.
> 
> Can't say I'm really a fan of it.
> 
>> Normally, I see such things outside the scope of standardization. However,
>> many of the .dts files that are in the wild today use a number of #define
>> constants to make things more readable (having GPIO_ACTIVE_HIGH
>> instead of '0' makes the .dts files easier to read). However, there's a
>> small
>> issue that I've had. The files that contain those definitions are currently
>> in the Linux kernel and have a wide variety of licenses (including none
>> at all).
> 
> Yes, this is a problem. In lieu of any explicit license, I'd say the
> license defaults to GPL. There is also the same issue with the
> Documentation as we plan to move some of the common bindings such as
> clocks, gpio, etc. into the spec which is Apache licensed.
> 
> In both cases, we're going to need to get permission of the authors to
> re-license. For the headers, these should be patches to the kernel.
> For the docs, we just need to record the permission when committing
> the addition to the spec. Neither should be too hard as they should
> not be changing much and we have complete history in git.
> 
>> So before even getting to the notion of licenses and such (which past
>> expereince suggests may be the worst place to start a discussion), I'm
>> wondering where that will be defined, and if these #defines will become
>> part of the standard for each of the bindings that are defined.
> 
> Perhaps. We need to at least define the standard flag values if not
> the symbolic name. I don't think it makes sense to both document and
> maintain headers of the defines. We should ideally just have 1 source
> for all and generate what we need from it. There's been some related
> discussion around having machine parseable bindings as both the
> documentation source and binding validation source, but nothing
> concrete.
> 
>> I'm also wondering where the larger issue of using cpp to process the dts
>> files will be discussed, since FreeBSD's BSDL dtc suffers interoperability
>> due to this issue. Having the formal spec will also be helpful for its care and
>> feeding since many fine points have had to be decided based on .dts
>> files in the wild rather than a clear spec.
>>
>> Thanks again for spear-heading the effort to get a new version out now
>> that ePAPR has fallen on hard times.
>>
>> Warner
>>
>> P.S. I'm mostly a FreeBSD guy, but just spent some time digging into this
>> issue for another of the BSDs that's considering adopting DTS files.
> 
> We certainly need and want the BSD folks involved in the spec.
> 
> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
