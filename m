Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351E67B3E1
	for <devicetree-spec@vger.kernel.org>; Thu, 13 Nov 2025 04:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763006643; cv=none; b=EC/IVxoxexj9y9+x+MnNmBjqR3gr2GgjJAZqpyevtoIEkyKBMe2M1/Z3XmkFYVjEROIRN18eLt8QOtSFLjwzICTilIWxBrs9bfX5RJz5K9ZoiSXsq/OQdZwHdPUBLuu0yJy9tCAOe9YfFH6egYM+7kTBzy8ZZd9i9qczvrg64+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763006643; c=relaxed/simple;
	bh=MUNKng4zuK+De37mxEJHBIec28nwsSOTnrrVaNWMjNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCQnMnf/eIclBAiYU8U/f3W2XyCfza14SHKQYyWKR+sw3hGBM92mmC6t2Xer0VzdN7jRTbM3gsWe96taXuH/27qiN3I5pexy0Hzkw/mazsSbL5SVQjwYB+N3GCxYXSbRnhojZycT7gnjboImfOJB7q2vTkvi9FVX8qW+ZZ1Zy1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hubZx4GB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FzLgFX9m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hubZx4GB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FzLgFX9m"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD11R2c3114059
	for <devicetree-spec@vger.kernel.org>; Thu, 13 Nov 2025 04:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPJpt5Oy7kmUT5fCIU62vIFh0Ga6M8GbNgzCpubObcg=; b=hubZx4GBqbrSTc3R
	1h4jlACAdfrSicm9jWER9qtwrtE+eBGZIC5ZHqGME3cYJ9bvtUfWvwcw2KCcVKR+
	kk6nmTs8RJP41XBlEfhrOW2xrH3rXNmyifpcBgNuIPYRcrEv4ILo2GvXxlzibOqs
	AGFJr29/LKkU88n1MpnoTakzVmC7bXxa4dqInxr4oSw0vreIBjb5twCwk9IwixJm
	40Zp7msJHAIW7pen9JwPeCP6ItaVkXEF6waS4u8HPvbpoT2wOgkRyd5Ags+DpMwH
	qrlL0AP12FbWU5EY0EuUFUkjhmCBaTiY3p7PKk7NpfZXjOUT3PIcTQh8aCz1J0Lo
	tIn/rw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw4ab83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree-spec@vger.kernel.org>; Thu, 13 Nov 2025 04:04:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29555415c09so4667095ad.0
        for <devicetree-spec@vger.kernel.org>; Wed, 12 Nov 2025 20:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763006641; x=1763611441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPJpt5Oy7kmUT5fCIU62vIFh0Ga6M8GbNgzCpubObcg=;
        b=FzLgFX9mfObaSse7bVasBloLE6FoaJujkj2/IZ6WPIcGPy7G/ir3VIXyYbMsMa9fhH
         LoTZmlE/7t979iPoQ6w+g1BYSjwvGB8NnF1QF+5gLvJa4HJlvtICM4DbiexRGAdolirT
         Ah8J7q9Jf3iUHFUzDK+RUK5MF93fByrDfsDa3uW5z7kybnREE0325UWaD7EfT5jDHjyk
         QmK0/51aSdudIemDbp+3DR8E2KiGUCo4jeYQlat9KcfERUtTX4cTr+diZDLyWB1USTAx
         VQMDQaN+HnAX7nijwcG6SdsEZ9EfYF4IKUCKhFtkJ60NhhNLq5QIo+CXPVHlGt9Or7/i
         hjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763006641; x=1763611441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPJpt5Oy7kmUT5fCIU62vIFh0Ga6M8GbNgzCpubObcg=;
        b=wnvT5I7acUopTca+E/mnQZl1tL43Wx5HU1+SjdlhXzboBJyLSnJw/inf2Q50VCSGed
         ylddGUUZbdmvB7xlBSW41VyP2G0FrAvzx6uiWqZl35xj+8G350H1q6cE7qo3488dwmsV
         T12sFTQqerdXtnYfSOp/vgpOv7nUp76OxucrvRBI8lM6j7boZLqkacAVeiAOx3fETJwq
         rm6LEixmAK62q2twwAo3HiOe4yP/n4J3abmOrIstbehUIraYvYBuXvsg5HxFe8lK9Zpt
         ed674+SGFCOSKoD+LZlaLuF2/bXcsZx7Xt2qpOcEp9fCCOGqfgne55zTkIedAM25NmMb
         acIg==
X-Forwarded-Encrypted: i=1; AJvYcCVVi3aPJS0qjSS3FFw3Ir7UfHcX4zUgZQKNoJ8+P0ZZ708eeA+r6eKQ7ggpWm311O9Gow2vw7t8NQuZhjSunDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8kSDIKW/ip1vxQ/mjHpV9rB7/osqeRBbAwradfSi167UKPRLh
	Hxk/WCHhCVGbMaTuwVEWDPU066ukLN9Rc3LfKVmL+fOVtDK2bSluitsD67mW29KfuxOsUTdedLA
	uUxANFLjLaVyx9Y071Ao8tI3ZPOs5hknDXtjmwIRmysP6iSaOb2SFoIM5A5L/ntTDEs2soho=
