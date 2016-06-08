From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [DTSpec PATCH v2] Add items to Devicetree Source Format chapter
Date: Wed, 8 Jun 2016 10:40:27 -0700
Message-ID: <5758588B.400@gmail.com>
References: <57573377.4010001@gmail.com>
 <20160607235013.GP9226@voom.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=VLaLRQZiqY3n05OXmLPkNvbocVswIG0zqXPhpDmJApA=;
        b=SVNc8eAEaNkLywh0i3aAgpNhcevvy+gpT1yebu80pWkYpxe1u2ymAMJVh3ZwCzoVtS
         ygl3YOG7NUxZ9PHYDLWmn3ZNSCyLJyJCObs7b+KT1yuzhiVPzxhG8/OWE89mjuw9E8Ew
         kJsPVW+FeKj1cN4APj/arDAkPbr7fgUOfZbAz/3AjQHZM0wimsyzKqlpFIVN6DV8lKEC
         +LoQBLQTOcZAsT3hQ9A6SIZ+yUbIz6yCddh7DSoAbqIMK/dyYUC1cpXCl3KVBJpNxqwm
         +ck3sXZJPfuDiGwhVUrYaS6q5FcwT9zqS7gAw0WgP34z36EtKHGZDTnHtZPiLeOrXMuq
         gkcA==
In-Reply-To: <20160607235013.GP9226-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On 06/07/16 16:50, David Gibson wrote:
> On Tue, Jun 07, 2016 at 01:49:59PM -0700, Frank Rowand wrote:
>> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>>
>> Add items to Devicetree Source Format chapter
>>
>> - Add naming convention for DTS files and DTS include files
>> - Add /include/ compiler directive
>> - Add ";" to end of node definition
>> - Add /delete-node/ and /delete-property/
>> - Add arithmetic, bitwise, logical, and ternary expressions
>>
>> Note that cpp directives are not included in this patch, and
>> are not yet specified in this appendix.
>>
>> Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>> ---
>>
>> changes in v2
>>   - arithmetic operators "and", "or" were incorrectly listed as as bitwise
>>   - thus bitwise operators "and", "or" were incorrectly shown
>>   - "exclusive or" operator added
>>   - logical and arithmetic "not" operators added
>>   - ternary operator added
>>   - moved shift operators from arithmetic to bitwise
>>
>>
>>  source/source-language.rst |   70 ++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 69 insertions(+), 1 deletion(-)
>>
>> Index: b/source/source-language.rst
>> ===================================================================
>> --- a/source/source-language.rst
>> +++ b/source/source-language.rst
>> @@ -9,6 +9,19 @@ devicetree in the form expected by the k

< snip >

>> +    Logical operators
>> +
>> +    <    less than
>> +    >    greater than
>> +    <=   less than or equal
>> +    >=   greater than or equal
>> +    ==   equal
>> +    !=   not equal
>> +    &&   and
>> +    ||   or
>> +    !    not
> 
> Fwiw, I think &&, || and ! usually get classified as "logical
> operators" but <, > etc. get classified as "relational operators"
> rather than putting them in the same category.

Good point.  I'll send v3 with that change.


> Hrm.. given that you're listing them all here, I wonder if it would
> make sense to do so in precedence order (should be the same as for C).

That seems like a good idea, so I tried it.  The result is a lot less
readable to me.

< snip >
