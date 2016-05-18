From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: DTS license for non-linux use
Date: Wed, 18 May 2016 15:00:41 -0700
Message-ID: <573CE609.2030007@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :content-transfer-encoding;
        bh=xdn4u5KfJNqzyv/Ff6CJKG9lVc401Oi6Q6XVBVK43KI=;
        b=xlUXU/8+UgjNXExR2WvgovJD8/3ZoMcZPrxA96QdPYhOOgN/oUNRiPCb0pLBjBBVyv
         T738iUL9BRh9iJ5zsOtYzfHrOQRhSnLLzlwEoBxWlNhp/GCr6Cc2g4hUKCUP9lpIuWBB
         uO6vE12SNk6tq6et3g/pwTWtfdbVBzaMJpzGZj0kmyiHcdWUSxc4eEbhIOJVdjp1jDOv
         rNdkV1dMYtgCrJP0lk+3CW5fAWHa+rK6/ryQE3sOK8H2KOPVDkhwm4zHKgdH8gCGeoKD
         9/fFIWPKj6BYyo63qdRB96A5CrgA1RxybJg6PSahbu11V4D2lWpQsTPl5T2niVipJwTq
         Qfxw==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Warner Losh asked a question about the use of cpp #include in dts
source files, and while the topic of license of existing devicetree
source files in the linux source tree has a bearing on the question,
he adeptly tried to avoid stirring up a hornet's nest.  Instead of
sidetracking his thread with license issues, this is a new thread
with my license question.

I'm sure I'll regret asking this, but what the heck.

The result of compiling a devicetree source file (.dts and .dtsi)
generates a .dtb file aka devicetree blob aka flattened device
tree (FDT).  The FDT is a binary and ascii data structure that
contains no code.  If the devicetree source file(s) license is
gpl, then it seems to me that the license of the blob is also
gpl.

If an operating system kernel "reads" an FDT, would that somehow
be a license, copyright, or other issue if the kernel was not also
gpl licensed?

My naive, "I'm not a lawyer", view is that there would not be
an issue, but my third hand impression is that the BSDs are
concerned that there may be an issue.

Are there any good authoritative sources that have addressed
this issue or a similar issue?

-Frank
