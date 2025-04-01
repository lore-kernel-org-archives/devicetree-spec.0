Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA571F91CD
	for <devicetree-spec@vger.kernel.org>; Tue,  1 Apr 2025 11:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508066; cv=none; b=MH+mIC6KaKXnR/U1RtClPlnq1jwCVO09TK8yp4lQyLdVGCknpjs1xzwrYUIooKgmskwCri/j+eRMsvGhV6zi8AhdiQ3EBM3OzV8fWDXlkrM4PyhDEICd5K6dbNjMu0uXO5KyDJFkr6R/+hgqDdrQ0brUsu5N8uGKyiisPZbaZX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508066; c=relaxed/simple;
	bh=HC9YcXsFwxwkZjag1aZeDvIeIR2oeeavJF3/hfva3Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qShKPsaAYbVaSS8g4jOjzrTCEWex+STX0E0Ce7eL8cyv/8mbh+7mWGfe7SG193rFPd0pfaOb2ao0z1x3cgMXV/juKpave8PlvMb16oQ0t6xHCblPqiBxcLgzfVWs9JeN88usJC9GjCYAfhgv0Rw5BFR7m50+hBBpweGMnFz1FWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3JaGb8k; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3JaGb8k"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso36427755e9.0
        for <devicetree-spec@vger.kernel.org>; Tue, 01 Apr 2025 04:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743508060; x=1744112860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u+pFp7hL2IKPOXMncUDhDL99DkPQ+stlFxly5H/Ir74=;
        b=d3JaGb8kvgtk4OlnxdM3O1OxLyZkTlKhjcV8/96PJs+L4Q8H8VXuKyk0A5jtmxV7CD
         WFK1fXEUw7pUDFURLGzvcJaUuEVtf40hK6av+w85oe88Fe4jLLUpzZia/P+MUZhdTzY9
         SkXUQS7TZznGF95K5aRDhLU8WUcFQxvWOytLrO2/ivFz25vLM4ZLfx1WWhVN0kQreO+r
         N2BSu0/FUJfhWlDYeq4PNrUWrgEMCEvYNcGkVb3v0m/p7tV8WOg59P6qSa+UQRyQ1/qT
         5Fq2FS+mNWE5DUIQ3t6R0tpQHUkc6a+EYGk0CCkjMw/x/8+U3oeN/rwCY9G/EXJCuVYH
         GUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743508060; x=1744112860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+pFp7hL2IKPOXMncUDhDL99DkPQ+stlFxly5H/Ir74=;
        b=YSn5/zi8l4SlmndyEI8LMCt0I+A66wgYG/RavUOsCKF7+oa4LT0CIPO1Dl1dq0LT0F
         W+viQZhgSXgUPg73P0whlKJi+JFiOJhtR9UmTPeXi2xr2KcHJ/LufMjzsWj+i6rEaDtv
         Rn8WrfrjXXbVkL5+xtZNUNawZOsqTrqhxQkgSbY5HdoRqE96ePcnys8I+EcU6MkJ/TMU
         XU8wqOHiwhJ31j625evmMooELu0vW5Shu5+BOExO84stIPfAhCkKfDkaWikpn17m7omB
         28mFcdqfZ63DMKUoUXHtnJXRq9FYTHB0UyIXE1indYBxfex7RsZrqbNeos67/AkvEmrM
         yQxQ==
X-Gm-Message-State: AOJu0Yxj7gHNn4s9JzqHVsmfd9MtDWCF2Fnz1+ker19uHZizWmXjYr1M
	XcjGC1a15soHNv5M8RbUQAoBhZurgdTbqUaO9MdZ+cJCEfpNa2P+
X-Gm-Gg: ASbGncuiVecGl4STXKFbYXTbuEU8BWmzcoTebDAW/ojs4n56hB/DwiFOm0GUFVJsVPm
	Zy+ukh6GGXBrBKGjO7K9Elh+j0qxuZuq5ppU31RMRA1SX1VykxvwAyZF7aaiZRG6V6FC5KJV9/j
	mdhR3NqcbNWmBxI7o29oW/J+0ysVzPiPqSeTIL6AGqBVSuRcGrnuheNFLIPgseyVqL17+O+OHED
	ssOFldMgSlSQ+p5rRLKb1oLYHmOKDiNnXQU9zNlWQSNGUhrt6yukJPYj8eQnTk6dc+98wD8IYLD
	60VlQCon+MfVmIiCoe7gygatEXDBLSmgf/QyZ4fV+D4M
X-Google-Smtp-Source: AGHT+IF1lHPwSYLk6lCvkJylxgNaWAKN5U6q5DVm+G3lMY8EdZzaUyIvu+CNpx4zMENfKRMNYum5OQ==
X-Received: by 2002:a05:6000:210d:b0:39c:1257:dbab with SMTP id ffacd0b85a97d-39c1257dd00mr7420051f8f.59.1743508059645;
        Tue, 01 Apr 2025 04:47:39 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b658ac5sm13628811f8f.1.2025.04.01.04.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 04:47:39 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-spec@vger.kernel.org
Subject: [PATCH] chapter2: fix reference to chapter6
Date: Tue,  1 Apr 2025 13:47:36 +0200
Message-ID: <20250401114736.56670-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Appendix 6 is now chapter 6.

Closes #73

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 source/chapter2-devicetree-basics.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devicetree-basics.rst
index 7658b19..ca716a1 100644
--- a/source/chapter2-devicetree-basics.rst
+++ b/source/chapter2-devicetree-basics.rst
@@ -575,10 +575,10 @@ Example:
    if a ``phandle`` property is not present. The meaning and use of the two
    properties is identical.
 
-.. note:: Most devicetrees in :abbr:`DTS (Device Tree Syntax)` (see Appendix A) will not
-   contain explicit phandle properties. The DTC tool automatically inserts
-   the ``phandle`` properties when the DTS is compiled into the binary DTB
-   format.
+.. note:: Most devicetrees in :abbr:`DTS (Device Tree Syntax)` (see
+   :numref:`Chapter %s <chapter-devicetree-source-format>`) will not contain
+   explicit phandle properties. The DTC tool automatically inserts the
+   ``phandle`` properties when the DTS is compiled into the binary DTB format.
 
 status
 ~~~~~~
-- 
2.49.0

