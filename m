Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90952505CB
	for <devicetree-spec@vger.kernel.org>; Mon,  9 Jun 2025 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475043; cv=none; b=JTHYOp4fULNU9wsPiaqcXM2CgkHRVwIN0mzK3g+f903pOM+YaJXrninZ2j6dJwjpMlDRFmwSTGXZ4QV30gRzISop8fZ3IphMmV6P8w5tXUP4rSHX/uGCcAvkQNdTv77uZHPTVhzNFmREoTa4JZIhMjmg2LBzGMS9q7rffrgE2jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475043; c=relaxed/simple;
	bh=LuVDEKGxU66sijPGlT5YQ3sNottR2bPyExR3nXFJ/oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmW+MA6fqPJVR+ngXuUm+muEy++IXvG9RGX+1oANyzq1FLdroNnAMKgY9Y4ezxtBZ1fx4hjDlYXlhibJx0yJ1eYgqIqSxWs328F4FCik7L7DSF+x1jd1OBN18oWWWsv/El3V+4978kDc7yWGSeDyR36ocZ77gobibudMU4rvPc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tx0IYJf6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tx0IYJf6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50954C4CEEB;
	Mon,  9 Jun 2025 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749475043;
	bh=LuVDEKGxU66sijPGlT5YQ3sNottR2bPyExR3nXFJ/oQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tx0IYJf6x35PgirBL66Sga4AH9ppFulzCm2Te2pPC1sV8f3GDIlnR5L4g752dPWD6
	 38aFAziw/VII/KzIVHDtJU5ssFB6gU+eN7OX3UA8Q3Khw+1oBHSrZ8s0bLBWBorp7O
	 DSoCL/uesgfY3chbIoz8OcvuQw+SMT4llGUFT9E0oLPBXQQPBUkY5+YOIp+tZ18xVz
	 19kHuMufWTD7aZ0J0Jr/id7wjlZOHTva5V4/eEnnFgBrACWq8dVOHO0LEMfANK/Y6c
	 JwvDAnP4yasi35b07rJ39l6mInlTm+JBO+k0gXGEp8irUw5DWnT6fR+t8ITJlRrN42
	 IEmELhu4JWBaw==
Date: Mon, 9 Jun 2025 08:17:22 -0500
From: Rob Herring <robh@kernel.org>
To: John Ernberg <john.ernberg@actia.se>
Cc: "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Subject: Re: [PATCH] meta-schemas: nodes: Allow if-then-else directly in
 patternProperties objects
Message-ID: <20250609131722.GB1737613-robh@kernel.org>
References: <20250609095929.1964499-1-john.ernberg@actia.se>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609095929.1964499-1-john.ernberg@actia.se>

On Mon, Jun 09, 2025 at 09:59:51AM +0000, John Ernberg wrote:
> Having local singular if-then-else statements under a patternProperties
> object-node causes a schema warning about an unexpected statement.
> 
> Allow this construct to reduce size of singular if-then-else blocks in
> this context, aligning the rules of them with the top-level.
> 
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> ---
>  dtschema/meta-schemas/nodes.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Rob
