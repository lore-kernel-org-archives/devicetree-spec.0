Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A67C1F463E
	for <devicetree-spec@vger.kernel.org>; Tue, 18 Nov 2025 22:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763506265; cv=none; b=BS6Qy5COdUoPMUQw8rEL7cLeRkY5AcK5jzgBMzD1yOxGqqEdrnnUFrcT7CdSvxmBcWXN86PpYUDU5QbndqRNdQrYnbVscTOmFkRh6nVU2OMqfsY1bh9dfxAn0iWqiR2z4ggcXdiyiPfVlr7+zPvzbrbwsi/o47EbDfSHTpP0YnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763506265; c=relaxed/simple;
	bh=4gDRJV1kRwgMI3s3YQcbphdfEkv2lyiSpZHPXrNLNWk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mRlStXTm2Pa/XuqpGJHqepDZz24TnWXU6Ry7+YkEDWRVpeuzKXRbkcDH3c+SITEQOmmI8Snb1F/aHx8+RuIeX2vUBvhfAAPiDPHmfUnvCj7orYgFwZRwLm7UNiKHcPnytcdFym3bfJfinkbi2pI8b5sQFsUS8w/S5jwSCsKUXMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dHMA1VxZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dHMA1VxZ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so914124466b.3
        for <devicetree-spec@vger.kernel.org>; Tue, 18 Nov 2025 14:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763506260; x=1764111060; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H80IEDD5SztQTOwQNxdUh5iH8SZS9qkZgSnNnJ77XOA=;
        b=dHMA1VxZcq5fWxHFpQxGftw+hfjg4xNPUPllDammvK5SirPOhxyydr59nONdB3INRu
         BstZ3LEbUGfCFwNZWxVbC0N4pULifNPSmt1qXCquwyjetl3dspRtpYY6BvAXrcDEmD8n
         i9egyZsrZSx0f5F/l6hBcAI7k4gjyVN7+XBZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506260; x=1764111060;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H80IEDD5SztQTOwQNxdUh5iH8SZS9qkZgSnNnJ77XOA=;
        b=m5D3nX0hQC+hVwKkT3PFds7HCQmgAA3k1LLNFbs6hnhjQjPsgoaSl1NAOlBR+PnYum
         GwYx7wzwPzaMsaNpZgrSosKhW04+atE+S51gVrbfHm+gdA7v7qdJoI4okl3k54xg/ssI
         Vb1wsmLmQLrG5s8R9u5nW1M9HCA8dzSoTQ37Xts0FcV7pzJo3v2gypGgSZOfPVKfc+7+
         PkDbG8Ox+S+zdlJXzguwypPLxqH3qfMa7jKNpZo6pYclaiipU/yRzbAj86iu9XGdaTdC
         H9WkcjSO7hKAiGX9gHMr0XrkIhacnNjutlcNdGS9WLJJPSJ3esx5HC0VXc40cEiN2EGn
         Y8mw==
X-Gm-Message-State: AOJu0YwzRDitnuTQK5Hu0yfMzS41mRMN6dRL5zYSo8OyYscOAo72Tjtd
	VLpuJR1BO8UNMYEfXKhUf6TwUH5IyrvYL8MqBi3WIznW8Gosz2S6KrW/a1jUvmbJQtBHaOJAMdS
	ubhfQZF8n
