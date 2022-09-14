From: Doug Berger <opendmb@gmail.com>
Subject: Re: [PATCH 16/21] dt-bindings: reserved-memory: introduce
 designated-movable-block
Date: Wed, 14 Sep 2022 10:13:51 -0700
Message-ID: <57f19774-39a1-03a6-fe68-83d7e4b16521@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-17-opendmb@gmail.com>
 <20220914145506.GA2149379-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IYYxWUkQ4C0EsxoWOU79iFj20ViO8vkpHbae7xo5rcs=;
        b=Na0/xpW50l0p2LWBaIM/XHkvizf5pdNgEm4MPvDGNs4tfXsVzy3nI2WggDrVrrfbfR
         8vmNnBl+TiJloFytXKKx8ij7l7JHUAO5qqumCGMHz6gej+TwY2yY1uOnd6rQDW/onfEy
         mhfMenDe81IYCFu4mQwRrjZDNi+aIw2ZMXMs+lAyEOjSqv3xEgtOBhmny+WULZS0YZpw
         ZcZTsS7nWNzFQLBA2LcSPlF+DsEm3gxpzQ/M7fhQy4+5Bt/EF4tS+d1c9J4vprzq2WbL
         WOk5WKySaKYD+sBXvttDusj4zJ0fsKNQJHk9ppoZkcp4ZXt4nHQMWhY5rTa+LYvW5jK+
         LGIA==
Content-Language: en-US
In-Reply-To: <20220914145506.GA2149379-robh@kernel.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Herring <robh@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <songmuchun@bytedance.com>, Mike Rapoport <rppt@kernel.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Florian Fainelli <f.fainelli@gmail.com>, David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>, Hari

On 9/14/2022 7:55 AM, Rob Herring wrote:
> On Tue, Sep 13, 2022 at 12:55:03PM -0700, Doug Berger wrote:
>> Introduce designated-movable-block.yaml to document the
>> devicetree binding for Designated Movable Block children of the
>> reserved-memory node.
> 
> What is a Designated Movable Block? This patch needs to stand on its
> own.
As noted in my reply to your [PATCH 00/21] comment, my intention in 
submitting the entire patch set (and specifically PATCH 00/21]) was to 
communicate this context. Now that I believe I understand that only this 
patch should have been submitted to the devicetree-spec mailing list, I 
will strive harder to make it more self contained.

> 
> Why does this belong or need to be in DT?
While my preferred method of declaring Designated Movable Blocks is 
through the movablecore kernel parameter, I can conceive that others may 
wish to take advantage of the reserved-memory DT nodes. In particular, 
it has the advantage that a device can claim ownership of the 
reserved-memory via device tree, which is something that has yet to be 
implemented for DMBs defined with movablecore.

> 
>>
>> Signed-off-by: Doug Berger <opendmb@gmail.com>
>> ---
>>   .../designated-movable-block.yaml             | 51 +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/reserved-memory/designated-movable-block.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/reserved-memory/designated-movable-block.yaml b/Documentation/devicetree/bindings/reserved-memory/designated-movable-block.yaml
>> new file mode 100644
>> index 000000000000..42f846069a2e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reserved-memory/designated-movable-block.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/reserved-memory/designated-movable-block.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: /reserved-memory Designated Movable Block node binding
>> +
>> +maintainers:
>> +  - devicetree-spec@vger.kernel.org
>> +
>> +allOf:
>> +  - $ref: "reserved-memory.yaml"
>> +
>> +properties:
>> +  compatible:
>> +    const: designated-movable-block
>> +    description:
>> +      This indicates a region of memory meant to be placed into
>> +      ZONE_MOVABLE.
> 
> Don't put Linuxisms into bindings.
I will avoid ZONE_MOVABLE if this commit is included in V2 of this patch 
set.
> 
>> +
>> +unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reusable
>> +
>> +examples:
>> +  - |
>> +      reserved-memory {
>> +          #address-cells = <0x2>;
>> +          #size-cells = <0x2>;
>> +
>> +          DMB0@10800000 {
>> +               compatible = "designated-movable-block";
>> +               reusable;
>> +               reg = <0x0 0x10800000 0x0 0x2d800000>;
>> +          };
>> +
>> +          DMB1@40000000 {
>> +               compatible = "designated-movable-block";
>> +               reusable;
>> +               reg = <0x0 0x40000000 0x0 0x30000000>;
>> +          };
>> +
>> +          DMB2@80000000 {
>> +               compatible = "designated-movable-block";
>> +               reusable;
>> +               reg = <0x0 0x80000000 0x0 0x2fc00000>;
>> +          };
>> +      };
>> -- 
>> 2.25.1
>>
>>
Thank you for the review!
-Doug
