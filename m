From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Node name & property name collusion - json/yaml implications
Date: Fri, 5 Feb 2021 11:28:12 -0600
Message-ID: <93C49B78-0675-45F8-82FE-FAC8EE1CC870@linaro.org>
References: <C008DF92-364E-4892-A1C0-68A2C97BE946@linaro.org>
 <65e8549e-2c90-903a-ed70-a1bda1a02af7@arm.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ULWDe7tUKckNUVVZeaTSwCm7lT3Q923ljTRGm37KqN0=;
        b=wBRPZ09rzGhLwVex4OZkXEYjELjVjI0JAUFkDbs8LRjeLsbCfWR3tu8Tn0Jfhc7v9s
         huidZiWFplCIPePKHTpbEm+CC5LkLpwLedP2YebVI0D74pH/Y9oJq8xxlA/3FY0SchS9
         fWmOEq6gR48VLaRHqSo9bgkuftrUVWq9qKIeuInZO376wXcxyQgYsY8QWND+Me8wRrSR
         j2vwu/0ex3TTghwDBl55t27k8bQf/jAEIA2FMni0RXKuffl7vLmMogxUyiF+eSrp/fIX
         4r/96O5WuLCoIwrU/HpFjDnYVKCnA0uhmhsGF1c+214+ZPoDsz8PHwKbpEXZm+mMKJ9O
         eXLA==
In-Reply-To: <65e8549e-2c90-903a-ed70-a1bda1a02af7-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rob Herring <rob.herring-5wv7dgnIgG8@public.gmane.org>
Cc: "Bolivar, Marti" <Marti.Bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>, Grant Likely <Grant.Likely-5wv7dgnIgG8@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



> On Feb 5, 2021, at 11:25 AM, Rob Herring <rob.herring-5wv7dgnIgG8@public.gmane.org> wrote:
>=20
> On 2/5/21 6:57 AM, Kumar Gala wrote:
>> There=E2=80=99s an old thread about this from 2016:
>>=20
>> https://www.spinics.net/lists/devicetree-spec/msg00296.html
>>=20
>> In which its clearly stated that node names and property names =
technically can be the same.  However, as we=E2=80=99ve starting =
utilizing tooling like JSON for validation, does it make sense to =
maintain this and should we update the specification to require that a =
node name and property name at the same hierarchy in the tree is not =
allowed?
>>=20
>=20
> IMO, yes. We are effectively doing that already given some of the
> tooling doesn't really support it.
>=20
> We've removed the few, rare cases in the kernel tree dts files.
>=20
>> Otherwise we get into fun situations like, being valid DTS, but =
invalid YAML, and various tools not working correct as the YAML loaders =
have to pick one or there the other version of =E2=80=98foo=E2=80=99:
>>=20
>> [Example is from Marti]
>>=20
>> /dts-v1/;
>> / {
>>      foo;
>>      foo {
>>              bar =3D <0>;
>>      };
>> };
>>=20
>> (Using pyYAML)
>>=20
>> $ dtc -I dts -O yaml ./foo.dts | python -c 'import sys, yaml; =
print(yaml.safe_load(sys.stdin.read()))=E2=80=99
>> [{'foo': {'bar': [[0]]}}]
>>=20
>> (Using ruamel, w/allow_duplicate_keys as dt-schema does)
>=20
> That reminds me, I need to go turn that off.

Was going to send you a patch to that, but sounds like you might get =
there first :)

>> $ dtc -I dts -O yaml ./foo.dts | python -c 'import sys, ruamel.yaml; =
yaml =3D ruamel.yaml.YAML(typ=3D"safe"); yaml.allow_duplicate_keys =3D =
True; print(yaml.load(sys.stdin.read()))=E2=80=99
>> [{'foo': True}>
>> - k

- k=
