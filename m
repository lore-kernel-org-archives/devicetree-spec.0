Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4EB384229
	for <devicetree-spec@vger.kernel.org>; Thu, 19 Mar 2026 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934077; cv=none; b=O0quZ2xwEd0E4nQus4uE+oMqLlCPZIV6yRPcH2khcuclKhlkCg0Oar5DeAFym3jRdWCgHzn0R1VvBMgFA9kJ5AW5eGgIMCfqoSFeyGetfY3U+DmejlUfhs8TLRvf4obUBl/t3hfNWQ7WXtQ01HiuazHl5ZrkxIEDVptV+ahxk0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934077; c=relaxed/simple;
	bh=I4bztdTb8gXlaI7VcQmQpjVmINoyagCdqq4UGz7t9ZA=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=ePNeLOvpKbY/6bby7yRkig72KZIlMunNX8ndnBYra1zRkdyxAeyc4aSTFCmwssDoJparr8IiZpoV7kDAAfFKxX2DDV8sybFmzI91y5DK6y2UiCNiPdhUdzRMlZTKhI8Gp6MFSaz38YFZH6TJkEUb+hLUnOzLs4DHyn2v039u93s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+luREIE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+luREIE"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fda2a389so2650015e9.1
        for <devicetree-spec@vger.kernel.org>; Thu, 19 Mar 2026 08:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773934074; x=1774538874; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I4bztdTb8gXlaI7VcQmQpjVmINoyagCdqq4UGz7t9ZA=;
        b=m+luREIEqkYmD/LBNsUCTzeqrQ+lgux/jWrX1iDAtrWbK2libsHo+lSuPByoj+WeKX
         8u1/9LGEsWuNnhr1EyQvs6f5BckPQQF4WQTItEkAn5OFqcNgIDTOIxfbSuagGIigul7M
         Ay4oIeIMl8SGcAWn3LEyDRPKiCPHw5TZOV4QahZpsvErnVNorDpYoA4Lk6Yvtmnz+BQA
         vY4dV4xIhwIVpcCgGNE3g3BIt1TZBHKErq+cGjsMUox0jyChdVo6z3tUCpfAcuMA69Bn
         QQtlLNPhp0lj8oOpHcEG6rJcZpIkbho+ynb/+LRh45ald4wec/6CePldvx739RE+nJsb
         LYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773934074; x=1774538874;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I4bztdTb8gXlaI7VcQmQpjVmINoyagCdqq4UGz7t9ZA=;
        b=BsVRSjm14KHup0v9QIJj2y7HpjLMKGh7k/9Bh6DUVyjnMbz23vuZXMBDsYe9xTS7kk
         ytcqX71V2R8GSmzLfufgSSSb5Q0P4Uq0UXWh5K6aANnmNahzT28Yo+w+B6UASpzRSBWJ
         5ITTcQmxDP6NaWJ32wVrz6CWzktK8QsT2xpc0VavgWDKAWYTmov1UJAOMN2UjqrI5WOE
         mR0msyEDx9x4ot2MaDsCQ8DWjDUN2nlgaHYFmFTbcfrin0ngTjFHLwyTU8DtSMcIBK/p
         GQgho+u6Y+Kfb7K0hCVx1zTRUyjq4DHzwPp8ViVNCYuOIfPD0kmGgTLXi6ALGqDk036k
         fKzg==
X-Gm-Message-State: AOJu0YxDdy/d2tG6FLqou/PWEtuxAeUh4QQA6VWAsE88jzRaAaOLlThK
	LP9s7H4iWzfpeYLfftZ/ZyCjw+AWWzs+JM1AgeYz8jXQf3PAyV/RtqM/EkMf9Q==
X-Gm-Gg: ATEYQzz/2+LLRB7ve2ni3ZEXjw1PagW/mObhYTZiPDj5fUrIl34iI1WoUIzDM3PBoqc
	0CXljNKhh7J+J7BK/XxQJ4AVXjXOtCMOouSGBtOFiCNfTr1vFn/qzsjXFyPox71SWKFVLaVCeVz
	E/5k/3nJxJ2G8oTC+M+iQ7ccrtzh86VkYKwlGR7dl1rhluMqT621Ao4CehQUvyx93JVRShD7Nfc
	6aiSmryIqxZSy7DuMPRgr9e+bVyTPM9RpY3mBOf5qnsMaFQjhKw8YCya1Dk7KOLut4kix9uc5JK
	ebA/tHHz2jCYohOuaHbcGlgysAOp29CObx0nc9fwzmA6QUTDD3qYivqEEThnhovY8hdWc9I02Q0
	QXzWGW92ICZZjnYGpCU6+L18sMv2HGQYyuZ/aZU2lkJrI1ufBTm0ZLQj8MYwUCG96egjuuUWI1K
	TniCevTqEMK1ZUJ2TvPv+ozRSPrMp/abjRSb8/mLXXz1g=
X-Received: by 2002:a05:600c:a4f:b0:485:9a50:3384 with SMTP id 5b1f17b1804b1-486f4476ccbmr134945015e9.25.1773934074097;
        Thu, 19 Mar 2026 08:27:54 -0700 (PDT)
Received: from vitor-nb.Home (dsl-79-41.bl27.telepac.pt. [176.79.79.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fd9845a2sm32088315e9.6.2026.03.19.08.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:27:53 -0700 (PDT)
Message-ID: <88456d17c91737cfc09af46673b49bb9a9d36dc0.camel@gmail.com>
Subject: reserved-memory: node naming - generic name vs binding
 recommendation
From: Vitor Soares <ivitro@gmail.com>
To: devicetree-spec@vger.kernel.org
Cc: conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org
Date: Thu, 19 Mar 2026 15:27:52 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

I have a question about node naming conventions for static reserved-memory
allocations.

The reserved-memory.yaml binding recommends that node names reflect the pur=
pose
of the node (e.g. "framebuffer" or "dma-pool"). The base Devicetree
Specification (section 2.2.1) on the other hand recommends using generic na=
mes
from its suggested list, which includes "memory", implying a "memory@<addr>=
"
form.

For nodes with a static allocation, is the binding's guidance to use purpos=
e-
reflecting names the recommendation, taking precedence over the base spec's
generic "memory@" convention?

Any clarification on which convention should take precedence here would be
appreciated.

Thanks
Vitor Soares
