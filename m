From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] interrupt-mapping: Fix parent interrupt specifier description
Date: Wed,  9 Aug 2017 16:28:24 -0700
Message-ID: <20170809232824.4959-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TjSuMIrWlwx+ib9eTOXqZZ3Z6sO4U7ynvXoo5uOeq1c=;
        b=dUooMU3AyNvuWiEO9y52II2q8SS3jYexcDO+flFsAuYLcp8g1Y62WE4HvOjsbJ8mA+
         4T0mvbl+H6ZkvNnIu7BxBmEU5YZajvIfwGACW7UfVukliEEO1ZO5z95cWHziWjdA3VSO
         t/wOYL/DRU+BsA0aALagYmVjN913+jWDILF9Y=
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The number of cells here is not dictated by the #interrupt-cells
property of this node, but the same property in the interrupt
parent. This looks like a copy/paste mistake from child interrupt
specifier.

Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gma=
ne.org>
---
 source/devicetree-basics.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
index df3d3c313574..02696bac15c7 100644
--- a/source/devicetree-basics.rst
+++ b/source/devicetree-basics.rst
@@ -1120,8 +1120,8 @@ Description:
    parent interrupt specifier
        The interrupt specifier in the parent domain. The number of 32-bit
        cells required to specify this component is described by the
-       *#interrupt-cells* property of this node=E2=80=94the nexus node con=
taining
-       the *interrupt-map* property.
+       *#interrupt-cells* property of the node pointed to by the
+       interrupt-parent field.
=20
    Lookups are performed on the interrupt mapping table by matching a
    unit-address/interrupt specifier pair against the child components in
--=20
2.7.4
