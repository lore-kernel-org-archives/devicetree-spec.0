Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF711204F93
	for <devicetree-spec@vger.kernel.org>; Tue,  2 Dec 2025 22:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764713266; cv=none; b=Mdq8NE29yTnG3pTURCLtzbvwmzIcD7MnmMybtKIULyoc7W/BPNvgNWUHFc8qcCxY3r8FhVVIIWNEhfFdOW6HoIEp3eYlLLfyhz0kXG3J2zLTAbPzp3SQjOw2gyx7D+gukLmhKjOLoIzx0i90yJPovK0F3HFyUgBlw8+5L161WcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764713266; c=relaxed/simple;
	bh=eBD4gOrC3LaRB8AsbzyAfhHTBnlgO531KCaqBO5JwiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVfrt2J41dNZBspyR2119QeTFoYWraz28Mggt38CwJTHj5lluUeccwositFDc6xrIqx5KgeVqbVz3+UtpGs7c7YvMTjPiQ9RGurBPWCR/l31EfasCP6z07j6szAzVUYIoUiXF8TAxEe2mChfVz6StciiLoGcx4chmIfBoGa8+pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CcbbrZbV; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CcbbrZbV"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64175dfc338so11047342a12.0
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 14:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764713262; x=1765318062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N8ENlMp0JtUvDjwpbGXfIGBmY/pHGb1XQuUiLpAW3Q=;
        b=CcbbrZbVczxT2SoBB+a/jlp2+U/3F5jPePtCwMu9fh0bWwBpaD5n2YsWvfErmuOe8l
         JaAvq5EolLThpHY0RmoN73dDTDcqHowU8Vykx4eQKQ2PNhIMQ0TuKiw/205QVOhTbY9I
         SaG87EF9jhVg4/lTYSt2Sv3Jqv0d25TCZOih4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713262; x=1765318062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6N8ENlMp0JtUvDjwpbGXfIGBmY/pHGb1XQuUiLpAW3Q=;
        b=FOAEPSa79GrRATeJhH70SOPxlh8+HOz5M5vPPOJ5i5sPF9ZY+30e0ywPzqwsoLi0MG
         Sk8RpVcEu4PBKEqxhM7+A20AmtllwMm99avclMSpk3n9SScA30om66Af0WqaCD/yC03B
         cQnu1WKJLuNzmXWiGF+VqL+xGPrvww2d46pGcyE+ObkvVZbLaKdWBh/tDc56qnUd4diO
         2dfQu7xjVjqfNK1DTN7JNyebgvKFwAsUNWizQG08sMom5Mc8cl4C16hs5WGVkcv2+f9p
         Jj4niQ/vS5bLLSYckWvKAQGCyKPCL2lJe/TwnOW8LFbFGsFXOBQ9irAzHEopkDqioGbn
         3eow==
X-Gm-Message-State: AOJu0Yz8crLddFlLgGUEqQe0iY4VjUyDOKHxYE0YfPFtrGZgFK/JkyB2
	vIaxykU1D84PEqXWIyj4+hmGg9Xn0TmysIeS+E1NPOCvhBnG+sONiO6zw2kWQ+M7MWWruRCe3V2
	9OSPSWV+B
X-Gm-Gg: ASbGnctXpdvnqzwqY+rcc01efEFamsIZAsi2CE7PQ0ms3dV+5GpOc+X+Hw6uKWfPCw+
	iKNNlmfNwY94r80xEw8s2ZqMlQITF1WO+JmfnppW/TglyOmCjgIJ7eci0/E1ZQllt0L2Z8iOTd2
	hIZ3PpqSreqI17OedLmBBBgypjCEBdue1xMUxmnj+tQaN5JFK1abRf39mqQZxXhen7Yl+b34LNa
	dotFxqhJmbU51zRYhakSuj+f9ttLtb5d356wOXlG5SgDk2EZj5GUehtcBk+S6uRKlJOSb+mfisl
	YSCsrYKNC3I74WNF7pPZYjICYsCXDb3raptzLbtCPlrrUwqM1YvCvVnzA0KC92JfjN5knp/7Un3
	m1TGZMrraBLn8rAYWUL7FI8rnBNmTfRIPXhlRoBuCPuE1qu0OuSMTi0lGfQ3MhB2EYuN67cxk88
	1nl2hvhnrQCRUlWLPBtIBmo6lc2AjMfgnc89emumkAbnKWP6DPYg==
