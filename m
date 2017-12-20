From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Revert change to fsl,mpc8641 example
Date: Wed, 20 Dec 2017 11:20:24 +0000
Message-ID: <20171220112024.12303-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=65nq0nrJtDXHfcnrTjZgBuMP287+ODC1/i/PXsHmy8E=;
        b=fdML0VQA3RpKHQGFGBjXNDUgFSxmnEG/h96+q+Pyw6/nDi3KP0a/MlAa1inTfX8m/p
         vaPUuwKE9XryVfLmRs5K6rLZITyj9ubUMh6dX47XWtuMBDADGUxuXmPq7pgh9jG5R/qO
         zDnh1K4klWND3Xhg6rwyg7M9iW8Ixnf0B1XTEZoovzlwSvbD0nWvqkYB+0crUsCKH3j2
         6165OwHtvVCx1ajBvtJjaQmDnpg1LG3pg7Is34ZSc7P9XKCNtsIsVGxlZ1VT8vI/wrlK
         qvdkGyS5FVGK+4UjZCmKnVGgGCi88WfQCfsFTwqu80zJy7KqkRjtWoKwZDYHpkcfNh61
         i1nw==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, "Robert P . J . Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>

Commit 7d888a01, "Aesthetic/grammar fixes to first part of
devicetree-basics.rst" changed one of the Freescale compatible examples
from "fsl,mpc8641-uart" to "fsl,ns16550". However, there is value in
using examples from real hardware when possible, and to also show that
different strings (mpc8641-uart vs. ns16550) for a device is normal, so
revert that hunk.

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Cc: Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
---
 source/devicetree-basics.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
index f007a4b..1900cc8 100644
--- a/source/devicetree-basics.rst
+++ b/source/devicetree-basics.rst
@@ -469,10 +469,10 @@ Description:
 
 Example:
 
-   ``compatible = "fsl,ns16550", "ns16550";``
+   ``compatible = "fsl,mpc8641", "ns16550";``
 
    In this example, an operating system would first try to locate a device
-   driver that supported fsl,ns16550. If a driver was not found, it
+   driver that supported fsl,mpc8641. If a driver was not found, it
    would then try to locate a driver that supported the more general
    ns16550 device type.
 
-- 
2.11.0
