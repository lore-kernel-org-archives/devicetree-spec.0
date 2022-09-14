From: Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 03/21] mm/hugetlb: correct demote page offset logic
Date: Wed, 14 Sep 2022 10:08:00 -0700
Message-ID: <YyIKcNRP+Q0Vt3CT@monkey>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-4-opendmb@gmail.com>
 <YyETeBdbldnoRZ+x@casper.infradead.org>
 <33ff9543-3396-7609-3865-7eed20b853f5@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=sxnu/ud7okUwTaP46Kbo7izmkdpc98GY1qFcrzjoz/o=;
 b=CgNZ129BvNhr4mdfBI0Y0V0IwktRbmgKG6Zezu9xrai+jmtzNMlCJHxiCEiLxj4qAcl7
 fbSM2M2/MY39hL11XI+8pSxixu8gJfbtQiqH905Hti0zIxvzJaHI6u8re71Oy0CP4BJR
 Ie2jTAtZvwAXfvkLht+KoLDYuQqlrorJrewkDoIoV2JHNUQfIpRu2PwVulS8iNNj+amd
 XvwOUGULX45LH39K+up9UVVa4ay5r9DdsFZ2u5mHnKtju1zxgGm58g9KDKvuX2DkD7R8
 9apuKqqtt2ZBIKpcTOVog9QMUpk6vI4ZM/eFa+gVyK28/UkeTfoQ88M6Ay6bX+cHfXvc rg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxnu/ud7okUwTaP46Kbo7izmkdpc98GY1qFcrzjoz/o=;
 b=MABD7BPzAQNXEBC/+ZTwgalgAGGP1xVBdPHlu8KOZNqkbJr5N8ttWbTGAJDIq0LNOwRv9Dx8oMQmFUcs0d1zdpMVZe6vkQems5gGnHPW5SZx0pTeqor4X8J16Khro9nSD6+xfMLrI2/m7uJqPjzfroV4VBztCisjVyd7RaoT11I=
Content-Disposition: inline
In-Reply-To: <33ff9543-3396-7609-3865-7eed20b853f5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar

On 09/13/22 18:07, Doug Berger wrote:
> On 9/13/2022 4:34 PM, Matthew Wilcox wrote:
> > On Tue, Sep 13, 2022 at 12:54:50PM -0700, Doug Berger wrote:
> > > With gigantic pages it may not be true that struct page structures
> > > are contiguous across the entire gigantic page. The mem_map_offset
> > > function is used here in place of direct pointer arithmetic to
> > > correct for this.
> > 
> > We're just eliminating mem_map_offset().  Please use nth_page()
> > instead.That's good to know. I will include that in v2.

Thanks Doug and Matthew.  I will take a closer look at this series soon.

It seems like this patch is a fix independent of the series.  If so, I
would suggest sending separate to make it easy for backports to stable.
-- 
Mike Kravetz
