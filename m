Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4CB1EEA29
	for <devicetree-spec@vger.kernel.org>; Tue,  4 Feb 2025 17:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738689903; cv=none; b=s5qfSp7kxxAbUGpb3QRlfGnXm5t/V60eL4M+5PePTbsDkAxxfKo1EKom4CsYU5lf0ZznthrUmisG9NLjf9ui1pC8krLnwncuYdDPP/gaxdFi3don+gOMF9FYpaydmlMw0Os99buDrTXAQWeR9aALXc6Z4y43D88nWLLDMVyqj/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738689903; c=relaxed/simple;
	bh=6poAm+Uw7egRJUOkCquhyPNUppZ1O7m0LT076Jg6Yig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djW39SxGZmiWzBzUsWuXC7NceSHegZz3ONw2dVnHPYFf5fN4WOHRn78VkCMR7FHBj4UxfFLgI1O8C3y2D9Ch2e3wmZiOkKm8YbW3CZfH9XGusCSZqxLszKYOIosbEZyivy8wxC6ppFptoBp9w/VN562Q44AtJjfUi3z80/QvOLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=J/oOBhr/; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="J/oOBhr/"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-215770613dbso80476935ad.2
        for <devicetree-spec@vger.kernel.org>; Tue, 04 Feb 2025 09:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1738689901; x=1739294701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKOTZL1sOr0SgWDFMwGbDKo70tabpDlbbDHjwPW+2jA=;
        b=J/oOBhr/2QmXRy0uonB8a1nSQki/mD5XIf1h5UBrdVN0C/YoQvn8qRDx8bWqznAVAn
         e4blBOjg+dwKvbkB9MliSj5QG1b8ygRjFCx4j6puQ1YfSVyy/FzrN/aOSouNCMxmzrnA
         KL+Cd3iIK5XO3MdA6JF5RmcBoAdJvQ1toRZe2OO85004/21Dpubf/hnwhaXlGrTGB/sP
         S8E8+IwAg3rT8Yp4yL9Jx8sX5JYx9aGweU1V/jnI94s4fdCGjsj4zK6jxtn2jKV7UI3I
         OoZgonGn4tzG3hhXUrx66ylGrXNMSad7gQsb/kQKYFQurmR7hUbOE+KJtenqzdicMVYL
         5Vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738689901; x=1739294701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKOTZL1sOr0SgWDFMwGbDKo70tabpDlbbDHjwPW+2jA=;
        b=S7I9nPkswNTFb+yCRYAITbVAxqLF03G0Wwfj4HMaOQf0xr/crnUL3MeCoFG0O0bbOg
         V0huBwlXxDoUtevP+6GGq1LKDdB0RJsLp+RbmjCXT01rsC4C96SabPZIJPNhcXfoQvnk
         YLSqScL3aOSnLcT4vw7RYSjTZqIiEdCrxLiNNFiyKnzU6up/te5EKDOFQhdiQ0zfvyVu
         NwmD5Mx8itDTX55rqb/2j4GP9fzxWYBTrX1Fs4FX0C+HCvJicnBmGwAjdbu+InE5tFGO
         BXT6gwJ6Yq4pVZOvzGUAWdSzRb6Wyyw9w+m8iNOZo1XaOMIYpcXYpdRgQibMc7sBzT/J
         7B7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaAgb3R5BWhfOUk3BzkecV2VZI5NXBcSUMQs/1zIqPu0GTm9hBDvW+P01QqCebeFaADmMQDnr4rfl2I8Zum+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl22bQP2ZBsBAcfUEYFMwwVLhUM6ZWvcJ/rrucCHA0WEGEqB12
	qZCIJUwwo10FBCHyeW0X8X4b5CdEHwFLqYHy/hsFWW0VSxjrAcWFYw7zZPGoMA==
X-Gm-Gg: ASbGncsC+dpQlLl4ZqCnvgy0lUTfLFyw9uFv6j4Owv+2/AMiURdYl+07X/KtkAcQiSu
	IWu1Jq1H+OFvCdqd6ajcY07r0pzhzrxxxXgnTPYwyzfQiw65SXCXMCpjanGTgPkvWSgawz9ytT6
	DU6QtZubljpky0DAlZX69l6fA0ndDjCSr5H2qT2NRvF199uvgQH/Wey3Y4bkmjJ1v5qZG6AfqMd
	ckpHNKRuMGgiUd30vqVX2yCbIfXKrmyArrh+IP+whHvzitC8tIttZFPnn2h5cj+scdMagUEcZD6
	re5FcpjEjMkW2nlmr1z6zV8=
X-Google-Smtp-Source: AGHT+IHkCvweOL0zOjiSXD6KIGRFd/fUTvIQGLBGrl+zP6Gj+x358XwWFe/YGck9dPmPHC5O7V/law==
X-Received: by 2002:a17:902:d48a:b0:215:8ca3:3bac with SMTP id d9443c01a7336-21dd7c66552mr421386365ad.16.1738689901150;
        Tue, 04 Feb 2025 09:25:01 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f8489aefc4sm11462888a91.12.2025.02.04.09.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 09:25:00 -0800 (PST)
Message-ID: <d5f629f5-68d0-4c41-be62-1f1acee3db64@beagleboard.org>
Date: Tue, 4 Feb 2025 22:54:52 +0530
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
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20250127162043.48552da0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> You have perfectly summarized the export-symbols goal and the benefit of
> this new feature.
>
> I am waiting for feedback from other people. I hope we will move forward
> on this topic and unblock several users (me included) stuck on this real
> issue.
>
> Thanks a lot!
>
> Best regards,
> Hervé

While working on a Patch series to the specification itself, I realized 
that I was missing some edge cases, so wanted to discuss those:

# Scope

Should export-symbols only be used to resolve the properties in parent, 
or should all other children (and their decedents) use the 
`export-symbols` for resolving phandles and path references?

For example, should the following work:


parent {

     sibling {

         led = <&gpio 0 GPIO_ACTIVE_HIGH>

     };


     export-symbols {

         gpio = <&my_gpio1>;

     };

};


This would also mean that bottoms up lookup needs to take place for all 
`export-symbols` that might be present in path to root, before using top 
level `__symbols__` or `/aliases`.


# Export symbols phandles

Can export symbols reference each other? For example is the following valid:


parent {

     export-symbols {

         shadow_gpio = <&my_gpio1>;

         gpio = <&shadow_gpio>;

     };

};


Best regards,

Ayush Singh

