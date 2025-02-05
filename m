Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC7022A4D0
	for <devicetree-spec@vger.kernel.org>; Wed,  5 Feb 2025 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738746726; cv=none; b=IwpM5CAeDLq0yiAk+yuqBzPYZRnrw4F8c4ayE9jOhKecJ9OV/WFlqqlAy56WGEXThMdkw8Dv492lqvo4+noAwXic8G+7VnDIkbA8lHV4zbTz5PI0VDAA+qIGi7KUjAp04X+7DK1tn7rA8n0XwAYbEfAcdIPvqG6xFjP8lKNKB5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738746726; c=relaxed/simple;
	bh=cG/UbWsSOmCWe7nz8oQybzGOLFAFH/8ONKQIyG8Vu/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tDeO3Qv1MCet74YqACeRlY1GRBy0wo9fQnvTkMuX1DpDWrWWJnpiVqq9UWEkrbmp+LH9cLbIm+YkTDV87m3Z3hVyfwRLJx1iLBQEB4dd6taT3tTzS2dWWG/4c8URkNt69OUW0x1KgMhHEfHZ8imd5tPuobXfVZsTN/n5eDzeSzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=83.166.143.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Ynvcq2FMbzn7G;
	Wed,  5 Feb 2025 10:11:55 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Ynvcp3sfszCfQ;
	Wed,  5 Feb 2025 10:11:54 +0100 (CET)
From: Quentin Schulz <foss+dt@0leil.net>
Date: Wed, 05 Feb 2025 10:11:34 +0100
Subject: [PATCH] Add 'bootsource' /chosen property
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-bootsource-v1-1-95f4ba69ac27@cherry.de>
X-B4-Tracking: v=1; b=H4sIAEUro2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNT3aT8/JLi/NKi5FRdC5OUNCNT01TLVLNkJaCGgqLUtMwKsGHRsbW
 1APEznJ9cAAAA
X-Change-ID: 20250205-bootsource-84df255e9e6c
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Heiko Stuebner <heiko@sntech.de>, devicetree-spec@vger.kernel.org, 
 u-boot@lists.denx.de
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

Bootloaders typically can be loaded from different storage media, such
as eMMC, SD card, SPI flash, EEPROM, but also from non-persistent media
such as USB (via proprietary protocols loading directly into SRAM, or
fastboot, DFU, etc..), JTAG, ...

This information is usually reported by the SoC-ROM via some proprietary
mechanism (some specific address in registers/DRAM for example).

It would be useful to know which medium was used to load the first stage
of the bootloader. SoC-ROM shall be ignored and not reported in this
property.

This can allow client programs to detect which medium to write to when
updating the boot program, or detect if fallback mechanisms to
unexpected medium were used to reach the client program's execution.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Bootloaders typically can be loaded from different storage media, such
as eMMC, SD card, SPI flash, EEPROM, but also from non-persistent media
such as USB (via proprietary protocols loading directly into SRAM, or
fastboot, DFU, etc..), JTAG, ...

This information is usually reported by the SoC-ROM via some proprietary
mechanism (some specific address in registers/DRAM for example).

It would be useful to know which medium was used to load the first stage
of the bootloader. SoC-ROM shall be ignored and not reported in this
property.

This can allow client programs to detect which medium to write to when
updating the boot program, or detect if fallback mechanisms to
unexpected medium were used to reach the client program's execution.

Note that this property is already set by Barebox and I'm planning on
adding it to U-Boot as well, specifically for Rockchip SoCs.

I have some doubts about the wording, especially in the case of
hypervisors or chained boot programs. I'm not entirely sure what would
make the most sense to put in the property for those scenario.
---
 source/chapter3-devicenodes.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenodes.rst
index 8080321d6e60d6b1e86c81af86c6850246a0223b..defd1a46e4ffaa4bb085306b5e153d38b740ac66 100644
--- a/source/chapter3-devicenodes.rst
+++ b/source/chapter3-devicenodes.rst
@@ -456,6 +456,9 @@ time. It shall be a child of the root node.
                                                        the client program. The value could
                                                        potentially be a null string if no boot
                                                        arguments are required.
+   ``bootsource``          O     ``<string>``          A string that specifies the full path to the
+                                                       node representing the device the BootROM used
+                                                       to load the initial boot program.
    ``stdout-path``         O     ``<string>``          A string that specifies the full path to the
                                                        node representing the device to be used for
                                                        boot console output. If the character ":" is

---
base-commit: 5688e1c0b961d2ca5a32e3b624a9f4a9b433184f
change-id: 20250205-bootsource-84df255e9e6c

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

