Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F8D3DA5DA;
	Wed, 26 Aug 2026 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737913; cv=none; b=DkhwWftLIoeGzqBcReqEho4KtmoBkrTvsY+EomzTXcL38Icge2wd4odDPx+cN7mu1t1tweaFno5S3wfkicG88utf1ZZXFpYyZIqsbGg7DkSWQJAAY9ekbS2yA6PruzfKQcuihMzdsAQEpu74MiQ0cgMXPA5oXdV39G/SUS9FW2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737913; c=relaxed/simple;
	bh=RZ9OKwfjb9UmzlASGFCjaFhIi4cX4D9FIuY66+RGyX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuh27FJILh21g6bF+IxoKjs+rPA9tFS7RfKDK50Q3G2cnhjA9EdNMcqyrIMyZxfkBQoqHD3LGw/Gd8K58JxcQGtui+RB0Jiucr5uh267NzvbvehEwa8E0A4m0hZTujVqPinmCWpJCQHmZ+nHUchzZbeMlnFiygKvY33ZRCd0Sdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XYAfGJwF; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XYAfGJwF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 846134E413C1;
	Wed, 26 Aug 2026 09:51:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 58428604EC;
	Wed, 26 Aug 2026 09:51:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C339411C780F5;
	Wed, 26 Aug 2026 11:51:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737907; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3fpiGK3MoHlko4IQ+XEILhmqXIbPnabGHGo2TTb3Nfo=;
	b=XYAfGJwFazFt9hmWdTxWcUPSBVjXT/J9Uwg8fIdtxiZh8I14imgS6KSjun2+7ko5+uYbXk
	uO0wNXbRGPwnFkeLfIuk61DIqkAWGiNcA1Nd+RZk7lWbcGsiVrxt/0Pie0P9ap7mROvb1z
	39IvAc6fOU6S3ggwHUjD4oBr93MnNR9xMPsPXtXYAwmW/zkecDLUuW41dZhhJRmsGyYwL0
	5EVP2Tlx73jPIgpIGglU9mR2CTDCf4hADjhScPO2CP0lF0envaEx7PYd4u7301NelRt2xP
	qJGEJJrQmIWi/NdEiG+KUg4fpCArrywWYRFV2OCLJ92yDZYlAj+cqyXuJbg+mQ==
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
Subject: [RFC PATCH v2 22/74] tests: metadata: Add export symbols with local references tests
Date: Wed, 26 Aug 2026 11:48:51 +0200
Message-ID: <20260826094950.1088288-23-herve.codina@bootlin.com>
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

Add tests related to export symbols using local phandle references
(FDT_EXPORT_SYM dtb tag).

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../metadata_exportsyms_local.dtb.dts.expect  | 26 +++++++++++++++++
 tests/metadata_exportsyms_local.dtb.expect    | 20 +++++++++++++
 tests/metadata_exportsyms_local.dts           | 28 +++++++++++++++++++
 .../metadata_exportsyms_local.dts.dts.expect  | 26 +++++++++++++++++
 tests/run_tests.sh                            |  2 +-
 5 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_exportsyms_local.dtb.dts.expect
 create mode 100644 tests/metadata_exportsyms_local.dtb.expect
 create mode 100644 tests/metadata_exportsyms_local.dts
 create mode 100644 tests/metadata_exportsyms_local.dts.dts.expect

diff --git a/tests/metadata_exportsyms_local.dtb.dts.expect b/tests/metadata_exportsyms_local.dtb.dts.expect
new file mode 100644
index 00000000..ac3d5b3a
--- /dev/null
+++ b/tests/metadata_exportsyms_local.dtb.dts.expect
@@ -0,0 +1,26 @@
+/dts-v1/;
+
+/ {
+
+	node-a {
+	};
+
+	node-b {
+		phandle = <0x03>;
+	};
+
+	node-c {
+
+		sub-node {
+			phandle = <0x02>;
+		};
+	};
+
+	node-d {
+		phandle = <0x01>;
+
+		/export/ node_d: &{/node-d};
+		/export/ subnode_c: &{/node-c/sub-node};
+		/export/ node_b: &{/node-b};
+	};
+};
diff --git a/tests/metadata_exportsyms_local.dtb.expect b/tests/metadata_exportsyms_local.dtb.expect
new file mode 100644
index 00000000..e09437f8
--- /dev/null
+++ b/tests/metadata_exportsyms_local.dtb.expect
@@ -0,0 +1,20 @@
+/dts-v1/;
+
+/ {
+    node-a {
+    };
+    node-b {
+        phandle = <0x00000003>;
+    };
+    node-c {
+        sub-node {
+            phandle = <0x00000002>;
+        };
+    };
+    node-d {
+        // [FDT_EXPORT_SYM] 'node_d' -> phandle 0x00000001
+        // [FDT_EXPORT_SYM] 'subnode_c' -> phandle 0x00000002
+        // [FDT_EXPORT_SYM] 'node_b' -> phandle 0x00000003
+        phandle = <0x00000001>;
+    };
+};
diff --git a/tests/metadata_exportsyms_local.dts b/tests/metadata_exportsyms_local.dts
new file mode 100644
index 00000000..10e6e47a
--- /dev/null
+++ b/tests/metadata_exportsyms_local.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+
+/ {
+	node-a {
+	};
+
+	node_b: node-b {
+	};
+
+	node-c {
+		sub_node: sub-node {
+		};
+	};
+
+	node_d: node-d {
+		/export/ node_d: &node_d;
+		/export/ subnode_c: &sub_node;
+	};
+};
+
+&node_d {
+	/export/ node_b: &node_b;
+};
diff --git a/tests/metadata_exportsyms_local.dts.dts.expect b/tests/metadata_exportsyms_local.dts.dts.expect
new file mode 100644
index 00000000..4723e7e4
--- /dev/null
+++ b/tests/metadata_exportsyms_local.dts.dts.expect
@@ -0,0 +1,26 @@
+/dts-v1/;
+
+/ {
+
+	node-a {
+	};
+
+	node_b: node-b {
+		phandle = <0x03>;
+	};
+
+	node-c {
+
+		sub_node: sub-node {
+			phandle = <0x02>;
+		};
+	};
+
+	node_d: node-d {
+		phandle = <0x01>;
+
+		/export/ node_d: &node_d;
+		/export/ subnode_c: &sub_node;
+		/export/ node_b: &node_b;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f119acc0..06c27b71 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1249,7 +1249,7 @@ fdtoverlay_tests() {
 
 metadata_tests() {
 	for dt in metadata_propdata_phandle_local metadata_propdata_phandle_ref \
-		  metadata_addon_base; do
+		  metadata_addon_base metadata_exportsyms_local; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.55.0

