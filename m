Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB52231ED93
	for <devicetree-spec@vger.kernel.org>; Tue, 26 May 2026 10:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792653; cv=none; b=obG87hzEl7zRmP9BvXREhzpvYl3Hx/trvAw4Us6FuLWEHGhb6GGrnzoVR+zbjqTK1DmEriwmPiYTwgci0UdwrxAmWTNqtGypMOgD4iWgMadgp9oUCR5Tg4ovLQAGC02OyU5lv2yOzQHoatHccAH2cJ9sI3sZDamZsOhKbEf0u74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792653; c=relaxed/simple;
	bh=hcGZEd3cNtTEwmGmcg8JjyvtBicU3hi2uCA+4SD49Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AtqoR5Y7r/fzdhAaw9YlHwTIpGYsu040YrZNpfsYE4kQ2HG7O0BjLxc0J9sLzfjz4e/p1gNfTAYepWJtu0uzW+r25nP1HzHwlBopdDy4L+jRW7za+xathbrt2yaQ0asRrpKKpJ8GOw88wEJ5hqueHUqNlj9UeCjERX/EtFB2/Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=dwShcoTH; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="dwShcoTH"
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260526104038995b08795f000207c9
        for <devicetree-spec@vger.kernel.org>;
        Tue, 26 May 2026 12:40:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yTkYhs1Ve3wsRYye/+TLq8Fk4zUTKzJsZkL7JuJ+v7c=;
 b=dwShcoTHb2KSJS0xf/KDjYHLx8cKeyhdC7UsLeSEkQmW7C+2KMVneZ24sgTkMNzFLXQauD
 NMbHWb7JehWCUh2km/qEo+ymiQk6USZCxJdMm1PAwmzuY0G9PjJFZjvaFIx+Voak9yZkbux2
 eR32ptcQ84ZaNRcoUhuAFOaPoikwvpAu4/Sbn+tFcrfqSNOQLEtGRSPV9COHvi56WQSHWt6T
 QXb6Hxt8AknpdbdJn/oQ2z5yO4VhahNYTbrJHKhTUlQ1MexAH+c6y9H9UbXN7NYaiIgNRngz
 HFxU2/gESuyIRzM66WriHR/uMCU47FlkRPvsTc0uTxQ31ZX/jYLjUmGg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: devicetree-spec@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Simon Glass <sjg@chromium.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] schemas: chosen: Add reset-reason property
Date: Tue, 26 May 2026 12:40:32 +0200
Message-ID: <20260526104034.2735938-1-alexander.sverdlin@siemens.com>
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
  security     -                 ele              -
  pmic         -                 pmic             -

Note: barebox already populates this property but uses abbreviated
uppercase values (common/reset_source.c). These will need to be adapted
to match the standardized lowercase values defined here.

The list can be extended in the future as needed.

Link: https://lore.kernel.org/all/579fcbc186ad2aeea3c206aebc901b64fc665db1.camel@siemens.com/
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Krzk, apparently /chosen is already potentially very dynamic, thanks to
kaslr-seed and rng-seed properties.

 dtschema/schemas/chosen.yaml | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
index 63f3c12..2daf791 100644
--- a/dtschema/schemas/chosen.yaml
+++ b/dtschema/schemas/chosen.yaml
@@ -183,6 +183,33 @@ properties:
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
+    description:
+      This property is set by the bootloader to indicate the reason for the
+      most recent system reset. The values are generic categories that
+      bootloaders map their platform-specific reset sources to.
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

