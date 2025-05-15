Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D229828EA46
	for <devicetree-spec@vger.kernel.org>; Thu, 15 May 2025 09:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299930; cv=none; b=jH6yld84b7Y1gRgyvMZ1L6xT0BDyQEG2U8pMObVDPoT50bgpytLfaYVw8MQjInRnzR6tcAk4cxrN49ZQ3Vw8MAAGiJgQcVjWIJJ+Q2iVXfpjdD9MSS/dlp1Y9tUWUJw2EpKo8tnPUupjrcYArHq3wc4cokU9ZhAVAKejxqgv1aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299930; c=relaxed/simple;
	bh=d/o7Mz3sAp8md6UzDFd0xwUYBNcPpwQbc3zYFVW6fsk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aqg6fKuNE8GbyBaQWkV6pIugQnrMq3I2+LfURbT/P4GZ4d+DEA5qCKHFEIWka0NbWVbl7H+i8rR23KSEHlbrdlkm4A1Ic6tYBUyP30i1L8ozRQ/PXngbPAgmeoibAmCo2pTWkP8oEh2ZNEtdj7KLCw7UMZn0qbZ8I2gViI0EMRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6h6YO9k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6h6YO9k"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKqphI025440
	for <devicetree-spec@vger.kernel.org>; Thu, 15 May 2025 09:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0YoUGwDFzZJBnV+f8ZJ21xbDmwwcBNjqe86
	lZSuKbew=; b=A6h6YO9kEG6PFhPqn2UQS2MlPIOgGgIfWURMZNbMDsJsPMwakAn
	mkR61avif1PXE9zNA5Vzxoutz8Z02s+s5e+jiU31h5uxy4Yt1UosK8eQiH+4MioX
	mdvtQ98XnglIhU+IMIvl7EDxs3tJPdQGXhxbEvXRKv4cGQcio1zfiH01mtdBWqzI
	U9bbp5GYcnx+uadWFmdPNnjwrgAETPeylWgaRRCRw/xX+bufy79Y0uyxoiEOmq2l
	qsd6A9zZUtsBpjc+KPZ7do9rnXr513czMaw/h54ksch9wBGKyjkalZraSgyIPG/Y
	cc4D1upxYxUQugHvLKcSAoUEERl8mxFywyg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew5g63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <devicetree-spec@vger.kernel.org>; Thu, 15 May 2025 09:05:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73dcce02a5cso527947b3a.0
        for <devicetree-spec@vger.kernel.org>; Thu, 15 May 2025 02:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299926; x=1747904726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YoUGwDFzZJBnV+f8ZJ21xbDmwwcBNjqe86lZSuKbew=;
        b=ou5jX318NsV7YgtrRpXv7xLGUbxXCTGcIyhAbFqOJ+KyyXJVVGikPBSmciEo8vWtnG
         XM/UXt8YdcWJNtLyXGeCiCjwxfgKmm5DdlDaxE4I4KUhF4QO0f1zT9JW1xNW3yJnMF1F
         BSkk0OTcTplsjwbMLyV62fdm4+vxeTzm9tHVv8/a6T6Pj55EbPcUrdI4ynhG2K99xLnf
         5MBkkWO1oz8Uko9u7vI5vu/9uNVKsknQeh0ZO0y9eArbqr7D1gKIjMaouoGWLgOFtpYG
         NRgj1aQ9wBj08cfadI468twL69YYgyweWGRHRmPv+/r0MS69pSyT1AJN23nRW/iNJuz6
         aiiw==
X-Forwarded-Encrypted: i=1; AJvYcCVZa6rRfPOE/JDUOI1ijhGcZgOXRK3TdhVMFk+P2EC2z3zAxbLObTg5/LY2h5JbVm1Po/NOkn9+mcDGkIWQ8gM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRjvvqUo18eJ217WOCOM/Ui2QEe6oLMrj807w46kyb8gc+e6EQ
	Xh58fC3A7u6N3j+urwxkonfHbA80nbpiG+1aRlRfc7Odsehz4ZLJHjxzODFyTVbKorJJ9180unl
	l0TVnYUzJxoRt6JnKRUjCPG8pgMWRKoYXaK5POD/3yUGBO1fdD0SCX/Ntwfp4VK38Zlc=
