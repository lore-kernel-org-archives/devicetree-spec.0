From: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] Fix spelling error
Date: Sun,  8 Mar 2020 15:21:36 +0100
Message-ID: <20200308142136.28168-1-arkadiusz@drabczyk.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Signed-off-by: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
---
 source/flattened-format.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/source/flattened-format.rst b/source/flattened-format.rst
index bd98891..3185480 100644
--- a/source/flattened-format.rst
+++ b/source/flattened-format.rst
@@ -185,8 +185,8 @@ used, whether or not it is in the reserved areas.
 
 Any memory that is declared in a memory node and is accessed by the boot
 program or caused to be accessed by the boot program after client entry
-must be reserved. Examples of this type of access include (e.g.,
-speculative memory reads through a non-guarded virtual page).
+must be reserved. Examples of this type of access include speculative
+memory reads through a non-guarded virtual page.
 
 This requirement is necessary because any memory that is not reserved
 may be accessed by the client program with arbitrary storage attributes.
-- 
2.9.0

