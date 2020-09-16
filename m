From: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/3] Clarify language on /memreserve/
Date: Wed, 16 Sep 2020 17:27:07 +0100
Message-ID: <27a6324c-ac27-fc3c-c935-e679d6eda646@arm.com>
References: <20200915170455.32520-1-grant.likely@arm.com>
 <389c3f6b-dc39-2b12-ebd4-034dc274e2f6@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKl73fSYIGtMM9Js3otXirURNHlQ+VBWLjf0qUk3jAs=;
 b=Nk01+zQXMC17RVk+12mb/l4pMgYr+XIabA9hA5cA47UwtpAmkV6zTMfJb/Jg0EnZqZqHp5c7b9M7GLLZV5gciQ4/rjWc7FO9aViZyQTIQO+hxrYfPsWqFUduKfjWqy0gwIkcNeK6PFWEQa5WjTNJCZ096oOwfFHLd+K0mq+xx9A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKl73fSYIGtMM9Js3otXirURNHlQ+VBWLjf0qUk3jAs=;
 b=Nk01+zQXMC17RVk+12mb/l4pMgYr+XIabA9hA5cA47UwtpAmkV6zTMfJb/Jg0EnZqZqHp5c7b9M7GLLZV5gciQ4/rjWc7FO9aViZyQTIQO+hxrYfPsWqFUduKfjWqy0gwIkcNeK6PFWEQa5WjTNJCZ096oOwfFHLd+K0mq+xx9A=
In-Reply-To: <389c3f6b-dc39-2b12-ebd4-034dc274e2f6-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: nd-5wv7dgnIgG8@public.gmane.org, Ard Biesheuvel <ardb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif-e2DmVA6dwcVWk0Htik3J/w@public.gmane.org>



On 15/09/2020 21:45, Heinrich Schuchardt wrote:
> On 9/15/20 7:04 PM, Grant Likely wrote:
>> The language was ambiguous. Rephrase and reformat to be more readable.
>>
>> Co-authored-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gman=
e.org>
>> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
>> Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>> ---
>>   source/chapter6-source-language.rst | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/source/chapter6-source-language.rst b/source/chapter6-sourc=
e-language.rst
>> index ed4e234..295fcd6 100755
>> --- a/source/chapter6-source-language.rst
>> +++ b/source/chapter6-source-language.rst
>> @@ -233,15 +233,23 @@ File layout
>>               [child nodes]
>>           };
>>
>> -The /dts-v1/; shall be present to identify the file as a version 1 DTS
>> +``/dts-v1/;`` shall be present to identify the file as a version 1 DTS
>>   (dts files without this tag will be treated by dtc as being in the
>>   obsolete version 0, which uses a different format for integers in
>>   addition to other small but incompatible changes).
>>
>> -Memory reservations define an entry for the devicetree blob=E2=80=99s m=
emory
>> -reservation table. They have the form: e.g., /memreserve/ <address>
>> -<length>; Where <address> and <length> are 64-bit C-style integers.
>> +Memory reservations (see section :ref:`sect-fdt-memory-reservation-bloc=
k`)
>> +are represented by lines in the form::
>>
>> -*  The / { }; section defines the root node of the devicetree.
>> +   /memreserve/ <address> <length>;
>>
>> -*  C style (/* ... \*/) and C++ style (//) comments are supported.
>> +Where ``<address>`` and ``<length>`` are 64-bit C-style integers, e.g.,
>> +
>> +.. code-block:: dts
>> +
>> +   /memreserve/ 0x10000000 0x0004000;
>=20
> +   /memreserve/ 0x10000000 0x00004000;
>=20
> The 28bit number looks strange here. Let's add another zero so that the
> number formats match (or remove the leading zeros).

Fixed, thanks.

g.

>=20
> Best regards
>=20
> Heinrich
>=20
>> +
>> +The ``/ { ... };`` section defines the root node of the devicetree, and
>> +all the device tree data is contained within it.
>> +
>> +C style (``/* ... \*/``) and C++ style (``//``) comments are supported.
>>
>=20
