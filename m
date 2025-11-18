Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E272EC095
	for <devicetree-spec@vger.kernel.org>; Tue, 18 Nov 2025 23:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763509733; cv=none; b=S4Flvt5sZOLJuVqbmmYtz1xPAAI2fhgJvLzKVjkJ1uljQjTbpKGV63+ATozP3kfEGhPrpn31xIZi8AzhWl9Mmki7CMhPfBgyZdWsL0Y6q+Z2usUCKlSNg22DAqNdWFp8U8+Z+4MKx+9fgQAgEh8mYlx8m+iJYKatR4Hi+3G14a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763509733; c=relaxed/simple;
	bh=75UCHxeHF6HHplyZn2UWtjGCAYD2cIcbgXlp/fYJU6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksMLDGMXhN5Rqz8XzPu3Elh1P6xrmLY2t2l0yE68iz1FiJPOwHjuryQQeqhn2OMk7vlemT6GHu9W6/aom6YPUafwGUu2mUjgNGnet+skqSmciQEz8HybaNA0l6n7nG8alHucxJV9LK9XZQ0eFhWCxDdZYZdNrzJiq01vQ9Vq4Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cQAUmaAk; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cQAUmaAk"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-587bdad8919so3707e87.0
        for <devicetree-spec@vger.kernel.org>; Tue, 18 Nov 2025 15:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763509729; x=1764114529; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wfdgl45TlhUjROY1GcEYL/sA2/gyYtMo6GNhOZ6UTRk=;
        b=cQAUmaAknU93HmLOa2C5lK+OBSLfcCvRyo9XbKzKNhyqVc/qr6L4P21x7/ResTan0e
         Uyh5yK2feBDbd0DubS0J7oveqDd4ZpM1NkcooxdMm5RONaLxCAOGLt+yaySL1D1iykFz
         Vbi8KvI5o2Z4NvVIYyBulM5HwvSitzurWhHUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763509729; x=1764114529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wfdgl45TlhUjROY1GcEYL/sA2/gyYtMo6GNhOZ6UTRk=;
        b=W+V/7dQzni8SJXjbjf0a3CFD739uumKo3nRdRdYH1AQ/rxnG8Y4reGTGinVriWVuHm
         KJvlsoqbp4yGIEgQCE4eNS6CwynieExnQaUeXiiJgNl/5JGKKSgcM+43HgmqD8J+uRyL
         qIw9yK8DTeuI0AMjr5XlB8XjSHYcdeUOSPScJ76IUx88+Oc/4X3e8RpA7d8Oq7VN7llz
         HLfX81r/Jdcin05mqjHpBni6+SB3o0wTDWUBKwndPwE8gIk3WRf49sS28lTfUbSe6Okz
         xcMHMN0fiDP0DyTVezg3iBw/iCH9QbVVpxEi9uSGPTIKi+ZuKSwVv7GuspdUZiaDXLTL
         /VpQ==
X-Gm-Message-State: AOJu0YxwrWOEN8lo9qoKQXAIC8K7eii36t8w8/qQ0zweboB5WD+3CfyF
	UUvDsOvJSkr3LMWVr9ofxc65vqzEo6NC/SHlWJWOlClnesjXk0R6bR4C6ELOnMp8YAEp3x4A6DO
	ftZs1hydtgDVflCdCzYbLcAXsot/N+TI+Wu1FZt5f
X-Gm-Gg: ASbGncvmEFvoXg7SZMhiM2/sFZNdpLOUdZEwdZC0J4beRZHpMrQs6Lku3iLz2cx6goR
	zLrq/nxJcA58MgNGHWsJEnub2YS3AVbbC218AtLaqUvo1tLJM7/0fXD2GD4KE2DFXqC/7DFfb5G
	U56+eAvFigRB3lskozq1PR5N9idmjYt7nQnPi0xvngMrzrcQdEKWSX3paqIblhN2R71+4o0yefR
	BQ5PRIqu3fWS2nJ8h2m3mCc2beDRGuo0jhVjs7tifviRk9MpPOvyoDhpqqJzRwirU1KATOIPN6q
	D5frrmWoopMvUlijyrenNh31On0XTfjeq4EX
X-Google-Smtp-Source: AGHT+IG35LTA4LFVibGtlnZ9yjpDlUuNT0fzfs6wnGkoFLOS3t2IhLxzn2dmTxJ6BMd1TCS3ZfXdgvD3BM/PCeOjrX0=
X-Received: by 2002:ac2:5509:0:b0:595:7b9d:c04e with SMTP id
 2adb3069b0e04-595c6cb7208mr56839e87.4.1763509729048; Tue, 18 Nov 2025
 15:48:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
In-Reply-To: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 18 Nov 2025 15:48:32 -0800
X-Gm-Features: AWmQ_bntEbW9VJaqwe6WpNJTYWU6dC3uPbKkw63j0vy6Z95Gr2XVZ8XMupDqb44
Message-ID: <CAODwPW_51fKOfDQbTUFCum13M621Uxi2Zw2YHng0DrrwwvZhRQ@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Doug Anderson <dianders@chromium.org>
Cc: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	yupingso@chromium.org
Content-Type: text/plain; charset="UTF-8"

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
>                     , "socvendor,mysoc";

Sorry, I only cursorily followed the previous discussion so I may have
missed the exact need for this part. But I would caution against any
proposal that changes the basic rules of how an overlay is applied.
The definition of how overlays work has (I think?) been stable for
over a decade now, and is implemented in bootloaders that often cannot
easily be updated. I absolutely support your effort to get more
upstream standardization for managing base device trees and overlays
(which I think need to be flexible for arbitrary layers, not just SoC
and board), but let's not break the overlay code in old bootloaders
while doing it.

Is there really a need to merge the compatible strings in your case? I
think in the vast majority of platform identification cases, code only
cares about matching the most precise string (i.e.
"boardvendor,myboard-rev1"). If we do feel like having the whole chain
of identification is necessary, it could be achieved by just
copy&pasting the extra strings into the overlay file. If we have
cross-validation between base and overlay source files we could also
have the validation check that the overlays correctly contain all
compatible strings from their base tree. If we know that the base
trees aren't standalone anyway, we could also just invent other
property names that identify them (e.g. `soc-compatible =
"socvendor,mysoc";`). Anything other than breaking the overlay format
would be preferable in my opinion.

I also feel like we need a better standardized way to tie base device
trees to overlays, like your `/loaders` node proposal in an earlier
email, although maybe that's an orthogonal discussion (but related,
especially if there's supposed to be cross-validation between base
trees and overlays). The compatible string is just not a scalable way
for bootloaders to make this determination, there may be a lot more
differentiation than just "SoC" and "board", and the scheme almost
certainly needs to be platform/bootloader-specific because every
hardware vendor has their own ideas about how to group and reuse parts
of a platform. This information doesn't necessarily need to be *in*
the device tree, it could also just be in a separate YAML file in the
same repo (since bootloaders will almost certainly want to have it
transformed into their own out-of-band descriptor at build-time
anyway, so that they can compress the device tree itself and don't
have to decompress each one for matching), but it needs to be
somewhere.
