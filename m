From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] schemas: clock: Add assigned-clocks description
Date: Fri, 29 Apr 2022 17:24:17 +0200
Message-ID: <d9dfd712-45f6-2fac-4cbc-dd0a12f564e8@samsung.com>
References: <CGME20220428152638eucas1p11b7bbe5bcb8d36641b8328057a248789@eucas1p1.samsung.com>
        <20220428152633.2261979-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220429152419euoutp01bdfb11b90c56ee390adf91b311b672e2~qZ1wxugyc0764707647euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651245859;
        bh=to37rMSP/G4CXEYIvomZmetr3C+P2P4ivMTn6xRdbsg=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=s+mnha8h73OcVdNiAiuyusAWF20b5DDiAQCsuEn81J9QVa+BMxE79dYNeECBZQ0kh
         dhmD/Jyy2rls8nGL+PPE4RN3QHek3bNxU4unNKaD7jS6jW3/++DEqH7ZxxIGxMr0tZ
         0bNru8lQkuXJ/DbXgLscwAZFzZSBm8iFhdMkGVOo=
Content-Language: en-US
In-Reply-To: <20220428152633.2261979-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

On 28.04.2022 17:26, Rob Herring wrote:
> Add description for assigned-clocks properties from clock-binding.txt in
> the Linux kernel.
> 
> This is relicensed from GPL-2.0 (the default) to BSD-2-Clause. The Cc list
> are the original authors.
> 
> Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Please ack for the license change.

Acked-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
