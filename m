From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Revert abbreviation of month name
Date: Mon, 18 Dec 2017 15:11:41 +0000
Message-ID: <20171218151141.8019-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=4js3Sd9sigtYREFUqP+l7l2YYS6w3cu8NgsC9NKP7Qo=;
        b=XwCK8bAOdJmForAtwUsZ1RGh0iVMsNgT1WOZUMvYfVKHjK20Ip3QREQt4g77RIxp9x
         QfY0ahr0+CplGgbVucfbYnnbNEkQMrD6UgdYvKni6+jTDYPwduW7XghZ0UFUCZ4Sd+dH
         klUmBeDgJHHBcyYDgmsSrZKrfSLEn+9Ch3DOf6iZa8krG8vNL5bQm/UtNMOQ2MjkKA64
         CRWZo8MkjuZDZ75FgGY4WUW/BJDKhSwZFoytSIIwaisddKtnBq9JZLjYEGVbBk3YJaDm
         sH9+Q2c7/SCzfR8B3LMa9rou2UamAxpXek6loyaCwKK1e6UyntTYo3rrqfcwKL9rz3wF
         J5pw==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

Commit 6a00ff2f, "Extract document version from git tag" changed the
date annotation from full month to the abbreviation. Full month looks
better on the title page, so revert that hunk of the change.

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
---
 source/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source/conf.py b/source/conf.py
index e8a6627..3f5cc2c 100644
--- a/source/conf.py
+++ b/source/conf.py
@@ -83,7 +83,7 @@ language = None
 # non-false value, then it is used:
 #today = ''
 # Else, today_fmt is used as the format for a strftime call.
-today_fmt = '%d %b %Y'
+today_fmt = '%d %B %Y'
 
 # List of patterns, relative to source directory, that match files and
 # directories to ignore when looking for source files.
-- 
2.11.0
