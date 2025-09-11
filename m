Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB4E34F46C
	for <devicetree-spec@vger.kernel.org>; Thu, 11 Sep 2025 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603689; cv=none; b=r94ILsyBTUz4g6+yXRHCR/J/rl3ngxm4mfGGt8OQN9qpFl2SL4wV337bgT2ar6GmT5ca5tZc1sa32rmRK5YbskIx8W8gC80r4IaeUdqb/U3GvMizUqLQ9ILZNyQ5Q1tXFXHZ5am7nJDdh3gVrhIgBXgEJ8JYAECLG/4WjhZWEi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603689; c=relaxed/simple;
	bh=gFPP5AJxajK95ebcT+ygBcwnznDTFSpDjpt5bFKHJco=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OMEyi8quroqmO8mxLkRFdzuGyrFHqqbT8OvpDBkcbjs8oBlTmq50WOqgbcD8bdZkE1ylDiIJbYQdxTVr4KK/jmuy/UkUX2iuS/RWVeGhbhfFaNGD0z3NKdAdO1WMbNu+j1N6PakLsiXQcNv6YblOwrYPSjAKjy/gr5eI4OtJW54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBZlDMUR; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBZlDMUR"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-8877677dbaeso18748739f.0
        for <devicetree-spec@vger.kernel.org>; Thu, 11 Sep 2025 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757603686; x=1758208486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TL8sBN7m+ljpvNUUKvtA2Gj21T9prXayXIxSz2NFiTU=;
        b=sBZlDMURowbtqyFhuvFBFXvaAZqP9GHX+AiR6MM5AmoPOhu/VkL8lPn6JlOwrOJjkx
         Vlqh6AjuCmydboDwDpi5l9aaIIxopf65+aJ6kwz+8mQqEw30aDHfAgGcHDzXovMrHpSg
         YBNUWD1Qi337fAuTI3PIoV1gJnIZPFGfRFW5FbcV+8/Jra3cNmbSK8N2I5u8rAndjDny
         sbpjC5TA54XNEp3UAAEPsIXhcoTx4VHRcy5qVvQLv+X7yVU7RmLsw1YXvZrReVDvZ3E7
         JsU5X/kB8qd4T7TJLl2a/tDnbo3FiBuxz6TbwONGqfQMwalkRoLWNxiheK1ZSFPMtNKB
         GXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757603686; x=1758208486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TL8sBN7m+ljpvNUUKvtA2Gj21T9prXayXIxSz2NFiTU=;
        b=lVe3hofukyMdSwqy+twkIcD9Aeb15DJmOMpjM6mBfsA4N3SCrQWVNCAy2aK5Jee1Xs
         Me5IC+kZ8nsmYIlgXn6Blp88kUY9PrVl+RLIaQR1DWl+s5CHC+BkoccRyi5tPwLdFRC1
         iQfrfuafEcJmBa6rcpNUR0AC5yPL3wz/Kv8OA1xn2LnAKiX6ZwMw+OePO2ykqX/RHbUp
         XqbJYXGkkMmVa8XWqnxolWzWpYOSE3iv2+OgMJdEqams6rpaIR78cwbqABxmiE/Cq6KU
         gQFA1cUWKC/IW929kG0+wOkhy9ySIgVrk+ZaUyOe4P2qBuESjmt/B+9iicYre3D13Q+n
         P9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ3l7BLRdOfEYHJZzw4KlE73dDqRF1H8Gg6Xs9H4DThbrmvJ1EDfQrFLOvSTKuTj8wNIYWUe59YMEjcJzLGcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOu7XMpLMZMp7LTB5g2QTzRk6DZZeeZa/hQlAMwE0il38fRsKX
	CVWJgJm4I8YICXtfnaanOxnVb32Ejs2PwU8dwlxghbHIiJIbw1qMysQy2gip1A/f0SL6eNJa6SA
	wssgV
