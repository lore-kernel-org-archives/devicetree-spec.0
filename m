From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Device Tree Evolution Project - call notes - 29th January
Date: Thu, 30 Jan 2020 13:56:17 +0000
Message-ID: <20200130135605.GQ3697@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=Lnf5FRVVNBexzgBv+pgwwWSQYnhtWwX3QZ+O26pOJv0=;
        b=rt+Fy4H+i+ovLAE82z5USUtZ09cLi/sSMyFdXL5nrEvTd5Q+ieAswVejbanxK6srkg
         7WWd7JJ5dYv8mPOQWJqBPuARKvxKtAelDHI8/E9yJL0BvIFOuspKNHhs0WuMD5MTM0ZV
         p7ulSY9N1LnVc8S7S7l6ReCp6IvbU4F3LqZmaW5ujxj48LYeSegLOYWiEO3+ZcueMkGI
         EwdOmrW9P4LO10o+aeYUH9LdHLBzQEiahNv1As9rq4wEAaOYIUxEY37UeqQ/OqdpltGQ
         nLWTVf8rpGLlpQXfXNaCAYm7qYQ4WSiImZ1Zz0UegV+0iJM/8HJy4sAAyU68HFiCO/Y0
         mdmA==
Content-Disposition: inline
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

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
Steve McIntyre                                steve.mcintyre-QSEj5FYQhm4dnm=
+yROfE0A@public.gmane.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

