From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Device Tree Evolution Project - call notes - 12th February
Date: Wed, 19 Feb 2020 18:05:34 +0000
Message-ID: <20200219180534.GE7618@linaro.org>
References: <20200213145028.GR3697@linaro.org>
 <cfbcee96-ac90-c482-1a36-b803d3e9ce2d@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=nlwNEph5FKtd1vCqYOUlofPd9HTzpDT8fOfr6jW7zyU=;
        b=S1lOptYqE6rvFysJqVVeQMyuTyucJnduumunFFe/YhEsJn7i40zGcs9/hwk6ENENwd
         I+aswzHM5UZYd969CCI2OLUO0d2cc7A3y0OiknDO2Xd4com9vGgj5Hu8rPkoh3aSqBhg
         QtVJ+GXllkiJ3Xjm3I+q7nlk1HZ3KVdefUb+d00UNH5fHJBrbvDCZNVy6VlwrHauX1Nc
         dRyNMWZ/Ci495foOhzxO3b4iPORd6PbaGihTU/isuPu31rFmhMC1lZPBQg2EEUVkYbFU
         g15coBAapt/wb3qbdQvEvSSDC6bU35AF4m3P47EjsMLIGDnzeBqaC2aB6RyCbIlH+u5Y
         dfMw==
Content-Disposition: inline
In-Reply-To: <cfbcee96-ac90-c482-1a36-b803d3e9ce2d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Hey Frank,

On Thu, Feb 13, 2020 at 11:24:59AM -0600, Frank Rowand wrote:
>On 2/13/20 8:50 AM, Steve McIntyre wrote:

...

>> 2. Bootloader applied overlays
>>    a. https://github.com/wmamills/dt-overlays
>>       1. BM: Good discussion on the list. Is this a new agreement on
>>          accepting overlays in the kernel? Is there still a laundry
>>          list of issues?
>>       2. RH: Whilst we agree it’s the right place last time it was
>>          submitted I gave feedback and it was never acted on. If
>>          splitting to base and overlays need a way to get back to what
>>          you previously had.
>>       3. BM: Do you want to mash base and overlays together. I think
>>          we tried to upstream that and it was rejected.
>>       4. RH: Just need to change DTB format first … (Frank)
>
>That matches my memory of wanting to update the DTB format before allowing
>overlay sources into the kernel tree.  BUT, it has been two years (I
>think) of small bursts of discussion about DTB format with little
>forward progress.  I had hoped to revive the DTB format discussion in
>December or January, but now it is already February.  Maybe I will get
>to it this month.
>
>The biggest change since then is that overlays can be applied by the
>bootloader (at least I think that was implemented after my objection).
>That alone is enough to change my opinion.  But on top of that, the
>long delay on DTB format update also changes my opinion.

Do you have any pointers to previous discussions about the format
update please? The only relevant things I can find are in the thread
"DTBO magic and dtbo format options" but that's back in the middle of
2016.

Cheers,
-- 
Steve McIntyre                                steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

