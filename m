From: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/3] Clarify language on /memreserve/
Date: Tue, 15 Sep 2020 18:04:54 +0100
Message-ID: <20200915170455.32520-1-grant.likely@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvx2OvoLh+ymepZwu43FCS/AmSoKiE1kIOnkcNLQMNk=;
 b=F52KDIWnvaJsypp1JM2UEAlDYkCZy0b8EoPd7puWfyMC6vEN7BXU78KqlsgqJGC6/8pX8BxcxeQuc/46oD8MNsih+7wtKYuEo3AS8oMar/rU8ySae4sE5eApcdVGCaw1NKIXY8fDWGyZpMzIRvpUi146l39GAbQNWpVTI2qUH08=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvx2OvoLh+ymepZwu43FCS/AmSoKiE1kIOnkcNLQMNk=;
 b=F52KDIWnvaJsypp1JM2UEAlDYkCZy0b8EoPd7puWfyMC6vEN7BXU78KqlsgqJGC6/8pX8BxcxeQuc/46oD8MNsih+7wtKYuEo3AS8oMar/rU8ySae4sE5eApcdVGCaw1NKIXY8fDWGyZpMzIRvpUi146l39GAbQNWpVTI2qUH08=
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: nd-5wv7dgnIgG8@public.gmane.org, Ard Biesheuvel <ardb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif-e2DmVA6dwcVWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

The language was ambiguous. Rephrase and reformat to be more readable.

Co-authored-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.o=
rg>
Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 source/chapter6-source-language.rst | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/source/chapter6-source-language.rst b/source/chapter6-source-l=
anguage.rst
index ed4e234..295fcd6 100755
--- a/source/chapter6-source-language.rst
+++ b/source/chapter6-source-language.rst
@@ -233,15 +233,23 @@ File layout
             [child nodes]
         };
=20
-The /dts-v1/; shall be present to identify the file as a version 1 DTS
+``/dts-v1/;`` shall be present to identify the file as a version 1 DTS
 (dts files without this tag will be treated by dtc as being in the
 obsolete version 0, which uses a different format for integers in
 addition to other small but incompatible changes).
=20
-Memory reservations define an entry for the devicetree blob=E2=80=99s memo=
ry
-reservation table. They have the form: e.g., /memreserve/ <address>
-<length>; Where <address> and <length> are 64-bit C-style integers.
+Memory reservations (see section :ref:`sect-fdt-memory-reservation-block`)
+are represented by lines in the form::
=20
-*  The / { }; section defines the root node of the devicetree.
+   /memreserve/ <address> <length>;
=20
-*  C style (/* ... \*/) and C++ style (//) comments are supported.
+Where ``<address>`` and ``<length>`` are 64-bit C-style integers, e.g.,
+
+.. code-block:: dts
+
+   /memreserve/ 0x10000000 0x0004000;
+
+The ``/ { ... };`` section defines the root node of the devicetree, and
+all the device tree data is contained within it.
+
+C style (``/* ... \*/``) and C++ style (``//``) comments are supported.
--=20
2.20.1

