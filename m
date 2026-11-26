Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692212;
	b=V4w7/ItdwzURaNBPZvQoIuQZ6U7ocWPfnokkfbLAtMXDX8QXWp+GEurF6byYJD33pNpd
	 nl2tuEIHtNN8t18vbVS8IOAQMZdBKKljpz4oeEV32m44Bqrxeul7bj2OOpr9xhzjmSlUv
	 qCnoAIF9vOimDe0El+T+Er3bBmleXW/2Pr7XznPxhqzJjXioaUe0gYrIQFf2a3tUkhHkv
	 2+azd+gGLZi4ye9vwu9k6X0HgJ2DwPMSFhe4iEo6y0rI7txZ8aDDUTKxH+VTQ/av0BTqM
	 JJZzfeAHzHWAZopx80S9zsWdo9dcfRvEeGvw32bQRellzLwzywrm9nc9/dokhMgrdHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692212;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=IAYrY00zEa8fJNaul9FWej9b698lYsbtVQJkZQbyH1U=;
	b=4jq7Aas4VlY5K0iWLJc58wLt/uR2cNDAuoUZDzaWPBLAv28rHhCj14BJKRbInDYw8adH
	 AEEIdul95PjDufy/kfQjwd/wvVvoThVZTa+A9iOfyA3m6qNSg19t35Ndmqc2KUZXYR/JV
	 ZpufFbXB5GqTBrdiUVS7oJa77Mp9vHE+y/mdlzIEO9+iyZYEf+XRhddqBd7ZHyeUMJlgE
	 AdB4wZmbaB/0L7u8Ls+TUDJPJJw31Z3m/CSG5ViyM0mCVL6/LFtzbw3vcD+wNGvdsOWcg
	 KWnvnAUc6HTPHHr6SFHVXmm/3hque5Cm9N4Ml9MkF14ft7oQeMYqVi8nPdSa/C9A3kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Grvo6Qvw;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DFF606A332;
	Thu, 26 Nov 2026 11:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92DFF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Grvo6Qvw
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6C7B3C2B9C9;
	Thu, 26 Nov 2026 11:23:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2762B60237;
	Thu, 26 Nov 2026 11:23:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8AF311E6B363;
	Thu, 26 Nov 2026 12:23:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692208; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IAYrY00zEa8fJNaul9FWej9b698lYsbtVQJkZQbyH1U=;
	b=Grvo6Qvw13/wH2ChMXTnAqTxAZa1ZR40jzEXxwaaBd61ufdfhwNileelf1HvFRW55vU0Gu
	P30AUlgR/UphrIPYdYxdLUF3z+YQJUWPAM1I2akEWnvqCodj1Da/dD62IB9EdGygrxBSk4
	cGQlq7Z2PsonrPKiOEcke8UQoIRGZuYF2/sUClkqnfIX3lbzeklKEXHwb5YU7nIddRRuRc
	ztGjy6oV21MgW7skj/ZgXClfXLFAIpRiSdbsZwsq7gR7Sr97dyUHBN+uCDoEbrinYv1LYv
	FmdzoVBqAeZEyVxcLMI4s0wCJC1z+lrs6PzDQY1JlTUNH8l+ENwvk6N40vwREA==
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
Subject: [PATCH v4 05/22] tests: dtbs_equal_ordered: Add --noskip-nop option
Date: Thu, 26 Nov 2026 12:22:22 +0100
Message-ID: <20261126112239.636284-6-herve.codina@bootlin.com>
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

dtbs_equal_ordered skips FDT_NOP tags by default when it compares dtbs.

Add an option to override this behavior and take into account FDT_NOP
tags in dtbs comparison.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/dtbs_equal_ordered.c | 42 +++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/tests/dtbs_equal_ordered.c b/tests/dtbs_equal_ordered.c
index 90c7344d..488e08b8 100644
--- a/tests/dtbs_equal_ordered.c
+++ b/tests/dtbs_equal_ordered.c
@@ -16,6 +16,7 @@
 #include "testdata.h"
 
 static int notequal; /* = 0 */
+static int ignore_nop = 1;
 
 #define MISMATCH(fmt, ...)			\
 	do { \
@@ -76,11 +77,11 @@ static void compare_structure(const void *fdt1, const void *fdt2)
 		do {
 			offset1 = nextoffset1;
 			tag1 = fdt_next_tag(fdt1, offset1, &nextoffset1);
-		} while (tag1 == FDT_NOP);
+		} while (ignore_nop && (tag1 == FDT_NOP));
 		do {
 			offset2 = nextoffset2;
 			tag2 = fdt_next_tag(fdt2, offset2, &nextoffset2);
-		} while (tag2 == FDT_NOP);
+		} while (ignore_nop && (tag2 == FDT_NOP));
 
 		if (tag1 != tag2)
 			MISMATCH("Tag mismatch (%d != %d) at (%d, %d)",
@@ -126,26 +127,47 @@ static void compare_structure(const void *fdt1, const void *fdt2)
 					 offset1, offset2);
 			break;
 
+		case FDT_NOP:
+			break;
+
 		case FDT_END:
 			return;
 		}
 	}
 }
 
+static void badargs(char **argv)
+{
+	CONFIG("Usage: %s [-n] --noskip-nop <dtb file> <dtb file>", argv[0]);
+}
+
 int main(int argc, char *argv[])
 {
 	void *fdt1, *fdt2;
 	uint32_t cpuid1, cpuid2;
+	char **args;
+	int argsleft;
 
 	test_init(argc, argv);
-	if ((argc != 3)
-	    && ((argc != 4) || !streq(argv[1], "-n")))
-		CONFIG("Usage: %s [-n] <dtb file> <dtb file>", argv[0]);
-	if (argc == 4)
-		notequal = 1;
-
-	fdt1 = load_blob(argv[argc-2]);
-	fdt2 = load_blob(argv[argc-1]);
+
+	args = &argv[1];
+	argsleft = argc - 1;
+
+	while (argsleft > 2) {
+		if (streq(args[0], "-n"))
+			notequal = 1;
+		else if (streq(args[0], "--noskip-nop"))
+			ignore_nop = 0;
+		else
+			badargs(argv);
+		args++;
+		argsleft--;
+	}
+	if (argsleft != 2)
+		badargs(argv);
+
+	fdt1 = load_blob(args[0]);
+	fdt2 = load_blob(args[1]);
 
 	compare_mem_rsv(fdt1, fdt2);
 	compare_structure(fdt1, fdt2);
-- 
2.56.1

