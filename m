From: "embedded (VIVAVIS AG)" <embedded-dQ8pE230Wp9BDgjK7y7TUQ@public.gmane.org>
Subject: AW: Voltage and current regulator: usage of 'regulators' parent node
 in device tree
Date: Tue, 7 Sep 2021 15:40:06 +0000
Message-ID: <f6845de15bab408da7c3f6dc74161a82@vivavis.com>
References: <809518e1649a469cb4fc6fffd9bf427c@vivavis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <809518e1649a469cb4fc6fffd9bf427c-dQ8pE230Wp9BDgjK7y7TUQ@public.gmane.org>
Content-Language: de-DE
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I'd really appreciate it, if you can give me feedback on my question.
Thank you.

> Dear maintainer,
>
> I see a lot of Device trees wrapping the regulator nodes within a parent node
> like this
>
> regulators {
>    compatible = "simple-bus";
>    #address-cells = <1>;
>    #size-cells = <0>;
>    reg_p3v3: regulator@0 {
>        compatible = "regulator-fixed";
>        [...]
>        regulator-always-on;
>    };
>    [...]
>
> Contrary to that, patches exist removing the 'regulators' node, because the 'simple-bus'
> doesn't really exist in hardware. Unfortunately, the documentation is unclear about
> wrapping regulator nodes like shown above.
>
> Should I avoid the parent 'regulators' node and why?
>
> Is the given naming schema in fixed-regulator.yaml best practice to follow?
>
>    reg_xyz: regulator-xyz {
>      compatible = "regulator-fixed";
>      regulator-name = "xyz";
>
> Thank you for clarification.
>
> Carsten Stelling

