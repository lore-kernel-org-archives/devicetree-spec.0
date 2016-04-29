From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 0/4] Patches to allow consistent mmc / mmcblk numbering
 w/ device tree
Date: Fri, 29 Apr 2016 15:22:50 -0700
Message-ID: <CAD=FV=WzgGFzzpeYAPrOpMS684_G=XRoSRjTegK-vre=fX=kpw@mail.gmail.com>
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
Return-path: <linux-mmc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=Oe5IS3I/wACL2TPR5PPlWs+2TxHinGRcyfSX6KcA8XE=;
        b=PG7CWDvPj83eTN9VU5fXfwhBE/zJZHc4fxWSI9OgK1zsnavzhVPLccqlNdnR7cZFzh
         mqz5a2wA7OwUw3ZqaKTKRhdfYQ58EMF9PduF8zqFt+lYIoXmFkanCPMiR+YGyqp0QpKa
         VCAGZZMzRn9Z44d2lmDGr4ivNuJUsxH9hQ907v3WYLTI2B1EEhHUWFSFDdaCWqjgXArD
         fmfCShSsAHzH781dxJxOeZmyJZcPDtT8yb2ULnthWLY2wSWQZHs+kVxFXTiP9t6oRtL8
         0XO21AsCrDXnalOY/kCirUInemzqL8YEKQC1JgUCD0Yq9+96C5sxWimgjYK4NpnyWLRF
         W3Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=Oe5IS3I/wACL2TPR5PPlWs+2TxHinGRcyfSX6KcA8XE=;
        b=gcLUSir8lw1Y9YwgQr9ZvUbFZFgY3wufWvnns1wUEFYKvDte7gvohzv03EcFksKh7C
         yprTFI3LDBSG+0Dp9sEWW2aCg8cN6ZC3m4cLiNePymGVdKREuOsddtxbfaVe76TspZcK
         rL5yVvgXp9xzrhDFL5QLGfx2UxpVpjiTPU6xA=
In-Reply-To: <20160429221606.GE19428@n2100.arm.linux.org.uk>
Sender: linux-mmc-owner@vger.kernel.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, Shawn Lin <shawn.lin@rock-chips.com>, Adrian Hunter <adrian.hunter@intel.com>, Stefan Agner <stefan@agner.ch>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@marvell.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree-spec@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Venu Byravarasu <vbyravarasu@nvidia.com>, Lars-Peter Clausen <lars@metafoo.de>, Jon Hunter <jonathanh@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <p>

Hi,

On Fri, Apr 29, 2016 at 3:16 PM, Russell King - ARM Linux
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

As I tried to indicate in earlier emails, I don't actually care how
grub works in this case.  It was originally meant to illustrate the
other people's workflows and mine are not the same.  If they have a
solution that works for them, that's great.

I want my MMC and MMCBLK device numbers to be sane and consistent to
help me parse through dmesg and sysfs.  If it happens to also make it
easy / possible to specify a root filesystem using "mmcblkN" that's
great and I'll probably take advantage of that.

I'm very sorry if those using SATA and ATA disks don't have a way to
get sane and consistent device number ordering.  I really am.  ...but
just because they don't have a well defined ordering doesn't mean
those of us using MMC should have to suffer.  ...and I don't think
giving a sane ordering to MMC devices hurts anyone, does it?

-Doug