X-Gm-Gg: ASbGncu3ySXbPf6II/XbTBpczZ5B49Avk5KoYG4zwpEzh7RcYRry/9P5pkCZ83Q63Ct
	IwCE3QmGaf2rYj/y5bR19UNAjJYWEC7zH35oqv+aHns7IbQdMCtgMky0iylQscni8ycUOgFuWLF
	iBvFJjnYIJ/x4XQhpcty9ZCJ102QiVqJNTmKFSwMXOpbBfL+f8joIwC0AnhUvbpdlAiFza3AECf
	OUEfHEkTG711wiNxdhNPeiMUpP9QA2ed7qjfD5Qp+aUrgyRNLbUvgYClEILVN46xT9yYUxGb7QS
	e9njaMn7KYss5P8DaJhudh4BtyTDj/Sq8mpsa4lyMRabZMU=
X-Received: by 2002:a05:6a00:b4c:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-742984c25damr2428818b3a.4.1747299926117;
        Thu, 15 May 2025 02:05:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCFMufWAFO9NdsfiHbNKngrTVhvlxFVYN/2LnoJXLvaE75D+Kk58BJpsD/u0hFFioSfscu5Q==
X-Received: by 2002:a05:6a00:b4c:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-742984c25damr2428776b3a.4.1747299925720;
        Thu, 15 May 2025 02:05:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742944e32a0sm1378000b3a.20.2025.05.15.02.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 02:05:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
        manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        sherry.sun@nxp.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH] schemas: PCI: Add standard PCIe WAKE# signal
Date: Thu, 15 May 2025 14:35:17 +0530
Message-Id: <20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: teZCEKstB_XW5o5A_fivfp_HppJP7AAO
X-Proofpoint-ORIG-GUID: teZCEKstB_XW5o5A_fivfp_HppJP7AAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA4NyBTYWx0ZWRfXzlFk/6nVNTc5
 3rIcuQ3ZN8XS21kQ3QFUuoHifEWlHdN0Frr70ZxQzl5FprgzT82iH5WlcT1nyq+aAZqUYCcrxle
 LpAaCRheIKpB8fj1gnc1zNuTDJnfRuM+D+Q6FeZI/XuK2rjDBDitYy1tBgGSTMqlooJdGHqayAM
 kPhRZ1EGYQ6It6374HYOQgCmD/mOY+r13M70w6UTHPNik2UROlCzxfdwqVnDOf1e8gXbi8bIkbG
 UlxEqaco6nKflpfRDlyMlNGhVOGF0YIZBKw/Ec/JTCH1MjT4ECXAC3sCOPkyF05OtmFk67OjjHW
 ATRDDUCFfxwbT8g1vZhTRGxlM/qWBaZQFcngzdcdEZyKTJpifz8yJh76K8am6+w44wMF7P9yoDb
 /ADqGRBPEqAF5y7mjvGguXcIUjaj8T4hOov3/EJ7tolrrXaNBhBzlOBsce0RWGI42lGfGaav
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6825ae57 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=aeoR8HoxK4P27VDVSowA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_04,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=894 impostorscore=0 bulkscore=0
 clxscore=1011 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150087

As per PCIe spec 6, sec 5.3.3.2 document PCI standard WAKE# signal,
which is used to re-establish power and reference clocks to the
components within its domain.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 dtschema/schemas/pci/pci-bus-common.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/dtschema/schemas/pci/pci-bus-common.yaml b/dtschema/schemas/pci/pci-bus-common.yaml
index ca97a00..a39fafc 100644
--- a/dtschema/schemas/pci/pci-bus-common.yaml
+++ b/dtschema/schemas/pci/pci-bus-common.yaml
@@ -142,6 +142,10 @@ properties:
     description: GPIO controlled connection to PERST# signal
     maxItems: 1
 
+  wake-gpios:
+    description: GPIO controlled connection to WAKE# signal
+    maxItems: 1
+
   slot-power-limit-milliwatt:
     description:
       If present, specifies slot power limit in milliwatts.
-- 
2.34.1

