From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Revert change to fsl,mpc8641 example
Date: Wed, 20 Dec 2017 09:35:17 -0600
Message-ID: <CAL_Jsq+dMY7kvoB6JbG0iKG1RmsSP-zPArL5oJuXO00MeXL=Og@mail.gmail.com>
References: <20171220112024.12303-1-grant.likely@arm.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220112024.12303-1-grant.likely-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, "Robert P . J . Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>

On Wed, Dec 20, 2017 at 5:20 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> Commit 7d888a01, "Aesthetic/grammar fixes to first part of
> devicetree-basics.rst" changed one of the Freescale compatible examples
> from "fsl,mpc8641-uart" to "fsl,ns16550". However, there is value in
> using examples from real hardware when possible, and to also show that
> different strings (mpc8641-uart vs. ns16550) for a device is normal, so
> revert that hunk.
>
> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
> Cc: Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
> ---
>  source/devicetree-basics.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
> index f007a4b..1900cc8 100644
> --- a/source/devicetree-basics.rst
> +++ b/source/devicetree-basics.rst
> @@ -469,10 +469,10 @@ Description:
>
>  Example:
>
> -   ``compatible = "fsl,ns16550", "ns16550";``
> +   ``compatible = "fsl,mpc8641", "ns16550";``

Missing the "-uart" part.

>
>     In this example, an operating system would first try to locate a device
> -   driver that supported fsl,ns16550. If a driver was not found, it
> +   driver that supported fsl,mpc8641. If a driver was not found, it
>     would then try to locate a driver that supported the more general
>     ns16550 device type.
>
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
