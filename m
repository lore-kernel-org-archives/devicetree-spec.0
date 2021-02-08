From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Node name & property name collusion - json/yaml implications
Date: Mon, 8 Feb 2021 08:39:55 -0600
Message-ID: <9B77D509-0790-4210-9B24-24527A8743D8@linaro.org>
References: <C008DF92-364E-4892-A1C0-68A2C97BE946@linaro.org>
 <20210206071131.GA61463@yekko.fritz.box>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=2TCGewCbZTQkz+hcrZRvEzWQ1jxcEDRkYAdtt/B7OAg=;
        b=GgZi2b2Oekg7bdjBMz1BMKloWWwzewyX9I3Am069Klp4Kibb7RBn4lhO7Z6zAYmwZa
         Mie9sBn0hISXGgIm6lA7cRPSpOryANbKXLr+/L1QbsRAqbm7U7x5Bcaio9/g2FfOHza2
         cQnGtoa9FZtjqOX2rwvgzh4T0bILRH1IY/sJl1+p+hOOo/wckJv9W7Div69Vnu0nBBqX
         cUeDstFuENd02YGVGgkXpeSsryNx+ijYMlCMZDDmeV5cxUpUiIIpp5owFoznRxF5vplX
         3K+As1yg3lltEN3Gyt1N0xVbR/YswiS3GALlK/6VwMCHv9Klonh/S3/DwJ/1ujsy1TuK
         enVA==
In-Reply-To: <20210206071131.GA61463-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "Bolivar, Marti" <Marti.Bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>, Grant Likely <Grant.Likely-5wv7dgnIgG8@public.gmane.org>, Rob.Herring-5wv7dgnIgG8@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



> On Feb 6, 2021, at 1:11 AM, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
>=20
> On Fri, Feb 05, 2021 at 06:57:54AM -0600, Kumar Gala wrote:
>> There=E2=80=99s an old thread about this from 2016:
>>=20
>> https://www.spinics.net/lists/devicetree-spec/msg00296.html
>=20
> That is not the only case of this - IIRC old Apple machine device
> trees had both an 'l2-cache' property and an 'l2-cache' node under
> each CPU node.

Sure, but I assume this is an OpenFirmware machine, so does dts need to =
maintain support for it?

>=20
>> In which its clearly stated that node names and property names =
technically can be the same.  However, as we=E2=80=99ve starting =
utilizing tooling like JSON for validation, does it make sense to =
maintain this and should we update the specification to require that a =
node name and property name at the same hierarchy in the tree is not =
allowed?
>>=20
>> Otherwise we get into fun situations like, being valid DTS, but =
invalid YAML, and various tools not working correct as the YAML loaders =
have to pick one or there the other version of =E2=80=98foo=E2=80=99:
>>=20
>> [Example is from Marti]
>>=20
>> /dts-v1/;
>> / {
>> 	foo;
>> 	foo {
>> 		bar =3D <0>;
>> 	};
>> };
>>=20
>> (Using pyYAML)
>>=20
>> $ dtc -I dts -O yaml ./foo.dts | python -c 'import sys, yaml; =
print(yaml.safe_load(sys.stdin.read()))=E2=80=99
>> [{'foo': {'bar': [[0]]}}]
>>=20
>> (Using ruamel, w/allow_duplicate_keys as dt-schema does)
>>=20
>> $ dtc -I dts -O yaml ./foo.dts | python -c 'import sys, ruamel.yaml; =
yaml =3D ruamel.yaml.YAML(typ=3D"safe"); yaml.allow_duplicate_keys =3D =
True; print(yaml.load(sys.stdin.read()))=E2=80=99
>> [{'foo': True}]
>>=20
>> - k
>=20
> --=20
> David Gibson			| I'll have my music baroque, and my =
code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT =
_the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

