From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/21] lib/show_mem.c: display MovableOnly
Date: Tue, 13 Sep 2022 12:54:54 -0700
Message-ID: <20220913195508.3511038-8-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hB/8CHaP3epa66ZDI7eIxcYHinx9lai7E+SzdR8JK34=;
        b=DH5wOpdpiHaFFXY8TAT3JRecX64XiPNxiR/CcG1LrVu07Readvn0PWViKgBmDA60Pb
         UBITk9aWlYro2ikNI4WmLJPOCXwQOqtprdUB0CzoJZ72kknTQx9o/RitCRSffQDxQ5Q6
         VTZyKVoIHd28mrFZHIQl9dz1uLmu560sdtEcQWDtP1q9dt0hIGQCuqCTjE9fttuhjONt
         0HIT34gX8eS66xaVSIttBxYAN/YQSf5UtfsLj6aZ6r0xFgT3C7geS9uBf8xzXOro8Ch1
         QuB8O5yFa+P3URJ5XpTXammfwNsUv1UpGQMU/vjO4KV44uIZqk+ZBhqofvaHP1BLFOQP
         ilEQ==
In-Reply-To: <20220913195508.3511038-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

The comment for commit c78e93630d15 ("mm: do not walk all of
system memory during show_mem") indicates it "also corrects the
reporting of HighMem as HighMem/MovableOnly as ZONE_MOVABLE has
similar problems to HighMem with respect to lowmem/highmem
exhaustion."

Presuming the similar problems are with regard to the general
exclusion of kernel allocations from either zone, I believe it
makes sense to include all ZONE_MOVABLE memory even on systems
without HighMem.

To the extent that this was the intent of the original commit I
have included a "Fixes" tag, but it seems unnecessary to submit
to linux-stable.

Fixes: c78e93630d15 ("mm: do not walk all of system memory during show_mem")
Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 lib/show_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/show_mem.c b/lib/show_mem.c
index 1c26c14ffbb9..337c870a5e59 100644
--- a/lib/show_mem.c
+++ b/lib/show_mem.c
@@ -27,7 +27,7 @@ void show_mem(unsigned int filter, nodemask_t *nodemask)
 			total += zone->present_pages;
 			reserved += zone->present_pages - zone_managed_pages(zone);
 
-			if (is_highmem_idx(zoneid))
+			if (zoneid == ZONE_MOVABLE || is_highmem_idx(zoneid))
 				highmem += zone->present_pages;
 		}
 	}
-- 
2.25.1

