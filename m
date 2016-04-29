From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 0/4] Patches to allow consistent mmc / mmcblk numbering
 w/ device tree
Date: Fri, 29 Apr 2016 14:56:38 -0700
Message-ID: <CAD=FV=VgQX_EVhUUCugzv+CZqjzTS8LwyeU5419aX9FbDnWJDg@mail.gmail.com>
References: <1461951139-6109-1-git-send-email-dianders@chromium.org>
	<20160429181248.GW19428@n2100.arm.linux.org.uk>
	<CAD=FV=VMxBYXOYOyHPeqcaWX7oU8pVrdLHOsWOWUgq-q5FshAw@mail.gmail.com>
	<20160429195741.GY19428@n2100.arm.linux.org.uk>
	<CAD=FV=UGyi0r3kDmc1cpcANTP-2u+7UEgW3r9kRvF2f8qcWH+g@mail.gmail.com>
	<20160429211328.GZ19428@n2100.arm.linux.org.uk>
	<CAD=FV=V8BOsO36eUOGAcXp04xCiN13UGG0Vaf2yhh1MQn85FjA@mail.gmail.com>
	<20160429212920.GA19428@n2100.arm.linux.org.uk>
	<CAD=FV=V9V8P=d59RX1eaAdVxJgMxub1F6hzQNw1QW+7t=3POBw@mail.gmail.com>
	<20160429215017.GC19428@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-mmc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=LqH8XOmJ1UX/GzvbsP0A1FkbctWwHu2WMEUE/w4/oeQ=;
        b=JeiTo0kuKE2yMZRHHl5dfFJi1G9gBvtgxWla32PEdcUadMWd7VhePSILGaAOSpj6Uw
         qFNcX/8SugWONhnfc0heO4rhf28lwplYjk+qEMCdys5eyHDvvlqSNlJZXRcz2rAU7qe1
         yl/RRV/U/P4Gna6ir41a+i75PjYdDyOmPifrRzhk4a2GrmOiMyJg3ju1LdM1Kx3Nrj0q
         7gNUAIK2+zL+2TAPbGOtzdhy2LGIQrua8wXqxRIkBPAbM0hrpf8j0MDd0o3IubiFXMRi
         WWQqu1xALTwc8f+BE0UoFytozycUnHv75bebAbIzafFtWQzR+NqsvZR9WiIJbSNZWPYz
         cZvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=LqH8XOmJ1UX/GzvbsP0A1FkbctWwHu2WMEUE/w4/oeQ=;
        b=J/n0Y0Dky61EsCmE8HOVyIMORlrCcz2N+qXFM7PAtUBFY9o/BOwNXxRXw39NsY5gfY
         5IgQKaCfkvPTSOTgB9yY1oTCz52/znvp1j2pjcNXlJpQubAt8oCnk8Zk+cN5VJ+uSccv
         BIdrhBBgO0mQUNGnMFpqREoMLQgGaKOXs996k=
In-Reply-To: <20160429215017.GC19428@n2100.arm.linux.org.uk>
Sender: linux-mmc-owner@vger.kernel.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, Shawn Lin <shawn.lin@rock-chips.com>, Adrian Hunter <adrian.hunter@intel.com>, Stefan Agner <stefan@agner.ch>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@marvell.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree-spec@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Venu Byravarasu <vbyravarasu@nvidia.com>, Lars-Peter Clausen <lars@metafoo.de>, Jon Hunter <jonathanh@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <p>

Russell,

On Fri, Apr 29, 2016 at 2:50 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Apr 29, 2016 at 02:39:35PM -0700, Doug Anderson wrote:
> [didn't read most of your reply]
>
>> Really I just reposted it several times because I notice that you seem
>> to ignore many points of my emails.  I was really hoping to get you to
>> address this point.  I notice that you still didn't.  Either you are
>> just trying to annoy me, or you don't have an answer to how my patch
>> series hurts you.
>
> I don't see you treating Rob with the same contempt that you have
> treated me in this thread, despite Rob and myself both telling you
> basically the same thing.

Rob wrote a nice thoughtful reply and I tried to give a nice
thoughtful reply back to him.  He raised some good points and I raised
some good points back to him.  I look forward to his future thoughts
on the topic.


-Doug
