From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Patches to allow consistent mmc / mmcblk numbering
 w/ device tree
Date: Fri, 29 Apr 2016 12:43:39 -0700
Message-ID: <CAD=FV=VMxBYXOYOyHPeqcaWX7oU8pVrdLHOsWOWUgq-q5FshAw@mail.gmail.com>
References: <1461951139-6109-1-git-send-email-dianders@chromium.org>
	<20160429181248.GW19428@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=dDK5t3kesxPM7fg4gD1icNGh0niWfsqmNQTEJzG1IYY=;
        b=KrxA01QtwwMifWEgUZ08Y8uNvqicJGcSwvoEm3F53vGCP0oLZG3vNPM0suEylZ4dmJ
         Sz51Y/1UFMboAgK8AOY+vNiMV9erO1IusOSSQtnHyfDIg1f8+BhCjyXsNRYcexNf8wE4
         5Wmy4yH2kb7tKztWDwzjNxh4vb7RK4I2SfEw0La0INT+ArpYlLh5uQyieD+tOHtx9TrL
         OgyPuwbnErAO3hJCjHrn6A5vGt1r1MhJeyYcQLGL+0ejiAxjjh8J4ba4hdzNEFPGG3Ts
         eIbuCeWh1QFiO8ylEnaCXFW4Y5ZRYrRNxoTudaHjNHbns1LzeShDu/UjTQSObx+XV7r2
         vX8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=dDK5t3kesxPM7fg4gD1icNGh0niWfsqmNQTEJzG1IYY=;
        b=GAJs++vnhNCXgj13T8URH9UD0ERj5X8VRboYgDPD/B/1Vpk91FUj2s+q5bDVRJ7uw8
         bWg48/GZ+s2MrcxCX8ijonfO+vtoyY482D36sT1D4M0b+l+hTOC3neJNZ6IbuFHdmA7n
         C3U6msCk6plvWokBdvFuduOtkNChgpMkjawk8=
In-Reply-To: <20160429181248.GW19428-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <p>

Russell,

On Fri, Apr 29, 2016 at 11:12 AM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Fri, Apr 29, 2016 at 10:32:15AM -0700, Douglas Anderson wrote:
>> This series picks patches from various different places to produce what
>> I consider the best solution to getting consistent mmc and mmcblk
>> ordering.
>>
>> Why consistent ordering and why not just use UUIDs?  IMHO consistent
>> ordering solves a few different problems:
>
> NAK.  Really.  Use UUIDs, that's the proper solution here.

Un-NAK.  UUIDs don't solve point #1.


> Exactly the same issue arises if you have more than one ATA or SCSI
> adapter in your PC - things can be probed out of order and end up
> in different /dev/sd* slots.

Yup, UUIDs are awesome and great and super.  Best invention since
sliced bread, really.  I definitely _won't_ submit a patch to remove
UUID support.  I promise.

A few notes, though:

* Presumably on a PC you've got an extra bit in the middle (like grub
or something like that) that can help you resolve your UUIDs even if
you get your kernel from somewhere else.  In my case, I don't have
that.  Maybe this is a failing of coreboot / depthcharge's netboot and
I suppose.  ...and I suppose I could modify the BIOS to take a root
filesystem of "eMMC" and have it resolve that to the eMMC's UUID or
something like that.  ...or I just take these patches locally and
things keep working like they did before.

* Presumably in the non-embedded world kernel hackers have a different
workflow.  They probably don't swap between different devices with
different configurations on an hourly basis.  They're not in the habit
of totally reimaging their system periodically.  Etc.  Trying to force
the workflow of a PC kernel hacker and an embedded kernel hacker to be
the same doesn't seem like a worthwhile goal.

* Presumably an embedded kernel hacker running with ATA / SCSI could
_usually_ assume that "sda" is his/her root filesystem.  It's unlikely
an embedded system would have more than one "sda" disk builtin and
it's nearly guaranteed (I think) that a builtin ATA / SCSI controller
would probe before any USB based devices.  Sure, if your root
filesystem is USB based (really?) and you've got additional USB
storage devices then you're SOL.  Sorry.

-Doug
