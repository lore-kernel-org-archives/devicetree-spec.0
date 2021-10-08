From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Describe "fail" status for /cpus/cpu* nodes
Date: Fri, 8 Oct 2021 08:19:04 -0500
Message-ID: <CAL_Jsq+b2oiBwWzHP3398GGTh0Od1wgQRhf99EB82edi5Rg=gA@mail.gmail.com>
References: <20210916141028.32058-1-matthias.schiffer@ew.tq-group.com> <9bd436c8c61052ec65e1f9e830c10cd783320822.camel@ew.tq-group.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633699157;
        bh=+JglBXxBnSUVB9GQZsTSuKPQDCB1ekWacRK+pwgemJc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Hp5loLG497ZSdXEaIchGPL9a/PrJaPB8wbSB1neUBZsQTgqo6FXct0Vc/Nw3V2yDX
         GxEoMx8RKJoxxP90rZOq0g2nTFi2aPdqzD9i4fgpE81hqlrI4ZsIv2a6oEUwmRCmYg
         H0VsbsHsfQXK6KcF691RaRzX/rGXBGWvYtbklb7epgZagcmfTmGw+xx2Qd5dxUd2+B
         tvFkk1+UW9ytEZ9qGHoRksdbt6GJGGXiX5Stacpxlmh1B2NlHMi2fNgSwwFDZvyqR6
         CMgLQChileAWVovWJy6wxqEA3W9dnfeCP5KUF9qR567YCZ8OawYUCz8Ju8FVMsLZ20
         7tg5SKe8YMbsA==
In-Reply-To: <9bd436c8c61052ec65e1f9e830c10cd783320822.camel-W3o+9BuWjQaZox4op4iWzw@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Schiffer <matthias.schiffer-W3o+9BuWjQaZox4op4iWzw@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, Oct 8, 2021 at 5:31 AM Matthias Schiffer
<matthias.schiffer-W3o+9BuWjQaZox4op4iWzw@public.gmane.org> wrote:
>
> On Thu, 2021-09-16 at 16:10 +0200, Matthias Schiffer wrote:
> > There are situations where it is desirable to use the same base Device
> > Tree for devices with a different number of CPUs: There may be CPU
> > variants with different numbers of cores that can be used interchangably
> > on the same mainboard, or there are multiple CPU sockets. Not needing to
> > explicitly build a device tree for each such variant can make
> > maintenance significantly easier.
> >
> > For this to work, a system firmware / bootloader needs to adjust the
> > Device Tree by removing or disabling the excess CPU nodes. However, this
> > is currently not easily possible due to the special meaning of the
> > "disabled" status for CPU nodes:
> >
> > - A "disabled" CPU node is interpreted as inactive, but existent. The
> >   Linux kernel will attempt to enable such CPUs on boot, which will
> >   obviously fail for non-existent CPUs
> > - Removing the CPU node altogether from a Device Tree is much more
> >   complex than setting a single property, as it may leave dangling
> >   phandle references, often requiring specific knowledge of other nodes'
> >   structure to deal with them.
> >
> > In the discussion [1] it was suggested to introduce a new status value
> > for CPUs that should really not be used at all. Rob proposed to use the
> > value "fail", which already exists in the generic definitions of the
> > status property.
> >
> > [1] https://www.lkml.org/lkml/2020/8/26/1237
>
> Hi,
> I haven't received any feedback regarding this spec update yet. Should
> I also send a kernel patch that actually implements this behaviour?

Looks fine to me, just hadn't gotten around to applying.

> Do properties described in the spec also need to be documented in the
> kernel's Documentation/devicetree/bindings? It seems that there is no
> generic "cpu" binding documentation at the moment, only arch-specific
> variants.

https://github.com/devicetree-org/dt-schema/blob/main/schemas/cpus.yaml

Rob
