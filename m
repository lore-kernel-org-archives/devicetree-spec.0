From: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/4] Devicetree spec build environment changes
Date: Tue, 15 Sep 2020 10:03:31 +0100
Message-ID: <20200915090335.9167-1-grant.likely@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2mDydDF2D73CaUxSvNAF5pGBHkuPDVPqNCQ1s53p0o=;
 b=co6/ovG0M8a0PP44AKbC2MNtizCtY05EEjqpoJJxd+G2JNXgOG3xH470urtyNz749tFtw7oOEp1k3+JkFdRCO/AdsSP0ZD0GRp4BQ3K0YcoEAt3noEzvkYk7TcdcWzRsrZZhMCMPqOIJSxhI++Dj/sYYrAXio/pUhuWbnQsblLk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2mDydDF2D73CaUxSvNAF5pGBHkuPDVPqNCQ1s53p0o=;
 b=co6/ovG0M8a0PP44AKbC2MNtizCtY05EEjqpoJJxd+G2JNXgOG3xH470urtyNz749tFtw7oOEp1k3+JkFdRCO/AdsSP0ZD0GRp4BQ3K0YcoEAt3noEzvkYk7TcdcWzRsrZZhMCMPqOIJSxhI++Dj/sYYrAXio/pUhuWbnQsblLk=
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: nd-5wv7dgnIgG8@public.gmane.org, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

Non-content changes. This series renames the source files to be easier
to navigate and updates the build to match templates from an earlier
version of Sphinx which will make it easier to track changes for newer
versions of sphinx.

Grant Likely (4):
  trivial: Add chapter number to source files
  fix python3 compatibility
  Update Makefile to newer Sphinx 'minimal' style
  Updates to match Sphinx templates

 Makefile                                      | 232 +---------------
 ...oduction.rst => chapter1-introduction.rst} |   0
 ...ics.rst => chapter2-devicetree-basics.rst} |   0
 ...vicenodes.rst => chapter3-devicenodes.rst} |   0
 ...dings.rst => chapter4-device-bindings.rst} |   0
 ...rmat.rst => chapter5-flattened-format.rst} |   0
 ...guage.rst => chapter6-source-language.rst} |   0
 source/conf.py                                | 255 ++++++------------
 source/index.rst                              |  12 +-
 9 files changed, 103 insertions(+), 396 deletions(-)
 rename source/{introduction.rst => chapter1-introduction.rst} (100%)
 rename source/{devicetree-basics.rst => chapter2-devicetree-basics.rst} (100%)
 rename source/{devicenodes.rst => chapter3-devicenodes.rst} (100%)
 rename source/{device-bindings.rst => chapter4-device-bindings.rst} (100%)
 rename source/{flattened-format.rst => chapter5-flattened-format.rst} (100%)
 rename source/{source-language.rst => chapter6-source-language.rst} (100%)

-- 
2.20.1

