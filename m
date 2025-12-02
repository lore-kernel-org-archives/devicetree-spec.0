Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BC72EAD10
	for <devicetree-spec@vger.kernel.org>; Tue,  2 Dec 2025 20:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764706068; cv=none; b=aV4eI/YoH+Sd0nv8hUVMeNSCsCyFH1GRQ31YtvQ30YGJauelxToQeEwZUGTVj6mL1/w6YPeEt4NVto2ANtIzhDlDxYeFZmx+9vUXxHPSGmzSzWgJmIoez5zrH1sIjldeVgMRSxKIxXw8jFRu3CXkCPkQ5JmKjIQVvPnvHtrsAX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764706068; c=relaxed/simple;
	bh=O2vhRa1Ww4B2Sglvvf0EIXVX7N8syo6v9n4sg3VyvQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iv7UIHySQ2s3iU6by/AQGU9MGGWd157KI54wVm69K7JDN5vrjKoqHEdQHGU4yoqTUKIapSFrWIicmxM7ZNdqMsJVXYRPrBfe7X9EtIE4Lc6D7CUvkk82uIgfQCBY/eDtt0TFXJy9FMJ0V1z8DXtO2Ot6yHe3UXD7qh6f1qfvF4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qn/bfhMS; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qn/bfhMS"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so8669339a12.2
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 12:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764706065; x=1765310865; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K1Z1gpYyVlWN4964g+8VdhJkOzma6JMhAsAp5ym1zGM=;
        b=Qn/bfhMSxafyYueUyQbUUyhEVDVlUqz4nrO+i49WprPeaks3UY8+v2Xh60cFldxNDo
         5AmCmsodvqleHJ8xwbuv1V1pOpsYACuog1dmRbF747vIzAjDHjrFtCzo0CtVoqWegvPn
         pa/r2KItifcdnptGIf5B4QSZiFUWWaHfFTQDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764706065; x=1765310865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1Z1gpYyVlWN4964g+8VdhJkOzma6JMhAsAp5ym1zGM=;
        b=WsxGtFp+vs6qLo9HXSbwbbY1jR6RotPUwL7IvyB6i0hAnS/DsCk4/0IBNVrIvh8/nk
         Ta8AXOkQEdCy1LmLMRcKEni1YO0Gso3Lr0V8g+GEvDO40S/jx9z9J1z2XPnbxP/QWbjJ
         0y6XM/zyH9wujx7+RCJ5d1/dU9VA/tvZoksx/wRbLs6IgXaiuNvJ50LgLZWiE6C55BZG
         U+ZsEWA6G8Ypk9LR2/VrkYLZ8k7aFUW4u3gifv6+7g+WS8MfML5txTMr9MrlRG1evj4m
         NoVopiRdHxFGxQb7W9d6wu8/u6t7mB52jUGgI3akYtdL4OYeeD3ldT0KCz1jsggYquZ9
         RTYw==
X-Gm-Message-State: AOJu0YwaBRVpopj2AJwVxGyiuzLE7Voxx22RPEJ1aiWJyW+gEjzkAygD
	X8MSQCIn+nV3WqVHIOLIesJ9HcUSKtjBJzY7IsTmlRQ+W6RWh2Sq+AHXY3iYR8sCLgaGY1HKkcX
	IeVn55lPtQeEnOHvEUZoOu3H6Q+EwBFCduA7Sxqng62abSOUg4LewJw==
X-Gm-Gg: ASbGncsk+t3AB/szk6g9bwqWQiTG/KAHvi2grHy1pJMFcOUjoHKvH2ma63sCjFkHd+7
	21Gxbxt59JX+eFLRXZPzqvFXHP8hueSbpienRMGiqerdAcRuZB/zg52QfLnNn2n3327HD1A7KiO
	/pVzVmGj5/b+Y3xTEF/N0TeUIWZKDt33mFug+raD6ihUa0mFpjQw+q26IvZd6nFo7TD8RHsqTl4
	MOj+aiwDSqvHfFSvBqcwtfDIPKe0v5BJKYDkOU5Fk7cNjmfI3jsZtx7igNYARmHKfh7fdMzlw==
X-Google-Smtp-Source: AGHT+IHpNDvlQF6rrVzJte7nrF7RpWvOee7GviXU+nEM/LhRTuCAt8IXC4tPve/eMT8xSEnq+zf+mASWeYblufPu2p0=
X-Received: by 2002:a17:906:dc8b:b0:b79:b910:fd45 with SMTP id
 a640c23a62f3a-b79d118c79emr39330966b.38.1764706064920; Tue, 02 Dec 2025
 12:07:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
In-Reply-To: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 2 Dec 2025 20:07:32 +0000
X-Gm-Features: AWmQ_bnVY6hul7hU5okWO5b51z2U7n3Hx5WSWCXXOIPs5Du940FPVrwtuGaFSl4
Message-ID: <CAFLszTiVT9rHwympUJSehxaDR7ks9Bs2FVjYEuN6=j1e_-289Q@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Doug Anderson <dianders@chromium.org>
Cc: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug!

