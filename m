From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Revert change to fsl,mpc8641 example
Date: Wed, 20 Dec 2017 16:54:56 +0000
Message-ID: <CACxGe6vhkySi11o+jAEJFAjiA31QWQnEkggJpUvVNYVfWrquSw@mail.gmail.com>
References: <20171220112024.12303-1-grant.likely@arm.com> <CAL_Jsq+dMY7kvoB6JbG0iKG1RmsSP-zPArL5oJuXO00MeXL=Og@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=c78GEnYpSCmPVgDaxqxUV8HIY9B1X24VrbLnZ7JS7bE=;
        b=mA9ilZqncU5Rid8fJug0EO+9a35AiFsXzF5HP/xUh1UlZOCAg8r3f0afzDCh6PleXW
         n6wRofUI9+fmHZ+qRWPr80SnP0YYGufaazl5gGk/EeQey3mZmcrfWVkozhUGvz1zBluh
         elWQOnWBR4/Ad8UbNyWfLo2m/jC+O+gbr56s+25H+Opni5Kr1DDueVmgVh8IA2CakKA/
         z+z9YX/0KloQc+qElKuGxNopknq9SXhd0bGt+JWK92JDEx2lqLFjVwYopGY375QteGQb
         f5i3+3/duZpj2boxKvTKFu28q5GsMpWymetrihAXpExe5L9XBjzXmW2itqmYBlNHa1Bs
         lCew==
In-Reply-To: <CAL_Jsq+dMY7kvoB6JbG0iKG1RmsSP-zPArL5oJuXO00MeXL=Og-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, "Robert P . J . Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>

On Wed, Dec 20, 2017 at 3:35 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Dec 20, 2017 at 5:20 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> Commit 7d888a01, "Aesthetic/grammar fixes to first part of
>> devicetree-basics.rst" changed one of the Freescale compatible examples
>> from "fsl,mpc8641-uart" to "fsl,ns16550". However, there is value in
>> using examples from real hardware when possible, and to also show that
>> different strings (mpc8641-uart vs. ns16550) for a device is normal, so
>> revert that hunk.
>>
>> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
>> Cc: Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
>> ---
>>  source/devicetree-basics.rst | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
>> index f007a4b..1900cc8 100644
>> --- a/source/devicetree-basics.rst
>> +++ b/source/devicetree-basics.rst
>> @@ -469,10 +469,10 @@ Description:
>>
>>  Example:
>>
>> -   ``compatible = "fsl,ns16550", "ns16550";``
>> +   ``compatible = "fsl,mpc8641", "ns16550";``
>
> Missing the "-uart" part.

Well, that's embarrassing, and I've already cut the v0.2 release. :-(
That's what I get for trying to do last minute changes.

Oh well. I've posted a fixup and it will show up in v0.3

Cheers,
g.

>
>>
>>     In this example, an operating system would first try to locate a device
>> -   driver that supported fsl,ns16550. If a driver was not found, it
>> +   driver that supported fsl,mpc8641. If a driver was not found, it
>>     would then try to locate a driver that supported the more general
>>     ns16550 device type.
>>
>> --
>> 2.11.0
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
