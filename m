From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/3] HTML site tweaks + SVG
Date: Mon,  7 Aug 2017 16:39:14 -0700
Message-ID: <20170807233917.17409-1-stephen.boyd@linaro.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=tVhcmuxizZgmUOS3LZzjgmFPJ5c0gRNHziDSteG4/yQ=;
        b=hWwdwaV9f8d5Sxr9+ECZQeA9Ps3mRaWdzKq5usa/q82u5BlLLX8d4B3qEUTgvVHIxZ
         eE2Z+VTW9FbBVyVTgM8CDavKFV4lK1s9FZN/yifcphn4PeTZY8Vgba+cQTg9QhI2HjFa
         K++mLSCI+HqCIKbCKeLTWdzExwfU2S4DDP370=
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

These patches tweak the config to have the github project and sidebar
as well as add an SVG for the devicetree logo and then uses that
logo instead of the png on the website.

Stephen Boyd (3):
  conf: Configure html to have github project and sidebar
  Add an SVG logo
  Use the svg for html logo

 source/conf.py             | 17 +++++++++++++----
 source/devicetree-logo.svg | 14 ++++++++++++++
 2 files changed, 27 insertions(+), 4 deletions(-)
 create mode 100644 source/devicetree-logo.svg

-- 
2.10.0.297.gf6727b0
