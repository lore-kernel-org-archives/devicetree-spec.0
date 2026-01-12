Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CDD3612C5
	for <devicetree-spec@vger.kernel.org>; Mon, 12 Jan 2026 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232523; cv=none; b=uMSI0H43QaGRETFAsGT/BzjQIsKgNYQMRkj4jL7Idt5ZcXimxBnvzyj0vTL6ZT54jdjCO6GwKHUrbsWigyXvIV4YdMZZlLNv7YEFnMGPtLTfQoilumBm1mgngxqchGBBNmA78HouR5Rlin2xsz/9vCuAO7000fPrel2qGuMOyZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232523; c=relaxed/simple;
	bh=0ixE+47sZp1DnXkk6AGHLM9Dm9yYyGa9dqQnhmIhPVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJeew/61hv/1lkAby2vKPvuy13mMxWjdPoTMFYVgjxYKrVghDzimPDPHZ8KDeQJQqrdjFiwJk2xRvi/tszEhzG+PknIQJUGAQaOUZHAU3LrQW7Gg1SKaKwe31rdTwg7Khso1f2Tb3Dra3YeC9KzvoeHLU/eOdGUJBEUuY9KWE/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=jjBNwUEt; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="jjBNwUEt"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81e98a1f55eso1406404b3a.3
        for <devicetree-spec@vger.kernel.org>; Mon, 12 Jan 2026 07:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1768232519; x=1768837319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bqhlDu/L75Ix3r8QYS6oa0up7nb4YKhVtDS4khl9pXc=;
        b=jjBNwUEtRDVApahO6r5CjtaIF+SXfqv0SEksH3Px3eBXrkmHg91iP4lkJ9RQ+iLnOx
         6MYTTBJ9DrDrX1e3jzrObCgr/2Aa+rDCLGSoXAt/A8G+sTIjicVzAd07FcX6pJSpBul9
         ZRZ0POVpyIXFB0d72kmrhX7LzCFsVDys/6tcOMocczuhU0qOY2oWY89fGGI953P/XByt
         38ppsG4noFf1wjBJwITuPRcPSNgbBoUi/8aNIPVzmyLiD9S3JlmdKaZERNh/2fOdv13Z
         +60yWOPKW4aTFojPtWQl1YeYkq5WNzeG6mycI24TTKkQMk7xHzSX9OnDBIKL+df5Adwk
         OcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768232519; x=1768837319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqhlDu/L75Ix3r8QYS6oa0up7nb4YKhVtDS4khl9pXc=;
        b=lqhAMg4ADZDogJ6M8xaIJKtl33rrN7/WGjBW0iVXuntLph8UpFLDFD9E96sgnOPCen
         tUXAwWFZKCxgMhI7TOyqHPSKWuEeUh6THpnfORQcWk4q2Ay455X9ASemgIxM5aIEUYYb
         GcvPFVm4/sqv4lNa6qojah1sJb6IPBWtOBqA9TRDwwbHbK3m8mGzy21Sx/0Xy1cGs/ns
         4t8RIDHxgDnZmO/jjRtCZRoUydP8ClXx6DW0W9190VfP/qY3NtjOTigC+r09pXbhRuiD
         5KgOBQy0XZjwL42+KxP+W7Suu5KJQEIzFk3fOqMWrtHomgKOZ98EOodtq6c6B9swMcfZ
         0v+g==
X-Forwarded-Encrypted: i=1; AJvYcCVByYfwZMjZ3HfujIWns60iLs1gSKNnGYRxMJEs8P3vy8Z0reF3RR+all0ja4Q635rX1EJZcjcXtKlsvnKE4Ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRiVpFpqTYdlgEC6KT72XNnc71nMhMtz9agYag+MfSI/SD+uNW
	MxjWJLLHIUo/VUPvX/RKNP9iHa+UpEe3SZpH/ZWwbkOkKhHZRvwAJ/OJQJxq86dwjg==
