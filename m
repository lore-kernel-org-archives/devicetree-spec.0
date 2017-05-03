From: Freddie Chopin <freddie_chopin-FWhLrETftxM@public.gmane.org>
Subject: Re: How to describe internal flash (ROM) in the microcontroller
Date: Wed, 03 May 2017 12:17:38 +0200
Message-ID: <1493806658.9572.2.camel@op.pl>
References: <1492886823.1240.5.camel@op.pl>
         <20170424012734.GB16882@umbus.fritz.box> <1493364100.1425.6.camel@op.pl>
         <CAL_Jsq+Gbu35bps2VcQ=pO3WyQE9VZhsuvpKtZ3TJ++B10jPWA@mail.gmail.com>
         <1493392846.1425.12.camel@op.pl> <20170501043819.GE13773@umbus.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1493806659; bh=ysSIwjo1gEDzzUPxhwF+bfRRmEYgLE1GZK5iyseHA8Y=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=n/4sqOBlqQzKYH2f3v/oftbxEmJf0JC3jxS/VdpyFF+N4Hubrfgbc6fCpXgWc9d4o
         o0cyHv9er07upWTmKlttf2usUYP/7EOyHnzOJ9hPotp9UlaRgG14mg9vZMxZX/7z8h
         TIbvylsht/E8aPSTF88BbRiV0rBNyEqDb3DuYaFg=
In-Reply-To: <20170501043819.GE13773-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-spec <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi!

On Mon, 2017-05-01 at 14:38 +1000, David Gibson wrote:
> There are existing CPU bindings which include additional properties
> giving lists or bitmasks of optional features.  For example the PAPR
> standard requires this for guest device trees on POWER.  It also
> requires that there be a 'cpu-version' property which gives the
> "logical PVR" which the OS is supposed to look at in most cases
> instead of the physically discoverable PVR register contents.  This
> has applications for CPUs put into compatibility modes for
> virtualization, so the use case isn't a perfect match, but the ideas
> may be adaptable.
> 
> What *is* a really good rule of thumb is don't invent a new way of
> encoding this information if you can possibly avoid it.  I don't know
> if the few cases of DT being used on x86 have something similar, but
> if they do I'd expect it to use the same bitmask as the cpuid
> instruction returns.  In your case, if there are existing (read only)
> registers that give the information you need, you could mirror their
> value into the device tree

I've just browsed the manual for ARMv7-M architecture and there are 3
read-only registers which have that info, but with a small twist (;

If the core has single-precision FPU, MVFR0-MVFR2 register values are
0x10110021, 0x11000011 and 0x00000000. This would be ARM Cortex-M4 with
FPv4-SP-D16 or ARM Cortex-M7 with FPv5-SP-D16. If the core has double-
precision FPU, the values of these registers are 0x10110221, 0x12000011
and 0x00000040. This is a case for ARM Cortex-M7 with FPv5-D16. The
slight twist is when the core has no FPU at all, as in that case the
manual says these registers are not implemented at all, but I haven't
checked yet whether any attempt to read them causes a fault or just
returns zeroes.

Could you point me to the binding which describes the properties you
mentioned? I couldn't find 'cpu-version' in the device-tree-rebasing
repository...

Maybe - after all - it would be easier and more readable to have FPU as
a subnode of the CPU? Sth like:

cpus {
	cpu@0 {
		compatible = "arm,cortex-m4";

		fpu@0 {
			compatible = "arm,fpv4-sp-d16";
		};
	};
};

In this case it's pretty easy to extend that with an optional 'status =
"okay";' / 'status = "disabled";' for the cases where the user doesn't
want FPU to be "globally enabled" (useful when only one thread uses
FPU, so there's no point in saving its context).

Regards,
FCh
