From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Update copyright dates and revision history
Date: Thu,  7 Dec 2017 16:51:41 +0000
Message-ID: <20171207165141.8498-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=j7YeNhPA7bOFfjehGn+3RpRA+29KM+D9U98gEbsjpmk=;
        b=Tf2aydz0nG70Jy6hPGZ2keJxjICZv5lreOweWoDSQAG+J8zQQ71e0tjP64RhYc6VVM
         mUddaNYSi3PnB1qUBYMOKp92+DysMI/wrJpTzHIo0CQLV7E6fs2q8Xq6cGpI4YYnT7Hd
         VzQJ9XTcWdHazK43BeBsSOtAY2bSF74/LzHh7B4uyq4SbfVj967WXj65+1NNbx8h4Rk7
         bREXW54teffSbu5OaADEQVqWf+vRLfWbjwKk9g4Fboex8QfI9VKAe4VKFNu+r/rWICQ3
         4vo1ycV7KdIACW5wgbtTHBqKk61bN75stMv8xY3/psJbA268d+mhXqt1nB59p3JFzClI
         mhVA==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

Add revision history for v0.2-pre2 of the spec and add 2017 to the
copyright dates for both Arm and Linaro.

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
---
 LICENSE               |  3 ++-
 NOTICE                |  7 ++++---
 source/conf.py        |  2 +-
 source/license.rst    |  4 ++--
 source/revhistory.rst | 25 +++++++++++++++++--------
 5 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/LICENSE b/LICENSE
index d27ab08..b2452fb 100644
--- a/LICENSE
+++ b/LICENSE
@@ -187,7 +187,8 @@
       same "printed page" as the copyright notice for easier
       identification within third-party archives.
 
-   Copyright 2016 Linaro, Ltd.
+   Copyright 2016,2017 Arm, Ltd.
+   Copyright 2016,2017 Linaro, Ltd.
    Copyright 2008,2011 Power.org, Inc
    Copyright 2008,2011 Freescale Semiconductor, Inc.
    Copyright 2008,2011 International Business Machines Corporation
diff --git a/NOTICE b/NOTICE
index ecca13d..ff772f8 100644
--- a/NOTICE
+++ b/NOTICE
@@ -3,9 +3,10 @@ Devicetree Specification
 
 Portions of this specification were developed by the following companies and licensed under the Apache License, Version 2.0 
 
-Copyright 2016 Linaro, Ltd.
+Copyright 2016,2017 Arm, Ltd.
+Copyright 2016,2017 Linaro, Ltd.
 Copyright 2008,2011 Power.org, Inc
-Copyright 2008,2011 Freescale Semiconductor, Inc. 
-Copyright 2008,2011 International Business Machines Corporation 
+Copyright 2008,2011 Freescale Semiconductor, Inc.
+Copyright 2008,2011 International Business Machines Corporation
 
 For more information, please see http://devicetree.org/
diff --git a/source/conf.py b/source/conf.py
index 6bb639c..e8a6627 100644
--- a/source/conf.py
+++ b/source/conf.py
@@ -57,7 +57,7 @@ master_doc = 'index'
 
 # General information about the project.
 project = u'Devicetree Specification'
-copyright = u'2016, devicetree.org'
+copyright = u'2016,2017, devicetree.org'
 author = u'devicetree.org'
 
 # The version info for the project you're documenting, acts as replacement for
diff --git a/source/license.rst b/source/license.rst
index 2d9e95a..17a586f 100644
--- a/source/license.rst
+++ b/source/license.rst
@@ -4,8 +4,8 @@
 | Copyright 2008,2011 Power.org, Inc.
 | Copyright 2008,2011 Freescale Semiconductor, Inc.
 | Copyright 2008,2011 International Business Machines Corporation.
-| Copyright 2016 Linaro, Ltd.
-| Copyright 2016 ARM Ltd.
+| Copyright 2016,2017 Linaro, Ltd.
+| Copyright 2016,2017 Arm, Ltd.
 
 The Linaro and devicetree.org word marks and the Linaro and
 devicetree.org logos and related marks are trademarks and service marks
diff --git a/source/revhistory.rst b/source/revhistory.rst
index 9afd307..a800d26 100644
--- a/source/revhistory.rst
+++ b/source/revhistory.rst
@@ -1,11 +1,20 @@
 .. _revision-history:
-.. tabularcolumns:: | l l J |
+.. tabularcolumns:: | p{1.5cm} p{2.25cm} p{11.50cm} |
 .. table:: Revision History
 
-   =========== =========== ====================================================
-   Revision    Date        Description
-   =========== =========== ====================================================
-   |spec| 0.1  2016-MAY-24 Initial prerelease version. Imported |epapr| text
-                           into reStructured Text format and removed Power ISA
-                           specific elements.
-   =========== =========== ====================================================
+   ========= =========== ====================================================
+   Revision  Date        Description
+   ========= =========== ====================================================
+   0.1       2016-MAY-24 Initial prerelease version. Imported |epapr| text
+                         into reStructured Text format and removed Power ISA
+                         specific elements.
+   0.2-pre2  2017-DEC-07 Second prerelease version.
+
+                         * Added more recommended generic node names
+                         * Added interrupts-extended
+                         * Additional phy times
+                         * Filled out detail in source language chapter
+                         * Editorial changes
+
+   ========= =========== ====================================================
+
-- 
2.11.0
