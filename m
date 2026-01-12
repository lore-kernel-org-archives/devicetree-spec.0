Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D826735EDDC;
	Mon, 12 Jan 2026 14:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227678; cv=none; b=CSQQyeRjwMj3lITSgaggAwWX/QH5V4R0o3Xb4pAMgKXD39cvc8EJIhNx+EDZFUqQFja6CMEJhVdnOuFz4SIGRtcAd5rZ81wH9XURcFMQUmArAgzUi+qhvCt1x9gyc6uZ6d+3iqL27lnwCblnuWdkrSejcBipba733Z7SJeY3ilI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227678; c=relaxed/simple;
	bh=G6ixOon71m3vdzrrCu9liSPXb8xkcl7TAu4sMZzvB1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRj+GyeVFFHOjTVNZ8kqj15VOHGN6OkHloLopz+aMvuAiygqcZLYxzAB8oRrfwaT22EGqhsxdrAQhll5zEUnxmmSTQip9gBZ4EpHc2GWMiRRxJhUASb3K+ouvNaBt8eRiaun7KSKHXdppbFzGjUO6HE4tR3F6r75t9pag1Pe210=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zrsTS+Ag; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zrsTS+Ag"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 18394C2086D;
	Mon, 12 Jan 2026 14:20:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FEF2606FA;
	Mon, 12 Jan 2026 14:21:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0068103C9261;
	Mon, 12 Jan 2026 15:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227673; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zf0RdmR6L6y/T0lQPpa2UuZniR+B2NDmmA3x0g2ZM/g=;
	b=zrsTS+Agg+7yIv1Qo+wcmWMx3iOIpi+qfAjA7cogl509mvyDVeZuTGv2DfQ6olYuz0RLsg
	PpMmYTyRAi9x7W7HmSTSR8Jtf762J8djzNchbyAqrRchZeIzmzCbXJ4+/95YfcIdN+H1KT
	W/zL7Cppf0Pklx5EIO45cHaFoH+6pD/t8lM6D0TUcPkCeYXzz+EMBJ/JrlDUUqClMuSfqr
	KlCWYgKTnrFmh8Z//LJIRT5rQWNgLuQ0gKWtIERlNooThwSya1H66PjnnX0Y4GVdvuKRnx
	5YRzCMZwwoYfPucNsaQ1HyZ7YQFG+RZP4/aDByVO3sJ9tPcYZhk+t/k88roMow==
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
Subject: [RFC PATCH 34/77] dtc: Add import symbols (/import/ keyword) in generated dts file
Date: Mon, 12 Jan 2026 15:19:24 +0100
Message-ID: <20260112142009.1006236-35-herve.codina@bootlin.com>
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

The import symbols (/import/ keyword) parsing from a dts file is
supported.

Add the support for this keyword in the dts file generation.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 treesource.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/treesource.c b/treesource.c
index 9effe38..04f65bb 100644
--- a/treesource.c
+++ b/treesource.c
@@ -381,6 +381,7 @@ static void write_tree_source_node(FILE *f, struct node *tree, int level)
 void dt_to_source(FILE *f, struct dt_info *dti)
 {
 	struct reserve_info *re;
+	struct symbol *importsym;
 
 	fprintf(f, "/dts-v1/;\n");
 	if (dti->dtsflags & DTSF_ADDON)
@@ -397,5 +398,14 @@ void dt_to_source(FILE *f, struct dt_info *dti)
 			(unsigned long long)re->size);
 	}
 
+	if (dti->importsymlist) {
+		for_each_symbol(dti->importsymlist, importsym) {
+			fprintf(f, "/import/ %s: \"%s\";\n",
+				importsym->name,
+				importsym->compatible);
+		}
+		fprintf(f, "\n");
+	}
+
 	write_tree_source_node(f, dti->dt, 0);
 }
-- 
2.52.0

