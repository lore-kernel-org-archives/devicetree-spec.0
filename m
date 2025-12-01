Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE3E338596;
	Mon,  1 Dec 2025 18:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764613732; cv=none; b=IFZjwogdkX2p8lSOO2Df3VknbrmiPx/09aEE1aaGfHS7Dn9JvL70zzIkz+2Vzmuv5bYsH0pYN0rZPbRkATu3Qh+Lvsex9Y0Fel4m0R2QiabZduIgHMCxtUl0AO/cBAfjUsYHd0/kpIbnpIm+IcejC0mzBo3HLIN8Iw2tjDawyTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764613732; c=relaxed/simple;
	bh=TC6rh/kNz8LYPMfZwTGd9bvg33O4XvZBRbYSpzqFZG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0ANBEbKE7KG/duZthTXxQdPu912xeilemd3cmZI6GHPNMzhwtLxXULoeVuQMx6KElG3CHS4Y4pEZjEmyvtpVf8HI7lRCyQ/wzcAzNirq4IUfOp21WiHVt3nt8mGTxfAITf0NWl9A8CwulpULDp+ZD+nfyShl0c8jPx8BoKjSnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=xYA6t3rF; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="xYA6t3rF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Jasc+4JKJtGpQrZOc1NYVylmCxu8hHyDpwp8Z4XDuU4=; b=xYA6t3rFlF5To9WmQjm52MkdgC
	XNzLt48v8379dncpuux52Rkre35pzHQe5rk8CVzYA7Wk4odgr75tlBzz7DtdfSuFBLwx/ilOH7n2F
	8hBpLrpjWQkqb+npDxJSg95I4JQjYVO/IY6Mo9Y0T2UYzxy+MvtRLBQKATc/nFuOiko6EDRE9mgkd
	nNr6wYf5wAX1STUFYPWZW5DHddGxsuKhfeenI/1DR2LJ9gzB5k7MPDAPn+NXV27jMRbRngowGU9tY
	UyX1jqkDZDyFRrsOlIEl9Fh67z0Ar4Z78ePVJX/jQwt+aNjh+qAcRgP+ZnmxlS10UOxIBRjOjjL11
	ribHx3hw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49772)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vQ8di-000000000vx-41Yr;
	Mon, 01 Dec 2025 18:28:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vQ8dg-000000006gH-3zO9;
	Mon, 01 Dec 2025 18:28:44 +0000
Date: Mon, 1 Dec 2025 18:28:44 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Doug Anderson <dianders@chromium.org>
Cc: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	William McVicker <willmcvicker@google.com>,
	Julius Werner <jwerner@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
Message-ID: <aS3eXBDtaoNLfxZy@shell.armlinux.org.uk>
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAD=FV=UbejKdD2q2Z3RuYH0Ooc6XRb0oynchDsqnq7GzM6ah0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UbejKdD2q2Z3RuYH0Ooc6XRb0oynchDsqnq7GzM6ah0w@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Dec 01, 2025 at 09:42:40AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Tue, Nov 18, 2025 at 2:43 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > This is a continuation of the discussion that started in reply to my
> > patch adding basic device trees for Pixel 10 phones [1].
> >
> >
> > Problem statement:
> > ------------------
> >
> > We would like an officially accepted scheme that lets us more
> > efficiently ship compiled device trees for a handful of related
> > products by breaking the device trees up into a common "base" device
> > tree and then applying "overlay" device trees atop the base to make a
> > full and complete device tree.
> >
> > To make it more concrete, we'd like to build a "base" device tree that
> > describes a SoC and then have the overlays be enough to make a full
> > description of a board. In theory, one could also imagine wanting to
> > expand this to 3 or more levels (perhaps SoC, baseboard, derived
> > boards), though this is not planned at this time.
> >
> > The primary reason for wanting to break device trees like this is
> > efficiency of the shipped binary device trees. A large portion of a
> > final device tree just describes the SoC. We save space in the final
> > compiled device trees if they don't need to contain as much duplicated
> > information.
> >
> > A secondary reason for wanting to break device trees like this is to
> > more nicely handle when a board has a socketed SoC that can be
> > replaced with a finite (and small) number of different SoCs (usually
> > revisions of the same SoC). Even if this secondary reason is
> > considered invalid or too difficult, the primary reason still
> > describes a compelling need.
> >
> > In order to make this proposal work, it's expected that a bootloader
> > will understand the scheme and will know how to combine the overlay
> > atop the base before passing a complete device tree to the main OS.
> 
> It's been roughly two weeks since I sent out this proposal. Do DT
> folks have any comments? Are the goals I have stated understood? Do
> people agree that these goals are reasonable? Is there any question
> that there is a need to solve these problems not just for Google, but
> for the community as a whole? I'm happy to reach out to people and
> have them reply "yes, I have this problem too" if it would somehow
> help. I don't doubt that there are still people at Qualcomm who would
> like a solution even if I think Elliot isn't driving it there
> anymore...
> 
> How do we make forward progress? Does anyone have any comments on
> Julius's reply? At the moment, I think there are some conflicts with
> what Julius would like to see (no changes to the rules for how
> overlays are applied) and what Rob said previously (we need to find
> some way to combine the compatible strings). Did I misunderstand? Can
> we find a common ground?

My feeling on this (and I don't have much time to consider it tonight)
is that this isn't going to get a quick answer.

This answer is based on my authorship of various device trees, and is
solely my own opinion, and in no way represents any position by my
employer.

While the DT files are dual-licensed, the license that applies to the
copy in the kernel is GPL v2, because the kernel as a whole is GPL v2
licensed. The dual-licensing of the DT files is to permit them to be
taken from the kernel and used in e.g. boot loaders etc.

However, as the license that applies to the kernel copy is GPL v2, and
GPL v2 requires distribution in source code form, or an offer valid
for two years of the corresponding source code etc (check the GPL v2
for the exact terms) it could be inappropriate for the kernel tree
to distribute binary DT blobs without their corresponding source.

It seems to me that this is a problem for lawyers, and you're probably
not going to get a quick answer on it.

So, I'd suggest patience, and don't expect this topic to move quickly.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
