Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B52A1FD4;
	Tue,  2 Dec 2025 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764670050; cv=none; b=Ifq6x5VZU57oi7U8hbdk0FdjrtR/CAhAapCcpE4pUoeMoWn8bPPPIKNP+trtBkivxxBPfMqGkx3oa37FE2WCvXH3AY/03MV7RRTDE6YGOcaPqhBjyW82rLrwUEwXpwc7kEcpLE2gOM/cxnFCPArsVZLjY06x91/PbX8KLK+pqQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764670050; c=relaxed/simple;
	bh=W1jo2FzA8QJoxuxxRreNhXS6x9rg2V/nqo9oprNWXdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tB7OdtLZ6kGLHSWMFtfRnda7Rwa9X2RFduJwUm1t2OD77f8tcimo/EMbzUsQKzrXdeQi5PViZVMYGoYMNFEVc2lSSDAa/K7ybtP3U+n9LX0eXLhhFnBnoBRKLsHhTyyzhUA8UcRjaL7q8+pcIXI968vlNM9i1seuEBwEmbl59F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Yli6UluX; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Yli6UluX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y4X378c6zWViriJYOw+/GaWx0jTGV641+tTTbHHjbUE=; b=Yli6UluXG0OSfp1fiFVJKP6b86
	v7Vd/S7/V6iHVWqxmjtK0aY0fwXPEeeqi04AvTAVUWTpu2PWXeRmq13ZRWNgP/qy7JPqYC6RRbquQ
	mc+w2JndO5GiOyDM7ZJtq6LwcL1iJNiUPBgA/83Me7YYxR6Ao8HaQ9uYSGTSJ1YpVP3K87i+pwSeN
	qIIlg11VUCTqpiKeIOfCbPbXQ0c22HyO+zExyynKHNGpnzIIDoPf0/2JrKoSEROI0qLqumcVhtBvP
	JoBL3jNSY5PGYSJvYu2p+b4yr7KKqft4X1SsQh67BLeO4wQre0qB9zvgM5H1ishiWlrbxyNpfZaAm
	yLx76HNw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54184)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vQNI3-000000001Y8-39xa;
	Tue, 02 Dec 2025 10:07:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vQNI2-000000007Ls-0GXs;
	Tue, 02 Dec 2025 10:07:22 +0000
Date: Tue, 2 Dec 2025 10:07:21 +0000
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
Message-ID: <aS66WcLPm6e5rdyk@shell.armlinux.org.uk>
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Nov 18, 2025 at 02:43:20PM -0800, Doug Anderson wrote:
> This is a continuation of the discussion that started in reply to my
> patch adding basic device trees for Pixel 10 phones [1].
> 
> 
> Problem statement:
> ------------------
> 
> We would like an officially accepted scheme that lets us more
> efficiently ship compiled device trees for a handful of related
> products by breaking the device trees up into a common "base" device
> tree and then applying "overlay" device trees atop the base to make a
> full and complete device tree.
> 
> To make it more concrete, we'd like to build a "base" device tree that
> describes a SoC and then have the overlays be enough to make a full
> description of a board. In theory, one could also imagine wanting to
> expand this to 3 or more levels (perhaps SoC, baseboard, derived
> boards), though this is not planned at this time.
> 
> The primary reason for wanting to break device trees like this is
> efficiency of the shipped binary device trees. A large portion of a
> final device tree just describes the SoC. We save space in the final
> compiled device trees if they don't need to contain as much duplicated
> information.

Having worked on the SolidRun i.MX6 platforms, I agree with this.
Within these platforms there are:

SoC	SOM		Platform
imx6dl	pre-v1.5	cubox
imx6q	v1.5		hummingboard
	v1.5 + emmc	hummingboard2

On top of these, I have specific "user" extensions for hardware that
I've connected - e.g.
- the NoIR RPi camera needs DT modification.
- for monitoring a mechanical church clock, a "gps" variant that
  allowed PPS to be used with a GPIO pin, and a "capture" variant
  that configured the hardware to allow precise event stamping.
