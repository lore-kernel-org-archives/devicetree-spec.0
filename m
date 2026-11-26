Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692227;
	b=NAPzIms48zkYtzB+4MWaH8LjxWoK7l0IvXAtamPGw4ZJpNrniE1puuZlCO1C8RM0aJ1c
	 R+DD4/44IVohGM+BK7YS3sugfDw+OIECRMCFe8kNssY8y1C70T5GfS5bRpUtSKK+wTxua
	 q2vVdLClvk/XdV4AzRu1SPtc8cczfBT3UI6rGaQK95mTt6r8HqJ5tG67Nrp10ibLgwjHy
	 ag3lu7mhhFw2h/lGOm9oJibqHlrekL7Km0jioBnz+1rY7YCAAUbHg8nIKSMiOzhH36hd5
	 61zVXJSv/nK3QyURLyv20oC7TDIxdQDRqucT1dA5IBhnPPaI3mYwn2F8BORedqJKQMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692227;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=o8uIXl9o/pNf+alDSsYUvXOB+LVRQrPiFrS9AtaVhWw=;
	b=kGUKgTQTEx8IcLD1ahbD3NU1YQIdRIbBP0GLNEpKMUFar1Eg8xR0emsgpDg0yoplZGM9
	 Qwfx8TdwYBNhM5hmB0o15xNhvugC8i75G2Do0dPWM6HtANcx7QM4hqVr7XS9RIA1oE9NE
	 5x98Ox6BCbpQMW8yDeVC+E4b0MLc1bOMdUHCKo7JQD2THbK9F4PMC546t0E9mGrLsCzi8
	 auXKlN44P3hEQZZ+91G4VqiFk3OF/MvHS1jwY46PJJmooGCsHkVF58W4mnAU91DOnwFSn
	 SCrv7XrRcnWLofGcjih2VlFRms042xDtP6sFDVyZqom3hTBY8/ek9Jh0kHeNCEICo6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Pw/OrKx7";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCF2606A330
	for <devicetree-spec@vger.kernel.org>; Thu, 26 Nov 2026 11:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FCF2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pw/OrKx7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 82E2DC2B9C7;
	Thu, 26 Nov 2026 11:23:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BF9860237;
	Thu, 26 Nov 2026 11:23:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C13FD11E6B370;
	Thu, 26 Nov 2026 12:23:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692219; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=o8uIXl9o/pNf+alDSsYUvXOB+LVRQrPiFrS9AtaVhWw=;
	b=Pw/OrKx79bTSwdRdsCcF+2A4pzwb49mY8IDwDJiT//2FrvUdTOPfChlEhiThHFUyP9pai+
	cJMVIJV5c+eHSlCadOR7FUcNSQxKB9gXDGn4bflKFwRR3MrM7HcTFz4zrOrJvKFGIWe98y
	TSdAkU55iJNe4KTPUtMiyxK5GqAy81bi2lzlQ8pF14I9CXwNpy1Ge5lQ4ZcC9lzaVd+7XR
	Z/e2PWVBl5gn/nu3TMEI0Nj7f8gxF7AJsKcQ47e0CkGAbYEq6pV/ZhMA3yGQIfLypb0n8U
	qgg02kc0cUOolbFKNBN7/jyE9wLzliAiU/Q7SVWp6zjwYS2Q2ui5ejdYQEmGaA==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v4 07/22] tests: treegen: Introduce emit_fdt_header_vers()
Date: Thu, 26 Nov 2026 12:22:24 +0100
Message-ID: <20261126112239.636284-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126112239.636284-1-herve.codina@bootlin.com>
References: <20261126112239.636284-1-herve.codina@bootlin.com>
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Post: <mailto:devicetree-spec@vger.kernel.org>
List-Help: <mailto:devicetree-spec+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-spec+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

treegen is used to generate custom dtbs. It uses emit_fdt_header()
to generate the header part.

The current definition of this function doesn't allow setting custom
values for the version fields.

In order to easily generate dtbs with custom version values, introduce
emit_fdt_header_vers().

The modification doesn't introduce any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 tests/treegen.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/treegen.c b/tests/treegen.c
index c9bf5711..2321a6c3 100644
--- a/tests/treegen.c
+++ b/tests/treegen.c
@@ -105,7 +105,8 @@ static void fill_prop_name(struct buf *b, size_t strs, size_t prop, size_t strof
 
 /* FDT structure helpers */
 
-static size_t emit_fdt_header(struct buf *b)
+static size_t emit_fdt_header_vers(struct buf *b, uint32_t version,
+				   uint32_t last_comp_version)
 {
 	size_t off = emit_u32(b, FDT_MAGIC);
 
@@ -113,14 +114,19 @@ static size_t emit_fdt_header(struct buf *b)
 	emit_u32(b, 0);	/* off_dt_struct */
 	emit_u32(b, 0);	/* off_dt_strings */
 	emit_u32(b, 0);	/* off_mem_rsvmap */
-	emit_u32(b, 0x11);	/* version */
-	emit_u32(b, 0x10);	/* last_comp_version */
+	emit_u32(b, version);	/* version */
+	emit_u32(b, last_comp_version);	/* last_comp_version */
 	emit_u32(b, 0);	/* boot_cpuid_phys */
 	emit_u32(b, 0);	/* size_dt_strings */
 	emit_u32(b, 0);	/* size_dt_struct */
 	return off;
 }
 
+static size_t emit_fdt_header(struct buf *b)
+{
+	return emit_fdt_header_vers(b, 0x11, 0x10);
+}
+
 static void finish_rsvmap(struct buf *b, size_t hdr, size_t rsvmap)
 {
 	struct fdt_header *fh = (struct fdt_header *)(b->data + hdr);
-- 
2.56.1

