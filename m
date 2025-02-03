Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E322920408D
	for <devicetree-spec@vger.kernel.org>; Mon,  3 Feb 2025 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584334; cv=none; b=rP620ae9chIy6D99taKhMHb/S22x0m4sF0S3Uwpg32V7TD7eeXEtRau3GTKPjkORf5o+DhLfBxzn/KFntYKICwmcOE7W47KRsrKYvOlGcmIUbVl14dkSx3Oagp005Oz54MmR/Og2LhG0b08sjxLFKA5xmuBibabcSZacICsuYgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584334; c=relaxed/simple;
	bh=8TGQEZR28+FMooQJFsf+fA8JCH+11CSQxQdvtlomnF8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j7aKkSBmXSS7O1JsPeKmOVfNIajLX6b3EkpAbeY+nyF5tT7a+Ko7tqr+hpWXRBEE7AjwjhUAAbAna3M6JesuE/T39UnBUnoXMirz4lBjLZUt1i+UZSyJ0f3KC/SCh39He+OHf9oBs9D+1mTAQgTf41KLOyS/Ypf9x1jVJyKjdEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YmlW5006Dz6L4ym;
	Mon,  3 Feb 2025 20:02:56 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id CE103140155;
	Mon,  3 Feb 2025 20:05:28 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.70.44) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Feb 2025 13:05:28 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <robh@kernel.org>, <grant.likely@secretlab.ca>
CC: <devicetree-spec@vger.kernel.org>, <mark.rutland@arm.com>,
	<yangyicong@huawei.com>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>
Subject: [RFC PATCH v1] Chapter 3: Add shared L1 Cache
Date: Mon, 3 Feb 2025 12:05:27 +0000
Message-ID: <20250203120527.3534-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500003.china.huawei.com (7.182.85.28)

For L1 cache to be shared between SMT threads, a register array must be
used. This, however, is not straightforward if every node in the CPU map
refers to a separate CPU node. Therefore, it is suggested to create a
separate CPU node for every SMT thread. The L1 cache can be shared if an
extra node represents it.

Add an extra layer for shared L1 cache in the device tree among multiple
SMTs.

Implementation associated with these changes has already been posted at
[1].

Link: https://lore.kernel.org/all/20250129164855.676-1-alireza.sanaee@huawei.com # [1]
Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 source/chapter3-devicenodes.rst | 65 ++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 6 deletions(-)

diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenodes.rst
index 8080321..1cc63e8 100644
--- a/source/chapter3-devicenodes.rst
+++ b/source/chapter3-devicenodes.rst
@@ -547,6 +547,8 @@ of properties which are identical across all CPUs.
 
 The node name for every CPU node should be ``cpu``.
 
+.. _sect-cpus-general-cpu-node-properties:
+
 General Properties of ``/cpus/cpu*`` nodes
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -891,9 +893,9 @@ Here is an example of a ``/cpus`` node with one child cpu node:
 Multi-level and Shared Cache Nodes (``/cpus/cpu*/l?-cache``)
 ------------------------------------------------------------
 
-Processors and systems may implement additional levels of cache hierarchy.
-For example, second-level (L2) or third-level (L3) caches.
-These caches can potentially be tightly integrated to the CPU or
+Processors and systems may implement additional levels of cache hierarchy.  For
+example, shared first-level (L1), or second-level (L2) or third-level (L3)
+caches.  These caches can potentially be tightly integrated to the CPU or
 possibly shared between multiple CPUs.
 
 A device node with a compatible value of ``"cache"`` describes these types
@@ -908,7 +910,8 @@ A cache node may be represented under a CPU node or any other
 appropriate location in the devicetree.
 
 Multiple-level and shared caches are represented with the properties in
-Table 3-9. The L1 cache properties are described in Table 3-8.
+Table 3-9. The L1 cache properties can be either described as separate layer in
+multi-level cache nodes, or in CPU node as stated in Table 3-8.
 
 .. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
 .. table:: ``/cpu/cpu*/l?-cache`` Node Power ISA Multiple-level and Shared Cache Properties
@@ -927,8 +930,8 @@ Table 3-9. The L1 cache properties are described in Table 3-8.
    (:numref:`sect-standard-properties`) are allowed but are optional.
 
 
-Example
-~~~~~~~
+Example 1
+~~~~~~~~~
 
 See the following example of a devicetree representation of two CPUs,
 each with their own on-chip L2 and a shared L3.
@@ -988,3 +991,53 @@ each with their own on-chip L2 and a shared L3.
             };
         };
     };
+
+Example 2
+~~~~~~~~~
+
+See the following example of a devicetree representation of one CPU with two
+threads. Threads are sharing L1-cache and L2-cache.
+
+.. note:: Alternatively, threads are allowed to be represented and be able to
+   share caches by using `reg` array in
+   (:numref:`sect-cpus-general-cpu-node-properties`).
+
+.. code-block:: dts
+
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        cpu@0 {
+            device_type = "cpu";
+            reg = <0>;
+            timebase-frequency = <82500000>; // 82.5 MHz
+            next-level-cache = <&L1_0>; // phandle to L1
+
+            L1_0:l1-cache {
+               compatible = "cache";
+               d-cache-block-size = <32>; // L1 - 32 bytes
+               i-cache-block-size = <32>; // L1 - 32 bytes
+               d-cache-size = <0x8000>; // L1, 32K
+               i-cache-size = <0x8000>; // L1, 32K
+               cache-level = <1>;
+               next-level-cache = <&L2_0>; // phandle to L2
+
+               L2_0:l2-cache {
+                  compatible = "cache";
+                  cache-unified;
+                  cache-size = <0x40000>; // 256 KB
+                  cache-sets = <1024>;
+                  cache-block-size = <32>;
+                  cache-level = <2>;
+               };
+            };
+        };
+
+        cpu@1 {
+            device_type = "cpu";
+            reg = <1>;
+            timebase-frequency = <82500000>; // 82.5 MHz
+            clock-frequency = <825000000>; // 825 MHz
+            next-level-cache = <&L1_0>; // phandle to L1
+        };
+    };
-- 
2.34.1

