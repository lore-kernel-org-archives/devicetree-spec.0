From: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Fri, 21 Jul 2017 21:24:35 -0700
Message-ID: <okukd4$i1o$1@blaine.gmane.org>
References: <ok4f5h$qg1$1@blaine.gmane.org>
 <20170714105856.GB16128@leverpostej> <okjplq$7kf$1@blaine.gmane.org>
 <20170719034029.GT3140@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170719034029.GT3140-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 7/18/2017 8:40 PM, David Gibson wrote:

> Well, I don't want to invent a new encoding if we can possibly avoid
> it.  The current encoding used for overlay generation looks like this
> 
> / {
> 	target: node@0 {
> 	};
> 	node@1 {
> 		ref = <&target>;
> 	};
> 	__local_fixups__ = {
> 		node@1 {
> 			ref = <0>;
> 		};
> 	};
> };
> 
> Basically, __local_fixups__  has a subtree which paralells the main
> tree.  Each property found under __local_fixups__ is a list of offsets
> at which phandle references appear in the corresponding property in
> the main tree.
> 
> That seems like it would survive most likely bootloader
> transformations as well, I think.
> 
>> Even if they do, like I said in my reply to David, we don't strive to
>> achieve a full automation, so it's probably tolerable. Oh well, we've missed
>> some dependencies. It's still better than what we have now.
> 
> Ok.  I'm tentatively convinced that it's worth adding a switch to dtc
> to generate __local_fixups__even for a non-plugin source.
> 
> Next step is for someone to propose a concrete patch.

Do you mean a patch to the DTC utility or a patch to the Devicetree 
Specification? I suppose we want this specced, so that alternative 
incompatible implementations do not appear? The engineer looking at it 
told me it's only a few lines change for the DTC.
