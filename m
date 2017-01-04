From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Describe interrupts-extended property
Date: Tue, 3 Jan 2017 16:47:03 -0800
Message-ID: <0d9b43f1-147c-5761-9fdd-8ba28c690df9@gmail.com>
References: <20170103192423.5838-1-f.fainelli@gmail.com>
 <20170103230436.GS12761@umbus.fritz.box>
 <f04c76d4-996b-6ffd-d59e-eb992d0a912d@gmail.com>
 <20170104003147.GW12761@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=ciEFXL0W+TUqWhun0XtMRzhBg+uEX8tAIoJTXPVp/Co=;
        b=DCrXH+8ghp//mDgvxeQLpSQKobbBHD8bl7RpptPkm30TjymVuk6xO+SiKpWOXrsDyR
         hr/+ru85Kn00DX9FJSbVviUlF8WreQCBuhtOEQBk/Oij2fIomE7u0UsexMfTzTTPsEBS
         s6AIX/LmSiTpxUN5MCywXm0bAJQNhRiqVD8K98qFvAbUVfsfIGV7yjQ4Cv7H4Kthm5KZ
         E3jI+p3+sLT6ih+4DdkaiOT0fVVWzR8WFnqhHYwQBEsP26YyXFXj0EkYTFkKXMBDH28d
         21xZzsx+nq2B348J3KMffcljWuNiD4b5tO8GYTyFphGDnaqJh+IFezLz9/fXE1ykK5WE
         UDmw==
In-Reply-To: <20170104003147.GW12761-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

On 01/03/2017 04:31 PM, David Gibson wrote:
> On Tue, Jan 03, 2017 at 03:44:28PM -0800, Florian Fainelli wrote:
>> On 01/03/2017 03:04 PM, David Gibson wrote:
>>> On Tue, Jan 03, 2017 at 11:24:23AM -0800, Florian Fainelli wrote:
>>>> The interrupts-extended property is a common property used when
>>>> interrupt generating devices having interrupt lines in several interrupt
>>>> controllers with possibly distinct interrupt specifiers.
>>>>
>>>> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>
>>> Hmm.  Is this actually used in the wild already?
>>
>> Yes, we have been using this for nearly 3 years now, primarily with
>> devices that have a "main" interrupt and a "wake-up" interrupt in
>> separate interrupt controllers. There are existing in kernel tree users
>> of this as well.
> 
> Ok, fair enough then.
> 
>>> I'm just wondering if it's really needed, since you can work around
>>> the limitations with the ordinary interrupts property by setting
>>> interrupt-parent to the node itself putting an interrupt nexus
>>> (interrupt-map and interrupt-map-mask properties) in there to redirect
>>> those to different interrupt controllers.
>>
>> Well, sure you could do that, and this actually serves a similar, if not
>> identical purpose, it just appeared that interrupts-extended got
>> introduced to solve that problem, is supported by Linux, and therefore
>> may deserve a documentation in the Device Tree spec. I'd have to double
>> check, but it does not appear to me that the solution you are proposing
>> is supported by Linux for instance.
> 
> Right.  The point is I used this workaround to avoid inventing
> something like interrupts-extended nearly 10 years ago (for the Bamboo
> 440EP board I think).  Admittedly the workaround is pretty ugly.
> 
>> Digression: I was actually wondering if we may not have a need to do the
>> same thing for "reg" properties, where a given device may have memory
>> mapped I/O registers in one place, and another address in another bus,
>> with a different address space, this is actually pretty common for e.g:
>> PHY (Ethernet, PCIe, SATA or USB).
> 
> I've wondered about something like that for some time (my working name
> was 'bus-reg').  The use cases I encountered were on PPC4xx machines
> which had lots of things controlled (at least partially) by the
> sideband "DCR" (Device Control Register) bus.  We did invent a
> 'dcr-reg' property to cover that specific case, and I think something
> similar has been done for some other sideband busses.  Something like
> 'bus-reg' would be a more general solution to the problem.

Seems to me like syscon is pretty much what was invented in Linux to
support that use case.

> 
> I believe the "classic" IEEE1275 way of solving this is to have
> separate nodes on each of the relevant busses, with phandle pointers
> linking them together.  The relevant driver would claim all the
> related nodes.  Again, it gets pretty messy, though.

Yes still pretty ugly.

Device Tree tends to list resources as properties of the node that
consumes them, which is fine, although it can lead to duplicate values
in a given DTB, but one could also imagine, say listing all register
resources as properties of the bus that decodes these addresses, and
then having child nodes of that bus node reference via phandle their
relevant "reg" cells. Something like this for instance:

bus@deadbeef {
	reg = <0x10000000 0x100>, //UART 0
		<0x10000100 0x100> //UART 1

	uart@100 {
		compatible = "acme,uart";
		reg = <&bus 0>;
	};
};

You get the idea ;)

> 
>>>> ---
>>>>  source/devicetree-basics.rst | 34 ++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 34 insertions(+)
>>>>
>>>> diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
>>>> index be80af3d825b..1bda0fa54e7a 100644
>>>> --- a/source/devicetree-basics.rst
>>>> +++ b/source/devicetree-basics.rst
>>>> @@ -955,6 +955,40 @@ Description:
>>>>     to the interrupt parent. If this property is missing from a device, its
>>>>     interrupt parent is assumed to be its devicetree parent.
>>>>  
>>>> +interrupts-extended
>>>> +^^^^^^^^^^^^^^^^^^^
>>>> +
>>>> +Property: ``interrupts-extended``
>>>> +
>>>> +Value type: ``<phandle> <prop-encoded-array>``
>>>> +
>>>> +Description:
>>>> +
>>>> +   The *interrupts-extended* property of a device node defines the interrupt or
>>>> +   the interrupts that are generated by the device. In case where an interrupt
>>>> +   generating devices has several interrupt lines, some of them having distinct
>>>> +   interrupt parents, the *interrupts-extended* property should be used to
>>>> +   fully describe the interrupts of this device, relative to the interrupt
>>>> +   controller(s), which is encoded by the phandle part of the property. The non
>>>> +   phandle part of the property encodes the interrupt specifiers and obeys to
>>>> +   the *interrupts* property description.
>>>> +
>>>> +   If both *interrupts-extended* and *interrupts* properties are present, the
>>>> +   *interrupts-extended* properties takes precedence, and the *interrupts*
>>>> +   property may be provided to a client program for compatibility purposes.
>>>> +
>>>> +Example:
>>>> +
>>>> +   A device with several interrupt lines in distinct interrupt controllers,
>>>> +   having different interrupt specifiers is illustrated below. In this example
>>>> +   ``pic`` is an interrupt controller with an *#interrupt-cells* specifier
>>>> +   of 2, while ``gic`` is an interrupt controller with an *#interrupts-cells*
>>>> +   specifier of 1.
>>>> +
>>>> +
>>>> +      ``interrupts-extended = <&pic 0xA 8>, <&gic 0xda>;``
>>>> +
>>>> +
>>>>  Properties for Interrupt Controllers
>>>>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>  
>>>
>>
>>
> 


-- 
Florian
