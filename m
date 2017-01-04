From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH] Describe interrupts-extended property
Date: Wed, 04 Jan 2017 03:03:03 +0200
Message-ID: <7729185.EsL4Kmsiv2@avalon>
References: <20170103192423.5838-1-f.fainelli@gmail.com> <20170104003147.GW12761@umbus.fritz.box> <0d9b43f1-147c-5761-9fdd-8ba28c690df9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1483491755;
        bh=0rvHhABNULJTUaAkIjz5ch7s3MmxR9oDXKlTioJF1mc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=awdh7pKTLi9Bept/PsPuZs5QjYH8RDo7CZjdd/f/GhQF2PteczU9HhqqXtHFh5Xvr
         czw/ar9ZX8kCERFkIZMuhmzpIdjt5xgb2GYOKZ7Viztm05ghXWqDJOHdF4+JY/KOI5
         yyZ5BQ7sHlM61u3P4Mk4x5AoZg0CANCJQ70e4LLs=
In-Reply-To: <0d9b43f1-147c-5761-9fdd-8ba28c690df9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Hi Florian,

On Tuesday 03 Jan 2017 16:47:03 Florian Fainelli wrote:
> On 01/03/2017 04:31 PM, David Gibson wrote:
> > On Tue, Jan 03, 2017 at 03:44:28PM -0800, Florian Fainelli wrote:

[snip]

> >> Digression: I was actually wondering if we may not have a need to do the
> >> same thing for "reg" properties, where a given device may have memory
> >> mapped I/O registers in one place, and another address in another bus,
> >> with a different address space, this is actually pretty common for e.g:
> >> PHY (Ethernet, PCIe, SATA or USB).
> > 
> > I've wondered about something like that for some time (my working name
> > was 'bus-reg').  The use cases I encountered were on PPC4xx machines
> > which had lots of things controlled (at least partially) by the
> > sideband "DCR" (Device Control Register) bus.  We did invent a
> > 'dcr-reg' property to cover that specific case, and I think something
> > similar has been done for some other sideband busses.  Something like
> > 'bus-reg' would be a more general solution to the problem.
> 
> Seems to me like syscon is pretty much what was invented in Linux to
> support that use case.
> 
> > I believe the "classic" IEEE1275 way of solving this is to have
> > separate nodes on each of the relevant busses, with phandle pointers
> > linking them together.  The relevant driver would claim all the
> > related nodes.  Again, it gets pretty messy, though.
> 
> Yes still pretty ugly.
> 
> Device Tree tends to list resources as properties of the node that
> consumes them, which is fine, although it can lead to duplicate values
> in a given DTB, but one could also imagine, say listing all register
> resources as properties of the bus that decodes these addresses, and
> then having child nodes of that bus node reference via phandle their
> relevant "reg" cells. Something like this for instance:
> 
> bus@deadbeef {
> 	reg = <0x10000000 0x100>, //UART 0
> 		<0x10000100 0x100> //UART 1
> 
> 	uart@100 {
> 		compatible = "acme,uart";
> 		reg = <&bus 0>;
> 	};
> };
> 
> You get the idea ;)

/me shivers :-)

The problem you've raised comes down in my opinion to the fact that a tree 
simply can't represent a topology that isn't tree-like. The device tree more 
or less lays down nodes from the point of view of control buses. As soon as 
your device sits on multiple buses the device tree can't represent it 
accurately. So far this hasn't really been an issue (probably thank to the 
occasional hack), but with devices becoming more and more complex I wouldn't 
be surprised if we had to really tackle this problem in the not too distant 
future. A nasty example that comes to my mind is an SoC with two clusters of 
CPU of different architectures (namely ARM and SH) where some peripheral are 
accessible to both the ARM and SH side, but mapped at different addresses. So 
far we've only described the ARM view of the system, but wouldn't it be lovely 
to have a single DT that can cover both ? :-)

-- 
Regards,

Laurent Pinchart
