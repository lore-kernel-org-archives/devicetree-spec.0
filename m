From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dt-bindings: Document optional "reserved-names" property
Date: Tue,  9 May 2017 10:18:47 -0700
Message-ID: <20170509171847.27457-1-f.fainelli@gmail.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=X+y2VlEqnoeuO8cAXCGmDvyn+AGYW5aEOpEBwN/688g=;
        b=sH3qajL3ShsK85xYi950Ei3OVeI3Ba+HwRDKPJPx3hPrYLR/YBm7DF8WjqjOEA9r5y
         s9uLKz2Zx/7QJPj4mGN69GAkqQ0eNORavjs1r1Ov4qoDQuKZt05MqQJQ6qyZyxRSVF4C
         GbLu4MvaU1iJw2S7dqAmqoWHi8uWM1+t9rBKvvityhn3kgL7MZSeHlUeZZREu0HkClEm
         +O65IDzCOTinF9+fqiTYDSbv5NUw198lbrt1IeU/hd8qLfF8+6iPS7MDtnVEcjFfIxZl
         SvYFhPZuWMQU5pUyCrszOUrdX/OQpPPChpPi1OcAF8AotLsz+vsBLYDBkx6/KiLrJT9Z
         O+jw==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Define an optional string property: "reserved-names" which can be used
by the client program to tag/identify reserved memory regions.

Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index 3da0ebdba8d9..bd3c9485f637 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
@@ -64,6 +64,10 @@ reusable (optional) - empty property
       system can use that region to store volatile or cached data that
       can be otherwise regenerated or migrated elsewhere.
 
+reserved-names (optional)
+    - Provides a named tag to the client program to help pretty print/identify
+      the reserved memory region.
+
 Linux implementation note:
 - If a "linux,cma-default" property is present, then Linux will use the
   region for the default pool of the contiguous memory allocator.
-- 
2.9.3
