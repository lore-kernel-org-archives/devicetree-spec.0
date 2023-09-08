From: Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] dt-bindings: Add Google Widevine initialization parameters
Date: Fri,  8 Sep 2023 18:15:39 +0800
Message-ID: <20230908101539.2622864-1-yich@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694168312; x=1694773112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8DsptAslDdlTxfrgf4lCQnXF79qxRqm7dAzKkGdY2bw=;
        b=LUDas5Sm5MRxwT7D1Z9GbJY6elhDJB9kR+4zkP5aari16kzT2e7dOHi2ap8loEM4lA
         khJVNsKamWimnlUFw2U5pDBnQ8mCovPb/Q7gg1l/kaQwUMrp2LEgd9cp8TfN/dOj3W+Q
         RXPxKlwy6prTnoO9v+oTSGWjtljLtbEvSak+Q=
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, chenyian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jkardatzke-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

The necessary fields to initialize the widevine related functions in
OP-TEE.

Signed-off-by: Yi Chou <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 .../bindings/options/google,widevine.yaml     | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/options/google,widevine.yaml

diff --git a/Documentation/devicetree/bindings/options/google,widevine.yaml b/Documentation/devicetree/bindings/options/google,widevine.yaml
new file mode 100644
index 0000000000000..bf2b834cb1454
--- /dev/null
+++ b/Documentation/devicetree/bindings/options/google,widevine.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/options/google,widevine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Widevine initialization parameters.
+
+maintainers:
+  - Jeffrey Kardatzke <jkardatzke-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
+  - Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
+
+description:
+  The necessary fields to initialize the widevine related functions in
+  OP-TEE. This node does not represent a real device, but serves as a
+  place for passing data between firmware and OP-TEE.
+  The public fields (e.g. tpm-auth-public-key & root-of-trust-cert) can
+  be ignored because it's safe to pass the public information with the
+  other methods(e.g. userland OP-TEE plugins).
+
+properties:
+  compatible:
+    const: google,widevine
+
+  hardware-unique-key:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: |
+      The hardware-unique key of the Widevine OP-TEE. It will be used
+      to derive the secure storage key. The length should be 32 bytes.
+      For more information, please reference:
+      https://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html#hardware-unique-key
+
+  tpm-auth-public-key:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: |
+      The TPM auth public key. Used to communicate the TPM from OP-TEE.
+      The format of data should be TPM2B_PUBLIC.
+      For more information, please reference the 12.2.5 section:
+      https://trustedcomputinggroup.org/wp-content/uploads/TCG_TPM2_r1p59_Part2_Structures_pub.pdf
+
+  root-of-trust:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: |
+      The Widevine root of trust secret. Used to sign the widevine
+      request in OP-TEE. The length should be 32 bytes. The value
+      is an ECC NIST P-256 scalar.
+      For more information, please reference the G.1.2 section:
+      https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-186.pdf
+
+  root-of-trust-cert:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: |
+      The X.509 certificate of the Widevine root of trust on this
+      device. Used to provision the device status with the Widevine
+      server in OP-TEE.
+      For more information, please reference:
+      https://www.itu.int/rec/T-REC-X.509
+
+required:
+  - compatible
+  - hardware-unique-key
+  - root-of-trust
+
+additionalProperties: false
+
+examples:
+  - |+
+    options {
+      widevine {
+        compatible = "google,widevine";
+        hardware-unique-key = [
+          12 f7 98 d2 0e d2 85 92 a5 82 bf 98 b8 99 2b c0
+          c6 6f 19 85 79 86 65 18 55 eb ff 9b 6c c0 ac 27
+        ];
+        tpm-auth-public-key = [
+          00 76 00 23 00 0b 00 02 04 b2 00 20 e1 47 bf 27
+          e1 74 30 c8 16 ab 72 4d 5c 77 e1 5c 61 2d 56 81
+          b3 35 cd 9d eb 67 41 37 69 f0 32 41 00 10 00 10
+          00 03 00 10 00 20 70 9a df 50 f9 0f d5 f4 40 e0
+          ea 2c e8 f2 26 9f 0e 5c 02 70 16 c3 6c c1 83 03
+          2d 04 10 bd 85 7a 00 20 83 03 c2 66 6e 01 32 34
+          5c 5e 80 22 c7 48 24 3c 70 6b b8 e4 24 42 74 a9
+          cf fc ab f8 30 e9 de 51
+        ];
+        root-of-trust = [
+          ac 0d 86 c3 d7 b5 b7 a2 6f c3 d9 93 f7 de bc bb
+          d5 c4 25 9b 21 5f 36 af b5 dd 6d 29 9d 08 c0 10
+        ];
+        root-of-trust-cert = [
+          30 82 01 f4 30 82 01 9b a0 03 02 01 02 02 10 11
+          01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 30
+          0a 06 08 2a 86 48 ce 3d 04 03 02 30 0f 31 0d 30
+          0b 06 03 55 04 03 0c 04 54 69 35 30 30 22 18 0f
+          32 30 30 30 30 31 30 31 30 30 30 30 30 30 5a 18
+          0f 32 30 39 39 31 32 33 31 32 33 35 39 35 39 5a
+          30 0f 31 0d 30 0b 06 03 55 04 03 0c 04 54 69 35
+          30 30 59 30 13 06 07 2a 86 48 ce 3d 02 01 06 08
+          2a 86 48 ce 3d 03 01 07 03 42 00 04 ec ef cb 0c
+          68 7e 30 f4 d5 8f 2c 88 16 f4 7f b5 8b 5b 06 77
+          d7 47 fe 1e 91 4c a3 c5 a1 54 f5 40 9c f8 a5 4e
+          85 a0 fa 05 1a 01 98 da e4 b1 e5 ff 95 0d cf 8f
+          d9 c1 ce 28 0f 91 75 ca 06 e4 91 3b a3 81 d4 30
+          81 d1 30 1a 06 0a 2b 06 01 04 01 d6 79 02 01 21
+          04 0c 5a 53 5a 56 a5 ac a5 a9 7f 7f 00 00 30 0f
+          06 0a 2b 06 01 04 01 d6 79 02 01 22 04 01 21 30
+          2e 06 0a 2b 06 01 04 01 d6 79 02 01 23 04 20 23
+          e1 4d d9 bb 51 a5 0e 16 91 1f 7e 11 df 1e 1a af
+          0b 17 13 4d c7 39 c5 65 36 07 a1 ec 8d d3 7a 30
+          2e 06 0a 2b 06 01 04 01 d6 79 02 01 24 04 20 00
+          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30
+          2e 06 0a 2b 06 01 04 01 d6 79 02 01 25 04 20 00
+          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30
+          12 06 0a 2b 06 01 04 01 d6 79 02 01 26 04 04 00
+          00 00 00 30 0a 06 08 2a 86 48 ce 3d 04 03 02 03
+          47 00 30 44 02 20 62 a8 d3 23 db 1e 9c 64 91 49
+          45 5e b3 49 8d cc 1a ae 76 70 e3 12 d2 25 65 69
+          df f1 7e bc 4b d8 02 20 25 99 7c 36 cb b3 fd ce
+          6e 84 ee d7 ea eb 05 cf 69 cf 72 75 20 f3 ba 7f
+          8b 9f 06 f3 e4 11 bc cd
+        ];
+      };
+    };
-- 
2.42.0.283.g2d96d420d3-goog

