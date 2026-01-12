Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253A82D5C8E
	for <devicetree-spec@vger.kernel.org>; Mon, 12 Jan 2026 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229721; cv=none; b=jewbKu3R/U9ef4fifmEO+Kqz65ipfpsHhXf5eUshNLoOV54e67NpSUumm3OEh7ma+09QO4w/NGxDio7oi1dx4C5OdUuiJPyBidXjJ74rE+lNZg6D9vSxCyqVyvaTkxGE2ZuAFj1cEBux80g2G0ccFgFr0XB4nLvPvrU/ifpFNdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229721; c=relaxed/simple;
	bh=udw57NFssotqrqEj8KCqBZXIM1DX+Oq6n2i7cO+vzXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8EfE8d78LnRxutFNwEXavPctGzzIdXsIo1SysVEnjo0KQJlOWV/iW56RAJyGyV/0j2Av2ahrJWlWf/sMDgxlaWQ/TGVtLxGcMkwIT1wQ/rPBnu+XGYxSpm1Zmigd8NXaKoy2XABnajWNFhC+Gtww3vjmCUnpJy/9SESGwS0kmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=fQLVxZON; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="fQLVxZON"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a09d981507so40363975ad.1
        for <devicetree-spec@vger.kernel.org>; Mon, 12 Jan 2026 06:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1768229717; x=1768834517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCeoeD1NcujYFAQDlchiAtvGNFTdOsvTnQ6PwbSGdbo=;
        b=fQLVxZONYxMDVdpj/3G6ippit2tlMlUNxItSJKjLNhC2yp8EPMOFaTDuMQ7PvtQYR3
         r5iL0G0hErDPbnCi1MzZlz3uAtSoO1q0pmyFnQN8NyKCmxEb52kyDss+WkxFQnRHjuWa
         xhGR/Ik9bAPkNIvHFQR55exKY6om8qSpurcwfSgiJIT2BhQGzP2hSB6ndz0p6Y3+VGco
         XZSNvXTuHM7P8XSvdXkvtagh8HR/6By2lOygz2pPqanB3SKBDegJMoLLl1QlRBX1KDUO
         qlvT+14T5zbH/BaXg9/4xpjbmHreusFHhYm2YJ2bBSI8niyjLiYJr+0XeQwsWGJc28+u
         BZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229717; x=1768834517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCeoeD1NcujYFAQDlchiAtvGNFTdOsvTnQ6PwbSGdbo=;
        b=jJZMSM7rnA92xoz2mVKBDeAgDLdYUHfVZ1WKpHKan1gQSL4RVY6MxcEwo69aRvKMW/
         m6ukAW0cWUE8owpMGhPUqUHRp2qZJW9dwo7mlmEURpVKMEXeRrd3j4PGU+3/URy5Rj/G
         NDAJvp2oV8AYoNdKEgJP3qiXd+SrHwOz87CJWh7X8bdbYPs9fKOHw5i2MFV2OpC0K7LL
         osyIQ78PG/J5hid5/Q2/kkKTfsaHgSUIG8Cnn6Z+DqHmh1/B4z55dYEi6x8JdYVQmTPe
         j+wzvP3TJRcnQkPeYGd7Pm4dui7XUKL8biM8R+K6q21CADY/9vDiMaTYpj5SVx7iZwd/
         SHKg==
X-Forwarded-Encrypted: i=1; AJvYcCWXMQsCG5/T9Rl9AP/aS9cInv4tUe5jvo/7y3bgRPxNuXm2Itd1kOm7EmVG3K6hV3vS3+Qta48rVQpUOugwf68=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlptisIRRrHQ5eG5a96SzJaHXNpOn60B/+XTJ8r/nfzSYgWTyr
	wdqAnn6GD4saaEpHFbfQLV8qTesDUBB/4Ohh9r/5o4ozRzVbCTgpqgpsEqnKH9Cs0g==
X-Gm-Gg: AY/fxX52I/ua3jStQiojTRTGFzD5qxJU919RJpcHQDGjTFZUtHZV03pj6O+xRyY6/Im
	tyDTkLfaph2UC120JSR+a87+oHJW5tpHjGrMjjYlcHkxp8sEc8T1cdqAU1dtM6eIIPcP6eLdhKy
	RFgJ1Yvbb1i/FYkvpIhSpqBzMPyIVySp1IiNZ80wg2ilBOT+WPa9GW9hQLkNTqdip32j4y6p4k7
	J7+qHt0UFF0DouT33DcwxDrh4cvbhdEV8YSbbJ1D/2WlsnndQuMLB6v85DjyYg53UZDh0Ijmkio
	giotH1TH0T+8Z1Jiaqko8rKfWpdlacydHgjA0xmCpdoOrnMf+XQRIrgKRnQ6biTo6tsNdtvQ+kW
	l1FYcxN32sDPOwW/bCSEz3EwrNJQIAHCHJmuGtzd/9DMEXVuv+9EId/6wYEi8slBLC+xChUPRJy
	coWhh2OXny93wLe+7c/CLPeACaopgs0SXWl4qVlMDDbiDWYc7Rk+pGQhFxRX7qWA==
X-Google-Smtp-Source: AGHT+IFtAul1lYvdpQwZc3IOUtzJ/XS1Y7WP0i8vum43wraXPGoTXB6Ts5DFcP4wiioQIdrskbtilw==
X-Received: by 2002:a17:902:da8f:b0:2a0:c92e:a378 with SMTP id d9443c01a7336-2a3edb24516mr170956045ad.7.1768229716815;
        Mon, 12 Jan 2026 06:55:16 -0800 (PST)
Received: from ?IPV6:2401:4900:1f3f:e311:7179:901d:930c:942? ([2401:4900:1f3f:e311:7179:901d:930c:942])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8d76sm177066875ad.84.2026.01.12.06.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 06:55:16 -0800 (PST)
Message-ID: <c725c753-c3a1-461f-856f-7080eb8a97ba@beagleboard.org>
Date: Mon, 12 Jan 2026 20:25:10 +0530
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/77] checks: Use consistent type for strspn()
 returned value
To: Herve Codina <herve.codina@bootlin.com>,
 David Gibson <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
 Hui Pu <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-2-herve.codina@bootlin.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20260112142009.1006236-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/26 7:48 PM, Herve Codina wrote:

> strspn() returns a size_t value.
>
> The function is called in several places and in all places this value is
> stored in a size_t variable except in check_node_name_chars_strict().
>
> Fix the variable type used in check_node_name_chars_strict().
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>   checks.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/checks.c b/checks.c
> index 5d09216..041e565 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -324,7 +324,7 @@ ERROR(node_name_chars, check_node_name_chars, NODECHARS);
>   static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
>   					 struct node *node)
>   {
> -	int n = strspn(node->name, c->data);
> +	size_t n = strspn(node->name, c->data);
>   
>   	if (n < node->basenamelen)
>   		FAIL(c, dti, node, "Character '%c' not recommended in node name",


Reviewed-by: Ayush Singh <ayush@beagleboard.org>

