From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Memory aliasing and nodes
Date: Thu, 21 Apr 2022 14:54:48 +0200
Message-ID: <CAK8P3a3AjEbFE1D-n4Q53_UjBwRk3D-XdaaEqVJs3QOWLHOeqg@mail.gmail.com>
References: <CAGi-RUL4FJBXYUMbpdMo=XNd7DE1wD6aUqXUt5Y+5BY1KO-FYg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGi-RUL4FJBXYUMbpdMo=XNd7DE1wD6aUqXUt5Y+5BY1KO-FYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ramon Fried <rfried.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Apr 21, 2022 at 12:33 PM Ramon Fried <rfried.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hi all,
> This is the second time in my career that I've stumbled upon a SOC
> which has 32bit memory aliasing for high memory for the usage of
> drivers that can only address 32bit address space.
>
> Basically, a subset of a memory higher than 4GB can be accessed also
> through a range in the low 4GB addresses.
>
> I didn't see any support for this neither Linux kernel nor in device
> tree. I'm wondering if you considered adding a way to describe such
> addressing in the device tree, and maybe later Linux can add support
> for it.

I think we have some of those already, notably the TI Keystone platform,
which only lists one of the two areas in the DT.

It probably does not matter which one it is, but it may help to have
at least some memory in the lower address range.

In either case, make sure to add the correct dma-ranges properties to
describe which memory is visible to which devices at a given address.

       Arnd
