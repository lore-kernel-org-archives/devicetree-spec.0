From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] devicenodes.rst: fixes reg property value mistake
Date: Mon, 27 Nov 2017 15:51:32 +0000
Message-ID: <CACxGe6sEKFjZ3984HAU4GyOpe0HdioqDtZ+H8MHc-bjeQ-eZoA@mail.gmail.com>
References: <20171126072836.13935-1-gimcuan@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=YVv2bCExpn/lAdB1g1bSU8Wn5eXGGHG1V+jM65e5dPU=;
        b=XPv8t5garNMZp16IaEdGb2oy8lDY9wtzEgRpyModN+RkDAW3X4nHf1dUmqSwvmU0qE
         5s1ekeLR0Nq1yDeH1zMlGsa+anCLEHDrL2UjQzTsg8o3BqahW5bQgPzBn9jZhWE50HVR
         BwvPqWo2t9odamOv6fE70pUauVNL+6OeLay+WA8gdpywx/MhwipwAXrL1K6XR+mbC3t3
         2cv0czUh4W4s8C7Zy7AsQAZ7zTXcXUeF4pnQS9ZXxHPzjE9PoTUncFVXlLaywXd4B92+
         cjeC2kiW+EyyxmCCs3VSGqUGqxY4jYAL5G2qR1UszSEaMHV8eCRLYxlvqmZzTtXiaHPU
         If+g==
In-Reply-To: <20171126072836.13935-1-gimcuan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gimcuan Hui <gimcuan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sun, Nov 26, 2017 at 7:28 AM, Gimcuan Hui <gimcuan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> In cpu1 node of this example, the reg property's value should be 1.
>
> Signed-off-by: Gimcuan Hui <gimcuan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks.

g.

> ---
>  source/devicenodes.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/source/devicenodes.rst b/source/devicenodes.rst
> index bf82114..37db79b 100644
> --- a/source/devicenodes.rst
> +++ b/source/devicenodes.rst
> @@ -718,7 +718,7 @@ each with their own on-chip L2 and a shared L3.
>
>          cpu@1 {
>              device_type = "cpu";
> -            reg = <0>;
> +            reg = <1>;
>              cache-unified;
>              cache-block-size = <32>;
>              cache-size = <0x8000>; // L1, 32KB
> --
> 2.11.0
>
