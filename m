From: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Mon, 17 Jul 2017 18:37:47 -0700
Message-ID: <okjp46$s1v$1@blaine.gmane.org>
References: <ok4f5h$qg1$1@blaine.gmane.org>
 <180baf3e-9e7b-c791-3be2-81d807b14759@gmail.com>
 <ok6su1$pdq$1@blaine.gmane.org>
 <4594fc97-9b9f-267e-ee8e-8cbe89341fe7@gmail.com>
 <20170716053548.GL17539@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170716053548.GL17539-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 7/15/2017 10:35 PM, David Gibson wrote:

> But.. I'm very uneasy about the idea.
> 
> The first thing, is that this relies on the dts file containing the
> &whatever phandle reference syntax wherever there should be a phandle
> reference.  That's normal, but nothing stops a user from simply
> putting an actual number there, manually assigning that number to
> another node's phandle and generating a valid dtb that way.
> 
> More importantly, it won't detect phandles if the tree comes from a
> source other than a dts - for example if you flatten /proc/device-tree
> with -I fs, or have code which flattens a tree presented by real Open
> Firmware it won't have that phandle metadata, just integer values.

Yeah, so the metadata does not contain full information. That's fine 
because it's still better than nothing.

> Now those might not be something that happens in your use case, but
> I'm pretty concerned that if I added this functionality, people are
> going to forget that properties are all, fundamentally, bytestrings
> and get surprised when tools don't magically know where the phandles
> are in some cases.
> 
> That said, I'm open to persuasion if a good enough case is made for
> this functionality.

So, what we need fundamentally is a way to detect dependencies in the 
devicetree. Mark is arguing that we cannot *automate* the assignment of 
dependent devices to the same VM. However, just detecting that there is 
a missing dependency goes a long way. What we have now is guest drivers 
failing in various manners, but what they cannot do is point the user to 
the specific device that they need, because they don't have the host FDT 
in their VM.

For example, a driver may print something like

[    2.035071] xuartps ff000000.serial: pclk clock not found.

To resolve this, the user needs to be proficient with the device tree. 
Of course, "pclk" is not a node name in the host FDT. However, if 
configuration software could detect this at the time the set of the VM's 
assigned physical devices was created, it could give the user the name 
of the device that *probably* also needs to be assigned to the same VM. 
The user wouldn't need to learn anything about devicetree, they would 
just need to do a few mouse clicks to assign the dependent device. And 
now it's the software's concern if that assignment is not trivial, as 
Mark warns us.

To summarize, full automation is unfeasible and it is understood, but 
just the dependency information is very helpful too.

> But then, as Mark Rutland says in his other replies, locating phandles
> is far from the only problem in trying to passthrough random DT nodes
> to a guest.

--
Cyril
