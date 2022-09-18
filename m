From: Krzysztof Kozlowski <krzysztof.kozlowski-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 16/21] dt-bindings: reserved-memory: introduce
 designated-movable-block
Date: Sun, 18 Sep 2022 11:31:23 +0100
Message-ID: <07d87203-6fe1-c612-cb79-9080e1988454@linaro.org>
References: <20220913195508.3511038-1-opendmb@gmail.com>
 <20220913195508.3511038-17-opendmb@gmail.com>
 <20220914145506.GA2149379-robh@kernel.org>
 <57f19774-39a1-03a6-fe68-83d7e4b16521@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ce5cvWhhANY4HGxf0tRAuv3blHoMqL+HG3bwTNXRg7o=;
        b=Cv2CnAB1JfcEP+Qy5kSj1OisEBQTHOgZCWQdVEyN3+Mw7zERm6O+cEMRyg7ye0Mst4
         wJZeoxG7W/cSqjAmthTQ6nwOcRaVBfElh02x5xuz1V1mx4Fg7CLL9bfu9rjgdlVF0SxA
         2pq8IeVOGLcA/W7jRYIUQ8gk/jgMrRExOig/Sp7mBOV69JqTsKRzO+YKwIa1wodOxO12
         1R5eCcqAOaPdKxGK3fpX0/PDMU4ZbxMRXdMr27cEy63fHDxCztyc3NjHCxXaAy6HrEXw
         r5Ph8WrazcmMTI/cO04jF8kh+kDe5POzr5yce5IoJNjqmWMHT+BemfAJIeXRaxW4Y/h1
         KSbA==
Content-Language: en-US
In-Reply-To: <57f19774-39a1-03a6-fe68-83d7e4b16521-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Muchun Song <songmuchun-EC8Uxl6Npydl57MIdRCFDg@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, "Paul E. McKenney" <paulmck-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neeraj Upadhyay <quic_neeraju-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Damien Le Moal <damien.lemoal-yzvPICuk2AC/Fx7ZUtofftBPR1lH4CV8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Hildenbrand <david-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oscar Salvador <osalvador-l3A5Bk7waGM@public.gmane.org>, Hari

On 14/09/2022 18:13, Doug Berger wrote:
> On 9/14/2022 7:55 AM, Rob Herring wrote:
>> On Tue, Sep 13, 2022 at 12:55:03PM -0700, Doug Berger wrote:
>>> Introduce designated-movable-block.yaml to document the
>>> devicetree binding for Designated Movable Block children of the
>>> reserved-memory node.
>>
>> What is a Designated Movable Block? This patch needs to stand on its
>> own.
> As noted in my reply to your [PATCH 00/21] comment, my intention in 
> submitting the entire patch set (and specifically PATCH 00/21]) was to 
> communicate this context. Now that I believe I understand that only this 
> patch should have been submitted to the devicetree-spec mailing list, I 
> will strive harder to make it more self contained.

The submission of entire thread was ok. What is missing is the
explanation in this commit. This commit must be self-explanatory (e.g.
in explaining "Why are you doing it?"), not rely on other commits for
such explanation.

> 
>>
>> Why does this belong or need to be in DT?
> While my preferred method of declaring Designated Movable Blocks is 
> through the movablecore kernel parameter, I can conceive that others may 
> wish to take advantage of the reserved-memory DT nodes. In particular, 
> it has the advantage that a device can claim ownership of the 
> reserved-memory via device tree, which is something that has yet to be 
> implemented for DMBs defined with movablecore.

Rephrasing the question: why OS memory layout and OS behavior is a
property of hardware (DTS)?



Best regards,
Krzysztof
