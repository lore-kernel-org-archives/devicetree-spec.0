Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9F439900B
	for <devicetree-spec@vger.kernel.org>; Thu,  5 Feb 2026 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770284044; cv=none; b=DypsAwoo4gKE1k1CES5TtK2hg4I/v+1EVxAng9Lpn0Z2ZleFiWHASInmRiUmmjITpWaDBVSBJKWv+vCm3jrJTb6EuqCLCvxSir7DhTNukIFUpFH10I3Uf059TatdwiLLVD9oLj55HXLmBc7A7T7L4SL2BbdFayXfQWirmSiJSDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770284044; c=relaxed/simple;
	bh=kPs0DtXG+9QUrv1Us0pa6hxYPDLn14oG/QFMp/cxXH0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BneYe4MXNUMRUInZUOHzeR+QbJnefGXcAjQtvQUCaEEU89A8X76HTqQNYeLMI0r0tCGs7S6s0E0vlbDK06KGOmUn+31Non1ygy97TWs1wuTWJ4UQwg32UQe8ke9/lLYImb+wN+XjRQCech3tu9QecWzZznR1uhZO7W8I3qkyHmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jx8R7AvC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mw8cCMjT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jx8R7AvC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mw8cCMjT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6155qll64166987
	for <devicetree-spec@vger.kernel.org>; Thu, 5 Feb 2026 09:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lvQdTkGdnJIP/VHAznG5qfzYCx3k04ZHT1+
	Hz9zICkw=; b=Jx8R7AvCqo6p+3yMJ1wn+YrNaTSjHpV02CqXd6EcGHVAOp0T4WW
	s0pYoMubHwMzR/LobBnSpaNU4QF45LUw5UVv6pngG2p/V+qj1AgWvog1JLbYQWiE
	0doVzeFUzMHQdbC/oIW78o8HMhihs5Kvnfzp4Z+XHPSO8dGCmru2uWhivNSb5BnL
	1YZ+YaY9fo/KvA3y0/3u8t++2DJ3/P4eKYamqgHKgO71Kga/z7cZqa8ZpkGKYdU2
	Yf5JWj3XOKMFP5BRQPuuJWvWV260Z9NsZerV929KGP5yqNESTyr1i3TACY/JpCpm
	L7hjzocIEoBPWXzxxcha0HKpc1QxIkJwqnA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4neg8pa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree-spec@vger.kernel.org>; Thu, 05 Feb 2026 09:34:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so475269a12.3
        for <devicetree-spec@vger.kernel.org>; Thu, 05 Feb 2026 01:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770284042; x=1770888842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lvQdTkGdnJIP/VHAznG5qfzYCx3k04ZHT1+Hz9zICkw=;
        b=Mw8cCMjTM5Tj2TYxoND25+b2Ve4Qs9nc4jcfvejScPw1qNwrr/YsEq+n6Tq+5ImXgr
         8wT/6M7fCl2ZAGopdp2gLsl4Ga/6Qt1VRsh7Rrdn9yMxuk2Nfnx5JlsuTnRCQNi6+kSX
         yeDUUg+gBbZOTK+8oS84DMNkgc1QXSTXW+uCK4Ndzb/kA9y3tlhTERxS9UE8/jAsjepe
         OefRFEp2b88U3dBVI1HyOVLwFxsPfWtn/GN5PKkLHnfqTQYUZjxpRftXatsIBZJssNlp
         FFBLXPr4N5I9GcEqLFMx3F0WG7noGmCJ04LOJ+o+kdSGgo9mNvhyLN3yBba3zTPiN7nr
         z1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770284042; x=1770888842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvQdTkGdnJIP/VHAznG5qfzYCx3k04ZHT1+Hz9zICkw=;
        b=bMfwJpoV+sILPrpP3QYjYIJqlSVaTu+dbfujySaa3Z7t/UBk7SJzrRx7RRzXfV/vPL
         lk8PZJE9yRYrI1Ci3iGcFriwbxoZkO3vyo9ZSCbTbcvR4IyKe0TRGkQxpqcmXoIw+s8w
         dN2jHb8eTfI+V4BzY4rL2w2aR1qjROA++CS9Q0DVuGnoTG92E6UxfDKjhtX4VJFWFVvI
         T/ykSJCTENSbzh/Tt8JWgjAM6g2gpBkCw/X93C/aXuZ/JK3dfKXwhjQUopTRmuTOIxDJ
         f2wzzP5Mc8DUyTluh61ok7zKTAXIbRwHnKpKl+5dIRT/Wo+68zSqr+5wCe+6B5NDcTk1
         qAqg==