X-Gm-Gg: ASbGncsfbM6G3+/+ub4BkIIYdaO8S/J+g8LKelWbP7u09Xag/d9zIcbMJRbIUCrk8tE
	RuUPVrBrlxzu1Q7h+2FNNEUGGk029i45S/QAjFOmPwqZ+dsDInzrCNXSW04wSpYvRzFODcZ91pr
	fQP0i/leSpYpD2NGVm9E+rqmbk/9xblf1Urt2TeNzI86cjpbeQFEU+SYBuy7up8uM9rRe3cm6H/
	Bm2jCC2g7QtdngcKy/BQFNeUP0r2Bs/H1iIwplLPEtel05AvhS7ewXIQX858lStq1M23qhGBesi
	P2g5/+v9jBt9xT/jWdVENhlsGkNLDClTfs6oK4g89NRLCNf0AIarD8XtNgp7ytCPdBcolY+UC5y
	GNBPVK/0QQOTYQcYwsRkN1aGl7ZRHS/k=
X-Received: by 2002:a17:903:286:b0:298:8ec:9993 with SMTP id d9443c01a7336-2984edc8d47mr70965425ad.38.1763006640455;
        Wed, 12 Nov 2025 20:04:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoFRhJNw42eQuq+D0QE8iC+rBpNLW5HJcqLuc033QSYVpJfp+TOEttapJRjQnS91FE3zxN/A==
X-Received: by 2002:a17:903:286:b0:298:8ec:9993 with SMTP id d9443c01a7336-2984edc8d47mr70965115ad.38.1763006639930;
        Wed, 12 Nov 2025 20:03:59 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0c35sm7753505ad.52.2025.11.12.20.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 20:03:59 -0800 (PST)
Message-ID: <44c7b4a8-33ce-4516-81bf-349b5e555806@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 09:33:54 +0530
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] schemas: pci: Document PCIe T_POWER_ON
To: Lukas Wunner <lukas@wunner.de>
Cc: andersson@kernel.org, robh@kernel.org, manivannan.sadhasivam@linaro.org,
        krzk@kernel.org, helgaas@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com,
        conor+dt@kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
        quic_vbadigan@quicinc.com
References: <20251110112947.2071036-1-krishna.chundru@oss.qualcomm.com>
 <aRHdiYYcn2uZkLor@wunner.de>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <aRHdiYYcn2uZkLor@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cFuFvR3F0_C2kS7gNsZonFxqAubsar0X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyNCBTYWx0ZWRfX3xZQHGMQgZ0y
 ajn3XtcA1KXm/rUgutBeTU2tMKSYNApD0XysptbeTwyaeFe/XQ4/KrWY+H2B4cDiEfptGPVmt9f
 fEnfdVH/8+gy8YLRzE1XMN8Yhjq/vsi/Q/QWKp+204jNSGAeCz4dxChsQ+J0QJkrsirNPFdFTMp
 J5Kq/hO8+O+24yCsT8IfBKugcevaAXvRHa4OhQPMhAUBxYQSpHRoMfCGkjPVA0Fnh5BQ1KfVVSv
 Co88htmgflTXVGF+Nkp4VbTYIy1GB5oZ8ATaBTmgWvNm8JcXWIaxGwuPpAGpBkN2uNvmFXkxuJL
 gWHpKRxGIS8R1JCx8YsGVwUAamgzlcY992v0eL+s5EDL8twHWM0R7v6KVVO1fPHbDJ87s4/PR7g
 l16lAErabBVH7iHjn1MM6/4wc/ld9Q==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=691558b1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pqN9LwBUSSWNe87m4-kA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: cFuFvR3F0_C2kS7gNsZonFxqAubsar0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130024


On 11/10/2025 6:11 PM, Lukas Wunner wrote:
> On Mon, Nov 10, 2025 at 04:59:47PM +0530, Krishna Chaitanya Chundru wrote:
>>  From PCIe r6, sec 5.5.4 & Table 5-11 in sec 5.5.5 T_POWER_ON is the
> Please use the latest spec version as reference, i.e. PCIe r7.0.
ack.
>> minimum amount of time(in us) that each component must wait in L1.2.Exit
>> after sampling CLKREQ# asserted before actively driving the interface to
>> ensure no device is ever actively driving into an unpowered component and
>> these values are based on the components and AC coupling capacitors used
>> in the connection linking the two components.
>>
>> This property should be used to indicate the T_POWER_ON for each Root Port.
> What's the difference between this property and the Port T_POWER_ON_Scale
> and T_POWER_ON_Value in the L1 PM Substates Capabilities Register?
>
> Why do you need this in the device tree even though it's available
> in the register?

This value is same as L1 PM substates value, some controllers needs to 
update this
value before enumeration as hardware might now program this value 
correctly[1].

[1]: [PATCH] PCI: qcom: Program correct T_POWER_ON value for L1.2 exit 
timing

<https://lore.kernel.org/all/20251104-t_power_on_fux-v1-1-eb5916e47fd7@oss.qualcomm.com/>- 
Krishna Chaitanya.

> Thanks,
>
> Lukas
