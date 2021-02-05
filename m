From: Rob Herring <rob.herring-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Node name & property name collusion - json/yaml implications
Date: Fri, 5 Feb 2021 11:25:36 -0600
Message-ID: <65e8549e-2c90-903a-ed70-a1bda1a02af7@arm.com>
References: <C008DF92-364E-4892-A1C0-68A2C97BE946@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvicQjmizgepz5POLbI8qhaeP8ysL8sCIb2gqvFrFXc=;
 b=JL+CiS4AkE+bUdzzgULmOzJzBspAmKNIJS+Y945axrGYBAf/sUQB8G6XzeOpBR+CyApyXioo8lv7dSQLfPdDGhdb5/DKm2SpkiK+T9BPDtd/fCcZs68mxeh1iPDnGDp2FLgUHAXkvMYauxYaTJHwOpDnJTpcboFkJNCuJaGtK2c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvicQjmizgepz5POLbI8qhaeP8ysL8sCIb2gqvFrFXc=;
 b=JL+CiS4AkE+bUdzzgULmOzJzBspAmKNIJS+Y945axrGYBAf/sUQB8G6XzeOpBR+CyApyXioo8lv7dSQLfPdDGhdb5/DKm2SpkiK+T9BPDtd/fCcZs68mxeh1iPDnGDp2FLgUHAXkvMYauxYaTJHwOpDnJTpcboFkJNCuJaGtK2c=
In-Reply-To: <C008DF92-364E-4892-A1C0-68A2C97BE946-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Bolivar, Marti" <Marti.Bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>, Grant Likely <Grant.Likely-5wv7dgnIgG8@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 2/5/21 6:57 AM, Kumar Gala wrote:
> There=E2=80=99s an old thread about this from 2016:
>
> https://www.spinics.net/lists/devicetree-spec/msg00296.html
>
> In which its clearly stated that node names and property names technicall=
y can be the same.  However, as we=E2=80=99ve starting utilizing tooling li=
ke JSON for validation, does it make sense to maintain this and should we u=
pdate the specification to require that a node name and property name at th=
e same hierarchy in the tree is not allowed?
>

IMO, yes. We are effectively doing that already given some of the
tooling doesn't really support it.

We've removed the few, rare cases in the kernel tree dts files.

> Otherwise we get into fun situations like, being valid DTS, but invalid Y=
AML, and various tools not working correct as the YAML loaders have to pick=
 one or there the other version of =E2=80=98foo=E2=80=99:
>
> [Example is from Marti]
>
> /dts-v1/;
> / {
>       foo;
>       foo {
>               bar =3D <0>;
>       };
> };
>
> (Using pyYAML)
>
> $ dtc -I dts -O yaml ./foo.dts | python -c 'import sys, yaml; print(yaml.=
safe_load(sys.stdin.read()))=E2=80=99
> [{'foo': {'bar': [[0]]}}]
>
> (Using ruamel, w/allow_duplicate_keys as dt-schema does)

That reminds me, I need to go turn that off.

>
> $ dtc -I dts -O yaml ./foo.dts | python -c 'import sys, ruamel.yaml; yaml=
 =3D ruamel.yaml.YAML(typ=3D"safe"); yaml.allow_duplicate_keys =3D True; pr=
int(yaml.load(sys.stdin.read()))=E2=80=99
> [{'foo': True}>
> - k
>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