X-Forwarded-Encrypted: i=1; AJvYcCUUQ4IibCM2/i4WDeu6ji8LpV+cthdNU/3koGBErNXCQCjk6TvSrFk3/S+k1DlNLw1Ry9BfrAfeut+b0R/TLCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnXLRXTKfIVUliU+sVUz+rIxNDO7AUZQeq5UoJ4dn9Oir8aEPR
	3SC1y0v1nPkKRRyfut7hqiCihJDkTkETO+1wMF0tdbe23SvIFFwfP09Y5Z8pATGIxsGdhwsvkO2
	mF/E063+t0Ap0doBiOHkX0VIclocpqp0LweEt9X9ZQaWQpW06E6vxZGeAv/ls4vBcpYJMJXE=
X-Gm-Gg: AZuq6aL3l3Myf6K8hLrN+rjXqrJJiTUxKg04pUjP+XS5+RgHGo+ZkiUouBNezFwWJmK
	hDQHD2lV+d+KNitEg5DTCUU4N0jSSIQZhRKwmmNZWBUQRAPXc7eTMKiAWh0EVIs697OXjth+1cF
	tSKP6Mvkf716GR7prfUFrepaYtY0lQhJyTq2AAxSjejFo5EaWktVQRBXl3I00VXXh0iertnujeU
	3mAcKmodp2n8zuyIQ/EwxFeHvcbUG+u84II9EXwT2n2oqluwgoeG/TXr5XxO8jgG+q+fGF0jYt/
	iKGnsarj/YSiL/tzguKKVzPnM055LAwT8UyC0pEiPTkNTRRkcT0iOyAF4SqDxjRP9YBgOg5db8s
	P6igqiE6WdmysRRjJzZbIoM/NEetoklce73BgGVxnYy3+
X-Received: by 2002:a05:6a00:4b08:b0:822:abcd:db0f with SMTP id d2e1a72fcca58-8241c64fcf5mr6075325b3a.52.1770284041450;
        Thu, 05 Feb 2026 01:34:01 -0800 (PST)
X-Received: by 2002:a05:6a00:4b08:b0:822:abcd:db0f with SMTP id d2e1a72fcca58-8241c64fcf5mr6075305b3a.52.1770284040974;
        Thu, 05 Feb 2026 01:34:00 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d487886sm6181538b3a.59.2026.02.05.01.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:34:00 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, mani@kernel.org, krzk@kernel.org,
        helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        lukas@wunner.de
Subject: [PATCH v4] schemas: pci: Document PCIe T_POWER_ON
Date: Thu,  5 Feb 2026 15:03:46 +0530
Message-Id: <20260205093346.667898-1-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2OCBTYWx0ZWRfX0nJy4SJJYLy8
 jllVhMbzkrvMr4IRstOOhhl0n/Z2Z/3X1VISa4CiMFRoDUgxtAZXW8y5A2I8OLAywv4VLRBQriH
 BQXVCxvBxngYmDWm7LujI35dEfAeW9EZLjaZBEa9hcF8GsmdP1HZtz7YdPwZAuFcAJseJi6xDDz
 36uNcWOIgMRn+W/PXJb6VJOLLHHuPjupGDM1GVnxaKH+/FXkSI+fm1RVPSycRml+M140cVwI4Um
 rUrjEtXV4iCSafYZXHDCjPTmqAdCEPQue5AA7tmMf4WwQuMoKdlTc60lEsMLueeJt/dmWObqste
 IaO55Kd9bDcG7mlWh+n+d0JqkdColeOv0V3xkHRI3yowm/oqREPcEx2TAIlos3xvfERNV2pFVLg
 AmysMV1Ly9Vu/dA8DmwuO1ED9x558+SRZu0tS+SrhhlRLyAJaXo7zZZc9p+wa2HnTckqaO+aRZb
 7gW/Thxvsw/J3b57FLA==
X-Authority-Analysis: v=2.4 cv=ZITaWH7b c=1 sm=1 tr=0 ts=6984640a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ji1uk-MP7uB9YWhOYAAA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: UNiFn8RmkWc9Ik_S_9oHovLyBa8QhzIz
X-Proofpoint-GUID: UNiFn8RmkWc9Ik_S_9oHovLyBa8QhzIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050068

From PCIe r7, sec 5.5.4 & Table 5-11 in sec 5.5.5 T_POWER_ON is the
minimum amount of time (in us) that each component must wait in L1.2.Exit
after sampling CLKREQ# asserted before actively driving the interface to
ensure no device is ever actively driving into an unpowered component and
these values are based on the components and AC coupling capacitors used
in the connection linking the two components.

This property should be used to indicate the T_POWER_ON and drivers using
this property are responsible for programming both the scale and the value
of T_POWER_ON to comply with the PCIe specification.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
---
Changes in V3.
- Couple of nits from Mani & Bjorn.
- Link to v3: https://lore.kernel.org/all/20251126103112.838549-1-krishna.chundru@oss.qualcomm.com/
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
index ca094a0..a847500 100644
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
+      components (PCIe r7.0, sec 5.5.4).
+
 required:
   - reg
 
-- 
2.34.1

