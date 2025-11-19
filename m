Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91E11B6CE9
	for <devicetree-spec@vger.kernel.org>; Wed, 19 Nov 2025 00:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763513182; cv=none; b=TQOP7UVetsZ34WKDo3aU4r4tfDtwdWNKkLWdTUXobDInH3Zm7nDsQ2I93Z9cmIhYn/MBG79SlHdWYakJ9Kf4Upf5qDgjRx0YoyRMAx19BbX7l6Nc7b0461ysALLRnvq6RvOcGKQqG4/2YDPVZL58qtFdxJRdAgPcQj88NgPhkA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763513182; c=relaxed/simple;
	bh=b0Mb5eZszzCSNqcIKBuWvMtHMqopg2Vn8gX+sYSWLlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=begMqShDjhTU6ywtjekGPujQVs8iSYuqKAEhpdvysPWHSBPTb2gmc/eKLQVCe+Vj6xBjoia4Yk+BaUEvvvZEMQmSSEtTZez9/rxacxZDq9/BVao5pT/+HwIH0ZWWb4G7jdp1bq30YfMupYB4HoONM9frjIvoyDk5mb34aWJKwNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BYA1ELd4; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BYA1ELd4"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso9883237a12.1
        for <devicetree-spec@vger.kernel.org>; Tue, 18 Nov 2025 16:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763513176; x=1764117976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAWJfMyV7DpF7HKG9h+AUHw17u4/yHqs9en8PSsCyqg=;
        b=BYA1ELd4Bn9h7i5JEeBldYFegAViWTpEJcZOzf6ajCpoanG/FHnW2W/JSRGjXGg70P
         3ZycKyQP4ciYOcEw0Zh8HZkoWw4mFMMTSe4nmIN2wgyLURs2RIH1CnQqLPwHj8sQk6xb
         5Ckzk6oA99tWg2IvF4ixhVlat2Ho+IiLDI/qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763513176; x=1764117976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BAWJfMyV7DpF7HKG9h+AUHw17u4/yHqs9en8PSsCyqg=;
        b=nCZSaQd0ZF1rWSOqRawDg2XaS6c+JtI/Qm8kbbQYDRJvYPgFpkEvUdHwQS16a3Tttm
         roLDH23uDqxUkj0Ofnk3RCZNQUjujNZnQWfGrJkgHkyrUHdaTGJgyZVj3FpYAGFR2A2P
         9rAqe8X+wxLWZmN5vxlNVO2pOMnHY4gykfm5ZAF5oV7Y0jw4RxRgpuLvqZJPCZK0nOi8
         VpR2g9lnWZyiJAAiGo01kCE9YKgZPrtpixZaYAzznea14eR3O5z4eomy0jFaWhjc19tF
         RY++LwtWzuCYqfdU/mgHxJwz0Wv6t1RH4jp5AbafUvEnAxxWc3NEhc5Waz6/hFL0hpHy
         StPA==
X-Gm-Message-State: AOJu0Yy1NsmETlFjxJMVVc6uu3dkFJXdrq/isl1+QuqC3I8KaQn17auc
	a90YhvjDoGWU3XKfUjSqnHw57frngacBk41+iI1kjvdFpNeWt+VnvkL6jMAcaruIJTon2HeKzNE
	NcYaTDmtq
X-Gm-Gg: ASbGncsYpT9Yi0Ot13PgRYAdNKXzS6xZf3et+RfndBxN7GEj47PF4E+cv6nGMhi1DMM
	+/xARSw/86F0Wlh22fkP9pOYGR679c5UDtMpImVBLSAZjc6Ktj7hZnL1byoAsEohaV85fm9JNYX
	Y2hJsrGfyHdvCRmfFEY7o+G8mRE9YtLJ9Fzl1+dUX2jXZITXs2+SSI1mVq1bBWdKfzrMytjdjt+
	rwYHRHBrs2je4w0I9S5+wemEWndMgoJAiucqS1I5gyekDTX8hmUFDG+XI8zEYxmJD3wu67OC8tu
	2hbYK45vfEIA7EXSbdIqLi6YnArl3Dr3D7R5kDmXKjiCLceZHYSbjAlTH0K1YqcEr0HahCL3hRg
	DUUDvASw4EEVvSKm1XzdOibcL5XHSwQGdXmnsfzF7gv5cbUUHrixz4CuhpOZZ5H3Ik2qLZRefyt
	SHXQy8NHiOj0M3Wsazg+p9l/KzR9jog8UeITphLHz+W130vxRucg==
X-Google-Smtp-Source: AGHT+IHCIA7as2XTIfS7QV/oTj/aAYo9XLk6GzRlQC54K9ajqlNqVr/tr3oWE2oNF0tNjf3NNVlc5w==
X-Received: by 2002:a05:6402:2714:b0:63c:4da1:9a10 with SMTP id 4fb4d7f45d1cf-64350ebcb2cmr15036485a12.31.1763513176240;
        Tue, 18 Nov 2025 16:46:16 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d82cfsm13768156a12.2.2025.11.18.16.46.13
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 16:46:14 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso4893913f8f.0
        for <devicetree-spec@vger.kernel.org>; Tue, 18 Nov 2025 16:46:13 -0800 (PST)
