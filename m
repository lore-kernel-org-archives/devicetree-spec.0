From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Node name & property name collusion - json/yaml implications
Date: Mon, 8 Feb 2021 10:07:39 -0600
Message-ID: <5A8C54CB-40F6-496D-B0E9-E70178A44189@linaro.org>
References: <C008DF92-364E-4892-A1C0-68A2C97BE946@linaro.org>
 <20210206071131.GA61463@yekko.fritz.box>
 <CAL_Jsq+e7JjDJTAkDJj_6bcc70QZSZ3cP8012TE7QEf3+sid3Q@mail.gmail.com>
 <CAK8P3a34jOEFo6YfW752bVjEkh4sVr1dnRU+Y0wW9r+9YHXrzg@mail.gmail.com>
 <CAL_JsqKxuN-3_2eMbmxnLGXCo2PjOVxqsn7RQqQwTdKg_sJLAg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ciGp+5WXIGV9c6jKBdnHfzUh58zQtWt2go2iyysDpB0=;
        b=znzf9XW9MCJKT07GVTfDJ+kIkXGMXyER2VyawN83L+L2kN6IxXXUUnzlvVat2vCtz/
         dFQ/PbaKJlOESUSc6z2KpS6UJepNIcVat6YM4OPt6bJeRNnSdtsBJVbtioNvhyyh5jbH
         OznJKASCltES+rlFEx4yelmKbxtG5SlBnh8GI91pZaymUsbxHYgSpsDoos4ZxMY0wLzQ
         IFtyS2uyDmBZkjVGmaeGjbDcGwbvxQwMnwM6jlvHhewFFZsZHC85j2gBGN9C48zT0T9X
         68YwhDnuJwp1AlaRuCo+vI8mYpmwIY6hviYsiWA/0T4EB9hZOC05wgy3ZtKrzcg2832b
         1yag==
In-Reply-To: <CAL_JsqKxuN-3_2eMbmxnLGXCo2PjOVxqsn7RQqQwTdKg_sJLAg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "Bolivar, Marti" <Marti.Bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>, Grant Likely <Grant.Likely-5wv7dgnIgG8@public.gmane.org>, Rob Herring <Rob.Herring-5wv7dgnIgG8@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



> On Feb 8, 2021, at 10:00 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>=20
> On Mon, Feb 8, 2021 at 9:47 AM Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>=20
>> On Mon, Feb 8, 2021 at 4:01 PM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>=20
>>> On Sat, Feb 6, 2021 at 1:26 AM David Gibson =
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>>>>=20
>>>> On Fri, Feb 05, 2021 at 06:57:54AM -0600, Kumar Gala wrote:
>>>>> There=E2=80=99s an old thread about this from 2016:
>>>>>=20
>>>>> https://www.spinics.net/lists/devicetree-spec/msg00296.html
>>>>=20
>>>> That is not the only case of this - IIRC old Apple machine device
>>>> trees had both an 'l2-cache' property and an 'l2-cache' node under
>>>> each CPU node.
>>>=20
>>> According to a dump I have, '/cpus/PowerPC,G4' has 'l2-cache' =
property
>>> and '/cpus/PowerPC,G4/PowerPC,G4' node has a node name of =
'l2-cache'.
>>> So this would actually work with yaml if we brought back explicit
>>> 'name' properties. But this highlights we've already diverged from
>>> OpenFirmware.
>>=20
>> For reference, the new Mac Mini has a "pmgr" node that has both
>> a property clpc=3D<0x3> and a child node named 'clpc'.
>=20
> That's the tip of the iceberg for the new Apple stuff. I have no
> interest in supporting a 3rd firmware interface as that is what it is.
> It may share some heritage with DT, but it's 15 years of Apple
> evolving their own thing in a vacuum.
>=20
> Rob

I agree with Rob here.  I don=E2=80=99t think we should contort the =
directions we want to take devicetree spec to an entity that is not =
engaged with the DT community.

- k=
