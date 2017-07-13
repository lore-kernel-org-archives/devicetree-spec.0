From: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Wed, 12 Jul 2017 21:23:08 -0700
Message-ID: <ok6su1$pdq$1@blaine.gmane.org>
References: <ok4f5h$qg1$1@blaine.gmane.org>
 <180baf3e-9e7b-c791-3be2-81d807b14759@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <180baf3e-9e7b-c791-3be2-81d807b14759-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 7/12/2017 10:10 AM, Florian Fainelli wrote:
> On 07/11/2017 11:15 PM, Cyril Novikov wrote:
>> Hi, all!
>>
>> The product that I work on supports physical device assignment (aka
>> "pass-through") to virtual machines, which means we need to take
>> portions of the physical FDT and include them in the guest FDT. This
>> needs to happen automatically in software.
>>
>> The problem is phandles, because we cannot identify them in the blob and
>> therefore can't find any dependent devices/nodes that also need to be
>> included in the guest FDT. So the process cannot be fully automated. We
>> can't even advise the user what other devices should be assigned to the
>> VM. The hypervisor runs or bare metal, so having to parse the source DTS
>> files for this is very inconvenient.
>>
>> Would it be possible to add metadata properties to the binary FDT
>> format, which would identify other property cells that are in fact
>> phandles? It could be a per-node property or a single root node
>> property, up to you guys. DTC would then automatically generate the
>> metadata property along with the phandle property when compiling the DTS.
> 
> phandles are already per-node properties, they are not quite different
> from normal properties actually. If a node is referred to by other
> nodes, the DTC compiler would add a phandle = <N> (and maybe even
> linux,phandle = <N> depending on options passed to it) where N is a
> global integer that keeps being incremented every time a new phandle is
> generated.
> 
> When you strip or create new nodes from a base blob for your virtual
> machine, either the node is still existing, in which case its phandle
> property (if existing) is still valid and can still be referenced to, or
> it is a new node and then you can control how to allocate new phandle
> integers.
> 
> I guess I am just not clear on what problem you are seeing with phandles
> based on your description of what you want to do?

Maybe I should have worded it differently: the problem is with phandle 
references rather than phandle properties themselves, does it make it 
more clear? There is no way to know that a certain aligned 4 byte 
sequence is a phandle that references another part of the FDT. You can 
for some standard properties whose format is known not only to the 
driver, but you can't in general. That makes it impossible to analyze 
and detect dependencies between different parts of the FDT automatically.

I think this situation is solvable with automatically DTC-generated 
metadata. I'm also interested if there are other hypervisor vendors that 
had to deal with this and how big is the demand for a solution. If we 
are the first one, at least let it register that there's a problem and 
interest in addressing it.

--
Cyril
