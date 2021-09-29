From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Add system-cache-controller to the list of generic node names
Date: Wed, 29 Sep 2021 07:42:52 -0500
Message-ID: <CAL_JsqLzDejj99C6CPuW+19cgwdDVkctppL_SFeWnAG5LUkscw@mail.gmail.com>
References: <20210929052613.8589-1-saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632919385;
        bh=cWzLi7i1a/a68Tsb75m2gFcMuYlcPGVTxONILp7CzaA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lmgT1zdZ0oLjC5TFc9XmPIIQrBSMYFRL12JFR5LgtCMedubwNzoWj8y7CpB8E2/se
         CHUkVMyTsFiR2/UL9z/e/nJTaAs2SwvkPcITSgbUYLJZ/4WMFIHB2M+3+yVfVbnLII
         UqNor+jqnftZaySO//zGAsuiCypwzqpl8Iu37OybjCaFYTgjuh/bOfkLCf+u61PiC7
         uOEWbK0kG2HmXTu/2oIox9c0MsB+woxNt4l2c1kwkJz3+ht5kOVatOWZZlYT9Wkb3l
         rJ8iMnFsSmEGRP6mqnl6i4MTO8POa6XxcQOFs4WkVrJtPVlf/bCb9rqHd9D/xSeqYH
         V+IUdRkkarhiA==
In-Reply-To: <20210929052613.8589-1-saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sai Prakash Ranjan <saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

On Wed, Sep 29, 2021 at 12:26 AM Sai Prakash Ranjan
<saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
> System Cache Controller (Last Level Cache Controller/LLCC) does not
> have a cache-level associated with it as enforced by the already
> existing 'cache-controller' node name, so add system-cache-controller
> to the list of generic node names as decided on the lkml in [1][2]
> and already being used in the dts for sometime now.
>
> [1] https://lore.kernel.org/lkml/5dcd8588.1c69fb81.2528a.3460-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org/
> [2] https://lore.kernel.org/lkml/cover.1573814758.git.saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org/
>
> Cc: Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  source/chapter2-devicetree-basics.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devicetree-basics.rst
> index 40be22192b2f..c06c5063c68b 100644
> --- a/source/chapter2-devicetree-basics.rst
> +++ b/source/chapter2-devicetree-basics.rst
> @@ -276,6 +276,7 @@ name should be one of the following choices:
>     * sram-controller
>     * ssi-controller
>     * syscon
> +   * system-cache-controller

I don't want to encourage others to use this over 'cache-controller'
and the standard binding.

Rob
