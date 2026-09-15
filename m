Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A213B38B1
	for <devicetree-spec@vger.kernel.org>; Tue, 15 Sep 2026 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482238; cv=none; b=OZmUxVd8Lv8Cg/q57z23NK52kTKwboz3mTzeVJWXYmd0aMccP10nPBH1qcVaPnF0TCgj0aKM+6WKwhXYea2MsN+MgC9cd3hIIKvWwN/FJOGlCRaB+weXMVN48qhPYSlHWmmBTEHsBtJ19tVx1puipwu2TwrCxcDqKrujKn4ukCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482238; c=relaxed/simple;
	bh=PkOsLX5wALjigSVMiatQBlNQfqr92+6qTL5t/dMbZm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L4hIoqqx7lxW/uZZa4X0Fn1ol6/DV7H5lc5UPPNufcjIt2/jRPk+awECayS5OCLS3p1K+6x9bwhbBFdXzIpAYY29b0ObJdSatF33TXAwOyPOOSZHKt2/QaZ63rTbSl3bwAEvupuhC2/6l6JqaIUqocG8GZUVBzhg3ceJKuB5mqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.44])
	by APP-01 (Coremail) with SMTP id qwCowACneu7vVKlqeYwTCA--.2398S2;
	Tue, 15 Sep 2026 22:23:44 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Grant Likely <grant.likely@secretlab.ca>,
	Rob Herring <robh@kernel.org>
Cc: devicetree-spec@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH] chapter2: add generic name requirement for multiple nodes w/o unit addr
Date: Tue, 15 Sep 2026 22:23:40 +0800
Message-ID: <20260915142340.3131310-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACneu7vVKlqeYwTCA--.2398S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr4kGr1xuF43Ww4DAryDGFg_yoWftFX_Ca
	n2gr1UZrZ8JF15Ka43Zr15XF47G342gryfGr18tFs7Xw15Xr4UuanFqa429F1UK3ySkr98
	C3s0v3y8C3ya9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbw8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUywZ7UUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Sometimes multiple nodes matching the same generic name will coexist at
the same level (e.g. multiple GPIO-controlled regulators).

Document the common practice used in existing device trees in this case.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 source/chapter2-devicetree-basics.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devicetree-basics.rst
index ca716a1..003b37b 100644
--- a/source/chapter2-devicetree-basics.rst
+++ b/source/chapter2-devicetree-basics.rst
@@ -303,6 +303,10 @@ name should be one of the following choices:
    * watchdog
    * wifi
 
+When multiple nodes matching the same generic name and no unit addresses exist
+at the same level in the tree, the node names should start with the generic
+name and a dash, follows either a sequence number or short descriptive names.
+
 Path Names
 ~~~~~~~~~~
 
-- 
2.52.0

