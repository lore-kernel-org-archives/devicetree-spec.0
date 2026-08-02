Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737573BB699
	for <devicetree-spec@vger.kernel.org>; Sun,  2 Aug 2026 21:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785707041; cv=none; b=jshVjWcLggToecyyK9POOxn+0oB1JLQGoUW6I57VXurCd2sxSagMWuAv4psBycAUfmC5lWMQ0/EqPR/jFejYiBFZLg5OfYpsN8IxuzJdIwwXqFLJzFgilj7SI8sXk3z37ehB/6IA9wrYEGsJM6FgnZ3J+cPHzmWu3cjLTxtjGnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785707041; c=relaxed/simple;
	bh=q6W64z07uljSQGhS1KJCq4J0L83uuBcQTyVi+/MZhSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nsDOmzhGUoDcCf2PSa0uQTeCQq7/d2ZQGfUKy/R7do2jMM+qrHpocx1L4Ep1qIBhm4RPC+wBtdO9pqjvAO82voRiz6iUgW7lfFKm0tgqHSIu4YFDQ2IW2HE9WTm5tJMlfqGA1J/Fd8UKUAQ1BdEpcSbzEhoz1vv6Kq3wCV6wjB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2bag1F2; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2bag1F2"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9083f928b60so15912816d6.1
        for <devicetree-spec@vger.kernel.org>; Sun, 02 Aug 2026 14:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785707039; x=1786311839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fuXEqimyffgC3r6i7frZWabp2CjAJ6czkCeh1u+cNBo=;
        b=k2bag1F23+AshYtLixVaVpVS+nTnNkoKpZHqbblAk+TkukeopDhBBY+mIx91wInowW
         5Y2pIEDVjcg44OsTVe2/fKY1RG4QiOUAj54q49Kl7f5ActkM7GuhPltXrruonr2PjslV
         0DYOKz70vp2f2EwxkpoD6Z01vMNWi1MzsmKI6f868teWk4Czo1skdnPRSkNsIPLYo7vc
         gZ6vXn918STloLSWfKPfpKsWINOklgQjRkuaNv6Uo4NVscm5aKO3NmZg30UGgjNe7QhG
         TCLbWS1IwpMp8H60GRyToXbC6UlPQs64ljE3MczhAWuisM9sp8HwweSUbuIVsD6SsuoT
         P4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785707039; x=1786311839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuXEqimyffgC3r6i7frZWabp2CjAJ6czkCeh1u+cNBo=;
        b=lWcv7gohySLRpGMeXrsyODyXd7mq1DyOIC7eziWhIGPTEtJhX2IhTNgl4kRIs7KD95
         rm5YSythoxR3yqZMB6aridiImZd2DhXRRw69Hki6jt2thm+04tLPiJHz7uMTBd/i77Dd
         AmWW5dZr0TsEtxbIpabEoA58UrU9pd+PEu+E8itTwpQwkh+ljAY7El/dYLpUPHUSg/hu
         NAHP5NdGWaNf3KMO+TAcm84pMl9YRnQO7d2pNwjann7uKEU80A0S2/kw2XnfPqHmzppY
         qV2ytjz0JcU5iWqbwwKQ5A51jeKb8nrjA2Bnjv1QXbf5E1YZQOXMPgGyBuTX035/LHmo
         Kj9g==
X-Forwarded-Encrypted: i=1; AHgh+Rrm3/biOjrM1E3WfRWzVVMTZU/2lw1oiW9GfpW6V9Wd/hDyw3Kk6tRtH63om5E2aNvtr6q9twlCsTMAI6HR59c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwszZqHYS6Zu3LvExtydXDn9lS2n2NodbQpkO+LXrkzA3tG74wb
	AE5gON2JAtyXDVK4KvY5h3I62N402sFTXHBGLeu04uyfHkDq6AN3AX0Lckop7w==
X-Gm-Gg: AR+sD118lxe922QcXUK3qzVCmf6Immnqx6ywc6ddJgDbX8EN3wKABBD/gxa7YtgAGPI
	awMFmBwNku3PaYfYLgwXSTpfvEDFhpX8aZ3szMiHjQiuGJu7bedeIsOGOK57NpLEOQvV7al3qp+
	M542xl1qMDU+zxetQn+tXA5Gz+swxmKQ9yzfzkuu5GmLkg3Km9ju2JdywQW/TcaZXthevw7AAO+
	rX3txq5gdUP7Ynzu5q9t+qK/ewt01tneyQlIJT0dnDcXjkjaEbZ84djZV4eHi0jwlO/SfDTpH2c
	Oh35QPEpHpBZJn/mV2dA0EIieEuTEVrR8MRRGZd93F8L6QG1nNDegjTcHA+ERJGCG6C4BYtR2hq
	KtjqUO0WS7cuWkfkIAQZchDdg32xiCTMCtja+cNm4TqqLaVzVEsTggq9ZW+XPvFyKmACWbbPqXa
	w6RySy/vR4M7VdByM7lxZHU1teMRqyIiW6TJvtijNzneptrmiRvdo6mNZnkZAtWdOJ5/1O2IO6w
	i0VNvdSw8jvya7y47vOh/ew5s8O//KMQyvKvnF84cosyf777zEyoYH7/ls8E+oyqApxHWZ3Yoe2
	7mQ01eRsppAZZ6LGFy02PY4YF1xSk45t7R1dgldnolRAPT+m
X-Received: by 2002:a05:6214:5403:b0:8b3:f911:c1df with SMTP id 6a1803df08f44-9084966585bmr185128876d6.21.1785707039288;
        Sun, 02 Aug 2026 14:43:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435b6778sm60683266d6.30.2026.08.02.14.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 14:43:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mailing List <devicetree-spec@vger.kernel.org>,
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH] dt-bindings: net: add nvmem-consumer reference to network-class
Date: Sun,  2 Aug 2026 14:43:54 -0700
Message-ID: <20260802214354.490074-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nvmem-cells and nvmem-cell-names properties are used to supply MAC
addresses to both wired and wireless network controllers. The wired
hierarchy already allows them through ethernet-controller.yaml, but the
wireless hierarchy (wireless-controller.yaml -> network-class.yaml)
does not. As a result, brcm,bcm4329-fmac nodes using nvmem (e.g.
bcm4709-linksys-ea9200.dts) failed dtbs_check with:

    Unevaluated properties are not allowed ('nvmem-cell-names',
    'nvmem-cells' were unexpected)

Each wireless driver otherwise has to add the nvmem-consumer reference
individually (qca,ath9k and mediatek,mt76 already declare their own
nvmem-cells/nvmem-cell-names).

Add the nvmem-consumer reference to network-class.yaml so all network
nodes inherit the properties at once. Wired controllers keep the tighter
single-cell, mac-address-only constraints via ethernet-controller.yaml,
which still apply alongside the relaxed class-level properties.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 Documentation/devicetree/bindings/net/network-class.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/network-class.yaml b/Documentation/devicetree/bindings/net/network-class.yaml
index 06461fb92eb8..f7c8e24016f7 100644
--- a/Documentation/devicetree/bindings/net/network-class.yaml
+++ b/Documentation/devicetree/bindings/net/network-class.yaml
@@ -43,4 +43,7 @@ properties:
       maximum frame size (there\'s contradiction in the Devicetree
       Specification).
 
+allOf:
+  - $ref: /schemas/nvmem/nvmem-consumer.yaml#
+
 additionalProperties: true
-- 
2.55.0

