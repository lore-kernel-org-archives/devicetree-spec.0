From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [DTSpec PATCH] Document additional "phy-connection-type" values
Date: Fri, 23 Sep 2016 14:47:40 +0800
Message-ID: <1474613260-15457-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add the following values to the "phy-connection-type" property:

* Turbo Reduced Gigabit Media Independent Interface ``trgmii``

Suggested-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 source/device-bindings.rst |   39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/source/device-bindings.rst b/source/device-bindings.rst
index 7020267..9de6f3c 100644
--- a/source/device-bindings.rst
+++ b/source/device-bindings.rst
@@ -332,25 +332,26 @@ the network device class.
 .. tabularcolumns:: | l J |
 .. table:: Defined values for the ``phy-connection-type`` Property
 
-   =============================================== ============
-   Connection type                                 Value
-   =============================================== ============
-   Media Independent Interface                     ``mii``
-   Reduced Media Independent Interface             ``rmii``
-   Gigabit Media Independent Interface             ``gmii``
-   Reduced Gigabit Media Independent               ``rgmii``
-   rgmii with internal delay                       ``rgmii-id``
-   rgmii with internal delay on TX only            ``rgmii-txid``
-   rgmii with internal delay on RX only            ``rgmii-rxid``
-   Ten Bit Interface                               ``tbi``
-   Reduced Ten Bit Interface                       ``rtbi``
-   Serial Media Independent Interface              ``smii``
-   Serial Gigabit Media Independent Interface      ``sgmii``
-   Reverse Media Independent Interface             ``rev-mii``
-   10 Gigabits Media Independent Interface         ``xgmii``
-   Multimedia over Coaxial                         ``moca``
-   Quad Serial Gigabit Media Independent Interface ``qsgmii``
-   =============================================== ============
+   ================================================= ============
+   Connection type                                   Value
+   ================================================= ============
+   Media Independent Interface                       ``mii``
+   Reduced Media Independent Interface               ``rmii``
+   Gigabit Media Independent Interface               ``gmii``
+   Reduced Gigabit Media Independent                 ``rgmii``
+   rgmii with internal delay                         ``rgmii-id``
+   rgmii with internal delay on TX only              ``rgmii-txid``
+   rgmii with internal delay on RX only              ``rgmii-rxid``
+   Ten Bit Interface                                 ``tbi``
+   Reduced Ten Bit Interface                         ``rtbi``
+   Serial Media Independent Interface                ``smii``
+   Serial Gigabit Media Independent Interface        ``sgmii``
+   Reverse Media Independent Interface               ``rev-mii``
+   10 Gigabits Media Independent Interface           ``xgmii``
+   Multimedia over Coaxial                           ``moca``
+   Quad Serial Gigabit Media Independent Interface   ``qsgmii``
+   Turbo Reduced Gigabit Media Independent Interface ``trgmii``
+   ================================================= ============
 
 ``phy-handle`` Property
 ^^^^^^^^^^^^^^^^^^^^^^^
-- 
1.7.9.5
