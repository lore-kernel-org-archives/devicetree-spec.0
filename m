Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692237;
	b=amphM30WeeVAHXxqRxPx8dt7JOzM6N0uNZ4XIftFWXI5oVKrWuEN40f4R6rQTXDyeMK7
	 YHxDiWNFhYm1ZiNcVmq2PDaetRA3k5oVY/gIFUaMFGb7lI5TzMhJKXIjQ8tO22QhV1Hh4
	 xiajchzI6goRR3e9JDoaMjGefeBTP6h8gp32g9/RznWtDH/t8ihrBWs5P1xe+MUhFwfQe
	 wUilXQgfqt5zZpwpZDry2WmjdNbIBIz1BVzqTQfT4bD+ax0ciesJIfsuo79JU0+yUqoNj
	 xTcvL2avu7ne2p83QiieW2BcH10Tf6p1ak9RP5uzokmyPRgQBFrL7BmtLYgPa1d5V8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692237;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=RLP5Q0C3/5aEHHSowdIHXDkh7SkwpPfyD9prI3YAvwE=;
	b=qTOvE7Q5TcgVAYl0MU2+tob7pIISlCPmb9iXB0RsSwd9TQZ2oqLoe5zgZxKDujWQQzEG
	 CAMIENkGQxIBfKDSAnQ7rTNQgvv0gYM7qmpvl5Sb8u72RqF2qFXCkyNvRbvYZamUGllMI
	 yXoLzwV6T+PCeKwiPXXzIDryh48sWGHd0gyoTQ+ZBw3HwCn40d/nt1jbPOnqm2OBAillc
	 +tRuBu4qEUbDGmhCLZ5S//bdaAmDT0ZtdbsPEMgo9O6e+oyaiKZfU5H7knUQCmZJSRiIz
	 WIv+7p/ivM9qKFZHQG640LQvye8jnYZ/7yfdOzRWc1/AblmLeI9gVbv/YPFOeNVDyjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YO78SUOl;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C77F606A331;
	Thu, 26 Nov 2026 11:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C77F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YO78SUOl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D035D4E4179E;
	Thu, 26 Nov 2026 11:23:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CCB960237;
	Thu, 26 Nov 2026 11:23:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFF0811E6B363;
	Thu, 26 Nov 2026 12:23:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692234; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=RLP5Q0C3/5aEHHSowdIHXDkh7SkwpPfyD9prI3YAvwE=;
	b=YO78SUOlnAQe7sfDF0HZA5FniLqEBLLk0p2IDGtRoh2c/M38vtFZ0Uz93bYWdAx6cS3CMj
	IWPRW/SvEjHXFEDYyAWK5YZr9C13RpWkjz/6NoDPHABahXc6/wOUQW+x5i1LKD5uvWd+Mr
	z7UO21ZuPSQ+R+A+8Pvenojt1nTFZcDrS/3ZYyzta74T58hywgeI5cpWIjVujXpw1yG7tT
	g82cBVsqONc140MfTbVg5LMS9UHan5KoQAvyMGog+cg8aWbU01MO1+Bwe7Qc8UfU84q1NK
	hkTFEZto1BhWVF2nNqDhzmGeBMLTEdOkrQY9U4eiJhUSH/wFFUkeV+rO6jpWbQ==
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
Subject: [PATCH v4 09/22] util.h: Add missing <stdio.h>
Date: Thu, 26 Nov 2026 12:22:26 +0100
Message-ID: <20261126112239.636284-10-herve.codina@bootlin.com>
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

util.h defines static inline functions which use fprintf() and similar
functions.

In order to include util.h without the need to include stdio.h before
util.h, add the missing stdio.h directly to util.h.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 util.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/util.h b/util.h
index 800f2e2c..3e2ebaab 100644
--- a/util.h
+++ b/util.h
@@ -6,6 +6,7 @@
 #include <stdarg.h>
 #include <stdbool.h>
 #include <getopt.h>
+#include <stdio.h>
 
 /*
  * Copyright 2011 The Chromium Authors, All Rights Reserved.
-- 
2.56.1

