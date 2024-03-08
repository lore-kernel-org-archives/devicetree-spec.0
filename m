Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548C0E555
	for <devicetree-spec@vger.kernel.org>; Fri,  8 Mar 2024 06:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709881001; cv=none; b=YgET6b3RKB2ymmqMmXFUS9bPgAr3F15DYORlTAa0YYpPCLFil2JRnpHcLunPExYttAhSzmzA5lBriPrn58rRV5eHvRAfEXGzbb8p+4mHY4DwiC4c5rtDS+djyjn9vzQ/ufq5aXzwA00tViqTO5PmhaHp2trbGs4C6NWmDyDKXGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709881001; c=relaxed/simple;
	bh=y/CuXsopRTc6Go2gYFSfbcLU4/65wcOPQcN09s1NBzo=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=JO4aNOxx1ikQU6A+zWExup4smX9OwKLHMQTrEOUT5bRqyVSNyuLVwLt9M7UicROWLCmYjrhwN+uEO+t6Wm6mtmJuc2lFXkzF+PEUNj2fYMoJtFNsGTIseugMQHlSzeRumICZW+H4hBxbxxKYMOPC7kd8Spq4X/gWC276Mkhd7VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VobY7I1D; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VobY7I1D"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc693399655so3432350276.1
        for <devicetree-spec@vger.kernel.org>; Thu, 07 Mar 2024 22:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709880998; x=1710485798; darn=vger.kernel.org;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RCQf2CkKBjxotP1Z2eR/fCTAhxpwkY9xv1PrfXteT6s=;
        b=VobY7I1DbbMKaxAuHWCBRJa9qzufM0CodE76bjWJ8fMZHiebhjpHF48QPAhEk3MoPx
         jJmkkeRH2AETqHYGxU9LrxqICNzzDSqR2C2kDQdwjbZN9piO+9h90AXB1kdosSAKo9ta
         AaAQ9hxUUhCTx+kjP0rWPfr5B3tJjhaH44FWT72SXXEv7gm7xrhhqVNaVDYSMynCNjS5
         Fc96/h1zSEnxI2MtFZC2vmEPAvl6mGdijSOE86dAoKJz8EvEKCZj21cSzr2zGmE7kqPW
         zn0U5XWagiDGy8BoCfYQ8cp5TRfU4YQulIldMktU7LY5jbv5APyXKXZLC8rgYnRLSwgr
         BaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709880998; x=1710485798;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCQf2CkKBjxotP1Z2eR/fCTAhxpwkY9xv1PrfXteT6s=;
        b=bru1240B52cvJv+Sm6zp8P1uKiNMcZ25EHX/I4UpN16kPkycGLnAoXJKbWhLIHOCxZ
         R1QkeKKPTIFjWp1/ePaRalSCjoow9gTE8jXlqo/RY8jaWkPiVvFW0X7Z7eyPOijmzepL
         PLZ7F964PUhPGh0l/qdXnkJ3Loj/7UFoSPH5xdSlpXS3tgTY+/qo0ITZ96jA3WYyroxz
         p9oOEZczJqLKxe4uSOlV+f7gW0Inq3YKJjoZ0128qhFp1Xmcs/4wVV2LFZxcT6Qo56ph
         pDfmQoPIo9QzHjDdB7oYlmHi8XJ1NEIuurZ1i3VorgX/Gd4hcaFeqElWintScmlsxN5b
         5csA==
X-Forwarded-Encrypted: i=1; AJvYcCVeJUpAfQTr+LUbEzpSu73m2dFaELVyOIilDjnbKJj5u8MHF4Erv8Drz6QYWddy97uXWPq/P+ObA6GuAtkz17VlWifRmyJt7KF/xIXxvHZ4
X-Gm-Message-State: AOJu0Yy4GNs3ytsVriiIB7g4vCeY9yvILHb+2eANrt9peBngE2O3CSTJ
	gePQsYOqGG13/yXOawXDqR06bhTgqPW1VmzM+M2eLvNnl3Gyofd6w8DBixPMmkYtsa+3b7ZEYEQ
	EXCmv7gniLZS1jw==
X-Google-Smtp-Source: AGHT+IHt/B+lV3GkKb3ikN36rtmKUFzGwcx6fKeBeVQ1Pn0nKsp+ezBxvZKbYd8R4qamlR0YElAKsZPzL6c+678=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:d8cf:a5f8:feb1:8d50])
 (user=saravanak job=sendgmr) by 2002:a05:6902:1004:b0:dc7:48ce:d17f with SMTP
 id w4-20020a056902100400b00dc748ced17fmr5161990ybt.10.1709880998470; Thu, 07
 Mar 2024 22:56:38 -0800 (PST)
