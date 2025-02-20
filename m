Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09731F63EA
	for <devicetree-spec@vger.kernel.org>; Thu, 20 Feb 2025 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066760; cv=none; b=LH62z8YWQHhlxRxutK88lmk54zru3VyzDcNLxl7VBpqohdNg6JYiTWf83+aPyHluglvT3fB7Wg4a/C5F2hy+EejGhuJ/kA5cEFnpdOPYMMJH0dUYnx7m/kLlJ+ACM6ubfDu7+PgYqI79CqJJUSWxDM2OGzIlg0M7tS1wX9lt5DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066760; c=relaxed/simple;
	bh=eHISDzBv1WurZ5o9V489YsWoWvyFlZQUJFFCKBKP1cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ldjrazffWckZAFYCRlhyYU7wxEqN4b4DwKbqkPg3RacJxVD6z5hjtZ4xoRS8Z7Di7YFquRWQ7TTyb1NDrNiLFAwwHSU0oZqOvaae/IaSXImCHevqeXmZJoG8jui6cGmFSe97v8/19xtXV63qYafH0zmtP/HwwEyO8DHfny4/daw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tl8qp-0004jA-KQ; Thu, 20 Feb 2025 16:52:35 +0100
Message-ID: <0066fcc2-3431-48be-8dc2-00ea7e2550c2@pengutronix.de>
Date: Thu, 20 Feb 2025 16:52:34 +0100
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add 'bootsource' /chosen property
To: Quentin Schulz <quentin.schulz@cherry.de>, Simon Glass <sjg@chromium.org>
Cc: Quentin Schulz <foss+dt@0leil.net>, Heiko Stuebner <heiko@sntech.de>,
 devicetree-spec@vger.kernel.org, u-boot@lists.denx.de
References: <20250205-bootsource-v1-1-95f4ba69ac27@cherry.de>
 <CAFLszThr_vLbhU7A0_0VTLCGW03k6NmtxLVoW7OzrtxGFertZg@mail.gmail.com>
 <fb6792e8-97c5-4d0e-8ded-e73ea3a7513c@cherry.de>
 <CAFLszTg9-jMk0PBBSEVT=FonzRUNJOQ5NBMdDYUihWS8NkMhbQ@mail.gmail.com>
 <fc2c6f06-98d9-49d3-9ce5-46dd675e8846@cherry.de>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <fc2c6f06-98d9-49d3-9ce5-46dd675e8846@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-spec@vger.kernel.org

Hello,

Quentin, thanks for starting this discussion.

On 10.02.25 17:25, Quentin Schulz wrote:
> On 2/9/25 3:28 PM, Simon Glass wrote:
>> On Thu, 6 Feb 2025 at 08:46, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>>>>> diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenodes.rst
>>>>> index 8080321d6e60d6b1e86c81af86c6850246a0223b..defd1a46e4ffaa4bb085306b5e153d38b740ac66 100644
>>>>> --- a/source/chapter3-devicenodes.rst
>>>>> +++ b/source/chapter3-devicenodes.rst
>>>>> @@ -456,6 +456,9 @@ time. It shall be a child of the root node.
>>>>>                                                           the client program. The value could
>>>>>                                                           potentially be a null string if no boot
>>>>>                                                           arguments are required.
>>>>> +   ``bootsource``          O     ``<string>``          A string that specifies the full path to the
>>>>> +                                                       node representing the device the BootROM used
>>>>> +                                                       to load the initial boot program.
>>>>
>>>> Could/shoud this be a phandle instead? It might be more efficient.

AFAIK, all other properties in /chosen (e.g. stdout-path) are strings
Having this one be a phandle would be confusing IMO.

>>> - a boot source would not be available in DT yet (though we probably
>>> shouldn't write it in /chosen/bootsource since we wouldn't know the
>>> proper path to it), e.g. USB loading, this is usually done via a
>>> proprietary protocol and/or tool (e.g. rockusb/rkdeveloptool for
>>> Rockchip) but no USB support yet in boot program or kernel (that was the
>>> case for a long time for RK3588 for example and I still have at least
>>> one device without the USB node described yet).

I don't think we want to go there. /chosen/bootsource should always point at
an existing node. If there is no node, the property shouldn't be there at all
until an actual hardware device tree node is created first.

>>> And additional argument for full-path: Barebox already uses that.
>>
>> Were there discussions with that, which could be used here?
>>
> 
> @Ahmad, any piece of history you'd like to share here maybe?

I can't share history, as the addition in 2018 predates my involvement
with the project. I can share some thoughts and experiences though:

- Inside barebox, the bootsource is most often used for

  - loading the correct environment:
    For modern boards, barebox automatically looks up a GPT partition with the
    barebox environment type UUID and loads it. As there can be multiple such partitions,
    it prefers the partition that is located on the original boot medium as indicated
    by the bootsource.

  - setting a barebox update handler as the default:
    barebox_update /mnt/tftp/my-barebox-image without further arguments will by default
    update the barebox binary on the original boot medium

  - inside scripts. A common stanza is an init script that has:
    if [ $bootsource = serial ]; then global.autoboot_timeout=30; fi
    So the boot is delayed a little.

- If standardized, /chosen/bootsource could be useful to pass information from
  first to second stage bootloader. E.g. on Rockchip, the information where the
  system is booted from is in RAM that's only available early on in EL3.
  Currently, barebox running as first stage copies that information to a place
  where it's not clobbered by BL31, but we could in theory also have the barebox
  prebootloader parse it and fix it up into the device tree it already passes
  along to barebox proper.

- /chosen/bootsource can be used in userspace to detect if the system was
  booted in recovery mode and to adapt accordingly.

- /chosen/bootsource can be used to load boot state from the correct boot
  medium. This is useful when the exact same image is flashed to e.g. a SD
  and an eMMC.

As Quentin mentions this is only about the first external boot medium.
This doesn't reduce usefulness much though, because systems increasingly
have a single boot medium anyway (e.g. eMMC boot partition + user area).

Cheers,
Ahmad


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
