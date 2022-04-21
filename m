From: Ramon Fried <rfried.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Memory aliasing and nodes
Date: Thu, 21 Apr 2022 20:24:44 +0300
Message-ID: <CAGi-RUJ5rn5Zn_rv6JX4XhGSfxUw_QcWe=M80ET5sYbi11e7GA@mail.gmail.com>
References: <CAGi-RUL4FJBXYUMbpdMo=XNd7DE1wD6aUqXUt5Y+5BY1KO-FYg@mail.gmail.com>
 <CAK8P3a3AjEbFE1D-n4Q53_UjBwRk3D-XdaaEqVJs3QOWLHOeqg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAXykJMdidrsaIRhH0Dd5CmElm3TYJ892pwUDkE4PZc=;
        b=kIRnXa7tpdk/1LEji8Y7iwrMz1tXw9l15CEfecRrFAyuj/PcU261sEJ0m7sUFx7/RF
         ZVzUvMg9ZOeLoXG7/MGpuaL9FGmHy9sWYfXtwGSucyDXL9+km9yT2OjBaGbeUKrS9Zxt
         PRI+qSpEReCe47c95AjgwUw2eLOtQlQJizhwbjL7WDImq12HAb5cPyDOfaQURr7Wfxcd
         OtyYxDix2HE8iMiybsc4/WGbv9dLp04YmhG/GwPaJwuzqkkOaNyhXO+fOvMfqvk0GG71
         Lzj3c9jauIgbvsoLg7SQj0mfVElqw/saXW9+3cGLw2jeseui5KMlspgKZMPJjSygEytA
         lUXA==
In-Reply-To: <CAK8P3a3AjEbFE1D-n4Q53_UjBwRk3D-XdaaEqVJs3QOWLHOeqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Apr 21, 2022 at 3:55 PM Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>
> On Thu, Apr 21, 2022 at 12:33 PM Ramon Fried <rfried.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > Hi all,
> > This is the second time in my career that I've stumbled upon a SOC
> > which has 32bit memory aliasing for high memory for the usage of
> > drivers that can only address 32bit address space.
> >
> > Basically, a subset of a memory higher than 4GB can be accessed also
> > through a range in the low 4GB addresses.
> >
> > I didn't see any support for this neither Linux kernel nor in device
> > tree. I'm wondering if you considered adding a way to describe such
> > addressing in the device tree, and maybe later Linux can add support
> > for it.
>
> I think we have some of those already, notably the TI Keystone platform,
> which only lists one of the two areas in the DT.
>
> It probably does not matter which one it is, but it may help to have
> at least some memory in the lower address range.
>
> In either case, make sure to add the correct dma-ranges properties to
> describe which memory is visible to which devices at a given address.
>
>        Arnd
Hi Arnd.
What you suggest will of course work, and this is how I planned to implement it.
The problem, IMO, is that the addressing of the SOC it's not obvious
from the device tree.
My understanding is that device-tree should describe the hardware, it
just looks like a workaround to me.
Thanks,
Ramon.
