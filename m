From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Describe "fail" status for /cpus/cpu* nodes
Date: Tue, 30 Nov 2021 11:01:43 -0600
Message-ID: <CAL_JsqJ6eHjeRX8wpaw4YOwrCce6OLeujXHmbUTqhcrawGfD0g@mail.gmail.com>
References: <20210916141028.32058-1-matthias.schiffer@ew.tq-group.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638291717;
        bh=NfdZlw202pD8xya/F6BJWP/mB2dt3IS27a3L8tUYYl0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=A+DtShrtVjnUuFbz/GR6Cii8gTG2fh9AddUe3SCSWoLiOFcUWusmpAUrfc5W+cb6c
         SDfyiSPpJwrq7MjNz8yAqnSdz3pQa1Xc/ZRt/0AjipklvrS/rHDJTGgK5gweOfFHMv
         iDp6kkxttazVZmIeEKgp1CbtdZmCYujPWbqIxU9xQC+LXJw5Vyexu1j1aapRBMQ9Q9
         czgxoSObRF83eTIbIj9lmIZc3MEjBYoLBQUpZ+dhpHT5VtcHbWQPeZoJ89++Vd10I7
         FybZVcbQzBOLQsbTlNGHOVYHqFFyKVjzpTKSQvJ4/CaBmqkOdPysbDKla78sa4YgOs
         9VTzaxQfF6Ueg==
In-Reply-To: <20210916141028.32058-1-matthias.schiffer-W3o+9BuWjQaZox4op4iWzw@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Schiffer <matthias.schiffer-W3o+9BuWjQaZox4op4iWzw@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Thu, Sep 16, 2021 at 9:10 AM Matthias Schiffer
<matthias.schiffer-W3o+9BuWjQaZox4op4iWzw@public.gmane.org> wrote:
>
> There are situations where it is desirable to use the same base Device
> Tree for devices with a different number of CPUs: There may be CPU
> variants with different numbers of cores that can be used interchangably
> on the same mainboard, or there are multiple CPU sockets. Not needing to
> explicitly build a device tree for each such variant can make
> maintenance significantly easier.
>
> For this to work, a system firmware / bootloader needs to adjust the
> Device Tree by removing or disabling the excess CPU nodes. However, this
> is currently not easily possible due to the special meaning of the
> "disabled" status for CPU nodes:
>
> - A "disabled" CPU node is interpreted as inactive, but existent. The
>   Linux kernel will attempt to enable such CPUs on boot, which will
>   obviously fail for non-existent CPUs
> - Removing the CPU node altogether from a Device Tree is much more
>   complex than setting a single property, as it may leave dangling
>   phandle references, often requiring specific knowledge of other nodes'
>   structure to deal with them.
>
> In the discussion [1] it was suggested to introduce a new status value
> for CPUs that should really not be used at all. Rob proposed to use the
> value "fail", which already exists in the generic definitions of the
> status property.
>
> [1] https://www.lkml.org/lkml/2020/8/26/1237
>
> Suggested-by: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Matthias Schiffer <matthias.schiffer-W3o+9BuWjQaZox4op4iWzw@public.gmane.org>
> ---
>  source/chapter3-devicenodes.rst | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Applied, thanks.

Rob
