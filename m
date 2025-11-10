Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B2B3112B2
	for <devicetree-spec@vger.kernel.org>; Mon, 10 Nov 2025 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780426; cv=none; b=uTeRp9hjHfwG6VVp+ggtCox+YtLEl/uG1LWvOjeRzWzllpVmgV5+4yNIBlZqC3DshLqGxdrNNUVN+0X99Uhd5l4fB4Fx81N+j3Sup15dQUOOdZA6TukMvofXQGY9hjLH0veS1oAvkvdtCrUMkvk5oTvKGEx4BYJkx8+rf6FDB+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780426; c=relaxed/simple;
	bh=sAyJEnQpOE+CyoPsEVV52oBcegXRqpcGw3Hj73SO1gM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hYbJSN1fyan8BETrYUc4aXcsXYEphx8VOIywWO+eXJWxq72ErKamx2ejynWxDT8L4cXakHhrKzKSnkn3UE3ybxRX1Cis6J7dtM+a3pyMUcFqeu/K7ctPRRtYD0g708xlewMPiabTqW1irpNaiNRilTTbLPGL1N/o3vtyx8RgLvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnIKMiJ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7/DrDrT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnIKMiJ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7/DrDrT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAAqDB62548092
	for <devicetree-spec@vger.kernel.org>; Mon, 10 Nov 2025 13:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zf5by7v/g7p+dvGHpfj+j+RRTgR0OJ9Fd2rr/ysTKL4=; b=FnIKMiJ6Agw8Bw7d
	D5l7XFqGN2+lHQ5BEbn0Fv4yo5kBF3fGxUt2j7XPo1HEj7tPwE0dJdcVtcFMsTqR
	nB5DTif6JbwYoEPpvCgCRdhnA66hmCfwRCmYKd4ww+ToVJmDCyFipto/RkoVRccF
	lYgdeyKMb7HCLa2kjMF/jzv9vtmKR772GjPLCZStXjLIoc1lJh9N0clrNKtRUtYI
	R+/6O1HIJaS94oRRCigXi8mfz/Jf5oDKU9qWfrYGwaaU7WgxKPATGra8H1kqx+51
	ZqATOwjTJi/hsTm+beLsCseKwe2j784oW8mFVWUqZ1VyschZpGpcUw9VTYUN1Oev
	9AhXGw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab8ea9j5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree-spec@vger.kernel.org>; Mon, 10 Nov 2025 13:13:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-343823be748so1663890a91.0
        for <devicetree-spec@vger.kernel.org>; Mon, 10 Nov 2025 05:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762780423; x=1763385223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zf5by7v/g7p+dvGHpfj+j+RRTgR0OJ9Fd2rr/ysTKL4=;
        b=F7/DrDrTohOcSHx8oxMgWQV7l0XZ7Svv1IGwC0DJDJgAb+qdunIhWtq5qLQC05sYGY
         GgdNoHyr36DyWyWAmhnw9BKxXThjvE3MuHnEOYA7ht+iAVAMaNN+Pc60scfGKz4Lf3h5
         N3xBZH8ZSTaAvz56Y2/4SHi+UbMf2L3TcjC3IycIGHhNmIYXHM+JutlUj6IVL+Iwuibn
         jVoEE7yoLRAABLybOHFoKuU7sMJ4hDYb2y/HHOFmAYEPa7RA5v4GZQyc6pHb+kYA/16H
         8qW7ySCSHqBMRq/KnTPNjYqZO2vyydeO+K8EVt3oDAV83uWGhWs9rMSSDhHssJPogXoS
         zYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780423; x=1763385223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zf5by7v/g7p+dvGHpfj+j+RRTgR0OJ9Fd2rr/ysTKL4=;
        b=SMIl7eSmfOnXnPWUbfj8JqZKrBw/VwxKyWuPXhnZy0fgsnC3PGvSBY/XxGcYJMKj80
         XC1HWe0/oXvNZTWSoNLi9mGapMmxuk5yFBbkXzx2Anqz0u3zLunVZj6L1o5jxjDo5Thu
         rScR38pgLmqxSQpwPItuyGjxlSWuruGp3NLyb9MF4oeNLEj6gdW2uOYoJIsP6AFa8saF
         H0W1PAppf7Q9OXp/mwDxOvE6uqfhDUL9fo46lS6/UaepZKi91vGO4oF/DADdmKAXKaia
         3vAEqF6eF+SYvq1q58st0HjbKmYntErP90VLUPE4vtPh07Yd3FdLh/94be7oht+sc/f/
         xo5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyGl0Je1MJpWYtWOOQ1M1tkqmZJXfTCOvPCUv0Khj6PjW4buAWSsdUJZAJSES2OvSESV9h0wATrgMGTXU3wgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKCBNfxNazzxhYQfuGWVnPAnObVCiYxWbhw0wSZGi653rwUvEH
	1yxSLbxoAF3/lUDwq+BHVcna9FsgIyfAungYhpho6t5bYOvmBJwFzhOP3OC8gBNHMrvKQI9JnhO
	KO5R+RAsRkiRZ8Euf/B1JF7OHStjtPtSXNIslxsIptkL5ZEHkP8p9tmmmzpEljvTXvdqiono=
