From: Marti Bolivar <marti.bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
Subject: Intended use of "model" property?
Date: Mon, 12 Sep 2022 13:18:08 -0700
Message-ID: <dfc5b413eba67844ae65b27e0f926451.marti.bolivar@nordicsemi.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nordicsemi.no;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TriZbwGALvGUuba0D7PGEFrdYCS4cB/Rql2JnLcBS3o=;
 b=V7mrunl9WyoHufN2qXO5gSgqaThsjj0esKNBX5ARrqLME0hubRiYDFLYpgKIBytwsFOkG9IesfFaxLSuoHbURpPI2okbI0Fyu77Y5HwYJTnqFRy3UJRbx/tJD5q6KgT0ErAWseOyItfqzn7fUBDcF5SFNcGkeNsVk2ONPdQJuow=
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="tis-620"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: galak-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org

I'm trying to understand the intended use of the model property
in DT spec v0.4-rc1 =C2=A72.3.2.

Specifically, can "model" be a property in any node of the devicetree?
The spec seems to indicate so, but grepping around the DTS files in
Linux, it seems to be primarily used as a property of the root node, as
a model name for the entire device.

There are a few exceptions in Documentation/devicetree/bindings/, but
they are mostly in sound/, so it's not clear to me whether this is the
"model" I'm referring to here, especially since that isn't present next
to "compatible", "reg", and friends in dt-schema/meta-schemas/core.yaml.

Is "model" in the =C2=A72.3.2 sense meant to be a property of the root node
only, or can it appear anywhere with the meaning defined there?

Thanks.
