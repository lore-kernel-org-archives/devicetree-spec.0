From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [DTSpec PATCH] Create FAQ.md
Date: Wed, 25 May 2016 12:36:36 +0100
Message-ID: <1464176196-18056-1-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2s4mGxGMOnurNYoP9+vtkMJMpB0RGE5CUkKc/TIZnZU=;
        b=S2gLfTWBJbLu/h9rSjFLOOJdzVQeyDIM3IJrGHO2YSYz4rzYfffb88FlVMcNCWYElW
         3d5J0BDmCWcxYuBgOjTPSVpxT8kuWtDolVdH+t4yQaRmpiSdkbh8MCE9tU0KVlZKtzOD
         jRcmPjYd2mf0XxhF6AS1LSGRbxpWGo1k5s5rVkbZEwEanAETAIElq7NB3nXEo4WDX41H
         g+NsuRZuf1JayB5CyEJdrLwsAADpNEsNn/h7u0AtZEckFgMMRc1Ai+hUgLPl5ktNYLAm
         99TXRyi4qNFRDPEjvZGaiZ5omS2F78F/SnkDq28IbpR3gaiPw1xM5QXt7z/DMAlKgmUc
         LuYw==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Copy the FAQ from the website to the main repository so any developer c=
an update it.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 FAQ.md | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 FAQ.md

diff --git a/FAQ.md b/FAQ.md
new file mode 100644
index 000000000000..0d8a032cdc23
--- /dev/null
+++ b/FAQ.md
@@ -0,0 +1,45 @@
+# FAQ
+
+## Getting the Specification
+
+### Where can I find the latest version of the Devicetree Specificatio=
n
+
+You can always find the latest released, as well as all older releases=
,
+in our GitHub repository:
+
+[Devicetree Specification release repository](https://github.com/devic=
etree-org/devicetree-specification-released)
+
+### How often is a new specification released
+
+We're planning to make a v1.0 release by end of August, 2016,
+which will be up to date with current core DT bindings used by the Lin=
ux kernel.
+
+A second major release is planned for December 2016 to cover new featu=
res.
+
+## Governance
+
+### Do I need to be a member to comment and send patches for the Spec?
+
+No. Changes to the spec are proposed and discussed on a=20
+[public mailing list](http://vger.kernel.org/vger-lists.html#devicetre=
e-spec)
+and the source document is hosted in the
+[Devicetree Specification](https://github.com/devicetree-org/devicetre=
e-specification)
+project on GitHub.
+
+You can find details about the mailing list and submission process in =
the [Readme](README.md) file.
+
+### What will membership give me?
+
+Membership gives you a seat on Technical Steering Committee (TSC).=20
+The TSC is responsible for handling governance issues,=20
+managing the technical goals, release schedule,=20
+and helping to define vision for future versions of the spec.
+
+### How is Linaro and devicetree.org connected?
+
+Linaro kick started this process and is hosting devicetree.org under i=
ts organisation.=20
+[devicetree.org](http://devicetree.org) membership fees are associated=
 with devicetree.org
+only and not with Linaro membership.
+The membership proceeds go towards the defraying of Linaro=E2=80=99s c=
osts for hosting devicetree.org.
+
+If you have useful FAQs you would like to see here, please contact us =
through the mailing list
--=20
2.7.4
