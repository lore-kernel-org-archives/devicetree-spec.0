Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B0863CF
	for <devicetree-spec@vger.kernel.org>; Wed,  6 Mar 2024 00:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709685000; cv=none; b=CYubIIYyIXiPXP/vOOldQdgFkkJsRaQfYTdla0amOQz8j3bwcwGBfCHFOu+bxyJ/NOi5xf3Afc+gq+09s68BVbHwti8MepPBTrHv5gjuf5RIwVDvsBbJbsvOUaNbjeqhdoB3Xux517bY/4JBHAF8bC0OED1svlBiGoHFWOGTFQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709685000; c=relaxed/simple;
	bh=TiZSb9H/rtPtRRjT6P+TFmK/UEUB9ifLm+pDNhnfCqc=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=NmEIaEMgoP1/Pq5kBtLpiQIO9BLLuNdFEAJx/shO2RPrK8Gkc6gA1P0Jeh9h6SrsOrhDTznQiVQHTEb86TWIjVMW2YyrB28sBIFvElvZvN83sW5S7k8wdxLlVSQqGrlIKCdHrgveeOJ4dh2odKZ0SAxhM+PiQKUSjT0CIM2VU/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qO9RZdZ9; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qO9RZdZ9"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-608852fc324so93212447b3.2
        for <devicetree-spec@vger.kernel.org>; Tue, 05 Mar 2024 16:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709684997; x=1710289797; darn=vger.kernel.org;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hl8J4bGp23+/eIQvpnN4zhLWLDzdovtxHYDqxAlfKhw=;
        b=qO9RZdZ9lA+zsE6a7EOuVTCM2cYZ7ssmUJbLiTv6jhO48uGVJJtZm0+OkudVNOk0BH
         RgNbHpPMqT9WYl7qsZ044FHFQXJvVkyhUP6Z3TvaYdl1cLvcTji/2UueBgD1yVZDnWXb
         QMNUs8OyjQST7R0LoZCWd/71DTHXHAAyWFBDAaN8D/DMMZqgSzJ8ADx6GgKxdUv4crR1
         W+ZM5ZBYKkcxrbMiTMVtZyC2UR8NtRNfbGuDQGsy2+1n6y0XB8ki7VNiwxTCvObGS462
         H38HV+pFtLstt4w/3OcTwVq7W728ehHUd6FLwI3+QFwOcn/Fy8ey7ldpcv5Z1gPwtukP
         2fXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709684997; x=1710289797;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hl8J4bGp23+/eIQvpnN4zhLWLDzdovtxHYDqxAlfKhw=;
        b=pN2KeE8gX5ngn0CxlwXN2pvZPIEmeyIL4qcFKwJIut9yMRZZOUKuB66yzGtsTtYhaW
         4YCJsMuNjGZticfIqkTcpU/uTzwsLsFignwIgJhgSxHxYEXjOLJ6u6qajgjVpxKeBOv1
         4U2MJ+tMx52FZKN1kIvGNE3fwA21xwu3NrL87rf8hQdAG06hjISX/Xnrsd6hp4d0YafP
         wyZEtuahQ6Y1lWdLmSJqNfNoVG+u7urb7Xm5JbTJ43jaenH4WwBtA/hcrc5dpsEqNvhr
         dJ6RlKQMQNbebMOLd47inHo3fEVXGFW/NkgJbxNnk506aVYoREa5iqhlZNfBlWGr26/7
         DgKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeRZFCAl9dAnU6jrB9DHrWPnKv+EP3W77TER7iYj2KCBPdyOSb53UvEbpgz4i1dla43AHj04fqLzALhK6BbZwoZnd2TRy+5hmI4h7z5M5z
X-Gm-Message-State: AOJu0YwS7dMzdgy4ZCumQ1WelkPV4XwjPxVA+HTD3fzaaThBj3rESsIX
	c1B7bd9LArr3V4i9roBIVQJnBj0E1CVz/ICYk5qqbBceE7U1+pd5PihcT5JcW9cbp84fev7ZsYg
	DLM8+xsH/5+HW+w==
X-Google-Smtp-Source: AGHT+IEQN8mvGRZXRbEbEP8r4ceh/tTby8LIRbejWdFZoHQ7dwDu87LngWMiOJUgDGsYDa/bxVqKyXBa3Ee4AYk=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:b92b:9ce5:bc90:259])
 (user=saravanak job=sendgmr) by 2002:a81:4c05:0:b0:608:d045:6eff with SMTP id
 z5-20020a814c05000000b00608d0456effmr3364387ywa.2.1709684997690; Tue, 05 Mar
 2024 16:29:57 -0800 (PST)
Date: Tue,  5 Mar 2024 16:29:50 -0800
Message-Id: <20240306002951.1601630-1-saravanak@google.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Subject: [PATCH v1] schemas: Add schema for post-init-providers
From: Saravana Kannan <saravanak@google.com>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, devicetree-spec@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

The post-init-providers property can be used to break a dependency cycle by
marking some provider(s) as a post device initialization provider(s). This
allows an OS to do a better job at ordering initialization and
suspend/resume of the devices in a dependency cycle.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 dtschema/schemas/post-init-providers.yaml | 105 ++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 dtschema/schemas/post-init-providers.yaml

diff --git a/dtschema/schemas/post-init-providers.yaml b/dtschema/schemas/post-init-providers.yaml
new file mode 100644
index 0000000..92eb9a0
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
+title: Post device initialization providers
+
+maintainers:
+  - Saravana Kannan <saravanak@google.com>
+
+description: |
+  This property is used to indicate that the device(s) pointed to by the
+  property are not needed for the initialization of the device that lists this
+  property. This property does not make a device (that's previously not a
+  provider) into a provider. It simply downgrades an existing provider to a
+  post device initialization provider.
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
+    specific functionality is requested post initialization).
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

