From: Sai Prakash Ranjan <saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] Add system-cache-controller to the list of generic node
 names
Date: Thu, 30 Sep 2021 09:36:42 +0530
Message-ID: <d9894ca86ed9a56ebf118a91bfe1b91d@codeaurora.org>
References: <20210929052613.8589-1-saiprakash.ranjan@codeaurora.org>
 <CAL_JsqLzDejj99C6CPuW+19cgwdDVkctppL_SFeWnAG5LUkscw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632974816; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kdB++8u5uUaWcte0gyVx8sj/xtUcaItO0wH5nkjb72g=;
 b=Es/t6HjqQyFwYDDpKjuPBUo6ifKFOKsp8eVfa2772Hp9jNBBTYfS1usvDYH/+qxqIZghfdWr
 +Qfmbek1Dt58o7sE75A/9KjBks/d+Am5AODo8KGM81iLdH44OrBADvLc0Rkp5Dpb0W+L1yHh
 gOhih0ZRIrjZVAv961eXdT1rC0M=
Sender: saiprakash.ranjan=codeaurora.org-qLvOmUbifpzLzYW4gMljz9i2O/JbrIOy@public.gmane.org
In-Reply-To: <CAL_JsqLzDejj99C6CPuW+19cgwdDVkctppL_SFeWnAG5LUkscw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

On 2021-09-29 18:12, Rob Herring wrote:
> On Wed, Sep 29, 2021 at 12:26 AM Sai Prakash Ranjan
> <saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> 
>> System Cache Controller (Last Level Cache Controller/LLCC) does not
>> have a cache-level associated with it as enforced by the already
>> existing 'cache-controller' node name, so add system-cache-controller
>> to the list of generic node names as decided on the lkml in [1][2]
>> and already being used in the dts for sometime now.
>> 
>> [1] 
>> https://lore.kernel.org/lkml/5dcd8588.1c69fb81.2528a.3460-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org/
>> [2] 
>> https://lore.kernel.org/lkml/cover.1573814758.git.saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org/
>> 
>> Cc: Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  source/chapter2-devicetree-basics.rst | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/source/chapter2-devicetree-basics.rst 
>> b/source/chapter2-devicetree-basics.rst
>> index 40be22192b2f..c06c5063c68b 100644
>> --- a/source/chapter2-devicetree-basics.rst
>> +++ b/source/chapter2-devicetree-basics.rst
>> @@ -276,6 +276,7 @@ name should be one of the following choices:
>>     * sram-controller
>>     * ssi-controller
>>     * syscon
>> +   * system-cache-controller
> 
> I don't want to encourage others to use this over 'cache-controller'
> and the standard binding.
> 

Right, but why would others use this over cache-controller? This is 
supposed
to be used only for last level cache controllers where there is no 
cache-level
associated with it like in the system cache controller/LLCC found in QTI 
SoCs.
Also you had acked the corresponding change in the DT binding for LLCC 
[1].

[1] https://lore.kernel.org/lkml/20191203172235.GA18507@bogus/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
