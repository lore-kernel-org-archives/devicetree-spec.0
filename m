From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: create a partition type device tree binding
Date: Fri, 30 Oct 2015 15:00:57 +0100
Message-ID: <CACRpkdYS5Jf8UC2K0bNdEQZDjTeZZx44Uu-kkof+9E=4Ny0oDg@mail.gmail.com>
References: <1446123152-22666-1-git-send-email-linus.walleij@linaro.org>
	<20151029162908.GA13275@localhost>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=kmi1aSr0+DE33Spk/cK9I0+z11P7rAVuIHggUt0UeTc=;
        b=oLEQQm6s9oIqJTDVKC0ZEm6cuDLZcDN33iZXjFbcUVpdCZnX8NVAsRQKVW9P7pwccw
         C95NMiRwLQ4+7JkWr/YEUNPVF2lHkeOvWkoFEYaw/+7410w9hsfnNLbucpD8Mo0kuKqN
         5UX2JaCHYfkniiBPFZwA0LvgR9fjfqHFuIfsZ0S7V2sv8oWq690HxHwmrxzh1/tsQ80C
         eEBpLwAP5D/BTXLjfD5mzQDKIFTm4XTnxNNFF0bunH73bMiT0YsS/zgMPJVawqGrLBhZ
         TrlhjEOCjYfo6bm44UbThK9Z1DKJ/zgUVTDXcMMWc/RIRiy8QYAVdle2Pfy6hAwMVZdL
         SAmA==
In-Reply-To: <20151029162908.GA13275@localhost>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>

On Thu, Oct 29, 2015 at 5:29 PM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>> +Required properties:
>> +- partition-type : the type of partition. Only one type can be specified.
>
> You're supporting this as a list property (for future expansion,
> presumably), so I can only assume the "only one type" is referring to
> the number of different parsers available currently, not the behavior of
> the property itself?

I was thinking that it would not be a list actually.

The reason being that if you're anyways going to the trouble of
specifying exactly what partition type is going to be used, you're
not really interested in specifying a few different ones, you know
exactly what type it is going to be.

But if you think it needs to be a list, I'll specify that, no big
deal. I'll also try to get the Linux code to handle a list then.

> Also, this patch will conflict with [1]. I'll probably take [1] soon, so
> one of us will have to rebase this.

Sure I'll rebase on whatever you say.

Yours,
Linus Walleij
