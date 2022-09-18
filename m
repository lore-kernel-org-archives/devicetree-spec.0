From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 16/21] dt-bindings: reserved-memory: introduce
 designated-movable-block
Date: Sun, 18 Sep 2022 15:41:38 -0700
Message-ID: <32303ffa-3f0c-5a83-fe97-69fca07c3b32@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-17-opendmb@gmail.com>
 <be75776d-c55a-ddce-81f3-aeacc2f29592@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=T3gVy8PY5F80NKzToZR+FbLhKAMIz93GHIgxt0CrUHc=;
        b=IdhMRMeVpLQC67KcBFbCc/Jk0NGq4dg7JkjAwoTSwVgFyHVLpmo57WQ2VAAFPSpOJR
         r/9qz+pdnTpAd4aPzMyGQSWik9rG81luFOikAvBJeo/smV0jCiTpWVQRbtdBD11hJ5k5
         l0DbhUSUT8rbGhN/x730+aAlpW9MR1K1+gYSN2IJK+rVK5hpDSv1JYkHcMi45dtuqGjR
         fSgMTT+gm/9mlBfp9hEjn7wRVetzg1vsIXa0ief0VysCXiH+e5dsCFW1G4DCBFE8A40K
         xr4IsApIfjEqUZLbzo/a9wIdVKrsR8252r9e6m7jTn8timZ9ipitjOxOwiqosjNzfFUQ
         jjIA==
Content-Language: en-US
In-Reply-To: <be75776d-c55a-ddce-81f3-aeacc2f29592-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Krzysztof Kozlowski <krzysztof.kozlowski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>, Hari Bathini <hbathini@li>

On 9/18/2022 3:28 AM, Krzysztof Kozlowski wrote:
> On 13/09/2022 20:55, Doug Berger wrote:
>> Introduce designated-movable-block.yaml to document the
>> devicetree binding for Designated Movable Block children of the
>> reserved-memory node.
>>
>> Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
> 
> Drop "binding"
> 
>> +
>> +maintainers:
>> +  - devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> +
>> +allOf:
>> +  - $ref: "reserved-memory.yaml"
> 
> Skip quotes
> 
>> +
>> +properties:
>> +  compatible:
>> +    const: designated-movable-block
>> +    description:
>> +      This indicates a region of memory meant to be placed into
>> +      ZONE_MOVABLE.
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
> 
> Use 4 spaces for example indentation.
> 
>> +          #address-cells = <0x2>;
>> +          #size-cells = <0x2>;
>> +
>> +          DMB0@10800000 {
> 
> The convention for node names is to use lowercase and generic node
> names, so just "dmb".
> 
> 
> 
> Best regards,
> Krzysztof
Thanks for taking the time to review and provide feedback on this patch.
-Doug
