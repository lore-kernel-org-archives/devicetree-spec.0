Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23410159596
	for <devicetree-spec@vger.kernel.org>; Mon,  6 Jan 2025 09:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736156015; cv=none; b=T3pRnvQxyARjQG91dVDNsfM3mG4PLsRg8NkopXsP5Ipy7BcwZOkAAEG8jKyL2FFmCSwkrQd9OkUXzWinqI/cMzBSI2AQoxmYG2GXwbMu8T/ISNtGWa6x0TEOzThSFBWndfD9z5eYudTUPIfTBxf1AKezVF/BPhz7HGDKhLY3TpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736156015; c=relaxed/simple;
	bh=u6ITWZK6Pnui8R/rp+fW3eZGVRboaltac30M06+tTJY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YM93gRTyfH5IULZ4/q/dtO4+dfhSCGVLh41QgFmTnwFApFWbT6T5Mcc8XCnqu4V/5LZSU74hZsuuZikNTECrvFkp5SX7pCPAwJHJq/GEMmX1+2UQfBSlmMUSQ92RZp3lRowHrVHyJsVIXYK/9tAOpGCxIylTcbMUabmGjV9pcFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJpz3M34; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJpz3M34"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5067NiSV027400
	for <devicetree-spec@vger.kernel.org>; Mon, 6 Jan 2025 09:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ooc8CaBX+hRHDY5DeK/hHvsWjudmqQEAdI9
	cWCPXiSU=; b=IJpz3M34yCiwp5zx/LTp3uU6muWxlExxrA73fpDOmFtdnnfKxZH
	ujwFw4wA7tbbuN/HcU9KO/j0Bian2erDSOh7uHcqa/FexMvDzTcnfPWQmwVj1YQG
	egmpeGb2kwhuhUdt0t12tQzxh1CGJPOl4qwfhLK9DPq2wxyYaNTY5lVUCGmpP2h2
	DekO4nXZrtWXQWYkWzu+DDOa5IIgf/X8MPPQ+04D8UFbCiwGBcL0j+hpBiDWgMED
	FJYlGTluvt+/4Sa9LIfuZ4wN4WgGX8rvIoLE/C9OHlnmNZOdK5BnQZ6A/tSFdvGV
	ppcEFvhwCeci6TkfD7z1qDy4SE+nzI6paWQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440arbr9kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <devicetree-spec@vger.kernel.org>; Mon, 06 Jan 2025 09:33:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2178115051dso191227295ad.1
        for <devicetree-spec@vger.kernel.org>; Mon, 06 Jan 2025 01:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736156012; x=1736760812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ooc8CaBX+hRHDY5DeK/hHvsWjudmqQEAdI9cWCPXiSU=;
        b=uHa0HL1A0ZnVcniv0ty8ox9cf3XS2ssEPvC+uMJUrlT0OyKj+Tsy0TUPwTe7gFD4e5
         jvQQR9N4iaX3GZdCRK5yfsgjOTvr4QjWmyGdkljp5A4ejt/urPAfkdJrf/ZoJCJlMHA8
         Jyu4wkPFTpmBhlBnje7OUMH2ce3nFowG4xBYeSuFI/+GVsTDF8Yz6kc+7BezAKk18yJz
         48zH40B98qLp9XrVJO0dtG94RVT42wOAt6oCcufzMZFqUZBnd/VqcDEgBtIACEOeDSyl
         KkbLav2Gct6ap1WeMatORYSgjxyVML7JfX6zFy4UZMtn6SjIsx0j0/+0V5mkmxwbr1g8
         5rig==
X-Forwarded-Encrypted: i=1; AJvYcCUEWMOeFx2+o2fC5mNhKB4Z1e9iPGIkRVcZmbLRpRlct9+89cccjgSMtJi9na9iuMeMW28Bx0NYK1jqKpiY+os=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUp9vgSaqgDV/6Fp4fVHIfWZy2MbJqTBWh3Hzgkp0ca8LnfFs1
	/wwHR82qZsNFTpVnlZZ0L3X/X2je9IaZ765VZkx2POKhlwRb6795Afj8dZ/nnynGie+sZirBqpO
	6epeX0lFUl0m284sL8KcSVyU72GYj/uTSFmrfRjC13gCgBPl00dYdy3RlzCaMu8Pr7NA=