X-Gm-Gg: ASbGncsc26sx8A9YegS5bmSfnvJX0KXpGcLDtjZKi9Sx0iZWiuaikKqzcKRUE7i0hsJ
	0vVPSvEs9wgCKlHYGEc3BCxORgdtxro5EAepZkIWBxA1hx2u+n//kknegWN7DQUQHAcUgoj6VaQ
	tvQt6Nk0pxl2U/at2+pPaekxEh/aOFEjXQuAqFB+V78dEX3zjaV5q5XGLHvSrk0OISatcoG2rRB
	3/H1eQK8eprgZyfEKqqPdKwQCDGRuTbhQcfKwgU60SgaT8o9+Jr4wmZg9B83QaheYGmkXd70Cwi
	4lzY1udmVofEUk8LvEs4ajZ3VIeQNx/hUrBJ1NU/iqHfAdj/wloua1mXcXzisQgrvzGz1wcRJxK
	169c64f2NjdW+6dbHpUqmxf++gYn7oeA1loOJHU9+lbtgGq88Tx+jrdXAWKikXWpHqYpRwUZQXb
	5pgOsuFWGq8A==
X-Google-Smtp-Source: AGHT+IE6DbCHQGT3GL1n9OFvLlun1jX9ds1zSORNzE+G+6Ju2SnMa2q2FJWS74CsRl89wRYBcZzTXg==
X-Received: by 2002:a05:6602:2c06:b0:88d:4fd3:8131 with SMTP id ca18e2360f4ac-88d4fd38225mr1277407039f.19.1757603686287;
        Thu, 11 Sep 2025 08:14:46 -0700 (PDT)
Received: from ubuntu.localdomain (209-227-169-220.cpe.distributel.net. [209.227.169.220])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-88f2fabab2bsm68042039f.24.2025.09.11.08.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 08:14:45 -0700 (PDT)
From: Raymond Mao <raymond.mao@linaro.org>
To: linux-doc@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: ilias.apalodimas@linaro.org,
	Raymond Mao <raymond.mao@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] docs: devicetree: overlay-notes: recommend top-level compatible in DTSO
Date: Thu, 11 Sep 2025 08:14:36 -0700
Message-Id: <20250911151436.2467758-1-raymond.mao@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When managing multiple base device trees and overlays in a structured
way (e.g. bundled in firmware or tools), it is helpful to identify the
intended target base DT for each overlay, which can be done via a
top-level compatible string in the overlay.

This provides a way to identify which overlays should be applied once the
DT is selected for the case when a device have a common firmware binary
which only differs on the DT and overlays.

This patch updates the document with a note and example for this
practice.
For more information on this firmware requirement, please see [1].

[1] https://github.com/FirmwareHandoff/firmware_handoff/pull/74

Suggested-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Signed-off-by: Raymond Mao <raymond.mao@linaro.org>
---
Changes in v2:
- Updated commit message.
Changes in v3
- Rename to 'overlay-compatible' and rephrase the description accordingly.

 Documentation/devicetree/overlay-notes.rst | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/overlay-notes.rst b/Documentation/devicetree/overlay-notes.rst
index 35e79242af9a..77284afba9a4 100644
--- a/Documentation/devicetree/overlay-notes.rst
+++ b/Documentation/devicetree/overlay-notes.rst
@@ -103,6 +103,38 @@ The above bar.dtso example modified to use target path syntax is::
     ---- bar.dtso --------------------------------------------------------------
 
 
+Overlay identification
+----------------------
+
+When managing device tree overlays dynamically - such as bundling multiple base
+device trees and overlays within firmware, initramfs, or user-space tools - it
+is important to associate each overlay with its corresponding base device tree.
+
+To support this association, each overlay should define a top-level compatible
+string (referred to as the 'overlay-compatible' string). This string is
+intended to match the top-level compatible property of the target base device
+tree.
+
+By including this identifier, higher-level software or firmware can determine
+which base device tree an overlay is compatible with, and apply it accordingly.
+
+Example usage::
+
+    ---- bar.dtso - overlay with top-level compatible string -------------------
+	/dts-v1/;
+	/plugin/;
+	/ {
+		overlay-compatible = "corp,foo";
+
+		...
+	};
+    ---- bar.dtso --------------------------------------------------------------
+
+This top-level compatible string is not required by the kernel overlay
+mechanism itself, but it is strongly recommended for managing overlays in
+scalable systems.
+
+
 Overlay in-kernel API
 --------------------------------
 
-- 
2.25.1

