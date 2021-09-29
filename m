From: Sai Prakash Ranjan <saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH] Add system-cache-controller to the list of generic node names
Date: Wed, 29 Sep 2021 10:56:13 +0530
Message-ID: <20210929052613.8589-1-saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632893207; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=XJku7DsamK/yH+GUuMagqg2jHBKxw+t3hZfxo2lrDos=; b=sJi9BECKhv7HGmZxskbP0HVaPkhXhlKwxYxSKQIz9WItw+lLXyyW6evSFOr8Ql2+CmMna/ZX
 RgBjNk4quQ+zYhb+Cae1uirV84kpOjbkuzqy9Zy0fYhcBPfpj65eRKEvuiVeWZwZ4D5FhD2C
 lUGW9ZESaDuhOib2y3BYe0r2+vE=
Sender: saiprakash.ranjan=codeaurora.org-qLvOmUbifpzLzYW4gMljz9i2O/JbrIOy@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sai Prakash Ranjan <saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

System Cache Controller (Last Level Cache Controller/LLCC) does not
have a cache-level associated with it as enforced by the already
existing 'cache-controller' node name, so add system-cache-controller
to the list of generic node names as decided on the lkml in [1][2]
and already being used in the dts for sometime now.

[1] https://lore.kernel.org/lkml/5dcd8588.1c69fb81.2528a.3460-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org/
[2] https://lore.kernel.org/lkml/cover.1573814758.git.saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org/

Cc: Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 source/chapter2-devicetree-basics.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devicetree-basics.rst
index 40be22192b2f..c06c5063c68b 100644
--- a/source/chapter2-devicetree-basics.rst
+++ b/source/chapter2-devicetree-basics.rst
@@ -276,6 +276,7 @@ name should be one of the following choices:
    * sram-controller
    * ssi-controller
    * syscon
+   * system-cache-controller
    * temperature-sensor
    * timer
    * touchscreen
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

