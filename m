From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/21] mm/vmstat: show start_pfn when zone spans pages
Date: Tue, 13 Sep 2022 12:54:55 -0700
Message-ID: <20220913195508.3511038-9-opendmb@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6/+RylwAUS1L6kGkdbzNevLkV7SCUovxqo9fjOaS6JU=;
        b=IIvzQBml/wGri/ZBWsuig4iC5yLnXMtk1VHesQ1eh/9HzasiMgV8YxfdpWHpGIoYep
         M/INFOPjeTVC3OEHHCjy2E1Hs8kTN4G53N8xRA/QBMd1ulJjTypxrYcp9Vasl1Q/eOJB
         qHAj6LLFWCEJm7FVRIifJLn+g0xAhtpqiGJt/0Lazj8LpFDzEnyQtx4bqcugERvtsdZG
         jeSnKtUCKGP4SXlnb3HB7CkPQRbT8a6KgjjUz3Q32zw4SQOfC5UckDKNJQGxML3W3hgv
         kauff9Q/Ua47CAvmWSZZgrFSzvsXxKLS/PIpqLn25rigG7/KetjxEqCiT7a4LgLAH6NO
         U6Ng==
In-Reply-To: <20220913195508.3511038-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador@su>

A zone that overlaps with another zone may span a range of pages
that are not present. In this case, displaying the start_pfn of
the zone allows the zone page range to be identified.

Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 mm/vmstat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/vmstat.c b/mm/vmstat.c
index 90af9a8572f5..e2f19f2b7615 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1717,6 +1717,11 @@ static void zoneinfo_show_print(struct seq_file *m, pg_data_t *pgdat,
 
 	/* If unpopulated, no other information is useful */
 	if (!populated_zone(zone)) {
+		/* Show start_pfn for empty overlapped zones */
+		if (zone->spanned_pages)
+			seq_printf(m,
+				   "\n  start_pfn:           %lu",
+				   zone->zone_start_pfn);
 		seq_putc(m, '\n');
 		return;
 	}
-- 
2.25.1

