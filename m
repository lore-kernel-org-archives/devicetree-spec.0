From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Wed, 12 Jul 2017 10:10:30 -0700
Message-ID: <180baf3e-9e7b-c791-3be2-81d807b14759@gmail.com>
References: <ok4f5h$qg1$1@blaine.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=yFaJG027IKZO2fILcU/WQYsoOBaF3sBj6+Vi0tq3dD4=;
        b=C10h91y66Vp6Rsx4GzIsTe0tvEbSHw60TvHQq6cAah5EtzEsdvTy+94AiIrtC46inr
         560zs/daJoEa2d7/gug9qePgdiD+Yge++6/r56b1x9PsQTil6uS0ZyjvnncCAGjKzATC
         coC4gDIzP4FMJVzPdobb4pcaA55l4Te8YM1FnnFQGwzESBgP6AbWNjvhCbJ0ebp49ELg
         HRcyDdDRmskr0tIiATRt4LVg6Z1mp9meiOiYstYaaC1g+eiD+79745BF/vBU7uUCmlMj
         cUAyDCNjne/cdkpZJRPirXG3MxG4yVOr+E90G1UdMkB3WkkKVOq7auBDneuu53yk/Ivz
         P9MA==
In-Reply-To: <ok4f5h$qg1$1@blaine.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 07/11/2017 11:15 PM, Cyril Novikov wrote:
> Hi, all!
> 
> The product that I work on supports physical device assignment (aka
> "pass-through") to virtual machines, which means we need to take
> portions of the physical FDT and include them in the guest FDT. This
> needs to happen automatically in software.
> 
> The problem is phandles, because we cannot identify them in the blob and
> therefore can't find any dependent devices/nodes that also need to be
> included in the guest FDT. So the process cannot be fully automated. We
> can't even advise the user what other devices should be assigned to the
> VM. The hypervisor runs or bare metal, so having to parse the source DTS
> files for this is very inconvenient.
> 
> Would it be possible to add metadata properties to the binary FDT
> format, which would identify other property cells that are in fact
> phandles? It could be a per-node property or a single root node
> property, up to you guys. DTC would then automatically generate the
> metadata property along with the phandle property when compiling the DTS.

phandles are already per-node properties, they are not quite different
from normal properties actually. If a node is referred to by other
nodes, the DTC compiler would add a phandle = <N> (and maybe even
linux,phandle = <N> depending on options passed to it) where N is a
global integer that keeps being incremented every time a new phandle is
generated.

When you strip or create new nodes from a base blob for your virtual
machine, either the node is still existing, in which case its phandle
property (if existing) is still valid and can still be referenced to, or
it is a new node and then you can control how to allocate new phandle
integers.

I guess I am just not clear on what problem you are seeing with phandles
based on your description of what you want to do?
-- 
Florian
