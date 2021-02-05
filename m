From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Node name & property name collusion - json/yaml implications
Date: Fri, 5 Feb 2021 06:57:54 -0600
Message-ID: <C008DF92-364E-4892-A1C0-68A2C97BE946@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :cc:to;
        bh=6Fa0T4Gfd1kI3EfAPubAlagP5BJ1z3zLh7UAzFHvJQ0=;
        b=xhp9+E0KamunzZjTprTfFc1twLUTf8cppCr6qUSzK1hmALX032HKLewPNy6X9kvH/8
         TtqN+yuXsLFOOCoe/30JRPpE3p4eiXoEfHzR8G+QZ9sMThsfuefLqC6zoO2i3+M/cNSs
         ZqGzbGPPVU7bD/5YTHAIdfTmeiYRYL5M/m8zs/KhSMd4almnmnGSxGyxySwmQ1re05Sz
         6DFwj8Oo3/LoXQ7P6Srbgk2unxRYF4KAqyeCMbqI0jzB0dcaX0WevNQnLLDvebvvhQeU
         DkxR/k1iMis3jk9dbzxQjZpce7pNvdhGk2/HdaAQlZaINv3f+ktCFbqjVCqag19FT3QM
         eX/w==
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Bolivar, Marti" <Marti.Bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>, Grant Likely <Grant.Likely-5wv7dgnIgG8@public.gmane.org>, Rob.Herring-5wv7dgnIgG8@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

There=E2=80=99s an old thread about this from 2016:

https://www.spinics.net/lists/devicetree-spec/msg00296.html

In which its clearly stated that node names and property names =
technically can be the same.  However, as we=E2=80=99ve starting =
utilizing tooling like JSON for validation, does it make sense to =
maintain this and should we update the specification to require that a =
node name and property name at the same hierarchy in the tree is not =
allowed?

Otherwise we get into fun situations like, being valid DTS, but invalid =
YAML, and various tools not working correct as the YAML loaders have to =
pick one or there the other version of =E2=80=98foo=E2=80=99:

[Example is from Marti]

/dts-v1/;
/ {
	foo;
	foo {
		bar =3D <0>;
	};
};

(Using pyYAML)

$ dtc -I dts -O yaml ./foo.dts | python -c 'import sys, yaml; =
print(yaml.safe_load(sys.stdin.read()))=E2=80=99
[{'foo': {'bar': [[0]]}}]

(Using ruamel, w/allow_duplicate_keys as dt-schema does)

$ dtc -I dts -O yaml ./foo.dts | python -c 'import sys, ruamel.yaml; =
yaml =3D ruamel.yaml.YAML(typ=3D"safe"); yaml.allow_duplicate_keys =3D =
True; print(yaml.load(sys.stdin.read()))=E2=80=99
[{'foo': True}]

- k=
