From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] dt-bindings: reserved-memory: Add
 alloc-{bottom-up,top-down}
Date: Thu, 8 Jun 2023 08:02:56 -0600
Message-ID: <20230608140256.GA2478894-robh@kernel.org>
References: <20230510-dt-resv-bottom-up-v1-0-3bf68873dbed@gerhold.net>
 <20230510-dt-resv-bottom-up-v1-1-3bf68873dbed@gerhold.net>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20230510-dt-resv-bottom-up-v1-1-3bf68873dbed-3XONVrnlUWDR7s880joybQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Conor Dooley <conor+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <andersson-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Konrad Dybcio <konrad.dybcio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, May 15, 2023 at 12:12:16PM +0200, Stephan Gerhold wrote:
> Right now the allocation behavior for dynamic reserved memory is
> implementation-defined. On Linux it is dependent on the architecture.
> This is usually fine if the address is completely arbitrary.
> 
> However, when using "alloc-ranges" it is helpful to allow controlling
> this. That way you can make sure that the reservations are placed next
> to other (static) allocations to keep the free memory contiguous if
> possible.

That should already be possible with all the information you 
already have. IOW, you are looking at all the region and "alloc-ranges" 
addresses to decide top-down or bottom-up. Why can't the kernel do that.

Alternatively, if you really care about the allocation locations, don't 
use dynamic regions.

> 
> Signed-off-by: Stephan Gerhold <stephan-3XONVrnlUWDR7s880joybQ@public.gmane.org>
> ---
>  .../bindings/reserved-memory/reserved-memory.yaml  | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> index c680e397cfd2..56f4bc6137e7 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> @@ -52,6 +52,18 @@ properties:
>        Address and Length pairs. Specifies regions of memory that are
>        acceptable to allocate from.
>  
> +  alloc-bottom-up:
> +    type: boolean
> +    description: >
> +      Specifies that the memory region should be preferably allocated
> +      at the lowest available address within the "alloc-ranges" region.
> +
> +  alloc-top-down:
> +    type: boolean
> +    description: >
> +      Specifies that the memory region should be preferably allocated
> +      at the highest available address within the "alloc-ranges" region.

What happens when both are set?

> +
>    iommu-addresses:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: >
> @@ -93,6 +105,10 @@ properties:
>        system can use that region to store volatile or cached data that
>        can be otherwise regenerated or migrated elsewhere.
>  
> +dependencies:
> +  alloc-bottom-up: [alloc-ranges]
> +  alloc-top-down: [alloc-ranges]
> +
>  allOf:
>    - if:
>        required:
> @@ -178,4 +194,27 @@ examples:
>          };
>        };
>      };
> +
> +  - |
> +    / {
> +      compatible = "foo";
> +      model = "foo";
> +
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      reserved-memory {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ranges;
> +
> +        adsp_mem: adsp {
> +          size = <0x0 0x600000>;
> +          alignment = <0x0 0x100000>;
> +          alloc-ranges = <0x0 0x86800000 0x0 0x10000000>;
> +          alloc-bottom-up;
> +          no-map;
> +        };
> +      };
> +    };
>  ...
> 
> -- 
> 2.40.1
> 
