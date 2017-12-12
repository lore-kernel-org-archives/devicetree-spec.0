From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Clarification: dtb size fields are in bytes
Date: Tue, 12 Dec 2017 10:18:00 +0000
Message-ID: <20171212101800.20853-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=cKfSWqGmEvDq94Kkzd9H777n9W0LDnsBumYI+WUt94o=;
        b=zPqb+Heg+OpSgz2Si+9Cc+Tvrzhc1HGXN6xp9FAHNsl8wsNN3/btyx4oVixYSEKFp0
         q+0Wei5KdCDT+lpoCT/GrtRzDtWxei4dFgFF21lj4nHmno4ydqPQxZZDyI/ZpGiIUFq7
         TwFHqpqkTpx2B7wuVBOU+TIIgzixoD9ieollHuOn2tewbhZ+nQ0KEkCpMoBfuAJ934nr
         xver0EaNiVR6GHa4cr2PTKc8vqhlh+7KL/oL2f5odhygPuHSTUyDkSDX9X1nT1FadUn2
         jT+pe4ALmgsz330WOnkJHaAK222fM8AFNXAvi1pv7wBcZ1lub0fuwHTYcmv+dw61xz84
         VkEw==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, daniel.buenzli-llsTEZYSXZwXXHkOk0aIfQ@public.gmane.org

Clarify that the dtb header totalsize field, and the reserved region
size field specify the size in bytes.

Resolves #9

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Cc: daniel.buenzli-llsTEZYSXZwXXHkOk0aIfQ@public.gmane.org
---
 source/flattened-format.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/source/flattened-format.rst b/source/flattened-format.rst
index a82e502..a1c358e 100644
--- a/source/flattened-format.rst
+++ b/source/flattened-format.rst
@@ -90,8 +90,8 @@ big-endian format.
     This field shall contain the value 0xd00dfeed (big-endian).
 
 ``totalsize``
-    This field shall contain the total size of the devicetree data
-    structure. This size shall encompass all sections of the structure:
+    This field shall contain the total size in bytes of the devicetree data structure.
+    This size shall encompass all sections of the structure:
     the header, the memory reservation block, structure block and
     strings block, as well as any free space gaps between the blocks or
     after the final block.
@@ -216,8 +216,8 @@ structure.
         uint64_t size;
     };
 
-Each pair gives the physical address and size of a reserved memory
-region. These given regions shall not overlap each other. The list of
+Each pair gives the physical address and size in bytes of a reserved memory region.
+These given regions shall not overlap each other. The list of
 reserved blocks shall be terminated with an entry where both address and
 size are equal to 0. Note that the address and size values are always
 64-bit. On 32-bit CPUs the upper 32-bits of the value are ignored.
-- 
2.11.0
