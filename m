From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH DT spec 2/3] Fix property name, table and defined value for "phy-connection-type"
Date: Thu,  5 May 2016 22:08:46 -0700
Message-ID: <1462511327-21077-3-git-send-email-f.fainelli@gmail.com>
References: <1462511327-21077-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NXOF+a+smdH+HMpQd/hCDMsMLjj+IZ4SEwJDB3dD2T0=;
        b=t7I36wK0FkmjJ9uaPHpSmToAg1hpIhrLUJhCA0LwvJxpK+v3upY7B/FH+kok++foyo
         K9PJLNBvO2wzEhsw/4dtgEra+uyBASs+/8aOf8IzCeGdvlkUmIjeUnpzsdY/QUJMxYSr
         Se6pKRn9y9tKLViWykEU29YUS7t2yC9BC7Yka9mPgb23OwVhKxWmBXiZgACm/kBE8BaL
         0P3X0sWP2BgYltxsDOltLm64dsc6uUvzceHnGk001VizDXdBG0oMRJdPusKRYhn8aUY3
         Gni0h3iZl6nBLFiFBBJ5zYdapETj26nhkFiFy/jXiiaPra1jwj+Ar4mEatw54g+7ZStN
         9JBQ==
In-Reply-To: <1462511327-21077-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Table 4.12 describes the "phy-connection-type" property and its valid
values, not "max-speed" (which is at 4.11).

Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 source/device-bindings.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/source/device-bindings.rst b/source/device-bindings.rst
index ec50c67..6bf79ff 100644
--- a/source/device-bindings.rst
+++ b/source/device-bindings.rst
@@ -315,10 +315,10 @@ the network device class.
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 .. tabularcolumns:: | l J |
-.. table:: ``max-speed`` Property
+.. table:: ``phy-connection-type`` Property
 
    =========== ==============================================================
-   Property    ``max-speed``
+   Property    ``phy-connection-type``
    =========== ==============================================================
    Value type  ``<string>``
    Description Specifies interface type between the Ethernet device and a
@@ -330,7 +330,7 @@ the network device class.
    =========== ==============================================================
 
 .. tabularcolumns:: | l J |
-.. table:: Defined values for the ``max-speed`` Property
+.. table:: Defined values for the ``phy-connection-type`` Property
 
    ===================================== ============
    Connection type                       Value
-- 
2.7.4
