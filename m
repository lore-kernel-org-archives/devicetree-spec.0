Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA133016E9
	for <devicetree-spec@vger.kernel.org>; Thu, 18 Jun 2026 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781796349; cv=pass; b=Wkhva/iIy9L6fVojrRKAtnqxJ+kRJm9cPNUiH3F8UIgNy3IcFqXp7PICl/ECZr4MlAdAe7grYoMwCqiUftiDzqP8RQN9UFTtKh8r3SwIxkw8H7E42rylqMAjyiCI/B8xRhEgdH/Ht15swRci3vJdMw/zkFYIAFhVDEHvHOKk3rM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781796349; c=relaxed/simple;
	bh=I6ldZ+7RmR1KGvAQkHi57b0RPr/RGi7xdC8OPx5W7NI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mRp8iivp3KsVEKLU8kY517sh/BsH8xuEK11Dx9OeMRdxZ/+Riz5LE37akcSp/St0z8JZuQbkahixw1l07L/Qhhu/XuwDAOLlNe+F3jzWUzJ0NhOKR72SlSiGbKzofz1Xk8hMAbUapmyHG6NDmoXnbr6d1AmhmSNPYAu8wFyn4vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GKMfpZM/; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GKMfpZM/"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c07fd4dc2c8so78835166b.1
        for <devicetree-spec@vger.kernel.org>; Thu, 18 Jun 2026 08:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781796346; cv=none;
        d=google.com; s=arc-20240605;
        b=eI4RNBnc3Icc3/9n30wLvtfoOiM+ok9u/hgpbXJymTsZK+Wnal/NvK8ngqKkzAX3yY
         yYrdiwDZMdxZ7Zy4xK9OCMVDNSydGfD9d+Bm8gW22pSScUTnAdrggQHRBUuydTFEPJ9s
         qFX4f/6+HburFxmrcCOrrCsfSEzMNQvxwCnWw3SDCYhXJzBNDOwUNyiDxdCABaEgGEgX
         I6pElJqzJefG0RDg4YoMP3AHWQQau88+DaZ933y4IXC3rqqoTU9SkmGLLcl2DOBoBm9c
         kXab2pDmXcuC9I+houOr9t18OqNjcPqwDnzuUa09B0GNDzhswPQz//R0ZZNwq45X3/5N
         kPiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mWWtnFTYAhIut3RxfHIDKFIbxPqdUe9V81gCdbwXwSo=;
        fh=2ZYKSX4Eu7zG2PeJ7T9mYwlW0Z5NtCdOMG1FAKSAqNQ=;
        b=AkRqzAi94Z54EejjxPTj3K8OI2GZpkbPZxOKCG9i4pQpfaH8ZikdW1jTqeSdx5sx+R
         oEdyg95DLgcLau8uJtXMNIOuVjJy7C0XWVOA4AYCWdMKM5Zyb+kx/rhJryWLiqwF1F5z
         aul9xZffXnmAPp+/Mh2tXzIejw2Ud9pO7xh/n0ZaaJ9HobNvwNmRnwnn4i55zTWnp68E
         KNalRHNXiDGpi8x6eOUelYXS0V6ekY/LnBLHqlLJ7l6EL4Y7AjkzIS17NlSkRDguPEwW
         tf1/3GQUOYOkBUKFXxL9U0hS22EY+xb9x+sm2bx2xiKin0nAwqrvtlUau5dedlo3lZMc
         rCnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781796346; x=1782401146; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mWWtnFTYAhIut3RxfHIDKFIbxPqdUe9V81gCdbwXwSo=;
        b=GKMfpZM/K1rd2XFe45UH7o6ilNWxJynJ1euOGlRVERJ0fk7cqXJU9pGOUTK5zVJc7R
         dfvcvb9BmRPeSmM1vVJhpffJCQHyb6QB0GW4iG9tDfq9ij3vnmEhiLv7avbPQEO14uQ9
         fUIE2wlKnw14XE0dIvrrPzDWxjzGTS5w98Nu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781796346; x=1782401146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWWtnFTYAhIut3RxfHIDKFIbxPqdUe9V81gCdbwXwSo=;
        b=RjK7JKR8101i/QsHpT7mgcehTzIlRF//poHV0dNm7qig/ulbOOGC2MgOP1m+CHYNZY
         v/M4pXs7nk9sCeNterzAHOjnJYEGqljXs6yCSnQt8bgZ0M96inQB8bWo8YuVogdCRLVi
         xWeSBrxxJm9Q3gcGMrcyVceM6pzbTqEqUJej5lBVFsJyhLr4jLDmZCN3pQMWlO6ogOUy
         nKBu/nRpXbsBHSnCF51iKx0F6f2Y/mko6KjmeyJwZ7T3aL2mMfQuOY6BYX4pLzIuUE+o
         z12Cri9FwgU2TYwMrPLShEp81h3TXTR7FTlEaUHCwuNXmREtplGoD2+v4sTMRYObtsYT
         VW/w==
