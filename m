Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93587D07D
	for <devicetree-spec@vger.kernel.org>; Mon, 31 Mar 2025 23:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743464425; cv=none; b=qFSNdxy/F9oen/4sZpseGzKy/oqYSnfb8TurYUhPkySthf2gLsDIM1/EhbFszyMOAyHtdGdMFecewIRMzDm6a7/lzKSk0VDGu38a6vUbpeQELtpuakabn1fhlaXdBoUze+ekkTTgGjJAKds+ElO4lfDIvOVbrfRbw1ZWIp0giT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743464425; c=relaxed/simple;
	bh=8lrWvIjsftzkEJETrErCTRH2OB7GpJFpZFonzyS4oYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgXhUI8K6b+OpfghnSRGNTXOET+8DWrXEokkf1GlPg7PPFFUB3Fg3OzREdJvWsOFNuXTyUivcCzxOLzawD3wUSimMPJ4oaKy5WcTuh1X5LwmKiuvpxIxQQTGn0z8MzRjqAFCMDAWLbtm8Lt6TaXzBrCZmgRo8UFesM1vNOXqg2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sf8srWPC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sf8srWPC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D902C4CEE3;
	Mon, 31 Mar 2025 23:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743464425;
	bh=8lrWvIjsftzkEJETrErCTRH2OB7GpJFpZFonzyS4oYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sf8srWPCnc1nYAJerqLOVDN9Uc9lOSC+6/ot1BQHIBDyvUOSDzhjLA79N0Z4eMcNN
	 UwmslzsH7FfeQsYiPE+qAt+f0PKsA6GrP5z486Mn6LZzv6QUICs0xZ/Ou2ZIq4MXnC
	 WKKg+4gw0+w4i4nYVSjZ1S7cISGMuS2N9olPZYV+x81IIWq8OfSISlmszd6tqXoC/g
	 /HQXKiHy0oONHeFNh9/76yN5OjlUY2soYTkGFIE5eIL8N+jOYuzHLSxHU3nKVePj7q
	 MDfxOZm214QjElVYWQDadkL+jE1A885z32SHThnha2G437MX7BaTBaCIbgo9++8AEn
	 E9vsc4bGg9eoA==
Date: Mon, 31 Mar 2025 18:40:24 -0500
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>,
	devicetree-spec@vger.kernel.org
Subject: Re: [PATCH] Add display-controller to list of generic node names
Message-ID: <20250331234024.GA2838596-robh@kernel.org>
References: <20250331200224.41184-1-rgallaispou@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331200224.41184-1-rgallaispou@gmail.com>

On Mon, Mar 31, 2025 at 10:02:24PM +0200, Raphael Gallais-Pou wrote:
> The device-tree specification does not present a generic node name for
> hardware compositors.  Several names are used, but 'display-controller'
> is the most straight-forward name to describe such device.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  source/chapter2-devicetree-basics.rst | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Rob