Date: Thu,  7 Mar 2024 22:56:33 -0800
Message-Id: <20240308065633.2180623-1-saravanak@google.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Subject: [PATCH v2] schemas: Add schema for post-init-providers
From: Saravana Kannan <saravanak@google.com>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, devicetree-spec@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

The post-init-providers property can be used to break a dependency cycle by
marking some provider(s) as a post-device-initialization provider(s). This
allows an OS to do a better job at ordering initialization and
suspend/resume of the devices in a dependency cycle.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 dtschema/schemas/post-init-providers.yaml | 105 ++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 dtschema/schemas/post-init-providers.yaml

diff --git a/dtschema/schemas/post-init-providers.yaml b/dtschema/schemas/post-init-providers.yaml
new file mode 100644
index 0000000..a329776
--- /dev/null
+++ b/dtschema/schemas/post-init-providers.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020, Google LLC. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/post-init-providers.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Post-device-initialization providers
+
+maintainers:
+  - Saravana Kannan <saravanak@google.com>
+
+description: |
+  This property is used to indicate that the device(s) pointed to by the
+  property are not needed for the initialization of the device that lists this
+  property. This property does not make a device (that's previously not a
+  provider) into a provider. It simply downgrades an existing provider to a
+  post-device-initialization provider.
+
+  A device can list its providers in devicetree using one or more of the
+  standard devicetree bindings. By default, it is assumed that the provider
+  device can be initialized before the consumer device is initialized.
+
+  However, that assumption cannot be made when there are cyclic dependencies
+  between devices. Since each device is a provider (directly or indirectly) of
+  the others in the cycle, there is no guaranteed safe order for initializing
+  the devices in a cycle. We can try to initialize them in an arbitrary order
+  and eventually successfully initialize all of them, but that doesn't always
+  work well.
+
+  For example, say,
+  * The device tree has the following cyclic dependency X -> Y -> Z -> X (where
+    -> denotes "depends on").
+  * But X is not needed to fully initialize Z (X might be needed only when a
+    specific functionality is requested after initialization of Z).
+
+  If all the other -> are mandatory initialization dependencies, then trying to
+  initialize the devices in a loop (or arbitrarily) will always eventually end
+  up with the devices being initialized in the order Z, Y and X.
+
+  However, if Y is an optional provider for X (where X provides limited
+  functionality when Y is not initialized and providing its services), then
+  trying to initialize the devices in a loop (or arbitrarily) could end up with
+  the devices being initialized in the following order:
+
+  * Z, Y and X - All devices provide full functionality
+  * Z, X and Y - X provides partial functionality
+  * X, Z and Y - X provides partial functionality
+
+  However, we always want to initialize the devices in the order Z, Y and X
+  since that provides the full functionality without interruptions.
+
+  One alternate option that might be suggested is to have the driver for X
+  notice that Y became available at a later point and adjust the functionality
+  it provides. However, other userspace applications could have started using X
+  with the limited functionality before Y was available and it might not be
+  possible to transparently transition X or the users of X to full
+  functionality while X is in use.
+
+  Similarly, when it comes to suspend (resume) ordering, it's unclear which
+  device in a dependency cycle needs to be suspended/resumed first and trying
+  arbitrary orders can result in system crashes or instability.
+
+  Explicitly calling out which link in a cycle needs to be broken when
+  determining the order, simplifies things a lot, improves efficiency, makes
+  the behavior more deterministic and maximizes the functionality that can be
+  provided without interruption.
+
+  This property is used to provide this additional information between devices
+  in a cycle by telling which provider(s) is not needed for initializing the
+  device that lists this property.
+
+  In the example above, Z would list X as a post-init-providers and the
+  initialization dependency would become X -> Y -> Z -/-> X. So the best order
+  to initialize them becomes clear: Z, Y and then X.
+
+select: true
+
+properties:
+  post-init-providers:
+    # One or more providers can be marked as post initialization provider
+    description:
+      List of phandles to providers that are not needed for initializing or
+      resuming this device.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      maxItems: 1
+
+additionalProperties: true
+
+examples:
+  - |
+    gcc: clock-controller@1000 {
+        compatible = "vendor,soc4-gcc", "vendor,soc1-gcc";
+        reg = <0x1000 0x80>;
+        clocks = <&dispcc 0x1>;
+        #clock-cells = <1>;
+        post-init-providers = <&dispcc>;
+    };
+    dispcc: clock-controller@2000 {
+        compatible = "vendor,soc4-dispcc", "vendor,soc1-dispcc";
+        reg = <0x2000 0x80>;
+        clocks = <&gcc 0xdd>;
+        #clock-cells = <1>;
+    };
-- 
2.44.0.278.ge034bb2e1d-goog

