From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: Add io-tlb-segsize property for restricted-dma-pool
Date: Tue, 23 Nov 2021 09:34:29 -0700
Message-ID: <1637685269.659918.3442911.nullmailer@robh.at.kernel.org>
References: <20211123112104.3530135-1-hsinyi@chromium.org> <20211123112104.3530135-3-hsinyi@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211123112104.3530135-3-hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hsin-Yi Wang <hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, - <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, senozhatsky-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org

On Tue, 23 Nov 2021 19:21:03 +0800, Hsin-Yi Wang wrote:
> Add a io-tlb-segsize property that each restricted-dma-pool can set its
> own io_tlb_segsize since some use cases require slabs larger than default
> value (128).
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  .../bindings/reserved-memory/shared-dma-pool.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml: properties:io-tlb-segsize:type: 'anyOf' conditional failed, one must be fixed:
	'u32' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'u32' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml: properties:io-tlb-segsize:type: 'u32' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml: ignoring, error in schema: properties: io-tlb-segsize: type
warning: no schema found in file: ./Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
Documentation/devicetree/bindings/display/msm/gpu.example.dt.yaml:0:0: /example-1/reserved-memory/gpu@8f200000: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.example.dt.yaml:0:0: /example-0/reserved-memory/linux,cma: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.example.dt.yaml:0:0: /example-0/reserved-memory/restricted-dma-pool@50000000: failed to match any schema with compatible: ['restricted-dma-pool']
Documentation/devicetree/bindings/dsp/fsl,dsp.example.dt.yaml:0:0: /example-1/vdev0buffer@94300000: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.example.dt.yaml:0:0: /example-0/reserved-memory/dsp-memory@98000000: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.example.dt.yaml:0:0: /example-1/reserved-memory/ipu-memory@95800000: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.example.dt.yaml:0:0: /example-2/reserved-memory/dsp1-memory@99000000: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/sound/google,cros-ec-codec.example.dt.yaml:0:0: /example-0/reserved-mem@52800000: failed to match any schema with compatible: ['shared-dma-pool']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1558503

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

