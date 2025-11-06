Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD822E2DF2
	for <devicetree-spec@vger.kernel.org>; Thu,  6 Nov 2025 14:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762438065; cv=none; b=IxC/4JE2AUobEq8ZQgWUvdOig3oB/xtIXs0jk163Rp4FGDw8K5Z0xbbi/w5POLpq0PhACgjYBPszbmO/j5dqEcbUS8dobGzPWrvvcwT96C6Fc8btZWwERdD+JkG8wJZ118Ve8/Uqc7rBRKmfaWnldeNtN4Iee+KQ39pSVMMfA2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762438065; c=relaxed/simple;
	bh=SOccKiy5Rdbr6pq6sB0mWtUflMzLr3rVH64LwrFeOVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sy0Zj/zuvydXYwAwMjo34n9nFnvVjOeBI82Bb02rdxMp5PINHS1dDNBUyC8IxdrBBz6WY0KmPmNRskVDkIBeUWHHHIoCEh9foUHO/Dv7r+mNB/Hz4xpaKxyAmMRwqTj+3W9Nj47yGaB8uc0mSyP6ey/R5+MEqXStO2Pun7SSn7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQvZ+d5A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=crdGjc9H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQvZ+d5A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="crdGjc9H"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6Bl9V14131317
	for <devicetree-spec@vger.kernel.org>; Thu, 6 Nov 2025 14:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zlBnzVB5nxzy+Z7vwR/dqDEVVZyIcEzuFRGM+j8huts=; b=QQvZ+d5AIl179X7G
	oNgzd+fA/TENVGJ6bfTJwJZJ2yI0qR6nhARxOCIwxPl4eTZu/+OvD6EYlwjMt4mb
	0lSfkkyv7HTPsm+GAcwHINSubnm0wC9DdsNRaHJ/b7buC1badIHer5IQo0THbteL
	ZRup+VGq/Q5Uftg76iR8Ex583V3FIXh0UeKpkcF6YEKnHOAH2ZIcul8oMf9kej5E
	v7yLps1O5kXDHyZphCBXtBc6Hrpf423CHqwjkh93na6EK1hyS06PldPIkOENV0Xh
	RDA0BdingP6TbQwmPkGXi6sYApeIg7SxcqSpxDR0t0o8bloYfL18abGs39KWqXTZ
	eTS6ew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x0c2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree-spec@vger.kernel.org>; Thu, 06 Nov 2025 14:07:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3407734d98bso1507290a91.3
        for <devicetree-spec@vger.kernel.org>; Thu, 06 Nov 2025 06:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762438063; x=1763042863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zlBnzVB5nxzy+Z7vwR/dqDEVVZyIcEzuFRGM+j8huts=;
        b=crdGjc9HnTa+VhBHLl6fkq3p69JScJaWrIyXbqpGD3cikY9LhXxEeTU0RQ2iISBSxb
         w9mo21SWpmFZva0uLXopf+1pMnDluY3+s4WaYiP5+LpMkjbZZapH/wSBhOWpsbRpE/kD
         mO1Y9UYJRi1JIKYu/S9RbvoIibPxSSrnLBH7VnXXAHBZMHA/iYaxocs9xL2RUNN4g/BL
         GC/iYbwHuOeQxRr2q1Lvstgo8fMfY5H9i+je+C7KkUIZBeHg7n83L7Ydw8StETtQjRfz
         kZtP1CSbtMYUkroAlCkLvAe2lcCqLHq+af7E33ACMN779H1L5MSlKPgqHQg2t8yDQ9+S
         GDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762438063; x=1763042863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zlBnzVB5nxzy+Z7vwR/dqDEVVZyIcEzuFRGM+j8huts=;
        b=UprvmASFYnY35jGP8PtsFTFdZ3mNL3q12FQ0eaOaT3QQufenEuWMPp3C6WR0CI7Xxs
         kHzhM9pzFFgg7XC+Fr7/Pt/6whV1inGnhGjtAAhm/a0afVFdbfUEIUi3xMjjbEm1mePA
         gWLuteBS5yR1U/PVScwH6GR/7dhYW6OSwljMWqbJUD0RrnkjHVlYxxGBQRoyZ7Q4nUxs
         EVhpjLlN8QhpLnZbEDoe+wPxurxj35Xrjbu5TcAVdejnEOJIpp7m1qbDKJXCp0zxUgPw
         XM74ZaUgqsHN3UYCL4Y36eXrNIlnrvNtlA8za1w0EL/zuGz79N9ASVpFEAOfweq/7x1/
         4sGg==
X-Forwarded-Encrypted: i=1; AJvYcCUEjxLXBhTLUo476gsi5d2/sg3KC/J1Hm4x7NehCI9mdAlV/KhDrccpXINN5SWDwtI0Y8zyjMgIZGEkDuckaeY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7YYoDg+AUrRG8IfZhc65uuRP3Aej+6BKcthVfYw7jgq74TKY7
	/dE1tWASJnr7qTIiic4XtXBMqjxMVbv+ydrRFEKXkLZQB4GQGsNJ+IypV5XShhsHpB/IrDbsVsj
	7RIevfOfpK8o0Y6ZxrS38DX4l/X7LASRp1F47lWib1iGIrWWJwuYEelWVcpzVQSP0iVgBR6o=
