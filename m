From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] dt-bindings: reserved-memory: Add
 alloc-{bottom-up,top-down}
Date: Tue, 13 Jun 2023 07:33:54 -0600
Message-ID: <20230613133354.GA1750589-robh@kernel.org>
References: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed@gerhold.net>
 <20230510-dt-resv-bottom-up-v1-1-3bf68873dbed@gerhold.net>
 <20230608140256.GA2478894-robh@kernel.org>
 <ZILt0X0uyIyUdxqH@gerhold.net>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ZILt0X0uyIyUdxqH-3XONVrnlUWDR7s880joybQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Konrad Dybcio <konrad.dybcio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, Jun 09, 2023 at 11:16:01AM +0200, Stephan Gerhold wrote:
> Hi Rob,
> 
> Thanks for your suggestions!
> 
> On Thu, Jun 08, 2023 at 08:02:56AM -0600, Rob Herring wrote:
> > On Mon, May 15, 2023 at 12:12:16PM +0200, Stephan Gerhold wrote:
> > > Right now the allocation behavior for dynamic reserved memory is
> > > implementation-defined. On Linux it is dependent on the architecture.
> > > This is usually fine if the address is completely arbitrary.
> > > 
> > > However, when using "alloc-ranges" it is helpful to allow controlling
> > > this. That way you can make sure that the reservations are placed next
> > > to other (static) allocations to keep the free memory contiguous if
> > > possible.
> > 
> > That should already be possible with all the information you 
> > already have. IOW, you are looking at all the region and "alloc-ranges" 
> > addresses to decide top-down or bottom-up. Why can't the kernel do that.
> > 
> 
> Would you accept a patch implementing such a behavior?

Yes.
 
> There are obviously infinitely complicated algorithms possible for the
> allocation. A fairly simple one would be to check if the "alloc-ranges"
> overlap or are adjacent to an already existing reservation, i.e.
> 
>   1. If the "alloc-range" starts at the end or inside an existing
>      reservation, use bottom-up.
>   2. If the "alloc-range" ends at the start or inside an existing
>      reservation, use top-down.
>   3. If both or none is the case, keep current (implementation-defined)
>      behavior.
> 
> For reference, here are some examples how it behaves. |...| is the
> unallocated memory, RRR existing allocations, and each RRR--- line
> below a requested alloc-range (and where it was allocated):
> 
> Bottom-up (rule 1):
>   |.....RRRR................RRRRRRRRR...........|
>             RRR----
>          ---RRR-------
> 
> Top-down (rule 2):
>   |.....RRRR................RRRRRRRRR...........|
>                      ----RRR
>                 ---------RRR------
> 
> Otherwise rule 3 just behaves as currently where either bottom-up
> or top-down is used depending on the implementation/architecture:
>   |.....RRRR................RRRRRRRRR...........|
>                -----RRR
>      or        RRR-----
>           ---------------RRR----
>      or   --RRR-----------------
> 
> There are plenty of edge cases where it doesn't produce the optimal
> result, but it just results in exactly the same behavior as currently
> so it's not any worse (with rule 3):
> 
>   |.....RRRR................RRRRRRRRR...........|
>                           -----------RRR-----
>                  or       ----------------RRR
>                      ---------------------RRR  (no way to handle this
>                  or  RRR---------------------   with top-down/bottom-up)
> 
> > Alternatively, if you really care about the allocation locations, don't 
> > use dynamic regions.
> > 
> 
> Yes, this is the option used at the moment. As outlined in detail in the
> examples of RFC PATCH 4/5 and 5/5 I would like a solution inbetween. The
> exact address doesn't matter but the way (direction) the region is
> filled should preferably stay the same.
> 
> > > 
> > > Signed-off-by: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
> > > ---
> > >  .../bindings/reserved-memory/reserved-memory.yaml  | 39 ++++++++++++++++++++++
> > >  1 file changed, 39 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> > > index c680e397cfd2..56f4bc6137e7 100644
> > > --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> > > +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> > > @@ -52,6 +52,18 @@ properties:
> > >        Address and Length pairs. Specifies regions of memory that are
> > >        acceptable to allocate from.
> > >  
> > > +  alloc-bottom-up:
> > > +    type: boolean
> > > +    description: >
> > > +      Specifies that the memory region should be preferably allocated
> > > +      at the lowest available address within the "alloc-ranges" region.
> > > +
> > > +  alloc-top-down:
> > > +    type: boolean
> > > +    description: >
> > > +      Specifies that the memory region should be preferably allocated
> > > +      at the highest available address within the "alloc-ranges" region.
> > 
> > What happens when both are set?
> > 
> 
> They are not meant to be both set. I should have added an if statement
> for this, sorry about that.

Ideally, you define the properties in a way to avoid that situation 
rather than relying on schema checks. For example, a single property 
with values defined for top-down and bottom-up.

Rob
