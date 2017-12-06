From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/4] Ensure figures inserted at location in the source doc
Date: Wed,  6 Dec 2017 12:31:19 -0600
Message-ID: <20171206183120.16700-4-robh@kernel.org>
References: <20171206183120.16700-1-robh@kernel.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171206183120.16700-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

By default, Latex will move figures to give "better" page breaks. This
leads to some strange placement, so ensure figures are always placed in
the same position as they are in the source files.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 source/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source/conf.py b/source/conf.py
index a4c6a01fc419..bf10565c8e29 100644
--- a/source/conf.py
+++ b/source/conf.py
@@ -248,7 +248,7 @@ latex_elements = {
 #'pointsize': '10pt',
 
 # Latex figure (float) alignment
-#'figure_align': 'htbp',
+  'figure_align': 'H',
 }
 
 # Release numbers with a qualifier (ex. '-rc', '-pre') get a watermark.
-- 
2.14.1
