Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D294ADDA4
	for <devicetree-spec@vger.kernel.org>; Fri,  5 Jun 2026 08:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650000; cv=none; b=qDM2bCiFg21ht8L7KMwaQ/Ws1kuRG82zE3uUOOJnU5dgs51WPUP6pAwr8Fb8WYf3Oiiq0tt9XjehrvFvBlYhUs/y3s/IanSMEYOTzPgH9X0YG/xfHB4PTGYz+HGiq4hXRFCAS0QmkIvijLLmbqgGIcn4qowrEfDUA67eHQw2ItY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650000; c=relaxed/simple;
	bh=xRJffMU6TMX6VLEK3l9aI+W42yrWuhoA30JoQIOboFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mx8Rzdemdl6g5fDUhAH55iuL8btCtizqjggILxGzdKd9rvKMlaoSLAh0uAZ7wuv8iVfRvHlw/Z55b33Ij03r5n6x+SKnIYXuX0nAliENUPP5tBCXWGfT86KH6J/IPoDOhCxRjQxrW8FiD/rkGeANT6HJdzH+onFNuF3EUIJ1Hro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=VoAYkCnz; arc=none smtp.client-ip=185.136.64.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="VoAYkCnz"
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260605085945d2bafe6cf9000207fe
        for <devicetree-spec@vger.kernel.org>;
        Fri, 05 Jun 2026 10:59:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=7G3DQgdkXpwmYA0bd/45bwC3wGZZbecxJbPbuUln/v4=;
 b=VoAYkCnzTwAolb4zs4BNuqbSXVZS8C/hJi8GGjtBaCEkmodjvIdSfrb7noGzEckdPI7Ug5
 ml6aVMHqx3DxEqbeGj5EFvVeDvZ8SVXlnOapVcn6kuB7tH+DFGyeuBVeuPcxvTlUCL7wGPHM
 cJp8t+XHk8lrA9/Mqaa7mNBGdn57JMTN4JU0TPC5js45QKpMynqEMUvilz525UVtzv1A4J2z
 7EsnQvEtTtCPAHdXrVKe6kbyip1GT2aIZLce40CVvR3SkUYntFX/QhzouTDTdIRWSPYcExgh
 J/svDVkKbqnMyZp6PBGSY4M36hqoMRWN07nVypdxSWkmN2CP3ZEkghLg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: devicetree-spec@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Ludwig Nussel <ludwig.nussel@siemens.com>,
	Simon Glass <sjg@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2] schemas: chosen: Add reset-reason property
Date: Fri,  5 Jun 2026 10:59:29 +0200
Message-ID: <20260605085938.3779084-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Bootloaders such as U-Boot and barebox can populate the /chosen node with
a reset-reason string property indicating the cause of the most recent
system reset.

Define a standardized set of generic reset reason values that bootloaders
map their platform-specific reset sources to:

  unknown    - reset source could not be determined
  cold       - power-on reset
  warm       - warm restart without full power cycle
  watchdog   - watchdog timer expiration
  wakeup     - wake from suspend/sleep
  jtag       - JTAG/debug initiated reset
  thermal    - thermal shutdown/overtemperature
  external   - external reset pin/signal
  brownout   - supply voltage drop
  software   - explicit software-initiated reset
  safety     - hardware fault detection (e.g. error signaling module,
               fault collection and control unit)
  security   - security subsystem (e.g. secure enclave violation)
  pmic       - PMIC-initiated reset

Mapping of platform-specific reset sources to generic values:

  Generic      AM6x              i.MX9            barebox
  -------      ----              -----            -------
  unknown      UNKNOWN           -                unknown
  cold         POR               por              POR
  warm         RST (SW warm)     -                RST
  watchdog     WDOG              wdog             WDG
  wakeup       -                 -                WKE
  jtag         JTAG              jtag             JTAG
  thermal      THERMAL           tempsense        THERM
  external     PIN               -                EXT
  brownout     -                 -                BROWNOUT
  software     -                 sw               -
  safety       ESM               fccu             -
  security     SMS/DMSC          ele              -
  pmic         -                 pmic             -

Note: barebox already populates this property but uses abbreviated
uppercase values (common/reset_source.c). These will need to be adapted
to match the standardized lowercase values defined here.

The list can be extended in the future as needed.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v2:
- added "|" to the description to preserve the formatting
- added the meaning of each item to the schema
v1:
- https://lore.kernel.org/all/20260526104034.2735938-1-alexander.sverdlin@siemens.com/
RFC:
- https://lore.kernel.org/all/579fcbc186ad2aeea3c206aebc901b64fc665db1.camel@siemens.com/

 dtschema/schemas/chosen.yaml | 48 ++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
index 63f3c12..f6fad1f 100644
--- a/dtschema/schemas/chosen.yaml
+++ b/dtschema/schemas/chosen.yaml
@@ -183,6 +183,54 @@ properties:
       will assign devices in its usual manner, otherwise it will not try to
       assign devices and instead use them as they are configured already.
 
+  reset-reason:
+    $ref: types.yaml#/definitions/string
+    enum:
+      - unknown
+      - cold
+      - warm
+      - watchdog
+      - wakeup
+      - jtag
+      - thermal
+      - external
+      - brownout
+      - software
+      - safety
+      - security
+      - pmic
+    description: |
+      This property is set by the bootloader to indicate the reason for the
+      most recent system reset. The values are generic categories that
+      bootloaders map their platform-specific reset sources to.
+
+      If multiple reset sources are detected, the bootloader should report
+      the most specific known cause. If the cause cannot be determined,
+      use "unknown". If this property is absent, the bootloader does not
+      support reset reason reporting.
+
+      Values:
+        unknown  - reset source could not be determined
+        cold     - power-on reset
+        warm     - warm restart without full power cycle
+        watchdog - watchdog timer expiration
+        wakeup   - wake from suspend/sleep
+        jtag     - JTAG/debug initiated reset
+        thermal  - thermal shutdown/overtemperature
+        external - external reset pin/signal
+        brownout - supply voltage drop
+        software - explicit software-initiated reset
+        safety   - hardware fault detection (e.g. error signaling module,
+                   fault collection and control unit)
+        security - security subsystem (e.g. secure enclave violation)
+        pmic     - PMIC-initiated reset
+
+      / {
+              chosen {
+                      reset-reason = "watchdog";
+              };
+      };
+
   smbios3-entrypoint:
     $ref: types.yaml#/definitions/address
     maxItems: 1
-- 
2.52.0