X-Gm-Gg: ASbGncujys4CI7dOKCXMUiHbJOSYBr61VFJ4r1f03QnkWihWQV0Oo8MCZaMr5afIteU
	BXr+ebH1e10Mz8ETU4R6W1iWElPuzTXvjQMWxWqfpmMJvqCVOPxV+gwY4Eii/fx2LGExSZqbZyj
	KuY5Aq53DVVRtoSveGSys9CNQSLPGqeH1DeWEiEA3Wt2naB5j2KHZCZbX89l1Dj0We/2caIZz2N
	6qcVfiI2s+wkU9bBoaHN6gRRVd2SWNA4ljZBQsEYOHHT4YmuOnk9rY3jI6oRN5zQsv/2Pxs9suK
	7uv1Jebib1BOP8eaxNTX6rGywHUZ9ocYjctNlMQda1gusXwQBN7xOtNqIoQ1twMGZw+lHvpPiKa
	3VmuBmOehnF92Wwy5AoQWljsd7OdV43g=
X-Received: by 2002:a17:90a:e710:b0:340:ec3b:b587 with SMTP id 98e67ed59e1d1-3436cb7a93amr9070694a91.1.1762780422766;
        Mon, 10 Nov 2025 05:13:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpxzKYemCJDBtZNVtT/gk1VWfrU0u+FC6zzifoWeyFyq0P4Hf5egp7j8ghzn6uNZubwpXZ1w==
X-Received: by 2002:a17:90a:e710:b0:340:ec3b:b587 with SMTP id 98e67ed59e1d1-3436cb7a93amr9070654a91.1.1762780422139;
        Mon, 10 Nov 2025 05:13:42 -0800 (PST)
Received: from [192.168.29.63] ([49.43.224.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17a688sm12007008b3a.40.2025.11.10.05.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:13:41 -0800 (PST)
Message-ID: <511ebf46-63ed-45af-9d66-ccd1d944763a@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 18:43:34 +0530
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] schemas: pci: Document PCIe T_POWER_ON
To: andersson@kernel.org, robh@kernel.org, manivannan.sadhasivam@linaro.org,
        krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com
References: <20251110112550.2070659-1-krishna.chundru@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20251110112550.2070659-1-krishna.chundru@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G9wRO0SR1jsJOSdDV4kA1IIzFQrO3SpM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNSBTYWx0ZWRfX85uzjudHU1rD
 V95T1v2BxZj37VrfB9o4uraUzU1vGSs5Ibhpyq0QDxE0PinAS3f/23IhlfmojPz2LON2rhAo2aQ
 prm07rlcYcllVHSCC//2Y9hXypY/tDKage6Q7BeMx/MqoGZNx0VpUf8cJaU2uT1zYy/gbn70kdH
 ylPR1IfsDgBsXZ8Dx7995BzAB31W1MAV7Y2KoL4+A+J9+7CKG+5C7Metv6kh6QpPrXSOwzhTOmI
 v6s95D7t/4RtRtk3V69mzPZQzXo0nXtFjx5ivwm5dx7xmERLgGBZpIOZD16eUSiTJ3CqA3IP5/6
 mDVWUzqDfTybfOuBDWK5HcZiTdOIoWZS42Lpnke/bNz8duvGuvFvtkuTKEmOxB2rmkUdqgKWHvZ
 tf3/mr7F4G8s7eyAGEJqd+sFrelOmg==
X-Proofpoint-ORIG-GUID: G9wRO0SR1jsJOSdDV4kA1IIzFQrO3SpM
X-Authority-Analysis: v=2.4 cv=QLxlhwLL c=1 sm=1 tr=0 ts=6911e507 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=08Rv9HEMxtlCNW7Dos5SIA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SpA6wshyjLPcRYPzmHsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100115

Please ignore this patch, it has some mistakes which I have sent 
accidentally.

- Krishna Chaitanya.

On 11/10/2025 4:55 PM, Krishna Chaitanya Chundru wrote:
>  From PCIe r6, sec 5.5.4 & Table 5-11 in sec 5.5.5 T_POWER_ON is the
> minimum amount of time(in us) that each component must wait in L1.2.Exit
> after sampling CLKREQ# asserted before actively driving the interface to
> ensure no device is ever actively driving into an unpowered component and
> these values are based on the components and AC coupling capacitors used
> in the connection linking the two components.
>
> This property should be used to indicate the T_POWER_ON for each Root Port.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in V1:
> - Updated the commit text (Mani).
>
>   dtschema/schemas/pci/pci-bus-common.yaml | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/dtschema/schemas/pci/pci-bus-common.yaml b/dtschema/schemas/pci/pci-bus-common.yaml
> index 5257339..bbe5510 100644
> --- a/dtschema/schemas/pci/pci-bus-common.yaml
> +++ b/dtschema/schemas/pci/pci-bus-common.yaml
> @@ -152,6 +152,15 @@ properties:
>         This property is invalid in host bridge nodes.
>       maxItems: 1
>   
> +  t-power-on-us:
> +    description:
> +      The minimum amount of time that each component must wait in
> +      L1.2.Exit after sampling CLKREQ# asserted before actively driving
> +      the interface to ensure no device is ever actively driving into an
> +      unpowered component. This value is based on the components and AC
> +      coupling capacitors used in the connection linking the two
> +      components(PCIe r6.0, sec 5.5.4).
> +
>     supports-clkreq:
>       description:
>         If present this property specifies that CLKREQ signal routing exists from
