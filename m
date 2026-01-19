Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E4121FF2A;
	Mon, 19 Jan 2026 15:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768837972; cv=none; b=o69cSs1QrvNIU13lah9ZhSFlUQH3Pc0YRay3ynWlsDXt4kQBTNRFdufCYQv0zt2aOxH1z7+2SFdhWSsKO00UYi3Z4nSNr7+K32xBIGPkN/tdaa+Efqi0OVE3jszomQRZvrjHm1FmBzYW0MfSuDU1q6gTlAL+tpx516JQ4PqbmFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768837972; c=relaxed/simple;
	bh=v4PH53FfKvVEOxj8g9qUQjPEOKaBdpti2OkhSd9M8F4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YUJKHQAQbF6iaCEn/IA6fuPAuoDgltR6KFadk+D1jeqiQkXlGouOfhz4kIQVHNihi870ljr+nxW+yixm2EclCWUqvIm5knylqRFxIEJRDJXoKXvbcnuWKE6kJxRY+PTgv2S1Tld7Y47mG9O4jJ0DSLk6ZIg28QhwrFx7QajYYFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ll9eIW+I; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ll9eIW+I"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6F92AC214CC;
	Mon, 19 Jan 2026 15:52:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5AB2A60731;
	Mon, 19 Jan 2026 15:52:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FDBA10B6989C;
	Mon, 19 Jan 2026 16:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768837967; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SF2jOIAyt1cDDgPFlhIB+fTbMrfkCv/dG8aPKUQ26JQ=;
	b=Ll9eIW+INwdJTCJqY4wUwPVrpyT/X4zaQWU8NpdduKZBh0jg7OzKMBVPr6Mfc14c/HToPU
	a0OayngZ9FeChXy1ihvDpDaUhTc5Pab7NIMgn6k/euKXMM5CtKbV8zRi+95xinuvpN7Z43
	hojhqhOwW3Tarxwbg/wkNsPBqXsTcy5heRtYsrG3LrxieA8cRT8nCCplhDIUafycAr+Pnh
	fGqlXANfxc7IaTkDxsDT8b/F8AwvhkIPKa8XO0tA2aCkH9xAFBnG7HHT/UZtsvLdXnZt6v
	WajtEeUxLVhbKOWMeny3OPbfQ9b2ZpTApk9XL53ti/KpABZGU9iEad/G/CD7rA==
Date: Mon, 19 Jan 2026 16:52:44 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ayush Singh <ayush@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, Hui Pu
 <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 40/77] dtc: Introduce dti_get_node_by_path()
Message-ID: <20260119165244.4dc11e18@bootlin.com>
In-Reply-To: <aWiNgZZ02-4jRc5l@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-41-herve.codina@bootlin.com>
	<aWiNgZZ02-4jRc5l@zatzit>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Thu, 15 Jan 2026 17:47:29 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:19:30PM +0100, Herve Codina wrote:
> > The future introduction of orphan nodes for addons device-tree will lead
> > to more than one tree in the addons data. Those trees will be:
> >   - the classical root tree starting at the root node
> >   - trees related to orphan nodes  
> 
> This doesn't make sense to me.  The new function still just takes a
> single path, nothing to specify which tree that path is looked up in.
> 
> You can probably guarantee that labels and phandles are unique across
> all the trees.  Not paths, though.
> 

Paths can be unique across all trees. The tree needs to be indicated in the
path. Starting by '/' is the root tree.

For orphans, I proposed "$<orphan_name>/<path>" in patch 64 introducing
references by path for orphan nodes and so, for orphan trees.

Best regards,
Hervé
