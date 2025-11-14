Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A57E2DF149
	for <devicetree-spec@vger.kernel.org>; Fri, 14 Nov 2025 13:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763125721; cv=none; b=IVTIU7IOr3BevcN+g7hxFsoc61liXtDLC2o6GBxXCZR+RMinpjV63wFvbuj6o7HmAYJ6ta2aeLfQQNGamllkDQ5M89MntoGCObwsdDXkeNcW3hOQ6phN5mmHVn4K2nG1DmHrFnX66E6S9WcwT5/UuR9yuXzd6HTJlopge6z9/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763125721; c=relaxed/simple;
	bh=dLNDvmY+Tga0mqtuY9x4IdeYGb2yvfWhIjiZOwC9fdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rhqcw8BMUvhqWtvRk/3YJJmKLm/nC9OOqFHlrdXnsZeSgPp2BSDCFDcV9b64zWYz9ihMJEwZsRt0uZOiwwtEQS6MMo/m8cMHuN9No/16CvBJEDYcVvQOqSkk+RXh5NUtvvwf+HzLWa0LcTJtR56LtkXRC2rW7Df7PnRpp/PNhTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t8ASPoUL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t8ASPoUL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDA2C4AF09
	for <devicetree-spec@vger.kernel.org>; Fri, 14 Nov 2025 13:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763125721;
	bh=dLNDvmY+Tga0mqtuY9x4IdeYGb2yvfWhIjiZOwC9fdQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t8ASPoULVnEgJZUdVQ477/babnw79FOgZtRbfLNABOhtc0hLYKVbSrNIVWaKFsOor
	 gb5kn4+tS70s1lijGl9AfYIXZa0P+PUXfyjZ9zldrFD5yQXvruklSD2RUT5RdpB7Rh
	 sEo24Ne/HIHD5QjZfSg+5i4HrbUjUjClgAw4CAaM1DRwFn2nuDm05D2P+158AW0Os9
	 FnU+bP3mOxI5C70ZEBL5fJLxcxnVsVYluLmF58a/BECItc7yVQngVXSCCrCT1J9uRk
	 eBi21C53WHfq7trLA/nXbPMLB/HaR9TTjGKkuncIKIaf2K3ygaFTHmpNrusOsUTQ4q
	 x3CMr1P1HTbow==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so3076787a12.0
        for <devicetree-spec@vger.kernel.org>; Fri, 14 Nov 2025 05:08:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGn0YtwnXGJKd49NB1ADOeuc74x3lvG/eLqNrT+tQ3uoYEx36bD+O9K3z5QZSlbe3s1WaMIFIGrWPbA9Bbujc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpGk+KnictON/6WBG4ufQ3+g0F4X19zyavdq7RqR9uS4HOtWIC
	AfO+LFeZvXg9HQ3MjkQ6E3o2e2oWwnzZs3xIVBF3JqjMm/2GOazMNLQn0cr6vaErf9wuu7vI/AW
	F7gS7woaVKIB1ER7knGFg1+8QFEZyNA==
X-Google-Smtp-Source: AGHT+IEmOjlIGzwN2mXdlpFTSB0qntDwcfgQBxDMBRtmTeVBp37s61Vcc+KhNBCPpDulO/W+dMu4XLyHI0tsk5BZI0s=
X-Received: by 2002:a05:6402:278f:b0:641:966d:82ba with SMTP id
 4fb4d7f45d1cf-64350e0476dmr2741646a12.1.1763125719175; Fri, 14 Nov 2025
 05:08:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911151436.2467758-1-raymond.mao@linaro.org>
In-Reply-To: <20250911151436.2467758-1-raymond.mao@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 14 Nov 2025 07:08:27 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+apXxvngU9enNw9yzD1YAAOyamwkTBvqdrc2M955Q38g@mail.gmail.com>
X-Gm-Features: AWmQ_bllt8kYcF9TyIDY2FL8zJVglYUuZePfZb_Ypbbfo2c2HxpexdZac4wFAkg
Message-ID: <CAL_Jsq+apXxvngU9enNw9yzD1YAAOyamwkTBvqdrc2M955Q38g@mail.gmail.com>
Subject: Re: [PATCH v3] docs: devicetree: overlay-notes: recommend top-level
 compatible in DTSO
To: Raymond Mao <raymond.mao@linaro.org>
Cc: linux-doc@vger.kernel.org, devicetree-spec@vger.kernel.org, 
	devicetree@vger.kernel.org, ilias.apalodimas@linaro.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 10:14=E2=80=AFAM Raymond Mao <raymond.mao@linaro.or=
g> wrote:
>
> When managing multiple base device trees and overlays in a structured
> way (e.g. bundled in firmware or tools), it is helpful to identify the
> intended target base DT for each overlay, which can be done via a
> top-level compatible string in the overlay.
>
> This provides a way to identify which overlays should be applied once the
> DT is selected for the case when a device have a common firmware binary
> which only differs on the DT and overlays.
>
> This patch updates the document with a note and example for this
> practice.
> For more information on this firmware requirement, please see [1].
>
> [1] https://github.com/FirmwareHandoff/firmware_handoff/pull/74
>
> Suggested-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Signed-off-by: Raymond Mao <raymond.mao@linaro.org>
> ---
> Changes in v2:
> - Updated commit message.
> Changes in v3
> - Rename to 'overlay-compatible' and rephrase the description accordingly=
.
>
>  Documentation/devicetree/overlay-notes.rst | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/Documentation/devicetree/overlay-notes.rst b/Documentation/d=
evicetree/overlay-notes.rst
> index 35e79242af9a..77284afba9a4 100644
> --- a/Documentation/devicetree/overlay-notes.rst
> +++ b/Documentation/devicetree/overlay-notes.rst
> @@ -103,6 +103,38 @@ The above bar.dtso example modified to use target pa=
th syntax is::
>      ---- bar.dtso ------------------------------------------------------=
--------
>
>
> +Overlay identification
> +----------------------
> +
> +When managing device tree overlays dynamically - such as bundling multip=
le base
> +device trees and overlays within firmware, initramfs, or user-space tool=
s - it
> +is important to associate each overlay with its corresponding base devic=
e tree.
> +
> +To support this association, each overlay should define a top-level comp=
atible
> +string (referred to as the 'overlay-compatible' string). This string is
> +intended to match the top-level compatible property of the target base d=
evice
> +tree.

This property needs to be defined in dtschema at a minimum. Really we
need to check the values are documented. We already have all the
possible compatibles, so we'd need to generate a schema from them. But
that part can wait as we don't actually validate overlays on their
own.

> +
> +By including this identifier, higher-level software or firmware can dete=
rmine
> +which base device tree an overlay is compatible with, and apply it accor=
dingly.
> +
> +Example usage::
> +
> +    ---- bar.dtso - overlay with top-level compatible string -----------=
--------
> +       /dts-v1/;
> +       /plugin/;
> +       / {
> +               overlay-compatible =3D "corp,foo";
> +
> +               ...
> +       };
> +    ---- bar.dtso ------------------------------------------------------=
--------
> +
> +This top-level compatible string is not required by the kernel overlay
> +mechanism itself, but it is strongly recommended for managing overlays i=
n
> +scalable systems.

Please define exactly how the matching works. I assume it is the 1
overlay-compatible string has to match any one of the entries in the
base root compatible property. I don't like to assume though.

How would you handle a case where you have 2 similar SoCs which don't
share a common compatible string and the overlay applies to both of
them?

Rob
