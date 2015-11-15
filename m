From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: create a partition type device tree binding
Date: Sun, 15 Nov 2015 10:06:07 +0100
Message-ID: <CAMuHMdVBdnjH0xQoMY7yT6Q-Z4bnukWgjBcWNYzhhNpO6263Rg@mail.gmail.com>
References: <1446123152-22666-1-git-send-email-linus.walleij@linaro.org>
	<20151029162908.GA13275@localhost>
	<CACRpkdYS5Jf8UC2K0bNdEQZDjTeZZx44Uu-kkof+9E=4Ny0oDg@mail.gmail.com>
	<20151030175145.GF13239@google.com>
	<CAL_JsqL2F3p7qBPbOiGytVyzF_aNLWbrCT0mAX1WZo6SxE3JoA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=KXkBA8NVr2b2TTbmoVJjyAeuS3KbDkHk/4uR0A1XJ64=;
        b=ywKbsXUXoTjmxcG2Xdugfh+TsTJi5T6elAk3ub3snfc0K3WTCWOAFjOwUmbsyqlBus
         Sxh9Tz98HloavBgRYVK7nZ6pFmroMBotHKN2Nk3vkx9BuuzcqM55dnr0YMKrnMN/B/Y3
         RVorejKEYH2j6wmrDJTPupgeP3WkKd+2IkyHEI7nYedbDd8gzA1GLu2C3bwKlvL6N6hi
         c89T3ykMnmi6cv/5nXpl/fyXD30VNA15IDRb1DJ4qb0wICLuaFrHAgzL2fLDo6XYdwwT
         mUe9ZHiTw0t7s7PoNvvbuOI+43J7k1W1sG7h6i942Ve+HuGsf1LCQXdHzBebaIw/0WRj
         Dysw==
In-Reply-To: <CAL_JsqL2F3p7qBPbOiGytVyzF_aNLWbrCT0mAX1WZo6SxE3JoA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>

On Fri, Nov 6, 2015 at 3:13 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Oct 30, 2015 at 12:51 PM, Brian Norris
> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Fri, Oct 30, 2015 at 03:00:57PM +0100, Linus Walleij wrote:
>>> On Thu, Oct 29, 2015 at 5:29 PM, Brian Norris
>>> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>> >> +Required properties:
>>> >> +- partition-type : the type of partition. Only one type can be specified.
>>> >
>>> > You're supporting this as a list property (for future expansion,
>>> > presumably), so I can only assume the "only one type" is referring to
>>> > the number of different parsers available currently, not the behavior of
>>> > the property itself?
>>>
>>> I was thinking that it would not be a list actually.

Why not? It is (was) not uncommon to have multiple partition table types on
hard disks (e.g. bsd disklabel and msdos and/or amiga rdb).

>>> The reason being that if you're anyways going to the trouble of
>>> specifying exactly what partition type is going to be used, you're
>>> not really interested in specifying a few different ones, you know
>>> exactly what type it is going to be.
>>
>> OK, that makes sense. I think it's still *possible* that a board might
>> have the option of more than one partition parser, and so they might
>> just include both in the DTS, but that seems unlikely and so it makes
>> sense not to (over)engineer for it before it's needed. Anyway, your
>> binding can easily be expanded in the future if needed.
>
> Since we now have partitions contained in a sub node, how about using
> compatible for that sub node instead.

And "compatible" supports a list of multiple values.

BTW, this means it also (can) becomes more generic. Will it be applicable
to other block devices (e.g. hard disks), too?
Integration with block/partitions?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
