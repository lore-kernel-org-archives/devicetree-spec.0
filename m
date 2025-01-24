Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156BE21ADAF
	for <devicetree-spec@vger.kernel.org>; Fri, 24 Jan 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737713459; cv=none; b=ZYqhpwX3WJ2/EGFuG/woLS+O+afJZNjgGPgw6cLS768ypFaZopsLKdiNl9B88oYf0tHkE96ZFqF6OiBXNjJ4vS5tdkmr2wpJJJTEbMfB2MdrSU1iH+q2qxnh+y1Ructccuo/Gh6yIqesYESSo+XPkcFMI9X9iflgqvVColPlKlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737713459; c=relaxed/simple;
	bh=n8LBnxrDnBbcUXm/xD+VonYiva2MgEDrR8IbQUCoyGs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=etZd6kUCiE7ypaKS+R7VLVJ9PpXU6biJcP+oIgAPw8ztOFQaq1bfSPaYJ8zFji+q+J4zamp4yu9vKRKfG7aPJZgk40LjymrS8rpRVe0Z9+9hF44Lrwgq1V8UDQbitsZKwLH005o8oulXcJQgOwlL+63Hy+YcQCNtlDHPg/dwndg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WX6Y35iC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WX6Y35iC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O5BNnr017465
	for <devicetree-spec@vger.kernel.org>; Fri, 24 Jan 2025 10:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9NBpxVg2cBMC6znT9WBrpS6Wfd6zoznAlFR
	eZfrgsW0=; b=WX6Y35iCRJ8/LvrXYDqlJCfCj7r+rLn8ReP/VSffq4OFX3SwVHe
	bq6e7BWdsF8Whxad1gXrDRpxfJAuGoGj0ASKw+cZTuhOn+/9koP/WfgbWCoi4Orn
	c/scdESldRhWS92qKXsODagUditLe6itiKubJnL4NKB9u8lj5ELhroQxzl8aQLvI
	p8H9QwYAufpbhHXHWogODApmlR+Ipnpip2wDumMcmM/gB0PdmSl8Q9qguZfYoRKt
	5vYs21/oVoqXcz/qopjm21DItjjWvpwIfWiTvNloLLuxbHpQKQLvtY9oZYfvb1fH
	1S3HJb3x/frHGtSZVMwQ50tcxX8Tei3tMeA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c4g3rqgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <devicetree-spec@vger.kernel.org>; Fri, 24 Jan 2025 10:10:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2164861e1feso39033875ad.1
        for <devicetree-spec@vger.kernel.org>; Fri, 24 Jan 2025 02:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737713449; x=1738318249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NBpxVg2cBMC6znT9WBrpS6Wfd6zoznAlFReZfrgsW0=;
        b=O/SqUxQrNwQDrLrMXem+6Tig4vSFGcacCr5egIMqINvGw4vAGjB1RbYYJDvIDXysFU
         IW8haG/d0hpE6zA2ZNc02KnkHpCNrP78c1KpYUpIMpuNhAsClLwoKiVVy4isT1oNA/yx
         p5cF78Q9nGayFNVUEK4zetH9ZQRaAkIw6NgmlfJDsmNAwUU2uyem6Zk6XmAJ8Lh3UNDh
         gjV0wm/stcyiuqxpQbwAHvzFn1DNUzWqoXv4hA4T5n8lnx7ridYt1NEQQWYnkkZ1Kgmd
         exnD2FXa8QQuGVvM5xHq2qzyE3KwXlfqFYXM6mq190pQ6gDiQqaBxGCs/bX3hvy7UeS4
         1EzA==
X-Forwarded-Encrypted: i=1; AJvYcCUke7OjTRhLCJDsJs/J+uX3E0YAKRG6ORWKFf38jsqndqofvxF+pZBaWD1B5zT8ODz2dqVSnF+hV4dLnb0YJgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdTtW0OMgwYp37w24IfUklBizRg/tsMwnoYNees1BHTRuLjEoh
	j1ho5mTyI13wfWWAGQZBVwZNbBFnrTHMgzHGy5Hus1G+PcewT3D8pNHD7GIO8P+5ipv+X8g185A
	Bj+vRQyMGWiqnvrEZgLW+UcxBgSNZb45x8YLZT3pfwjyT3ID6hwiEumnS8xCoP7PgbpU=
X-Gm-Gg: ASbGncvMpZ8AkBh/fKY5e9Vshlo2mCk/etWLwP/l4zylcIuUrSl5aRpeIyGaUDbxpO8
	1XsmKbTjkNWzDXGF9qU3LSXPByUhktZT7c4UsfpHzrMBZXb2QekkgCG4ttcdR6ES6lP4hrJ7BBi
	qR2mDzl0jymkE2IaNLG6OAgpeObz9BS8EGOXQhzw7dOtRIz9SW2E6gxXFrITcS2NifpTDLeILbg
	s9Nnm8P6Od7GkFwzNt6PnkBj71DJTD5f1r4bJUbwVRO0WWO9L755PDTHVIH/zDu3FLTwxs2xscu
	kDiwLJmp6MLkJ+Xx1KO3OMT5ZFgfEA==
X-Received: by 2002:a17:902:f601:b0:21a:82b7:feab with SMTP id d9443c01a7336-21c35594fd9mr441785685ad.33.1737713448955;
        Fri, 24 Jan 2025 02:10:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGABoegU/H7TpE+0qoZZPoBSDODBsyYLWoLVFOYvGbOKcXuJH6boH3o2G7cWF/3MfuPx8Cbvw==
X-Received: by 2002:a17:902:f601:b0:21a:82b7:feab with SMTP id d9443c01a7336-21c35594fd9mr441785265ad.33.1737713448598;
        Fri, 24 Jan 2025 02:10:48 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141dacsm12773825ad.133.2025.01.24.02.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:10:48 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
        manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH V2 0/2] schemas: pci: bridge: Document PCI L0s & L1 entry delay and N_FTS
Date: Fri, 24 Jan 2025 15:40:36 +0530
Message-Id: <20250124101038.3871768-1-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fVrQLuvGTUviEG0AKk_UUtRoUwcFV7oN
X-Proofpoint-GUID: fVrQLuvGTUviEG0AKk_UUtRoUwcFV7oN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501240073

Some controllers and endpoints provide provision to program the entry
delays of L0s & L1 which will allow the link to enter L0s & L1 more
aggressively to save power.

Per PCIe r6.0, sec 4.2.5.1, during Link training, a PCIe component
captures the N_FTS value it receives.  Per 4.2.5.6, when
transitioning the Link from L0s to L0, it must transmit N_FTS Fast
Training Sequences to enable the receiver to obtain bit and Symbol
lock.

Components may have device-specific ways to configure N_FTS values
to advertise during Link training.  Define an n_fts array with an
entry for each supported data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
changes in v2:-
- Split N_FTS & L1 and L0s entry delay in two patches (bjorn)
- Update the commit text, description (bjorn)

Krishna Chaitanya Chundru (2):
  schemas: pci: bridge: Document PCI L0s & L1 entry delay
  schemas: pci: bridge: Document PCIe N_FTS

 dtschema/schemas/pci/pci-bus-common.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.34.1

