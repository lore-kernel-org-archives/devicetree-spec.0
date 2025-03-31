Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D5326AF6
	for <devicetree-spec@vger.kernel.org>; Mon, 31 Mar 2025 20:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743451377; cv=none; b=hEHgKUA8bv46eFOYa1aJZBc1u8dD7gu1asBof2eSTbEXtYUY6omYXFbMQmrLynHH6j3lgoDWbFoSYtDJi8LK5ld/vsTwVhIX7OKWdiGqSYvUSL2o618hQdx+g4NbgzBfoWqoaf5QmOssuz9jnwR6yPSQkhQAbo8f+q5zSCN6xYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743451377; c=relaxed/simple;
	bh=KGmc3eZhFtCIJZi3OfeN2te0touk85DKNBy/voo0mTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/pqwJSO85L3ISTnPD3WlWiQnFUYqQh9dklhHNFE1f/8gClCVclSqXQ1xTFMV+tlFNEIKWLTTBkHFefV9SSB81Ir1iyL6TDt/GOB11ewObVXKvhyDNVVBaFfVP0kkCP3WIQ1gP3YKysAG3euEi/H17CmcYkbnotZT25A1oKkVpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeHEYHni; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeHEYHni"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so27430275e9.2
        for <devicetree-spec@vger.kernel.org>; Mon, 31 Mar 2025 13:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743451374; x=1744056174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7P10jfHQT66ubzVLLxViQPcWqBsdwM6DPJ7sK0RzRU=;
        b=aeHEYHnidC22uoFMpmss3MgcbF7pB+4b8MMLLl7AXmuTbIlkkvh5Vlys9QlVaTDU2G
         C+FId07h5dtIoNqsDMlxsUJJZ49LW8DSBPYZwq+ZbkjBNGa0RUE0LL2vW+2EPVmVQqcY
         JBok0SHAE89D7sK1Gj1nBMI4J2dQnyUk/nyI3AhanFENkW8FRT7uR7S1IIju3NCrcHxP
         2MNYTwKr9QDKUy5Lil4bNCAPh+RnciMPFXCStT8LwfvAL5i2PqMcE+SliQTESP+Ocu26
         xUf8WxOMSweEeqEbC2/IWG6OFw65BvYxgGvWDvcQaBA0jAtXhBAWkz1JbVcvhYR+AdZi
         omiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743451374; x=1744056174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7P10jfHQT66ubzVLLxViQPcWqBsdwM6DPJ7sK0RzRU=;
        b=KbiLD7wnEGC1GRe76l8WV155fW0bfrF88SAiYfNBV+PuyFTgkiECJQstkgdnz7Ukkz
         6jBy8OFCAnN6K0Qj8dUPYXf+njg+L6nTqV3580THHQlNw+zAmGbLgO0MQ/kiZa7NWDWJ
         /hwuvGRaOmtZ66fCTL5EUar8jL8Er1se8SVA0ns/EU2LNVUUcE178VP2J3wFtUxMwGib
         geTnjzDp00TIKRVINvtSBTlh+t5iYP0gxpJR7rkTLb6rKF5Y3d4gOOezgNUqhZhK5KPB
         7xGRPn/wNdaKep5U0Qd1LeMYURwmupTa1IYh4IuEu5O8rLlzitRPNyjUm7MxG4DE12vF
         FVhQ==
X-Gm-Message-State: AOJu0YyqENybSOTJKFWFHeJEAsP1AhIeJKsAFMqt0NwY6jL1+90zVj0e
	MnB7GZhEUirEny2IFVW5siJCONfY9su5a1lVQbgQl4PcJMVW0agf4iTw3Q==
X-Gm-Gg: ASbGncvSkqNS1BHzsNZY1FkBXAHrlquE2wcEU0mE9nWP0HGhAgbA9EFVPJPAt88mm3P
	yw5U0QxO1nUKqnNKGC7+qpUYbOMMGr9rq+mMSftnqpTVk/JuLgt8AckJLxd2dfKXQbipZbBHQYe
	GZxBToyKvBr1eZGdmtdLRZbc8UpshNOyFRXyerIm9eQgA4EGGwt1FQubxt+yfSe+/yB6Y3nVFn/
	MkLVU2R/oQ41gottWxRttuL2gPPpdS8VM9qikis/JI+wLTEaMi/wHNw8fe+Zd2+wkcNJFtMUSpe
	HiVet48aO0k+PBu4hyQfznTQbed6bOrtMEyhHFyiejGpAzdlwVfWmVI=
X-Google-Smtp-Source: AGHT+IF7QDTLs304tPvv3tIUmeHlRvTfieMwlUm87fX3v6WVMn6ZWzXa7ZcLbtsBNtx34Qkvze8bmw==
X-Received: by 2002:a05:600c:34ce:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-43dabe235b5mr109232055e9.0.1743451373939;
        Mon, 31 Mar 2025 13:02:53 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d8fba4979sm134549705e9.7.2025.03.31.13.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 13:02:53 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-spec@vger.kernel.org
Subject: [PATCH] Add display-controller to list of generic node names
Date: Mon, 31 Mar 2025 22:02:24 +0200
Message-ID: <20250331200224.41184-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device-tree specification does not present a generic node name for
hardware compositors.  Several names are used, but 'display-controller'
is the most straight-forward name to describe such device.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 source/chapter2-devicetree-basics.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devicetree-basics.rst
index bc9b2d4..7658b19 100644
--- a/source/chapter2-devicetree-basics.rst
+++ b/source/chapter2-devicetree-basics.rst
@@ -221,6 +221,7 @@ name should be one of the following choices:
    * crypto
    * disk
    * display
+   * display-controller
    * dma-controller
    * dsi
    * dsp
-- 
2.49.0

