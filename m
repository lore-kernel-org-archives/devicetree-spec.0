From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Thu, 13 Jul 2017 09:47:01 -0700
Message-ID: <4594fc97-9b9f-267e-ee8e-8cbe89341fe7@gmail.com>
References: <ok4f5h$qg1$1@blaine.gmane.org>
 <180baf3e-9e7b-c791-3be2-81d807b14759@gmail.com>
 <ok6su1$pdq$1@blaine.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ZagAr5myhKPQ0ptWKlkFyszYyjukPnYp7SpzOxkhvac=;
        b=PTsMqSTUc/zm9ULGo4FiuKT+BXLG8DC82pHetLZCzCCuVH5Aa4UEv8IUXWViWU/ZV+
         8qUibR3bB52IszTTLYF1U3hWP2DutQnQDlwledHEpFZJJp8VLzcNNdnWUJl+YOD1qCMJ
         Ri6wR3h0+u0RecQXdGzr5tMRmE05UwSeABP8bmPQRQJHVJriL4m2QzMvGRNKHS1sIZO2
         orh/1jmJx7UuoI2SiZ79Ko/g3Q/0JE8hImoMwrXRL7+ckAA5XW6A7+xJxzM/9Lore+/o
         mGB+rzY2zUApDyDHL1lhdhB4K6Sv2uH9/7zUNu7UENj7x6rME+GsFuuLhfGojqxk4MWH
         2qVw==
In-Reply-To: <ok6su1$pdq$1@blaine.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 07/12/2017 09:23 PM, Cyril Novikov wrote:
> On 7/12/2017 10:10 AM, Florian Fainelli wrote:
>> On 07/11/2017 11:15 PM, Cyril Novikov wrote:
>>> Hi, all!
>>>
>>> The product that I work on supports physical device assignment (aka
>>> "pass-through") to virtual machines, which means we need to take
>>> portions of the physical FDT and include them in the guest FDT. This
>>> needs to happen automatically in software.
>>>
>>> The problem is phandles, because we cannot identify them in the blob and
>>> therefore can't find any dependent devices/nodes that also need to be
>>> included in the guest FDT. So the process cannot be fully automated. We
>>> can't even advise the user what other devices should be assigned to the
>>> VM. The hypervisor runs or bare metal, so having to parse the source DTS
>>> files for this is very inconvenient.
>>>
>>> Would it be possible to add metadata properties to the binary FDT
>>> format, which would identify other property cells that are in fact
>>> phandles? It could be a per-node property or a single root node
>>> property, up to you guys. DTC would then automatically generate the
>>> metadata property along with the phandle property when compiling the
>>> DTS.
>>
>> phandles are already per-node properties, they are not quite different
>> from normal properties actually. If a node is referred to by other
>> nodes, the DTC compiler would add a phandle = <N> (and maybe even
>> linux,phandle = <N> depending on options passed to it) where N is a
>> global integer that keeps being incremented every time a new phandle is
>> generated.
>>
>> When you strip or create new nodes from a base blob for your virtual
>> machine, either the node is still existing, in which case its phandle
>> property (if existing) is still valid and can still be referenced to, or
>> it is a new node and then you can control how to allocate new phandle
>> integers.
>>
>> I guess I am just not clear on what problem you are seeing with phandles
>> based on your description of what you want to do?
> 
> Maybe I should have worded it differently: the problem is with phandle
> references rather than phandle properties themselves, does it make it
> more clear?

It does, thanks.

> There is no way to know that a certain aligned 4 byte
> sequence is a phandle that references another part of the FDT. You can
> for some standard properties whose format is known not only to the
> driver, but you can't in general. That makes it impossible to analyze
> and detect dependencies between different parts of the FDT automatically.

I see what you mean now, there is indeed no way to tell whether a
property that has an integer is just a normal integer versus an integer
corresponding to a phandle.

You could argue that property that specify a phandle should have a name
that suggests so, like "phy-handle" but then this stops working with
e.g: gpios that are (at least with Linux) specified as e.g: reset-gpios.
In any case, you would have to have some sort of heuristic built into
your FDT mangling code that tries to check if a given property is
designating a phandle as opposed to having a more robust approach...

> 
> I think this situation is solvable with automatically DTC-generated
> metadata. I'm also interested if there are other hypervisor vendors that
> had to deal with this and how big is the demand for a solution. If we
> are the first one, at least let it register that there's a problem and
> interest in addressing it.

That would work, I have not heard of a similar problem with the
hypervisor folks that I worked with, but AFAIR they were generating
their DTS almost from scratch as opposed to mangling/passing through
parts of an existing one.
-- 
Florian
