From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Add system-cache-controller to the list of generic node names
Date: Thu, 30 Sep 2021 08:33:45 -0500
Message-ID: <CAL_Jsq+vkpigu3P+dkAVXT7nypnJA_R8LBPGgj9wERcCW6P36w@mail.gmail.com>
References: <20210929052613.8589-1-saiprakash.ranjan@codeaurora.org>
 <CAL_JsqLzDejj99C6CPuW+19cgwdDVkctppL_SFeWnAG5LUkscw@mail.gmail.com> <d9894ca86ed9a56ebf118a91bfe1b91d@codeaurora.org>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633008857;
        bh=l+Ra+00HjDOurU1ZSRtF9bE99IlFFJksp/p6hk8Owlw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Or1iisb05+o/a2i37j7EvyoR8Y9tEIL9XesEmUzoHa6qpK+aKgGux7o7DPnA10h5K
         rcQkMtqIks+c+nrSplVNnVFX2kTnIvd2yU5RfGE9gdTcW4l4V+/RxJpMk0XW2zrDGv
         C2RR9EmEqoQWHXG3nJjN2RibXSomJ883YTbKX6J+6/hVH++8FTsInVPn2F3oWjKVA8
         548uprXG+wZieJ8muCVcQGygtJTlgOsY6Wh8UwBG6cRNj4kRRIv7aci4dzUUWWIMiD
         +FHFZedbq0LJQN9bDTFuqWkeB0OlBOjn8r4OZgWOaSccTTzX6IMEbFn/T5pfspNNdp
         0HOr1IJDn4Q4Q==
In-Reply-To: <d9894ca86ed9a56ebf118a91bfe1b91d-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sai Prakash Ranjan <saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

On Wed, Sep 29, 2021 at 11:06 PM Sai Prakash Ranjan
<saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
> On 2021-09-29 18:12, Rob Herring wrote:
> > On Wed, Sep 29, 2021 at 12:26 AM Sai Prakash Ranjan
> > <saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> >>
> >> System Cache Controller (Last Level Cache Controller/LLCC) does not
> >> have a cache-level associated with it as enforced by the already
> >> existing 'cache-controller' node name, so add system-cache-controller
> >> to the list of generic node names as decided on the lkml in [1][2]
> >> and already being used in the dts for sometime now.
> >>
> >> [1]
> >> https://lore.kernel.org/lkml/5dcd8588.1c69fb81.2528a.3460-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org/
> >> [2]
> >> https://lore.kernel.org/lkml/cover.1573814758.git.saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org/
> >>
> >> Cc: Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> Cc: Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >> ---
> >>  source/chapter2-devicetree-basics.rst | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/source/chapter2-devicetree-basics.rst
> >> b/source/chapter2-devicetree-basics.rst
> >> index 40be22192b2f..c06c5063c68b 100644
> >> --- a/source/chapter2-devicetree-basics.rst
> >> +++ b/source/chapter2-devicetree-basics.rst
> >> @@ -276,6 +276,7 @@ name should be one of the following choices:
> >>     * sram-controller
> >>     * ssi-controller
> >>     * syscon
> >> +   * system-cache-controller
> >
> > I don't want to encourage others to use this over 'cache-controller'
> > and the standard binding.
> >
>
> Right, but why would others use this over cache-controller? This is
> supposed
> to be used only for last level cache controllers where there is no
> cache-level
> associated with it like in the system cache controller/LLCC found in QTI
> SoCs.

I don't agree there's never a level.

Using the cache binding will be necessary if you want to populate the
kernel's cache info. If your caches have MPAM support, they are going
to need to follow the cache binding as well.

> Also you had acked the corresponding change in the DT binding for LLCC
> [1].

Yes, but that doesn't mean it belongs in the spec. Maybe when we have
more than 1 case that will change, but for now I don't think it should
be in the spec.

Rob
