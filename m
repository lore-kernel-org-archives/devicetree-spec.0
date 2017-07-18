From: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Mon, 17 Jul 2017 18:47:07 -0700
Message-ID: <okjplq$7kf$1@blaine.gmane.org>
References: <ok4f5h$qg1$1@blaine.gmane.org>
 <20170714105856.GB16128@leverpostej>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170714105856.GB16128@leverpostej>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 7/14/2017 3:58 AM, Mark Rutland wrote:

>> Would it be possible to add metadata properties to the binary FDT
>> format, which would identify other property cells that are in fact
>> phandles? It could be a per-node property or a single root node
>> property, up to you guys. DTC would then automatically generate the
>> metadata property along with the phandle property when compiling the
>> DTS.
> 
> Unfortunately, even ignoring the above, this metadata isn't likely to be
> reliable, as after compilation, other agents (e.g. the bootloader) may
> modify the FDT, without updating the metadata that they are not aware
> of.

Well, it depends on the design of said metadata. For example, imagine a 
node property named ".dependencies", which simply lists all phandles 
referenced by other properties in the same node. I would be very 
surprised if the bootloader does something that breaks that. It would 
require a major intervention into the FDT.

Even if they do, like I said in my reply to David, we don't strive to 
achieve a full automation, so it's probably tolerable. Oh well, we've 
missed some dependencies. It's still better than what we have now.

--
Cyril
