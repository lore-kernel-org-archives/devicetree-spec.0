Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F142E5439
	for <devicetree-spec@vger.kernel.org>; Wed, 26 Nov 2025 10:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764153087; cv=none; b=DzKUX0RyP/fZwZoaDJfWZwG9KDY+2SzYL1iSKeSHttZl1MQ3naME3mRZdrphSBOoDUZPEX+q3xewkYfraC7IqrceioeyY7ffVLMJ8iggJgc63mH34e0nEylmjSz/M6Lq06Cyi3Si302PwN7dFmXCqpMgsTHdQhwXVAHr6atmRGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764153087; c=relaxed/simple;
	bh=XBQV6zbTgM5PW/11ScmAaN6KwicooE8rv47r9WmQPd4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PZiBGtagqZ5bW+EkTCDFRenfUqw/VL0m8wFe+X+o/DW6REm4+gIA1oyrHX3B+4eQSsilKJBNw+FgptCFLbRPXDDBhctiT8DlZSO9uSEIXT41Bqb13x7EokJwXJ4Mng4xo283ELSxicmmS1wplJM3EVXhr+YWI7cQh3ZswYPQrJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6Yhuagp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1aQ/TDR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6Yhuagp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1aQ/TDR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6NP7Z3738821
	for <devicetree-spec@vger.kernel.org>; Wed, 26 Nov 2025 10:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ysWSZ/rG34suqAdQu+gZ4WZ32lkN3tM8tmq
	ZfOIp8GY=; b=Z6YhuagpBv6E0NEJQiV2zHRpcwac7Gy1+EoP5JbaFYuFa2+BG2j
	1JR+OLcuMzO1lsswNzr5hBX8j/1Nmt2a6XLHSH6RqNRQHeHtvw+KOxQdjNMOu1y4
	FQEUCcTZ6s+alU7s5lCcy65/6KE1N79RkZpnOFgoqTVw8AlJM1ycAZSd0vvr/NOB
	mQkYmoAIkfoguXyhbLrznm64Xh9oakQQDddd93DM3EbgqvjjBArXy8GA9FFMqMSJ
	8OvuVu4pIP3rBK26A/2+rarAJBWIvEFDk52nJAUhjtDazp9mdHTYjCXCE4hHr0/D
	MxnbhnNo8W90grOrYFaIyn6Cj00DgpGJRuA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggyjgh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree-spec@vger.kernel.org>; Wed, 26 Nov 2025 10:31:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-298535ef0ccso71316455ad.3
        for <devicetree-spec@vger.kernel.org>; Wed, 26 Nov 2025 02:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764153082; x=1764757882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ysWSZ/rG34suqAdQu+gZ4WZ32lkN3tM8tmqZfOIp8GY=;
        b=R1aQ/TDRszkr1IQkOFcWPP0f1BOhsGUgn7K/D8hIuJq9FA+hbbLbgUDSl/OeTywfl4
         PLThNlrmOjZQcHWPyNRa1hx9c8W87sOR5qUDCZeAb+c/ETxEzTlsuVH1RElTuf2idNoS
         a38Sk0S9WtEG85/PK1HLZsjjQN7Eeig+Gb0Q37EAURzfUlpcu1UfbdgKYuOGVYEmOyqd
         qRNMN3jJAzYGdmvlJahLZNV2nD4wwSsWRhlkNNtJhoBtPNUIMH8HaiWq0/tbA6apmBP1
         oyzaqksg8+bUGJS2NYYxOa+CXlPriKi8orYTupjjng9DoLHyC6Ur2GixGbm1oOTEljW7
         JbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764153082; x=1764757882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysWSZ/rG34suqAdQu+gZ4WZ32lkN3tM8tmqZfOIp8GY=;
        b=JMxMG7TDBCGDhEzuC+2l6enQPxdoLVnnk0zky6awSr77Nc0GTvr/97IUKYS0oj7arz
         +Jj2QVUkfiRTgctgjr+tdD0tELDpd0zFmx3sOhklQV0ygt9bpC/dDGHb+vMkOlReO/xE
         yUvgU4Iy7HNVuoLj9/5bHpLVSx46s9KnbDfyrF/iG4/szd2X5KxYqdfGt2Ospr2B9+30
         UrJmNwbMOnGxCqwGXGde69GQVhVomHt/kykV9oR47KzsnfyT+iOnGxMaHSLqwrGuUMfg
         GQX7ahOMOzWmTYIAGNQXmPu6LY75o9eCGjM8MX8rqvAPYELk4CK6O3TZI/Bn9k1gj0w9
         saZw==
X-Forwarded-Encrypted: i=1; AJvYcCU8RuctQVWuSXx/GLpkYmnAWg5BEtKLS4klPL786FQ/yVxJjSDUjgb5q4xF+U9ktQThbNC/h85aeh1aIorqDhg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+g6sJhOCzM2hP0KyQK+j68r3VEK5xVvbKMht0q4SHfEulPXKi
	uHQ7bpscwI3+zzyj1cEYWlDgTd3LvbEVMspc15eS3/hzQtm8hlPcJ3XRuVMtEl/Q8o//72vKp/k
	uRShuedC+9xc//QVhJqaEH0cIe601oFjTRYw3KUAp4rKaobpgOF9soVTbBrpW/v3BIJL/O8o=
