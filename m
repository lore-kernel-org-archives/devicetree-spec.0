From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] dt-bindings: reserved-memory: Add restricted-dma-pool
 constraints
Date: Thu, 24 Feb 2022 16:32:32 -0600
Message-ID: <YhgHgP1x31hVBolM@robh.at.kernel.org>
References: <a4f3d4e2feef008d1236ebc3f5f0c46360f20c60.1645119806.git.robin.murphy@arm.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a4f3d4e2feef008d1236ebc3f5f0c46360f20c60.1645119806.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, 17 Feb 2022 17:47:14 +0000, Robin Murphy wrote:
> The "restricted-dma-pool" definition prohibits combination with either
> of the "no-map" and "reusable" properties, but this is only stated in
> the description text. Add those constraints to the schema so we can
> properly validate them.
> 
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> ---
> 
> v2: Simplify with "properties:...:false" vs. "not:required:..."
> 
>  .../bindings/reserved-memory/shared-dma-pool.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Applied, thanks!
