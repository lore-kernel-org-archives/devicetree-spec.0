From: Waldemar Rymarkiewicz <waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dtc fails to compile <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>
Date: Fri, 31 Mar 2017 10:25:19 +0200
Message-ID: <CAHKzcEMwb4VMzq-T+b6JwP2UL+VGiTsbj75_Lgz4=v670Huuxg@mail.gmail.com>
References: <CAHKzcENCdMSxnUC1Ruv5-3hH+y4zpw_8O17_-yutWotLK5GjBw@mail.gmail.com>
 <CAL_JsqKWCKoeFfUPTZ59j3f2mxma+EKu617c3ArOiy-ezTHa+A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ItkNGUYhaTWS1FLs4CrKHcU0+UlX5oOGX+iS9aOxF9k=;
        b=SezMz/r0nQAqRnxUchOdf2v1eZcdlmx7qwJxT0ahQtrhSf0saakdofh5P//EfEbXbn
         sAiiN6iwVzuHnRfDELHKi4kJ9VAyAY3sfGzLg5nm1UOwHXPie2Lo/QcPNQcgrmA8Iups
         hkyv2k9YhAK0FZosXjpp7UgR0AJXM288FXizJMpuMKnJ/n/yODqNi5Z6eBX4edQTvH30
         PBNnbC29kut1oEGY7TwMqR+ooPHiHDzqQ7L2YKqGkM5fdqvez3GuDxMtCyGoGsSghiZr
         lXEJhO60UhHRy3epKvlWhzaf3FZYr4DrOPOKHKFQj3gb3wMSOlanYpLYQaCmhpsdBqBT
         3OtQ==
In-Reply-To: <CAL_JsqKWCKoeFfUPTZ59j3f2mxma+EKu617c3ArOiy-ezTHa+A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 30 March 2017 at 17:39, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Mar 30, 2017 at 4:20 AM, Waldemar Rymarkiewicz
> <waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi,
>>
>> I build DT for thermal zone according to
>>
>> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/t=
hermal/thermal.txt#L261
>>
>> but dtc (DTC 1.4.1-g53bf130b) fails with syntax error.
>>
>>     Error: ../dts/xrx500.dtsi:1060.14-15 syntax error
>>     FATAL ERROR: Unable to parse input tree
>>
>> The problem is with cooling-device property
>>
>>       cooling-maps {
>> 295                         map0 {
>> 296                                 trip =3D <&cpu_alert0>;
>> 297                                 cooling-device =3D
>> 298                                     <&cpu0 THERMAL_NO_LIMIT
>> THERMAL_NO_LIMIT>;
>> 299                         };
>> 300                 };
>>
>> if I use phandle like <&cpu0> it compiles but  <&cpu0 THERMAL_NO_LIMIT
>> THERMAL_NO_LIMIT>; fails.
>>
>> What could be a reason? any hint ?
>
> Did you run it thru the C preprocessor first? Simple #defines are
> supported in dts files, but you have to use the C preprocessor before
> passing to dtc. The builds of dts files in the kernel tree do this for
> you.

Yes,  but preprocessor does not resolve  THERMAL_NO_LIMIT which is
located in include/linux/thermal.h as far as I can see.

$> mips-openwrt-linux-musl-cpp -nostdinc -x assembler-with-cpp
-I/linux/arch/mips/boot/dts -I/linux/arch/mips/boot/dts/include -undef
-D__DTS__  -o  foo.dtb.tmp  foo.dts

$> dtc -O dtb -i../dts/  -o foo.bin.dtb foo.bin.dtb.tmp
Error: ../dts/foo.dts:1061.14-15 syntax error
FATAL ERROR: Unable to parse input tree

1061 =E2=80=A2       =E2=80=A2   <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;


/Waldek