X-Gm-Gg: ASbGncu91FTTKz3w0Z3YQudPt3g+VOQLTYzI1EVVoiOPGAN0U3C6tlUO8kFZ+erBOEK
	j9nBBm4OYuPIPaoNcUZiHSyvWW0DYfvE9Hd4cLP8P1yt5B+YMVF4b0chdV0GjxNebGl2MWHnJ7W
	NwAtKeTALR+Q8uXgTE7CbfG2EO8z9csesi/HLSWtxTafwfxY8GwIgSzYOMQBNTIraQxq35mRvIr
	0DRd8wc9oxYvcc4UlEoXuy4w3GIWt4q0NFJydxMkKdROsg6Q7dnv/vI+8U2cZCOD9QtX97XucGo
	Ff4+6iF6rNcR2Pdp
X-Received: by 2002:a17:902:f685:b0:219:e4b0:4286 with SMTP id d9443c01a7336-219e6ebcabdmr705471575ad.29.1736156012421;
        Mon, 06 Jan 2025 01:33:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgBkTe3UZfkvpcZzMY3x0JbZEG0gq0kNqGGbjEBJ5gyLmgAR+ikmyKbTEvWQACPEWxprKFPw==
X-Received: by 2002:a17:902:f685:b0:219:e4b0:4286 with SMTP id d9443c01a7336-219e6ebcabdmr705471305ad.29.1736156012068;
        Mon, 06 Jan 2025 01:33:32 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f625csm281079085ad.208.2025.01.06.01.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:33:31 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
        manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH V1] schemas: pci: bridge: Document PCI L0s & L1 entry delay and nfts
Date: Mon,  6 Jan 2025 15:03:04 +0530
Message-Id: <20250106093304.604829-1-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0AlzDcRF9lDqVEPyQzHt9xdU6xuh2OVE
X-Proofpoint-ORIG-GUID: 0AlzDcRF9lDqVEPyQzHt9xdU6xuh2OVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501060084

Some controllers and endpoints provide provision to program the entry
delays of L0s & L1 which will allow the link to enter L0s & L1 more
aggressively to save power.

As per PCIe spec 6 sec 4.2.5.6, the number of Fast Training Sequence (FTS)
can be programmed by the controllers or endpoints that is used for bit and
Symbol lock when transitioning from L0s to L0 based upon the PCIe data rate
FTS value can vary. So define a array for each data rate for nfts.

These values needs to be programmed before link training.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
- This change was suggested in this patch: https://lore.kernel.org/all/20241211060000.3vn3iumouggjcbva@thinkpad/
---
 dtschema/schemas/pci/pci-bus-common.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/dtschema/schemas/pci/pci-bus-common.yaml b/dtschema/schemas/pci/pci-bus-common.yaml
index 94b648f..f0655ba 100644
--- a/dtschema/schemas/pci/pci-bus-common.yaml
+++ b/dtschema/schemas/pci/pci-bus-common.yaml
@@ -128,6 +128,16 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 1, 2, 4, 8, 16, 32 ]
 
+  nfts:
+    description:
+      Number of Fast Training Sequence (FTS) used during L0s to L0 exit for bit
+      and Symbol lock.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 5
+    items:
+      maximum: 255
+
   reset-gpios:
     description: GPIO controlled connection to PERST# signal
     maxItems: 1
@@ -150,6 +160,12 @@ properties:
     description: Disables ASPM L0s capability
     type: boolean
 
+  aspm-l0s-entry-delay-ns:
+    description: Aspm l0s entry delay.
+
+  aspm-l1-entry-delay-ns:
+    description: Aspm l1 entry delay.
+
   vpcie12v-supply:
     description: 12v regulator phandle for the slot
 
-- 
2.34.1

