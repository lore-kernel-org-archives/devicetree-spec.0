From: Kanta Vekaria <kanta.vekaria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Clarify use of mailing list
Date: Thu, 21 Jul 2016 14:57:04 +0100
Message-ID: <1469109424-2482-1-git-send-email-kanta.vekaria@linaro.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ss4iomI1jY9yeI1dnsFQgc+5/LiCBNVfz3VJFtJHb5I=;
        b=CJ1A/Fx85J1iLEbrXqHE6bbsA8yaTKmssyeRtwRDfp98AJzkDrexyUAp4XbG3Z0sAM
         aYoGAAXJNVXRgfojF4wl+MA+vL++I+wyUilHWYi2P/fqRfA7FoUFyumNzM14l5KuokR8
         mvaWFmLUKGrl2kNCgd5nCaD2F7EEAtvTSXDwA=
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: grunk-BIb/Zk+JBDab9/CCa1Sigw@public.gmane.org, daniel.buenzli-llsTEZYSXZwXXHkOk0aIfQ@public.gmane.org, kanta.vekaria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

- Create new mailing list section
- Add mailing list in contribution section

Signed-off-by: Kanta Vekaria <kanta.vekaria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 README.md | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index 8ff30c4..83a5188 100644
--- a/README.md
+++ b/README.md
@@ -2,12 +2,12 @@
 
 The latest release of the specification can be found at http://devicetree.org/ or https://github.com/devicetree-org/devicetree-specification-released
 
-Mailing list:
-   devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-   http://vger.kernel.org/vger-lists.html#devicetree-spec
-
 This [repository](https://github.com/devicetree-org/devicetree-specification) holds the source for the generation of the Devicetree Specification using Sphinx and LaTeX. 
 
+## Mailing list: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org ##
+   * Use this mailing list for submitting patches, questions and general discussion
+   * Sign up to the mailing list at http://vger.kernel.org/vger-lists.html#devicetree-spec
+
 ## Build Instructions ##
 
 Requirements:
@@ -75,6 +75,7 @@ in the LICENSE and NOTICE file or online at:
 http://www.apache.org/licenses/LICENSE-2.0
 
 ## Contributions ##
+Please submit all patches to the mailing list devicetree-spec-u79uwXL29TaiAVqoAR/hOA@public.gmane.org
 Contributions to the Devicetree Specification are managed by the gatekeepers,
 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> and Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
 
-- 
2.7.4 (Apple Git-66)