X-Gm-Gg: AY/fxX7ecob7lMORGJe7ojhobEkx9BDyzGNCmOA229ST8KILsApk6A+L/Ir+EHC1HOP
	owhBL27b5dKKJ8Yxkb+56SWwctXopEJbM9LkZdoTqDtG9kj8oc0YmSFmN/jhhml56dEQPNVepQY
	RO+KwIjzE042sI4+GrELwQgc7VD38W1zN0Xd8jbL4+iJCzny7vIeZC6b9uJMbXkMI94FKcmfTiq
	HN0wHPugfogI+/9oKaK27bDuoQ3F86hKizQj5z3nSnEfppQWvaA7ALp+Altt5bByKJ7Ky6PBT9S
	SOWgN/3eedAV50e6TXHhQZkfJRETYtfRoT5foxPmkcSBruXO/IikEJnR1FmCAlKOmgqqFv3w9yX
	DenbF0nMB+exZVulwE/z3f/3Js0ZVvtc3C4uAyC9xpqOh3FB/ef8dNmZht8nCEaUj4HDQzBIpX7
	WNulOjaH5T6m7XVv/tGaKxB3GqtpyvEG9u9L4K6/zczJUu7dy9y2qdx7Sd1iw/bRxucUOwtiGV
X-Google-Smtp-Source: AGHT+IHOB4LYJU5QTAG2Ul6rg9vyz3AWxpUuvs8avyxsKiTX32XGDXkc1itlFYqjbE+2xfhlFG+XTw==
X-Received: by 2002:a05:6a00:450a:b0:81f:44f9:7c1a with SMTP id d2e1a72fcca58-81f44f98a4fmr5072782b3a.3.1768232519053;
        Mon, 12 Jan 2026 07:41:59 -0800 (PST)
Received: from ?IPV6:2401:4900:1f3f:e311:7179:901d:930c:942? ([2401:4900:1f3f:e311:7179:901d:930c:942])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f43dfd462sm5574405b3a.27.2026.01.12.07.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 07:41:58 -0800 (PST)
Message-ID: <ceaa0a9a-8d72-44c0-943d-dc212f1aa5db@beagleboard.org>
Date: Mon, 12 Jan 2026 21:11:52 +0530
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/77] fdtdump: Change FDT_PROP prob handling to ease
 future addition
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
 <20260112142009.1006236-6-herve.codina@bootlin.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20260112142009.1006236-6-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/26 7:48 PM, Herve Codina wrote:

> In order to ease future tags addition, perform operation related to
> FDT_PROP when the tag is explicitly FDT_PROP instead of relying to a
> kind of default value case.
>
> Handle the FDT_PROP tag exactly in the same way as it is done for
> other tags.
>
> No functional modification.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>   fdtdump.c | 34 ++++++++++++++++++----------------
>   1 file changed, 18 insertions(+), 16 deletions(-)
>
> diff --git a/fdtdump.c b/fdtdump.c
> index ec25edf..95a2274 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -129,23 +129,25 @@ static void dump_blob(void *blob, bool debug)
>   			continue;
>   		}
>   
> -		if (tag != FDT_PROP) {
> -			fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "", tag);
> -			break;
> +		if (tag == FDT_PROP) {
> +			sz = fdt32_to_cpu(GET_CELL(p));
> +			s = p_strings + fdt32_to_cpu(GET_CELL(p));
> +			if (version < 16 && sz >= 8)
> +				p = PALIGN(p, 8);
> +			t = p;
> +
> +			p = PALIGN(p + sz, 4);
> +
> +			dumpf("%04"PRIxPTR": string: %s\n", (uintptr_t)s - blob_off, s);
> +			dumpf("%04"PRIxPTR": value\n", (uintptr_t)t - blob_off);
> +			printf("%*s%s", depth * shift, "", s);
> +			utilfdt_print_data(t, sz);
> +			printf(";\n");
> +			continue;
>   		}
> -		sz = fdt32_to_cpu(GET_CELL(p));
> -		s = p_strings + fdt32_to_cpu(GET_CELL(p));
> -		if (version < 16 && sz >= 8)
> -			p = PALIGN(p, 8);
> -		t = p;
> -
> -		p = PALIGN(p + sz, 4);
> -
> -		dumpf("%04"PRIxPTR": string: %s\n", (uintptr_t)s - blob_off, s);
> -		dumpf("%04"PRIxPTR": value\n", (uintptr_t)t - blob_off);
> -		printf("%*s%s", depth * shift, "", s);
> -		utilfdt_print_data(t, sz);
> -		printf(";\n");
> +
> +		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "", tag);
> +		break;
>   	}
>   }
>   


This seems reasonable refactor independently from the rest of the patch 
series.


Reviewed-by: Ayush Singh <ayush@beagleboard.org>

