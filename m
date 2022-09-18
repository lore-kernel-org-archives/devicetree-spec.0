From: Doug Berger <opendmb@gmail.com>
Subject: Re: [PATCH 16/21] dt-bindings: reserved-memory: introduce
 designated-movable-block
Date: Sun, 18 Sep 2022 16:12:46 -0700
Message-ID: <b4b2b4c6-52b6-80f0-5db3-7f7b751989c3@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-17-opendmb@gmail.com>
 <20220914145506.GA2149379-robh@kernel.org>
 <57f19774-39a1-03a6-fe68-83d7e4b16521@gmail.com>
 <07d87203-6fe1-c612-cb79-9080e1988454@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wvpTcnm9RKL2tVJ7oiw7DzzogtB5Fx17ivWfAb5DiHk=;
        b=pIdlRpQZD72JzZQzd8zbwuHyDbJRHFMvWAv5gP+k+WwO8xw3oaK80SdBXSp45NQ8A8
         17+8exKn9YgZp/XPYbF5IWrbRmqwm0NkF4RdcZbFX7f4IlJGcfEp9vLyAZZyhR5X4HOc
         0KrJ5FHH0Fk1WyA/c68RkUNw64+kwK4rFSekJTY598YL26NCUzTDQb4PAyqfSdi3lcoY
         mLTLlsNdhXMvlOyQKoDvMDI4cUCXpPL+naM1oRj5NwaTTv2gdsoq5lHqSJxxlgC7/MGa
         uPWNE92LE6Y1bYd95KARHfoPM/2mbOyxZ+o8LysfcPu5XwXIOxZCXMf+vSpS78Eqsc33
         aydw==
Content-Language: en-US
In-Reply-To: <07d87203-6fe1-c612-cb79-9080e1988454@linaro.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <songmuchun@bytedance.com>, Mike Rapoport <rppt@kernel.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Florian Fainelli <f.fainelli@gmail.com>, David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>, Hari

On 9/18/2022 3:31 AM, Krzysztof Kozlowski wrote:
> On 14/09/2022 18:13, Doug Berger wrote:
>> On 9/14/2022 7:55 AM, Rob Herring wrote:
>>> On Tue, Sep 13, 2022 at 12:55:03PM -0700, Doug Berger wrote:
>>>> Introduce designated-movable-block.yaml to document the
>>>> devicetree binding for Designated Movable Block children of the
>>>> reserved-memory node.
>>>
>>> What is a Designated Movable Block? This patch needs to stand on its
>>> own.
>> As noted in my reply to your [PATCH 00/21] comment, my intention in
>> submitting the entire patch set (and specifically PATCH 00/21]) was to
>> communicate this context. Now that I believe I understand that only this
>> patch should have been submitted to the devicetree-spec mailing list, I
>> will strive harder to make it more self contained.
> 
> The submission of entire thread was ok. What is missing is the
> explanation in this commit. This commit must be self-explanatory (e.g.
> in explaining "Why are you doing it?"), not rely on other commits for
> such explanation.
> 
>>
>>>
>>> Why does this belong or need to be in DT?
>> While my preferred method of declaring Designated Movable Blocks is
>> through the movablecore kernel parameter, I can conceive that others may
>> wish to take advantage of the reserved-memory DT nodes. In particular,
>> it has the advantage that a device can claim ownership of the
>> reserved-memory via device tree, which is something that has yet to be
>> implemented for DMBs defined with movablecore.
> 
> Rephrasing the question: why OS memory layout and OS behavior is a
> property of hardware (DTS)?
I would say the premise is fundamentally the same as the existing 
reserved-memory child node.

I've been rethinking how this should be specified. I am now thinking 
that it may be better to introduce a new Reserved Memory property that 
serves as a modifier to the 'reusable' property. The 'reusable' property 
allows the OS to use memory that has been reserved for a device and 
therefore requires the device driver to reclaim the memory prior to its 
use. However, an OS may have multiple ways of implementing such reuse 
and reclamation.

I am considering introducing the vendor specific 'linux,dmb' property 
that is dependent on the 'reusable' property to allow both the OS and 
the device driver to identify the method used by the Linux OS to support 
reuse and reclamation of the reserved-memory child node.

Such a property would remove any need for new compatible strings to the 
device tree. Does that approach seem reasonable to you?

> 
> Best regards,
> Krzysztof
Thanks again for taking the time,
-Doug
