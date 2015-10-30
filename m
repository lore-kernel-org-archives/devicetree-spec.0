From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: create a partition type device tree binding
Date: Fri, 30 Oct 2015 10:51:45 -0700
Message-ID: <20151030175145.GF13239@google.com>
References: <1446123152-22666-1-git-send-email-linus.walleij@linaro.org>
 <20151029162908.GA13275@localhost>
 <CACRpkdYS5Jf8UC2K0bNdEQZDjTeZZx44Uu-kkof+9E=4Ny0oDg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=T4QK9qV4ScMycfbjZcOGh/e5tyVtHmR3h12qpqNvQdY=;
        b=h1NGYYbw7xp+QIk+p2b3hYcRS4EEQEi7Um2m5I9WhUj9lE91wVSysz4lDzDw5ME6D8
         tDQBqw1UStA27QqJmx/6e39F64o4nWR3kgZiXZPuctfZzL6dhdj81spyPdvWbDs8Oxob
         S1HUhstnLnQe7HdXnQh8LRNtk8rkmpRpOQ/A2fodSzm6L6790/65Gd35UYoL2umzvz9X
         KoP56/3DXsdDMPecRVO6DUQ16I5DtS87r+4ZWfbfJbK42lD4xFJL4q12+FXymPBwXINZ
         Q9/69xNLof/fILxXyUWaSriumw2LY1jIy4haXeC7gtpwUv5fvMunOr+1vBbSno5zn2Hj
         e18g==
Content-Disposition: inline
In-Reply-To: <CACRpkdYS5Jf8UC2K0bNdEQZDjTeZZx44Uu-kkof+9E=4Ny0oDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>

On Fri, Oct 30, 2015 at 03:00:57PM +0100, Linus Walleij wrote:
> On Thu, Oct 29, 2015 at 5:29 PM, Brian Norris
> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> >> +Required properties:
> >> +- partition-type : the type of partition. Only one type can be specified.
> >
> > You're supporting this as a list property (for future expansion,
> > presumably), so I can only assume the "only one type" is referring to
> > the number of different parsers available currently, not the behavior of
> > the property itself?
> 
> I was thinking that it would not be a list actually.
> 
> The reason being that if you're anyways going to the trouble of
> specifying exactly what partition type is going to be used, you're
> not really interested in specifying a few different ones, you know
> exactly what type it is going to be.

OK, that makes sense. I think it's still *possible* that a board might
have the option of more than one partition parser, and so they might
just include both in the DTS, but that seems unlikely and so it makes
sense not to (over)engineer for it before it's needed. Anyway, your
binding can easily be expanded in the future if needed.

> But if you think it needs to be a list, I'll specify that, no big
> deal. I'll also try to get the Linux code to handle a list then.

No, I think your proposal is OK then. It's possible there is some room
for clarification in the binding, since I was confused, but that could
mostly be attributed to my pre-existing assumptions, not a fault of the
text.

> > Also, this patch will conflict with [1]. I'll probably take [1] soon, so
> > one of us will have to rebase this.
> 
> Sure I'll rebase on whatever you say.

OK, I'll let you know.

Brian
