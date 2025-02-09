Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755F01E526
	for <devicetree-spec@vger.kernel.org>; Sun,  9 Feb 2025 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739111319; cv=none; b=Lbhsm6ZGHR/ZOhwq9fTig6m0IqtjS8NKmuYsv6VxRoGC+zdck56isU1DM/tLuVwavBGKAlykYwonpGj/fpPJrhwoFA2jD/9M74WBcPpYSEdOaGlvFIQFkRuxxvfsNXY+fhwW36NEKnHzM4727iQkqJI4BqRj0xbA7nKFWGQlGI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739111319; c=relaxed/simple;
	bh=xbWEHvfGrOB19gnxwQ3Gvm6ntTpKfNl/2hm02/iOr/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qc213cdueflXfkh3MO3oMAzb/9Wre3Jj/bpTPQDbDwhHxXofbvoOBgnIuDeC2ZQ8L5HJrAE1tBzg2n3YAKWxjc8erNTEB9bUtGb25bmFN2zNlPQwmehFHo28B5FT7Oz6jZOp3acsMGEm1204n7VSAHpesk1kw8Sz4p9xo6tCYhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jqK9BC1P; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jqK9BC1P"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f74c4e586so13582315ad.0
        for <devicetree-spec@vger.kernel.org>; Sun, 09 Feb 2025 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739111316; x=1739716116; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/7Qz5RuAzH1PqGkmDKrqJggdzD03R/fGMNy/jIEUtyE=;
        b=jqK9BC1PvPZo8WzKpN8jq7d8E99uDSfT16V4w0BZ47QhXU3z6LkOzGrbM7HXoKzKEl
         vio+Ewgy72yWJOgaixeAIiYTeNAYe822h3nDlNoFLYA4a2QYDGd32LMybI0MSX5f/IHc
         9GocuLc9To/UDYSIWOIhlIdj6RYImXxt0vBAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739111316; x=1739716116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7Qz5RuAzH1PqGkmDKrqJggdzD03R/fGMNy/jIEUtyE=;
        b=X0p3EMqqHhcFhgqXRUK7UsVMrvQZrIHUST6w9hi1PvMVqPUnAHPE/bCAZrMX+Rkwkq
         B3XW6VH6QBkcGb2buasjTed2Ki2Erdr22Sjs/0/xHxoWoicb3p3AkhxcLdKknJXTt4Io
         oV+tj/rH3lUvSQrWi6YHcKPITA9Jq+GlWCrHebJT8fFQJlrTyZQzI7icrhnudZBtvqVT
         BCg54lgHaVQIS+5Hte6VVG5d4htlo4Z8gVI2M8hWM0vpShGkLINZ4PxNiu8Id+kGdyc7
         WS2tgfUMipf8eaORRkHDyXX2KgYgXwjNhSO3rGtzxexiZeE91gSDDmcJrtRs+poH2NiQ
         yFsg==
X-Forwarded-Encrypted: i=1; AJvYcCVaax9RuDnrnx8Z4Cwgeesf2l7+kgCRlZ+AgSbn/xSUoGECnsMCj5/qLKfbUrRRqYzXYmLf53K+VVgbip50K8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRrUqr1Dn5gNqlImgdDT26uGbZqqK7P21jf/DdQp2HjO+3jMrc
	i393+0hE9m0OoOuxKG9Ngrg0AL8L8R8L+GO0RFbaVvoSwmDl6SL+CqXnPcZssW6dxIFtKOvUhhp
	wY3xa4BQ4qTZBvl1dAqBWWA5pfQ035YYodFg1
X-Gm-Gg: ASbGncu7TzIhYaBSh3ZOwlOk2D6UAwarKFQ9cVqZOLBN/bSx7V0RdXwYUnFBgOzAzOZ
	Poz0uFedSrAHyUjZVM1Yi4S73sM4D4wJgSDoL8fWacFVLdfb1d/fMnkMRUpsxKkZKgiECnDrhMg
	==
X-Google-Smtp-Source: AGHT+IH7zrvtAn1w2MciMN7AA+RLrQp6KthWrL/c3SL+Nl3A541UBAqdNaP0BIOJ/3QP4ULP1PjCHX6ve22qK8tXfkQ=
X-Received: by 2002:a17:902:f786:b0:216:410d:4c53 with SMTP id
 d9443c01a7336-21f4e74480emr183387115ad.41.1739111316669; Sun, 09 Feb 2025
 06:28:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205-bootsource-v1-1-95f4ba69ac27@cherry.de>
 <CAFLszThr_vLbhU7A0_0VTLCGW03k6NmtxLVoW7OzrtxGFertZg@mail.gmail.com> <fb6792e8-97c5-4d0e-8ded-e73ea3a7513c@cherry.de>
In-Reply-To: <fb6792e8-97c5-4d0e-8ded-e73ea3a7513c@cherry.de>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 9 Feb 2025 07:28:22 -0700
X-Gm-Features: AWEUYZltFmv3kubl_x3VtnsYeEyfj9QDEB5opsMjBGzAQiJn4ZkcO2oBPjxau7Y
Message-ID: <CAFLszTg9-jMk0PBBSEVT=FonzRUNJOQ5NBMdDYUihWS8NkMhbQ@mail.gmail.com>
Subject: Re: [PATCH] Add 'bootsource' /chosen property
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+dt@0leil.net>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree-spec@vger.kernel.org, u-boot@lists.denx.de
Content-Type: text/plain; charset="UTF-8"

Hi Quentin,

