Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249D620C46D
	for <devicetree-spec@vger.kernel.org>; Tue,  4 Feb 2025 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684637; cv=none; b=SsivqpuFjvSxUcf630kJezsoubDrYjQGS5z6c4U9M7QHqF2jLQAyx5FucNguMks1iZu4FpAIR9Sp0C4/koW8TcqiTY1sIQiHgcqelnDa1tB4dQR0dvy8y8UOZwa8xnydEUM1UNQNtaWOhnJQSgva9aHic73yAsa6lwe3Y3T6HL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684637; c=relaxed/simple;
	bh=emV4oi0lCMwgNDKlcVe+AizRV+Lp2Y3AbfnzlGfPfa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e91ZPSYxDg90IQLmB1ldX5iHxDYHOB0HQxastAG58QKB+DTvtyqjD9A9Fnem8MN26dj0vCn+XonHmpWDEeqZXeUtSzhL4nvcKE75w8MmRtQOMy6NDGhxIH3Wd2bDJoFK8wZiQ35nMwA2/RpRINlU73Jvee/BWqn+Fe97NqhD71g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:0])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YnSfp1VLFzXwc;
	Tue,  4 Feb 2025 16:57:06 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YnSfn5ZZFzZJT;
	Tue,  4 Feb 2025 16:57:05 +0100 (CET)
From: Quentin Schulz <foss+dt@0leil.net>
Date: Tue, 04 Feb 2025 16:56:57 +0100
Subject: [PATCH] Fix "an DTSpec" typo
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-typo-dtspec-v1-1-e7b3a843898b@cherry.de>
X-B4-Tracking: v=1; b=H4sIAMg4omcC/x3MMQ6AIAxA0auQzpJgkcWrGAdTqnYBAsRoiHeXO
 L7h/waFs3CBWTXIfEmRGDrGQQGdWzhYi+8GNOgMmknXJ0Xta0lMGtlZZLLOGYJepMy73P9tWd/
 3AyNkDcRdAAAA
X-Change-ID: 20250204-typo-dtspec-2e532ec3550c
To: devicetree-spec@vger.kernel.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

Should say "a DTSpec" instead, so let's fix that.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 source/chapter5-flattened-format.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/source/chapter5-flattened-format.rst b/source/chapter5-flattened-format.rst
index 03d1217e51feba926bdafecbaad4987cc88b59bc..c52b175f7e0a380b1150232308ae64e251a82339 100644
--- a/source/chapter5-flattened-format.rst
+++ b/source/chapter5-flattened-format.rst
@@ -121,7 +121,7 @@ big-endian format.
 ``version``
     This field shall contain the version of the devicetree data
     structure. The version is 17 if using the structure as defined in
-    this document. An |spec| boot program may provide the devicetree of
+    this document. A |spec| boot program may provide the devicetree of
     a later version, in which case this field shall contain the version
     number defined in whichever later document gives the details of that
     version.
@@ -410,6 +410,6 @@ ensure that the devicetree as a whole is loaded at an address aligned
 to the largest alignment of any of the subblocks, that is, to an 8-byte
 boundary. A |spec|-compliant boot
 program shall load the devicetree blob at such an aligned address
-before passing it to the client program. If an |spec| client program
+before passing it to the client program. If a |spec| client program
 relocates the devicetree blob in memory, it should only do so to
 another 8-byte aligned address.

---
base-commit: 5688e1c0b961d2ca5a32e3b624a9f4a9b433184f
change-id: 20250204-typo-dtspec-2e532ec3550c

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

