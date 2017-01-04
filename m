From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH] Describe interrupts-extended property
Date: Wed, 04 Jan 2017 03:28:05 +0200
Message-ID: <1665775.WCU4pXZEJj@avalon>
References: <20170103192423.5838-1-f.fainelli@gmail.com> <7729185.EsL4Kmsiv2@avalon> <663f501c-4646-8f15-cb90-0477ceff3daf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1483493256;
        bh=iI7WQVPtC0pBApGS7OuBQNKrUA8tRUNusv21InOj0dE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FQa/kyPJ+/XqMFTN2TR4w279RsVnTnbLaKr8Du2USBnojiZr4eUnBLb8VW3/m/L41
         XBy6YCzdzk21ixE/qdvgpuI5f/mA6Iol8WBqLxokQZDx/b+ncfvJmfTgExvMCyPWj4
         apdB7+fCTWyq6WD+Bk4MFW0WvPE0naGSBxofB/kk=
In-Reply-To: <663f501c-4646-8f15-cb90-0477ceff3daf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Hi Florian,

On Tuesday 03 Jan 2017 17:19:29 Florian Fainelli wrote:
> On 01/03/2017 05:03 PM, Laurent Pinchart wrote:
> > On Tuesday 03 Jan 2017 16:47:03 Florian Fainelli wrote:
> >> On 01/03/2017 04:31 PM, David Gibson wrote:
> >>> On Tue, Jan 03, 2017 at 03:44:28PM -0800, Florian Fainelli wrote:
> > 
> > [snip]
> > 
> >>>> Digression: I was actually wondering if we may not have a need to do
> >>>> the same thing for "reg" properties, where a given device may have
> >>>> memory mapped I/O registers in one place, and another address in
> >>>> another bus, with a different address space, this is actually pretty
> >>>> common for e.g: PHY (Ethernet, PCIe, SATA or USB).
> >>> 
> >>> I've wondered about something like that for some time (my working name
> >>> was 'bus-reg').  The use cases I encountered were on PPC4xx machines
> >>> which had lots of things controlled (at least partially) by the
> >>> sideband "DCR" (Device Control Register) bus.  We did invent a
> >>> 'dcr-reg' property to cover that specific case, and I think something
> >>> similar has been done for some other sideband busses.  Something like
> >>> 'bus-reg' would be a more general solution to the problem.
> >> 
> >> Seems to me like syscon is pretty much what was invented in Linux to
> >> support that use case.
> >> 
> >>> I believe the "classic" IEEE1275 way of solving this is to have
> >>> separate nodes on each of the relevant busses, with phandle pointers
> >>> linking them together.  The relevant driver would claim all the
> >>> related nodes.  Again, it gets pretty messy, though.
> >> 
> >> Yes still pretty ugly.
> >> 
> >> Device Tree tends to list resources as properties of the node that
> >> consumes them, which is fine, although it can lead to duplicate values
> >> in a given DTB, but one could also imagine, say listing all register
> >> resources as properties of the bus that decodes these addresses, and
> >> then having child nodes of that bus node reference via phandle their
> >> relevant "reg" cells. Something like this for instance:
> >> 
> >> bus@deadbeef {
> >> 	reg = <0x10000000 0x100>, //UART 0
> >> 		<0x10000100 0x100> //UART 1
> >> 	uart@100 {
> >> 		compatible = "acme,uart";
> >> 		reg = <&bus 0>;
> >> 	};
> >> };
> >> 
> >> You get the idea ;)
> > 
> > /me shivers :-)
> > 
> > The problem you've raised comes down in my opinion to the fact that a tree
> > simply can't represent a topology that isn't tree-like. The device tree
> > more or less lays down nodes from the point of view of control buses. As
> > soon as your device sits on multiple buses the device tree can't
> > represent it accurately.
> 
> I partially agree with that statement, the accurately part is what I
> disagree with, you can represent it with some accuracy, just not
> necessarily using standard properties, you may have to cook your own,
> meaning the standard somehow failed to cover that part.

Of course, I meant using standard properties, or rather the DT core node 
model. We now have bindings (named OF graph) that can represent a graph of 
connected nodes using phandles.

> The other part, is that with a tree, you may have some repetition and
> multiple references, which is far from ideal.
> 
> > So far this hasn't really been an issue (probably thank to the
> > occasional hack), but with devices becoming more and more complex I
> > wouldn't be surprised if we had to really tackle this problem in the not
> > too distant future. A nasty example that comes to my mind is an SoC with
> > two clusters of CPU of different architectures (namely ARM and SH) where
> > some peripheral are accessible to both the ARM and SH side, but mapped at
> > different addresses. So far we've only described the ARM view of the
> > system, but wouldn't it be lovely to have a single DT that can cover both
> > ? :-)
> 
> An argument could be made that your cluster is most likely not running
> the same instance of the operating system (although there has been
> research on that done before, not sure where that stands in real life?)

In all practical use cases, yes, they would be running separate OS instances 
(of either the same or different OSes).

> so while having a single blob would be nice, you most likely, for all
> practical reasons, would duplicate what is necessary (which should be
> reasonably easy with scripting/separate sources and include files) and
> provide separate blobs to each OS instance?

Sure, I'm not blocked here, it was more of a theoretical example, not 
something for which I'm in need of a solution.

Another possibly more useful class of examples is related to multi-master 
buses. For instance, the existing DT bindings can't represent an I2C bus that 
has two masters inside the SoC, as I2C slaves have to be children of the I2C 
bus master. Similarly we don't really have a good way to represent multi-
master I2S buses.

-- 
Regards,

Laurent Pinchart
