Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAB5361647
	for <devicetree-spec@vger.kernel.org>; Mon, 12 Jan 2026 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227689; cv=none; b=dWm3HM+vbqdCjYbnTKA5kg/Q6aZRlXZ+weNGuXoUJvloBlIQGa7z0SoJTPmglZ5sPzhpKn4E0Ie7HwOhj92ZWXj/9RObENTpvi+hdfjYVMHqDYkvVdLC0CR1OFFPLZPfLwL5KAAHRgWlDcjpxO4S2q0xWNlgU7g1hsll8hUT4PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227689; c=relaxed/simple;
	bh=OoyS4UC/Wzp1sAwL4X8FtdLsOhjxMAp/Hu2r358yXBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgiMqx/t1NUWHJZ3cbllE88Obtksgr3cBEmG/vFzAvewxy5+4tIpTHyyio3MbiWkR0YvY/aDVjDIJ9dh2zhyHFSajPwDhJJXVA4geBm0HOyVm332lKjKFL9+CuOn/OcitgnlCXLNYeqWw/AT9JJGps6VfAdCxHRRpPeWA7+Nw20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ACc/Vk+3; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ACc/Vk+3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5A31DC2086D;
	Mon, 12 Jan 2026 14:20:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D21FF606FA;
	Mon, 12 Jan 2026 14:21:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19390103C9267;
	Mon, 12 Jan 2026 15:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227682; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cN+EDkDZwy4x05AXNz2uJNmRjetYUqQ5KbnRnubDECs=;
	b=ACc/Vk+3TMt/HHR1566QDs3oS3eWx6uuhbNZwxtLwagqwp2NaqT2baqRAvXGP+flNwLF5z
	mmETsQn/bmz5n7/ad1zkqP/x4bIjQ8k8hCQ/iAwqeuoNduudwVKzJFK2pMsEB6IC4dtlIE
	kijPLxhnNvLBNdF9z//Xrk1NTh5CvuBKPKc0Bzx1wrfJr8CGw1vL2PpqLk8TRFu4cwRGFJ
	I2Tq75kiaMEQBKfvQMfggwfcS2Nik6mlPPM5vzEdy4SrO7kRWKzsqFZjrZ2G29cVtPNjG/
	SVjo35vda2YkLSjJNDLoyyg9aj9MpBVz9BWJNm5HMTXgacajH41If23kjdBiAw==
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
Subject: [RFC PATCH 40/77] dtc: Introduce dti_get_node_by_path()
Date: Mon, 12 Jan 2026 15:19:30 +0100
Message-ID: <20260112142009.1006236-41-herve.codina@bootlin.com>
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

The future introduction of orphan nodes for addons device-tree will lead
to more than one tree in the addons data. Those trees will be:
  - the classical root tree starting at the root node
  - trees related to orphan nodes

Also, an addon device-tree can have only trees based on orphan nodes. In
other words an addon device-tree is valid without having the classical
'root' tree.

To prepare this change, introduce and use dti_get_node_by_path().

dti_get_node_by_path() retrieves a node by its path like
get_node_by_path() but it works at the struct dt_info level.

It handles the case where a 'root' device-tree is not present and will
handle orphan nodes trees as soon as they will be introduced.

This introduction doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c   |  2 +-
 dtc.h      |  3 ++-
 livetree.c | 15 ++++++++++++++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/checks.c b/checks.c
index 9744431..b2b1bf7 100644
--- a/checks.c
+++ b/checks.c
@@ -740,7 +740,7 @@ static void check_alias_paths(struct check *c, struct dt_info *dti,
 
 		/* This check does not work for overlays nor addons with external paths */
 		if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON)) &&
-		    (!prop->val.val || !get_node_by_path(dti->dt, prop->val.val))) {
+		    (!prop->val.val || !dti_get_node_by_path(dti, prop->val.val))) {
 			FAIL_PROP(c, dti, node, prop, "aliases property is not a valid node (%s)",
 				  prop->val.val);
 			continue;
diff --git a/dtc.h b/dtc.h
index 4ebe576..8ba093f 100644
--- a/dtc.h
+++ b/dtc.h
@@ -323,7 +323,6 @@ struct property *get_property_by_label(struct node *tree, const char *label,
 struct marker *get_marker_label(struct node *tree, const char *label,
 				struct node **node, struct property **prop);
 struct node *get_subnode(struct node *node, const char *nodename);
-struct node *get_node_by_path(struct node *tree, const char *path);
 struct node *get_node_by_label(struct node *tree, const char *label);
 struct node *get_node_by_phandle(struct node *tree, cell_t phandle);
 struct node *get_node_by_ref(struct node *tree, const char *ref);
@@ -357,6 +356,8 @@ struct dt_info {
 	const char *outname;		/* filename being written to, "-" for stdout */
 };
 
+struct node *dti_get_node_by_path(struct dt_info *dti, const char *path);
+
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
 #define DTSF_PLUGIN	0x0002	/* /plugin/ */
diff --git a/livetree.c b/livetree.c
index 285f6e1..23ba957 100644
--- a/livetree.c
+++ b/livetree.c
@@ -659,7 +659,7 @@ struct node *get_subnode(struct node *node, const char *nodename)
 	return NULL;
 }
 
-struct node *get_node_by_path(struct node *tree, const char *path)
+static struct node *get_node_by_path(struct node *tree, const char *path)
 {
 	const char *p;
 	struct node *child;
@@ -785,6 +785,19 @@ struct node *get_node_by_ref(struct node *tree, const char *ref)
 	return target;
 }
 
+struct node *dti_get_node_by_path(struct dt_info *dti, const char *path)
+{
+	struct node *node;
+
+	if (dti->dt) {
+		node = get_node_by_path(dti->dt, path);
+		if (node)
+			return node;
+	}
+
+	return NULL;
+}
+
 static void add_phandle_property(struct node *node,
 				 const char *name, int format)
 {
-- 
2.52.0

