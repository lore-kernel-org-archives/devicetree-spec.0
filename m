From: Matthias Schiffer <matthias.schiffer-W3o+9BuWjQaZox4op4iWzw@public.gmane.org>
Subject: [PATCH] Describe "fail" status for /cpus/cpu* nodes
Date: Thu, 16 Sep 2021 16:10:28 +0200
Message-ID: <20210916141028.32058-1-matthias.schiffer@ew.tq-group.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1631801870; x=1663337870;
  h=from:to:cc:subject:date:message-id;
  bh=dOgeBqtvYoPkwhYwKn27jZiFVVGxnvMt1CPZbfX0Ssw=;
  b=C90yxuxBhilEWgStg3HzvmI6nLTa16CYRoybPxPuNqyJ2QzSpKN5/a29
   LA2jJRADnhn2kJYSxIiCHLWfk5/JFVwSn08eJaOv8/7su60rh9BsOvhLk
   R3ZWMtkJzZbP1SRyiG3M/PjDBRvCQZDt2Hc5ylFoPLz61VfsowLH5N0NL
   bdoDIderqxFHfhJZy7Ke1ju1gshTzrDSlebwQPALeJAWTy2OwpFWZxF8N
   FOUGb2W2Zc2laygAF4SchmkmYk01BKuv42s4HKTtzE8KCOTP+eYXY4R1q
   siVGhhmrStMbGFb3ZjD/2qE9GKESa4Fgv8XbwqWdt2D9M7C52OTjc2nt0
   Q==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1631801440; x=1663337440;
  h=from:to:cc:subject:date:message-id;
  bh=dOgeBqtvYoPkwhYwKn27jZiFVVGxnvMt1CPZbfX0Ssw=;
  b=JMLEwCZFt+dIK9bBWpm8w1nrBHcsnrEuPOzwwDXKsTsBJSntM9k69c6p
   wnHiGYc3bKapSI5Jae4i3+bvWxrKYLdwcOfLtL5yafl6n6b7mVEcjRcj6
   wjSulU1JcZC46owkFXPrllud9cvzqgLSeoncEyiqAISlAJzOcxkPQb2mq
   IQuMsgTQRlzncB1dux8on+2eit9elHCF4qdZQXQNDAP7W3I/44L0YzNu8
   kp5+hAfseSXXlqEJt7P+27trM+LN6PQBchKWnm+NXnTA/SbtcmKUla+Ux
   EBEFniFmxJMXV19nbp1zyikK6pwzvFJl+OroTJW8iCA4pkt3TElPWhyNd
   Q==;
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Schiffer <matthias.schiffer-W3o+9BuWjQaZox4op4iWzw@public.gmane.org>

There are situations where it is desirable to use the same base Device
Tree for devices with a different number of CPUs: There may be CPU
variants with different numbers of cores that can be used interchangably
on the same mainboard, or there are multiple CPU sockets. Not needing to
explicitly build a device tree for each such variant can make
maintenance significantly easier.

For this to work, a system firmware / bootloader needs to adjust the
Device Tree by removing or disabling the excess CPU nodes. However, this
is currently not easily possible due to the special meaning of the
"disabled" status for CPU nodes:

- A "disabled" CPU node is interpreted as inactive, but existent. The
  Linux kernel will attempt to enable such CPUs on boot, which will
  obviously fail for non-existent CPUs
- Removing the CPU node altogether from a Device Tree is much more
  complex than setting a single property, as it may leave dangling
  phandle references, often requiring specific knowledge of other nodes'
  structure to deal with them.

In the discussion [1] it was suggested to introduce a new status value
for CPUs that should really not be used at all. Rob proposed to use the
value "fail", which already exists in the generic definitions of the
status property.

[1] https://www.lkml.org/lkml/2020/8/26/1237

Suggested-by: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Matthias Schiffer <matthias.schiffer-W3o+9BuWjQaZox4op4iWzw@public.gmane.org>
---
 source/chapter3-devicenodes.rst | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenodes.rst
index 1cea148..9d8ef6e 100644
--- a/source/chapter3-devicenodes.rst
+++ b/source/chapter3-devicenodes.rst
@@ -614,8 +614,8 @@ standard properties with specific applicable detail.
                                                    CPU. This property shall be present for nodes
                                                    representing CPUs in a symmetric
                                                    multiprocessing (SMP) configuration. For a CPU
-                                                   node the meaning of the ``"okay"`` and
-                                                   ``"disabled"`` values are as follows:
+                                                   node the meaning of the ``"okay"``, ``"disabled"``
+                                                   and ``"fail"`` values are as follows:
 
                                                    ``"okay"`` :
                                                       The CPU is running.
@@ -623,6 +623,9 @@ standard properties with specific applicable detail.
                                                    ``"disabled"`` :
                                                       The CPU is in a quiescent state.
 
+                                                   ``"fail"`` :
+                                                      The CPU is not operational or does not exist.
+
                                                    A quiescent CPU is in a state where it cannot
                                                    interfere with the normal operation of other
                                                    CPUs, nor can its state be affected by the
@@ -639,6 +642,11 @@ standard properties with specific applicable detail.
                                                    loop, held in reset, and electrically isolated
                                                    from the system bus or in another
                                                    implementation dependent state.
+
+                                                   A CPU with ``"fail"`` status does not affect the
+                                                   system in any way.
+                                                   The status is assigned to nodes for which no
+                                                   corresponding CPU exists.
    ``enable-method``      | SD  | ``<stringlist>`` Describes the method by which a CPU in a
                                                    disabled state is enabled. This property is
                                                    required for CPUs with a status property with
-- 
2.17.1

