Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F853FE4
	for <devicetree-spec@vger.kernel.org>; Sun, 16 Feb 2025 01:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739670338; cv=none; b=KyqItBU66Tw5z42f/yIcdjZflkvpk5yCY9ITYWSxr2Ozxlco5iik4DVHhRUkN/XwBOhZAlFX7Upbj94l6cR8f2QSND6VtrLuxyuQfzlJRwVQaavkwtUF5114/F/fEt+cq/R4rxn4mUD1iv12mHMSvDfxdLOSYLWx3XYeNNnF6ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739670338; c=relaxed/simple;
	bh=6d/C0OzP206Bfx6ax3rRPN3TPah22XiTEZpdfRfQaV0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s976ys9rKlp8qYKbveWhX1aHY2mcsbKKJGV/3Q6+xtNIa6AZ3/UEZwiUTVjHcyjMsDf0EYayrAgbC5idSDxlgbh9MDcbPmmCajF3hrBIRj3BPM61s4DelQdC8e3gPNvk15N0UpHwpVFluliuNtL+/y6kyxArmT2uwFx1vxeLx1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFBbSwP+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFBbSwP+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51G0e412022478
	for <devicetree-spec@vger.kernel.org>; Sun, 16 Feb 2025 01:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QChqI6vVHRRW6C7u3A4HFPKyjHOOONIPmTq
	BbAmlM34=; b=IFBbSwP+L+TKBLOwDGTSfMR5We3MsKpzulNpXwSmmpszde/zIOm
	Q8atyutJnYwGXXt5ApAhqftF4z3CgCIRxqaY4ffma2ANRT2wy/VpyT2ARs5t3vJf
	aVQCycsROPe94dL9Dz37E7CF0ZNfPZ5HyD0ICHeO4zWWN9UFkyB5CKQ9oaOSwMnz
	baNoZWcwENPE2huuhp7qJSzqnXVzKMBlg/pZygLUzuDyyJQ6hk1OZUQPJpTq2vrD
	GAdTggzkFcElz/AbFews+Q/PPuLkXeJWxyPayXAPdLyHrnuTWqM3z/VRssjLnUYN
	FMiqu6+jWjsEV2jndKlSmjhAbmhl4uF0MlQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44tkrwhbxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <devicetree-spec@vger.kernel.org>; Sun, 16 Feb 2025 01:45:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-220d6018858so52723595ad.2
        for <devicetree-spec@vger.kernel.org>; Sat, 15 Feb 2025 17:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739670334; x=1740275134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QChqI6vVHRRW6C7u3A4HFPKyjHOOONIPmTqBbAmlM34=;
        b=L+P+ErXnk3CPNL9nsx7HkK6K29HaC4Yu3SCboAlIWT95mJDdPDaEkJCryvBZnE/PZO
         iz56Q+G7X3lnKOXXsGWgaWRRTNcRijm6YPrLQxBn6rOcS+s2sP0CXOG/1jd3kdHkGGMt
         ycy7Cptd2/92y5EEVARQo5ImLzEiCVVROwhwl7TgafOu5zjooQ7xO7qM23lfHBbua/GW
         XH9hjTWdbrLj7zHW5+AbR3sW4bf2+ANrlZpaHeiQ76CuieSreFIuWwtjASM/Wg7EZVj2
         RFTDh8urxeNN4SdTjpoY0W6RMWwCr7+OKG5xuE5QuR/YLbrDcG7RhWwh+wHOliOr+Vhx
         mTdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtnyc7SazVvM25fH+uzrFSB5szRFmT29N1HaULfDSVjJE9dxWFkFpN4Dm96I/pVZn3PbNtb6+9O2K9E4Uw5eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwALrS1fKQ3+5hIDAjiDfpJS6J8CHTGGLa6ancp0giJ7rgBpz4+
	UVEQ0M5sqzWM/jqiH1B2o0yHQ4shMhpg1Oy7pjONA7IpyW/gOBFzQpRdWeFjS7PiU30W/efwEd+
	dbbM8xS3LUQJVv0zpPf62TWbvr3OJqB2PFf++fdhzEj1VA0Og+1oLg8UKoVa+yzDm930=
X-Gm-Gg: ASbGncu1lzQpNhdfxTsipz892vZlOH/op7fVDqkbSox0o9JsnHEc6zWJfiSTb7cBRP7
	sUAsJSM0AoGgSxTmeItPxzeEobFPxD1NHLNQCB+sZWNmRL4kjUy2ATumSGY/qNBb2A/4GUijvrH
	rplhLxV9zVXU40H9CP5WF2OS8F05DgPkGhofH+fR84w1w5uQDCMz0ML4ecHp4Pw3VJLuUiHJ8jG
	6xyESWfSETKHYPjW27wruXF456+jglkseoxbnwUXpN/BsJYjs2W1hXkGsoFsJnl4ZNwV2xXOjUE
	p3e88f99LoAN2bEjaNIpKCvwB8V5AZj1kwLeC6rx
X-Received: by 2002:a17:902:fb45:b0:21f:89e5:2704 with SMTP id d9443c01a7336-221040b1427mr59927765ad.34.1739670334383;
        Sat, 15 Feb 2025 17:45:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGk0Wm6pBDN1zI1JP/eN7P464Mszuon80WKDa6iniNlFdMaUXzJp9MDPJ+nFawzsFqmexnMJw==
X-Received: by 2002:a17:902:fb45:b0:21f:89e5:2704 with SMTP id d9443c01a7336-221040b1427mr59927565ad.34.1739670333991;
        Sat, 15 Feb 2025 17:45:33 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d536455esm49896955ad.74.2025.02.15.17.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 17:45:33 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
        manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH V3 0/2] schemas: pci: bridge: Document PCI L0s & L1 entry delay and N_FTS
Date: Sun, 16 Feb 2025 07:15:08 +0530
Message-Id: <20250216014510.3990613-1-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: B9KCdY0nupuGSvRhxu6Kf4ZeohYB1z-W
X-Proofpoint-GUID: B9KCdY0nupuGSvRhxu6Kf4ZeohYB1z-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_09,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502160014

Some controllers and endpoints provide provision to program the entry
delays of L0s & L1 which will allow the link to enter L0s & L1 more
aggressively to save power.

Per PCIe r6.0, sec 4.2.5.1, during Link training, a PCIe component
captures the N_FTS value it receives.  Per 4.2.5.6, when
transitioning the Link from L0s to L0, it must transmit N_FTS Fast
Training Sequences to enable the receiver to obtain bit and Symbol
lock.

Components may have device-specific ways to configure N_FTS values
to advertise during Link training.  Define an n-fts array with an
entry for each supported data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
changes in v3:-
- Update the description to specfify about entries of the array (rob)
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

