From: Matthias Schiffer <matthias.schiffer-W3o+9BuWjQaZox4op4iWzw@public.gmane.org>
Subject: Re: [PATCH] Describe "fail" status for /cpus/cpu* nodes
Date: Fri, 08 Oct 2021 12:31:42 +0200
Message-ID: <9bd436c8c61052ec65e1f9e830c10cd783320822.camel@ew.tq-group.com>
References: <20210916141028.32058-1-matthias.schiffer@ew.tq-group.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1633689106; x=1665225106;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OQsOCFAf1VI+MVlRk/ttVTRBQrlU7PWa9of/jwJvxXE=;
  b=W2K1Xq13HbV4REt6qC2LdtJt3nS3Ioqgni9IieP2ZhNn/h47mWoWpKsz
   fOBuxnfygbmCJjlqV7Y2pBdoB3d8y7G51T3nFXJE8OMvZocOZSHO8z5Fi
   5t6/k9hP/9COsaLfCSlC2+TkuLPV3r0YjlwZ7JiGiKHasgkKmuVW+EcHJ
   zh5/vNZVCjsJ8aW8f2Lzaj8A6d1JrUdGM3Fiwaomh3jPfVlUztjeQW4L3
   WuHGEjW/WLAqtDM+D4w8c/YBitQah9vNqHxMmGpZSExrTQF/rLY9Yh6LG
   9Xq5UKubaS49OesB2BObZQ9OlNIRvOF6pxQHuwYuKdxAULlr1XFZl2ouj
   w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1633689104; x=1665225104;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OQsOCFAf1VI+MVlRk/ttVTRBQrlU7PWa9of/jwJvxXE=;
  b=DU0QYhqZ5/ELDkJORJZMaSiFJMbFEWQi0PkAbrZQqVfaED6uZUDMu5zU
   c9IgSjluvGTvh5GYMWh1fQvCFo2GRckfxaha/GqTsADmgBbnibiNpZWmE
   /6vlXzuNP/w9DvoPGU44D745q0ZbhPSTrvE/aXGBSwA4ejMx/ki/u/DAE
   4V4WqUd7lGAQYfi6hYGjfGWLIfCH0ayeehQ0lY/4Z3fWF/dWTuyFqkSLO
   JshfacJ/sd3PP028QCK0Od1/Cf1Y82ehTGeIaif5IOoquZkcEoDZezkUG
   PilZlqScjqb7Vk+ZbS8iM5DAobD66HvGb1IhDUogU9qtg/wF2J6EQLO/7
   g==;
In-Reply-To: <20210916141028.32058-1-matthias.schiffer-W3o+9BuWjQaZox4op4iWzw@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, 2021-09-16 at 16:10 +0200, Matthias Schiffer wrote:
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

Hi,
I haven't received any feedback regarding this spec update yet. Should
I also send a kernel patch that actually implements this behaviour?

Do properties described in the spec also need to be documented in the
kernel's Documentation/devicetree/bindings? It seems that there is no
generic "cpu" binding documentation at the moment, only arch-specific
variants.



> 
> Suggested-by: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Matthias Schiffer <matthias.schiffer-W3o+9BuWjQaZox4op4iWzw@public.gmane.org>
> ---
>  source/chapter3-devicenodes.rst | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenodes.rst
> index 1cea148..9d8ef6e 100644
> --- a/source/chapter3-devicenodes.rst
> +++ b/source/chapter3-devicenodes.rst
> @@ -614,8 +614,8 @@ standard properties with specific applicable detail.
>                                                     CPU. This property shall be present for nodes
>                                                     representing CPUs in a symmetric
>                                                     multiprocessing (SMP) configuration. For a CPU
> -                                                   node the meaning of the ``"okay"`` and
> -                                                   ``"disabled"`` values are as follows:
> +                                                   node the meaning of the ``"okay"``, ``"disabled"``
> +                                                   and ``"fail"`` values are as follows:
>  
>                                                     ``"okay"`` :
>                                                        The CPU is running.
> @@ -623,6 +623,9 @@ standard properties with specific applicable detail.
>                                                     ``"disabled"`` :
>                                                        The CPU is in a quiescent state.
>  
> +                                                   ``"fail"`` :
> +                                                      The CPU is not operational or does not exist.
> +
>                                                     A quiescent CPU is in a state where it cannot
>                                                     interfere with the normal operation of other
>                                                     CPUs, nor can its state be affected by the
> @@ -639,6 +642,11 @@ standard properties with specific applicable detail.
>                                                     loop, held in reset, and electrically isolated
>                                                     from the system bus or in another
>                                                     implementation dependent state.
> +
> +                                                   A CPU with ``"fail"`` status does not affect the
> +                                                   system in any way.
> +                                                   The status is assigned to nodes for which no
> +                                                   corresponding CPU exists.
>     ``enable-method``      | SD  | ``<stringlist>`` Describes the method by which a CPU in a
>                                                     disabled state is enabled. This property is
>                                                     required for CPUs with a status property with

