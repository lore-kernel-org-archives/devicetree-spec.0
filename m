From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v2 0/4] Patches to allow consistent mmc / mmcblk numbering
 w/ device tree
Date: Fri, 29 Apr 2016 18:42:35 -0400
Message-ID: <CABxcv==4C+RrEV1Fd+DkbMdGrLyObw36vsmo3wTGdxO=UnAa8w@mail.gmail.com>
References: <20160429181248.GW19428@n2100.arm.linux.org.uk>
	<CAD=FV=VMxBYXOYOyHPeqcaWX7oU8pVrdLHOsWOWUgq-q5FshAw@mail.gmail.com>
	<20160429195741.GY19428@n2100.arm.linux.org.uk>
	<CAD=FV=UGyi0r3kDmc1cpcANTP-2u+7UEgW3r9kRvF2f8qcWH+g@mail.gmail.com>
	<20160429211328.GZ19428@n2100.arm.linux.org.uk>
	<CAD=FV=V8BOsO36eUOGAcXp04xCiN13UGG0Vaf2yhh1MQn85FjA@mail.gmail.com>
	<20160429212920.GA19428@n2100.arm.linux.org.uk>
	<CAD=FV=V9V8P=d59RX1eaAdVxJgMxub1F6hzQNw1QW+7t=3POBw@mail.gmail.com>
	<20160429215017.GC19428@n2100.arm.linux.org.uk>
	<CAD=FV=VgQX_EVhUUCugzv+CZqjzTS8LwyeU5419aX9FbDnWJDg@mail.gmail.com>
	<20160429221606.GE19428@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=9HWN9/OhzN7y2eutLjrJ1oO0WJgU1hzBNmPfs/YGoi4=;
        b=NgFCy97PkVKrzdVTDDFdQPO3iXAsyNoGhhuJ8a3gzw4gZXj4ho5GXBh/s8dlRalSeA
         5+a6Ld9Wgwco80CncCQn3Utp5RDtN1PQ7i78ys3TQ+0YRcwp+Qej4tEUeUa+959A1J/3
         0I6BxpGap5b5dQRv6y8YZpMvmVDoQgWomYO+Y+vMhw+hLynhzytDcswFopWPZ0jpTN3w
         NkuilBGSGyENGuV81lTCc9EIsPrAv4BKg97uxNwkAx7s56pCjJNvdLqVUizQYGPZ3/md
         3D5HcQHsOVcGSrx9OaLnRlxivU1Z+IcOwCw1mzb9a8msISPGap1TneGOxeR0H0rrzCWm
         +GDw==
In-Reply-To: <20160429221606.GE19428@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Doug Anderson <dianders@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, Shawn Lin <shawn.lin@rock-chips.com>, Adrian Hunter <adrian.hunter@intel.com>, Stefan Agner <stefan@agner.ch>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@marvell.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree-spec@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Venu Byravarasu <vbyravarasu@nvidia.com>, Lars-Peter Clausen <lars@metafoo.de>, Jon Hunter <jonathanh@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <dev>

Hello Russell,

On Fri, Apr 29, 2016 at 6:16 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Apr 29, 2016 at 02:56:38PM -0700, Doug Anderson wrote:
>> Russell,
>>
>> On Fri, Apr 29, 2016 at 2:50 PM, Russell King - ARM Linux
>> <linux@arm.linux.org.uk> wrote:
>> > On Fri, Apr 29, 2016 at 02:39:35PM -0700, Doug Anderson wrote:
>> > [didn't read most of your reply]
>> >
>> >> Really I just reposted it several times because I notice that you seem
>> >> to ignore many points of my emails.  I was really hoping to get you to
>> >> address this point.  I notice that you still didn't.  Either you are
>> >> just trying to annoy me, or you don't have an answer to how my patch
>> >> series hurts you.
>> >
>> > I don't see you treating Rob with the same contempt that you have
>> > treated me in this thread, despite Rob and myself both telling you
>> > basically the same thing.
>>
>> Rob wrote a nice thoughtful reply and I tried to give a nice
>> thoughtful reply back to him.  He raised some good points and I raised
>> some good points back to him.  I look forward to his future thoughts
>> on the topic.
>
> Meanwhile, I've pointed out that you appear to be coming from a
> misunderstanding (that's certainly clear because you believed
> initially that grub did something it doesn't), showing that the
> "problem" you have is no different from the majority of other
> systems running Linux, and you treat me with contempt.
>
> What are you going to do to resolve this?
>

Maybe a third opinion could make this conversation constructive again.

I think Doug's point is that using a UUID or labels for consistency is
orthogonal to having a deterministic numbering for MMC devices. And I
agree with his point of view for what is worth.

I understand that this not true for other systems and peripherals but
in the specific case of MMC, the changes are minimal as Doug's patches
have shown and even the technical manual of SoCs has an enumeration to
refer each SD/MMC slot.

So I think is fair to say that SD/MMC is different than say USB mass
storage devices as you mentioned, and having a consistent numbering is
very helpful for diagnostics and debugging purposes IMHO.

BTW, I use labels in all my systems because as you said it's nice to
be able to swap cards and not change the bootloader env vars, but I
see how having a deterministic numbering could be useful to others.

Best regards,
Javier