On Thu, 6 Feb 2025 at 08:46, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi Simon,
>
> On 2/6/25 1:33 PM, Simon Glass wrote:
> > Hi Quentin,
> >
> > On Wed, 5 Feb 2025 at 02:12, Quentin Schulz <foss+dt@0leil.net> wrote:
> >>
> >> From: Quentin Schulz <quentin.schulz@cherry.de>
> >>
> >> Bootloaders typically can be loaded from different storage media, such
> >> as eMMC, SD card, SPI flash, EEPROM, but also from non-persistent media
> >> such as USB (via proprietary protocols loading directly into SRAM, or
> >> fastboot, DFU, etc..), JTAG, ...
> >>
> >> This information is usually reported by the SoC-ROM via some proprietary
> >> mechanism (some specific address in registers/DRAM for example).
> >>
> >> It would be useful to know which medium was used to load the first stage
> >> of the bootloader. SoC-ROM shall be ignored and not reported in this
> >> property.
> >>
> >> This can allow client programs to detect which medium to write to when
> >> updating the boot program, or detect if fallback mechanisms to
> >> unexpected medium were used to reach the client program's execution.
> >>
> >> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> >> ---
> >> Bootloaders typically can be loaded from different storage media, such
> >> as eMMC, SD card, SPI flash, EEPROM, but also from non-persistent media
> >> such as USB (via proprietary protocols loading directly into SRAM, or
> >> fastboot, DFU, etc..), JTAG, ...
> >>
> >> This information is usually reported by the SoC-ROM via some proprietary
> >> mechanism (some specific address in registers/DRAM for example).
> >>
> >> It would be useful to know which medium was used to load the first stage
> >> of the bootloader. SoC-ROM shall be ignored and not reported in this
> >> property.
> >>
> >> This can allow client programs to detect which medium to write to when
> >> updating the boot program, or detect if fallback mechanisms to
> >> unexpected medium were used to reach the client program's execution.
> >>
> >> Note that this property is already set by Barebox and I'm planning on
> >> adding it to U-Boot as well, specifically for Rockchip SoCs.
> >>
> >> I have some doubts about the wording, especially in the case of
> >> hypervisors or chained boot programs. I'm not entirely sure what would
> >> make the most sense to put in the property for those scenario.
> >> ---
> >>   source/chapter3-devicenodes.rst | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenodes.rst
> >> index 8080321d6e60d6b1e86c81af86c6850246a0223b..defd1a46e4ffaa4bb085306b5e153d38b740ac66 100644
> >> --- a/source/chapter3-devicenodes.rst
> >> +++ b/source/chapter3-devicenodes.rst
> >> @@ -456,6 +456,9 @@ time. It shall be a child of the root node.
> >>                                                          the client program. The value could
> >>                                                          potentially be a null string if no boot
> >>                                                          arguments are required.
> >> +   ``bootsource``          O     ``<string>``          A string that specifies the full path to the
> >> +                                                       node representing the device the BootROM used
> >> +                                                       to load the initial boot program.
> >
> > Could/shoud this be a phandle instead? It might be more efficient.
> >
>
> In terms of size in DTB, phandle vs string probably much more efficient yes.
>
>  From user's perspective, I'm not too sure?
>
> /aliases does use full paths for example.
>
> Having a full path allows for easy consumption, just cat
> /proc/device-tree/chosen/bootsource and you'll have the actual path.
> Otherwise, we'd need a special tool for that I guess since it'll return
> the phandle number and then you have to traverse the tree to find which
> node has that phandle number?
>
> Also, I could imagine some scenario where:
> - a boot source would not be available in DT yet (though we probably
> shouldn't write it in /chosen/bootsource since we wouldn't know the
> proper path to it), e.g. USB loading, this is usually done via a
> proprietary protocol and/or tool (e.g. rockusb/rkdeveloptool for
> Rockchip) but no USB support yet in boot program or kernel (that was the
> case for a long time for RK3588 for example and I still have at least
> one device without the USB node described yet).
> - a boot source would be available in EL3 but not EL2, so does not make
> necessarily make sense to have it in kernel DTB for example. If it's not
> there, can't have a phandle.
> - a boot source supported only in boot program's DTB and not kernel's
> DTB, we probably still want to provide it to kernel's DTB even if it's
> not a device node in it.
> - a boot source doesn't necessarily have a label (though we could use a
> full-path phandle I believe &{/some/path@1f000} probably works). That is
> not uncommon for SPI flashes for example.

Well I'm not sure what we are defining here and which programs will use it.

I don't really like the idea of mentioning a boot source that is not
in the device tree. In fact that's one reason why I believe it is
better to use a phandle, since it enforces that. The RK3588 things you
mention sound like things the vendor should fix from day one, if it
matters.

If the boot-source device is not in the 'kernel' DTB, then why have
the boot source there? What use could it be? This seems like having an
alias to something that doesn't exist in the tree. But it could also
be used to just have "my-silly-device" as the value, with a magic
meaning which no one can figure out.

Re not having a label, we can add one. Yes, fdtdump does not have the
schema and doesn't decode phandles, although I suppose we could teach
it some basic things, or add a new tool.

So overall, this seems like a balance between short-term convenience
and long-term confusion.

To me, the strongest argument for paths is that /aliases uses full
paths rather the phandles. I believe that was a mistake (it caused
problems in SPL as it bloats the DT), but I've not looked at what it
would take to change it now.

>
> And additional argument for full-path: Barebox already uses that.

Were there discussions with that, which could be used here?

Anyway, if this is the way you want to go, I think it would be useful
to add some of your notes above into the binding, so there are some
rules around it.

Regards,
Simon
