From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/4] Set horizontal margins to 2cm
Date: Wed,  6 Dec 2017 12:31:17 -0600
Message-ID: <20171206183120.16700-2-robh@kernel.org>
References: <20171206183120.16700-1-robh@kernel.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171206183120.16700-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Some tables are a bit squashed, so decrease the margins a bit.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 source/conf.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/source/conf.py b/source/conf.py
index 1881e29c8414..a4c6a01fc419 100644
--- a/source/conf.py
+++ b/source/conf.py
@@ -242,6 +242,8 @@ latex_elements = {
   # The paper size ('letterpaper' or 'a4paper').
   'papersize': 'a4paper',
 
+  'sphinxsetup': 'hmargin=2cm',
+
 # The font size ('10pt', '11pt' or '12pt').
 #'pointsize': '10pt',
 
-- 
2.14.1
