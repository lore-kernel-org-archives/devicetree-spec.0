From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Device Tree Evolution Project - call notes - 15th January
Date: Thu, 16 Jan 2020 15:00:30 +0000
Message-ID: <20200116150024.GA32331@linaro.org>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=oWr0SwLfRMF//FLlJ4wjmLtPuBoo6E+MVJNy3H7lmt8=;
        b=wyaujk8GVKVxhxcvZKP62KKqmROl6yX09SSKSeOVUnK1a3X9pN8EqT7yP3VuAmlhMB
         pePsaok8+pacV4zQ4sElljWf5nojzJ8lqxZNZp/LpZrX3IcpjsJAN9fKWyiod3OmLviJ
         uArCwjvskDbHQ4LcTA/Zlvtu7dGbMh3/+GWMt+5J0vDYNFHuq9PYz9UZYs6c96cemBQn
         L5Lw/L+qYnCmKAQUd9c1459OkCdh3Jd9Np0P8qobZYNuHLRFyzQGKKIKNg1AyCz6uQzj
         pMyOR7kR+ACWKEgV1LSSmQxbg1YqIGiOMzA2jMM6KfDQOpIXUX7L6JsYRFR/knN6UvI/
         u7TA==
Content-Disposition: inline
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Hey folks,

I'm sharing the notes from our regular meeting that was held
yesterday. We had updates around several of our topics, particularly
how to maybe work with a new/shared repo for DT data and runtime
identification of DT.

More details about the meeting etc. at the end.

Attendees
=========

SteveM - Arm
AlexandreT - ST
BruceA - Xilinx
StefanoS - Xilinx
TomasE - Xilinx
MathieuP - Linaro
ArndB - Linaro
BillF - Linaro
TrilokS - Qualcomm
VincentG - Linaro
SaravanaK - Google

Notes
=====

1. DTE-18 - DTB runtime ID
   a. Alexandre has posted patches
   b. SM: tested, looks good
   c. Waiting on reviews

2. DTE-17: Investigate and implement directly supporting an external DT repo in Linux
   a. Arnd working on prototype
   b. Tried a few of the options:
      1. git subrepo
         a. not good - loses all the git history so no use
      2. git subtree
         a. can import an external repo
         b. closer to what we have now
         c. very slow at picking up on changes in the Linux tree that
            might need externally pushing
      3. git submodule
         a. everybody says it's awful, but...
         b. would work well as a way to push out things that we don't
            care about (e.g. for people not working on DT platforms)
         c. kernel folks won't like having to work with submodule,
            everybody working in this area will have to care
         d. Trying to work out the best workflow option here
   d. "least bad" option looks to be submodule. Needs to be better
      than just removing all the DT data.
      1. Just using the external rebasing tree looks better, tbh
   e. dtc could work using subrepo or subtree, but not such an
      important thing here
   f. Maybe switch to the DT rebasing tree, then use that with
      subtree/submodule?
      1. Could add DT files for non-Linux devices this way
      2. Could then overlay the kernel-hosted DT files using
         subtree/submodule. Maybe could cause divergence problems?
   g. SM: Will prod people (e.g. Frank, Olof) to continue discussion
      about this. Are they going to be at FOSDEM / Arm summit in
      Cambridge?
   h. In the meantime, Arnd to maybe try a little more with submodule

3. DTE-2: System DT
   a. SS due to give updates, delayed over Christmas period
   b. More on the list in the next couple of days, full call next week

4. DTE-8: DTB lifecycle
   b. Meeting Thursday morning (UTC) with LEDGE folks, overlap with
      their Dependable Boot project

5. DTE-6: DT code generation for RTOS
   a. Starting up soon

6. Connect BUD20
   a. System DT session submitted by Tomas,
   2. No other talks, but expect we'll have meetings all over

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

