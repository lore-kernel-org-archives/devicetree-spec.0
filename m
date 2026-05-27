Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD983002B3
	for <devicetree-spec@vger.kernel.org>; Wed, 27 May 2026 01:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779846802; cv=pass; b=ew92tH4B8b1F1U7EsrnqvByShXYmioZBdFTSrZ7GJ6VQ1IVDpRDpH6uywwMAOcqE8okNSgetP+1e3BVoYYKC9cBR8AgcSv/u2tHSemZm90+M1iiN3Lapv4BncszOcKn8Prd4GLXN1sqSn1AFf5qF9c+hp2rRL/zxKx/p2KvOU2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779846802; c=relaxed/simple;
	bh=M7X+pEGeENSy9z0fP5mGnsPtjjaXn3wViulCVDC/X7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzMrhEDX8OAEqlwhwYlGUAEDJJX1D8Sn7X6ygrDCa+CoNyP/BXHYEqqcijxFZnkIt3S1uCxvouwslvQLPT1m7gEdyeTL7xrYKC/DpisdEC5GrxQH6uLV/q4oyl0JMHIid/DcuAoPoPgCVhmMdaMmgTyp67GemBBnKAaZQwTScXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AGp8Fm2T; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AGp8Fm2T"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bda62f13d90so1101428766b.2
        for <devicetree-spec@vger.kernel.org>; Tue, 26 May 2026 18:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779846799; cv=none;
        d=google.com; s=arc-20240605;
        b=Frg3F1RJDykZZye2dTasSiXgFD98NJnq/VROnETpLbCJE9tNx459eAwfCqjiyG9wQf
         yq4ehcbB6Fm7BzoBZs9Se+Fk22RQboUd5Lks6oFOEf8JASK/KWwzSYO/aYVEm32Vp3VW
         Os9EbrTQy3qf04lIpN/uDiZ3nO/JBlw/Dmin8Gtn+Xvrbvw3yJ8IIL5XLy7Y7UcCbT0y
         mugfXUwtaD1/U2laVxHU+UtI080OHD5gWdvC+k9imEJdWhuLK6qCwHu3P2v4sytfIfsq
         7cr+K/A+v+68w4v9AYFDX13qanUfgjFE/nY6G3HUPWiv8iOTMbseXZsNeclSll/WidBa
         4ykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=14gvRSf0qJjqmI2vsfDk9LKv3cmwmdkSuG3XANkZYLs=;
        fh=O2OrUMkwk1xRlg8bIimUjdsBMFgXQzJMEEiItK8KUXU=;
        b=AOsBg073reHibqMn7X/rLTKZxey6IlPrGl9ZMgaOkaSw5Z4LPxX9JWvcmbpwfYNdQv
         fJ9iIulO3y3GYfOI1d+ipKND50oB1nAXOXzQa3jarXcrwdhz3FX48dVXz74avSfZ3mXE
         /897bkUDdYDx5jerYYDQVQuECIxdrATi3mKuSk2fIF83VjZC8U7Tyo+6MAJSisBfGy15
         qHtZ5qqk9h/IPC10xYbbcjO7yiwaKn6RsRuPxMHGNXXz81zTxJScnWdgoeHTJ9Tnjg4r
         bywF0FQduQ05vD3WmlBYAyBNg8b77bZ1rS45ywZjySxAarhDr3GwvkhVQwpTPMHBvafp
         UN5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779846799; x=1780451599; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=14gvRSf0qJjqmI2vsfDk9LKv3cmwmdkSuG3XANkZYLs=;
        b=AGp8Fm2TD/ZlHfKy/+lgZOm159d2qPMBobYZ4ODz8QbOF9z7tuPhV5AIckvLpbde3E
         1lyqjQhJcoAhMy8PciLeCkAi9vXucak1f39nhTCb0gll5oc/pgomWz6d6KRvPLmxb6CZ
         tOLv+QQ6r/Wf/Z5ZTcvwTp5DyLM5f5STM/p00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779846799; x=1780451599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14gvRSf0qJjqmI2vsfDk9LKv3cmwmdkSuG3XANkZYLs=;
        b=AqtHorDH7FCp+EuRv51mqV8VQH4fiKWwALBPNijrDb2vE5g/L3J3c2gDg3Yk4EFbpz
         Ya/ikq4bWk8OF3ocIUOPF5hupK0XwwsHdAjhDOY79v/GVAsEFuh0ESpyVo0rAuxSxf7e
         s5IpgaxmooIP4dBNGDfdpKmbbwX2KnbhQswtM6UikFy9dyCSiN3wI9vI6lyxEg/fXX5A
         sLXl0GJRXIjxoXEN5rVaT2lxpjcmTcOrwHoSkTxMSLuW5NTZTqIuuAp3SsFd9iAvpXmg
         kUlam6t0D1Q9kvgs/3ZVgD1mF2udHGnallXJ3Ey/J9BGosRuwR8Nb/T9IxVCp0XPGQ3m
         iBvg==
