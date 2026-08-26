Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEA031D39A;
	Wed, 26 Aug 2026 09:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737841; cv=none; b=dvYWYOE52rsISzpcq11F5EuLvelFPQN3t40NkGh61eOLNkCFX/jSqc8OIeJ9qhX//N4XWschnypxn1+181l9ir1UFsItprkhZUWdljKukiO7VrAi36rWMUixHo3IN5IDuEaSP1uoasPQW2lm+q/fun477x3YmNI9KulebSpuecc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737841; c=relaxed/simple;
	bh=a8yWwWwuaeV1ND4PZ/6EpeUN2fdNqL2jl0/3BSi4xx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jsxK3dycRTLcceM+UuO0RAyEhsBOWlrIllFSxAwMqrrN2b5qnIgwvfBSL14ykGC/29CquGGq8WXc7NACWXBOQird//NZkkz6qinv0RykSxBUD8Bp8eJe0BZsaO5TPrLa0eyYSmwJlKdUYo5ryuTV5C/6sTjNItTvTWe95YnDE18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hBQJSwKl; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hBQJSwKl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6453E1A183D;
	Wed, 26 Aug 2026 09:50:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 310C0604EC;
	Wed, 26 Aug 2026 09:50:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D652411C7AD52;
	Wed, 26 Aug 2026 11:50:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737834; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qZA52EnhjJI6y63U2fQLoVVzoZiNH25f6cUFrSM/XlA=;
	b=hBQJSwKlkILFw+PvE0Zw9cWK3PuvJz9fnhvPkJRw+aMpQuUUojePKQgzi+uQQRmQZ480Xv
	rjQieDilh9aI3g8a8om0MDo5abcaymTn5KEmpek/zQsA2DHxh/Rvl445TlWvNuCWIjbpnY
	3d72XVDgH335vx50Z/djxM9DXwrzIqvwHQU5VWVY60UcVoGHr7v65AwFNIbDW/JbfQ+BR/
	AYHjkjlX++OXPZcV+fuXhC3nh45u+b2Kv1Z8ZMV33OdPcd7S2USgfeoh0XtGdN0ZNf82e1
	6ZkBPMFTw2MOKbhX6puQwlUYTzrmQp3Y/Du556tZWtOZkjRyGpZSspNfmKmElg==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [RFC PATCH v2 01/74] dtc-parser.y: Avoid an empty proplist
Date: Wed, 26 Aug 2026 11:48:30 +0200
Message-ID: <20260826094950.1088288-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826094950.1088288-1-herve.codina@bootlin.com>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In the dts parser grammar, a nodedef is defined by
  '{' proplist subnodes '}' ';'
with both proplist and subnodes that can be empty lists.

Having multiple possible empty list can lead to Bison warnings such as
  warning: 4 shift/reduce conflicts [-Wconflicts-sr]
  warning: 1 reduce/reduce conflict [-Wconflicts-rr]

This will happen as soon as a new list (which also could be empty) is
added in the nodedef definition.

The simpler way to remove those warning and thus have a robust parsing
is to avoid multiple empty lists.

Update the proplist definition and nodedef definition to avoid those
multiple empty lists. Instead of allowing a proplist to be an empty
list, force the list to be a non empty one and update the nodedef to
handle explicitly the absence of the proplist to support the case where
no properties are available, i.e. the case of a node composed only of
sub-nodes.

This doesn't change the functional behavior.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-parser.y | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 4d5eece5..e47f80d4 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -267,12 +267,16 @@ nodedef:
 		{
 			$$ = build_node($2, $3, &@$);
 		}
+	| '{' subnodes '}' ';'
+		{
+			$$ = build_node(NULL, $2, &@$);
+		}
 	;
 
 proplist:
-	  /* empty */
+	  propdef
 		{
-			$$ = NULL;
+			$$ = chain_property($1, NULL);
 		}
 	| proplist propdef
 		{
-- 
2.55.0

