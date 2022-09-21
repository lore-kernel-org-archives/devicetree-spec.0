From: Krzysztof Kozlowski <krzysztof.kozlowski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 16/21] dt-bindings: reserved-memory: introduce
 designated-movable-block
Date: Wed, 21 Sep 2022 08:35:43 +0200
Message-ID: <12602c20-d653-4d64-8589-b33270e2baa2@linaro.org>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-17-opendmb@gmail.com>
 <20220914145506.GA2149379-robh@kernel.org>
 <57f19774-39a1-03a6-fe68-83d7e4b16521@gmail.com>
 <07d87203-6fe1-c612-cb79-9080e1988454@linaro.org>
 <b4b2b4c6-52b6-80f0-5db3-7f7b751989c3@gmail.com>
 <e0e043aa-0f79-59a8-05ab-e48046860524@linaro.org>
 <92a2cf9f-c371-fb7d-11ff-90cdc09dcae6@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=n+2ZxJcjb49lGiDrPW53e358mRm61CpTv1V9K9mM2/k=;
        b=Vk8cu70b2BLhdL9QfU4XqEGV6y9ItVyPNeaDVEKQyONGnm8PDjErRHMix23+F4/i+x
         DUYYEkTJv4KMbAP3ZEpf/j+LCOronifjSow3KNMiGQcTSLzm8XujG0zwvFL1JGAUrrpT
         9b7KffmeyonCFVjs0h/gXS6WI8crxWYY2Inol3d2eR+ZP4niDck6cqAFIgX0uDb28wGg
         2Hp9+yBzzBSABfL0yYGQLKS4UWWWOpl/u+yBq7z8ncvfMa1mMJ8aJp5oPJ5aI+wXKa7k
         N46xiO+36aPa1CMAq1XLpZHfoTwmKcN7amcuerVq4aup0IbPkUb2Xaf9aDm3SYq5vBAB
         PTLw==
Content-Language: en-US
In-Reply-To: <92a2cf9f-c371-fb7d-11ff-90cdc09dcae6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>, Hari

