From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Memory aliasing and nodes
Date: Thu, 21 Apr 2022 22:15:46 +0200
Message-ID: <CAK8P3a2KGkH0Sf7fzWBAByTRnSXSy_u22=_s6Y7WLhrWNvJuyQ@mail.gmail.com>
References: <CAGi-RUL4FJBXYUMbpdMo=XNd7DE1wD6aUqXUt5Y+5BY1KO-FYg@mail.gmail.com>
 <CAK8P3a3AjEbFE1D-n4Q53_UjBwRk3D-XdaaEqVJs3QOWLHOeqg@mail.gmail.com>
 <CAGi-RUJ5rn5Zn_rv6JX4XhGSfxUw_QcWe=M80ET5sYbi11e7GA@mail.gmail.com> <CAL_JsqLXRcQa_h8JiUWHK=Gph=vvMvmsbq4OACLKT==iPgaYqg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLXRcQa_h8JiUWHK=Gph=vvMvmsbq4OACLKT==iPgaYqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ramon Fried <rfried.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Apr 21, 2022 at 9:28 PM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Thu, Apr 21, 2022 at 12:25 PM Ramon Fried <rfried.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > On Thu, Apr 21, 2022 at 3:55 PM Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > >
> > > On Thu, Apr 21, 2022 at 12:33 PM Ramon Fried <rfried.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > >
> > > > Hi all,
> > > > This is the second time in my career that I've stumbled upon a SOC
> > > > which has 32bit memory aliasing for high memory for the usage of
> > > > drivers that can only address 32bit address space.
> > > >
> > > > Basically, a subset of a memory higher than 4GB can be accessed also
> > > > through a range in the low 4GB addresses.
> > > >
> > > > I didn't see any support for this neither Linux kernel nor in device
> > > > tree. I'm wondering if you considered adding a way to describe such
> > > > addressing in the device tree, and maybe later Linux can add support
> > > > for it.
> > >
> > > I think we have some of those already, notably the TI Keystone platform,
> > > which only lists one of the two areas in the DT.
> > >
> > > It probably does not matter which one it is, but it may help to have
> > > at least some memory in the lower address range.
> > >
> > > In either case, make sure to add the correct dma-ranges properties to
> > > describe which memory is visible to which devices at a given address.
> > >
> > What you suggest will of course work, and this is how I planned to implement it.
> > The problem, IMO, is that the addressing of the SOC it's not obvious
> > from the device tree.
> > My understanding is that device-tree should describe the hardware, it
> > just looks like a workaround to me.
>
> The h/w has some translation from one address to another and that's
> exactly what 'dma-ranges' is for. How is that not describing the h/w?

I think he was just referring to the memory nodes that don't let you
describe how the same physical memory appears at two addresses.

I don't think it's a big deal though, as memory nodes are somewhat
special to start with, and the problem is more with the hardware
being badly designed than the dt failing to describe it.

     Arnd
