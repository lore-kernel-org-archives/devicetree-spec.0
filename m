From: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Subject: Re: System DT - thinking a sprint would help
Date: Mon, 10 Feb 2020 11:17:35 +0000
Message-ID: <3a06abe9-b8b7-0157-d881-f5e19176fc2f@arm.com>
References: <20200206155907.GQ6796@tack.einval.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcXkZjFniY6dHcTLjZc0Ujhi1quhDEU+3OSu02WBzvU=;
 b=bewRHJ2bWBKeXHvHAii/h9FchSsm/Cjrre0uL9ckaRFWFPXa7C9GdpCpeSTVaEZwAi9AcE08Tssl3LwIPQUFFW9jaO9IV2KSTs57JO96l5wzv6qIPB0UFnvflM3PXM3z4naZ7I7qLmwlGfzDg2OdeeBXgwbRDDQIV5YFhJCCv7A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcXkZjFniY6dHcTLjZc0Ujhi1quhDEU+3OSu02WBzvU=;
 b=bewRHJ2bWBKeXHvHAii/h9FchSsm/Cjrre0uL9ckaRFWFPXa7C9GdpCpeSTVaEZwAi9AcE08Tssl3LwIPQUFFW9jaO9IV2KSTs57JO96l5wzv6qIPB0UFnvflM3PXM3z4naZ7I7qLmwlGfzDg2OdeeBXgwbRDDQIV5YFhJCCv7A=
In-Reply-To: <20200206155907.GQ6796-RWaXQMOneMVkKwkEErXb8g@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, system-dt-ZwoEplunGu1b+pB8xrm1Mtaxn9tAw+E3@public.gmane.org
Cc: Arnd Bergmann <arnd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <Rob.Herring-5wv7dgnIgG8@public.gmane.org>, Mark Brown <mark.brown-5wv7dgnIgG8@public.gmane.org>, Stefano Stabellini <stefanos-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>



On 06/02/2020 15:59, Steve McIntyre wrote:
> Hi all!
>
> [ tl;dr - we're trying to organise a sprint - see the end [...]
> > AFAICS we're geographically roughly split between US/Canada and
> Europe, so I'm thinking a week in either the US or Europe, some time
> in the next 2-3 months:
>
>   * Would a week before or after Connect work, in Europe (16th-20th
>     March, or 30th March to 3rd April)? I can look for options in the
>     UK easily, with maybe either Arm or Linaro hosting.

The week before isn't great, but the week after would work. I would want
to travel home over the weekend.

>   * Alternatively, a week's meeting in the US, deliberately avoiding
>     the Connect week so we don't wipe people out with travel: Maybe 2-6
>     or 9-13 March? Or push back into April if that's too short notice,
>     of course. Would Xilinx be able to host something for us, maybe? Or
>     another possibility might be the Linaro office in Nashua?

The 2nd-3rd could work for me. I may already be traveling to California
for this week to attend OCP Summit (4th-5th March) and the LF Member
Meeting 10th-12th.

g.
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
