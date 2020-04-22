From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Device Tree Evolution Project - call notes - 22nd April
Date: Wed, 22 Apr 2020 18:21:38 +0100
Message-ID: <20200422172138.GA30250@linaro.org>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=HxkjVIEW8uEylNwPyGCqKYSodIsE+5iEPmVCU1LubGY=;
        b=nvKcaeiLFAPi0PtjHonU6wVbwcZBJEv2/pJEBODewDugCJ/aFSpIvGOgaX2buuZEYv
         KtsI5RY78K6vGxM8zNBFavqxTuNvW236k4O5gjlCeANl8tRHDEWwb2GM+qxofnZWA4qU
         fhUF9gpAQi2Bavu8n79yPT06fUzOuhcVNvTSjOpMt2Cgic9WXewiZmFmgwfd9XGRmDdJ
         dV4o/3zlg1nxFz9JBy0mm5rxpuCPWNexCEwc0y0f05rLxeiCtLqwJsPgpEj7GPIjfO7N
         jaa++YoxS6VCiD1pWtdVeVasHamwwq69m+5phVfjetz3e2YnU0nzsqPLMIUxFEeig9Y+
         GIEg==
Content-Disposition: inline
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Hi folks!

I'm sharing the notes from our regular meeting that was held
yesterday. We had quite a lot of updates around what we're doing, as
Linaro is just starting the new BUD20 cycle.

More details about the meeting etc. at the end.

Administrative note: this was my last call as tech lead for the DTE
project. I'm leaving my job at Arm and Linaro, off to pastures
new. Somebody else will be picking up the DTE project work. More news
on that soon I hope - watch this space.

Attendees
=========

SteveM - Arm
MarkB - Arm
RobH - Arm
GrantL - Arm
BillF - Linaro
ArndB - Linaro
JensW - Linaro
IliasA - Linaro
VincentG - Linaro
StefanoS - Xilinx
BruceA - Xilinx
LoicP - ST
AlexandreT - ST
cvs - ??

Notes
=====

1. Steve's last call
   a. Somebody else will hopefully pick up before the next meeting

2. Arnd has set up a shared central repo for some projects to use
   a. already done, just not in public - hosted on github alongside
      the devicetree spec and website repos
   b. name undecided - let's go with "devicetree-source"
   c. He's going to start working with the U-Boot folks to see how to
      use that
   d. Will be pulling in changes from Linux, updating by release cycle
      rather than automatically
   e. We'll integrate automated schema checking here
   f. Jens looking to start on OP-TEE then TF-A, using this tree too
      1. OP-TEE already uses multiple git repos, so adding another one
         sounds easy enough

3. Alexandre looking to continue the DT ID at runtime work
   a. Waiting on a question to David Gibson, working through review
      from the last version of the patch

4. LITE has an engineer lined up for RTOS work, should be introduced
   soon

5. System DT update
   a. Working out spec updates to allow definition of bus firewalls
   b. Lopper ready for an alpha release - git repo on the same
      devicetree-org github account should be ready to go ASAP

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

