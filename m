Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B3F3BBA08;
	Wed, 26 Aug 2026 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737908; cv=none; b=CxSl/Wp9DO7hQ7RnKNh9/OiZj+/s3wNM8F1QNcvAWtWr2Tuzlc7eEtYO0rV89oLeO0KZFKDz9zaY3aCfn0qkw0OY10GUBk3xrK0/qwstSjr1s4TiTWqq4TroP3Lz6UwLP/g8L8CH/6pt7IbCb1BZ50DjZALOrnTtYCuPjH1Sycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737908; c=relaxed/simple;
	bh=5xqiFcAZi9RX2PdWXHIY4GaH2jOnbkRZ+naZwtNbbHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htxZPZNDfXHt2YrkjADGNjMo4QI50K0o3Xw+dxL8h6/KEbqCElSueH6YBG4RSB/8/WlAKzap3RVMPEXbOI9lNHKHgOUW6xpHDW41Pfi/SzS9mBfxecvoAIH/wPjVq+XO3AqMp0bf7orlNYEqGbeBQ3AewKUdmZm2esBXTZBwLeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DL3V6j16; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DL3V6j16"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D5FE44E413BC;
	Wed, 26 Aug 2026 09:51:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA346604EC;
	Wed, 26 Aug 2026 09:51:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1752211C7AD68;
	Wed, 26 Aug 2026 11:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737902; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Mikj5TNqsEyt+SiXGc+SpD7W2whIh6DoMhBvs5/JJrs=;
	b=DL3V6j16eTAH8rXNxnJCeTVcy8V11JPa40VCssjxBwHH7HhpShRWSR+X40QVLq7JULf4UU
	aqMcDDDpyFANwf4xlUkucw5gsjGU1K1GShap/UOOcICGrv4Me9vnQ6AZbYL8QEXQ6BTXf6
	pzAsvWrYP7EnNgMgHnMIzvRk0Bge7ayd9RgBFTS7B0CXzC1Zqiihxndngzi3Hv2kaR7wQJ
	VqF67SJlx8u4P/Ol5/nMyhwap3dF/mZKT/o6bpQMXr7FXyCJKO4ETSIEI4JPmk2Oa9kjjo
	0PGpHAybtHQUaV24O3zPmDBzTjy9CDnvIfbsM0z80ng1P9gL5RsWi1yh/iBFQw==
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
Subject: [RFC PATCH v2 20/74] dtc: Extend complete_references() to handle export symbols
Date: Wed, 26 Aug 2026 11:48:49 +0200
Message-ID: <20260826094950.1088288-21-herve.codina@bootlin.com>
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

Export symbols parsed from a .dts or .dtb file suffer from the same
incompleteness as REF_PHANDLE markers. They may lack either the
ref string or the is_local flag depending on the device-tree input
format used.

Apply the same completion operation as the one done for REF_PHANDLE
markers.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 livetree.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/livetree.c b/livetree.c
index 111c651b..8c94e81f 100644
--- a/livetree.c
+++ b/livetree.c
@@ -584,6 +584,7 @@ static void complete_ref_and_is_local(struct dt_info *dti, char **ref,
 
 static void complete_references_internal(struct dt_info *dti, struct node *node)
 {
+	struct symbol *exportsym;
 	struct property *prop;
 	struct marker *m;
 	struct node *c;
@@ -613,6 +614,16 @@ static void complete_references_internal(struct dt_info *dti, struct node *node)
 		}
 	}
 
+	/*
+	 * The exact same behavior exists for export symbols when a dts or a dtb
+	 * is parsed. Perform the exact same completion for export symbols
+	 */
+	for_each_symbol(node->exportsymlist, exportsym) {
+		complete_ref_and_is_local(dti, &exportsym->ref,
+					  &exportsym->is_local,
+					  exportsym->phandle);
+	}
+
 	for_each_child(node, c)
 		complete_references_internal(dti, c);
 }
@@ -637,7 +648,7 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	fill_fullpaths(dti->dt, "");
 
 	/*
-	 * Complete references (REF_PHANDLE).
+	 * Complete references (REF_PHANDLE and export symbols).
 	 * Set ref strings and set is_local flags
 	 */
 	complete_references(dti);
-- 
2.55.0