- 1-wire, for ds18b20 temperature sensors.

Without the user extensions, this adds up to 18 DTB files:
arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i-emmc-som-v15.dts
arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i-som-v15.dts
arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i.dts
arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-emmc-som-v15.dts
arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-som-v15.dts
arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard.dts
arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts
arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts
arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts
arch/arm/boot/dts/nxp/imx/imx6q-cubox-i-emmc-som-v15.dts
arch/arm/boot/dts/nxp/imx/imx6q-cubox-i-som-v15.dts
arch/arm/boot/dts/nxp/imx/imx6q-cubox-i.dts
arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-emmc-som-v15.dts
arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-som-v15.dts
arch/arm/boot/dts/nxp/imx/imx6q-hummingboard.dts
arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts
arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dts
arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts

basically, every combination needs to be enumerated. So, having two SoC
dt files, three for the SOM, and three for the platform that the boot
loader combines would significantly cut this down - to 8.

However, it isn't that simple. For example, when the Hummingboard2 is
used with the iMX6Q SoC, there's a SATA device present in the SoC level
that needs Hummingboard2 specific properties to tune the signal
waveform. However, iMX6DL doesn't have this SATA device in silicon, so
the node doesn't exist in the base SoC DT file. The situation is the
same for Hummingboard, but the tuning parameters, being board specific,
are different.

This means is that there are DT properties that are dependent on the
SoC DT component and the platform DT component which do not fit with
splitting the DT files into their individual "component" levels.

The other issue would be the /model property - for example:

        model = "SolidRun HummingBoard2 Solo/DualLite";
        model = "SolidRun HummingBoard2 Solo/DualLite (1.5som+emmc)";
        model = "SolidRun HummingBoard2 Solo/DualLite (1.5som)";
        model = "SolidRun HummingBoard Solo/DualLite";
        model = "SolidRun HummingBoard2 Dual/Quad";
        model = "SolidRun Cubox-i Solo/DualLite";

as a set of examples. I don't see a clear way to generate these from
a fragmented scheme. There's a similar problem with the board-level
compatible:

        compatible = "solidrun,cubox-i/dl", "fsl,imx6dl";
        compatible = "solidrun,hummingboard2/dl", "fsl,imx6dl";
        compatible = "solidrun,hummingboard/dl", "fsl,imx6dl";
        compatible = "solidrun,hummingboard2/q", "fsl,imx6q";

These don't include the SoM information.

Maybe what would work would be a high-level DT file that contains
paths to the lower levels that need to be combined, along with
properties that need to be merged. E.g.

/ {
	model = "SolidRun HummingBoard2 Dual/Quad";
	compatible = "solidrun,hummingboard2/q", "fsl,imx6q";

	dts-components {
		compatible = "boot/dt";
		
		component@1 {
			compatible = "dt";
			path = "imx6q.dtbo";
		};

		component@2 {
			compatible = "dt";
			path = "imx6qdl-sr-som-v1.5.dtbo";
		};

		component@3 {
			compatible = "dt";
			path = "imx6qdl-hummingboard2.dtbo";
		};

		component@4 {
			compatible = "dt";
			path = "imx6ql-hummingboard2-emmc.dtbo";
		};
	};

	soc {
		sata@2200000 {
			.. sata tuning properties ..
		};
	};
};

Or something similar. However, this would mean we would still need the
18 or so top level DT files, but also each component as well, which
will increase the number of files we're having to manage on a target
platform - so I'm wondering whether it's worth it.

I don't think we'll be able to get away from this problem: it's likely
that there will continue to be properties that are specific across
several "levels" of a split DT setup, and apart from something like the
above, I don't really see a way to handle them.

I also don't see a sensible way without something like the above for a
boot loader to know the filenames of each of the components for a
platform - and it would need to be told the order to glue those
components together.

I would have liked to use overlays for these platforms, but ISTR they
either weren't supported at the time, or frowned upon, and even so I
can only see them working for the simplest of cases due to the issue
I mention above.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
