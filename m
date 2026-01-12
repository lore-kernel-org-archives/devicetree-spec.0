Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1671B350A29
	for <devicetree-spec@vger.kernel.org>; Mon, 12 Jan 2026 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227681; cv=none; b=qUV3S9TkNbjAneSyCoiufbB+k4q3QXXjIniHdMExU8gPf3hPVuym2OoOtp8B/oHm7+TvCiOMgRY2I5BBn6y7qAGhYLr8zrdEStoMjWRYzh7oemNiIXLC9fdP2uV3sz2Xg/QL+hSz0TO8HqqROb2Weo9KZs5ht6sIwVjWgNM4+3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227681; c=relaxed/simple;
	bh=Qupti9JYIx5M1WClAqjvNcU4GtJ8Ej/MuffmAQXKn9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qkRIqat8xv1bpq5frl7TBI9OdUEFUIGDeF5ZpoghQusO3O+697j4v0Luop4KTy0iyTeXc96LHcQctidoVtHwome6Ea6LsIpkgXkbBJkrOCPFqGciQf61wIqkA4ctekZeVxR3AKaTiHS4Rl9eJQinzaRYsCzAJPIZnpaeR4+yFPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HrELKDXR; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HrELKDXR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 36EE1C2086B;
	Mon, 12 Jan 2026 14:20:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF1E1606FA;
	Mon, 12 Jan 2026 14:21:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51B9E103C9260;
	Mon, 12 Jan 2026 15:21:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227669; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FemrtMrSgqeOA8KgOvOh4Sq9DDEMgd+SGRC7M4Bg9u8=;
	b=HrELKDXR36UQl6h4YdJqaifnopf+5Hprs1KWzhJbc+ZD82OGl9my6cySn0ah/wOOTex+lp
	Ocu9RypEP74l+HXiyllsQ7DksOEQvNRaXYVCQSt3CVmeVSen6TBD1F4r3MwNZwwqVDbTbo
	C7WL92fsg7x4TgEMHsAs6bnPGP702EezgbOIcx+N5Emwh3N8GV28QB02HvxwL6pit3PLhK
	AVQLKwyWnA4shqCTysCtePcrHMK9TdU1UNsh1+L5B8g8CJ53wtj4RFwUkmLC5LiRkGBP7C
	lTk+Wq0y3Lm/iRW+BB4KGcZAUPIgp79m/Wm+O/cGZNNfFwdPHJ218CPacX6kFw==
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
Subject: [RFC PATCH 31/77] dtc: Introduce import symbols
Date: Mon, 12 Jan 2026 15:19:21 +0100
Message-ID: <20260112142009.1006236-32-herve.codina@bootlin.com>
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

Import symbols allow to define a list of symbols imported and used by an
addon.

Those symbols have to be resolved when the addon is applied on a base
device-tree and will involved exported symbols provided at the node the
addon is applied to.

Import symbols are similar in term of feature to __fixups__ available
in device-tree overlays.

The goal is to identify symbols which are used by an addon but not
defined by the addon itself. Those specific symbols are the imported
symbols.

Introduce the import symbols list related to an addon. No functional
change yet but preparation for the future support for import symbol
parsing.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-parser.y | 3 ++-
 dtc.h        | 4 +++-
 flattree.c   | 2 +-
 fstree.c     | 2 +-
 livetree.c   | 4 +++-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index a0d0aef..4e46e9d 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -113,7 +113,8 @@ sourcefile:
 	  headers memreserves devicetree
 		{
 			parser_output = build_dt_info($1, $2, $3,
-			                              guess_boot_cpuid($3));
+			                              guess_boot_cpuid($3),
+						      NULL);
 		}
 	;
 
diff --git a/dtc.h b/dtc.h
index 22816ba..796ed51 100644
--- a/dtc.h
+++ b/dtc.h
@@ -350,6 +350,7 @@ struct dt_info {
 	struct reserve_info *reservelist;
 	uint32_t boot_cpuid_phys;
 	struct node *dt;		/* the device tree */
+	struct symbol *importsymlist;	/* Import symbol list */
 	const char *outname;		/* filename being written to, "-" for stdout */
 };
 
@@ -360,7 +361,8 @@ struct dt_info {
 
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
-			      struct node *tree, uint32_t boot_cpuid_phys);
+			      struct node *tree, uint32_t boot_cpuid_phys,
+			      struct symbol *importsymlist);
 void sort_tree(struct dt_info *dti);
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
 void generate_fixups_tree(struct dt_info *dti, const char *name);
diff --git a/flattree.c b/flattree.c
index d970259..47a289f 100644
--- a/flattree.c
+++ b/flattree.c
@@ -1105,5 +1105,5 @@ struct dt_info *dt_from_blob(const char *fname)
 
 	fclose(f);
 
-	return build_dt_info(DTSF_V1 | dtsflags, reservelist, tree, boot_cpuid_phys);
+	return build_dt_info(DTSF_V1 | dtsflags, reservelist, tree, boot_cpuid_phys, NULL);
 }
diff --git a/fstree.c b/fstree.c
index 445ae53..a6aaf1e 100644
--- a/fstree.c
+++ b/fstree.c
@@ -72,5 +72,5 @@ struct dt_info *dt_from_fs(const char *dirname)
 	tree = read_fstree(dirname);
 	tree = name_node(tree, "");
 
-	return build_dt_info(DTSF_V1, NULL, tree, guess_boot_cpuid(tree));
+	return build_dt_info(DTSF_V1, NULL, tree, guess_boot_cpuid(tree), NULL);
 }
diff --git a/livetree.c b/livetree.c
index 1de5990..4ec9609 100644
--- a/livetree.c
+++ b/livetree.c
@@ -531,7 +531,8 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
 
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
-			      struct node *tree, uint32_t boot_cpuid_phys)
+			      struct node *tree, uint32_t boot_cpuid_phys,
+			      struct symbol *importsymlist)
 {
 	struct dt_info *dti;
 
@@ -540,6 +541,7 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	dti->reservelist = reservelist;
 	dti->dt = tree;
 	dti->boot_cpuid_phys = boot_cpuid_phys;
+	dti->importsymlist = importsymlist;
 
 	return dti;
 }
-- 
2.52.0

