From: Krzysztof Kozlowski <krzysztof.kozlowski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: Add Google Widevine initialization
 parameters
Date: Mon, 18 Sep 2023 14:03:50 +0200
Message-ID: <fc490ab8-dd72-e167-113e-c9d09b19c536@linaro.org>
References: <20230908101539.2622864-1-yich@google.com>
 <2ec056f3-e8a8-c5f3-b132-4b9d2beb616e@linaro.org>
 <CABOkjxJpcOUyyh9vjRuqrhmd=EdQdnyyuBX-++0R+UdENfqw9A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree+bounces-1075-gldd-devicetree-discuss-3=m.gmane-mx.org-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695038632; x=1695643432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J9ogOyEVxhw+nJiEoimMLZtN9S82zPQWJ0XXUiWbUVk=;
        b=G5s4rNEAMgVwENUq/aUJM26G0dGclr155UHwhkZP95mW1aL7LquZq1BgcGY37EVPwK
         hCP7CBBoV2ypaj98d7NV+fS3WXNFhOxl5nTaXMhopONO0h8qJVu1S6qlE9UAXpY5uMas
         iDAY2bE5YB+9s0rjOoLcvz+lEqnaKnYFAoybJKaPQbBw/kSwZHem4BjHqTtrDyBMgwNf
         UOdE0Ycs8SNeIG+ZgEelAuKKj+jzMFKmjgDMwAGBuWx1wAGSolRtNx8mnCT06Q9GpTmK
         2ATJ/9JmoN1O7Yjc3MFoACiGTYfSyMjADcQf8DAfieRBXwziePBaysgDYSTjnH7VSneg
         RQbQ==
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
In-Reply-To: <CABOkjxJpcOUyyh9vjRuqrhmd=EdQdnyyuBX-++0R+UdENfqw9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Type: text/plain; charset="windows-1252"
To: Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, chenyian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jkardatzke-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

On 18/09/2023 06:20, Yi Chou wrote:
> On Sun, Sep 17, 2023 at 4:40=E2=80=AFPM Krzysztof Kozlowski
> <krzysztof.kozlowski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>
>> On 08/09/2023 12:15, Yi Chou wrote:
>>> The necessary fields to initialize the widevine related functions in
>>> OP-TEE.
>>>
>>> Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>>> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> ---
>>>  .../bindings/options/google,widevine.yaml     | 124 ++++++++++++++++++
>>>  1 file changed, 124 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/options/google,wi=
devine.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/options/google,widevine.=
yaml b/Documentation/devicetree/bindings/options/google,widevine.yaml
>>> new file mode 100644
>>> index 0000000000000..bf2b834cb1454
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/options/google,widevine.yaml
>>
>> There is no such hardware as "options". What is this supposed to be for?
>> firmware?
>=20
> These DT fields would not be consumed by the OS.
> https://www.spinics.net/lists/devicetree-spec/msg01195.html
> The previous discussion tended to use the "options" node.
> Do we have any better place for these widevine related fields?

I'll let Rob comment on this in such case.

>=20
>>
>>> @@ -0,0 +1,124 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/options/google,widevine.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Google Widevine initialization parameters.
>>
>> This is a title, drop full stop.
>=20
> Got it, will be fixed in the next patch.
>=20
>>
>>> +
>>> +maintainers:
>>> +  - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.=
org>
>>> +  - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> +
>>> +description:
>>> +  The necessary fields to initialize the widevine related functions in
>>> +  OP-TEE. This node does not represent a real device, but serves as a
>>> +  place for passing data between firmware and OP-TEE.
>>> +  The public fields (e.g. tpm-auth-public-key & root-of-trust-cert) can
>>> +  be ignored because it's safe to pass the public information with the
>>> +  other methods(e.g. userland OP-TEE plugins).
>>
>> Then why isn't this a property of optee node?
>=20
> Are you talking about the /firmware/optee node?
> If I understand correctly, that node was talking about how the kernel
> communicates with the OP-TEE.
> But what we are doing here is passing some secrets from trusted
> firmware into OP-TEE, and the data would not go through the linux
> kernel.
> I'm not sure if it is a good idea to mix two different purpose fields
> in the same node...
>=20
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: google,widevine
>>
>> From the description I have no clue what is "widevine". The more
>> surprising is to see it as "not hardware" but having its node and
>> compatible, like it was a hardware node.
>=20
> We already have a "chosen" node that is "not hardware" in the DT.
> Should we just remove the compatible field from this node?
>=20
> BTW, Widevine is a digital rights management (DRM) system to make sure
> the video stream can only be decoded on the valid devices.

Then describe it in the description.

Best regards,
Krzysztof


