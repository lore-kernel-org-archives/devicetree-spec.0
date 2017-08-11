From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] interrupt-mapping: Fix parent interrupt specifier description
Date: Thu, 10 Aug 2017 22:19:08 -0500
Message-ID: <CAL_Jsq+LG5qYX_wyNUNse1sWwREdBCyooRaZs9mChku5L+xM0Q@mail.gmail.com>
References: <20170809232824.4959-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170809232824.4959-1-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, Aug 9, 2017 at 6:28 PM, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> The number of cells here is not dictated by the #interrupt-cells
> property of this node, but the same property in the interrupt
> parent. This looks like a copy/paste mistake from child interrupt
> specifier.

Indeed. Applied.

Rob
