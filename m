Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882C4189906;
	Fri, 19 Dec 2025 02:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766111966; cv=none; b=BN7PI0Rb8vZCFPbT6WyLLtKemtd04NVIka0ty/dbV+ZKPqpq1hVnL8rHWo5H52l0IvfUf0OZ/xhLRwR1vSrcBCRxBFWzqD/Edr4FtjqLYU7047BI+sCtZuUtm57+RY0s7BkqfSe5YEI13PV5Vj0EFiAw7KkN2uZy95KhA4rPaVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766111966; c=relaxed/simple;
	bh=7IUOjAyePqdykfhXMd4t09CcOZEG1knBtCabVjaugCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNgO/yuaWL6PiBLrJHkXVlgAwN16fDoHEx+IWBgsRmma0fKG4SgOZl3o7p8pPUeWb5ANAmLrhlpqDPCm3D6GRHIV0WT3di2bQFPPZgCtj1kmtRQKGHlBGYOT4M92pJCM3I+OtQxnqzHzcZIz9Uw3Dx5bpTOQzKuYftuP7IRpCic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mg90TfVc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mg90TfVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A750C4CEFB;
	Fri, 19 Dec 2025 02:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766111966;
	bh=7IUOjAyePqdykfhXMd4t09CcOZEG1knBtCabVjaugCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mg90TfVcIDApYeayYlZMvkaOmOzHV0fVZRyDovM7aS35LlqbmF5m6xTT92DDTOFLt
	 TZRTGu5zbtmX9ZxgK6MuutgX2Ktfj2Ux4txQEdReEdWMoqepjkQYu7y/d/yiP80yFd
	 NVSdfhhp86r74YeXIF3jN2wrXTRGU3OOYNyPKQudjX2eNU3hR/aVlwCrV9DUHljsKj
	 LpwlKL4py/vpy/cbsQUN2zTp1Q/JXpqUJJGN8RG/Sfv+AK2Q8OaXrlCX3BLk6SqeUg
	 YGPpFHvo3IC05Vg0a2B7ehvVN3CZkWt3RTvIdR4nx5D5j474jNFTvRWlLvC31VbLn9
	 +lKv7CK0nb7aw==
Date: Thu, 18 Dec 2025 20:39:22 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Doug Anderson <dianders@google.com>
Cc: devicetree-spec@vger.kernel.org, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, William McVicker <willmcvicker@google.com>, 
	Julius Werner <jwerner@chromium.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Simon Glass <sjg@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Subject: Re: Proposal: document where SoC info belongs
Message-ID: <qjpukes4etbgh4ncapec4v6okkiohlcqqdfvjfinyrj6olaryc@l3vspbwze7ri>
References: <CAD=FV=W+jE_L_LLgAhD8K_4+CtivSD9-9t7Xe63XuKrKjfyfeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=W+jE_L_LLgAhD8K_4+CtivSD9-9t7Xe63XuKrKjfyfeQ@mail.gmail.com>

On Thu, Dec 18, 2025 at 02:56:03PM -0800, Doug Anderson wrote:
> Hi,
> 
> To try to move things along, I'm picking a small piece out of my
> previous discussion [1] to see if we can make some progress.
> 
> Right now, the top-level "compatible" string in a dts file usually
> contains one or more strings to represent the SoC. Examples chosen
> semi-randomly:
> 
> exynos5250-snow.dts:
> - compatible: "google,snow-rev4", "google,snow", "samsung,exynos5250",
> "samsung,exynos5"
> - SoC: "samsung,exynos5250", "samsung,exynos5"
> 
> sun20i-d1-clockworkpi-v3.14.dts:
> - compatible: "clockwork,r-01-clockworkpi-v3.14", "allwinner,sun20i-d1"
> - SoC: "allwinner,sun20i-d1"
> 
> sdm845-db845c.dts:
> - compatible: "thundercomm,db845c", "qcom,sdm845"
> - SoC: "qcom,sdm845"
> 
> I propose that we DEPRECATE including SoC information in the top-level
> compatible string and move it elsewhere. I propose these top-level
> properties that should be used instead:
> 
> soc-family-compatible = "vendor,family";
> soc-product-id = <0x1234>;
> soc-product-variant = <0x1234>;
> soc-product-description = "Something";
> soc-major-rev = <0x1234>;
> soc-minor-rev = <0x1234>;
> soc-sub-rev = <0x1234>;

So these 6 properties defines the soc itself? And the rules for how a
bootloader matches against these 6 properties is defined elsewhere?

What about "PCB" name and version?

How about the case where my product has 5 different components that
might come from a second source?

Are you proposing that we allow adding arbitrary properties matching
some pattern in the top-level node to facilitate matching? Presumably
defined in some combination of vendor bindings?

> 
> The family-compatible would be VERY high-level and is not intended to
> be a marketing name. It would be something like "samsung,exynos",
> "nvidia,tegra" or "google,google-silicon". The ONLY goal for this
> string is that within a family, the other properties uniquely identify
> a given SoC. This is a SINGLE string, NOT a list of strings. There is
> no concept of being part of multiple families.
> 
> All the other numbers are hopefully self-explanatory. These values
> could be absent (assumed 0) if they don't make sense for a given SoC.
> 
> The soc-product-description is designed to be some nice name that
> represents the family, product-id, and product-variant but _not_ the
> rev (since that's easy for anyone who cares to represent it as "rev
> X.Y.Z")
> 
> 
> The goals here are:
> * Stop trying to jam so much into the top-level "compatible".
> * Make it one step easier for bootloaders (or code packaging device
> trees for bootloaders) to differentiate device trees / overlays. This
> isn't _enough_ since this proposal doesn't include board info, but
> it's a place to start.
> * Make it easier to deal with "socketed" boards where the SoC can be replaced.
> 
> NOTE: if a set of devicetrees is provided to a bootloader, it could
> not just look at these properties to help it pick a devicetree but it
> could also change the properties to be more detailed (it could fill in
> some of the minor/sub-revs, for instance).
> 
> 
> I think this is a positive change for everyone and a cleaner way to
> represent things even if you aren't dealing with the above problems.
> 
> What I'm looking for from people is some responses. Folks could choose:
> 
> A) Yes, this is great. We already have something like this and we'd
> switch to your properties if it became a standard.
> 

We have qcom,msm-id; qcom,board-id; qcom,pmic-id; these have met the
needs of some, but generally it lacks multiple axis.

> B) I like the idea, but I need an extra property to represent my SoC
> and then I'd use it.
> 

s/an/several/

> C) I like the idea and I'd use it, but with some changes.
> 
> D) We don't have anything like this today, but it sounds useful.
> 
> E) Why are you wasting my time? This isn't a useful problem. The SoC
> belongs in the top-level compatible string, period.
> 

We do have functionality that relates to the generic soc name,
(qcom,sdm845 in your example above). Extracting it into something else
would imply that we need to check against soc-family-compatible?

But when it comes to bootloaders picking the appropriate compatible,
I've seen plenty of cases where basing it on compatible would be nasty.

E.g. how do you write your string matching routine such that it allows
all the different axis, where some are optional, some allows fallback to
previous minor revisions of the chip etc.

Regards,
Bjorn

> F) Other (please specify)
> 
> 
> FWIW, from chatting with Rob Herring offline, my understanding is:
> * He doesn't think that using the "soc@0" is the right place for these
> properties.
> * He didn't seem enthusiastic about adding a new node and was more
> amenable to adding properties, which is why I added a pile of
> top-level properties.
> 
> 
> [1] https://lore.kernel.org/r/CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com
