From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Fri, 14 Jul 2017 11:58:56 +0100
Message-ID: <20170714105856.GB16128@leverpostej>
References: <ok4f5h$qg1$1@blaine.gmane.org>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ok4f5h$qg1$1@blaine.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Jul 11, 2017 at 11:15:55PM -0700, Cyril Novikov wrote:
> Hi, all!

Hi,

> The product that I work on supports physical device assignment (aka
> "pass-through") to virtual machines, which means we need to take
> portions of the physical FDT and include them in the guest FDT. This
> needs to happen automatically in software.
>
> The problem is phandles, because we cannot identify them in the blob
> and therefore can't find any dependent devices/nodes that also need
> to be included in the guest FDT. So the process cannot be fully
> automated. We can't even advise the user what other devices should
> be assigned to the VM. The hypervisor runs or bare metal, so having
> to parse the source DTS files for this is very inconvenient.

This has come up before in similar contexts (e.g. Xen platform device
pass-through). The simple answer is that this cannot be fully automated
unless your hypervisor has knowledge of all relevant bindings, such that
if can parse the FDT and make decisions based on this.

For better or worse the simple answer is that if a HV wants to assign
portions of HW to a guest, then the HV has to have an understanding of
that HW (and that HW's DT binding), or it has to trust some other agent
to configure things appropriately (setting up Stage-2 mappings,
providing a filtered FDT).

For example, you might have:

	clk: clock-controller {
		comptible = "vendor,clock-controller";
		...
		#clock-cells = <1>;
	};

	dev: device {
		compatible = "vendor,device";
		...
		clocks = <&clk 17>;
	};

... and you might want to pass dev through to a guest. You *cannot*
simply/safely add clk to that guest's DT (even with any stage-2 mappings
set up), since clk might (implicitly) feed other devices in the system,
and the guest might turn those clocks off, bringing down other guests,
or the hypervisor.

There are also cases like:

	singleton: some-singleton-device {
		...
	};

	dev: device {
		/* implicitly depends on singleton, but has no phandle */
	};

... for which it is necessary to have intimate knowledge of the dev
binding.

> Would it be possible to add metadata properties to the binary FDT
> format, which would identify other property cells that are in fact
> phandles? It could be a per-node property or a single root node
> property, up to you guys. DTC would then automatically generate the
> metadata property along with the phandle property when compiling the
> DTS.

Unfortunately, even ignoring the above, this metadata isn't likely to be
reliable, as after compilation, other agents (e.g. the bootloader) may
modify the FDT, without updating the metadata that they are not aware
of.

So either this would need to be a major (incompatible) change to the
format, or it would be necessary to have some mechanism to detect that
case, which leaves you at today's situation.

Thanks,
Mark.
