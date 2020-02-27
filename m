From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Fix displaying GPIO_ACTIVE_LOW in devicetree-basics.rst
Date: Thu, 27 Feb 2020 10:27:45 -0600
Message-ID: <20200227162745.GA12232@bogus>
References: <20200220201154.14207-1-arkadiusz@drabczyk.org>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200220201154.14207-1-arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Feb 20, 2020 at 09:11:54PM +0100, Arkadiusz Drabczyk wrote:
>         expansion_device {
>                 reset-gpios = <&connector 2 GPIO_ACTIVE_LOW>;
> 		                            ^^^^^^^^^^^^^^^
>         };
> 
> ^^... was shown in red boxes in the output PDF, HTML and possibly
> everything else.
> 
> Signed-off-by: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
> ---
>  source/extensions/DtsLexer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

4 patches applied, thanks.

Rob
