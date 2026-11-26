Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692209;
	b=szKKhL8bj5LWks4FD6ReY6V4m83SoposGjwy86pMV/WnAIWoovA1VfcP3sTXZyH4Gb+r
	 urNyH/Qw+/k6RXRyeYELEHbmFUl+RilFw7GSnfeF6lwX2Md4AmtwXwYxGBu5fpk63kCy0
	 w2hMqCKZHtbSx20DUOb5wj7z/EotWCF4GcJ9aiRqhwLXheGXbycnR1UXmUMVFZyCxjQZU
	 Af9omuSjz/kQwXTUD/qfu+fZtWG+txtFL0TrHMnA53UksNz1wzL4qzrcpVO3VGPuOZ0Ad
	 KxaRL+//vl3LN6U3zjTtOtkBgVnngF70LR6wGv2s/yMzk1lJllwPVx1t87HLO1nNjqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692209;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=7vXlSRXuLLmD/e6VWvr8dD+6KNmhy5l5OvwMf0QWBaA=;
	b=jVbaPa2+7SQVqhvZjg4QD/zIMuqs5+vneyfHb+B3e/VfRaBDdxE4Y7XwDuuh0OSSm47V
	 qVGnE92Js+Cf0W+ZmteyiKPBDn/TKosIpQc8n9fXerykgHELFc+TxeB7D0o0Yf/mhSNHo
	 wbfW3nk7U30RmGBNuika8OSJWa3sI1l0/BLOjZYzrHF8HGgJSQR/HpYK8TNcctIvUToez
	 dlXzXseO/8VFycpdow9WkP3r0tlu4Gkg1MXBwbFNFUjY6Nc3uqn1jz27Cn58WsE8Si+I6
	 RCvS8IXk1e4oRUoJgumpQ0EQgSmpEd3KKlieuM8zz1cFgXowH39sZht7a2ERi1fVNPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pWvlthHI;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B692606A6B7
	for <devicetree-spec@vger.kernel.org>; Thu, 26 Nov 2026 11:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B692606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pWvlthHI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6BD81C2B9C7;
	Thu, 26 Nov 2026 11:23:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 218E660237;
	Thu, 26 Nov 2026 11:23:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E04B11E6B361;
	Thu, 26 Nov 2026 12:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692205; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7vXlSRXuLLmD/e6VWvr8dD+6KNmhy5l5OvwMf0QWBaA=;
	b=pWvlthHIjB2HS9ck1O98NTeJGisl7Hdxjnr0itRStgV0sngcKMyTEFtYQy+3M3rebr1DNu
	pldS1qVHYnn0a84rAm6M71dNt5QjBaxV7QIojS1YbBzZFXO3eCXVNo+UhNq3lH+J5PTTlP
	j63/uOODSCWofxoblLbrn/YLxztlvvn0JKimnFUPVujsZkGOgZi3x/GVBybnBnGM8kzynn
	2ueMZUxEkbfynuA+7w+lXft+0Pz6xKAmVkEey/HAMQKyuTsUxnXCK7irhgrZO0db+Fk/ot
	R5+oEg5kuwpZMP74eOrjswdrg1UgtDKTMWmO65+oz4DGsH115KRA6Z8DcoPdOw==
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
Subject: [PATCH v4 04/22] tests/nopulate: Add an FDT_NOP before the root node
Date: Thu, 26 Nov 2026 12:22:21 +0100
Message-ID: <20261126112239.636284-5-herve.codina@bootlin.com>
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

An FDT_NOP tag can be present at offset 0 and so before the root node.
This is a legitimate case.

The nopulate tool adds an FDT_NOP tag after each tag encountered but it
doesn't add an FDT_NOP tag at offset 0.

Improve nopulate to fix this gap and add an FDT_NOP tag at offset 0.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 tests/nopulate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/nopulate.c b/tests/nopulate.c
index 32624a7b..b3a7184a 100644
--- a/tests/nopulate.c
+++ b/tests/nopulate.c
@@ -23,7 +23,10 @@ static int nopulate_struct(char *buf, const char *fdt)
 	uint32_t tag;
 	char *p;
 
+	/* Add a FDT_NOP before the root node (first node) */
 	p = buf;
+	*((fdt32_t *)p) = cpu_to_fdt32(FDT_NOP);
+	p += FDT_TAGSIZE;
 
 	do {
 		offset = nextoffset;
-- 
2.56.1

