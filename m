From: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] Fix displaying GPIO_ACTIVE_LOW in devicetree-basics.rst
Date: Thu, 20 Feb 2020 21:11:54 +0100
Message-ID: <20200220201154.14207-1-arkadiusz@drabczyk.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

        expansion_device {
                reset-gpios = <&connector 2 GPIO_ACTIVE_LOW>;
		                            ^^^^^^^^^^^^^^^
        };

^^... was shown in red boxes in the output PDF, HTML and possibly
everything else.

Signed-off-by: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
---
 source/extensions/DtsLexer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source/extensions/DtsLexer.py b/source/extensions/DtsLexer.py
index eb0e7d6..6be9a6b 100644
--- a/source/extensions/DtsLexer.py
+++ b/source/extensions/DtsLexer.py
@@ -76,7 +76,7 @@ class DtsLexer(RegexLexer):
         'value': [
             include('integers'),
             include('comments'),
-            (r'(\&)([a-zA-Z0-9_-]+)', bygroups(Operator, Text)),
+            (r'(\&)?([a-zA-Z0-9_-]+)', bygroups(Operator, Text)),
             (r'<', Punctuation, '#push'),
             (r'>', Punctuation, '#pop'),
             (r'\[', Punctuation, '#push'),
-- 
2.9.0

