From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Device Tree Evolution Project - call notes - 11th March
Date: Thu, 12 Mar 2020 17:10:26 +0000
Message-ID: <20200312171021.GC11984@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=NayanUliINfTa1h1CPTm4oIeIqhJSzWhxEK5RQWLfYc=;
        b=GgJ+k42zrX7l8E328p97uJckS2VMrjotl81EYPn1uJgljaV3apF4gZ1uHl7nO0BTT/
         7dsRStntgzTIlJTwASs5iQFwOLHlFbpIooKXPd7IwCkFGPxvOu1JAWNgi2q1jvzlkEMT
         yNSGQhyPsDKl65ymznY1Q14ni9jLyUGikg0IUTYzyTiXYJcxEt5kfXbl2WQYzcqjAn3q
         1SlVI/KQ+ePZODZSyBQcnzfYxEQ9Kssijb8qHraQeVKBStprtxw4tTb80Jn46S9AxzFw
         sU/Elcw4QsLr0bhdJwnGdnHfwYtp7oWjtil80BgvIXj2ymD0GUNK6976deaeAgq+ojOp
         SD8A==
Content-Disposition: inline
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Hi folks!

I'm sharing the notes from our regular meeting that was held
yesterday. We had updates around few of our initiatives, some
discussion about our possible DT sprint and a lot of conversation
around DT in U-Boot.

More details about the meeting etc. at the end.

Attendees
=========

GrantL - Arm
MarkB - Arm 
TomR - TI
StefanoS - Xilinx
BillF - Linaro
VincentG - Linaro
SaravanaK - Google
TrilokS - Qualcomm
FrancoisO - Linaro
KumarG - Linaro
ArndB - Linaro
BenjaminG - ST
SteveM - Arm
FrankR - 

Notes
=====

1. Sprint

   a. SM: No sign of this happening any time soon - obvious problems
          with travel at the moment
      a. AB: If Plumbers doesn’t get cancelled it’s likely that fewer
             people will be there.

2. Updates

   a. BG: RFC2 sent about Alexande's work putting date on
          Devicetree. Simplified the code. Not a lot of comment on the
          RFC. Maybe some issue for parallel building. Needs more time
          to work on the preprocessing stuff. Propose to drop ‘RFC’
          and go to a patch.

   b. SM: Prototype work for external repo support?
      1. AB: Haven’t done any new work on it. Most sensible approach
             would be to start with a fork. Can move files
             individually into that repository.
      2. SM: If not a lot of work in the kernel anything stopping us
             from moving ahead.
      3. AB: One way to demonstrate it is if one of the external
             projects starts using the fork of the rebasing tree. Or
             if a distro (e.g. Debian) package takes DT files from
             external tree

3. SM: U-Boot? This is currently a bit ad hoc AIUI?

   a. TR: For the base DT, if it’s a platform supported in Linux, take
          latest upstream commit or next branch. Don’t regularly sync
          - long term goal.
   b. SM: How difficult to add support into U-Boot build to add
          support for an external repo?
   c. TR: Don’t want to add a submodule to the official tree. Would
          just need to periodically sync
   d. GL: How about having the ability to enable it? 
   e. TR: Don’t see a big problem but would need to develop some logic.
   f. GL: Would be base functionality that could be rolled out.
   g. AB: One advantage of external repo is can have properties that
          are not required by the kernel. What are currently adding in
          U-Boot
   h. TR: Details like what is needed before relocation. Not supposed
          to put in Device Tree but how we solved the problem
   i. BG: Need to take care of the size of the DT
   j. FO: May want to standardize the binding in U-boot code -
          generic/environment/U-boot/Xen - want to have this specified
          in the external repo. Then number of dtsi for building
          different device trees. Have a U-boot specific dtsi
   k. TR: Normally need to strip things out of the Linux
          DT. Conceptually agreeable to have bindings that are better
          documented not just reusing Linux bindings. Not convinced
          can have DT entirely somewhere else. Machine specific
          information in kernel.
   l. AB: Stripping down for size - similar to problem that System
          Devicetree tries to solve by stripping out what is not
          required for a specific DT.
   m. SM: How space-limited is U-boot for DT?
   n. TR: Hard to answer. Most limited case - some platforms have
          12kbyte memory. Allwinner devices can be limited to 40-60
          kbytes. Can process DT to generate defines at compile time
          for constrained platform.
   o. BG: Some bindings for example for display pipe are different in
          DT for U-boot vs kernel. almost entirely different.
   p. TR: In kernel, may have changed the way to describe a device
          that takes more space.
   q. KG: Code generation approach could be more interesting in this
          case.
   r. BG: In the kernel we describe the panel. In U-boot are hard
          coding the resolution of the panel. Similar for audio.
   s. FO: Binding is not clear
   t. BG: Framework below doesn’t need the same information. U-boot
          doesn’t need to manage all the resolution.
   u. AB: Abstraction is leaky.
   v. BG: Different way to give the information. no need to support
          reconfigutration. Just describe what you want.
   w. SM: Should be talking to the U-boot community about what could
          be useful to them.
   x. BG: Does U-boot plan to use yaml to check the bindings?
   y. TR: Not planned at the moment. Are some DTs that are very far
          behind the kernel. Lower hanging fruit. Aim to keep as many
          of those DTs in sync as possible. Then look at how to
          leverage tooling.
   z. SM: What is typical story for DT for U-boot. Would it pass on
          its DT to kernel on some platforms?
   aa. TR: Depends on what the target wants to do. RPi given valid DT
           from BCM firmware. Can then pass that on to the
           kernel. Other platforms where we’re size constrained. Pare
           it down. Use it for U-boot. Then know we need to load a DT
           from wherever and pass it along.
   bb. AB: In trimmed down case, how often need to resync that DT?
   cc. TR: Will grab at some point in time. Will then only be updated
           if new support needed or if there’s a new DT compiler that
           generates more warnings. Do trimming down at build time.
   dd. SM: Already have a programmatic way of doing this?
   ee. TR: Yes. At build time we drop parts of the DT. At boot time
           can’t access NAND or SSD. Later can load the full DT.
   ff. TR: https://gitlab.denx.de/u-boot/u-boot/-/blob/master/scripts/Makefile.lib#L529
           https://gitlab.denx.de/u-boot/u-boot/-/blob/master/tools/fdtgrep.c
           There's most of the logic/tools around removing stuff from the dtb
   gg. SK: Some way to have a minimal DTS file for a platform, and
           then include more stuff for OS. Then U-bo ot wouldn’t need
           to take a tree and drop it.
   hh. TR: Would be an interesting application for overlay.
   ii. SK: Not thinking in terms of overlay, just including a file at
           compile time.
   jj. TR: could be interesting.
   kk. SK: Less nodes wouldn’t be a problem.
   ll. TR: Not currently a maximal optimisation.
   mm. FO: For display panel could use concept of namespace.
   nn. SK: Not trying to solve it with concept of System
           Devicetree. Just making a subset. Doing at a property level
           would be too hairy. At least at the device level.
   oo. TR: Question - is the incremental level useful vs solving
           problems at a broader scope.?

4. SS: System DT updates. 
   a. Will have a session at the ‘Tech Days’ in Linaro. Plan to
      address an FAQ.
   b. Bruce pushed his code to GitHub. Under BSD license. It’s finally
      out there. Will send out links shortly.
   c. (info: ‘Tech Days’ are two days of remote presentations in lieu
      of Connect. Agenda will be released at the end of this week.)
   d. SS: Need to set up some meetings in Connect week because the
      in-person meetings aren’t happening.


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

