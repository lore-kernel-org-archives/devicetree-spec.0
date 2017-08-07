From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] Add an SVG logo
Date: Mon,  7 Aug 2017 16:39:16 -0700
Message-ID: <20170807233917.17409-3-stephen.boyd@linaro.org>
References: <20170807233917.17409-1-stephen.boyd@linaro.org>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=y6Wqo4WASHfEDXZHAa1UUphFCa1Jvj59j9DL0mpxA8A=;
        b=HlbfNO5elSV1xMtHjQ9xHk7/EM0YjoTI7IzuR9me+c1nAgKwm4E3Vy/NNMxywYgdXY
         We13yQkw51JK0Omfzor0N97NA0Ta6qmn1WJ8WrprOMUCfL0vGRzwzVQtMzCqsZ8ZsfDW
         8GiZQPC1DpB0nHf/tCDl3rXW6Lg7ac93/BEAM=
In-Reply-To: <20170807233917.17409-1-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Traced over the png version in inkscape and then run through an
optimizer/simplifier to remove all the inkscape cruft.

Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 source/devicetree-logo.svg | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 source/devicetree-logo.svg

diff --git a/source/devicetree-logo.svg b/source/devicetree-logo.svg
new file mode 100644
index 000000000000..56f30d1bdbe3
--- /dev/null
+++ b/source/devicetree-logo.svg
@@ -0,0 +1,14 @@
+<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 251.46 250.81">
+  <g transform="translate(-52.713 -357.557)">
+    <path fill="none" stroke="#000" stroke-width="4.5" d="M157.4 376.82l-.08-16.9M72.4 545.25l-17.3.07M301.57 545.48l-17.32.08M301.9 503.6l-17.2.07M301.7 461.87l-16.9.08M301.5 420.13l-16.92.08M240.73 376.88l-.08-16.9M198.85 376.82l-.08-16.9M115.63 377.2l-.07-17.36M71.9 420.36l-16.9.07M72.12 462.1l-16.9.07M72.3 503.82l-17.2.07M115.48 605.77l-.07-16.9M198.92 605.94l-.07-16.9M240.73 605.9l-.08-16.92M157.4 606.1l-.08-16.92M115.74 568.2H240.4" stroke-linecap="round"/>
+    <path fill="none" stroke="#000" stroke-width="4.4000001" d="M157.03 567.96v-36.2l-27.8-15.68"/>
+    <path fill="none" stroke="#000" stroke-width="5" d="M177.48 488.73l-33.36-19.04"/>
+    <path fill="none" stroke="#000" stroke-width="4.49999952" d="M178.48 566.8V450.97"/>
+    <path fill="none" stroke="#000" stroke-width="4.4000001" d="M199.03 567v-76.87l26.86-14.75"/>
+    <path fill="none" stroke="#000" stroke-width="4.7" d="M79.95 379.12h198.1c2.8 0 4.4 1.57 4.4 3.87l.06 200.16c0 2.13-2.03 3.66-4.38 3.66H81.98c-7.14 0-7.23 0-7.23-6.4V385.43c0-4.6 1.08-6.32 5.2-6.32z" stroke-linejoin="round"/>
+    <circle cx="128.28833" cy="458.41843" r="20.60775" fill="#8b63a9"/>
+    <circle cx="178.59291" cy="431.41653" r="20.60775" fill="#0cb2dd"/>
+    <circle cx="244.23465" cy="467.79355" r="20.60775" fill="#f48414"/>
+    <circle cx="112.6982" cy="507.95236" r="20.60775" fill="#009641"/>
+  </g>
+</svg>
-- 
2.10.0.297.gf6727b0
