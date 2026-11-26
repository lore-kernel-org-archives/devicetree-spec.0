Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692261;
	b=W+weFOfxEayG/ro++wscEkfTFNRqA5DShGnB/VWnQpuEVAkhFOpl+A+QUngCg3Uh8Tnt
	 N6oIuGuuzad0ds8qFTWbBPZ5bsFMnIrRlvNBhtjobAA3naLp260zCRgi8wO1G6NtLC69B
	 H1Vt3yaOvt+hFPx8Ba9xrKlz8FUPpI8n87izvqWgsF0Os6a5KH8wOlmpLOgLzpXiVsbWY
	 L6a/vw5RkVkH6eFmzPpGReiszp69RbA0pbU+1jZHWGqzo8ffKv5xivrMV2zzZYORaDwoI
	 6Bul1j5gdTTFR9+NtpL2QFtvY3vEHXvL7hz7j1R+7PGd3nIZKVg9IqguB76tGmnJfVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692261;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=QD47cSKsSQFXUrasRqUwFXy9s8AAfWMONdsPcpmbZrI=;
	b=sSGbflWHD4QGFEOaAnAAmA5NFSmPEKf2T0jq2tbbdVyPb25LM0x2crsIuIR8X/oYmA8y
	 oleS97mvNwGcVkUE/yJsiXJYHswbznhIvZOm75vqan+Rl+MhO6xh5fJLOGN1kBc2KaRXO
	 4ECH3PcgCmyvq1hgL3IoDXo/kA7pfFE/7zgZkQvSA0M9K13BRSKYckLhVqR7qH2ljJLTw
	 opg1e9wDcVA3HnOFbKmauS0yfS0KaSQlD56l2DVSDONAkqKwaHrj4K9vlhTMLliJvEGZy
	 fVFVb/CI3v3VrOyACHibM+K+QAssK10bmWXswYKCDwYIQqhcDV/7IA1gOn1hMal8Kjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="v3Xuhg/C";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782F660A2634;
	Thu, 26 Nov 2026 11:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 782F660A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=v3Xuhg/C
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 28E001A1810;
	Thu, 26 Nov 2026 11:24:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F19BD60237;
	Thu, 26 Nov 2026 11:24:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9452611E6B363;
	Thu, 26 Nov 2026 12:24:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692256; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QD47cSKsSQFXUrasRqUwFXy9s8AAfWMONdsPcpmbZrI=;
	b=v3Xuhg/CWzaMrLF0EOy3Eq78sfDY9JjEx/5aLMEwQZsniGCbpuysOgBrELUzXRZDkf1sTL
	z2nNvem1id/25yXKBLhNwdxSCSYxLdAgBK4w/l7Flb/4caehykp67uiO/+uhmIlLHQaIqd
	v5f/nTBX68ce0YpleXjEezoY4SwTNjcQ4fPyfmoMKfVxwMrU2c++cKcE8LyggoRjWQGdMo
	xq2X4ZLJz8i5g/EYXZKBJk7JFjhncz2lutiOpYTd4MuTTU12rY0rnAbw8R7iHQv+DEPFBE
	vQFckXUJFjLFus+1hZM9To98zlRi0MBzkrqu4cvITW78oMPYvwD3IRN+eNfGuQ==
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
Subject: [PATCH v4 13/22] util.h: Add concat() macro
Date: Thu, 26 Nov 2026 12:22:30 +0100
Message-ID: <20261126112239.636284-14-herve.codina@bootlin.com>
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

util.h defines the stringify() macro, which forces parameter expansion.

In the same way, define the concat() macro allowing the concatenation of
parameters forcing their expansion before the concatenation.

This allows the following:
  --- 8< ---
  #define bar 2
  #define baz 3

  #define foo concat(bar, baz) /* foo is set to 23 */
  #define other concat(test,baz) /* other is set to test3 */
  --- 8< ---

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 util.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/util.h b/util.h
index 3e2ebaab..50014325 100644
--- a/util.h
+++ b/util.h
@@ -32,6 +32,9 @@
 #define stringify(s)	stringify_(s)
 #define stringify_(s)	#s
 
+#define concat(a, b)	concat_(a, b)
+#define concat_(a, b)	a ## b
+
 static inline void NORETURN PRINTF(1, 2) die(const char *str, ...)
 {
 	va_list ap;
-- 
2.56.1