X-Gm-Gg: ASbGnctYXagZACdEu5poBNDZNhQC7ZhuBtpXHnKwp5gUuQ/KK10XXksnurrs3COKXe7
	v/eBk2jgXx68PFp53mJTNVfpdu+ylPY7LX05vFEpqhNI+OE14aBGgnbbWmt4WM2bAx03ZKA8j7c
	l84+g4i+MdNhHxiidWk9HCxZHPDLujcOdMkK1bP0S7rkXWn6eSjrm95kp4UbNi6nxDvMcDPfCZ4
	UxA9y46nfqZGIfO2TWDnar0J6CMWW30Y3j/CVO7zZLYCoSN+TH9oDRDImEPUzSAXzZtJNwEM0j7
	isixoU6zKCBueolcUR6DjVr70XpOiLSS7AgE68CVJypWCq7XB4PK0GbhuEgMBbe2QNO+inepefC
	lNXmIr7f3FV40CO8L80w6t7EZRTFk2bmAJ63YmzKOP5+U
X-Received: by 2002:a17:902:d4d1:b0:246:e1b6:f9b0 with SMTP id d9443c01a7336-29baaf9abb7mr68896085ad.18.1764153082189;
        Wed, 26 Nov 2025 02:31:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtNSOALWZhHSuDXvX3CzC6UbjFFjub+TsW750YdkPPPyau87i9PtTK1ZxruaatUAFQE/8y0Q==
X-Received: by 2002:a17:902:d4d1:b0:246:e1b6:f9b0 with SMTP id d9443c01a7336-29baaf9abb7mr68895455ad.18.1764153081592;
        Wed, 26 Nov 2025 02:31:21 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b26fed2sm196534635ad.69.2025.11.26.02.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:31:21 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, mani@kernel.org, krzk@kernel.org,
        helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        krishna.chundru@oss.qualcomm.com, lukas@wunner.de
Subject: [PATCH v3] schemas: pci: Document PCIe T_POWER_ON
Date: Wed, 26 Nov 2025 16:01:12 +0530
Message-Id: <20251126103112.838549-1-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1ig0moxjhmmNpfPxWkpf46uykOMuX-Xh
X-Proofpoint-ORIG-GUID: 1ig0moxjhmmNpfPxWkpf46uykOMuX-Xh
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=6926d6fb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qIbWdXD6M1inJYch3NYA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA4NiBTYWx0ZWRfXxDi98TEVn+Fp
 0ylYlYWqEuTbZfk4Ih3zEYuB3MqzIlni5aSV60NutmXmjl/QH0YT+SybJH+slkCTHKlt57TxAnq
 /I81ddw3krZcdv59fTkbu9fCKLk+NqMSalV6//fEzNtT1E38MMGuFyYpVkIswu8SQ995QKJzIvC
 WYQz+ArmWCJLfnO8+OAJm+wxLuxsuqwlBlIwD19S08VhW+p8G5obhlqg3UUMoSA3FMVRenfYvhr
 VNJal13d+GMcu5J6Hk4Fx/O8y62vQIGyP66IJTc3vI8Kz+yk7oTM4VA6OVcj3h7fMoeLTPaWkrX
 lIVOMZO3CpJ0uczy8S8PdG5lJwu/+EBcUn3Kjepy8LmRFLEWy/OdaTCaAG4d4ct/MuHWpnaos/H
 e2AEGioFIU7nCpak/YFps2aDhHwpOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260086

From PCIe r7, sec 5.5.4 & Table 5-11 in sec 5.5.5 T_POWER_ON is the
minimum amount of time(in us) that each component must wait in L1.2.Exit
after sampling CLKREQ# asserted before actively driving the interface to
ensure no device is ever actively driving into an unpowered component and
these values are based on the components and AC coupling capacitors used
in the connection linking the two components.

This property should be used to indicate the T_POWER_ON and drivers using
this property are responsible for parsing both the scale and the value of
T_POWER_ON to comply with the PCIe specification.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Move the property to pci-device.yaml so that it will be applicable to
  endpoint devices also (Mani).
- Use latest spec (Lukas)
- Link to v2: https://lore.kernel.org/all/20251110112947.2071036-1-krishna.chundru@oss.qualcomm.com/
Changes in v1:
- Updated the commiit text (Mani).
- Link to v1: https://lore.kernel.org/all/20251110112550.2070659-1-krishna.chundru@oss.qualcomm.com/#t

 dtschema/schemas/pci/pci-device.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/dtschema/schemas/pci/pci-device.yaml b/dtschema/schemas/pci/pci-device.yaml
index ca094a0..4baab71 100644
--- a/dtschema/schemas/pci/pci-device.yaml
+++ b/dtschema/schemas/pci/pci-device.yaml
@@ -63,6 +63,15 @@ properties:
     description: GPIO controlled connection to WAKE# signal
     maxItems: 1
 
+  t-power-on-us:
+    description:
+      The minimum amount of time that each component must wait in
+      L1.2.Exit after sampling CLKREQ# asserted before actively driving
+      the interface to ensure no device is ever actively driving into an
+      unpowered component. This value is based on the components and AC
+      coupling capacitors used in the connection linking the two
+      components(PCIe r7.0, sec 5.5.4).
+
 required:
   - reg
 
-- 
2.34.1

