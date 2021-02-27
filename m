From: Wei Ming Chen <jj251510319013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Fix format in README
Date: Sat, 27 Feb 2021 11:17:36 +0800
Message-ID: <20210227031736.3422-1-jj251510319013@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NqeyhvYh6L1mMAA5kWkM8a4NM/+hKIXqaxa6FIrBFbU=;
        b=Grf7fewW1z8XzAmuz6QIC1wfhxPJnl1r7ZxTwGfzG3VJgPbLTefo9IWXcyM0O2lBN6
         BnYeST9LyL3Vz4Q7bweNECT3CzEP+MIeSq9GqWHhBuQv3X+73C2QWyiG290uRLDXz+rc
         KkgUxI7CSYKs9Pc38x9N9nyN9QR9BJ+uLHDLtHVWo1PGGZiPXgZFKmtw8R7CaqC8qXrD
         xpIn+7caqy9jHiTYxyYTmWIQZGJhe3et/OM9A+cUWU6/zQzqfqpZ/JUSLLU+0LTz4eUa
         tdf2L4GJRkkEDuNmwyYiT9Z8s4/qQToVxTG6/QUWE5gQGSGEI9echqZaJxcSJB9yJ141
         fgJw==
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wei Ming Chen <jj251510319013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Signed-off-by: Wei Ming Chen <jj251510319013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 57b16d8..e654a6f 100644
--- a/README.md
+++ b/README.md
@@ -62,7 +62,7 @@ On Mac OS X:
 >
 >If you are using [brew](http://brew.sh) then you can install graphviz like this:
 >```
-brew install graphviz
+>brew install graphviz
 >```
 >If you are using [macports](https://www.macports.org/) then you can install graphviz like this:
 >```
-- 
2.25.1

