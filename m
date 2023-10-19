Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9B519442
	for <devicetree-spec@vger.kernel.org>; Thu, 19 Oct 2023 11:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="KV7G52nP"
X-Greylist: delayed 1122 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 19 Oct 2023 04:22:44 PDT
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFDB115
	for <devicetree-spec@vger.kernel.org>; Thu, 19 Oct 2023 04:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gXiAIgittBVhGhaxqxf+Xr7wL82eAsSq2nLygNVvDgs=; b=KV7G52nPhbFtDBHeRnJZ9I4UcR
	hoJLLcP8WKn81GdsMbE+TTrAVWGl5hoS3Rx8/n/Surii/ehpLoyAQfiKaJjcRMBeWfu0jEHqzKFaS
	Ml7OY2LG5Ul2PwJ2LKq7keVsXrnQx648QjsXwMKmpx/CWWhykzD0ryX2GZE6cHQUdWxcwHKFpe4x1
	ugB0CkSwmXCML2V1/+b0HpqwfzdRdzDSyBejHuOOytRqq+mxzfFh9iIGdkWKmHzZDbBc25mm7LX2/
	YQE58pMhLxBxWZ/6PxQUr6BoVtP+oRc72PLmhfW21e5K/v83u3XZ1q552RpOF0wO+QnDKppDzbB1Y
	4eHbLl6g==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:51988 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qtQoq-005kG8-1f
	for devicetree-spec@vger.kernel.org;
	Thu, 19 Oct 2023 07:04:00 -0400
Date: Thu, 19 Oct 2023 07:03:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: devicetree spec mailing list <devicetree-spec@vger.kernel.org>
Subject: Definition of "should" seems inconsistent with idea of
 "deprecated"
Message-ID: <cddc5065-42d2-11f6-9195-296361c8aef7@crashcourse.ca>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 


  Reading DTSpec v0.4, near the beginning:

"The word should is used to indicate that among several possibilities
one is recommended as particularly suitable, without mentioning or
excluding others; or that a certain course of action is preferred but
not necessarily required; or that (in the negative form) a certain
course of action is deprecated but not prohibited (should equals is
recommended that)."

  It seems contradictory to suggest that "should" implies
"recommended" but, in the negative sense, it can also support
"deprecated", which typically suggests something that is *not*
recommended but is nonetheless acceptable.

  It just seems like that's giving off mixed messages.

rday
