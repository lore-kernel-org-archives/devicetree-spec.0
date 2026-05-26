Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E1538757B
	for <devicetree-spec@vger.kernel.org>; Tue, 26 May 2026 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804620; cv=pass; b=sSkAOuOiEYZII/k3XILrP8iv2zTajTwzcrOxiuFfaVBuIK4vrpdO7dhE6VZ9wrMFC+n0c6KZbklA0pQitxAPqENTWKFYVJKJA8cj8CWVXKlvCNT/s6HuNasiM2NCkDKaN5kUU74FxSCvEwdwrQg52Ob08OEGPvU1XyIPkhEUaQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804620; c=relaxed/simple;
	bh=qT9Fin3aGaIoSYcqaLeuTer1voe2Ie1UZ5yI7H6Y6do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qs54vikHfmv/H4CcKlbR75Slk6VaI5ASWTqRJBLjqCooOVLDyg9LCATmFJ6UL4i4LaTWhS4baPAIz+jmawXH40QBH07u5WVrwgPQV/TfFWr4xqVZEgLoQiNvujaX8zKY8eq0PIs6s+ZCQJhtkqcH33d1/wdUz314QLnCC9Gp2aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OM7WUfqk; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OM7WUfqk"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso20070991a12.1
        for <devicetree-spec@vger.kernel.org>; Tue, 26 May 2026 07:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779804617; cv=none;
        d=google.com; s=arc-20240605;
        b=QXPvMz3E+s6/dk2bEBeHKvZWsLRobtXn3ZKlPrvighfiGsvW44lACIctx4jmxsh7mq
         KD7+NRhavlWStHcLOD3glixb8YCpbOBbDWQyWNPLYUO5I/HYkA4OCaNJ8UeNuxBjdJX9
         FaXWJEe9TZt6seRE1KiABfcbAr5dsujqSFs+k2ahOB4xzjgcnm5/9WZUZhmsZzGgUPsz
         Srv6UrvBLARwRxjkwqlV1bYGRU0YaKhJ2jn917qnwQrvGIvH+ug2EwgfrqbJW/oga/9C
         j5Sy0x2AZZwb+3sx7/feuL4efEbXS4kfwj6hbwFDGt5ClKf/HVuPvyE4ihpNczx+DorI
         URiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RuFie1OBlr+ti6GniHBuF3pv1gLL3P1z5QYnOhun4FM=;
        fh=4xMy3jMvRlxI6XKx1MW69OH0mpNggaQzPUebiFPa1YY=;
        b=HSkwnTIQ+vwlRRCR5P0k3Onwbpv5+w+gP4rReZSwta+UaZ3NMJ+FKn+uM5vJ0T0Q3x
         b39nPKYxx4cO13SdbUhDZUZI9pOJLi8e1ySlU6X4Y37vDTd9vpPqUT19wbTAFeFbgDN5
         6Tjn9V0+cn9PWw9h2FHWBF/gdP9PU51RVM32RofpQpn/hJaE7TUByM8kLyr0hSELUKiv
         xeQjDxHsKZgmhy9oo3lb4yqiB2hsshqEj0H6d2cYxhxv3zkfWlE7Wn4qVJNYVdCTFpb+
         4vKt9SOCerqA+2LzZAP96ddo3ctFtMsiVx8weFVhugoLS8SUeG4JSZmTvE5uIXnpMNFh
         YCcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779804617; x=1780409417; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RuFie1OBlr+ti6GniHBuF3pv1gLL3P1z5QYnOhun4FM=;
        b=OM7WUfqkpo9ab2S8PANt32IIfLbGM0Fy4xUzlxHnyzgBvumFu7/Pe5pVpXEPzZlZYs
         5teE8FMCFjYQNoIVG2LDFRsn7isANEZz1RxbLEIurdNJtZqNBldxrDSbY1xx4HSioYap
         e+Cq3o6boiEhXpe4dR9ZlRiBOo6jXk4LPTAy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779804617; x=1780409417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuFie1OBlr+ti6GniHBuF3pv1gLL3P1z5QYnOhun4FM=;
        b=ofDwy6UHALnJPFKkWwFaJqgqk11eTn2r1ENqCjVoNzb6G0bVxLkzDrhmP+3K+GdKZ1
         Cl2v5HLwVz086oDuRtYUnlVh+omfbqaWrjTztnn+iK/oPLrxUGUPcRUVr0y3fCDHYnZ7
         h/KuIbOyJ05+HQuQOnJ+FwFADp8GofUVQQbaJPaHsmOWBt8yplYYd38daiQFIiZKCxAb
         +poOK4uGifrqeUxQI+YCYtsOHDdngP/EXLf69frcsVxAYvgHiRxLKkmw/I4M3NcVMz1j
         SK1mAaJkk2rvWz8ee2Fkvhh4AbxNCC2QKsZW4i7ycOuUVaHBe5U7Q7bJ/uPPFfo3qbDz
         2C8g==
X-Gm-Message-State: AOJu0Yxg/t3fyz0QOYYwYRbIvZ3EypgRR0VQFY66RmQtyyD4jR3iK0Fg
	eEpnKNbGWox+r2ArxEn3CK7RU4ls7vQeTQoMIBjVVhMp4C1fJxJo5RrFAbRe2PKqTaP81NSDa/d
	fQe7W+ibmSNvup6pUXGqW7bKlaAKcLUrMUnDmIaWL
