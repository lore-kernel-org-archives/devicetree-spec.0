From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
Date: Sat, 5 Dec 2015 22:33:30 +0100
Message-ID: <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-4-git-send-email-computersforpeace@gmail.com> <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=ZXgpzSKHpY9sXOhRDAZMV70ChRB2FsmhOv6XUjZlml0=;
        b=JMj+0e+4cCiW/Qwdt597c/bc7QAmWo5YuFW7ZXzDofg1DxFVjxQmgZYXaBnkCes1VG
         8ezX4IhdbDZW972oMvFEK5sXi/a6eLl5S1KvoQLdfLIZxCh9HEaKVxR4Crh/kpAFSy3M
         /n0VIk91fus836jRdOgrF9Oe5zHf1fBlLO6n7HY/0mWXEmkCn2walZMOEkNRXNgl1+IG
         +GKuyrF8uENxkjlE4nhjZGRFLM1ct6HaMV0HCIHB4RS5zTKbjJAzR+1rqOo+BCn5sL94
         9KiKlYr1c5S9+vv6UWz/JRQNieHuErIPwTvduU7H0mQYqgF+u6i2QTOWrp/9/L2HOyrm
         nfkA==
In-Reply-To: <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>

On 5 December 2015 at 12:39, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
> On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>> +
>> +Examples:
>> +
>> +flash@0 {
>> +       partitions {
>> +               compatible = "google,fmap";
>> +       };
>> +};
>
> I wonder if this wouldn't be better served in a separate binding doc
> with its compatible name as the filename, like we do with
> driver^Whardware blocks, especially if we want to add more parsers.


I find that *very* counter productive for bindings that go to the same
node. You have a description of a node, and then suddenly there you
have another file with another description of the same node. Totally
awesome.

Also how do you plan to write partitioning schemes with parameters
like with non-zero offset of the partition table.

Thanks

Michal