X-Forwarded-Encrypted: i=1; AFNElJ/kSxrx6N+V9RspBrvy+Pwg3BFY2RhDrY7q0mmLvNEBsXm1ot7erci20MR+UAMuphVXBR/ERKvFXAhqos8+1rM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwihPSCgZBVwWA3G2R+G7pVs3RINKW6VhzgxjERA8nLbJqZobym
	Mx+cUock1tdNprSw87EONJYfwhcJEe0c9C4hmieecVdQ8eO+ZqiWEqbXlATQLu9oSqfkLKjKpUN
	+zJN/OV8VlGpfAksThL9Z1WxKAKiO0sV3T0g1otXI
X-Gm-Gg: Acq92OG4qMkBxpKtTAjJfb/j1BTmAxJHvGX+vluLEG2CyXN9xXShRdohe1fnL9Hd5h/
	AM9lkV55waXypMAKuiR9sL92ErY8hiLsbIeMf2xlYKleRE1vW8PCDZjysVDVExZNG75EFvcbr9x
	qUkETdNwK6MKsk12lbHgpjdzdIun8P/12Faed8Ek2RrHsX+qizkSejDLaS6SX5jkWbgpRDYZZvw
	mHLhNnr2QxbDY/JkQslC+TdTExdqLklW0d139zvsBaJtGXVA1xoa/khey5WvlsDd2ydsw8WqgwV
	idx8KA==
X-Received: by 2002:a17:907:a80f:b0:bdd:3159:baa8 with SMTP id
 a640c23a62f3a-bdd3159be0cmr1336582766b.31.1779846798727; Tue, 26 May 2026
 18:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526104034.2735938-1-alexander.sverdlin@siemens.com>
 <CAFLszTjtk-4YvYM=c49fgzc3iB1h0eLByKHDS+KAgpVOS5ewnQ@mail.gmail.com> <1c4b53e2d423c0e461d056f8d5da29c3de4e7cae.camel@siemens.com>
In-Reply-To: <1c4b53e2d423c0e461d056f8d5da29c3de4e7cae.camel@siemens.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 26 May 2026 20:53:07 -0500
X-Gm-Features: AVHnY4L1rcQ4VDYO_AoaFvhb7eIw243Y0gOK0H2GNEoEpKc8O-4m3yGS_aHoWHs
Message-ID: <CAFLszTihFWnJZVO582_1UGeg6yqnxexJv61b39ro9S8yAQ1r+w@mail.gmail.com>
Subject: Re: [PATCH] schemas: chosen: Add reset-reason property
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"a.fatoum@pengutronix.de" <a.fatoum@pengutronix.de>, 
	"devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

On Tue, 26 May 2026 at 12:19, Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hi Simon,
>
> On Tue, 2026-05-26 at 09:10 -0500, Simon Glass wrote:
> > > Bootloaders such as U-Boot and barebox can populate the /chosen node with
> > > a reset-reason string property indicating the cause of the most recent
> > > system reset.
> > >
> > > Define a standardized set of generic reset reason values that bootloaders
> > > map their platform-specific reset sources to:
> > >
> > >    unknown    - reset source could not be determined
> > >    cold       - power-on reset
> > >    warm       - warm restart without full power cycle
> > >    watchdog   - watchdog timer expiration
> > >    wakeup     - wake from suspend/sleep
> > >    jtag       - JTAG/debug initiated reset
> > >    thermal    - thermal shutdown/overtemperature
> > >    external   - external reset pin/signal
> > >    brownout   - supply voltage drop
> > >    software   - explicit software-initiated reset
> > >    safety     - hardware fault detection (e.g. error signaling module,
> > >                 fault collection and control unit)
> > >    security   - security subsystem (e.g. secure enclave violation)
> >
> > These all seem fine to me
> >
> > >    pmic       - PMIC-initiated reset
> >
> > pmic seems more like a means than a reason. Could you give an example
> > of when this might be used, rather than the other reasons?
>
> you are most probably correct in that PMIC probably generates one of the
> other resets (external or cold), but i.MX firmware is able to provide this
> information [1], so it would be pity to throw it away?

Yes I see. Outside of the context of i.MX what should it mean? We need
to be explicit since someone else's hardware may not match i.MX and
they will be confused as to how to map things. I'm nervous about it
because it seems like a catch-all, i.e. the PMIC decided to do a reset
due to brownout or the software writing one of its registers
requesting a reset. But perhaps the best we can do is to define more
precisely what it means with respect to the others.

Another question is what happens when there are multiple reset
sources? Perhaps for now we don't allow that and say in the
description something like: If multiple reset sources are detected the
bootloader should report the most specific known cause; if the cause
cannot be determined, use "unknown".

If the property is missing that is then a clear sign that the
bootloader doesn't support it.

BTW I believe you should have | after the description so that the yaml
is not wrapped and whitespace is preserved. I can't remember if it
matters or not.

Regards,
Simon

>
> [1] https://github.com/u-boot/u-boot/blob/987907ae4bcc5d6055bdf7d318a3edf53e14d5fa/arch/arm/mach-imx/imx9/scmi/soc.c#L591
>
> --
> Alexander Sverdlin
> Siemens AG
> www.siemens.com
