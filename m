Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE35879DD
	for <devicetree-spec@vger.kernel.org>; Tue,  9 Jan 2024 03:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fXvsl46d"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-59612e4a21eso722173eaf.3
        for <devicetree-spec@vger.kernel.org>; Mon, 08 Jan 2024 19:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704771897; x=1705376697; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+XCnSDWxoD/9EaxjuZ5HOkBU5nhoCs4PAo23JtdmwPM=;
        b=fXvsl46dyaxbuSo529In94UiIILOgTdKCG7InxP8e2V8nxzg0VFIDiRbdp7PaJsVny
         0M0FtAX8vEPwmCWCcu1E0jSRG+lq5LLQD2TeGsBXNazvknFdfis9fimisiXzRVKIC0By
         8oYIw/Ew42ocnF5jWObWGTUA97IXrTcwRTZhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704771897; x=1705376697;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+XCnSDWxoD/9EaxjuZ5HOkBU5nhoCs4PAo23JtdmwPM=;
        b=GNq4/YJdWUKhyAnBveV2abehtMPpj52WTUqMsmjzSB0fcUND3tXHs+gnGCg0d2w+Y+
         ZMirtSMuP05FbLx7J6e6a+Zzd1W076fYMcifwgEINEN8buKl/QyUVTRZnws1QPZgYI9Y
         /6inHOpdCG4KcAZhu/ngg0nfi+tmChV4xCNmFMa4dMmmhOgDXVmVy3jF9uosF91jk6cj
         qwuXZW5pwVA7+1UbI9PJ2NcFvdc244m9Av3E9Pmw4REVNY29c4+yWxfFcBAcDvVY2Gat
         cggZ7Z4Lt9RygEO/b0N0eUHdSQ4dE5ka449pz+ngj/iBzUxlbRU6n15GZb61ZIU0uyx8
         WZkA==
X-Gm-Message-State: AOJu0YxfBfEMMfhNGtXLTNJNVUOMgS/wGUR5jl8Indd0HsTKTOlSskDI
	4Q9+SxMarHltdbVVW2hC/KWDEZA4izkfY2+BftGy0Ay5KKr+VdKEbnhsrYHvtA==
X-Google-Smtp-Source: AGHT+IHZS+GZctVFHbsGpgLObwFCk+WlGOKNjSdXOzwEIH2ydXW0nR8VextJqpEFhYPbGcXFPTwfDXq8SlKXOAtSSoI=
X-Received: by 2002:a05:6871:7993:b0:205:fd77:f3e9 with SMTP id
 pb19-20020a056871799300b00205fd77f3e9mr2207486oac.39.1704771896775; Mon, 08
 Jan 2024 19:44:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yi Chou <yich@chromium.org>
Date: Tue, 9 Jan 2024 11:44:45 +0800
Message-ID: <CABOkjxLPvtknz4XxfjCdnjvLCpbz5OF1U+x8AgoU7RnRe95TVA@mail.gmail.com>
Subject: [PATCH v2] schemas: Add Google Widevine initialization parameters
To: devicetree-spec@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Yi Chou <yich@google.com>, Yi-An Chen <chenyian@google.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, 
	Simon Glass <sjg@chromium.org>, etienne.carriere@linaro.org, 
	Julius Werner <jwerner@chromium.org>, joakim.bech@linaro.org, etienne.carriere@foss.st.com
Content-Type: text/plain; charset="UTF-8"

The necessary fields to initialize the Widevine related functions in
OP-TEE.
Widevine is Google's content protection system for DRM (Digital rights
management) contents.

Signed-off-by: Yi Chou <yich@chromium.org>
Reviewed-by: Simon Glass <sjg@chromium.org>

---
The previous discussion in the OP-TEE:
https://github.com/OP-TEE/optee_os/pull/6418
The reviewers prefer us to remove the compatible string.
And they prefer the /options/op-tee/widevine node.

Changes in v2:
- Change all "widevine" to "Widevine".
- Fix the prefix of properties.
- Add the explanation of Widevine in the description section.
- Add the usage restriction in the description section.

 .../options/op-tee/google,widevine.yaml       | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 dtschema/schemas/options/op-tee/google,widevine.yaml

diff --git a/dtschema/schemas/options/op-tee/google,widevine.yaml
b/dtschema/schemas/options/op-tee/google,widevine.yaml
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
