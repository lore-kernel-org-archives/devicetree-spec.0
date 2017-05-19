From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: Document optional "reserved-names" property
Date: Fri, 19 May 2017 16:59:38 -0700
Message-ID: <20d40be5-76d9-37e4-39e2-eaa9277ea2c8@gmail.com>
References: <20170509171847.27457-1-f.fainelli@gmail.com>
 <20170512235501.ziplwgevcjqyjims@rob-hp-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UFIRyv9BerJR11p7p9sfYMO3CgKLIcGMcGOZeWX1aFc=;
        b=emo6SdmmQ8tMJ1rXgjjlaIq0eShPXr680pOZiLsqNWMC3KTg0PGhcNmU3AobPJRiUZ
         90SBaakgocLNT1WziVxkEmWGfBvA0Mv987KREiSdPHRnlGsYUsagmM3FgT47XaDA19SQ
         MWx3EfH4f/k4YXvwBRqPa3r+W/VHckKIj4OAsepQ2uzRlZ1W0/eGYOsbVaWngD7Bipyy
         IxyJXIA+PftJRwbdGQ8NYcKdJWWV1IgabFaO+Sqx/s00plUJ11ixBagEtiirGcmOEqzf
         JRb18uNPkmo8dy6xPNsIdx5bFxF1kIKA3CZKjKoYhOWiumN09fw8q+5xagrO0JS/Tej2
         eskg==
In-Reply-To: <20170512235501.ziplwgevcjqyjims@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org

On 05/12/2017 04:55 PM, Rob Herring wrote:
> On Tue, May 09, 2017 at 10:18:47AM -0700, Florian Fainelli wrote:
>> Define an optional string property: "reserved-names" which can be used
>> by the client program to tag/identify reserved memory regions.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> index 3da0ebdba8d9..bd3c9485f637 100644
>> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> @@ -64,6 +64,10 @@ reusable (optional) - empty property
>>        system can use that region to store volatile or cached data that
>>        can be otherwise regenerated or migrated elsewhere.
>>  
>> +reserved-names (optional)
>> +    - Provides a named tag to the client program to help pretty print/identify
>> +      the reserved memory region.
> 
> *-names is normally on the client side. I'd like to keep that 
> consistent.
> 
> Second, I don't see the need for this. The compatible is not enough?

Sounds like you are right, compatible is good enough, thanks
-- 
Florian
