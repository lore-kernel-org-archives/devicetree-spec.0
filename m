From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Device Tree Evolution Project - call notes - 8th April
Date: Thu, 9 Apr 2020 19:24:59 +0100
Message-ID: <20200409182448.GA10632@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=7sQdsURjxZtcQzqhZeuGbKUUsJVBjCXDy0IQ89dVAOM=;
        b=ZAg+U0kXodiqPOaVRNF4twXneFcbA0FE7LxB0/SFjodebhtiAavZIttMsQtVoXnilv
         tXs/ht8Ycfoobvc4Xy7k1fAu+hn7/nyBfkRyomsfnE43b53t+Pn5WIpYToDSFfSkIqPe
         vx21coLx/LAHV/4EMUvhSxKlPH7BMgS/SKN6b4lZGG7jOBDulz+1iLRNkVYnR7gn53Dw
         iYGAYi7U4rjaVnVnYJtK3JMJQQG7gNsKQi0ERHedCulsVdRuoBgI/VfC7zrPzpRzyVWS
         ZnjT6xmiJ47k4LueWsau9pEIKcfgc6g+CRNWbNKdBOdVNSHhk7r9SPO0PqjwReu3ghTJ
         PyaQ==
Content-Disposition: inline
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Hi folks!

I'm sharing the notes from our regular meeting that was held
yesterday. We had quite a lot of updates around what we're doing, as
Linaro is just starting the new BUD20 cycle.

More details about the meeting etc. at the end.

Administrative note: as mentioned briefly in the notes here, I'm
leaving my job at Arm and Linaro soon (May), so I'm not going to be
doing this much longer. Somebody else will be picking up the DTE
project work. More news on that soon I hope!

Attendees
=========
TomR - TI
JensW - Linaro
FrancoisO - Linaro
BillF - Linaro
JoakimB - Linaro
FrancoisO - Linaro
IliasA - Linaro
SteveM - Arm
StefanoS - Xilinx
MarkB - Arm
LoicP - ST
RobH - Arm
KumarG - Linaro
EricF - ST

Notes
=====

* New cycle in Linaro, with some change of focus
* Not looking at removing stuff from kernel (DTE-5). But setting up a
  new repository people can use for OP-TEE, TF, U-boot, etc.
* FF and LEDGE team will be driving some of the lifecycle work
  (DTE-8).
* DTE-25 is a new initiative to describe some U-Boot work that Arnd
  will be looking at. Expecting Arnd to talk to TomR and other U-Boot
  developers. This is a container for the discussion and work.
* DTE-26 is overlays, still an important piece for several Linaro
  members
* DTE-3 (Runtime identification): Hoping Alexander will complete his
  patches there
* Looking to help with CI. Doing testing for compatibility as changes
  go into DT.
* System DT discussions on-going
  1. SS: Gave presentation at Tech Days. Rob and Grant spotted an
     error in one example. Looking at bus driver
     configurations. Bruce is sending the lopper codebase upstream.
* Intro to Jens - hoping to do some work around OP-TEE and DT
  1. RH: Summary of plans for TF-A and OP-TEE?
  2. SM: Want to see if can get people sharing DTSs from the new
     repository.
* SM: Announcement - will be leaving Arm and Linaro soon, so not
  involved here much longer
* Votes on Linaro's PoR process expected to finish Friday

Setting up a new repo, basing on the -rebasing tree
---------------------------------------------------

* JB: Would like to continue the discussion about the new Devicetree
  rebasing tree. Is it a good idea to start copying
  everything. Suggest having a clean reference as an example.
* FO: Yes, but with a few platforms to have some diversity to test,
  but not a thousand interconnected platforms.
* JB: What’s the current status?
* RH: A lot of platforms are stable. Think important to take the tree
  and filter it down, but automate it and not make changes downstream.
* SM: Happening quite often at the moment. Arnd was suggesting take it
  in sync with each of the release tags.
* RH: Yes. DTs don’t change much after RC1.
* JB: Maybe an opportunity to clean up things at the same time.
* RH: Don’t think things are in bad shape.
* FO: Questions to Stefano/Silicon vendors - what recommendations to
  focus on for rebased tree?
* LP: MP1 has multiple device trees (TF, OP-TEE, Linux, Zephyr) … and
  also multiple (4) boards and also chip variants.
* SS: Xilinx Zync MP seems a good candidate - would need to get back
  on this. Same DT (at least very similar) as Ultra96
* LP: These two mean have 1 64-bit and 1 32-bit platform.
* JB: Adding FVP?
* FO: What is FVP licensing situation now?
* JB/JW: Foundation model is free to download and use.
* SM: Will get together with Arnd and work through this (platform
  selection?)
* JB: checked - FVP download is free but have to register to login
  https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms

systemd-boot
------------

* FO: Have seen systemd-boot having commands for Devicetree
  overlays. Don’t know what they do. Related to RPi??
* RH: Suggest to send out a link
* FO: https://github.com/systemd/systemd/issues/13537
* SM: Believe looking to replace Grub. Been going on for a while but
  not the most commonly used thing. Only ever seen a few people
  wanting to use it.
* TR: Some usecases - getting system to boot quicker than it Grub did
  it. Been used in AGL on x86 for a while.
* FO: U-boot should be doing some DT ‘massaging’. If systemd is also
  doing it - why?
* TR: DTs do exist on x86, also need to support Armv8 systems that
  don’t have U-boot. Accept that there are Armv8 systems not running
  U-boot.
* FO: If RPI guys did it prior to the OS, validates for me that
  overlays are not done in the OS
* LP: Had long discussion previously and agreed to aggregate them
  before the OS (security concerns).
* LP: TI have ‘cape’ (hat) with overlays.

Background information about DTE
================================

Linaro engineers are working on a range of initiatives in the DT
space, collected together as a project called Device Tree Evolution
(DTE). We hold a discussion call every second Wednesday at 1600 UTC /
1700 BST / 1200 EDT / 0900 PDT. If you would like to be invited,
please ask me (Steve McIntyre).

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

