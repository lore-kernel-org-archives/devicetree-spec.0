Received: from mail.actia.se (mail.actia.se [212.181.117.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355A824E00F
	for <devicetree-spec@vger.kernel.org>; Mon,  9 Jun 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.181.117.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463204; cv=none; b=r4xSFewSpWnGEx20MzxmPPOPDZLd8PtS2SeiUSlvg1LC7hS5LJUbPEqTze0K5D7v5V1P6XjT6suxoGuxiwc/d0Xmf4AzlAcDkYwS2Nzb05Uns/U8G3dCF5bxIqhy/5ZMaQdarWCjgW/2iJy1k/PId+SieMTP5LfaTSGUj6/PRpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463204; c=relaxed/simple;
	bh=WQszISOy16USZRQnjf+EINBTqnsmaNMvSf9u5Z08SYI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NaXSdwTFkI4Cm75WeSFnpRtAsfU8f3rRSkqaE0X3WtxM1CFbiUfqLcXpeBXsTzR+nTDTKib1+a89tiZbc0Fv0jNy2dKyRQ5xNViIA9QUBSdeKSlcjmUxwaeGDN2chl1XaCEJLmULPLR2Z9vTf8Hcvf7+EeVe7oXC0F8MH+FGbFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=actia.se; spf=pass smtp.mailfrom=actia.se; arc=none smtp.client-ip=212.181.117.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=actia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=actia.se
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 11:59:51 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Mon, 9 Jun 2025 11:59:51 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Rob Herring <robh@kernel.org>
CC: "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>, "John
 Ernberg" <john.ernberg@actia.se>
Subject: [PATCH] meta-schemas: nodes: Allow if-then-else directly in
 patternProperties objects
Thread-Topic: [PATCH] meta-schemas: nodes: Allow if-then-else directly in
 patternProperties objects
Thread-Index: AQHb2SU9ppm6LCs3VEaSo6pryhWUbw==
Date: Mon, 9 Jun 2025 09:59:51 +0000
Message-ID: <20250609095929.1964499-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.49.0
x-esetresult: clean, is OK
x-esetid: 37303A2955B14453627464
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Having local singular if-then-else statements under a patternProperties
object-node causes a schema warning about an unexpected statement.

Allow this construct to reduce size of singular if-then-else blocks in
this context, aligning the rules of them with the top-level.

Signed-off-by: John Ernberg <john.ernberg@actia.se>
---
 dtschema/meta-schemas/nodes.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/dtschema/meta-schemas/nodes.yaml b/dtschema/meta-schemas/nodes=
.yaml
index 0b2c8f7..e45cb45 100644
--- a/dtschema/meta-schemas/nodes.yaml
+++ b/dtschema/meta-schemas/nodes.yaml
@@ -27,6 +27,9 @@ propertyNames:
     - deprecated
     - required
     - not
+    - if
+    - else
+    - then
     - allOf
     - anyOf
     - oneOf
--=20
2.49.0
