Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351FE209F4E
	for <devicetree-spec@vger.kernel.org>; Wed, 12 Feb 2025 11:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739358180; cv=none; b=dlBqeQqvHzLBkcONnWBXxP9/Dw0dTcbwKYx5rpzv4bIgUUx0pmG8Vl9SXjQMnRydtV4G9B0sZuREzYmK8JiwvjA8+Jxl4334ur/3HY3NF1s4nF5S+g2hxrq0iHndB3V0rAPEmMhSgvWnJczet7s2R51MMmkTpZ64U65fTN5Q8s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739358180; c=relaxed/simple;
	bh=bwU1J4888cbjx4QJ68Dl4TvvKFyOY+zo2sfoabsbsOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsDj8sMFWJRk+J/xLHVcRQWfSOReA9FJ3X7rumzHOxtF2F0wlovTYcRrWKrXDI0ouanjocc0N01RgxgGKBEmz56w51eUwvSfhsvgN3cuYSgb9UV817kj8EnbrTsx9MhCnUDuzdF0YzpaFWHtjp+imeefJbA05VkaRleD2HexdhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=xwawNQVO; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="xwawNQVO"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so10089827a91.3
        for <devicetree-spec@vger.kernel.org>; Wed, 12 Feb 2025 03:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1739358178; x=1739962978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJasLhVFU2IjCCVT9FVvfU2Ug+Ve6cOnKYibdXxS14s=;
        b=xwawNQVOoJUkG1ZCqvdx0Z6rLouJyq1iqkuJwQEN2GNWox3KUiseGYcfx4JJFqKOZp
         zK+U52/H/HW+E6XHMrxvgI0RYdRf9tXI9uf/SKXTlv1NeUueGhD18vpPrsYB2KVfzJe/
         e1flOdkmKPCAK9Y6jiZ57pZS8CKRFUmCF45iFtCM0MSUeaiLK7J1APpgglh7sDicHqox
         61Zj9PCXKj3oHw+9kkz6Cin7sMQQvnfynxTnRbJpcknhvXHMQCRq06EWB7B12MBU+bCc
         q+Yk/fxB5VMqbWcmYNxIxsb2y5eMsB2KFsS8B4MppkZZrWAQqO1RrvDZNNAAJqDJDZy9
         JaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739358178; x=1739962978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJasLhVFU2IjCCVT9FVvfU2Ug+Ve6cOnKYibdXxS14s=;
        b=nxZntSFpS2LCfefkcF5/e8dfSUiAKuGaTFWa1apUPDaNx94FtIy2Dr44JjAVKU+Vtj
         sfglFQSZmZRMg8PlKkpdviC1OdWrOY/sPuLxgY1THvdX3VNSTOwR32ws9iyg6qJUvc4J
         FB5dHJkz+K+2mFN9jx0Bm6RClCjvWruGQOsDRfArg444ncLbCCSXBxp2IReR3jQIV3cw
         hnOb7TAfbf0pp8pRDRlVZwOw5rmT3qk9k6+MmhMjpcH8omB01GEUjdAHORpaA6zLtp59
         VWq9qX+lqoK94UKs2+xHC8ZukF7c4PROZVAr3SY5tW8O9XARDLYJAoBgW5UJe94UZbLM
         7yIg==
X-Forwarded-Encrypted: i=1; AJvYcCV3GW8mzUvfqbXroPxQ4BkJ5FwgbMo8+loLT9DdPLnxeiOeOU8JNrzlACoOC6E3esZfkI//UmPlVDxa2zuxMik=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUNtx8DpcwZBSzwUxhmdqecVKVpOecz+VNuefaKYGymmA/kcG4
	E38kc1PSbc5Scz0S4qGmU6biU86h4zwDscckiun7a5EJXdJcntInFL/V6TnZGQ==
X-Gm-Gg: ASbGncvF5JqSegZNIve+j61Pn2ngE2WQvTdo63Vgx53Mhnxwo7SpOdz4jo1Wif2oCAE
	p+24z4VyUyG0hvTdz6sbHH+Neq9OZiqqCuradfynCKr2vjIIjuI2a931Zl7Gt5IB6BInNw/CTnb
	+dWex/epPZ9REzVM1kfa5O4oSZseEeYRyYRPixD4Wjmb3XVtY+iH4+w+VhUP8WWJGsN5O6fTKlK
	guymWRtjGlgY1fm6dxDpGT5CFDAnToEGo4e6WtNybRmLDvevq2rWz2gavqWWUM5wBOGKseurqYd
	Fz1j6fe2XSDh31a9GFcqodA=
X-Google-Smtp-Source: AGHT+IHly7A1EHjTi4Htw56VUZFcQi0kn1YTUK5VDBHpLoiVLEYhHy/hv2/UZc2onXLdi6Tk5w0Rqw==
X-Received: by 2002:a17:90b:2d44:b0:2ef:114d:7bf8 with SMTP id 98e67ed59e1d1-2fbf5baed84mr3600510a91.6.1739358178270;
        Wed, 12 Feb 2025 03:02:58 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d65esm110964165ad.127.2025.02.12.03.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 03:02:57 -0800 (PST)
Message-ID: <aee775ad-bcaf-44d2-8a59-ecbd897432e6@beagleboard.org>
Date: Wed, 12 Feb 2025 16:32:50 +0530
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Adding export-symbols to specification
To: Herve Codina <herve.codina@bootlin.com>
Cc: Jason Kridner <jkridner@beagleboard.org>, d-gole@ti.com,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree-spec@vger.kernel.org
References: <024685af-4694-4c22-bf83-a04dde6e32bd@beagleboard.org>
 <20250127162043.48552da0@bootlin.com>
 <d5f629f5-68d0-4c41-be62-1f1acee3db64@beagleboard.org>
 <20250204202157.202230fe@bootlin.com>
 <e178299f-3dbd-4a33-bde8-08f28af353df@beagleboard.org>
 <20250205103204.100f4b8c@bootlin.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20250205103204.100f4b8c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/5/25 15:02, Herve Codina wrote:

> [snip]
>
> Best regards,
> Hervé


Thanks for the clarification. After thinking about it, a ghost node 
which does not appear in the tree can make it very difficult for 
debugging as well. So I think export-symbols are the way to go.


I will just send a patch series adding it to the spec since no one has 
raised any objections


Best regards,

Ayush Singh

