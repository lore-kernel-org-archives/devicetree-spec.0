From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/21] mm/page_alloc.c: allow oversized movablecore
Date: Tue, 13 Sep 2022 12:54:57 -0700
Message-ID: <20220913195508.3511038-11-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bjPZ9urefAsJcftBbAgQB1diXayOj809VCbylW0WU+4=;
        b=ElB8vGfwnTgMrOHPV8jOPMjX9e4dyOnpsA/daCy84nADITgBEDs0AWwUlYd7LmzJ4R
         Fd+wihlwr+eHGiOYJevIadmukrrhPQQQbV14He/EgVL8UId/ZjEQspu78E84lCBkqAk3
         9AGpDbnJvnF63g83iAedqf+9zINjZ62a64qbSfO2T1vB7Ckgl7brAPRPzZAIUuLk9YsF
         YnnaDAUhOF2TFJBs1+hdGFIi2/6/xETSCDXaO1b95XuqZwbhceSd0bqWp4uVAOWzs4lk
         zAxkAToGZXGzD1zml0W1YllS9/kHr+k5y9Z8yZENt9c1+33raLf8akoDdgYfGMOxfC4A
         ITFg==
In-Reply-To: <20220913195508.3511038-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

Now that the error in computation of corepages has been corrected
by commit 9fd745d450e7 ("mm: fix overflow in
find_zone_movable_pfns_for_nodes()"), oversized specifications of
movablecore will result in a zero value for required_kernelcore if
it is not also specified.

It is unintuitive for such a request to lead to no ZONE_MOVABLE
memory when the kernel parameters are clearly requesting some.

The current behavior when requesting an oversized kernelcore is to
classify all of the pages in movable_zone as kernelcore. The new
behavior when requesting an oversized movablecore (when not also
specifying kernelcore) is to similarly classify all of the pages
in movable_zone as movablecore.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 mm/page_alloc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b6074961fb59..ad38a81203e5 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8041,13 +8041,13 @@ static void __init find_zone_movable_pfns_for_nodes(void)
 		corepages = totalpages - required_movablecore;
 
 		required_kernelcore = max(required_kernelcore, corepages);
+	} else if (!required_kernelcore) {
+		/* If kernelcore was not specified, there is no ZONE_MOVABLE */
+		goto out;
 	}
 
-	/*
-	 * If kernelcore was not specified or kernelcore size is larger
-	 * than totalpages, there is no ZONE_MOVABLE.
-	 */
-	if (!required_kernelcore || required_kernelcore >= totalpages)
+	/* If kernelcore size exceeds totalpages, there is no ZONE_MOVABLE */
+	if (required_kernelcore >= totalpages)
 		goto out;
 
 	/* usable_startpfn is the lowest possible pfn ZONE_MOVABLE can be at */
-- 
2.25.1

