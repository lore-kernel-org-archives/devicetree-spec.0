From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Mon, 24 Jul 2017 09:27:44 -0700
Message-ID: <59762000.7000302@gmail.com>
References: <ok4f5h$qg1$1@blaine.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=quuUH8ydYlPaWspQ6jug0f4/17D+0a3tJZ8NYvNOyAM=;
        b=WJmRGUoFj5DEM9rtmY/ctrHvnFiKsalzV+ytImAiyLEu0BRYyPilrh2DLAjPLAcSyq
         bhQO0cqMh5+zsdjWLqnRiehSzlx4EhqldIs57hYqm+c978/5ND41UnbV/6AbXPw3EFyD
         INXffJ7k1OU3sefSca+T2yRBTSphJxZJgo8QVF+vl5OroAwNSIn7zm43+545EsNT+m6v
         MdxHGytQ/vhbLvG2+jHjVPGSYozLJslmBei+WGYFWqsjTujDn/JA4GhOqbI0DZF9H0mQ
         8O3mieR6CMHHwWeJ0qd5MDhB4g1tsPr34y9nc6lRwkyEoUmar83AydJuCdZdIwpv3jIZ
         hSag==
In-Reply-To: <ok4f5h$qg1$1@blaine.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Cyril,

On 07/11/17 23:15, Cyril Novikov wrote:
> Hi, all!
> 
> The product that I work on supports physical device assignment (aka
> "pass-through") to virtual machines, which means we need to take
> portions of the physical FDT and include them in the guest FDT. This
> needs to happen automatically in software.

Is this for Linux, or some other OS?

If Linux, do you get the FDT from /sys/firmware/fdt or some other
method?

-Frank

> The problem is phandles, because we cannot identify them in the blob
> and therefore can't find any dependent devices/nodes that also need
> to be included in the guest FDT. So the process cannot be fully
> automated. We can't even advise the user what other devices should be
> assigned to the VM. The hypervisor runs or bare metal, so having to
> parse the source DTS files for this is very inconvenient.
> 
> Would it be possible to add metadata properties to the binary FDT
> format, which would identify other property cells that are in fact
> phandles? It could be a per-node property or a single root node
> property, up to you guys. DTC would then automatically generate the
> metadata property along with the phandle property when compiling the
> DTS.
> 
> -- Cyril
> 
> -- To unsubscribe from this list: send the line "unsubscribe
> devicetree-spec" in the body of a message to
> majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html .
> 

