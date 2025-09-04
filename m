Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2962A3128D5
	for <devicetree-spec@vger.kernel.org>; Thu,  4 Sep 2025 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996846; cv=none; b=KHoy/4HqxqOL5ktk3ZGaZPaDlsjuga675Jv1QIr3WFMkr7DmkbLI3Wn1/FUUYW//aTcc6KMT2E36+IJVU7cx6Mq+J9LhB1PrKc/AyhSiJm/YOKhbRH2JC+Q52nMtnYA7bZKPFYAKNB+rlE+GeAphe0ioSGrFgMlK8QlDWmiEQ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996846; c=relaxed/simple;
	bh=zqvvSo0TXB3FkNDe2btSaJpcFhEudIv8pOiajsXr31s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ts/bnSnY4dm6EjY9VbM7lUDZKHi3pvkjQluQkr11Qzf2M9o9+BIdR09nsZT1JnOIGv9KlmAx0PfpUR84EyT1hqgTQtq4YJ5nt1U35WKAqDLg6gXl+bTVcDiyGZ2t5ll9Ihu2+9tWGc9z4OXhSrPd4dJTT7v631wtO/kzo16lYSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mWXMFSc+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWXMFSc+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24c8ef94e5dso9574185ad.1
        for <devicetree-spec@vger.kernel.org>; Thu, 04 Sep 2025 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756996843; x=1757601643; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X1KqFT7E4GyG/SOTOK0WZOyrHnlFYC93qFLmJ/jKTrg=;
        b=mWXMFSc+nv912MUTbZw1rhQ3veUWkL1DVD9UaR10cg6KWPuP4PREbxcqQ8OtlrcD3x
         Hgn6hrjGwB4KxUm7MclsT880AgpZCxzclbMSiJxIUvO4261gNkKFUO621cCVMEzHdNwb
         tM1Gi5Cxcx79yqNQqYMFLQH5i5hLz2Y9+ArBcEHQzhQGODRcV8WOH/27SMODzDuiS0en
         23DhvjlPu+Jmbld5NfhXB7sgqnSjpPRXurwNrH7OFUHQsUZjnhjCkvzLjHoH2SZwqqnE
         elfc3eY434CEv4iYMjGuIv7/7WTOYYAu9QCWPbDvLvkTTtMmwJt/iSGNljBn0PlmVNNA
         BCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756996843; x=1757601643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1KqFT7E4GyG/SOTOK0WZOyrHnlFYC93qFLmJ/jKTrg=;
        b=EOLmhNrEaoOQ4OX2jo1Jh0JcE/eKvDxijkUlPf0AZAJ++qEi44A5O9ZFslPSggixxD
         /SvTihxjX6rDgsPTLz2EInMjwsz64jPjx3nfVLcBA8Fh/X9liDVGi6duX+0Ap4pQj1vY
         XMknYOHGSVOM6P1UNDIlC/8+e+T9GFAbT/9pZtyX5K2FUAdklaT1V1qrHuR1xRPYZLr2
         TliYA0cjREqjPZLdGzG76EV3c75kOyvSDwzZxIQwv5KZjBqGR28C2s2L4yKvH4aqrosM
         ZDvA9LVqF5gcw/YZVjqYKXWgQQVzG4P0juRmmXqW5XnaLBLsGGZUKuMzbRNWTStJ/9Fe
         kr7A==
X-Forwarded-Encrypted: i=1; AJvYcCX3dsUEGdNpLAWsArJTBgzYbOzL6abMi+qfoJ/PavTbjLBTUHR9HWRGDXi8qF3hGtzU84aYazGxM2HrA+B7ibw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXX//pZ0zQEfsGUZF1pN5MhYBgayxG2I/QZpTs2yBJiH4UBFnD
	UveiE+aHFH+KzllS3ubUjWV5AIxnt0CRVEaVr+PapjD5cPLyBWWLMsSlG5gWFsLzs1zy+ZXCHyV
	YIRGYiWX3NFOzpPGl9FRxM9o+Yv8m0I6EVMuwZXsfEA==
X-Gm-Gg: ASbGncuwgrJSdNSxT7Fj18i3o+Zf+e69VUOihUVkecAUHv8JVKpPoidcAQ4aAkzRJVv
	mqgmp8Lq3eCwhMtQeItpexW+qfchi9gHtpT0NH3WCF7MBvBZyYkY9okoVv6DiKzkMJrjDT6aYxN
	MfQLqzreNycnNSn/8+87G4VZOzFM4wuxgm6Yz4JSr0l30nKUbxaA/q/8ecCncnp7DiixUab8PTd
	vHW8ZyszQ==
X-Google-Smtp-Source: AGHT+IEivb/Ke5Y/N7ysCpClj2ior/OnU7zMvr6vUkDewWL8kJYVeAtE6EcqAr1FQN0FeRMUaS9AlSy/Yr3XQteFNac=
X-Received: by 2002:a17:902:f642:b0:234:986c:66cf with SMTP id
 d9443c01a7336-24944ac387bmr243602675ad.16.1756996843341; Thu, 04 Sep 2025
 07:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902174351.2457022-1-raymond.mao@linaro.org> <aLkAYitpWxWx131p@zatzit>
