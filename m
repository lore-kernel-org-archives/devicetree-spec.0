From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH DT spec 3/3] Document additional "phy-connection-type" values
Date: Thu,  5 May 2016 22:08:47 -0700
Message-ID: <1462511327-21077-4-git-send-email-f.fainelli@gmail.com>
References: <1462511327-21077-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3NEYRklYlBbxMo6RY8u7N/6Nnloo55MhPBF4WA3iStk=;
        b=glSCRBfrjNv0kjKbzk9jxhRjqRuqyptIH0zBuQ5zxhiflrSa9ARQ5sSqDGXHP4OgH0
         U1TEGQI6VQyv0xzndBAWz8Vc1APys/ikYt8NwJyOnw9oa6Vcyut836JvY/VYiOcb7/i+
         /zvnQP/KREzdSbDtIZ10BIsA04m1nEII3ACZAl0aGlp2ZEsfHAW9I6V+yVCIFNx8T8qP
         7hRHJcOpoD6AHyBQRPToche5DsF9EP9ms4JEEiPlbal8LZIOChB+R+SwCpm3w4iM+EFO
         GkIYr5WH2zq5UMkVJs/K/f8P7jt5XlCXbymJ6LvCZPRLDdxjZLlkH2oRvzsQrXcOtf6t
         EPJA==
In-Reply-To: <1462511327-21077-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add the following values to the "phy-connection-type" property:

* Serial Gigabit Media Independent Interface      ``sgmii``
* Reverse Media Independent Interface             ``rev-mii``
* 10 Gigabits Media Independent Interface         ``xgmii``
* Multimedia over Coaxial                         ``moca``
* Quad Serial Gigabit Media Independent Interface ``qsgmii``

Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 source/device-bindings.rst | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/source/device-bindings.rst b/source/device-bindings.rst
index 6bf79ff..bf197ee 100644
--- a/source/device-bindings.rst
+++ b/source/device-bindings.rst
@@ -332,20 +332,25 @@ the network device class.
 .. tabularcolumns:: | l J |
 .. table:: Defined values for the ``phy-connection-type`` Property
 
-   ===================================== ============
+   =============================================== ============
    Connection type                       Value
-   ===================================== ============
-   Media Independent Interface           ``mii``
-   Reduced Media Independent Interface   ``rmii``
-   Gigabit Media Independent Interface   ``gmii``
-   Reduced Gigabit Media Independent     ``rgmii``
-   rgmii with internal delay             ``rgmii-id``
-   rgmii with internal delay on TX only  ``rgmii-txid``
-   rgmii with internal delay on RX only  ``rgmii-rxid``
-   Ten Bit Interface                     ``tbi``
-   Reduced Ten Bit Interface             ``rtbi``
-   Serial Media Independent Interface    ``smii``
-   ===================================== ============
+   =============================================== ============
+   Media Independent Interface                     ``mii``
+   Reduced Media Independent Interface             ``rmii``
+   Gigabit Media Independent Interface             ``gmii``
+   Reduced Gigabit Media Independent               ``rgmii``
+   rgmii with internal delay                       ``rgmii-id``
+   rgmii with internal delay on TX only            ``rgmii-txid``
+   rgmii with internal delay on RX only            ``rgmii-rxid``
+   Ten Bit Interface                               ``tbi``
+   Reduced Ten Bit Interface                       ``rtbi``
+   Serial Media Independent Interface              ``smii``
+   Serial Gigabit Media Independent Interface      ``sgmii``
+   Reverse Media Independent Interface             ``rev-mii``
+   10 Gigabits Media Independent Interface         ``xgmii``
+   Multimedia over Coaxial                         ``moca``
+   Quad Serial Gigabit Media Independent Interface ``qsgmii``
+   =============================================== ============
 
 ``phy-handle`` Property
 ^^^^^^^^^^^^^^^^^^^^^^^
-- 
2.7.4
