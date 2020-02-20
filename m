From: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] Add required missing reg property
Date: Thu, 20 Feb 2020 21:59:33 +0100
Message-ID: <20200220205933.28311-1-arkadiusz@drabczyk.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Signed-off-by: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
---
 source/devicetree-basics.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
index 01b1958..e4ca4ab 100644
--- a/source/devicetree-basics.rst
+++ b/source/devicetree-basics.rst
@@ -530,6 +530,7 @@ Example:
       pic@10000000 {
          phandle = <1>;
          interrupt-controller;
+         reg = <0x10000000 0x100>;
       };
 
    A *phandle* value of 1 is defined. Another device node could reference
-- 
2.9.0