X-Gm-Gg: ASbGncvSQiynhfJTAXLAFpC87nqTDgv+e6dRPvzhcvExbBvaYlQzmobkOdnhlmQAQLy
	0LyVJoCsNFBDf/w1kiQOB1xt+U4sqqlFEOI0iYphMqUKPvw9kJxuXIBYhdkdEl8DFQUbb85wcnw
	cGHtN1b4mUO//VNxz2UCeT8Sj+5RNfKucelSBIVJUVxEVEnNuHv4Yp1v5dYsppREEPRZ08RbkYK
	xjC2/NvBLlQgzvXDNt050CtJwNUJKuRWFpl7rCcosqsLG+jEiQrSh0fp3PZfZm82kGWSEnicsGB
	paEGt+98MojKRFS4hlNQV5STE3kZrE6nDl0oxfmD5F64xqBjKb1t1YiLLVjFJT4G07/cuR7QtJ3
	AeSFmDylwYZJTBbgcqIHu9f8Be8819XsGZQn882FzKONTs61n2v6f2PDRqItG78jsZQbKuHN5vE
	69TnkiRakvWklvmhrXOQLHQdEbV5CUlFJy0MNc8REEiVc/rTnocg==
X-Google-Smtp-Source: AGHT+IGx3Ov4nPvqQu+F99hKNE8H1iNv7esBG88kFSy2Chg8zTYnsXEZ3lmWz0ASr6hqa6iHFaZQ6A==
X-Received: by 2002:a17:907:6d0b:b0:b73:58b4:1247 with SMTP id a640c23a62f3a-b7367926438mr1873521766b.25.1763506260089;
        Tue, 18 Nov 2025 14:51:00 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdaf30dsm1459797666b.60.2025.11.18.14.50.59
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 14:50:59 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso10596087a12.3
        for <devicetree-spec@vger.kernel.org>; Tue, 18 Nov 2025 14:50:59 -0800 (PST)
X-Received: by 2002:a05:6000:4285:b0:429:d0b8:3850 with SMTP id
 ffacd0b85a97d-42b59373560mr15721916f8f.48.1763505811684; Tue, 18 Nov 2025
 14:43:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Nov 2025 14:43:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
X-Gm-Features: AWmQ_bll7WeW0i59nxOAqQR7FvjUYkkrtgy-Zj5as_5uRuWHBgIIpodvLfSaXG8
Message-ID: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
Subject: Proposal: Officially allow "incomplete" trees as a base
To: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

This is a continuation of the discussion that started in reply to my
patch adding basic device trees for Pixel 10 phones [1].


Problem statement:
------------------

We would like an officially accepted scheme that lets us more
efficiently ship compiled device trees for a handful of related
products by breaking the device trees up into a common "base" device
tree and then applying "overlay" device trees atop the base to make a
full and complete device tree.

To make it more concrete, we'd like to build a "base" device tree that
describes a SoC and then have the overlays be enough to make a full
description of a board. In theory, one could also imagine wanting to
expand this to 3 or more levels (perhaps SoC, baseboard, derived
boards), though this is not planned at this time.

The primary reason for wanting to break device trees like this is
efficiency of the shipped binary device trees. A large portion of a
final device tree just describes the SoC. We save space in the final
compiled device trees if they don't need to contain as much duplicated
information.

A secondary reason for wanting to break device trees like this is to
more nicely handle when a board has a socketed SoC that can be
replaced with a finite (and small) number of different SoCs (usually
revisions of the same SoC). Even if this secondary reason is
considered invalid or too difficult, the primary reason still
describes a compelling need.

In order to make this proposal work, it's expected that a bootloader
will understand the scheme and will know how to combine the overlay
atop the base before passing a complete device tree to the main OS.


Current state of the art (downstream):
--------------------------------------

In Android, we do a pretty good job of solving the stated problem
using device tree overlays. We describe the SoCs in "dts" files and
compile them into "dtb"s. We describe boards in "dtso" files and
compile them into "dtbo" files. A bootloader can handle identifying
the correct base and overlay (the scheme for doing this is a separate
but related topic) and applying the overlay atop the base "dtb". This
solution is fully implemented downstream for Android phones and is
well documented [2].

The issues I'm aware of with the current state of the art are:

1. In order for the base device tree to pass schema validation on its
own we'd need to document the top-level compatible strings in the
device tree. It is the opinion of at least some device tree
maintainers that a SoC doesn't qualify as a top-level compatible
string. This prevents the device trees from landing in an officially
sanctioned location.

