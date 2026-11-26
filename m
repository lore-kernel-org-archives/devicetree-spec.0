Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692257;
	b=14MUgfQ/VvJ8i2QaETrZVDB5Kx7vbw8Q/oC3JFcUnDlCwp+QGgG7EFv3k4z57jKlPpZb
	 JVaUWYvsEqLxdGQoKV/ISZLh6TW5a+6DloUFTHAfn6cVtNK54z8+r/VhCiDHzhLrjWI9c
	 i+QD8+TBYg/ftz6ozqsuRqOikISWrxVDjYN9e0CirUSy3iNySlRGsHTs2PPBKepjn6zSN
	 np7MviB+Zin+VKoXPee1QlKPofd52Z79yS9GC2xs5IDhArZibwXeAkLMKcXRwYw9T4A35
	 HQTZZaLHizeKNuuOhMlOb1/y8QG5Qp4TRe0r9oRUh1/I6f8qbEFQ4Y+LF5yH0zj6NVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692257;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=+pdUpQE9ELnjOF9QnySyUFCuDIRbgVDD2i1CuYakhsg=;
	b=sKkCZL0W/srB9YUD+/RI2n5sbBcmOsmishOiBuL/PRoTkHj9Mx2McrP3AwQPpyz4dIT4
	 nbLlUfvYKJLn1m5rdR2q0rNzwnXx5lTSsxEdQ7u/rL7JhX6G1VffJqqBw9+01shNHg8wr
	 DGAR8K6PYguP57Cx+BiHlKtnp5RkH6knMDV0uMvxT5nHV/QRUrSMs7YHDsEYyWhAG5jMx
	 Lx1v+QGjpNxHtEuNLPpUPbby0Rcm/nhgJdDo/kNnFB9NzUwbbhID2Y+wU7Z49mhuacuKU
	 XkJVWAEhaLVxcOJWsiB22THZxC4eYh2ha4FG6FRGbzOmUMRJUTc/EVUJ3Ynb5okPlnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nc48Jncf;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E388606A6AB
	for <devicetree-spec@vger.kernel.org>; Thu, 26 Nov 2026 11:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E388606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nc48Jncf
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1AB964E41798;
	Thu, 26 Nov 2026 11:24:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D158C60237;
	Thu, 26 Nov 2026 11:24:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD1C311E6B36E;
	Thu, 26 Nov 2026 12:24:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692249; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=+pdUpQE9ELnjOF9QnySyUFCuDIRbgVDD2i1CuYakhsg=;
	b=nc48JncfOXY1zvu21JpmQRSvDMGMD9beaYuKTyY6jiOkomM+6TiU/DPEroV5HR1vxX6PmD
	4EHE0jsS53gMmtihwoo5/dPbt8n529ojbzF/5ZpytoUr1BGJGkf1UAoUyzvNRAzTUokPkc
	mnPI29bpmubTZOJbZ929a6fySpwRYWKZXyzTdME8vm1tKqp5iPMvqlI7I1ozoQYTE71de7
	8oCbju/js1F1ojCp89ulL7dKfF20aIJerM+EPn8/c8YCZ/wkNxWOXpmniCE639icOjQY7W
	VTf56nlURGWxpGgDzjlVV+dETj+HCzI21r1ecyLGmwkdY65STN8TiJbHZWGOqg==
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
Subject: [PATCH v4 12/22] Introduce structured tag value definition
Date: Thu, 26 Nov 2026 12:22:29 +0100
Message-ID: <20261126112239.636284-13-herve.codina@bootlin.com>
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

The goal of structured tag values is to ease the introduction of new
tags in future releases with the capability for an already existing
release to ignore those structured tags. In order to do that, the data
length related to the unknown tag needs to be identified.

A structured tag value is defined as a 32-bit value as follows:

  Bits  | 31 | 30    24 | 23                       18 | 17    0|
  ------+----+----------+-----------------------------+--------+
  Fields| 1  | Reserved | Data length encoding (DLEN) | TAG_ID |
  ------+----+-----------+----------------------------+--------+

Bit 31 is always set to 1 to identify a structured tag value.

Bits 30..24 are bits reserved for future use. They must be cleared.

Bits 23..18 (DLEN) encode the length of the data related to the tag.
Following values are possible:
    0b000000: No data
    0b000001: 1 x 32-bit word
    0b000010: 2 x 32-bit words
    ...
    0b111101: 61 x 32-bit words
    0b111110: 62 x 32-bit words
    0b111111: varlen encoding. The length of the data is encoded by a
              32-bit word available right after the tag. This word gives
              the length of the data in bytes. Padding is present (if
              needed) after the data block in order to have the next tag
              aligned on a 32-bit word.

