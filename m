From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 05/52] dt-bindings: Convert Reserved Memory binding to
 a schema
Date: Fri, 3 Sep 2021 13:08:50 -0500
Message-ID: <YTJkshhMXjmYsQl9@robh.at.kernel.org>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-6-maxime@cerno.tech>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-6-maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

On Wed, 01 Sep 2021 11:18:05 +0200, Maxime Ripard wrote:
> The Reserved Memory mechanism is supported by Linux thanks to its device
> tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
> 
> ---
> 
> Changes from v1:
>   - Fixed the license
>   - Added a mention that the file has moved
>   - Added a documentation for memory-region
>   - Split the reserved-memory binding in two: one for the generic part
>     and one for shared-dma-pool
> ---
>  .../reserved-memory/memory-region.yaml        |  40 ++++
>  .../reserved-memory/reserved-memory.txt       | 172 +-----------------
>  .../reserved-memory/reserved-memory.yaml      |  96 ++++++++++
>  .../reserved-memory/shared-dma-pool.yaml      |  87 +++++++++
>  4 files changed, 224 insertions(+), 171 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/memory-region.yaml
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
> 

I reworked the commit msg and a couple of nits, and applied, thanks!
