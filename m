From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: dtc fails to compile <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>
Date: Thu, 30 Mar 2017 10:39:21 -0500
Message-ID: <CAL_JsqKWCKoeFfUPTZ59j3f2mxma+EKu617c3ArOiy-ezTHa+A@mail.gmail.com>
References: <CAHKzcENCdMSxnUC1Ruv5-3hH+y4zpw_8O17_-yutWotLK5GjBw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHKzcENCdMSxnUC1Ruv5-3hH+y4zpw_8O17_-yutWotLK5GjBw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Waldemar Rymarkiewicz <waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Mar 30, 2017 at 4:20 AM, Waldemar Rymarkiewicz
<waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> I build DT for thermal zone according to
>
> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/thermal/thermal.txt#L261
>
> but dtc (DTC 1.4.1-g53bf130b) fails with syntax error.
>
>     Error: ../dts/xrx500.dtsi:1060.14-15 syntax error
>     FATAL ERROR: Unable to parse input tree
>
> The problem is with cooling-device property
>
>       cooling-maps {
> 295                         map0 {
> 296                                 trip = <&cpu_alert0>;
> 297                                 cooling-device =
> 298                                     <&cpu0 THERMAL_NO_LIMIT
> THERMAL_NO_LIMIT>;
> 299                         };
> 300                 };
>
> if I use phandle like <&cpu0> it compiles but  <&cpu0 THERMAL_NO_LIMIT
> THERMAL_NO_LIMIT>; fails.
>
> What could be a reason? any hint ?

Did you run it thru the C preprocessor first? Simple #defines are
supported in dts files, but you have to use the C preprocessor before
passing to dtc. The builds of dts files in the kernel tree do this for
you.

Rob
