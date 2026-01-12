Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D5E35EDAB
	for <devicetree-spec@vger.kernel.org>; Mon, 12 Jan 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227678; cv=none; b=ePTFsL6DvfPAMCiF25FC0sZ4HTDUzVsdFVMs+dQsNWa449BGr3NWTzNjdeM3XGjk/L5ouxGdYHhTAa3t932wO85/N8PUdjhbmv9RJnvbnitVZrkfsui0JBtTxnhWJQjRGGvty3hpZMu6RpAAmlbFlmYdWcHO9XdvyeuztAwyB3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227678; c=relaxed/simple;
	bh=Fbwc+CPSfjhz85440juvsZ0pX7weWkITVUYz8eTZYfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNP6hIZZzuk/trHX2h07B/EVVOfjHLm2TUykYcYCQDIbdNPvJOu6s009AufTYNP69Y+sKw7h359O1IeVgtOjsc7TnNks+wvNC5vFCtsVeAiDWm2kuzApassyjrhMMCVIsz5qvdExTULpUxF6t0H/T2xBpa0+NlGobHYO8thLcJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rn9eEAn7; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rn9eEAn7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 302221A280C;
	Mon, 12 Jan 2026 14:21:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07055606FA;
	Mon, 12 Jan 2026 14:21:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EEB0F103C8CD8;
	Mon, 12 Jan 2026 15:21:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227668; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ac92SjZaWRlxbkMuumtO9ux8bEMj0nelgYnFJXuWnmg=;
	b=rn9eEAn7bhvN55DNBuIKQQjH6ooCxXAzEWYguAG+riKGzMoQwV/ASiVevxkV72czNFaEXA
	xwF+7kXBdZi39rFSWuZ42t3OOFhkaTjgOf1TTK+hS6YQT5y5C22vScfxnh4EfJCIgCkZA/
	APs6NB9UowNpVWpoEFcihUFehlZfw79pzrhZ0zVqSk+nSRYNu/MewQPZqa5stIiTsekJrm
	g/qn2gMLamuAO+y7M4SqhtSz0yFoziIK63afvg9fpiq3IM8fO9agDjklrs0lqokXG6dGW9
	Yef744q6h2EkDdqtAdK6LZ8zVZbt1pP22mZjCFX4D3SaN6DX2DngJmMelNTONA==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>,
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
Subject: [RFC PATCH 30/77] tests: metadata: Add export symbols with external references tests
Date: Mon, 12 Jan 2026 15:19:20 +0100
Message-ID: <20260112142009.1006236-31-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112142009.1006236-1-herve.codina@bootlin.com>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add tests related to export symbols using external references
(FDT_EXPORT_SYM_REF dtb tag).

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_exportsyms_ref.dtb.dts.expect | 25 +++++++++++++++++++
 tests/metadata_exportsyms_ref.dtb.expect     | 18 ++++++++++++++
 tests/metadata_exportsyms_ref.dts            | 26 ++++++++++++++++++++
 tests/metadata_exportsyms_ref.dts.dts.expect | 25 +++++++++++++++++++
 tests/run_tests.sh                           |  3 ++-
 5 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100644 tests/metadata_exportsyms_ref.dtb.dts.expect
 create mode 100644 tests/metadata_exportsyms_ref.dtb.expect
 create mode 100644 tests/metadata_exportsyms_ref.dts
 create mode 100644 tests/metadata_exportsyms_ref.dts.dts.expect

diff --git a/tests/metadata_exportsyms_ref.dtb.dts.expect b/tests/metadata_exportsyms_ref.dtb.dts.expect
new file mode 100644
index 0000000..d2c3320
--- /dev/null
+++ b/tests/metadata_exportsyms_ref.dtb.dts.expect
@@ -0,0 +1,25 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	node-a {
+	};
+
+	node-b {
+	};
+
+	node-c {
+
+		sub-node {
+
+			/export/ ref_base_node_a: &base_node_a;
+			/export/ ref_base_node_b: &base_node_b;
+		};
+	};
+
+	node-d {
+
+		/export/ ref_base_node_c: &base_node_c;
+	};
+};
diff --git a/tests/metadata_exportsyms_ref.dtb.expect b/tests/metadata_exportsyms_ref.dtb.expect
new file mode 100644
index 0000000..395861b
--- /dev/null
+++ b/tests/metadata_exportsyms_ref.dtb.expect
@@ -0,0 +1,18 @@
+/dts-v1/;
+/addon/;
+
+/ {
+    node-a {
+    };
+    node-b {
+    };
+    node-c {
+        sub-node {
+            // [FDT_EXPORT_SYM_REF] 'ref_base_node_a' -> 'base_node_a'
+            // [FDT_EXPORT_SYM_REF] 'ref_base_node_b' -> 'base_node_b'
+        };
+    };
+    node-d {
+        // [FDT_EXPORT_SYM_REF] 'ref_base_node_c' -> 'base_node_c'
+    };
+};
diff --git a/tests/metadata_exportsyms_ref.dts b/tests/metadata_exportsyms_ref.dts
new file mode 100644
index 0000000..c094be1
--- /dev/null
+++ b/tests/metadata_exportsyms_ref.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/ {
+	node-a {
+	};
+
+	node-b {
+	};
+
+	node-c {
+		sub_node: sub-node {
+			/export/ ref_base_node_a: &base_node_a;
+			/export/ ref_base_node_b: &base_node_b;
+		};
+	};
+
+	node-d {
+		/export/ ref_base_node_c: &base_node_c;
+	};
+};
diff --git a/tests/metadata_exportsyms_ref.dts.dts.expect b/tests/metadata_exportsyms_ref.dts.dts.expect
new file mode 100644
index 0000000..2654df1
--- /dev/null
+++ b/tests/metadata_exportsyms_ref.dts.dts.expect
@@ -0,0 +1,25 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	node-a {
+	};
+
+	node-b {
+	};
+
+	node-c {
+
+		sub_node: sub-node {
+
+			/export/ ref_base_node_a: &base_node_a;
+			/export/ ref_base_node_b: &base_node_b;
+		};
+	};
+
+	node-d {
+
+		/export/ ref_base_node_c: &base_node_c;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index fc270e2..1973525 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1126,7 +1126,8 @@ wrap_fdtdump () {
 
 metadata_tests() {
 	for dt in metadata_reflocal metadata_refphandle \
-		  metadata_addon_base metadata_exportsyms_local; do
+		  metadata_addon_base metadata_exportsyms_local \
+		  metadata_exportsyms_ref; do
 		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
 		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
 		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
-- 
2.52.0