On 21/09/2022 02:14, Doug Berger wrote:
> On 9/19/2022 4:03 AM, Krzysztof Kozlowski wrote:
>> On 19/09/2022 01:12, Doug Berger wrote:
>>> On 9/18/2022 3:31 AM, Krzysztof Kozlowski wrote:
>>>> On 14/09/2022 18:13, Doug Berger wrote:
>>>>> On 9/14/2022 7:55 AM, Rob Herring wrote:
>>>>>> On Tue, Sep 13, 2022 at 12:55:03PM -0700, Doug Berger wrote:
>>>>>>> Introduce designated-movable-block.yaml to document the
>>>>>>> devicetree binding for Designated Movable Block children of the
>>>>>>> reserved-memory node.
>>>>>>
>>>>>> What is a Designated Movable Block? This patch needs to stand on its
>>>>>> own.
>>>>> As noted in my reply to your [PATCH 00/21] comment, my intention in
>>>>> submitting the entire patch set (and specifically PATCH 00/21]) was to
>>>>> communicate this context. Now that I believe I understand that only this
>>>>> patch should have been submitted to the devicetree-spec mailing list, I
>>>>> will strive harder to make it more self contained.
>>>>
>>>> The submission of entire thread was ok. What is missing is the
>>>> explanation in this commit. This commit must be self-explanatory (e.g.
>>>> in explaining "Why are you doing it?"), not rely on other commits for
>>>> such explanation.
>>>>
>>>>>
>>>>>>
>>>>>> Why does this belong or need to be in DT?
>>>>> While my preferred method of declaring Designated Movable Blocks is
>>>>> through the movablecore kernel parameter, I can conceive that others may
>>>>> wish to take advantage of the reserved-memory DT nodes. In particular,
>>>>> it has the advantage that a device can claim ownership of the
>>>>> reserved-memory via device tree, which is something that has yet to be
>>>>> implemented for DMBs defined with movablecore.
>>>>
>>>> Rephrasing the question: why OS memory layout and OS behavior is a
>>>> property of hardware (DTS)?
>>> I would say the premise is fundamentally the same as the existing
>>> reserved-memory child node.
>>
>> I don't think it is fundamentally the same.
>>
>> The existing reserved-memory node describes memory used by hardware - by
>> other devices. The OS way of handling this memory - movable, reclaimable
>> etc - is not part of it.
>>
>> So no, it is not the same.
>>
>>>
>>> I've been rethinking how this should be specified. I am now thinking
>>> that it may be better to introduce a new Reserved Memory property that
>>> serves as a modifier to the 'reusable' property. The 'reusable' property
>>> allows the OS to use memory that has been reserved for a device and
>>> therefore requires the device driver to reclaim the memory prior to its
>>> use. However, an OS may have multiple ways of implementing such reuse
>>> and reclamation.
>>
>> ... and I repeat the question - why OS way of implementing reuse and
>> reclamation is relevant to DT?
>>
>>> I am considering introducing the vendor specific 'linux,dmb' property
>>> that is dependent on the 'reusable' property to allow both the OS and
>>> the device driver to identify the method used by the Linux OS to support
>>> reuse and reclamation of the reserved-memory child node.
>>
>> Sure, but why? Why OS and Linux driver specific pieces should be in DT?
>>> Such a property would remove any need for new compatible strings to the
>>> device tree. Does that approach seem reasonable to you?
>>
>> No, because you did not explain original question. At all.
> I apologize if I have somehow offended you, but please recognize that my 
> apparent inability to answer your question does not come from an 
> unwillingness to do so.
> 
> I believe an example of the reserved-memory node being used the way you 
> indicate (though there are other uses) can be expressed with device tree 
> nodes like these:
> 
> reserved-memory {
> 	#address-cells = <0x1>;
> 	#size-cells = <0x1>;
> 	ranges;
> 
> 	multimedia_reserved: multimedia@80000000 {
> 		reg = <0x80000000 0x10000000>;
> 	};
> };
> 
> decoder@8012000 {
> 	memory-region = <&multimedia_reserved>;
> 	/* ... */
> };
> 
> Here a 256MB chunk of memory is reserved for use by a hardware decoder 
> as part of rendering a video stream. In this case the memory is reserved 
> for the exclusive use of the decoder device and its associated device 
> driver.
> 
> The Devicetree Specification includes a property named 'reusable' that 
> could be applied to the multimedia node to allow the OS to "use the 
> memory in this region with the limitation that the device driver(s) 
> owning the region need to be able to reclaim it back". 

Indeed, there is such.... and should be used instead. :)

> This is a good 
> idea, because this memory could probably be put to good use when the 
> decoder is not active. Unfortunately, the methods for reusing this 
> memory are not defined for Linux so the multimedia reserved memory would 
> not be reused even though the devicetree indicates that it is allowed.

Then rather implementation has to be changed, not Devicetree bindings.

> 
> The notion behind this commit was to introduce the 
> 'designated-movable-block' compatible string that could be added to the 
> multimedia node to allow the Client Program (i.e. Linux) to select a 
> device driver that knows how to reclaim reserved memory back from the OS 
> when it is needed by the decoder device and release it back to the OS 
> when the decoder no longer needs it. In this way, the purpose of the 
> multimedia node remains the same (i.e. to reserve memory for use by a 
> device), but a new compatible string is defined to allow for selection 
> of an appropriate device driver and allow successful reuse of the memory 
> for the benefit of the system.

We don't need a new compatible for it but use that existing property.

> 
>  From Rob's feedback it is clear that 'designated-movable-block' is not 
> an appropriate name, but maybe 'linux,dmb' might have been. However, it 
> would be more flexible if a 'linux,dmb' property could be introduced as 
> a modifier to the existing 'reusable' property to provide a general 
> mechanism for clarifying how 'reusable' should be supported by the 
> Client Software and its device drivers.
> 
> Such a property is not directly relevant to hardware, but the devicetree 
> is not wholly concerned with hardware. Reserved memory node children 
> include support for 'linux,cma-default' and 'linux,dma-default' 
> properties that signal behavioral intent to the Linux OS. Some aspects 
> of the devicetree (e.g. the /chosen node and 'reusable' property) are 
> for the benefit of the Client Program.

Fair enough, although there is difference between generic property for
reusable/reclaimable memory and a property describing one of Linux
memory-management zones.

Best regards,
Krzysztof
