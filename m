Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C42F538F
	for <devicetree-spec@vger.kernel.org>; Fri, 10 Nov 2023 06:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fSCdj3uS"
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D3D56583
	for <devicetree-spec@vger.kernel.org>; Thu,  9 Nov 2023 22:19:37 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-357cc880bd8so6482655ab.0
        for <devicetree-spec@vger.kernel.org>; Thu, 09 Nov 2023 22:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699597177; x=1700201977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41hoSxaBjemT+Wb7P21DcL3c/Tlaphxmd9ccjMboL/w=;
        b=fSCdj3uSm9ejdD5z5/d5yrlO2OQwu7cy9KzfOhuppzT6AcsclcCg2NyjWSg/nyixfR
         laIfz4Yf+MtkUeKzACwF5X8nzonXnVlV8SmNQknEL4f0lRs3/XxTWufrl69163Z1MLQY
         CEspmULVdXGlSkyern6uBg9gFAHZ2S2CEpfH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699597177; x=1700201977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41hoSxaBjemT+Wb7P21DcL3c/Tlaphxmd9ccjMboL/w=;
        b=JZHUQf3sJAcibewNnUOe8HI6O6F6VUbHohFPPridmwDynsRFkIdRPNDKhCWnG2sPSx
         g60/gvyC3FPpcAk8oGT+9NDF67cCdjKBdvQehACW5yvbYH0OaNjCHMe5Y80QDmX+Mo5b
         j8nzDwSANZund2r5nDDDPqOHoQSzPoZRwM6JCDwPYDahX5ByL/pQlY6l+NHHsX4Zh+IA
         1CvEzjVunCD3NQCcTInJ2PZzuM7FaD1kLaJV0VCRtsTDp+Iomq9ob2JdMg+90SoeF8c0
         GBzQN24fvkZMD48/wzgeCGb33qKecMo2ncD2s8bGippyDHQu9xTtUxffYr9JbbM6GvV1
         XdJg==
X-Gm-Message-State: AOJu0Yywq+y95IMsttoYaJGZpWu26uxmIvW8lVeJXs/QQg6DMUlGUDXy
	+0s9VF5GVwRA4UAJ/4fs32ypd1QY5K4pqVhEOf0=
X-Google-Smtp-Source: AGHT+IGgtl5uX6fMkIsp2oQqmtN+/hnxRzYJEDjorxnSn2mRvTlU+bozKpwJTjp8ll3XEjCVdJ9LzA==
X-Received: by 2002:a17:902:e74c:b0:1cc:1e16:e998 with SMTP id p12-20020a170902e74c00b001cc1e16e998mr7965082plf.51.1699590792784;
        Thu, 09 Nov 2023 20:33:12 -0800 (PST)
Received: from yich.tpe.corp.google.com ([2401:fa00:1:17:5d14:4ecf:470d:a34e])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902dac600b001ca86a9caccsm4344522plx.228.2023.11.09.20.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 20:33:12 -0800 (PST)
From: Yi Chou <yich@chromium.org>
To: Rob Herring <robh@kernel.org>
Cc: jkardatzke@google.com,
	yich@google.com,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree-spec@vger.kernel.org,
	chenyian@google.com,
	sjg@chromium.org,
	jwerner@chromium.org,
	jens.wiklander@linaro.org,
	Yi Chou <yich@chromium.org>
Subject: [PATCH] schemas: Add Google Widevine initialization parameters
Date: Fri, 10 Nov 2023 12:32:31 +0800
Message-ID: <20231110043241.2920553-1-yich@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The necessary fields to initialize the widevine related functions in
OP-TEE.

Signed-off-by: Yi Chou <yich@chromium.org>
Reviewed-by: Simon Glass <sjg@chromium.org>

---
There's no plan to add more optee stuff now.
This is it.

 dtschema/schemas/options/op-tee/widevine.yaml | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 dtschema/schemas/options/op-tee/widevine.yaml

diff --git a/dtschema/schemas/options/op-tee/widevine.yaml b/dtschema/schemas/options/op-tee/widevine.yaml
new file mode 100644
index 0000000..925c214
--- /dev/null
+++ b/dtschema/schemas/options/op-tee/widevine.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/options/op-tee/widevine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Widevine initialization parameters
+
+maintainers:
+  - Jeffrey Kardatzke <jkardatzke@chromium.org>
+  - Yi Chou <yich@chromium.org>
+
+description:
+  The necessary fields to initialize the widevine related functions in
+  OP-TEE. This node does not represent a real device, but serves as a
+  place for passing data between firmware and OP-TEE.
+
+properties:
+  google,optee-hardware-unique-key:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 32
+    description: |
+      The hardware-unique key of the Widevine OP-TEE. It will be used
+      to derive the secure storage key.
+      For more information, please reference:
+      https://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html#hardware-unique-key
+  google,tcg-tpm-auth-public-key:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 1024
+    description: |
+      The TPM auth public key. Used to communicate the TPM from OP-TEE.
+      The format of data should be TPM2B_PUBLIC.
+      For more information, please reference the 12.2.5 section:
+      https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1p59_Part2_Structures_pub.pdf
+  google,widevine-root-of-trust-ecc-p256:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 32
+    description: |
+      The Widevine root of trust secret. Used to sign the widevine
+      request in OP-TEE. The value is an ECC NIST P-256 scalar.
+      For more information, please reference the G.1.2 section:
+      https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-186.pdf
+required:
+  - google,optee-hardware-unique-key
+  - google,tcg-tpm-auth-public-key
+  - google,widevine-root-of-trust-ecc-p256
+
+additionalProperties: false
+
+examples:
+  - |
+    options {
+      widevine {
+        google,optee-hardware-unique-key = [
+          12 f7 98 d2 0e d2 85 92 a5 82 bf 98 b8 99 2b c0
+          c6 6f 19 85 79 86 65 18 55 eb ff 9b 6c c0 ac 27
+        ];
+        google,tcg-tpm-auth-public-key = [
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

