From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/4] PDF formatting fixes
Date: Wed,  6 Dec 2017 12:31:16 -0600
Message-ID: <20171206183120.16700-1-robh@kernel.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Tables and graphviz graphs are not formatted correctly with sphinx 
1.6.5. This series fixes those issues (hopefully not breaking older 
versions).

Rob

Rob Herring (4):
  Set horizontal margins to 2cm
  Use fixed column widths for all 4 column property tables
  Ensure figures inserted at location in the source doc
  Set maximum sizes for digraphs

 source/conf.py               |  4 +++-
 source/device-bindings.rst   |  8 ++++----
 source/devicenodes.rst       | 18 +++++++++---------
 source/devicetree-basics.rst |  3 +++
 source/flattened-format.rst  |  1 +
 5 files changed, 20 insertions(+), 14 deletions(-)

-- 
2.14.1
