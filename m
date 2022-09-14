From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 16/21] dt-bindings: reserved-memory: introduce
 designated-movable-block
Date: Wed, 14 Sep 2022 09:55:06 -0500
Message-ID: <20220914145506.GA2149379-robh@kernel.org>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-17-opendmb@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20220913195508.3511038-17-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>, Hari

On Tue, Sep 13, 2022 at 12:55:03PM -0700, Doug Berger wrote:
> Introduce designated-movable-block.yaml to document the
> devicetree binding for Designated Movable Block children of the
> reserved-memory node.

What is a Designated Movable Block? This patch needs to stand on its 
own.

Why does this belong or need to be in DT?

> 
> Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../designated-movable-block.yaml             | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/designated-movable-block.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/designated-movable-block.yaml b/Documentation/devicetree/bindings/reserved-memory/designated-movable-block.yaml
> new file mode 100644
> index 000000000000..42f846069a2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/designated-movable-block.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/designated-movable-block.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: /reserved-memory Designated Movable Block node binding
> +
> +maintainers:
> +  - devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +
> +allOf:
> +  - $ref: "reserved-memory.yaml"
> +
> +properties:
> +  compatible:
> +    const: designated-movable-block
> +    description:
> +      This indicates a region of memory meant to be placed into
> +      ZONE_MOVABLE.

Don't put Linuxisms into bindings.

> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reusable
> +
> +examples:
> +  - |
> +      reserved-memory {
> +          #address-cells = <0x2>;
> +          #size-cells = <0x2>;
> +
> +          DMB0@10800000 {
> +               compatible = "designated-movable-block";
> +               reusable;
> +               reg = <0x0 0x10800000 0x0 0x2d800000>;
> +          };
> +
> +          DMB1@40000000 {
> +               compatible = "designated-movable-block";
> +               reusable;
> +               reg = <0x0 0x40000000 0x0 0x30000000>;
> +          };
> +
> +          DMB2@80000000 {
> +               compatible = "designated-movable-block";
> +               reusable;
> +               reg = <0x0 0x80000000 0x0 0x2fc00000>;
> +          };
> +      };
> -- 
> 2.25.1
> 
> 