X-Gm-Gg: ASbGncskMtIoSGe4da8/9CIcC3IvkhRsjsBWp2ALacJxPXxWt0dTSeEk8LAOJxHvJTs
	2TWSR95E7lvIgy2Ya1E+6IuBEn0sgFqF5g2COcB6W3Q+5YaLkYxa6Llg8uTlXIJd26U4TSl8UMB
	fQracUZFVbLY6QPMXW6h2B9c2zF1cqP6tVAixzxcV84M9Xlx2oLBPaxNbpZSkRnocNjcGR72MA3
	GcgOx/flN94XnKSO7Q7NccPion90fs9EcFe1rN4Ur4AT316syzI/eraUQf8R33sSRvn9+nqCrya
	Hl0otY55MuAx96Uoq6aICik18mSkzTo3tG7OZDqX+BBC7UTQ6+btnigY64XbIrNf4b28BdyXPvC
	l9JAZPHYd9go8uGzwGr/nxq6rHeL1mlRwpA==
X-Received: by 2002:a17:90b:4b83:b0:340:ff89:8b63 with SMTP id 98e67ed59e1d1-341a6dd839cmr7917826a91.22.1762438062731;
        Thu, 06 Nov 2025 06:07:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb5xADXggWF7dRNeF7sG95acRl1JztjRAlFJmaO2OvQU/vqH3pUikfwbJOHiUbUbKUov+t3Q==
X-Received: by 2002:a17:90b:4b83:b0:340:ff89:8b63 with SMTP id 98e67ed59e1d1-341a6dd839cmr7917764a91.22.1762438062062;
        Thu, 06 Nov 2025 06:07:42 -0800 (PST)
Received: from [192.168.29.63] ([49.43.224.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d0daabd1sm1131993a91.8.2025.11.06.06.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:07:41 -0800 (PST)
Message-ID: <96c49d08-10dd-4a82-a6ec-345701b771d6@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 19:37:32 +0530
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] schemas: pci: Document PCIe T_POWER_ON
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: andersson@kernel.org, robh@kernel.org, manivannan.sadhasivam@linaro.org,
        krzk@kernel.org, helgaas@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com,
        conor+dt@kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
        quic_vbadigan@quicinc.com
References: <20251106113951.844312-1-krishna.chundru@oss.qualcomm.com>
 <7v5bmbke37qy7e5qns7j7sjlcutdu53nbutgfo6tn47qkojxjy@phwcchh5gs5q>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <7v5bmbke37qy7e5qns7j7sjlcutdu53nbutgfo6tn47qkojxjy@phwcchh5gs5q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDExMiBTYWx0ZWRfXw46VMxmZWDIu
 Gwq4ejxyhBJgVramZXMv4hwYqaGrXpg05db80G6vn4/qZLC2CbnJMYY5kSC4PAtT7btrieZEjzW
 UCUAaWeHBxLRlt7BItVgxYsej+KHeRXjugzT/8Z0XDFNkC0hWvJsyIZOIvJLNZz0vjkZ1efJco6
 faQXoKDNqwJxK9r7RK8HpgbZaAu2EH3XQJLdSCBXLvSXeqVl/3g/SFD0H9pl6DObV9NCPbiTu90
 I9X7xAOheYJ71K758dB1HtSsdtjJelzikyW3pgoNJjgIP4QG9USKlTcbwOCl3Avo5OKNEICpvMi
 tE4CCi57nhKPfu7n995YFFLV7xGzsZA4qeRxjbjFNQGBSUi0UYsJzhAdYKUOelI1xkCqlHtPaW8
 WVV7vY7CCTCIo6BboxFJm8X7OAhIvg==
X-Proofpoint-ORIG-GUID: 0aQvCGkW9MoHMEyFudp9X1__QyUJdS64
X-Proofpoint-GUID: 0aQvCGkW9MoHMEyFudp9X1__QyUJdS64
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690cabaf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=1uN4TIezCBQZsvcDmGHwSQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0lSf4L86Ka8fYzTnLDIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060112


On 11/6/2025 6:08 PM, Manivannan Sadhasivam wrote:
> On Thu, Nov 06, 2025 at 05:09:51PM +0530, Krishna Chaitanya Chundru wrote:
>>  From PCIe r6, sec 5.5.4 & sec 5.5.5 T POWER_ON is the minimum amount
> T_POWER_ON
>
> You should provide reference to the Table 5-11, where T_POWER_ON is described
Actually 5.5.5 section has only table 5-11 which describes this, I will 
add the Table 5-11
reference also in next patch.
>> of time
> "(in us)"
>
>> that each component must wait in L1.2.Exit after sampling CLKREQ#
>> asserted before actively driving the interface to ensure no device is ever
>> actively driving into an unpowered component and these values are based on
>> the components and AC coupling capacitors used in the connection linking
>> the two components.
>>
>> Certain controllers may need to program this before enumeration, such
>> controllers can use this property to program it.
>>
> I'd remove this statement and just mention that this property should be used to
> indicate the T_POWER_ON for each Root Port.
ack.

- Krishna Chaitanya.
> - Mani
>
