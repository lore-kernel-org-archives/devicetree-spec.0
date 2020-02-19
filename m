From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Device Tree Evolution Project - call notes - 12th February
Date: Wed, 19 Feb 2020 12:26:54 -0600
Message-ID: <6391cf01-ebf0-fcb7-9c86-679d335c16d2@gmail.com>
References: <20200213145028.GR3697@linaro.org>
 <cfbcee96-ac90-c482-1a36-b803d3e9ce2d@gmail.com>
 <20200219180534.GE7618@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AzmNRdrgGMipPGJeuOKft4BM2EPi6Q3siTmHwyqPMXk=;
        b=RWNiycYv/JS3wh2ImfHu/Gr73qmbHFqZxYAoj4gRvDWCweP8KbxRxt5qEJuOEQViRZ
         DTk3jKF2dE3W+ksuwFVcCRwEaj+zYy1+fFKKDZbkaycSaSLRtp3r8024XprhCyFKtJ+N
         Ct8Yw3KuBB7mdrP9S2+2JpVZfcfOyk+mF+QHE1oXma5kAFfs6GdKTGVCQnJwV8jlufgb
         HlMPNzarqKiYvV3OMdAprABP2nphnvxv9X0803oAdqt8c/ams0V+uKt0Du8k4RoUA8T6
         XIqfEH1WFe8TxVQoxZOfy9PX/7DHRqqbJOP5hDd6n0FkXtpLMiqkacqgfyPOIn4lqOi4
         jq7A==
In-Reply-To: <20200219180534.GE7618-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On 2/19/20 12:05 PM, Steve McIntyre wrote:
> Hey Frank,
> 
> On Thu, Feb 13, 2020 at 11:24:59AM -0600, Frank Rowand wrote:
>> On 2/13/20 8:50 AM, Steve McIntyre wrote:
> 
> ...
> 
>>> 2. Bootloader applied overlays
>>>    a. https://github.com/wmamills/dt-overlays
>>>       1. BM: Good discussion on the list. Is this a new agreement on
>>>          accepting overlays in the kernel? Is there still a laundry
>>>          list of issues?
>>>       2. RH: Whilst we agree it’s the right place last time it was
>>>          submitted I gave feedback and it was never acted on. If
>>>          splitting to base and overlays need a way to get back to what
>>>          you previously had.
>>>       3. BM: Do you want to mash base and overlays together. I think
>>>          we tried to upstream that and it was rejected.
>>>       4. RH: Just need to change DTB format first … (Frank)
>>
>> That matches my memory of wanting to update the DTB format before allowing
>> overlay sources into the kernel tree.  BUT, it has been two years (I
>> think) of small bursts of discussion about DTB format with little
>> forward progress.  I had hoped to revive the DTB format discussion in
>> December or January, but now it is already February.  Maybe I will get
>> to it this month.
>>
>> The biggest change since then is that overlays can be applied by the
>> bootloader (at least I think that was implemented after my objection).
>> That alone is enough to change my opinion.  But on top of that, the
>> long delay on DTB format update also changes my opinion.
> 
> Do you have any pointers to previous discussions about the format
> update please? The only relevant things I can find are in the thread
> "DTBO magic and dtbo format options" but that's back in the middle of
> 2016.

Documenting all the previous proposals in one place is the next item
on my todo list after finishing my "why I don't want .dts to move out
of the kernel tree" document.  Once the format discussion history
document exists then I intend to restart the discussion on the mail
lists.

-Frank

> 
> Cheers,
> 

