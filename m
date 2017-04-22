From: Freddie Chopin <freddie_chopin-FWhLrETftxM@public.gmane.org>
Subject: How to describe internal flash (ROM) in the microcontroller
Date: Sat, 22 Apr 2017 20:47:03 +0200
Message-ID: <1492886823.1240.5.camel@op.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1492886824; bh=kGe78ijJQ3i0bqArt3Ii2H8OSbwV7KT1B6nHVEpUPHA=;
        h=Subject:From:To:Date:From;
        b=PnNIOs1KHuuExx0qgYzI4s7CGbIhxTkd9B/ebMsxATZ1zwiAFGMsmnI2ISbksdu02
         sB9d5ARltGgf+xpcssKuV5pRACcj6I91fyjauXXC9N0kOQGFGa+mPyF88WHIHM512F
         pwMhTeAqCuLPv2Utw+YZ/O0Vs99fCuRfNyRb4An0=
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello!

For my project - http://distortos.org/ - which is a C++ RTOS for
microcontrollers, I decided to use devicetree to configure hardware.
Currently the project uses kconfig, but for configuring hardware this
gets unmanageable and just too big and too restrictive. My plan is to
gradually convert to *.dts and the first step I wanted to make is to
convert addresses and sizes of memory (which I'll later read from *.dts
file to generate linker script).

To cut a long story short - there's no issue in adding RAM (internal
chip's SRAM) - just add that as one or more /memory node. However I
also need to do something for which I found absolutely no info, no
example and no binding - I also need to describe **internal** ROM
(internal on-chip flash memory). Please note that this is _not_
something which can be described as "nand-flash", "nor-flash", "emmc",
"qspi" or things like that - this memory is not externally connected
via some interface - it is "built-in" into the chip.

I have thought about two options to do that, but can't decide which one
fits better, so I decided to ask here, as you've been working with
devicetrees for quite a long time.

Option 1

Generally this is similar to what Zephyr RTOS has done, which is to
just introduce a new /flash node. This has a disadvantage of being non-
standard.

https://github.com/zephyrproject-rtos/zephyr/blob/master/dts/arm/st/stm32l476.dtsi#L11

Option 2

Describe flash as a separate /memory node and add "read-only;" property
there to designate it as "not-RAM". In my personal opinion this fits
nicely with other parts of spec (and fits with /reserved-memory nodes
concept from Linux). However I'm not sure whether the idea of "read-
only" memory region makes any sense according to your concepts. BTW
some other property would also work fine here, generally anything that
would allow me to know which is flash and which is RAM, so I could use
them for different parts of linker script.

Or maybe instead of adding "read-only;" I should use sth like this in
my flash /memory node:

compatible="internal-flash";

For "option 2" there's also another question - I may need to add some
more non-standard properties for such nodes, for example with
configuration of latency or for configuration of LMA address which will
be used by linker (for example in STM32F7 microcontrollers flash can be
accessed via two different buses, but written only via one - as the one
which can be used for writes is slower, it is preferable to use
different VMA/LMA addresses). This can actually be done with virtual-
reg property (where reg would have LMA and virtual-reg - VMA), but I'm
sure the need for something non-standard would arrive some day or
another. Would that still fit?

Thanks in advance for all ideas!

Regards,
FCh
