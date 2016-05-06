From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH DT spec 1/3] Fix property value for the Gigabit MII type
Date: Thu,  5 May 2016 22:08:45 -0700
Message-ID: <1462511327-21077-2-git-send-email-f.fainelli@gmail.com>
References: <1462511327-21077-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=he5Wg53O3gyxtxBs74A1Fi6qZ+sjbFkgAzSk/KI7n3g=;
        b=fz4uxKmlF1+yy6TD1rvQUtHs89vZFw3/h5j4nLv0ZT1hgFeb1RqikxhisZSO9n4zZn
         DyY6zX2xOwGvQ0LDkJc/3zWAEKp2xIVIJ3hCIzb9QlGfGxUmoMRel1O1NHFTTvn+OnRN
         IyIN6Dm90KkbmVzxiOwb3w6Jk4NHCd49fqlArGzh2ZrBUDdkF5yLiHeJqv0XkluMDWU1
         80swxb5dr+2voGrcNc5YMCDx1yrB1txMwEO2SBYvO2ylmoTg8XUEPIbdqAFgyclwQTsE
         hU3kFQuxkUaICFTQ6fl8tqL3aIzWlLUvnPNiNQi+Q6lZ2PZ8Y2JbYZQtPyC1029IgRf9
         pYhg==
In-Reply-To: <1462511327-21077-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

The property description is correct but the property value should be
"gmii" instead of "rgmii"

Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 source/device-bindings.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source/device-bindings.rst b/source/device-bindings.rst
index 60e5560..ec50c67 100644
--- a/source/device-bindings.rst
+++ b/source/device-bindings.rst
@@ -337,7 +337,7 @@ the network device class.
    ===================================== ============
    Media Independent Interface           ``mii``
    Reduced Media Independent Interface   ``rmii``
-   Gigabit Media Independent Interface   ``rgmii``
+   Gigabit Media Independent Interface   ``gmii``
    Reduced Gigabit Media Independent     ``rgmii``
    rgmii with internal delay             ``rgmii-id``
    rgmii with internal delay on TX only  ``rgmii-txid``
-- 
2.7.4
