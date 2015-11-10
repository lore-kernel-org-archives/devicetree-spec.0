From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: create a partition type device tree binding
Date: Tue, 10 Nov 2015 09:43:28 +0100
Message-ID: <CACRpkdYQWaE3+iGA-W+2koo3fZWCWyCLoqJ+FgHor-nkPmgGAw@mail.gmail.com>
References: <1446123152-22666-1-git-send-email-linus.walleij@linaro.org>
	<20151029162908.GA13275@localhost>
	<CACRpkdYS5Jf8UC2K0bNdEQZDjTeZZx44Uu-kkof+9E=4Ny0oDg@mail.gmail.com>
	<20151030175145.GF13239@google.com>
	<CAL_JsqL2F3p7qBPbOiGytVyzF_aNLWbrCT0mAX1WZo6SxE3JoA@mail.gmail.com>
	<20151110032626.GN12143@google.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=ktZvD5sTQl3mrSKjSltcxQo+bwHoMDJIQIZJJsZL3f8=;
        b=aBD9XmJSpLinqi23P8iWpqxqMQG8mVO3E4gZ7j1us7TtpIeVtdtbuoy0glBFfOs7Ju
         T6h8kG+uD2dwK50rfuR2MpYkKfgrGxnXIt6RwHk1GvUh1LexDOptxoMePo54UU81XmDd
         UsBYREdjrm5wG+p5RNecxffVzhJ1qcpena9sevm42uvpCV0/wL/qzE32lT7Cz0eeTnBo
         peDCkQBe3JhM/bAO9O9P8NgVcSfOxOJxPQCDlT5Tu2ez32tCWSMsfyrHK1PdeRY6jt3y
         3dv8IzmgdZIrxmvUVR60VuoaPfonBFMvEN7sZlVsH2fiE+A3bL+9muDJkAGS2gRwrNDU
         NI1Q==
In-Reply-To: <20151110032626.GN12143-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>

On Tue, Nov 10, 2015 at 4:26 AM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Nov 06, 2015 at 08:13:13AM -0600, Rob Herring wrote:
>> Since we now have partitions contained in a sub node, how about using
>> compatible for that sub node instead.
>
> That seems like a pretty good idea to me.

Hm! That's a clever idea. I'll take a spin on that.

Yours,
Linus Walleij
