From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Device Tree Evolution Project - call notes - 12th February
Date: Wed, 19 Feb 2020 17:53:29 +0000
Message-ID: <20200219175329.GD7618@linaro.org>
References: <20200213145028.GR3697@linaro.org>
 <CAHFG_=VNst-6+rG8gHet8LwcE0H37YXvqMub71eqcoPu3_d7Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=2UvbS2J6qVOaSg4uBHLEqNJv2MH7ToWf9Wk0uqcuDZ8=;
        b=e5jJgALeTz75SoAcuKDXMgkdluXHjzc5CHZVn/8oBgHhYub4cD2IJC5I282fzPiw7n
         yvqeLhgEZ7T1QoAnN63fvooLLANdXQv/Ew6FiGzNSK5t2uXOIuGrQMRIgGGlwzVuth5T
         5keFD3W9b7kMuzL34quCSfYIVxek6gk34sm8/Aq8mIdhDWcXFYDpyewapDFbwZzEmmzi
         P87TgB6j/EiAcigw6OFfAhN36KqjUDVDVTEJTQDO9P24ICEFNAd5KKIZRngponRX/XJc
         /fIYmUcaiGQEWEE71RsOsLtHcVdDF941U2iDQ/bz2RWBHjfATf/C3johxU4+z5siNAog
         48Iw==
Content-Disposition: inline
In-Reply-To: <CAHFG_=VNst-6+rG8gHet8LwcE0H37YXvqMub71eqcoPu3_d7Rg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Francois Ozog <francois.ozog-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Hi Francois!

On Thu, Feb 13, 2020 at 04:23:35PM +0100, Francois Ozog wrote:
>On Thu, 13 Feb 2020 at 15:51, Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

...

>>       26. AB: When discussed moving years ago - discussed to put in
>>           separate directories out of tree. As long as still plan on
>>           moving them out. Don’t want to move them twice. If around
>>           the same time would do them together. First want to get
>>           agreement on overlays. Takes half a year. how many files?
>>       27. BM: think github is fairly complete or at least a good
>>           estimate. Covers only the boards we actively support.
>>       28. AB: RPi tree has around 300 overlays.
>>       29. RH: For TI is 12.
>>       30. BM: Beaglebone capes are not overlays. If a customer of TI
>>           invents own overlays - vendor should be “Customer X”, not
>>           TI. Is that aligned with your thinking?
>If we take the "responsibility" out of the picture, I would have
>thought those are overlays. Or shall we name them something like
>"composable DTBs" ?

Sorry, I'm not following you here. Maybe the notes aren't clear
enough, and my addled brain is struggling to remember exactly what was
said here. :-/

Cheers,
-- 
Steve McIntyre                                steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