X-Gm-Message-State: AOJu0YxopOdr0L1y0LfFqt/iQcqbBOFxnlT34ulieTlIFJMAM87xavST
	NXBGNpOwqQz0NUD3z7UtEiLrgwUA5lJIYX/kPY1SFeuO1zMntxk45TbzyJQWBc8j9SG+PloOkct
	4ZizJHsa/jvwgRcnb1eRUZPIj3WWHkSa2zOo5eSfsxdvAPc5IUdnksvJm
X-Gm-Gg: AfdE7cmxiX18vbwXogrFQHKv5HDTQOkD/Fuu0OPd7W350uoBkwYVyYpoPPeWQZJFX+M
	t0DnclvznDDTuuzHEQXIss2HJhQXY77dZK9YBUbJbm3v7n7pJt1d/5dPfWxtN6sBOmBfiTC0Qew
	J9sB9fKRMCmzzTGG30RDXo5gKVwn/hMMFy+6ymlIjGOD1EyS7uxv/gShS2nOCorbYTRNLbG/hMi
	yzFvL6s86z4AA9/toauYo+meUH7rDhsvCtkCa+MkLFBvhijCbnbcExpbvvhdCWYjVQGdx3wyA==
X-Received: by 2002:a17:907:7283:b0:bec:ef6d:f5be with SMTP id
 a640c23a62f3a-c074dde39edmr247243066b.46.1781796345788; Thu, 18 Jun 2026
 08:25:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605085938.3779084-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20260605085938.3779084-1-alexander.sverdlin@siemens.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 18 Jun 2026 16:25:33 +0100
X-Gm-Features: AVVi8Cdil242QjUMT152l39jtTqMVeObER3RnTC2XN6Mtk3jBFnTzEM2bVRmpIA
Message-ID: <CAFLszThb9beaPZDV0NF8RGCPzxgOTGFVGD+cVWCKYc3+DD-tTg@mail.gmail.com>
Subject: Re: [PATCH v2] schemas: chosen: Add reset-reason property
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: devicetree-spec@vger.kernel.org, Ludwig Nussel <ludwig.nussel@siemens.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2026 at 09:59, A. Sverdlin <alexander.sverdlin@siemens.com> wrote:
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
>   pmic       - PMIC-initiated reset
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
>   security     SMS/DMSC          ele              -
>   pmic         -                 pmic             -
>
> Note: barebox already populates this property but uses abbreviated
> uppercase values (common/reset_source.c). These will need to be adapted
> to match the standardized lowercase values defined here.
>
> The list can be extended in the future as needed.
>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changelog:
> v2:
> - added "|" to the description to preserve the formatting
> - added the meaning of each item to the schema
> v1:
> - https://lore.kernel.org/all/20260526104034.2735938-1-alexander.sverdlin@siemens.com/
> RFC:
> - https://lore.kernel.org/all/579fcbc186ad2aeea3c206aebc901b64fc665db1.camel@siemens.com/
>
>  dtschema/schemas/chosen.yaml | 48 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>

Tiny nit below

>
> diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
> index 63f3c12..f6fad1f 100644
> --- a/dtschema/schemas/chosen.yaml
> +++ b/dtschema/schemas/chosen.yaml
> @@ -183,6 +183,54 @@ properties:
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
> +    description: |
> +      This property is set by the bootloader to indicate the reason for the
> +      most recent system reset. The values are generic categories that
> +      bootloaders map their platform-specific reset sources to.
> +
> +      If multiple reset sources are detected, the bootloader should report
> +      the most specific known cause. If the cause cannot be determined,
> +      use "unknown". If this property is absent, the bootloader does not
> +      support reset reason reporting.

reset-reason

> +
> +      Values:
> +        unknown  - reset source could not be determined
> +        cold     - power-on reset
> +        warm     - warm restart without full power cycle
> +        watchdog - watchdog timer expiration
> +        wakeup   - wake from suspend/sleep
> +        jtag     - JTAG/debug initiated reset
> +        thermal  - thermal shutdown/overtemperature
> +        external - external reset pin/signal
> +        brownout - supply voltage drop
> +        software - explicit software-initiated reset
> +        safety   - hardware fault detection (e.g. error signaling module,
> +                   fault collection and control unit)
> +        security - security subsystem (e.g. secure enclave violation)

Missing hyphens by my reading:

watchdog-timer
JTAG/debug-initiated
supply-voltage
hardware-fault detection
error-signalling module
fault-collection
secure-enclave

> +        pmic     - PMIC-initiated reset
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
SImon