X-Gm-Gg: Acq92OEU+wCr7eno/LQCzGICaMKtezaZsNXq9ytvhci8Z6TfDq8GkUlXflMNZjkqXvD
	J94ZnIz4PnxwUgV+qfC96vdO8RXE/WigrQhFUqpUfjgs3HJZ+jx+vM2ABug24LoeSCW9TOR7fsH
	SBavbDi3Z5iZNM3So3oJxZqQ3z9z/xBTBQG7bL/yHdJg2Ce2aQ4nzJ3L88F0YD+SF99wFweoVmh
	zva38pRMPhsN56VzanzbWtfwht33EEmYTRZFH17bLv46gDHqr5SF9qBHe+iICfg/CGhX+ur02j5
	c8b7/8ojX/hRtjob
X-Received: by 2002:a17:907:28d4:b0:bdc:f4ef:ac33 with SMTP id
 a640c23a62f3a-bdd4a88d090mr723205266b.20.1779804616740; Tue, 26 May 2026
 07:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526104034.2735938-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20260526104034.2735938-1-alexander.sverdlin@siemens.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 26 May 2026 09:10:02 -0500
X-Gm-Features: AVHnY4KfSCx4lUj2ZdO5qornIhr8Su0Qr4IVWGXVnvItSy5MmR9ujliK5cgQGUE
Message-ID: <CAFLszTjtk-4YvYM=c49fgzc3iB1h0eLByKHDS+KAgpVOS5ewnQ@mail.gmail.com>
Subject: Re: [PATCH] schemas: chosen: Add reset-reason property
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: devicetree-spec@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 26 May 2026 at 04:40, A. Sverdlin
<alexander.sverdlin@siemens.com> wrote:
>
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> Bootloaders such as U-Boot and barebox can populate the /chosen node with
> a reset-reason string property indicating the cause of the most recent
> system reset.
>
> Define a standardized set of generic reset reason values that bootloaders
> map their platform-specific reset sources to:
>
>   unknown    - reset source could not be determined
>   cold       - power-on reset
>   warm       - warm restart without full power cycle
>   watchdog   - watchdog timer expiration
>   wakeup     - wake from suspend/sleep
>   jtag       - JTAG/debug initiated reset
>   thermal    - thermal shutdown/overtemperature
>   external   - external reset pin/signal
>   brownout   - supply voltage drop
>   software   - explicit software-initiated reset
>   safety     - hardware fault detection (e.g. error signaling module,
>                fault collection and control unit)
>   security   - security subsystem (e.g. secure enclave violation)

These all seem fine to me

>   pmic       - PMIC-initiated reset

pmic seems more like a means than a reason. Could you give an example
of when this might be used, rather than the other reasons?

>
> Mapping of platform-specific reset sources to generic values:
>
>   Generic      AM6x              i.MX9            barebox
>   -------      ----              -----            -------
>   unknown      UNKNOWN           -                unknown
>   cold         POR               por              POR
>   warm         RST (SW warm)     -                RST
>   watchdog     WDOG              wdog             WDG
>   wakeup       -                 -                WKE
>   jtag         JTAG              jtag             JTAG
>   thermal      THERMAL           tempsense        THERM
>   external     PIN               -                EXT
>   brownout     -                 -                BROWNOUT
>   software     -                 sw               -
>   safety       ESM               fccu             -
>   security     -                 ele              -
>   pmic         -                 pmic             -
>
> Note: barebox already populates this property but uses abbreviated
> uppercase values (common/reset_source.c). These will need to be adapted
> to match the standardized lowercase values defined here.
>
> The list can be extended in the future as needed.
>
> Link: https://lore.kernel.org/all/579fcbc186ad2aeea3c206aebc901b64fc665db1.camel@siemens.com/
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Krzk, apparently /chosen is already potentially very dynamic, thanks to
> kaslr-seed and rng-seed properties.
>
>  dtschema/schemas/chosen.yaml | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
> index 63f3c12..2daf791 100644
> --- a/dtschema/schemas/chosen.yaml
> +++ b/dtschema/schemas/chosen.yaml
> @@ -183,6 +183,33 @@ properties:
>        will assign devices in its usual manner, otherwise it will not try to
>        assign devices and instead use them as they are configured already.
>
> +  reset-reason:
> +    $ref: types.yaml#/definitions/string
> +    enum:
> +      - unknown
> +      - cold
> +      - warm
> +      - watchdog
> +      - wakeup
> +      - jtag
> +      - thermal
> +      - external
> +      - brownout
> +      - software
> +      - safety
> +      - security
> +      - pmic
> +    description:
> +      This property is set by the bootloader to indicate the reason for the
> +      most recent system reset. The values are generic categories that
> +      bootloaders map their platform-specific reset sources to.

The meaning of each item should really be in the schema, IMO

> +
> +      / {
> +              chosen {
> +                      reset-reason = "watchdog";
> +              };
> +      };
> +
>    smbios3-entrypoint:
>      $ref: types.yaml#/definitions/address
>      maxItems: 1
> --
> 2.52.0
>

Regards,
Simon
