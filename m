From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/54] dt-bindings: Convert Reserved Memory binding to a schema
Date: Wed, 21 Jul 2021 20:09:56 -0600
Message-ID: <1626919796.941622.3145320.nullmailer@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech> <20210721140424.725744-6-maxime@cerno.tech>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210721140424.725744-6-maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

On Wed, 21 Jul 2021 16:03:35 +0200, Maxime Ripard wrote:
> The Reserved Memory mechanism is supported by Linux thanks to its device
> tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
> ---
>  .../reserved-memory/reserved-memory.txt       | 141 ---------------
>  .../reserved-memory/reserved-memory.yaml      | 167 ++++++++++++++++++
>  2 files changed, 167 insertions(+), 141 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/nvmem/rmem.example.dt.yaml: reserved-memory: nvram@10000000:compatible: 'oneOf' conditional failed, one must be fixed:
	['raspberrypi,bootloader-config', 'nvmem-rmem'] is too long
	Additional items are not allowed ('nvmem-rmem' was unexpected)
	'shared-dma-pool' was expected
	'mediatek,trustzone-bootinfo' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.example.dt.yaml: reserved-memory: emc-table@83400000:compatible: 'oneOf' conditional failed, one must be fixed:
	'shared-dma-pool' was expected
	'mediatek,trustzone-bootinfo' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
\ndoc reference errors (make refcheckdocs):
Documentation/devicetree/bindings/display/arm,hdlcd.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/display/arm,komeda.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/display/arm,malidp.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/display/arm,pl11x.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/gpu/aspeed-gfx.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/media/aspeed-video.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/media/mediatek-vpu.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
arch/arm/mm/dma-mapping-nommu.c: Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt

See https://patchwork.ozlabs.org/patch/1508249

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

