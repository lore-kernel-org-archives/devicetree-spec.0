From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] of: reserved_mem: Try to keep range allocations
 contiguous
Date: Tue, 20 Jun 2023 09:34:53 -0600
Message-ID: <168727528754.3636908.14715947831933925098.robh@kernel.org>
References: <20230510-dt-resv-bottom-up-v2-0-aeb2afc8ac25@gerhold.net>
 <20230510-dt-resv-bottom-up-v2-1-aeb2afc8ac25@gerhold.net>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20230510-dt-resv-bottom-up-v2-1-aeb2afc8ac25-3XONVrnlUWDR7s880joybQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Konrad Dybcio <konrad.dybcio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


On Wed, 14 Jun 2023 21:20:42 +0200, Stephan Gerhold wrote:
> Right now dynamic reserved memory regions are allocated either
> bottom-up or top-down, depending on the memblock setting of the
> architecture. This is fine when the address is arbitrary. However,
> when using "alloc-ranges" the regions are often placed somewhere
> in the middle of (free) RAM, even if the range starts or ends next
> to another (static) reservation.
> 
> Try to detect this situation, and choose explicitly between bottom-up
> or top-down to allocate the memory close to the other reservations:
> 
>   1. If the "alloc-range" starts at the end or inside an existing
>      reservation, use bottom-up.
>   2. If the "alloc-range" ends at the start or inside an existing
>      reservation, use top-down.
>   3. If both or none is the case, keep the current
>      (architecture-specific) behavior.
> 
> There are plenty of edge cases where only a more complex algorithm
> would help, but even this simple approach helps in many cases to keep
> the reserved memory (and therefore also the free memory) contiguous.
> 
> Signed-off-by: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
> ---
>  drivers/of/of_reserved_mem.c | 55 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 

Applied, thanks!

