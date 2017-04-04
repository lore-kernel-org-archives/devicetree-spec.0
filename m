From: Chris Arena <chris-he4hYjBaFPgS+FvcfC7Uqw@public.gmane.org>
Subject: Re: dtc fails to compile <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>
Date: Tue, 4 Apr 2017 13:38:09 -0400
Message-ID: <22317de6-0ebd-cb73-6ac7-50ac77c97b97@hallowell.com>
References: <CAHKzcENCdMSxnUC1Ruv5-3hH+y4zpw_8O17_-yutWotLK5GjBw@mail.gmail.com>
 <CAL_JsqKWCKoeFfUPTZ59j3f2mxma+EKu617c3ArOiy-ezTHa+A@mail.gmail.com>
 <CAHKzcEMwb4VMzq-T+b6JwP2UL+VGiTsbj75_Lgz4=v670Huuxg@mail.gmail.com>
 <CAL_JsqKfamJFaWdvDNskp7+m-ihTZ4WxC4GbsVvHuYxv27gALw@mail.gmail.com>
 <CAHKzcEPcEz_vNU7Y6Pm=LkbK+Mk0m6X_z2-K9nTrdaqMVxvUyg@mail.gmail.com>
 <CAL_JsqKx4jxDsQNoZ+UB4FNKNTfo5Gzi89KQa2j9J9OeSyJN2w@mail.gmail.com>
 <CAHKzcENOuF8sUh=P=MX=YWZ6z-dS0fDQKLxoovL1emG1wD2TLA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=hallowell.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+7r5HHdyBgWG+n/nk0M3/t+Wr11MS7mLOBrYhWw+GaY=; b=D5RPZoMCqk7zr2SHjiJHi35Zxe
        u3zNZE46c4ZJA0O94D8OZIgC1GVf9hocHUf+cvr0x42N7en6IROEN6xkRK8/p+Khj76Aoie4qArFS
        +h838zt+wv6iOAecXOLYOPiklMgqJS+jyNKmTdu8uQX507zRIYlA0hytwEPzfbxnUr0q+T3/derz+
        RYL165GPK2ozOF88lO4hyv1Pxs41ipPsblf4fI8UU57qC7js0/rMrlf6xR6bCyzIGjhHQRsVBF5Dm
        bvt8NqtonA4UwBrpZg6EmqzRp8l8dZyJtnouDPGYyFZB0KPVlnfkAoJeCXN+05uVV1sBsCvbjZoku
        YUPQJ 
In-Reply-To: <CAHKzcENOuF8sUh=P=MX=YWZ6z-dS0fDQKLxoovL1emG1wD2TLA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Waldemar Rymarkiewicz <waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>



On 4/4/17 3:50 AM, Waldemar Rymarkiewicz wrote:
> On 3 April 2017 at 14:55, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Mon, Apr 3, 2017 at 6:25 AM, Waldemar Rymarkiewicz
>> <waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 31 March 2017 at 18:31, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>> On Fri, Mar 31, 2017 at 3:25 AM, Waldemar Rymarkiewicz
>>>> <waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>> On 30 March 2017 at 17:39, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>>>> On Thu, Mar 30, 2017 at 4:20 AM, Waldemar Rymarkiewicz
>>>>>> <waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> I build DT for thermal zone according to
>>>>>>>
>>>>>>> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/thermal/thermal.txt#L261
>>>>>>>
>>>>>>> but dtc (DTC 1.4.1-g53bf130b) fails with syntax error.
>>>>>>>
>>>>>>>     Error: ../dts/xrx500.dtsi:1060.14-15 syntax error
>>>>>>>     FATAL ERROR: Unable to parse input tree
>>>>>>>
>>>>>>> The problem is with cooling-device property
>>>>>>>
>>>>>>>       cooling-maps {
>>>>>>> 295                         map0 {
>>>>>>> 296                                 trip = <&cpu_alert0>;
>>>>>>> 297                                 cooling-device =
>>>>>>> 298                                     <&cpu0 THERMAL_NO_LIMIT
>>>>>>> THERMAL_NO_LIMIT>;
>>>>>>> 299                         };
>>>>>>> 300                 };
>>>>>>>
>>>>>>> if I use phandle like <&cpu0> it compiles but  <&cpu0 THERMAL_NO_LIMIT
>>>>>>> THERMAL_NO_LIMIT>; fails.
>>>>>>>
>>>>>>> What could be a reason? any hint ?
>>>>>>
>>>>>> Did you run it thru the C preprocessor first? Simple #defines are
>>>>>> supported in dts files, but you have to use the C preprocessor before
>>>>>> passing to dtc. The builds of dts files in the kernel tree do this for
>>>>>> you.
>>>>>
>>>>> Yes,  but preprocessor does not resolve  THERMAL_NO_LIMIT which is
>>>>> located in include/linux/thermal.h as far as I can see.
>>>>
>>>> That's by design. dts files should only include include/dt-bindings/*
>>>> as they are part of the ABI.
>>>
>>> So, why does dtc fails on  THERMAL_NO_LIMIT if this is defined in
>>> include/dt-bindings/thermal/thermal.h?
>>
>> It is and there are there are lots of users in the tree that all
>> compile. Maybe something mips specific is not picking up the include
>> path?
> 
> Indeed, I see it now :) Many thanks for helping me to understand this better.
> 
> Waldek
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
Waldek,

Perhaps you could share what you found so that you won't leave us all
hanging here wondering how to fix problems such as this?

Chris

-- 
