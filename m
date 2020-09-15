From: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/3] Add details of UEFI interaction with /memory and
 /reserved-memory
Date: Tue, 15 Sep 2020 18:11:51 +0100
Message-ID: <20fad81e-e21d-408c-f0fd-f59f11fe7766@arm.com>
References: <20200915170455.32520-1-grant.likely@arm.com>
 <20200915170455.32520-3-grant.likely@arm.com>
 <CAMj1kXGQTbU5uxPSsePxDTZrdeAvOf8Ev0iNmAHDcAoP_SYdHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q30Xwi58j2yDA25iOC0Fd+sFpO0+W4091Z2wmxOblpU=;
 b=ZpAoQRFwL8Cap1iPYgDztVhADUypyHXY7LRXpIkYE9cdfGi7D7rTvUMENSphFa7sIYGvHgP0QMRkeKX91hYyTuGo+McU3uB2f8iivTmD5GYaHTmEeddsjwG6AoQAadTTVWxlY65tfKNbHKnPYQZMGkVbzWhlIdCjz7Vo67qflQI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q30Xwi58j2yDA25iOC0Fd+sFpO0+W4091Z2wmxOblpU=;
 b=ZpAoQRFwL8Cap1iPYgDztVhADUypyHXY7LRXpIkYE9cdfGi7D7rTvUMENSphFa7sIYGvHgP0QMRkeKX91hYyTuGo+McU3uB2f8iivTmD5GYaHTmEeddsjwG6AoQAadTTVWxlY65tfKNbHKnPYQZMGkVbzWhlIdCjz7Vo67qflQI=
In-Reply-To: <CAMj1kXGQTbU5uxPSsePxDTZrdeAvOf8Ev0iNmAHDcAoP_SYdHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ard Biesheuvel <ardb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nd <nd-5wv7dgnIgG8@public.gmane.org>, Leif Lindholm <leif-e2DmVA6dwcVWk0Htik3J/w@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>



On 15/09/2020 18:09, Ard Biesheuvel wrote:
> On Tue, 15 Sep 2020 at 20:06, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org> wrote:
[...]
>> +Memory Reservation Block and UEFI
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +As with the ``/reserved-memory`` node (section :ref:`sect-reserved-memory-uefi`),
>> +when booting via [UEFI]_ entries in the Memory Reservation Block must also be
>> +listed in the system memory map obtained via the GetMemoryMap() to protect against
>> +allocations by UEFI applications.
>> +The memory reservation block entries should be listed with type
>> +``EfiBootServicesData``.
>> +
> 
> Didn't we just agree this should be EfiReservedMemoryType ?

That would be 
I-made-the-change-but-neglected-to-git-commit--amend-the-patch kind of 
error. Oops!

g.

