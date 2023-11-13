Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903C4156C7
	for <devicetree-spec@vger.kernel.org>; Mon, 13 Nov 2023 07:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IoHsJXa6"
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D8210D1
	for <devicetree-spec@vger.kernel.org>; Sun, 12 Nov 2023 23:53:09 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc34c3420bso29717355ad.3
        for <devicetree-spec@vger.kernel.org>; Sun, 12 Nov 2023 23:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699861989; x=1700466789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2G0VXlu8ZaDtvXfeOfspFU98ZgeTgYCGnoJJr0yhUvo=;
        b=IoHsJXa6ti8DAQ/wnJ24/ci7EXK9rNtMiaZ3hPtWAFeFEMvPlvqXDo4awUUqUW2Lxm
         xfS0My5Xd4zMY2EhT9rmttl78y0CUiG0xLbDD3eUr+rHBTRJZsQH6gjw/ryh1fF7YGpW
         QSZ0pZWgAMOS6Gppdaj+rH84w/pR/IN7WPZM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699861989; x=1700466789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2G0VXlu8ZaDtvXfeOfspFU98ZgeTgYCGnoJJr0yhUvo=;
        b=d7/Sn5f7KfyQkQEiGg/4+0zYckFUkGCS6SF0BxM3wIgBmmfrUzdEO8I+Z1cBMK1wCR
         VbA2hGfkNyULzXlDa8RysQsH8CFzwGmzV8Q4iEVzGxXwyQc3nAbmKJPf7KGut7McX/EN
         eeiZvbEx+GAnuht41okmdxcx5p1GNOZRbtBRr0k9Zm6f86bnUGmxAX0NYpqWJQgEEyi1
         RwnYQZkcCyf24IjxEvWcemu8qDD3BW/GE91qFUO1fpw/HGkRO0TH2F51TV4Hj2SfmDY1
         V9kokewKhKR3YcOz00Uo8GaH4O1o6NDYkCUA81FuMfAjN4TleV5iGw/oqbUQoXmZwb3y
         98Xw==
X-Gm-Message-State: AOJu0Yz0vhWmVc9ALUpTRcoyrRWwR6Ry0mgUOHUYqTbQC9rGbn+2jU2D
	vFacfodLcOG/GZwEEI7pJXrox3d8CaALY/hM75I=
X-Google-Smtp-Source: AGHT+IGDz18z9o1AV/auCyH0+iS3xct+FcoIyyH9hA7cPMuacpLACj7BxnL/ATeDY6n/bnbU2xsvQA==
X-Received: by 2002:a17:902:f68e:b0:1cc:c546:6425 with SMTP id l14-20020a170902f68e00b001ccc5466425mr3857226plg.59.1699861989240;
        Sun, 12 Nov 2023 23:53:09 -0800 (PST)
Received: from yich.tpe.corp.google.com ([2401:fa00:1:17:7450:be5d:13d7:fefd])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902d48a00b001c60ba709b7sm3512975plg.125.2023.11.12.23.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 23:53:08 -0800 (PST)
From: Yi Chou <yich@chromium.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree-spec@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	yich@google.com,
	chenyian@google.com,
	jens.wiklander@linaro.org,
	jkardatzke@google.com,
	sjg@chromium.org,
	etienne.carriere@linaro.org,
	jwerner@chromium.org,
	Yi Chou <yich@chromium.org>
Subject: [PATCH v2] schemas: Add Google Widevine initialization parameters
Date: Mon, 13 Nov 2023 15:48:54 +0800
Message-ID: <20231113075249.3807225-1-yich@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The necessary fields to initialize the Widevine related functions in
OP-TEE.
Widevine is Google's content protection system for DRM (Digital rights
management) contents.

Signed-off-by: Yi Chou <yich@chromium.org>
Reviewed-by: Simon Glass <sjg@chromium.org>

---
The previous discussion in the OP-TEE:
https://github.com/OP-TEE/optee_os/pull/6418
The reviewer prefer us remove the compatible string.
And they prefer the /options/op-tee/widevine node.

Changes in v2:
- Change all "widevine" to "Widevine".
- Fix the prefix of properties.
- Add the description of Widevine in description.
- Add the usage restriction in the description.

 .../options/op-tee/google,widevine.yaml       | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 dtschema/schemas/options/op-tee/google,widevine.yaml

diff --git a/dtschema/schemas/options/op-tee/google,widevine.yaml b/dtschema/schemas/options/op-tee/google,widevine.yaml
new file mode 100644
index 0000000..742e519
--- /dev/null
+++ b/dtschema/schemas/options/op-tee/google,widevine.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/options/op-tee/google,widevine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Widevine initialization parameters
+
+maintainers:
+  - Jeffrey Kardatzke <jkardatzke@chromium.org>
+  - Yi Chou <yich@chromium.org>
+
+description:
+  Widevine is Google's content protection system for DRM (digital rights
+  management) contents.
+  The necessary fields to initialize the Widevine related functions in
+  OP-TEE. This node does not represent a real device, but serves as a
+  place for passing data between firmware and OP-TEE.
+  The content of this node should not be shared with the Linux kernel.
+
+properties:
+  op-tee,hardware-unique-key:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 32
+    description: |
+      The hardware-unique key of the OP-TEE. It will be used to derive
+      the secure storage key.
+      For more information, please reference:
+      https://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html#hardware-unique-key
+
+  tcg,tpm-auth-public-key:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 1024
+    description: |
+      The TPM auth public key. Used to communicate the TPM from OP-TEE.
+      The format of data should be TPM2B_PUBLIC.
+      For more information, please reference the 12.2.5 section:
+      https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1p59_Part2_Structures_pub.pdf
+
+  google,widevine-root-of-trust-ecc-p256:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 32
+    description: |
+      The Widevine root of trust secret. Used to sign the Widevine
+      request in OP-TEE. The value is an ECC NIST P-256 scalar.
+      For more information, please reference the G.1.2 section:
+      https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-186.pdf
+
+required:
+  - op-tee,hardware-unique-key
+  - tcg,tpm-auth-public-key
+  - google,widevine-root-of-trust-ecc-p256
+
+additionalProperties: false
+
+examples:
+  - |
+    options {
+      google,widevine {
+        op-tee,hardware-unique-key = [
+          12 f7 98 d2 0e d2 85 92 a5 82 bf 98 b8 99 2b c0
+          c6 6f 19 85 79 86 65 18 55 eb ff 9b 6c c0 ac 27
+        ];
+        tcg,tpm-auth-public-key = [
+          00 76 00 23 00 0b 00 02 04 b2 00 20 e1 47 bf 27
+          e1 74 30 c8 16 ab 72 4d 5c 77 e1 5c 61 2d 56 81
+          b3 35 cd 9d eb 67 41 37 69 f0 32 41 00 10 00 10
+          00 03 00 10 00 20 70 9a df 50 f9 0f d5 f4 40 e0
+          ea 2c e8 f2 26 9f 0e 5c 02 70 16 c3 6c c1 83 03
+          2d 04 10 bd 85 7a 00 20 83 03 c2 66 6e 01 32 34
+          5c 5e 80 22 c7 48 24 3c 70 6b b8 e4 24 42 74 a9
+          cf fc ab f8 30 e9 de 51
+        ];
+        google,widevine-root-of-trust-ecc-p256 = [
+          ac 0d 86 c3 d7 b5 b7 a2 6f c3 d9 93 f7 de bc bb
+          d5 c4 25 9b 21 5f 36 af b5 dd 6d 29 9d 08 c0 10
+        ];
+      };
+    };
-- 
2.42.0.869.gea05f2083d-goog

