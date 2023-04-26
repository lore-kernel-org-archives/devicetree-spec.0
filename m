From: Michal Simek <michal.simek-5C7GfCeVMHo@public.gmane.org>
Subject: Re: dt_binding_check not reporting all errors
Date: Wed, 26 Apr 2023 09:54:44 +0200
Message-ID: <f3900805-3b34-e98d-0a0b-7b8d86896530@amd.com>
References: <77db7543-cae4-695c-7c86-6562534d4e87@amd.com>
 <CAL_JsqJcJsjnao0FGzx7e-vxYnUGC6S3_GRORq1KyDQzqX-3hw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bK3yyCEdIS/65hiUnr7D5+98Ue/ScNBK8YNEzI9Dkmk=;
 b=2z5X+yXWSMgxJiIQ49pCzSebT5dVlgFL66b6dea6Te+B69kfKIWVQuU7cpMZSu165uahq9oM2jNqTNUtA5SuY1ChPPwKg8hqfgN8B15PR0LzZD76V0MCvV43vxB1lwU/5kZyhM7PdYhKZa5Y3NoSZKH86nWnGGUyCZ66MdtPdfQ=
Content-Language: en-US
In-Reply-To: <CAL_JsqJcJsjnao0FGzx7e-vxYnUGC6S3_GRORq1KyDQzqX-3hw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>



On 4/24/23 19:22, Rob Herring wrote:
> On Mon, Apr 24, 2023 at 11:38=E2=80=AFAM Michal Simek <michal.simek-5C7Gf=
CeVMHo@public.gmane.org> wrote:
>>
>> Hi,
>>
>> last week I found that dt_binding_check is not checking all errors with
>> compatible string and I have no idea why. I have used 3 systems and beha=
vior is
>> pretty much the same.
>> I am on the top of 6.3 kernel with
>> dt-validate -V
>> 2023.5.dev3+g31cc52ae483e
>>
>> And here is the behavior.
>> Two compatible string I see errors but if I break only one compatible st=
ring I
>> can't see erros. Not sure if this is issue with dt binding document or w=
ith host
>> PC setup. Definitely thank you for any hint what to check.
>>
>> Thanks,
>> Michal
>>
>>
>> [linux](master)$ vim Documentation/devicetree/bindings/usb/dwc3-xilinx.y=
aml
>> [linux](master)$ git diff
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>> b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>> index 098b73134a1b..fbd9754ab0a3 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>> @@ -110,7 +110,7 @@ examples:
>>            usb@0 {
>>                #address-cells =3D <0x2>;
>>                #size-cells =3D <0x2>;
>> -            compatible =3D "xlnx,zynqmp-dwc3";
>> +            compatible =3D "xlnx,zynqmp-dwc32", "xlnx,zynqmp-dwc3";
>>                reg =3D <0x0 0xff9d0000 0x0 0x100>;
>>                clocks =3D <&zynqmp_clk USB0_BUS_REF>, <&zynqmp_clk USB3_=
DUAL_REF>;
>>                clock-names =3D "bus_clk", "ref_clk";
>> [linux](master)$ make
>> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>> dt_binding_check
>>     LINT    Documentation/devicetree/bindings
>>     CHKDT   Documentation/devicetree/bindings/processed-schema.json
>>     SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>>     DTEX    Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dts
>>     DTC_CHK Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dtb
>> /dev/shm/linux/Documentation/devicetree/bindings/usb/dwc3-xilinx.example=
.dtb:
>> usb@0: compatible:0: 'xlnx,zynqmp-dwc32' is not one of ['xlnx,zynqmp-dwc=
3',
>> 'xlnx,versal-dwc3']
>>          From schema: /dev/shm/linux/Documentation/devicetree/bindings/u=
sb/dwc3-xilinx.yaml
>> /dev/shm/linux/Documentation/devicetree/bindings/usb/dwc3-xilinx.example=
.dtb:
>> usb@0: compatible: ['xlnx,zynqmp-dwc32', 'xlnx,zynqmp-dwc3'] is too long
>>          From schema: /dev/shm/linux/Documentation/devicetree/bindings/u=
sb/dwc3-xilinx.yaml
>>
>>
>>
>> [linux](master)$ vim Documentation/devicetree/bindings/usb/dwc3-xilinx.y=
aml
>> [linux](master)$ git diff Documentation/devicetree/bindings/usb/dwc3-xil=
inx.yaml
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>> b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>> index 098b73134a1b..0b8985bf9b0b 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>> @@ -110,7 +110,7 @@ examples:
>>            usb@0 {
>>                #address-cells =3D <0x2>;
>>                #size-cells =3D <0x2>;
>> -            compatible =3D "xlnx,zynqmp-dwc3";
>> +            compatible =3D "xlnx,zynqmp-dwc32";
>>                reg =3D <0x0 0xff9d0000 0x0 0x100>;
>>                clocks =3D <&zynqmp_clk USB0_BUS_REF>, <&zynqmp_clk USB3_=
DUAL_REF>;
>>                clock-names =3D "bus_clk", "ref_clk";
>> [linux](master)$ make
>> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>> dt_binding_check
>>     LINT    Documentation/devicetree/bindings
>>     CHKDT   Documentation/devicetree/bindings/processed-schema.json
>>     SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>>     DTEX    Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dts
>>     DTC_CHK Documentation/devicetree/bindings/usb/dwc3-xilinx.example.dtb
>=20
> 'compatible' is how we decide whether to apply a schema or not (by
> default if there is no 'select' entry). If you have an unknown
> compatible, then no schema is going to be applied (except ones that
> always get applied). The way we check for unknown compatible strings
> is with the '-m' option on dt-validate. That's turned on for
> dtbs_check, but off for dt_binding_check until the remaining 20-30
> warnings are fixed. Also, I don't think that works in conjunction with
> DT_SCHEMA_FILES being set.

ok. Clear. Yes -m is not enabled for DT_SCHEMA_FILES.

Thanks,
Michal

