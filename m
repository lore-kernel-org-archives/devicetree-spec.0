From: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>
Subject: Virtualization difficulty -- phandles
Date: Tue, 11 Jul 2017 23:15:55 -0700
Message-ID: <ok4f5h$qg1$1@blaine.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi, all!

The product that I work on supports physical device assignment (aka 
"pass-through") to virtual machines, which means we need to take 
portions of the physical FDT and include them in the guest FDT. This 
needs to happen automatically in software.

The problem is phandles, because we cannot identify them in the blob and 
therefore can't find any dependent devices/nodes that also need to be 
included in the guest FDT. So the process cannot be fully automated. We 
can't even advise the user what other devices should be assigned to the 
VM. The hypervisor runs or bare metal, so having to parse the source DTS 
files for this is very inconvenient.

Would it be possible to add metadata properties to the binary FDT 
format, which would identify other property cells that are in fact 
phandles? It could be a per-node property or a single root node 
property, up to you guys. DTC would then automatically generate the 
metadata property along with the phandle property when compiling the DTS.

--
Cyril
