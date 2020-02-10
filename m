From: "Mills, William" <wmills-l0cyMroinI0@public.gmane.org>
Subject: RE: Device Tree Evolution Project - call notes - 29th January
Date: Mon, 10 Feb 2020 16:58:26 +0000
Message-ID: <3b257f2a0ccc4f9f9ca0be2de8c9e382@ti.com>
References: <20200130135605.GQ3697@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581353906;
        bh=W+JFCjLKjQGGX2bcoDGvrzoCFKWHOFn7hCJSGH+8uOk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=a79aiN96z/KiVdTe5/aLToXlyASMTovRS2RCeoPnl0NSbhnu3IUUsgjAPvHfBCOBc
         JDPF4ilBsjVwiJda8KKla5v9pocyvNcc2JXFlDAlPOCf3Srdd6dmhmF4NYbEqe78Y4
         ldF6E/nRgaSobYmscE4L9/Gw1iCeL9Witiow+Zfo=
In-Reply-To: <20200130135605.GQ3697-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Kristo, Tero" <t-kristo-l0cyMroinI0@public.gmane.org>, "Valkeinen, Tomi" <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, "Murphy, Dan" <dmurphy-l0cyMroinI0@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org" <tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Steve,

Can TI get on the agenda for this week's meeting?

We have a simple approach to make progress on boot loader applied overlays.
It is a small repo with just the overlays.
It builds the dtb's from the upstream kernel repo and the overlays from thi=
s repo.
We are going to do this at git.ti.com so we can make progress.
However we would like to suggest this as a simple way forward to collective=
ly host things the kernel maintainers do not want in the kernel.
Does it make sense to host something like this in devicetree.org github acc=
ount?

I think this is a very reasonable way forward and more practical than:
* moving all DT's out of the kernel (or sync'ing two homes etc)
* reworking overlay support to be the "one final good way"
* everyone keeping this stuff in their own vendor trees, each doing somethi=
ng different and generating N solutions

We will push the repo somewhere public before the meeting.

(CC'ing Tom and Tony does not constituent their endorsement, we are startin=
g to talk with them now also)

Bill

-----Original Message-----
From: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:devicetree-spec-owner@v=
ger.kernel.org] On Behalf Of Steve McIntyre
Sent: Thursday, January 30, 2020 8:56 AM
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Subject: Device Tree Evolution Project - call notes - 29th January

Hi folks!

I'm sharing the notes from our regular meeting that was held
yesterday. We had updates around several of our initiatives,
particularly around System DT and runtime identification of DTB.

More details about the meeting etc. at the end.

Attendees
=3D=3D=3D=3D=3D=3D=3D=3D=3D

SteveM - Arm
GrantL - Arm
MarkB - Arm
RobH - Arm
AlexandreT - ST
BenjaminG - ST
EricF - ST
Lo=EFcP - ST
BillM - TI
FrankR - ??
BruceA - Xilinx
StefanoS - Xilinx
MathieuP - Linaro
BillF - Linaro
KumarG - Linaro
VincentG - Linaro
TrilokS - Qualcomm

Notes
=3D=3D=3D=3D=3D

1. DTE-18 - DTB runtime ID
   a. Alexandre posted patches, went through review
   b. v2 coming soon
      1. Don't modify DTC directly, but tweak how things are built
         slightly
      2. ETA? maybe 3w

2. DTE-19 - working out what's changed since the DTB build
   a. Time to talk on the list to see how to do this best
      1. Checksum per node, one of 2 ways:
         a. Modify the sources to include the checksum?
         b. Update the DTB format to add support directly?
      2. Discuss on-list

3. DTE-17: Arnd's prototype work for external DT repo
   a. Status update? No Arnd this week, so not this time
   b. Not everybody will be at FOSDEM or the Arm kernel summit in
      Cambridge, so limited scope for discussion about this
   c. SM will try to organise something for Cambridge next week

4. DTE-2: System DT
   a. Adding spec for new bindings is ok, but need to add more
      explanation of how things should be used (e.g. how to map
      interrupts to multiple domains, multiple controllers)
   b. Stefano promises more docs soon to describe things
   c. ETA for having a working demo?
      1. Will change again before it heads upstream
      2. Things work ok for a demo already! :-)
      3. Just needs more docs to describe

5. DTE-8: DTB lifecycle
   a. Trying to get LEDGE group working on this, working on planning
      meetings for next week
   b. Interested parties - please say so and we'll try and include you
      too
   c. Specifically thinking about bootloader-applied overlays, not
      dynamic stuff applied by kernel at runtime
   d. TI really looking for a collaboration space here
   e. ST interested in U-Boot starting with one DT, then applying an
      overlay before passing it to kernel
      1. Source-level problem here - whey do we have two different
         (almost-complete) DTs in both U-Boot and Linux?
      2. DTE-17 could help here

6. Meetings at BUD20 Connect?
   a. Let Steve know about availability and what you'd like to talk
      about
   b. Sessions in the BUD20 schedule:
      1. Thu 11:00: System DT
      2. Mon 15:30: New approach to dynamically manage hardware bus
         firewalls

7. Linux on Arm summit in Cambridge next week
   a. Some of our group will be around and may have some informal
      discussion
   b. Not a formal DT sprint!


Background information about DTE
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

Linaro engineers are working on a range of initiatives in the DT
space, collected together as a project called Device Tree Evolution
(DTE). We hold a discussion call every second Wednesday at=20
1700 GMT / 1200 EST / 0900 PST. If you would like to be invited, please
ask me (Steve McIntyre).

This is a summary of the notes from the most recent meeting. I aim to
tidy up and post the meeting notes shortly after each meeting. The raw
notes are published at

https://docs.google.com/document/d/e/2PACX-1vRVDrVFWjIOascqZFCO--T8pIqyFB_M=
Dh9cvgyoqhI6Y0tqaA9TcCcvQhcmxi5IY7CG44JfIrCdAUDL/pub

For more information about DTE, see:

 * https://www.linaro.org/engineering/core/devicetree-evolution/
 * https://www.linaro.org/assets/pdf/Linaro-White-Paper--Device-Tree-Evolut=
ion.pdf

Cheers,
--=20
Steve McIntyre                                steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