2. It is also possible we may fail schema validation for the base SoC
tree if the schema marks a property as "required" but that property
needs to be filled out by the board (perhaps a "-supply" is marked as
"required", since most "-supply" properties are filled in by the
board. I'm not sure this is a big issue, but it's something to think
about.

3. It's unclear if there is any official "ABI" promised here once
we've compiled and validated the base device tree on its own. Will
people assume that they can have out-of-tree overlays derived from the
base SoC tree and that those out-of-tree overlays will continue to
work across changes / cleanups to the base? NOTE: this is a
pre-existing question for existing device tree overlay usage, but the
sheer quantity of nodes/properties that a board would be expected to
overlay/modify in the base make the problem more prominent.

4. We want the final device tree's top-level compatible to be all the
compatible strings from the board followed by all of the compatible
strings for the SoC. When the board's overlay is applied to the base
SoC tree, though, the board's top-level compatible fully replaces the
compatible from the base SoC tree. This can be solved today for
non-socketed boards by just duplicating the SoC compatible strings in
the board overlays. We can't solve this today for socketed boards,
though we can simply make sure that no software drivers rely on the
specific SoC compatible string being present and thus we can ignore
the problem.

None of the above problems are big enough to have prevented widespread
use of this scheme in downstream Android.


Current state of the art (upstream):
------------------------------------

Upstream if we have a pile of related boards, we do allow
deduplicating things at a source-code level with "dtsi" files. We can
have a SoC "dtsi" file and that file is included by all boards that
use that SoC. When it comes time to validate or ship things, though,
we only work with full devices trees. This means that we ship
duplicated information.


Proposal:
---------

1. Allow the top-level compatible string of an "incomplete" device
tree to be documented so it can be validated on its own by tools. It's
understood that this SoC is not a board by itself and we'd never boot
a full OS with this device tree without adding an overlay that changes
the top-level compatible. Add a top-level property to the device tree
(perhaps "incomplete-compatible;") to indicate that the tree is not
complete without an overlay.

2. If it turns out to be needed (hopefully it's not), allow some type
of syntax in yaml files that allows a property to be marked as
"required" in a "complete" device tree but not in an "incomplete"
device tree. Alternatively, we could discourage marking properties as
"required" if they're expected to be filled in by a board.

3. Define that there is no promised ABI between "incomplete" device
trees and anything not stored with them. Specifically, all valid
combinations of "incomplete" device trees with overlays to complete
them should be enumerated together with the "incomplete" device tree.

4. When applying an overlay to a device tree that's "incomplete", the
top level overlay will be merged instead of replaced.

Example for 2 levels:

base (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc";
overlay compatible: "boardvendor,myboard-rev1", "boardvendor,myboard";
merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
                   "socvendor,mysoc-rev1", "socvendor,mysoc";

Possible example if we support 3 levels:

SoC (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc"
overlay1 (incomplete) compatible: "referencevendor,referencecodename";
overlay2 compatible: "boardvendor,myboard-rev1", "boardvendor,myboard"
merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
                   "referencevendor,reference-codename",
                   "socvendor,mysoc-rev1", "socvendor,mysoc";

Obviously in the 3-level scheme we need to know the order that
overlays are applied, but that's true for overlays today anyway.

The above proposal takes the current downstream "state of the art" and
addresses the known issues, solving the original problem statement.


Other thoughts:
---------------

If you don't like the proposal, I'd be interested in knowing if you
have other ideas for solving the original problem statement, or if you
simply think the problem we're trying to solve here is an invalid one.

I'm happy to post up another revision of my Pixel 10 device trees
following this proof of concept (or other ones). My v1 was _very_
close to this, but didn't have the "incomplete-compatible;" property
and didn't implement top-level compatible merging.


[1] https://lore.kernel.org/r/20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid
[2] https://source.android.com/docs/core/architecture/dto/partitions
