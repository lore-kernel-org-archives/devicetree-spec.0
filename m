From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [RFC] Serial port aliases in DT
Date: Fri, 28 Mar 2014 09:39:22 +0100
Message-ID: <CAMuHMdVYhGGt7+fR4oHzf-hDvTOWbHfhM2g92eo3RqULd6yR2A@mail.gmail.com>
References: <5448979.WQPtOb56tW@avalon>
	<20140328072827.GY17250@pengutronix.de>
	<CAMuHMdUaywK4JiiKgr=6=kFoQKQuuh=+_-ThYECr53U1cuVNLA@mail.gmail.com>
	<6506478.py2Axu25u1@wuerfel>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=GYU2QSnv0KO4Uxpozt5fBD/K45T5lSE4BG01im80W2g=;
        b=g2ZktWu8iwDNGDFihTAeGfKasYMQ3W4aK6vaRq5/z1/ZH/ZS2JfNmGYbERs+ubKAZw
         pFWujYX+YvdwMzl9+2VkVgxXLfzuFn3JXF+a3vLY/VdzzTIGVCs/MCmIyRHOiKoQB3oy
         JgDTWQaJZq4JLAJNrovFuIM2qp7sFZU/g7qJpZDLkRqXSlt7Qk9FilKMqkNI037jBiWP
         Z38H6TFbXclWgZyj4VKv1kkz0lCJH+EGM5l8LyJswAxsbLfHWlgIt+Oy0U5zWgiXs4CI
         bFz2UQ+PQFwWci0JGP5r6DrLtUpOxb2HA0DmlzURd43Kpximy2XY13KXOso7R/4E2asO
         9RwQ==
In-Reply-To: <6506478.py2Axu25u1@wuerfel>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, SH-Linux <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Arnd,

On Fri, Mar 28, 2014 at 9:30 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 28 March 2014 09:09:23 Geert Uytterhoeven wrote:
>> On the Renesas SoCs, where this thread started, you also have different
>> types of IP blocks providing similar functionality on the same SoC.
>> E.g. 3 types of serial ports, 2 types of i2c, (at least) 2 types of spi...
>> Hence one more level of confusion (is SoC serial0 the first serial port of
>> type A, B, or C?).
>
> The 'serial' aliases are defined to refer to UARTs only, there is no debate
> about that.

All 3 serial port types are UARTs.

For the serial ports, they are sufficiently similar to use the same driver.
For i2c and spi, that's not the case, and they use different drivers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
