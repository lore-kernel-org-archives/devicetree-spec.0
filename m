Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDA5204F8E
	for <devicetree-spec@vger.kernel.org>; Tue,  1 Apr 2025 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517806; cv=none; b=DMXpb/Fr4wD1lhdJTX+4aZ4nkYHWeMHFXkcPTUpS4MYVZeZAu1nAFO+4ep4Yr65uI255RfS46fcSn8+QE7B//WBGqzyq8z5PFRTTtU2FA4mlpHEV+NWMgBcO8NyI+X4fvWUn1PG3XNyFx6VyHJKkFH/VcHynfNfX5+sRAUtL22U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517806; c=relaxed/simple;
	bh=K+7kQvMhx6AOm5j8Rh5bgQvyL9fPK1tKfNE1xrweIto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+2DQoYa3qyjqHJZRNGRCDLXnvMs3SeK0bdGwRyI5UYVtTk137cmbXyp4g2ILD6AICO975hLgrUM9J6CadaUwP/DI2NfIiigMtIcRXQ0EjvydODYNkEfomH6CPl/Ru9N6z/z8aPySfqJhoa5TKgEoZYDnxkE+u/3J7ZV7QvnBuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSh+QBdR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSh+QBdR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0016C4CEE4;
	Tue,  1 Apr 2025 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743517804;
	bh=K+7kQvMhx6AOm5j8Rh5bgQvyL9fPK1tKfNE1xrweIto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSh+QBdRaNuzEXRmvHcYd6VMjgCctDrhbO4oIQcjfkAKgh6pXBIdWd6wvb/t/Vq4h
	 TBP+WoYNJsDT8z843Pwl4ePBcSwqn7UFVoJob5pO/iIlikoj0fAJLWCK3f1DTBkW0h
	 0hTDSaerRhrDme1GrO4tR4KRbnjiGwh7LIiulVHvLek7o53iWYGXXK1rp8yXYKUJTs
	 qzpH5PUFEv1EVi+WtMZp06HIw8D9GYBmbI7bKE3uRWs6EZvbWSqJtq7l5H9I32OywT
	 XJCeW/jPCiT2zDHVxG8oDPGY8bmkeZskXkurepsz+HrNMegZ8gXQXgeLXtMyO2j9eE
	 9GZn9+OcHBoHw==
Date: Tue, 1 Apr 2025 09:30:03 -0500
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>,
	devicetree-spec@vger.kernel.org
Subject: Re: [PATCH] chapter2: fix reference to chapter6
Message-ID: <20250401143003.GA3391926-robh@kernel.org>
References: <20250401114736.56670-1-rgallaispou@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401114736.56670-1-rgallaispou@gmail.com>

On Tue, Apr 01, 2025 at 01:47:36PM +0200, Raphael Gallais-Pou wrote:
> Appendix 6 is now chapter 6.
> 
> Closes #73
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  source/chapter2-devicetree-basics.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied.

Rob
