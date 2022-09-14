From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/21] mm: introduce Designated Movable Blocks
Date: Wed, 14 Sep 2022 09:57:35 -0700
Message-ID: <1825234b-f17a-dea4-38f6-ba5881ab9a3d@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <CAL_JsqLmJcLHViPaBPvkBhR4xi+ZQuAJQpXoiJLVRW9EH4EX0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=UWYZ+LvZVhpAV6ZQBWEOlqo/TbgQPhE93gUN5h4Opa4=;
        b=lBXUbs9pZpO+yTmR2jdfhmRm/kBSeGhEo/6IKheeNxrOaZ+SSStX4UyGbG7noCTZnL
         lp4GNVPC+yuVX066hyg9SZyWVQUc+v0zWdguOY/nmscUyeDVvKy5jSWZaO+xzphOdvAQ
         aTsC9QANMQ3cKIIiE6++nnjm/oB7778JyBSse4UwGosbGCTpuV7jvDE16vVWkNMCWqqr
         paslr3euDOvfLPglAFtll6BbrIEH7G9dDqqDsbt8U2peyjwbTzpRL2hP2NTerae1SkXT
         SVn4fudGRJTBSCtwGh1X5bX9nACK+SBbNtTAxaGYxsK9dZyA1/5h4e4DVMpUTdy67eBY
         DA4w==
Content-Language: en-US
In-Reply-To: <CAL_JsqLmJcLHViPaBPvkBhR4xi+ZQuAJQpXoiJLVRW9EH4EX0Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>, Hari

On 9/14/2022 6:21 AM, Rob Herring wrote:
> On Tue, Sep 13, 2022 at 2:57 PM Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> MOTIVATION:
>> Some Broadcom devices (e.g. 7445, 7278) contain multiple memory
>> controllers with each mapped in a different address range within
>> a Uniform Memory Architecture. Some users of these systems have
>> expressed the desire to locate ZONE_MOVABLE memory on each
>> memory controller to allow user space intensive processing to
>> make better use of the additional memory bandwidth.
>> Unfortunately, the historical monotonic layout of zones would
>> mean that if the lowest addressed memory controller contains
>> ZONE_MOVABLE memory then all of the memory available from
>> memory controllers at higher addresses must also be in the
>> ZONE_MOVABLE zone. This would force all kernel memory accesses
>> onto the lowest addressed memory controller and significantly
>> reduce the amount of memory available for non-movable
>> allocations.
> 
> Why are you sending kernel patches to the Devicetree specification list?
> 
> Rob
My apologies if this is a problem. No offense was intended.

My process has been to run my patches through get_maintainers.pl to get 
the list of addresses to copy on submissions and my 
0016-dt-bindings-reserved-memory-introduce-designated-mov.patch 
solicited the
'- <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>' address.

My preference when reviewing is to receive an entire patch set to 
understand the context of an individual commit, but I can certainly 
understand that others may have different preferences.

It was my understanding that the Devicetree specification list was part 
of the kernel (e.g. @vger.kernel.org) and would be willing to receive 
patches that might be of relevance to it.

I am inexperienced with yaml and devicetree processes in general so I 
have tried to lean on the examples of other reserved-memory node 
bindings for help.

There is much to learn and I am happy to modify my process to better 
accommodate your needs.

Regards,
     Doug
