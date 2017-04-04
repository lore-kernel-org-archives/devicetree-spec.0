From: Waldemar Rymarkiewicz <waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dtc fails to compile <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>
Date: Tue, 4 Apr 2017 09:50:53 +0200
Message-ID: <CAHKzcENOuF8sUh=P=MX=YWZ6z-dS0fDQKLxoovL1emG1wD2TLA@mail.gmail.com>
References: <CAHKzcENCdMSxnUC1Ruv5-3hH+y4zpw_8O17_-yutWotLK5GjBw@mail.gmail.com>
 <CAL_JsqKWCKoeFfUPTZ59j3f2mxma+EKu617c3ArOiy-ezTHa+A@mail.gmail.com>
 <CAHKzcEMwb4VMzq-T+b6JwP2UL+VGiTsbj75_Lgz4=v670Huuxg@mail.gmail.com>
 <CAL_JsqKfamJFaWdvDNskp7+m-ihTZ4WxC4GbsVvHuYxv27gALw@mail.gmail.com>
 <CAHKzcEPcEz_vNU7Y6Pm=LkbK+Mk0m6X_z2-K9nTrdaqMVxvUyg@mail.gmail.com> <CAL_JsqKx4jxDsQNoZ+UB4FNKNTfo5Gzi89KQa2j9J9OeSyJN2w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=fyacm3WCv1S2nI3VogyLiKTh+Rj/dDe7mVSmM4P+LKc=;
        b=Typxv+VKbJ+YSUaLKN814bO2Vb/qzgeOr1y+jNzVHGBRPQx1CNHzFjeQ7CC8yZBzCK
         j46jN3WI7I6f57lk3QesnOiMnTxpPPyjv3xelwxoVqUr+89WWenj9yjeAty9edlC4FZF
         PB9njssj5D+/yfu3OVLmBhlebzBoLAGkwAOxsBytrMxIJgZMfZccnEybMYUhQb2wJ4rX
         xRFvPgYyXK7wmRDZXU1BcvnRYsDIUnFkUwcZCLSDY8OBoEEe7w+yX2AOM4in0vxTR33L
         UGK2GrRTtnb0WqbPoLF836eD+RTZijTha/qs5bZF2eA2efq9wlcpN7AGT05m7BqHMt/Q
         /dZQ==
In-Reply-To: <CAL_JsqKx4jxDsQNoZ+UB4FNKNTfo5Gzi89KQa2j9J9OeSyJN2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 3 April 2017 at 14:55, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Apr 3, 2017 at 6:25 AM, Waldemar Rymarkiewicz
> <waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 31 March 2017 at 18:31, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Fri, Mar 31, 2017 at 3:25 AM, Waldemar Rymarkiewicz
>>> <waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> On 30 March 2017 at 17:39, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>>> On Thu, Mar 30, 2017 at 4:20 AM, Waldemar Rymarkiewicz
>>>>> <waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I build DT for thermal zone according to
>>>>>>
>>>>>> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/thermal/thermal.txt#L261
>>>>>>
>>>>>> but dtc (DTC 1.4.1-g53bf130b) fails with syntax error.
>>>>>>
>>>>>>     Error: ../dts/xrx500.dtsi:1060.14-15 syntax error
>>>>>>     FATAL ERROR: Unable to parse input tree
>>>>>>
>>>>>> The problem is with cooling-device property
>>>>>>
>>>>>>       cooling-maps {
>>>>>> 295                         map0 {
>>>>>> 296                                 trip = <&cpu_alert0>;
>>>>>> 297                                 cooling-device =
>>>>>> 298                                     <&cpu0 THERMAL_NO_LIMIT
>>>>>> THERMAL_NO_LIMIT>;
>>>>>> 299                         };
>>>>>> 300                 };
>>>>>>
>>>>>> if I use phandle like <&cpu0> it compiles but  <&cpu0 THERMAL_NO_LIMIT
>>>>>> THERMAL_NO_LIMIT>; fails.
>>>>>>
>>>>>> What could be a reason? any hint ?
>>>>>
>>>>> Did you run it thru the C preprocessor first? Simple #defines are
>>>>> supported in dts files, but you have to use the C preprocessor before
>>>>> passing to dtc. The builds of dts files in the kernel tree do this for
>>>>> you.
>>>>
>>>> Yes,  but preprocessor does not resolve  THERMAL_NO_LIMIT which is
>>>> located in include/linux/thermal.h as far as I can see.
>>>
>>> That's by design. dts files should only include include/dt-bindings/*
>>> as they are part of the ABI.
>>
>> So, why does dtc fails on  THERMAL_NO_LIMIT if this is defined in
>> include/dt-bindings/thermal/thermal.h?
>
> It is and there are there are lots of users in the tree that all
> compile. Maybe something mips specific is not picking up the include
> path?

Indeed, I see it now :) Many thanks for helping me to understand this better.

Waldek
