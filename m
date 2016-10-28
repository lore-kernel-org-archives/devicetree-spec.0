From: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/2] Syntax highlighting
Date: Fri, 28 Oct 2016 17:12:51 +1100
Message-ID: <1477635173-9292-1-git-send-email-stewart@linux.vnet.ibm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Since http://pygments.org/ (what Sphinx uses for syntax highlighting)
doesn't do DTS yet, implement DTS syntax highlighting and then use it
(and the standard C source highlighting).

I'll be submitting the DTS highlighting upstream too, but having it in
tree will ensure it works for people not running a future version of
pygments.

Stewart Smith (2):
  Enable syntax highlighting of device tree source
  Syntax highlight C and DTS

 source/conf.py                |  6 +++
 source/devicenodes.rst        | 18 ++++-----
 source/devicetree-basics.rst  | 14 ++++---
 source/extensions/DtsLexer.py | 89 +++++++++++++++++++++++++++++++++++++++++++
 source/flattened-format.rst   |  6 +--
 5 files changed, 115 insertions(+), 18 deletions(-)
 create mode 100644 source/extensions/DtsLexer.py

-- 
2.7.4