Bits 17..0 (TAG_ID) form the tag identifier defining a specific tag.

Introduce the structured tag value definition and some specific tags
reserved for testing based on this structure definition.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt.h | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index a07abfcc..6b09b941 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -57,6 +57,82 @@ struct fdt_property {
 #define FDT_NOP		0x4		/* nop */
 #define FDT_END		0x9
 
+/*
+ * Structured tag format:
+ *   - bit 31: set to 1
+ *       Identify a structured tag.
+ *
+ *   - bit 30..24: Reserved (7 bits)
+ *       Those bits are reserved for future use. They must be cleared (0 value).
+ *       If any of these bits is set, an error should be reported.
+ *
+ *   - bit 23..18: Data length encoding (DLEN, 6 bits)
+ *       Encode the length of data attached to the tag.
+ *       0b000000: No data
+ *       0b000001: 1 32bit word
+ *       0b000010: 2 x 32bit word
+ *       ...
+ *       0b111101: 61 x 32bit words
+ *       0b111110: 62 x 32bit words
+ *       0b111111: varlen encoding. The length of data is encode by an 32bit
+ *                 word available right after the tag. This word gives the
+ *                 length of data in bytes. Padding is present (if needed)
+ *                 after the data block in order to have the next tag aligned
+ *                 on a 32bit word.
+ *
+ *   - bit 17..0: Tag identifier (TAG_ID, 18 bits)
+ *
+ * The full tag value is used to identify a tag. Two structured tags with the
+ * same tag identifier field but with different data length encoding (DLEN
+ * field) should be considered as two different tags.
+ *
+ * The exact tag value is completely known when a new tag is defined and its
+ * data length encoding (DLEN field) must not be determine at runtime when the
+ * exact length of data is known.
+ *
+ * Any tags where the length of the data is not known when the tag is defined
+ * (i.e. sizeof(data) cannot be determined when the tag is defined) must use the
+ * varlen encoding value (DLEN field set to 0b111111). Tags with strings or
+ * arrays where the number of items in the array can vary should use the varlen
+ * encoding.
+ *
+ * Also for tags where the length of data is greater than 62 x 32bit words
+ * (maximum value without using varlen encoding), the varlen encoding must be
+ * used even if the length of data is known when the tag is defined.
+ *
+ * A structured tag with reserved bits cleared can be safely ignored and simply
+ * skipped when its TAG_ID value is not a known value (unknown tag). If any of
+ * the reserved bits are not cleared, the structured tag must not be ignored and
+ * an error should be reported.
+ */
+#define FDT_TAG_STRUCTURED	(1U << 31)
+#define FDT_TAG_RESERVED	(0x7f << 24)
+#define FDT_TAG_DLEN_MASK	(0x3f << 18)
+#define FDT_TAG_DLEN_SET(_n)		((_n) << 18)
+#define FDT_TAG_DLEN_GET(_tag)		(((_tag) & FDT_TAG_DLEN_MASK) >> 18)
+#define FDT_TAG_DLEN_VARLEN		0x3f
+
+#define FDT_TAG_STRUCTURED_BUILD(_tag_dlen, _tag_id) \
+	(FDT_TAG_STRUCTURED | FDT_TAG_DLEN_SET(_tag_dlen) | (_tag_id))
+
+#define FDT_TAG_IS_SKIPPABLE(_tag) (((_tag) & FDT_TAG_STRUCTURED) && \
+				    !((_tag) & FDT_TAG_RESERVED))
+
+/*
+ * Structured tags reserved for tests purpose
+ *
+ * Any structured tags with the tag identifier set to 0x3ffff are reserved for
+ * test purpose. When a parser find this kind of tag, it must consider the tag
+ * as an unknown tag and so skip it. A generator must never use this kind of
+ * tags, except, of course, if the generator is used to generate a dtb for test
+ * purpose.
+ */
+#define FDT_TEST_NONE    FDT_TAG_STRUCTURED_BUILD(0, 0x3ffff)
+#define FDT_TEST_1FDT32  FDT_TAG_STRUCTURED_BUILD(1, 0x3ffff)
+#define FDT_TEST_2FDT32  FDT_TAG_STRUCTURED_BUILD(2, 0x3ffff)
+#define FDT_TEST_VARLEN  FDT_TAG_STRUCTURED_BUILD(FDT_TAG_DLEN_VARLEN, 0x3ffff)
+
+
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
 #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
 #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
-- 
2.56.1

