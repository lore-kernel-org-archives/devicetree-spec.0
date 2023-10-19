Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59F4225BD
	for <devicetree-spec@vger.kernel.org>; Thu, 19 Oct 2023 18:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="QVbPfjO+"
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA88124
	for <devicetree-spec@vger.kernel.org>; Thu, 19 Oct 2023 11:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=etPBnJoYa2l/W6rdJSRaqwTbLYewNHPv9by99xsSH34=; b=QVbPfjO+T86udO0FctAa5tNYHC
	7Z2YSB3sR37Y+gRmgbSbTSC0vxoJJBDARgGW7spAPQ3pEUZj3D1dE4SIp/seMBDUYpR01Px2Fff6f
	AzN9aSsA2fhGKSvKJsi9e0Hq97sCmPQ0P1QcZy+Tfl6+tAQ23Wwi0xSDS6CZVlbQ+1Nj2z9NUsrMo
	93C2liiC48vV14Lq2IBCWbkvzeIX0YSWoKeNYOk8To9jd1KocJSKgQVnvdQboxjK6P524bXST01Ap
	LOo3s4Javbvq8wwwxEKazpP3jwOE9miKX/KdEOs106sYSObfMZtXRqAq7pBvnVazr6/bwEHy0zM1k
	7Q8mb4Lw==;
Received: from [::1] (port=42864 helo=cpanel10.indieserve.net)
	by cpanel10.indieserve.net with esmtpa (Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qtY88-006TNI-2r
	for devicetree-spec@vger.kernel.org;
	Thu, 19 Oct 2023 14:52:30 -0400
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 19 Oct 2023 14:52:24 -0400
From: rpjday@crashcourse.ca
To: devicetree-spec@vger.kernel.org
Subject: [PATCH] chapter2-devicetree-basics.rst: Fix "TItle underline too
 short"
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <d1bc3d109190889b68c39b760c7a87b6@crashcourse.ca>
X-Sender: rpjday@crashcourse.ca
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 

"make html" flags this inadequate title underline.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/source/chapter2-devicetree-basics.rst 
b/source/chapter2-devicetree-basics.rst
index 5ab9e6e..6c7d3b7 100644
--- a/source/chapter2-devicetree-basics.rst
+++ b/source/chapter2-devicetree-basics.rst
@@ -845,7 +845,7 @@ Description:
     and this property is not applicable.

  dma-noncoherent
-~~~~~~~~~~~~
+~~~~~~~~~~~~~~~

  Property name: ``dma-noncoherent``