On Tue, 18 Nov 2025 at 22:43, Doug Anderson <dianders@chromium.org> wrote:
>
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
>
> A secondary reason for wanting to break device trees like this is to
> more nicely handle when a board has a socketed SoC that can be
> replaced with a finite (and small) number of different SoCs (usually
> revisions of the same SoC). Even if this secondary reason is
> considered invalid or too difficult, the primary reason still
> describes a compelling need.
>
> In order to make this proposal work, it's expected that a bootloader
> will understand the scheme and will know how to combine the overlay
> atop the base before passing a complete device tree to the main OS.
>
>
> Current state of the art (downstream):
> --------------------------------------
>
> In Android, we do a pretty good job of solving the stated problem
> using device tree overlays. We describe the SoCs in "dts" files and
> compile them into "dtb"s. We describe boards in "dtso" files and
> compile them into "dtbo" files. A bootloader can handle identifying
> the correct base and overlay (the scheme for doing this is a separate
> but related topic) and applying the overlay atop the base "dtb". This
> solution is fully implemented downstream for Android phones and is
> well documented [2].
>
> The issues I'm aware of with the current state of the art are:
>
> 1. In order for the base device tree to pass schema validation on its
> own we'd need to document the top-level compatible strings in the
> device tree. It is the opinion of at least some device tree
> maintainers that a SoC doesn't qualify as a top-level compatible
> string. This prevents the device trees from landing in an officially
> sanctioned location.
>
> 2. It is also possible we may fail schema validation for the base SoC
> tree if the schema marks a property as "required" but that property
> needs to be filled out by the board (perhaps a "-supply" is marked as
> "required", since most "-supply" properties are filled in by the
> board. I'm not sure this is a big issue, but it's something to think
> about.
>
> 3. It's unclear if there is any official "ABI" promised here once
> we've compiled and validated the base device tree on its own. Will
> people assume that they can have out-of-tree overlays derived from the
> base SoC tree and that those out-of-tree overlays will continue to
> work across changes / cleanups to the base? NOTE: this is a
> pre-existing question for existing device tree overlay usage, but the
> sheer quantity of nodes/properties that a board would be expected to
> overlay/modify in the base make the problem more prominent.
>
> 4. We want the final device tree's top-level compatible to be all the
> compatible strings from the board followed by all of the compatible
> strings for the SoC. When the board's overlay is applied to the base
> SoC tree, though, the board's top-level compatible fully replaces the
> compatible from the base SoC tree. This can be solved today for
> non-socketed boards by just duplicating the SoC compatible strings in
> the board overlays. We can't solve this today for socketed boards,
> though we can simply make sure that no software drivers rely on the
> specific SoC compatible string being present and thus we can ignore
> the problem.
>
> None of the above problems are big enough to have prevented widespread
> use of this scheme in downstream Android.
>
>
> Current state of the art (upstream):
> ------------------------------------
>
> Upstream if we have a pile of related boards, we do allow
> deduplicating things at a source-code level with "dtsi" files. We can
> have a SoC "dtsi" file and that file is included by all boards that
> use that SoC. When it comes time to validate or ship things, though,
> we only work with full devices trees. This means that we ship
> duplicated information.
>
>
> Proposal:
> ---------
>
> 1. Allow the top-level compatible string of an "incomplete" device
> tree to be documented so it can be validated on its own by tools. It's
> understood that this SoC is not a board by itself and we'd never boot
> a full OS with this device tree without adding an overlay that changes
> the top-level compatible. Add a top-level property to the device tree
> (perhaps "incomplete-compatible;") to indicate that the tree is not
> complete without an overlay.

or be more description, e.g.: compatible-scope = "soc"  - or just scope = "soc"

In other words, I don't think we should be frightened to define some
levels (soc, som, carrier, exxpansion, chassis?)

>
> 2. If it turns out to be needed (hopefully it's not), allow some type
> of syntax in yaml files that allows a property to be marked as
> "required" in a "complete" device tree but not in an "incomplete"
> device tree. Alternatively, we could discourage marking properties as
> "required" if they're expected to be filled in by a board.

Another option would be to validate the soc DT with a chosen board,
just as a workaround. It would probably be good enough.

>
> 3. Define that there is no promised ABI between "incomplete" device
> trees and anything not stored with them. Specifically, all valid
> combinations of "incomplete" device trees with overlays to complete
> them should be enumerated together with the "incomplete" device tree.

This seems important, yes.

>
> 4. When applying an overlay to a device tree that's "incomplete", the
> top level overlay will be merged instead of replaced.
>
> Example for 2 levels:
>
> base (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc";
> overlay compatible: "boardvendor,myboard-rev1", "boardvendor,myboard";
> merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
>                    "socvendor,mysoc-rev1", "socvendor,mysoc";
>
> Possible example if we support 3 levels:
>
> SoC (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc"
> overlay1 (incomplete) compatible: "referencevendor,referencecodename";
> overlay2 compatible: "boardvendor,myboard-rev1", "boardvendor,myboard"
> merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
>                    "referencevendor,reference-codename",
>                    "socvendor,mysoc-rev1", "socvendor,mysoc";
>
> Obviously in the 3-level scheme we need to know the order that
> overlays are applied, but that's true for overlays today anyway.
>
> The above proposal takes the current downstream "state of the art" and
> addresses the known issues, solving the original problem statement.
>
>
> Other thoughts:
> ---------------
>
> If you don't like the proposal, I'd be interested in knowing if you
> have other ideas for solving the original problem statement, or if you
> simply think the problem we're trying to solve here is an invalid one.
>
> I'm happy to post up another revision of my Pixel 10 device trees
> following this proof of concept (or other ones). My v1 was _very_
> close to this, but didn't have the "incomplete-compatible;" property
> and didn't implement top-level compatible merging.

This proposal seems good to me.

We don't need to worry about old bootloaders since they presumably are
not installed on new hardware. Assuming Linux adopts this proposal, I
am sure people will implement it in bootloaders when they need to.

Chen-Yu, thank you for the reminder re my extensions thing for FIT. I
had forgotten about that. Here are some current proposed FIT
additions, BTW, in case anyone is interested in taking a look:

https://github.com/open-source-firmware/flat-image-tree/pulls

Regards,
Simon


>
>
> [1] https://lore.kernel.org/r/20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid
> [2] https://source.android.com/docs/core/architecture/dto/partitions
>
