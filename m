From: Ramon Fried <rfried.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Memory aliasing and nodes
Date: Thu, 21 Apr 2022 13:33:10 +0300
Message-ID: <CAGi-RUL4FJBXYUMbpdMo=XNd7DE1wD6aUqXUt5Y+5BY1KO-FYg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=jfeQyd0xvVPJrQCfj9I1r976Q1mVgnaHdgkwLKs6So8=;
        b=Zr06bN3NgGdXd7IUwxK1jaZhcQ3tLG9vw5XExrMkPY6K+I9kpaZht5sGPTI1sXNzus
         AFv6KgdKikNQ6lp34mjguw/cHLnxPMcQnPjP64NV3ulq5juKeI6WbwQPJ3pvC7rRTcz1
         wG0EP989VENFO28kXrF8RuisGOlWCHrXWBQx7XtYLsQNkXlnRugrYBW716e4/YRQKwbz
         cAQQZnlq/DxzMymtcNrEZVmqzjrNTYr9oLQDvT7oHI29fa3GOpNOrsvqbydmy72z6+P6
         QGXUJxCh//iFXj52ZYZUevPg6PJr5pq1No43f912TKPtCEaMAETO+uhm+cKsEDewtasK
         24Kg==
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi all,
This is the second time in my career that I've stumbled upon a SOC
which has 32bit memory aliasing for high memory for the usage of
drivers that can only address 32bit address space.

Basically, a subset of a memory higher than 4GB can be accessed also
through a range in the low 4GB addresses.

I didn't see any support for this neither Linux kernel nor in device
tree. I'm wondering if you considered adding a way to describe such
addressing in the device tree, and maybe later Linux can add support
for it.

Thanks,
Ramon
