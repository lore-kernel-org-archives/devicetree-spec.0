From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: dt_binding_check not reporting all errors
Date: Mon, 24 Apr 2023 12:22:03 -0500
Message-ID: <CAL_JsqJcJsjnao0FGzx7e-vxYnUGC6S3_GRORq1KyDQzqX-3hw@mail.gmail.com>
References: <77db7543-cae4-695c-7c86-6562534d4e87@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682356936;
        bh=vRchxoGONDLsdQXu3pWOn9hJRU+8zz+VSgEx5ZwQp3g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qjklnqkXoT2ZNMNl+YOmm7W2dOpTmZhHQifisVddeku4if4b+q0nuxmU2eixDQqlA
         xC0w/hYh5XYEdInVTnCXoifwOxAMrPvM6f9v1JLGxbzxQW1TJw9pg1HWzn8QjUBqOQ
         bvTMqxX5m823PYYOFEF6fO6UHhrCyAD5omaDDSzH7tccnRL46MyhmMHY6gZGcHcCGF
         4bNxsKqD/AfckwFLKyHFYJeJAx8HKyjEMir4mwNVZgtHu8IKzGNfi/R8rB87O5Qywc
         iqCCg6Hp6xTtzuQFywifRZqsIBFGPXt8+dLBawm182frgi5qQoEAujehaKky9AHzEg
         bEM5Qjy09L5iQ==
In-Reply-To: <77db7543-cae4-695c-7c86-6562534d4e87-5C7GfCeVMHo@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Michal Simek <michal.simek-5C7GfCeVMHo@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Mon, Apr 24, 2023 at 11:38=E2=80=AFAM Michal Simek <michal.simek-5C7GfCeVMHo@public.gmane.org=
> wrote:
>
> Hi,
>
> last week I found that dt_binding_check is not checking all errors with
> compatible string and I have no idea why. I have used 3 systems and behav=
ior is
> pretty much the same.
> I am on the top of 6.3 kernel with
> dt-validate -V
> 2023.5.dev3+g31cc52ae483e
>
> And here is the behavior.
> Two compatible string I see errors but if I break only one compatible str=
ing I
> can't see erros. Not sure if this is issue with dt binding document or wi=
th host
> PC setup. Definitely thank you for any hint what to check.
>
> Thanks,
> Michal
>
>
> [linux](master)$ vim Documentation/devicetree/bindings/usb/dwc3-xilinx.ya=
ml
> [linux](master)$ git diff
> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> index 098b73134a1b..fbd9754ab0a3 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> @@ -110,7 +110,7 @@ examples:
>           usb@0 {
>               #address-cells =3D <0x2>;
>               #size-cells =3D <0x2>;
> -            compatible =3D "xlnx,zynqmp-dwc3";
> +            compatible =3D "xlnx,zynqmp-dwc32", "xlnx,zynqmp-dwc3";
>               reg =3D <0x0 0xff9d0000 0x0 0x100>;
>               clocks =3D <&zynqmp_clk USB0_BUS_REF>, <&zynqmp_clk USB3_DU=
AL_REF>;
>               clock-names =3D "bus_clk", "ref_clk";
> [linux](master)$ make
> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> dt_binding_check
>    LINT    Documentation/devicetree/bindings
>    CHKDT   Documentation/devicetree/bindings/processed-schema.json
>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>    DTEX    Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dts
>    DTC_CHK Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dtb
> /dev/shm/linux/Documentation/devicetree/bindings/usb/dwc3-xilinx.example.=
dtb:
> usb@0: compatible:0: 'xlnx,zynqmp-dwc32' is not one of ['xlnx,zynqmp-dwc3=
',
> 'xlnx,versal-dwc3']
>         From schema: /dev/shm/linux/Documentation/devicetree/bindings/usb=
/dwc3-xilinx.yaml
> /dev/shm/linux/Documentation/devicetree/bindings/usb/dwc3-xilinx.example.=
dtb:
> usb@0: compatible: ['xlnx,zynqmp-dwc32', 'xlnx,zynqmp-dwc3'] is too long
>         From schema: /dev/shm/linux/Documentation/devicetree/bindings/usb=
/dwc3-xilinx.yaml
>
>
>
> [linux](master)$ vim Documentation/devicetree/bindings/usb/dwc3-xilinx.ya=
ml
> [linux](master)$ git diff Documentation/devicetree/bindings/usb/dwc3-xili=
nx.yaml
> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> index 098b73134a1b..0b8985bf9b0b 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> @@ -110,7 +110,7 @@ examples:
>           usb@0 {
>               #address-cells =3D <0x2>;
>               #size-cells =3D <0x2>;
> -            compatible =3D "xlnx,zynqmp-dwc3";
> +            compatible =3D "xlnx,zynqmp-dwc32";
>               reg =3D <0x0 0xff9d0000 0x0 0x100>;
>               clocks =3D <&zynqmp_clk USB0_BUS_REF>, <&zynqmp_clk USB3_DU=
AL_REF>;
>               clock-names =3D "bus_clk", "ref_clk";
> [linux](master)$ make
> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> dt_binding_check
>    LINT    Documentation/devicetree/bindings
>    CHKDT   Documentation/devicetree/bindings/processed-schema.json
>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>    DTEX    Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dts
>    DTC_CHK Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dtb

'compatible' is how we decide whether to apply a schema or not (by
default if there is no 'select' entry). If you have an unknown
compatible, then no schema is going to be applied (except ones that
always get applied). The way we check for unknown compatible strings
is with the '-m' option on dt-validate. That's turned on for
dtbs_check, but off for dt_binding_check until the remaining 20-30
warnings are fixed. Also, I don't think that works in conjunction with
DT_SCHEMA_FILES being set.

Rob