X-Google-Smtp-Source: AGHT+IGEoonZ23kvuu5jpRbUvBOHL0R2NqVHsZM708TOnKknv8/lqwqVEtML61mvB5zpABGTQqyKJg==
X-Received: by 2002:a17:907:7212:b0:b70:be84:5186 with SMTP id a640c23a62f3a-b767183c5cemr4851022966b.44.1764713262260;
        Tue, 02 Dec 2025 14:07:42 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162c5csm1648342166b.6.2025.12.02.14.07.41
        for <devicetree-spec@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 14:07:41 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42e2d5e119fso1830909f8f.2
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 14:07:41 -0800 (PST)
X-Received: by 2002:a05:6000:4383:b0:42b:2eb3:c909 with SMTP id
 ffacd0b85a97d-42cc1ac98a9mr45463866f8f.20.1764713260943; Tue, 02 Dec 2025
 14:07:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAFLszTiVT9rHwympUJSehxaDR7ks9Bs2FVjYEuN6=j1e_-289Q@mail.gmail.com>
In-Reply-To: <CAFLszTiVT9rHwympUJSehxaDR7ks9Bs2FVjYEuN6=j1e_-289Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Dec 2025 14:07:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vrit=N6L30dA3X6uV95e5E1bVoLph55_=ihqSTBy52FQ@mail.gmail.com>
X-Gm-Features: AWmQ_blcEODuHNOTfASjHIB_XmBuUPaulzfzl56_GN_PjmcKkVckIKFg3FzvIbw
Message-ID: <CAD=FV=Vrit=N6L30dA3X6uV95e5E1bVoLph55_=ihqSTBy52FQ@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Simon Glass <sjg@chromium.org>
Cc: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon!

On Tue, Dec 2, 2025 at 12:07=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > 1. Allow the top-level compatible string of an "incomplete" device
> > tree to be documented so it can be validated on its own by tools. It's
> > understood that this SoC is not a board by itself and we'd never boot
> > a full OS with this device tree without adding an overlay that changes
> > the top-level compatible. Add a top-level property to the device tree
> > (perhaps "incomplete-compatible;") to indicate that the tree is not
> > complete without an overlay.
>
> or be more description, e.g.: compatible-scope =3D "soc"  - or just scope=
 =3D "soc"
>
> In other words, I don't think we should be frightened to define some
> levels (soc, som, carrier, exxpansion, chassis?)

Sure, I'd be OK with this if this is what DT folks want. I don't have
any strong opinions here. NOTE: something like this would only make
sense if we're going to introduce new variants on how we apply
overlays (like merging compatible strings).


> > 2. If it turns out to be needed (hopefully it's not), allow some type
> > of syntax in yaml files that allows a property to be marked as
> > "required" in a "complete" device tree but not in an "incomplete"
> > device tree. Alternatively, we could discourage marking properties as
> > "required" if they're expected to be filled in by a board.
>
> Another option would be to validate the soc DT with a chosen board,
> just as a workaround. It would probably be good enough.

Sure, though I think Rob and Krzysztof are pretty interested in being
able to validate the SoC DTB by itself. I'd like to at least set that
as a goal. If we find some reason why we _truly_ can't achieve that
then we can talk about relaxing it, but I'd like to start with the
more aggressive goal.


> We don't need to worry about old bootloaders since they presumably are
> not installed on new hardware. Assuming Linux adopts this proposal, I
> am sure people will implement it in bootloaders when they need to.

Right. IMO if we have to make changes to the way overlays are applied
and we can do it in a simple and backward compatible way, it should be
OK. Only new bootloaders would be able to take advantage of it, but
presumably we'll have to modify bootloaders a little anyway when we
standardize on ways to pick the right overlays to apply...
