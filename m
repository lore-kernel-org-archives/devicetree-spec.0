From: Kanta Vekaria <kanta.vekaria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [DTSpec PATCH] Fix typos and heading
Date: Fri, 27 May 2016 13:30:39 +0100
Message-ID: <1464352239-16013-1-git-send-email-kanta.vekaria@linaro.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=3NA6rEv2dt8hAsddz7nkD3HvxNHDN+gaY3V7R72YeqI=;
        b=HeymmMXo1XAOcAi97atg3yZFKhRMjhIAunLhdenfWqo5DKoCj1Khi4iITpxUSJ+Hwy
         +5JFoZALpBueDIz31BnYJD447+REiKSgZhjBh2K3A+xUeVPWRf+gRysaRI1ZLLO40xRc
         v8yPraX7Jz1qpGgSwTAUPf5GUWRNIriCmQzkw=
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org

Minor edits

Signed-off-by: Kanta Vekaria <kanta.vekaria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 README.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/README.md b/README.md
index 1fa4db2..8ff30c4 100644
--- a/README.md
+++ b/README.md
@@ -1,4 +1,4 @@
-# Document master project for the Devicetree Specification hosted at http://devicetree.org/ #
+# Document master project for the Devicetree Specification #
 
 The latest release of the specification can be found at http://devicetree.org/ or https://github.com/devicetree-org/devicetree-specification-released
 
@@ -38,7 +38,7 @@ On Mac OS X:
 
 > Install [MacTeX](http://tug.org/mactex/)
 >
-> Install pip if you don't have it:
+> Install pip if you do not have it:
 >```
 >$ sudo easy_install pip
 >```
@@ -49,7 +49,7 @@ On Mac OS X:
 >sudo pip install --upgrade Sphinx
 >```
 >
->If your are using [brew](http://brew.sh) then you can install graphviz like this:
+>If you are using [brew](http://brew.sh) then you can install graphviz like this:
 >```
 brew install graphviz
 >```
-- 
2.7.4 (Apple Git-66)
