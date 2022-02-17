From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: reserved-memory: Add restricted-dma-pool
 constraints
Date: Thu, 17 Feb 2022 16:20:27 +0000
Message-ID: <a0ddff19-9495-fa9f-5bec-b6658522c0bd@arm.com>
References: <79d1914ff04b44c3005072a990d14291c9ce6fce.1645103404.git.robin.murphy@arm.com>
 <CAL_JsqJh26LGyBH34y+68Jq0+NZEm86UfD4-u548YNz=AVYeug@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
In-Reply-To: <CAL_JsqJh26LGyBH34y+68Jq0+NZEm86UfD4-u548YNz=AVYeug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 2022-02-17 16:05, Rob Herring wrote:
> On Thu, Feb 17, 2022 at 7:10 AM Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>> The "restricted-dma-pool" definition prohibits combination with either
>> of the "no-map" and "reusable" properties, but this is only stated in
>> the description text. Add those constraints to the schema so we can
>> properly validate them.
>>
>> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
>> ---
>>   .../bindings/reserved-memory/shared-dma-pool.yaml   | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
>> index a4bf757d6881..01385581f663 100644
>> --- a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
>> +++ b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
>> @@ -56,6 +56,19 @@ properties:
>>         If this property is present, then Linux will use the region for
>>         the default pool of the consistent DMA allocator.
>>
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: restricted-dma-pool
>> +then:
>> +  not:
>> +    anyOf:
>> +      - required:
>> +          - no-map
>> +      - required:
>> +          - reusable
> 
> I think it is a bit clearer to disallow properties like this:
> 
> then:
>    properties:
>      no-map: false
>      reusable: false

Aha! I was sure there must be a better way, but couldn't see the wood 
for the trees, thanks!

Robin.

> 
> 
>> +
>>   unevaluatedProperties: false
>>
>>   examples:
>> --
>> 2.28.0.dirty
>>
