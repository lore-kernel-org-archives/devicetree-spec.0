Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032F221ADD4
	for <devicetree-spec@vger.kernel.org>; Fri, 24 Jan 2025 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737713463; cv=none; b=aZ3G3E8sV638WKYZiNS4GQFQBAB5X+7agx28iLbExE6Nche1RI6rkrpVw/IZwxZh9K3imuQIuuMgzmGBLGla+O9VcE2pSgMzty/wXejwdwhcry+3PG9Jzb5qEgwNRFPSj7BbMoeFJlCbkQBfpJ54vkDvHlWmNHi4b8D0+hUN/o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737713463; c=relaxed/simple;
	bh=Fk5tEvSGj966u5MNAJ6KeljaVlxKuCrisn/aqCxdhBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lTtgZPMPob7WkDRHVDqAJyLNjMiiTdpFQ5QgkukVR7KZSidPkv/fXjE4UEzapdj5PbaBdGCltGj4P8UTjMNeZIPoR/5TsgZ3AKsgZea/vp7uNoKnO9unBDPbKdajaVd//okSuK8cig7nnvyH3GpppgWkI/g1sJ4yK4LrV+32Kx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FVlqwrG8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FVlqwrG8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O8CZXo013970
	for <devicetree-spec@vger.kernel.org>; Fri, 24 Jan 2025 10:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uBFsWeSYOmq
	gaCuFxuf/xhhEESZ518ip0a8YRr+64yE=; b=FVlqwrG8kWkeOwjHm9xKD+PcQG9
	fw4csyL8n+BKPWeO3L9hkJxkGu1Id58THTwtWf7wt9eZvvRiDQt7Suq/HumcQXOE
	ULoVPw7DXNnxI7kT6jyb0IniKSdh3qp9NZvpu1ER/dM5uxYIqXjCqD1koLulzQIm
	gHLv+Fde3fjDbB1yHgTpqjCFrzMICjavnPUwCdIMdvTaZPNMeOcQ9ChVIJ3oZDbR
	CYxRfirfpo8I8YMKEntEXOYmgyn2ndtHboJetU0QgkdAcxW73NlxaAYjwcIKxzdN
	v7SRa0kcHeLTgZQaIg49ciozSc7OgGIBxzjm6hXhUkxfk26aEy9LfznZexg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c75bgavt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <devicetree-spec@vger.kernel.org>; Fri, 24 Jan 2025 10:10:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21640607349so47595965ad.0
        for <devicetree-spec@vger.kernel.org>; Fri, 24 Jan 2025 02:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737713453; x=1738318253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBFsWeSYOmqgaCuFxuf/xhhEESZ518ip0a8YRr+64yE=;
        b=QhkyGEwDmzASgwLEnVCMM4UqdFwsAUenuzfxIjihrA5YqBdll1KQO076axImuN3fZQ
         oDghBk9edwt6by/sIv3F4ZB3uChBC+Gy4lzqio9rtam1UA1RtDxJblJKko/UGBIMlVCg
         slj8sG640vJOUCJ9z2RhPJJ2vk1381hCGAm2sah9rz35N2+FqvpzzRVFcHJF9E25xo20
         FtU6SK2JzfnAjhXxYX/0J9Bp1J5Z3n2ie8UbDBN2N7aay+AEr2n0QuRUOrzoW6vV0Kgw
         S6dG8Y6ttOt42zGWauG6cN2aAEMA5qCBkIMh3PkLUBmOS4UFjbeCFDWoEnaBfn1RPm0i
         75Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWJqi2tT/3OfWayG4mroNTsBYVCt9Z1yHgWJLsTvch3x3UxVlXW34kgqTZLGH1IIjj1S4Y0b0vSnmOJWaHF/VM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVIqllWNRNEg5wfDeAkdcFbjmvAMcFGvnL+Q7JvQ8L/OmysZ6b
	tcpR05vKLcZaxQ0zk6zWi7n9MvuHAZ215jeA4Qq9SVz2agOQGvQ7RYA4q34W/5yggvE4aa9+wK/
	Eeg5fqOR8+R7WZDi3buEFd9QwutAXD4OU4QoHzeuaw3b/gwjlaIy3DsiIvBZFwAXkVdI=
X-Gm-Gg: ASbGncsx7lCTUBhk28pzDgy6tH0dQznmjPUfFMMbes1YasL8MN3lJ/M6KM56KH1j/rH
	89jkRWA78KwfFx7FEMY6BWmoOBr7HuRQJjgzvPyY4GJfWKNnrkCBCkadfp2nosNpI66A4nKCrXL
	bgXhS7Wxv/AM3ubvHCs8sPz8MeCyvc6+7EBo5lmYzbrvNbjg+cfH4n2TcpHtK/JuhBlr6kD+9AX
	1OpPve0+73GyAZ9y3ni+dqFmeC1aRLGkPoF3yt9HG/VMOliDjYTi1xQ4ZkKrjBxkzqL3sfFuXVM
	eCrDb3wUJt8YT3JMqbywdb8K3BJbUQ==
X-Received: by 2002:a17:902:da82:b0:215:f1c2:fcc4 with SMTP id d9443c01a7336-21c3560f672mr436882875ad.41.1737713453671;
        Fri, 24 Jan 2025 02:10:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/nEpZtyW54k6KlPky+UJchioawmSuyEs/SdUstEm5FKB1Ac0u4oF2S05Nb02C99nATcAMAQ==
X-Received: by 2002:a17:902:da82:b0:215:f1c2:fcc4 with SMTP id d9443c01a7336-21c3560f672mr436882485ad.41.1737713453326;
        Fri, 24 Jan 2025 02:10:53 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141dacsm12773825ad.133.2025.01.24.02.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:10:53 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
        manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH V2 1/2] schemas: pci: bridge: Document PCI L0s & L1 entry delay
Date: Fri, 24 Jan 2025 15:40:37 +0530
Message-Id: <20250124101038.3871768-2-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124101038.3871768-1-krishna.chundru@oss.qualcomm.com>
References: <20250124101038.3871768-1-krishna.chundru@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e2TdsZ9jj2rr2-0-3IjKtssBcXJH1wNd
X-Proofpoint-ORIG-GUID: e2TdsZ9jj2rr2-0-3IjKtssBcXJH1wNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240073

Some controllers and endpoints provide provision to program the entry
delays of L0s & L1 which will allow the link to enter L0s & L1 more
aggressively to save power.

These values needs to be programmed before link training.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 dtschema/schemas/pci/pci-bus-common.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/dtschema/schemas/pci/pci-bus-common.yaml b/dtschema/schemas/pci/pci-bus-common.yaml
index 94b648f..a9309af 100644
--- a/dtschema/schemas/pci/pci-bus-common.yaml
+++ b/dtschema/schemas/pci/pci-bus-common.yaml
@@ -150,6 +150,12 @@ properties:
     description: Disables ASPM L0s capability
     type: boolean
 
+  aspm-l0s-entry-delay-ns:
+    description: ASPM L0s entry delay
+
+  aspm-l1-entry-delay-ns:
+    description: ASPM L1 entry delay
+
   vpcie12v-supply:
     description: 12v regulator phandle for the slot
 
-- 
2.34.1

