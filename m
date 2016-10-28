From: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] Enable syntax highlighting of device tree source
Date: Fri, 28 Oct 2016 17:12:52 +1100
Message-ID: <1477635173-9292-2-git-send-email-stewart@linux.vnet.ibm.com>
References: <1477635173-9292-1-git-send-email-stewart@linux.vnet.ibm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477635173-9292-1-git-send-email-stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Signed-off-by: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 source/conf.py                |  6 +++
 source/extensions/DtsLexer.py | 89 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 source/extensions/DtsLexer.py

diff --git a/source/conf.py b/source/conf.py
index 67edcb8..8f71117 100644
--- a/source/conf.py
+++ b/source/conf.py
@@ -23,6 +23,12 @@ import time
 
 sys.path.append(os.path.abspath('extensions'))
 
+from DtsLexer import DtsLexer
+
+def setup(app):
+    from sphinx.highlighting import lexers
+    lexers['dts'] = DtsLexer()
+
 
 # -- General configuration ------------------------------------------------
 
diff --git a/source/extensions/DtsLexer.py b/source/extensions/DtsLexer.py
new file mode 100644
index 0000000..eb0e7d6
--- /dev/null
+++ b/source/extensions/DtsLexer.py
@@ -0,0 +1,89 @@
+#!/usr/bin/python
+#
+# Contributors Listed Below - COPYRIGHT 2016
+# [+] International Business Machines Corp.
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions are
+# met:
+#
+# * Redistributions of source code must retain the above copyright
+#   notice, this list of conditions and the following disclaimer.
+#
+# * Redistributions in binary form must reproduce the above copyright
+#   notice, this list of conditions and the following disclaimer in the
+#  documentation and/or other materials provided with the distribution.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+from pygments.lexer import RegexLexer, bygroups, include
+from pygments.token import *
+
+__all__ = ['DtsLexer']
+
+class DtsLexer(RegexLexer):
+    name = 'DTS'
+    aliases = ['dts', 'device-tree']
+    filenames = ['*.dts']
+
+    tokens = {
+        'root': [
+            include('comments'),
+            (r'/memreserve/', Keyword, ('memreserve')),
+            (r'^/dts-v1/;$', Keyword),
+            (r'\s+', Text),
+            include('node'),
+        ],
+        'comments': [
+            (r'//(\n|(.|\n)*?[^\\]\n)', Comment.Single),
+            (r'/(\\\n)?[*](.|\n)*?[*](\\\n)?/', Comment.Multiline),
+        ],
+        'memreserve': [
+            include('comments'),
+            include('integers'),
+            (r'\s+', Text),
+            (r';', Punctuation, '#pop')
+        ],
+        'integers': [
+            (r'0x[0-9a-fA-F]+', Number.Hex),
+            (r'0[0-7]+', Number.Oct),
+            (r'\d+', Number.Integer),
+        ],
+        'node': [
+            (r'\s+', Text),
+            (r'((?:[0-9a-zA-Z,._+-]+):)?(\s*)([0-9a-zA-Z,._+-]+)(@[0-9a-zA-Z,._+-]+)?(\s*)({)', bygroups(Name.Label, Text, Name.Class, Name.Function, Text, Punctuation), ('node-content')),
+            (r'(/)(\s+)({)', bygroups(Keyword, Text, Punctuation) , ('node-content')),
+        ],
+        'node-content': [
+            include('comments'),
+            include('node'),
+            (r'\s+', Text),
+            (r'([0-9a-zA-Z,._+-]+)(:)', bygroups(Name.Label, Punctuation)),
+            (r'([\#0-9a-zA-Z,._+-]+)(\s*)(=)(\s*)', bygroups(Name.Function, Text, Operator, Text), ('value')),
+            (r'([\#0-9a-zA-Z,._+-]+)(;)', bygroups(Name.Function, Punctuation)),
+            (r'};', Punctuation, ('#pop')),
+        ],
+        'value': [
+            include('integers'),
+            include('comments'),
+            (r'(\&)([a-zA-Z0-9_-]+)', bygroups(Operator, Text)),
+            (r'<', Punctuation, '#push'),
+            (r'>', Punctuation, '#pop'),
+            (r'\[', Punctuation, '#push'),
+            (r'\]', Punctuation, '#pop'),
+            (r'".*"', String),
+            (r';', Punctuation, '#pop'),
+            (r'\s+', Text),
+            (r',', Punctuation)
+        ],
+    }
-- 
2.7.4
