Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E86655C18
	for <devicetree-spec@vger.kernel.org>; Thu, 11 Jan 2024 19:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ErOlD/Fd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e62e6e3b0so3569335e9.2
        for <devicetree-spec@vger.kernel.org>; Thu, 11 Jan 2024 11:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705001953; x=1705606753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rgM/MwBgS6rDhoF1g+3N7R3DCK3aor9Tq9cv/lke8Jo=;
        b=ErOlD/FdO71RFsqPqt3DXt4ZDiVLWPWvTwCGIsj/dWKng/Tz+j5GE6jSNDOsf8378/
         OwMUww1t5NoibM2r1CmhbDZLN6DU5NWeXahWdFh3yhjFaBdKOXYTqy5I8JN6Fli0ww1Z
         CGEi2hfWvgQ67xBDGHsTuxdb9620MCCz4nC2X0zWppgbwdKFva4ydJ1oXXEeKVbReTTR
         DUQAi3brTi5LcWzLL2BXhclutWMLUZWatcv1p2m2vSObfKHzAklqCF0AuqXRtYaw80v+
         +hgUJ5olAaBoU9KPEenZ4lsO7Ru6QuQ+R1Cxrf3O653roQaDxlnN+Mg6kkkJEFRY+yDe
         r+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705001953; x=1705606753;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgM/MwBgS6rDhoF1g+3N7R3DCK3aor9Tq9cv/lke8Jo=;
        b=SbIvpTj1tsLJXM4rQ4+fkrLiGYj+4TSMqY8DuGp2dyv46Yotn9ApN2Oldl+XvNSzpE
         +nnH/Y66ggCPWxPUoxgoWGT+wgQkVs8ClNxLxlYOn2gqdUmkQE/1doAj21LBdELnpFtE
         AwF7LuDo8zaSZkhCVonuo+L9n3E9tBsggtGQbNnA+cVlTJpxToMQF4goVx1d60omrs5L
         A+FzU0n+ftyf1PS/cbMmMp68qSgFMsFm1Wo4oc1uOlcgzigXz9hwN0YBdU2hd5n1mepN
         FTO1O0Y7vgj2RzsSvqIWhrfZoW0ofuD9J9hHVU4NP9ZwxRLGkWwSW7/bO/5TYVnZPDDQ
         XySQ==
X-Gm-Message-State: AOJu0Yymg/NPp5nWV5lUdPj4rZJJoPEW6rlCVrEXbSxkAqWdh4LlHzH1
	7eln6UYg6yXOMx+LvcWiwlkZ10YwELA6tA==
X-Google-Smtp-Source: AGHT+IHmJaGykVjRC5T4yj6kV0xs4VVdHMXcWdmxOyaAP4e79NCvmKXITsASMZ6rfZOedjiLfoHbvQ==
X-Received: by 2002:a05:600c:6a81:b0:40e:5f74:f5af with SMTP id jl1-20020a05600c6a8100b0040e5f74f5afmr120540wmb.252.1705001953169;
        Thu, 11 Jan 2024 11:39:13 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c190800b0040d7b340e07sm3019771wmq.45.2024.01.11.11.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 11:39:12 -0800 (PST)
Message-ID: <2151938c-8ab7-421c-a3b1-9175bae2a073@linaro.org>
Date: Thu, 11 Jan 2024 20:39:09 +0100
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] schemas: Add Google Widevine initialization parameters
To: Jeffrey Kardatzke <jkardatzke@google.com>, Yi Chou <yich@chromium.org>
Cc: devicetree-spec@vger.kernel.org, Rob Herring <robh@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, Yi Chou <yich@google.com>,
 Yi-An Chen <chenyian@google.com>, Jens Wiklander
 <jens.wiklander@linaro.org>, Simon Glass <sjg@chromium.org>,
 etienne.carriere@linaro.org, Julius Werner <jwerner@chromium.org>,
 joakim.bech@linaro.org, etienne.carriere@foss.st.com
References: <CABOkjxLPvtknz4XxfjCdnjvLCpbz5OF1U+x8AgoU7RnRe95TVA@mail.gmail.com>
 <CA+ddPcN-p=cCQUcDRt-33s0=EhZkBMPRFOqULbZS3YMfeP9=Fw@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CA+ddPcN-p=cCQUcDRt-33s0=EhZkBMPRFOqULbZS3YMfeP9=Fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/01/2024 19:30, Jeffrey Kardatzke wrote:
> Can we get a review from maintainers now that we've posted this again?

I leave it for Rob. However your tone and impatience is not helping.
It's merge window. Please relax, and help out by reviewing other patches
on the mailing lists in order to relieve the burden of maintainers and
move your patches higher up the list.

Best regards,
Krzysztof

