From: Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 02/21] mm/hugetlb: correct max_huge_pages accounting on
 demote
Date: Wed, 14 Sep 2022 11:43:05 -0700
Message-ID: <YyIguZbB1KzaOJRo@monkey>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-3-opendmb@gmail.com>
 <YyIN+bpKdCb3JuuY@monkey>
 <c4d40567-6ac6-d822-7098-a5ad1ae567ec@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=OyeFm6bnERPJ30RlB5vaLwq3t3uNQr23bGheHrRS04w=;
 b=x/YvSSLqAcDXsgVfzMMLsLujRRhvIJMimoi6iOhMnvenhnz6WE+0voHrpcrgmb1knu8Q
 lPpnVuLgN+ZXVQrLR6un2cb6wvSy7KLaLKagym7k+SR20teKvY2x8q/147qqL68CyP8w
 AjSwQcpVekxmqnMAhU6umy4AB7FK4QqaLPDF+oL12aiejj6N8Z3/bTJlJjhJbW06EAxa
 OZQx++5ulI0AJK/+zd36sLvCySAw9QcEo2PqLVWQ21l+CveAy10ygkxEAxYthB0bF1Ni
 hOK9O3x6EmI1dEUgOx4SpqJBMQT72TAeIfa4pEJ6QHzZdrcpyNZ8OXrQ7me3se/TdIat Og== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyeFm6bnERPJ30RlB5vaLwq3t3uNQr23bGheHrRS04w=;
 b=e64pzSSQ4WZ5jRbmqPgAHhJzgr3Omz68fgtBWaO0hbPlPASj8+xsVGBrrGHqZssr0aofGZwBK+FE3Xqn81yNb9E5/quUTFHar2u9w4dwODleKTd+zLdngAtmrcy8oVVfqEGiyCNmird3+eE24Sjio5AL4E/IWuHJfONzJjAHvUA=
Content-Disposition: inline
In-Reply-To: <c4d40567-6ac6-d822-7098-a5ad1ae567ec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>, Hari Bathini <hbathini>

On 09/14/22 10:26, Florian Fainelli wrote:
> On 9/14/22 10:23, Mike Kravetz wrote:
> > On 09/13/22 12:54, Doug Berger wrote:
> > > When demoting a hugepage to a smaller order, the number of pages
> > > added to the target hstate will be the size of the large page
> > > divided by the size of the smaller page.
> > > 
> > > Fixes: 8531fc6f52f5 ("hugetlb: add hugetlb demote page support")
> > > Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >   mm/hugetlb.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > > index e070b8593b37..79949893ac12 100644
> > > --- a/mm/hugetlb.c
> > > +++ b/mm/hugetlb.c
> > > @@ -3472,7 +3472,8 @@ static int demote_free_huge_page(struct hstate *h, struct page *page)
> > >   	 * based on pool changes for the demoted page.
> > >   	 */
> > >   	h->max_huge_pages--;
> > > -	target_hstate->max_huge_pages += pages_per_huge_page(h);
> > > +	target_hstate->max_huge_pages += pages_per_huge_page(h) /
> > > +					 pages_per_huge_page(target_hstate);
> > >   	return rc;
> > >   }
> > 
> > This has already been fixed here,
> > 
> > https://lore.kernel.org/linux-mm/20220823030209.57434-2-linmiaohe-hv44wF8Li93QT0dZR+AlfA@public.gmane.org/
> > 
> 
> Could we slap the Fixes tag when this Miaohe's patch series gets accepted
> since the offending commit is in v5.16 and beyond. Thanks!

We could.  However, this fix/change does not really have any impact on
the way code functions (unless I am mistaken).  See my analysis at,

https://lore.kernel.org/linux-mm/YvwfvxXewnZpHQcz@monkey/

-- 
Mike Kravetz
