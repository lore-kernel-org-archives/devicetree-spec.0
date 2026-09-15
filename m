Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A834250E
	for <devicetree-spec@vger.kernel.org>; Tue, 15 Sep 2026 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482415; cv=none; b=NUi2KGmGXyw6pghvKnHbV5RtJvM6ajirGqQ05kUduETnjQlEmlOTTghDHqbFJtNKBVoWC+mLxttzO9kC1gBCxAGw/b/dAXjXmnNZr6oRTX+1UmaiCNpjRDzPBkRwWPXO0GQ2KXpTL3hbTz0ynBmsfu46bPvXSRH32aPujQAeKFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482415; c=relaxed/simple;
	bh=YhZIygKDqsNQ3Oeg033jkmWYFPY5ztG+tyKOaLC+sPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F1UHXocJTu/9N/bdpD7WSjSV8UclLu2VbWMepzicV1OGCb003FYAPFYGSXPmNAxOj1sIlY/l/rxBacvr4WurD4y0Y10iD9B0VKCKG+0dQY6B/1t8z4RF14c/65NTYaZ/Oku/9pv5Yeq8auKBs7Kuu0yt7rA4j6sHd4ksOvw7rsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.44])
	by APP-01 (Coremail) with SMTP id qwCowACHWOypValquKATCA--.41476S2;
	Tue, 15 Sep 2026 22:26:49 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Grant Likely <grant.likely@secretlab.ca>,
	Rob Herring <robh@kernel.org>
Cc: devicetree-spec@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH] Add `power-controller` to the list of generic node names
Date: Tue, 15 Sep 2026 22:26:45 +0800
Message-ID: <20260915142645.3131813-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACHWOypValquKATCA--.41476S2
X-Coremail-Antispam: 1UD129KBjvdXoWrAFy7KryfWry8Aw4xGr1kGrg_yoWxWFg_Aa
	17Xr18Zr98tr9Ikw1FvFWrXF17W347W3yFkr18tFs7Xw1rWFWkZ3s2va429a48XFW8Ar93
	C3s0vrW3Cw4fCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbw8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdEfOUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Nodes describing a device controlling power domains are usually named
`power-controller` as a common practice.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 source/chapter2-devicetree-basics.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devicetree-basics.rst
index ca716a1..b1ae75f 100644
--- a/source/chapter2-devicetree-basics.rst
+++ b/source/chapter2-devicetree-basics.rst
@@ -274,6 +274,7 @@ name should be one of the following choices:
    * pmu
    * port
    * ports
+   * power-controller
    * power-monitor
    * pwm
    * regulator
-- 
2.52.0

