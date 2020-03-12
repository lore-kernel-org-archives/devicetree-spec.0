From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Device Tree Evolution Project - call notes - 26th February (belated)
Date: Thu, 12 Mar 2020 16:42:47 +0000
Message-ID: <20200312164247.GB11984@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=SbOtv1cwha9uZqEc91eJAdX30SuUE8Nj9FuQAkSSFl4=;
        b=MABek/pFSwxtuPCbQkC0cdJ/GqV+Ag0a+x9gAMDD8VIzRz0v8TM3JcQU8BASqYzoXY
         25vd1bHJhkXqUBGMlphKGf45W+mVG1c+rayEyAQA+0PooIQKYfhRqoM3F/hbf/6Vgdzt
         Bxyb66x1Ur29Ei37ottZYCSMPBwCd+9vKKtK2XdLBuZvZYGbcb7ogH/Pm/GwBSC5K4gq
         ofJrfqdxq712q3J6FNctwUgDBLZTS0oXQtolDZClMUOat7kBm1f2MMZfKjFkPNe0vAMX
         Tbd9+5NP60aS6n/cBXj0vHxAVyZTKQ9EU/fIEsUNtE3/ow55ZgFXalECE/p4DWYBRTMM
         V+SQ==
Content-Disposition: inline
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Hi folks!

Apologies for the delay; I'm sharing the notes from our regular
meeting that was held a couple of weeks back while I was away on
vacation.

More details about the meeting etc. at the end.

Attendees
=========

MarkB - Arm
BruceA - Xilinx
NishanthM - TI
TomR - TI
EricF - ST
BillM - TI
FrankR - 
BruceA - Xilinx
StefanoS - Xilinx
BillF - Linaro
VincentG - Linaro
TrilokS - Qualcomm

Notes
=====

SS: Bruce is about to release the open source lopper tool to get
    today’s device trees out of System Device Tree.
VG: Discussion on how to test Device Tree - Mark? Idea to use
    KernelCI?
MB: Not done anything yet. Rob’s DT binding check is running now. No
    new tests.

BM: On overlays - wanted kernel build procedure to build the overlays
    and apply them to the base (not exhaustive but all relevant
    combinations)
FR: Could have top level source file that includes both base and
    overlay and compile that in one step.
BM: Are there any errors that we wouldn’t catch that way?
FR: yes, potentially. Compile base separately and test separately.
BM: At make level could just be a bunch of combinations listed. At
    source level have one source file for every combination. TI has
    some homework to get our overlays in shape.

BM: Saw some discussion of marking DTB with kernel version that built
    it. Seems to apply also to the overlays. If built separately
    should say which version expects in base.
FR: Should be part of the overlay build rules.

FR: seems there is a program in DT project that claims to apply a
    number of overlays to a base blob. Not tested but there is a
    program out there. When the kernel does start accepting overlays
    at run time, we may have different rules for what we accept at run
    time, e.g. modifying properties of existing nodes (except maybe
    status). Problematic to modify once has been scanned. May make
    sense at U-Boot level.

BM: Tom, what about U-Boot - has source level overlays. Is that what
    you’re testing?
TR: under tests/overlay. Tests that command to apply an overlay does
    what’s expected of it. Not testing arbitrary trees. Have specific
    test trees. Test of the U-Boot code.


Background information about DTE
================================

Linaro engineers are working on a range of initiatives in the DT
space, collected together as a project called Device Tree Evolution
(DTE). We hold a discussion call every second Wednesday at 
1700 GMT / 1200 EST / 0900 PST. If you would like to be invited, please
ask me (Steve McIntyre).

This is a summary of the notes from the most recent meeting. I aim to
tidy up and post the meeting notes shortly after each meeting. The raw
notes are published at

https://docs.google.com/document/d/e/2PACX-1vRVDrVFWjIOascqZFCO--T8pIqyFB_MDh9cvgyoqhI6Y0tqaA9TcCcvQhcmxi5IY7CG44JfIrCdAUDL/pub

For more information about DTE, see:

 * https://www.linaro.org/engineering/core/devicetree-evolution/
 * https://www.linaro.org/assets/pdf/Linaro-White-Paper--Device-Tree-Evolution.pdf

Cheers,
-- 
Steve McIntyre                                steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

