Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED656458
	for <devicetree-spec@vger.kernel.org>; Tue, 27 Feb 2024 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709027946; cv=none; b=okfsQvNvPdnb0GEdRZgHl9DO7A6koMJEm+8Tu3sjuLgq6lpfcnua+OeFj/tjv6XHn+KdyIf6onBeLzXNkQoVUurkZKHBKp4J4IQAJm1eZHiBxDRr7sMHH9X9nmGocB3Y1zdIngm/HpFsXNKalJv2Q9BtnAgJTTzAkPxHf0mE3CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709027946; c=relaxed/simple;
	bh=kLtkdKzs02s+iS8m74tchSxsMGBDiqvghfIqLUrU+xE=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=cF7UtTXMLaV30x6FLf197ZcZwRawSgWubHj2zMjX6yXGcF62mRD+YMvfd7Q6R9ESHAsrDcVW4rYOJz3dERuTAXQl8J9jv0Ey2ZZiujnLnF2WJSV+8v78d5bUENaC0Dbq/z806hSCa+EWxEegPiysJH9zTpRoeH13iHSu/J8Qcao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=rXYzTCQY; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="rXYzTCQY"
Received: from webmail.free.fr (unknown [172.20.246.3])
	(Authenticated sender: sylvain.saboua@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPA id AAA9A2003F3
	for <devicetree-spec@vger.kernel.org>; Tue, 27 Feb 2024 10:58:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1709027936;
	bh=kLtkdKzs02s+iS8m74tchSxsMGBDiqvghfIqLUrU+xE=;
	h=Date:From:To:Subject:From;
	b=rXYzTCQY/ovy+s7aHrRNg2vEEWWTZtyWoPF3GNVc8xf6BHdpASRdCXzJ2CF8MzbFf
	 2pQD/PGTz7wRw+b6YAO4BLNa48nIzYrXz/Po8IkvA4lN+S1NoVog6LSt8AeB4+mXGk
	 flSpTT+Hd4nBEeQ6RmPNb8I571abRUfGC1+bFnwgMli9NZKCMyq3sn2Ynq2Z6ZEx8o
	 l4M7QHxy1n1UD5p5JctHxWDcrmNyPVGAVRlACGmtLmek6+5yY0GkioJkl9a0OhSNCy
	 XmXRTmfDJwaVjES5i/tcv4COlYD6iLfSCn4QywHkus9GkJA80wsCbYbkl2DsRoMfLD
	 KhTwW9zMqXjbg==
Received: from 2001:861:2c20:70:9990:9da1:3cd7:ba56
 via 2001:861:2c20:70:9990:9da1:3cd7:ba56
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 27 Feb 2024 10:58:56 +0100
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 27 Feb 2024 10:58:56 +0100
From: Sylvain Saboua <sylvain.saboua@free.fr>
To: devicetree-spec@vger.kernel.org
Subject: =?UTF-8?Q?Firefly_RK3399_=E2=80=9CInvalid_device_tree=2C_expect_?=
 =?UTF-8?Q?boot_to_fail=E2=80=9D_=28openbsd-current=29?=
User-Agent: Webmail Free/1.6.5
Message-ID: <1a9657a715f2929793c1687baf80129d@free.fr>
X-Sender: sylvain.saboua@free.fr
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I am trying to boot and install openbsd on my Firefly RK3399 ARM SoC.

With the latest packages I get the following error :
WARNING: Invalid device tree, expect boot to fail
(line n° 152 in the full output https://pastebin.com/5gsrd5Jz)

And the boot indeed fails.
This is very strange, given that using the same method and dtb file
a few years ago circa 2019, at the time when obsd support was minimal,
I managed to boot and install it on the very same card.
What could have gone wrong ?

The incrimined file is 
/usr/local/share/dtb/arm64/rockchip/rk3399-firefly.dtb
provided by the dtb package : https://openports.pl/path/sysutils/dtb

I also mailed the openbsd-arm mailing list earlier when trying to boot
from SD card and am now stuck there
https://marc.info/?l=openbsd-arm&m=170836038500353&w=2

Thank you
-- 
Sylvain Saboua
www.saboua.xyz
