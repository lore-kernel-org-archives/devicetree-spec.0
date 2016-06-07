From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [DTSpec PATCH] Add items to Devicetree Source Format chapter
Date: Tue, 7 Jun 2016 13:46:49 -0700
Message-ID: <575732B9.5040908@gmail.com>
References: <5751DA8F.2090708@gmail.com>
 <CAL_JsqKi9fOz3CEK-os8WE4BEuYi28METxWN0GMpW95wAXYFMg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=DQhs+IeHDxv2bGid+3QDF6wx5aI9SwuLsyC4DmSqLPE=;
        b=Jt/1l82Nh+z+Gv8H8YQjRaNp1yt+q/0Mmy56sPlJ1s1TcyZSDR2pCDAW2pfLQ3DiQl
         pzo+BWaZ6cXexnmA3C3ZssUemVixK1JR+HTOpJ6+dl6jQe65PLsWli3aw4ZrPskL2Sun
         ibDI010/Uj/8mP44XztZW/fGz66D6NXXrF13zMIh337cJA/NX9CcMU9vhlY9K3uaVjJA
         IlUgJYXhjWF7roIY2WGC/usbD9meevSMWzFUhxxHGx/sNl+6/H2fSw5/PY50oSGl5sv4
         6CdUn+gsUcp62k7AZYWC+jsVQVDFqJSG2kXB9bHvKrCC6iGJERrQLIRDVYR6zVaduzzV
         Vm4g==
In-Reply-To: <CAL_JsqKi9fOz3CEK-os8WE4BEuYi28METxWN0GMpW95wAXYFMg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 06/07/16 07:31, Rob Herring wrote:
> On Fri, Jun 3, 2016 at 2:29 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>>
>> Add items to Devicetree Source Format chapter
>>
>> - Add naming convention for DTS files and DTS include files
>> - Add /include/ compiler directive
>> - Add ";" to end of node definition
>> - Add /delete-node/ and /delete-property/
>> - Add arithmetic, bitwise, and logical expressions
>>
>> Note that cpp directives are not included in this patch, and
>> are not yet specified in this appendix.
>>
>> Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  source/source-language.rst |   60 ++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 59 insertions(+), 1 deletion(-)
>>
>> Index: b/source/source-language.rst
>> ===================================================================
>> --- a/source/source-language.rst
>> +++ b/source/source-language.rst

< snip >

>> +
>> +    Bitwise operators
>> +
>> +    &&   and
>> +    ||   or
> 
> Is this correct that these are not logical operators? From the dtc
> source in dtc-parser.y, it looks like both bitwise and logical ops are
> supported and XOR.

Thanks for catching that.  It was a thinko, plus I did not catch the XOR.
I also missed NOT and TERNARY.  New patch on the way.

> 
>> +
>> +::
>> +
>> +    Logical operators
>> +
>> +    <    less than
>> +    >    greater than
>> +    <=   less than or equal
>> +    >=   greater than or equal
>> +    ==   equal
>> +    !=   not equal
>> +
>>
>>  -  A 64-bit value is represented with two 32-bit cells. Example:
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
