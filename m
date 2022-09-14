From: Doug Berger <opendmb@gmail.com>
Subject: Re: [PATCH 03/21] mm/hugetlb: correct demote page offset logic
Date: Tue, 13 Sep 2022 18:07:41 -0700
Message-ID: <33ff9543-3396-7609-3865-7eed20b853f5@gmail.com>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-4-opendmb@gmail.com>
 <YyETeBdbldnoRZ+x@casper.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=plxos9uquFOD+IvTyP/oZn7J1wpWUgAiZjzQhRQDPPQ=;
        b=b5Ib02DcxbD8iGr+e9uO3ofxDa5NOXUgiKqm4v2kO2kVzLFaIksphZ+L5Zdbvek1wM
         Wmqq1e6M0COkpEIS2jTy/PtUgCdajEtU48nkMBXp1pD9XDM6s+PucJjIlGaVewK6jpAB
         MixvjHa8iEwvkFwCTzd4+IiI1JDNHjbquWMgFtpWgjJj6qqEw5WAYPSMVDEgpLo3HNek
         36boSZgTaGRXICe0uFLtjuI38uivs5RzA7nLftvI8tOPpKmyKy3pz/VsvafUilaTeUvi
         fcpstGUbfcwFK2RzmK6KZVIK3Hl4+3OGNIQyl05fWMzuh3cx6pq0kx437GIDICGwdU2D
         iecg==
Content-Language: en-US
In-Reply-To: <YyETeBdbldnoRZ+x@casper.infradead.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <songmuchun@bytedance.com>, Mike Rapoport <rppt@kernel.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Florian Fainelli <f.fainelli@gmail.com>, David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Oscar

On 9/13/2022 4:34 PM, Matthew Wilcox wrote:
> On Tue, Sep 13, 2022 at 12:54:50PM -0700, Doug Berger wrote:
>> With gigantic pages it may not be true that struct page structures
>> are contiguous across the entire gigantic page. The mem_map_offset
>> function is used here in place of direct pointer arithmetic to
>> correct for this.
> 
> We're just eliminating mem_map_offset().  Please use nth_page()
> instead.That's good to know. I will include that in v2.

> 
>>   	for (i = 0; i < pages_per_huge_page(h);
>>   				i += pages_per_huge_page(target_hstate)) {
>> +		subpage = mem_map_offset(page, i);
>>   		if (hstate_is_gigantic(target_hstate))

