From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] dt-bindings: reserved-memory: Add restricted-dma-pool
 constraints
Date: Thu, 17 Feb 2022 14:40:00 -0800
Message-ID: <60b60a8a-6aef-8561-8aa1-049206aede7f@gmail.com>
References: <a4f3d4e2feef008d1236ebc3f5f0c46360f20c60.1645119806.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kJKvlz6mTbZ0HU9h+IMyLVNCFn3UT1msVylNEqZAnxc=;
        b=qT5KJDsQo3lgUYLoyO0X62lyth9bJgO4hfKCQi8eZ1fFmaxjnYhusXXugvn+2z/0sA
         4Zh4T+8eWIaRZXtIgS65S0glYGFSoA9ZS99FWhUjFXBseIAK7KKC8jtAg6jggYLdBCN4
         Nh+QfEjTtoF2hzHgU97SpUc3nFRPelL/qua6dKJm/aOfPXlFqppZ+o9kGYO+YLWzz/e9
         aqT8/jOFfhCbk16j3El35npP7/nB2NmMuhrLmk++q6xdHvPxkI8Qr46A5XVndhjku0qL
         S2QgNDTFGsVV+0Rid3RHSHZjN7ikY4JPJHAX5OFwu0SWfpd6FsK1eiK+qiwCuUENgeUY
         3Jqw==
In-Reply-To: <a4f3d4e2feef008d1236ebc3f5f0c46360f20c60.1645119806.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 2/17/22 9:47 AM, Robin Murphy wrote:
> The "restricted-dma-pool" definition prohibits combination with either
> of the "no-map" and "reusable" properties, but this is only stated in
> the description text. Add those constraints to the schema so we can
> properly validate them.
> 
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

Acked-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

FWIW
-- 
Florian
