From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Voltage and current regulator: usage of 'regulators' parent node
 in device tree
Date: Tue, 7 Sep 2021 13:16:51 -0500
Message-ID: <CAL_JsqLBiq0+MnYQ0=vMEDe_n+gHAT8PP6VO=Quj-A4yOCu_6w@mail.gmail.com>
References: <809518e1649a469cb4fc6fffd9bf427c@vivavis.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631038625;
        bh=dtQgrqO/X05cjuR0wIhoEvBCO0QPLSYZrC7C6hMSAIY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=k69HzNNGsBwer1sSFyYSsq/WDR1wSaNySk4qM06ewIeaAiDkz9T3NBXf4W/Kp2f/L
         30zBH3PVTHCHz2HwARcu9Sx+UxNWUMhP57OQpUSVmVi8Km8QzBFPyANPWvawP0kn2B
         NP3PuGzCbYWznQMc9FxkMVfhqcmPb4tfsVTPJpzXlYOEgkx5n37vcWM8nnDdqLyOep
         LXg1tz/D32eF8SNdIGlB2iVZH+8uUX1ro93y19UbxS0w0Gtxx1eAanXXWSIAXR/o+m
         lE3jkP4Gh2bNzANzOxunsmTF2hCGKbIMyZdJefEN1IXJzPVjuT3efcmMI3b8yhE4DV
         d/08Z5SNcuMfA==
In-Reply-To: <809518e1649a469cb4fc6fffd9bf427c-dQ8pE230Wp9BDgjK7y7TUQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "embedded (VIVAVIS AG)" <embedded-dQ8pE230Wp9BDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Mon, Aug 23, 2021 at 7:59 AM embedded (VIVAVIS AG)
<embedded-dQ8pE230Wp9BDgjK7y7TUQ@public.gmane.org> wrote:
>
> Dear maintainer,
>
> I see a lot of Device trees wrapping the regulator nodes within a parent node
> like this
>
> regulators {
>     compatible = "simple-bus";
>     #address-cells = <1>;
>     #size-cells = <0>;
>     reg_p3v3: regulator@0 {
>         compatible = "regulator-fixed";
>         [...]
>         regulator-always-on;
>     };
>     [...]
>
> Contrary to that, patches exist removing the 'regulators' node, because the 'simple-bus'
> doesn't really exist in hardware. Unfortunately, the documentation is unclear about
> wrapping regulator nodes like shown above.
>
> Should I avoid the parent 'regulators' node and why?

Yes and no. Yes, in the above case as there is no bus nor grouping of
fixed regulators. For a MFD that includes regulators, then a child
'regulators' node is appropriate. To put it another way, if you have a
schema defining a 'regulators' node, then it probably is appropriate.

> Is the given naming schema in fixed-regulator.yaml best practice to follow?
>
>     reg_xyz: regulator-xyz {
>       compatible = "regulator-fixed";
>       regulator-name = "xyz";

Yes, pretty much.

Rob
