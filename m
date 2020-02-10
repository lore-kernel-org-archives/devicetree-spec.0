From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Device Tree Evolution Project - call notes - 29th January
Date: Mon, 10 Feb 2020 18:30:51 +0000
Message-ID: <20200210183051.GC18978@linaro.org>
References: <20200130135605.GQ3697@linaro.org>
 <3b257f2a0ccc4f9f9ca0be2de8c9e382@ti.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vi5MacJ+vunHkQcSi6PLbZxJlgyhGIDU7UICpDpKhdM=;
        b=OmdOF0uV2YLhr79IV2DVOGLf/HhyAsFaPfcJbdLHVNxIpeSghrvY2rPpn4E6rc9tOU
         q1jkyd7pRv6a1Gp9UgXi7kBjbu+RSfSXEn0cBE4CdhtlG3u5A+T6BtQ/Ouz/ybvUXm5U
         +sPV87Uzlfhy03sf2Etz/ClpELT/GBCLUViTg2LAuQd7UkAnmWhEC/BrrvaOzgR/JA0y
         DUIzV4WiQBSeNl1nHsXbIpDyyxTDyEehZ8rYpns/Qtis4tKtiBKLFPjfXsefc68x/gwV
         LGY7s22hDwchxQBv//QQycROAKijTQFFauc43lUw2K6dntD3AL8R8/fxGEy845y2A717
         WsgA==
Content-Disposition: inline
In-Reply-To: <3b257f2a0ccc4f9f9ca0be2de8c9e382-l0cyMroinI0@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mills, William" <wmills-l0cyMroinI0@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Kristo, Tero" <t-kristo-l0cyMroinI0@public.gmane.org>, "Valkeinen, Tomi" <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, "Murphy, Dan" <dmurphy-l0cyMroinI0@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org" <tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

On Mon, Feb 10, 2020 at 04:58:26PM +0000, William Mills wrote:
>Steve,
>
>Can TI get on the agenda for this week's meeting?
>
>We have a simple approach to make progress on boot loader applied overlays.
>It is a small repo with just the overlays.
>It builds the dtb's from the upstream kernel repo and the overlays from this repo.
>We are going to do this at git.ti.com so we can make progress.
>However we would like to suggest this as a simple way forward to collectively host things the kernel maintainers do not want in the kernel.
>Does it make sense to host something like this in devicetree.org github account?

I think so, yes - I see Grant has already responded there.

>I think this is a very reasonable way forward and more practical than:
>* moving all DT's out of the kernel (or sync'ing two homes etc)
>* reworking overlay support to be the "one final good way"
>* everyone keeping this stuff in their own vendor trees, each doing something different and generating N solutions
>
>We will push the repo somewhere public before the meeting.

Cool. :-)

>(CC'ing Tom and Tony does not constituent their endorsement, we are starting to talk with them now also)

ACK!

Cheers,
-- 
Steve McIntyre                                steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

