Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CC938A9B8
	for <devicetree-spec@vger.kernel.org>; Tue, 10 Feb 2026 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744867; cv=none; b=fPoajFHLEBR8cebjDycUQektD29/RlwAy7qh+FivuNWvZRbA9KAfeFnIVqqvAY+MgZ1obCqySmz1NH9/5aQ9XoXeJj+ptLbcuRhuVkGis/7sd+TF4lOcLjNPPPSuirOs9oSJgbr5NSXHS8de1lYmgUqBD8v6AqXhCTTd3nWwNMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744867; c=relaxed/simple;
	bh=1GYTl899loeKuDybjdYgszBFDSlbIF8YB849krPxnc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=babV4831rNzu/dmcIjPLyzDAw/zLOn/qn/R67Yrb88PJhzMAElaKfpq/BB0AubceEZRd10PS1pD3E+/5eN976ebKo+9QRtQprGlUozbEC3cnVbKRr/XHxLoAGHcWQoNxMwZMagVMhyDq+2Iphw1+GKnyvLeLkz77tT6aT4XTWU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hp9f3GGH; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hp9f3GGH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 61FAEC8F455;
	Tue, 10 Feb 2026 17:34:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0226A606BD;
	Tue, 10 Feb 2026 17:34:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3534B10B91FBE;
	Tue, 10 Feb 2026 18:34:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744864; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0s0U5LlMK8JRmYuXCMEm1DGi0KEOLQu1ipU4LX8zcW4=;
	b=hp9f3GGHrJEauLs7fC+MSDCAEKP0qOlI1lLkhle9YArbhXYMQ6WP2ZA+rHT2fPTaVrdo2l
	0ekNpVnF/CdoZZkpCJmZdaaXO6JSOgxib5sVZ21pKqt8Vmaw/Mhdj6bObolLNrgsSpqBUD
	UpIxyZ9LX6vtFRBLsomPyWOSVfMOuim1mcDkneo4is7UHAiYMQcTtHhyfDPUmNvSKHxOhK
	+7+LOeuv7Ik0/uQ5TikzmDNxNd3F5ujYGTzPu4VA4UsJbMirThPN1qfRktBwwrpqsjhAOK
	vbUfoiTIedvuuYy7RdAwDt1rgDjjqNLYbBRWjYhjAnPQ/ruA8UUsQti21/Enng==
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
Subject: [RFC PATCH 03/15] fdtdump: Return an error code on wrong tag value
Date: Tue, 10 Feb 2026 18:33:31 +0100
Message-ID: <20260210173349.636766-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210173349.636766-1-herve.codina@bootlin.com>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

fdtdump prints a message on stderr when it encounters a wrong tag and
stop its processing without returning an error code.

Having a wrong tag is really a failure. Indeed, the processing cannot
continue.

Be more strict. Stop the processing, print a message and return an
error code. In other words, call die().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtdump.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index 6c9ad90..0e7a265 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -146,8 +146,7 @@ static void dump_blob(void *blob, bool debug)
 			continue;
 		}
 
-		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "", tag);
-		break;
+		die("** Unknown tag 0x%08"PRIx32"\n", tag);
 	}
 }
 
-- 
2.52.0

