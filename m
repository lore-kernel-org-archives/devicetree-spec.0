From: "M. A. Solhizadeh" <amin.solhizadeh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Fix README Markdown Format
Date: Sun, 14 Jan 2018 00:57:40 +0330
Message-ID: <73c3dd3c-63b8-4245-ca8f-80bff85b2092@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=RVkA4PvI5C2zPP5wsDKrj0SXwUpI5OTpPUDpKQauzmA=;
        b=IZZvnsSvUVcdRvI7F+oCH3SBsr3CsSfeZe50V2IgnTAtKv9gkn/OjdydZrR5LP3Yf1
         UmZu+7zd93zdgUV9M9s8lZ9t9edzeub2AeNSpwrtDT6j6HWqcqUaD05rhmbKLPAQXf2P
         G1i4t0PaXvp1iUTuNaqJWv/JNm2bBTO0J3Fa7HEb/jcYd9mSOfxweHUpczYs7Slb1vJK
         Sr9cQu9/KpM+m/bzPrJsgXLIS7R++yo0rsCb7xH76k320q8OZtwnJnn0rpOcGyBYBuK7
         tqePjJMxJbyA9oAd9Qc7HO29ck0Huxsv2hsHpbGK1p2Tkdzd2JY7FoMbZTeNPhc2vlLg
         31OA==
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

 From 308af038fc7343c7cce2f49b222f497d94263a33 Mon Sep 17 00:00:00 2001
From: Amin Solhizadeh <amin.solhizadeh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sun, 14 Jan 2018 00:43:52 +0330
Subject: [PATCH] Fix README Markdown Format

Signed-off-by: Amin Solhizadeh <amin.solhizadeh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
  README.md | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index fa21ecf..a4f08c3 100644
--- a/README.md
+++ b/README.md
@@ -62,7 +62,7 @@ On Mac OS X:
  >
  >If you are using [brew](http://brew.sh) then you can install graphviz 
like this:
  >```
-brew install graphviz
+>brew install graphviz
  >```
  >If you are using [macports](https://www.macports.org/) then you can 
install graphviz like this:
  >```
-- 
2.15.1
