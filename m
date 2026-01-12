Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB92B25A33F;
	Mon, 12 Jan 2026 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227638; cv=none; b=FQ6ICimj2Y2sOWzgH44wOE24SX23psyXumeGYEE41ilC/7bwMYhXA0LKMSmOhohgt8eKV8CzSfjPGlKjEsMx9fX5TfAOkp/CAyKGxrY1DDuZG4GtVDphmDoYYJ4wqyvVr2RZCVZr8vJRl7L0BBXBs28SEP1FEYaAaV1YkfExNXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227638; c=relaxed/simple;
	bh=8icfqPELgBR70xUKNLjUJGX7//gjd6acEmboB01cqzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qM9CBE8bjB36YHEExt5k2rTlYVbEzwHKYGKQdO5tjnOLdMndtM86lqBLFAtu0ZFQgrERHsvqPK7w7N1oUTG2SaoVYqFF33/sK3fq+kxUHxzdFNuwNVuTHrJFKx7Kc+LPVXPtk/Go+o9q6yi7Vf4GXmwa6jSefZisLw/Mcee+9OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pDR9yfQ4; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pDR9yfQ4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5C36B4E4208B;
	Mon, 12 Jan 2026 14:20:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32167606FA;
	Mon, 12 Jan 2026 14:20:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AF9F103C9263;
	Mon, 12 Jan 2026 15:20:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227634; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=74KBIs7Q6u//Ah9/aNetQalsEtH5TnbY0fwXskVdBvM=;
	b=pDR9yfQ4glOvotcXQ9NcSlotEd2QQmDUw2jdnV3HFakiYXgDkL+npnwy9prUNznsnzDQ0/
	M2ytaVyPsxwTL8az3u72LOukBWOXgxOtWCfhiYvvkGF0dFNr7POJHZFtAveqBQpcK9Xp5q
	EcjJjKGRAdJfMe/jgVLCjhYlqvJgUfXH+0eeZRfVMHPPefc0Z2yLnYS9FrFYCk74ygebRQ
	GTuPaLayKLs5q9Y5tsT+L6RmofAvRIpr7McsBSC5HHymYx/Mi517UC/yo4bzROWFtCBuWi
	zMT8sGrcLgwbWk2biZkDbRaC+JcrEKTfRRGwjJG7hXOulZuZ1aXKc3/V0dRBig==
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
Subject: [RFC PATCH 08/77] dtc: Introduce update_phandles_ref()
Date: Mon, 12 Jan 2026 15:18:58 +0100
Message-ID: <20260112142009.1006236-9-herve.codina@bootlin.com>
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

With the introduction of FDT_REF_LOCAL dtb tag, a local phandle used
by a property is identify when a dtb is parsed.

In order to have consistent internal data, the reference related to this
phandle usage needs to be updated based on the phandle value.

This is done by update_phandles_ref().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc.c      |  2 ++
 dtc.h      |  2 ++
 livetree.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/dtc.c b/dtc.c
index b3445b7..88f03ff 100644
--- a/dtc.c
+++ b/dtc.c
@@ -333,6 +333,8 @@ int main(int argc, char *argv[])
 		generate_fixups = 1;
 	}
 
+	update_phandles_ref(dti);
+
 	process_checks(force, dti);
 
 	if (auto_label_aliases)
diff --git a/dtc.h b/dtc.h
index 965321c..351fe41 100644
--- a/dtc.h
+++ b/dtc.h
@@ -345,6 +345,8 @@ void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
 void generate_fixups_tree(struct dt_info *dti, const char *name);
 void generate_local_fixups_tree(struct dt_info *dti, const char *name);
 
+void update_phandles_ref(struct dt_info *dti);
+
 /* Checks */
 
 void parse_checks_option(bool warn, bool error, const char *arg);
diff --git a/livetree.c b/livetree.c
index 9b67934..9e30a63 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1158,3 +1158,41 @@ void generate_local_fixups_tree(struct dt_info *dti, const char *name)
 			"Warning: Preexisting data in %s malformed, some content could not be added.\n",
 			name);
 }
+
+static void update_phandles_ref_internal(struct dt_info *dti, struct node *node)
+{
+	struct node *c;
+	struct property *prop;
+	struct marker *m;
+	struct node *refnode;
+	cell_t phandle;
+
+	for_each_property(node, prop) {
+		m = prop->val.markers;
+		for_each_marker_of_type(m, REF_PHANDLE) {
+			if (m->ref)
+				continue;
+
+			if (m->is_local) {
+				phandle = propval_cell_n(prop,
+							 m->offset / sizeof(cell_t));
+				refnode = get_node_by_phandle(dti->dt, phandle);
+				if (!refnode)
+					die("Node not found for phandle 0x%"PRIx32"\n", phandle);
+
+				m->ref = refnode->fullpath;
+				continue;
+			} else {
+				die("Found a non local phandle without a reference\n");
+			}
+		}
+	}
+
+	for_each_child(node, c)
+		update_phandles_ref_internal(dti, c);
+}
+
+void update_phandles_ref(struct dt_info *dti)
+{
+	update_phandles_ref_internal(dti, dti->dt);
+}
-- 
2.52.0

