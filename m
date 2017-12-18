From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Add version number to released filenames
Date: Mon, 18 Dec 2017 12:38:20 +0000
Message-ID: <20171218123820.27954-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=g5bpdc1lzXdqP2GF2FokOD2w+KyjGVpvBLsmmTgmmXg=;
        b=KXYjouDSJuxH42m4wh6eN8s3b5++TK+jojcIGx4I0WIETvGXmJnHnfd8zm1BxV7dFq
         ne4Nh2tm0cguGv3TPb0Ee6t4X9IORr4KiJncoKyraQuTICfN2t9Oz2ykpyhUNz9gXfCm
         YyNP729JZtN/ItJhe4aymcuceF2OX1rT8VZPBE5/AlUPYWXQxiOxGHuXDfP9lJggwuVe
         nDo8JX3Zq0/Wc1Y2G3q2boWwclkxqz0HVf/6H1SPqtfQsab47NeKCQRIGUuXZ1U4ZoSP
         XuykSSxUIiB2AeNY9xmm2+713NID2UiKWoBNyxFV6W4ZwIaIUgYQ7nGYJ3Lb4uBAH24P
         PJ/g==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

Add the release version number to the .pdf filenames so that the version
can be immediately recognized.

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
---

I've already committed this change to the repo as part of releasing
v0.2-pre4 since it needed to be tested as part of the actual release
process.

 .travis.yml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 8afcb8c..9135231 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -44,6 +44,10 @@ script:
   - make html
   - make singlehtml
 
+before_deploy:
+  - cp build/latex/devicetree-specification.pdf build/devicetree-specification-$TRAVIS_TAG.pdf
+  - cp build/latex/devicetree-specification-changebars.pdf build/devicetree-specification-changebars-$TRAVIS_TAG.pdf
+
 deploy:
   - provider: releases
     prerelease: true
@@ -51,8 +55,7 @@ deploy:
       secure: sUwxm3Vbv9p8Uvn/BedgpSbPwnqRJvg0k7ezicEWcJlOF3X6dewX8Qk2x9k9PQ2A8v8GPsf+66D4CABBgz2hIUs68GV7r5ngPHbYQDejI5TjOnYyAuOz8AaCt9+K1nfblqyvg2/4TXKRpHJh9MPzq3WlVB4fvYleGDp1P08xLGCUwrrpyVlA3FQlR3rjPl430GRVCsj/6gEtBs6jHe3/9YhJYUkdgnj8VJI0ISqsSia/wxQyyf1QoydaEhwXVwsapFFCGSX60uo72fs/HBZtBpJOPnkw4g6sZw6lory1k6ZpWxtgRANlDvYXpvnTddiViNprGGJdxvRaKn2uyg/vU4wnrxZsg34uCuvYIyudwDeLkmvsB6NEaRTmqozPH35CLjEkOSrrnTVawYbGVsCX3mtMtVM4ocuxkZSD5CeSX4CNixWMqRMcAtvyh2jtu+gGuuxESgnaWCUoKsPWik8zkBAdCvraN5N7SdwNRRgOiJKMqTAQMFeUklXXPVQt5tm4H79Qjz9vylboeYNDHEaj07/AXX9QSXxXSIXLEvF+haPDPMeoamhCuA1SGlKyBWKT7Uq/BpjpnfpPwvZv0tyW3roq6GN8CqfRQYdj6zKOsIJnU69pVgq8cXCTMTSrjLnlis7hp1gp9hS7kJts58J21v2Qw20+YwhBH3s/OCL4gvg=
     file_glob: true
     file:
-      - "build/latex/devicetree-specification.pdf"
-      - "build/latex/devicetree-specification-changebars.pdf"
+      - "build/devicetree-specification-*.pdf"
     skip_cleanup: true
     on:
       tags: true
-- 
2.11.0
