From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 0/4] OF phandle nexus support + GPIO nexus
Date: Fri, 11 Aug 2017 08:42:32 -0700
Message-ID: <20170811154236.12891-1-stephen.boyd@linaro.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=jUQKbEXH+g1s0atfRApr3uoUJp5bhlVLLwAxyUg3df0=;
        b=bWUHmFf9vQ7FEcgGjTNmeDMk0PXmwtV13CAnlJ8IZXDlFjUUmAMBtCuGw4VNr5+1ON
         Vj1hVXTl16d2O3uyhuTwwjYw01UdZV7k27wm5w0nfakasVs1YyAUyrbG16pUyxj0tNHn
         DOX4SDb5EvkJrE475LFSPv+Euq7IAANLUAPBM=
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is a continutation of my phandle remapping/nexus node series
from a while ago. I finally got around to writing the documentation
in the spec for this, but it's really rough around the edges and
could use some review/suggestions to get it into shape. Please
review!

This is one small chunk of work related to DT overlays for expansion
boards. It would be good to have a way to expose #<list>-cells types of
providers through a connector in a standard way. So we introduce a way
to make "nexus" nodes for these types of properties to remap the consumer
number space to the other side of the connector's number space. It's
basically a copy of the interrupt nexus implementation, but without
the address space matching design and interrupt-parent walking.

Changes since v3:
 * Added devicetree spec patch
 * Rebased to v4.13-rc1

Changes since v2:
 * Picked up Linus' ack on the gpio core patch
 * Made const stack arrays static (Rob Herring)
 * Used of_property_read_u32() instead of open coding (Rob Herring)

Changes since v1:
 * Addition of optional pass-thru parameter
 * Reduction of strings passed to 1 instead of 3 (or 4 now)
 * Updated gpio patch for the new function signature
 * Updated test-case for new funciton signature and pass-thru parameter
 * Updated kernel-doc to be correct and highlighted difference between this
   API and of_parse_phandle_with_args()

Stephen Boyd (3):
  Document nexus nodes/specifier remapping
  of: Support parsing phandle argument lists through a nexus node
  of: unittest: Add phandle remapping test
  gpio: Support gpio nexus dt bindings

Kernel:
 drivers/gpio/gpiolib-of.c                   |   4 +-
 drivers/of/base.c                           | 184 ++++++++++++++++++++++++++++
 drivers/of/unittest-data/testcases.dts      |  11 ++
 drivers/of/unittest-data/tests-phandle.dtsi |  25 ++++
 drivers/of/unittest.c                       | 120 ++++++++++++++++++
 include/linux/of.h                          |  12 ++
 6 files changed, 354 insertions(+), 2 deletions(-)

Spec:
 source/devicetree-basics.rst | 208 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

-- 
2.7.4
