From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/21] mm: introduce Designated Movable Blocks
Date: Wed, 14 Sep 2022 13:07:36 -0500
Message-ID: <CAL_JsqJ6+uYf=Pb82j3CWC3iD=-hbnf3nj_TsHoQAUcLK3mKbg@mail.gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com> <CAL_JsqLmJcLHViPaBPvkBhR4xi+ZQuAJQpXoiJLVRW9EH4EX0Q@mail.gmail.com>
 <1825234b-f17a-dea4-38f6-ba5881ab9a3d@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663178880;
        bh=8QO6bezE+2K66FghJrVXTS5RtL94PMOZ3HUJaLfntwk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HWyfrzoHehEIavhH0FSENC4JAl8tEfACVV0EcKmgJTzz5TmvQ2cnxAl5LY7uNl4mH
         qdPv4Mb6NFc2gUWo4Alk3cKLUKviK5+TbwHcf8yRMl9SeSndcJf3rI2h4Gqq5G09d+
         tkcML9ZrQS/FZ3M5vL3vUpIDA+zBy1/ts+GShucqdut5M28lSNmb8iUFoBgO1hnASQ
         /4A39HsAYbSQ6Xjj1f3WduoaOq0vL47e2QOFlZQIQ3r7dCgw9Qj7sUPyHYd3vtgril
         OwJ+wsy22o/ruYXmtJ2gRHucakBcnersIGClmLXVYJQTHVmx1AIlSF13n7u6pCqOoQ
         k7t8lnGj+bDgg==
In-Reply-To: <1825234b-f17a-dea4-38f6-ba5881ab9a3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>, Hari

On Wed, Sep 14, 2022 at 11:57 AM Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On 9/14/2022 6:21 AM, Rob Herring wrote:
> > On Tue, Sep 13, 2022 at 2:57 PM Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>
> >> MOTIVATION:
> >> Some Broadcom devices (e.g. 7445, 7278) contain multiple memory
> >> controllers with each mapped in a different address range within
> >> a Uniform Memory Architecture. Some users of these systems have
> >> expressed the desire to locate ZONE_MOVABLE memory on each
> >> memory controller to allow user space intensive processing to
> >> make better use of the additional memory bandwidth.
> >> Unfortunately, the historical monotonic layout of zones would
> >> mean that if the lowest addressed memory controller contains
> >> ZONE_MOVABLE memory then all of the memory available from
> >> memory controllers at higher addresses must also be in the
> >> ZONE_MOVABLE zone. This would force all kernel memory accesses
> >> onto the lowest addressed memory controller and significantly
> >> reduce the amount of memory available for non-movable
> >> allocations.
> >
> > Why are you sending kernel patches to the Devicetree specification list?
> >
> > Rob
> My apologies if this is a problem. No offense was intended.

None taken. Just trying to keep a low traffic list low traffic.

> My process has been to run my patches through get_maintainers.pl to get
> the list of addresses to copy on submissions and my
> 0016-dt-bindings-reserved-memory-introduce-designated-mov.patch
> solicited the
> '- <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>' address.

Yeah, I see that now. That needs to be a person for a specific
binding. The only bindings using the list should be targeting the
dtschema repo. (And even those are a person ideally.)

Rob