X-Received: by 2002:a05:6000:26c2:b0:427:526:16aa with SMTP id
 ffacd0b85a97d-42b5939cd70mr18021926f8f.58.1763513172970; Tue, 18 Nov 2025
 16:46:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAODwPW_51fKOfDQbTUFCum13M621Uxi2Zw2YHng0DrrwwvZhRQ@mail.gmail.com>
In-Reply-To: <CAODwPW_51fKOfDQbTUFCum13M621Uxi2Zw2YHng0DrrwwvZhRQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Nov 2025 16:46:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vb88hTz0kDxxKbU0G2yCqTgF9HwJAh6h68hf-cEtAurA@mail.gmail.com>
X-Gm-Features: AWmQ_bmE6F8y8blYKtFOlYYUsAOoXZxGgtId0c4_uNvCgfNxCdU3S4jDpKFXYPs
Message-ID: <CAD=FV=Vb88hTz0kDxxKbU0G2yCqTgF9HwJAh6h68hf-cEtAurA@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Julius Werner <jwerner@chromium.org>
Cc: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	yupingso@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 18, 2025 at 3:48=E2=80=AFPM Julius Werner <jwerner@chromium.org=
> wrote:
>
> > 4. When applying an overlay to a device tree that's "incomplete", the
> > top level overlay will be merged instead of replaced.
> >
> > Example for 2 levels:
> >
> > base (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc"=
;
> > overlay compatible: "boardvendor,myboard-rev1", "boardvendor,myboard";
> > merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
> >                    "socvendor,mysoc-rev1", "socvendor,mysoc";
> >
> > Possible example if we support 3 levels:
> >
> > SoC (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc"
> > overlay1 (incomplete) compatible: "referencevendor,referencecodename";
> > overlay2 compatible: "boardvendor,myboard-rev1", "boardvendor,myboard"
> > merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
> >                    "referencevendor,reference-codename",
> >                     , "socvendor,mysoc";
>
> Sorry, I only cursorily followed the previous discussion so I may have
> missed the exact need for this part. But I would caution against any
> proposal that changes the basic rules of how an overlay is applied.
> The definition of how overlays work has (I think?) been stable for
> over a decade now, and is implemented in bootloaders that often cannot
> easily be updated. I absolutely support your effort to get more
> upstream standardization for managing base device trees and overlays
> (which I think need to be flexible for arbitrary layers, not just SoC
> and board), but let's not break the overlay code in old bootloaders
> while doing it.
>
> Is there really a need to merge the compatible strings in your case? I
> think in the vast majority of platform identification cases, code only
> cares about matching the most precise string (i.e.
> "boardvendor,myboard-rev1"). If we do feel like having the whole chain
> of identification is necessary, it could be achieved by just
> copy&pasting the extra strings into the overlay file. If we have
> cross-validation between base and overlay source files we could also
> have the validation check that the overlays correctly contain all
> compatible strings from their base tree. If we know that the base
> trees aren't standalone anyway, we could also just invent other
> property names that identify them (e.g. `soc-compatible =3D
> "socvendor,mysoc";`). Anything other than breaking the overlay format
> would be preferable in my opinion.

I'm certainly not dead-set on it and I definitely realize it would be
a pain. ...though it wouldn't necessarily "break" the format--you just
wouldn't be able to use any "incomplete" DTBs unless you implemented
this new feature.

From my point of view, the main issue the merging solves is handling
"socketed" boards that could have any of a small number of SoCs
plugged into them (usually minor revs of the same SoC). It's not the
absolutely most critical use case in the world, but I know that we
will need it in-house and I'm trying to come up with a solution that
will work everywhere. Once we decide to go with a downstream solution
just for that one use case then there's no reason not to do everything
else in a downstream manner.

Personally, I've never really loved that the SoC compatible strings
are conventionally just jammed onto the end of the top-level
compatible and I'm totally happy with it being elsewhere (a different
property, a different node, etc). Mostly I ended up with this merging
scheme because I thought that was what DT folks were pushing for. If
I'm wrong then I'm more than happy with a different scheme.


> I also feel like we need a better standardized way to tie base device
> trees to overlays, like your `/loaders` node proposal in an earlier
> email, although maybe that's an orthogonal discussion (but related,
> especially if there's supposed to be cross-validation between base
> trees and overlays). The compatible string is just not a scalable way
> for bootloaders to make this determination, there may be a lot more
> differentiation than just "SoC" and "board", and the scheme almost
> certainly needs to be platform/bootloader-specific because every
> hardware vendor has their own ideas about how to group and reuse parts
> of a platform. This information doesn't necessarily need to be *in*
> the device tree, it could also just be in a separate YAML file in the
> same repo (since bootloaders will almost certainly want to have it
> transformed into their own out-of-band descriptor at build-time
> anyway, so that they can compress the device tree itself and don't
> have to decompress each one for matching), but it needs to be
> somewhere.

Yes, I totally agree and this is an important conversation to have
too. I still like the "/loaders" proposal but I'm not dead-set on it.

That being said, the two problems are separate even if they're related
to each other. I was attempting to focus on allowing the base DTBs to
land first and once we get agreement then move onto the second. I'll
also note that Chen-Yu is talking about the problem at Linux Plumbers.
I won't be there, but I'm going to try to attend that session
remotely.

-Doug