In-Reply-To: <aLkAYitpWxWx131p@zatzit>
From: Raymond Mao <raymond.mao@linaro.org>
Date: Thu, 4 Sep 2025 10:40:31 -0400
X-Gm-Features: Ac12FXxZk0dlcdKvvKrNgUzQLsHOKQcnK2_VUsguVb8gKm4aMWXeyWYtaEDYZ3I
Message-ID: <CAEfUkULwQxJ-EKT7bQ8+hkH+_xO8esThnL2P_Rc-32tHyMdA1A@mail.gmail.com>
Subject: Re: [PATCH v2] docs: devicetree: overlay-notes: recommend top-level
 compatible in DTSO
To: David Gibson <david@gibson.dropbear.id.au>
Cc: linux-doc@vger.kernel.org, devicetree-spec@vger.kernel.org, 
	devicetree@vger.kernel.org, ilias.apalodimas@linaro.org, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, 3 Sept 2025 at 22:58, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Tue, Sep 02, 2025 at 10:43:50AM -0700, Raymond Mao wrote:
> > When managing multiple base device trees and overlays in a structured
> > way (e.g. bundled in firmware or tools), it is helpful to identify the
> > intended target base DT for each overlay, which can be done via a
> > top-level compatible string in the overlay.
> >
> > This provides a way to identify which overlays should be applied once the
> > DT is selected for the case when a device have a common firmware binary
> > which only differs on the DT and overlays.
> >
> > This patch updates the document with a note and example for this
> > practice.
> > For more information on this firmware requirement, please see [1].
> >
> > [1] https://github.com/FirmwareHandoff/firmware_handoff/pull/74
>
> I think this idea is probably useful enough to be a good idea anyway.
> However, note that it leans in to an existing ugliness of the overlay format:
>
> Overlay dtbs kind of mix "in band" information - the actual new
> content for the tree - with "out of band" information - how to apply
> the overlay itself.  Whether a given property is data or metadata is
> determined by it's place in the tree in a moderately complex and not
> super obvious way.
>
> About the clearest divide that exists is that generally the root and
> first-level subnodes are information only for overlay application,
> everything under that is data to be applied to the tree.  This all
> tends to have names that would be unlikely (though not strictly
> impossible) in a fully applied tree.
>
> Putting 'compatible' at the root of the overlay is putting something
> that looks very much like a regular device tree property in a place
> and with a function that's purely about applying / validating the
> overlay itself.
>

Since all information at the root of an overlay is considered as
metadata (out-of-band),
If you think 'compatible' is confused, I can change it to
'overlay-compatible' - which should be 'unlikely' to exist in a full
tree.

Regards,
Raymond

> > Suggested-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Raymond Mao <raymond.mao@linaro.org>
> > ---
> > Changes in v2:
> > - Updated commit message.
> >
> >  Documentation/devicetree/overlay-notes.rst | 28 ++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/Documentation/devicetree/overlay-notes.rst b/Documentation/devicetree/overlay-notes.rst
> > index 35e79242af9a..30b142d1b2ee 100644
> > --- a/Documentation/devicetree/overlay-notes.rst
> > +++ b/Documentation/devicetree/overlay-notes.rst
> > @@ -103,6 +103,34 @@ The above bar.dtso example modified to use target path syntax is::
> >      ---- bar.dtso --------------------------------------------------------------
> >
> >
> > +Overlay identification
> > +----------------------
> > +
> > +When managing overlays dynamically or bundling multiple base device trees
> > +and overlays in a single system (e.g., in firmware, initramfs, or user-space
> > +tools), it becomes important to associate each overlay with its intended
> > +target base DT.
> > +
> > +To support this, overlays should include the top-level compatible string
> > +from its base DT.
> > +This enables higher-level software or firmware to identify which base DT
> > +an overlay is compatible with and apply it accordingly.
> > +
> > +Example usage::
> > +
> > +    ---- bar.dtso - overlay with top-level compatible string -------------------
> > +     /dts-v1/;
> > +     /plugin/;
> > +     compatible = "corp,foo";
>
> This is not valid dts syntax.  Properties must be within a node.
>
> > +
> > +     ...
> > +    ---- bar.dtso --------------------------------------------------------------
> > +
> > +This top-level compatible string is not required by the kernel overlay
> > +mechanism itself, but it is strongly recommended for managing overlays in
> > +scalable systems.
> > +
> > +
> >  Overlay in-kernel API
> >  --------------------------------
> >
> > --
> > 2.25.1
> >
> >
>
> --
> David Gibson (he or they)       | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you, not the other way
>                                 | around.
> http://www.ozlabs.org/~dgibson
