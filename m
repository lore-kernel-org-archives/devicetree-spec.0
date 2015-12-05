From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [RFC PATCH 0/7] mtd: partitions: add of_match_table support
Date: Sat, 5 Dec 2015 11:15:54 +0100
Message-ID: <CAMuHMdUJXHs_OhT0da+kzc=D4MOFUT9BB3eJ+7a_p6DYx-PKBA@mail.gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=PaEQVOhQi2pSoHhqKzwm+ZIwyvxx8ie26PhHQqHl+nw=;
        b=GQ7B0p4fW1rlpqiTQ1Mv9GPY23EtxLbSLYSdhjY2vcu5wBSXCeJfacxxQ5byTSHlIc
         oLDdE+XWExeAgK/EeQFiL6r03mNZTlVHjlkOpno+iV8/kki0o7tf5jyY4C7BhAGAseGw
         y8K/4ZZaF/a9SVbImAEAzXCD6wHn2ZijElYJF+WxiLhn/N1cEPOFkUrV3elOqvAJbEfs
         /u+p3pe67PsO1R0FTvxudCiHJ7NTHivQdiuikVMmJJamZMVfKbxeLt52SYYZ3olheUR/
         Ki42ja1Yp2lmdZNWrwN/kbsaDQb98PegdINPblAREpfw+iZnKKPM2wczpH5i8IgsmixT
         H79A==
In-Reply-To: <1449292763-129421-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, David Hendricks <dhendrix-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> There have been several discussions [1] about adding a device tree binding for
> associating flash devices with the partition parser(s) that are used on the
> flash. There are a few reasons:
>
>  (1) drivers shouldn't have to be encoding platform knowledge by listing what
>      parsers might be used on a given system (this is the currently all that's
>      supported)
>  (2) we can't just scan for all supported parsers (like the block system does), since
>      there is a wide diversity of "formats" (no standardization), and it is not
>      always safe or efficient to attempt to do so, particularly since many of
>      them allow their data structures to be placed anywhere on the flash, and
>      so require scanning the entire flash device to find them.

I read the second reason, but would it be useful to (partially) merge
block/partitions/ and drivers/mtd/partitions/, so I can use e.g. msdos
partitions
on an mtd device??

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
