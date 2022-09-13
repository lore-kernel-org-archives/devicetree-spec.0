From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 15/21] mm/page_alloc: allow base for movablecore
Date: Tue, 13 Sep 2022 12:55:02 -0700
Message-ID: <20220913195508.3511038-16-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ed+iX/nv/XMEFygJ1SlfRX9x+uzs7Q6SqUw+PcSFA+Y=;
        b=kTC2V8I0KbKQgYVpiMXWXobqHukHN5wc9G7pyTq0OXIlmxgzs1DdLdIuMurl376JOh
         TI+sLZOsyYvKvgQV1mtsgOKDhgkCHY9vgTN75V+209rBR7AYRtArLxFXLQfDpntS8+77
         1VJuC85XaAr9lDOJi4JPuZBYlxos4LmgTFUlBZzjlAHRPleIyKNPrsw1Q/TybKJ6LhLy
         P7jZiatOzHC+C4lsh8jLuUsBJv4lBg9GwtABHfhEamUAOb2Eu3rURCtfJTb4hzSEiYzf
         Mf68rOnlVxAV76vW2E0E1N4Dtdqb6V3ShGLPb0HbK61ur+zHBF+wQNqRrMeYo3aOEqsI
         sQUw==
In-Reply-To: <20220913195508.3511038-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

A Designated Movable Block can be created by including the base
address of the block when specifying a movablecore range on the
kernel command line.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../admin-guide/kernel-parameters.txt         | 14 ++++++-
 mm/page_alloc.c                               | 38 ++++++++++++++++---
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 426fa892d311..8141fac7c7cb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3312,7 +3312,7 @@
 			reporting absolute coordinates, such as tablets
 
 	movablecore=	[KNL,X86,IA-64,PPC]
-			Format: nn[KMGTPE] | nn%
+			Format: nn[KMGTPE] | nn[KMGTPE]@ss[KMGTPE] | nn%
 			This parameter is the complement to kernelcore=, it
 			specifies the amount of memory used for migratable
 			allocations.  If both kernelcore and movablecore is
@@ -3322,6 +3322,18 @@
 			that the amount of memory usable for all allocations
 			is not too small.
 
+			If @ss[KMGTPE] is included, memory within the region
+			from ss to ss+nn will be designated as a movable block
+			and included in ZONE_MOVABLE. Designated Movable Blocks
+			must be aligned to pageblock_order. Designated Movable
+			Blocks take priority over values of kernelcore= and are
+			considered part of any memory specified by more general
+			movablecore= values.
+			Multiple Designated Movable Blocks may be specified,
+			comma delimited.
+			Example:
+				movablecore=100M@2G,100M@3G,1G@1024G
+
 	movable_node	[KNL] Boot-time switch to make hotplugable memory
 			NUMA nodes to be movable. This means that the memory
 			of such nodes will be usable only for movable
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 69753cc51e19..e38dd1b32771 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8370,9 +8370,9 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 }
 
 static int __init cmdline_parse_core(char *p, unsigned long *core,
-				     unsigned long *percent)
+				     unsigned long *percent, bool movable)
 {
-	unsigned long long coremem;
+	unsigned long long coremem, address;
 	char *endptr;
 
 	if (!p)
@@ -8387,6 +8387,17 @@ static int __init cmdline_parse_core(char *p, unsigned long *core,
 		*percent = coremem;
 	} else {
 		coremem = memparse(p, &p);
+		if (movable && *p == '@') {
+			address = memparse(++p, &p);
+			if (*p != '\0' ||
+			    !memblock_is_region_memory(address, coremem) ||
+			    memblock_is_region_reserved(address, coremem))
+				return -EINVAL;
+			memblock_reserve(address, coremem);
+			return dmb_reserve(address, coremem, NULL);
+		} else if (*p != '\0') {
+			return -EINVAL;
+		}
 		/* Paranoid check that UL is enough for the coremem value */
 		WARN_ON((coremem >> PAGE_SHIFT) > ULONG_MAX);
 
@@ -8409,17 +8420,32 @@ static int __init cmdline_parse_kernelcore(char *p)
 	}
 
 	return cmdline_parse_core(p, &required_kernelcore,
-				  &required_kernelcore_percent);
+				  &required_kernelcore_percent, false);
 }
 
 /*
  * movablecore=size sets the amount of memory for use for allocations that
- * can be reclaimed or migrated.
+ * can be reclaimed or migrated. movablecore=size@base defines a Designated
+ * Movable Block.
  */
 static int __init cmdline_parse_movablecore(char *p)
 {
-	return cmdline_parse_core(p, &required_movablecore,
-				  &required_movablecore_percent);
+	int ret = -EINVAL;
+
+	while (p) {
+		char *k = strchr(p, ',');
+
+		if (k)
+			*k++ = 0;
+
+		ret = cmdline_parse_core(p, &required_movablecore,
+					 &required_movablecore_percent, true);
+		if (ret)
+			break;
+		p = k;
+	}
+
+	return ret;
 }
 
 early_param("kernelcore", cmdline_parse_kernelcore);
-- 
2.25.1

