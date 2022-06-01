From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [dtschema PATCH] schemas: i2c: Add missing properties and
 descriptions
Date: Wed, 1 Jun 2022 14:29:02 -0700
Message-ID: <YpfaHrIozOQzv65O@google.com>
References: <20220427175956.362987-1-robh@kernel.org>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nAVwQodkjWfLxV3GaHIx/ifN9ZldZyPTtngAs8rNMts=;
        b=jYuTllxZgZe0PsX4trAM0f1L4PyvIgYBZL5Aan6F0a71HAPpjz/MwDZZ82+ZlczdzN
         zNEZpczeYXTtVSFKZHjnkTQ+kHpjfGdSw5Y6TN8Lhfjp/4h7brVxJWC8KOtSnaNQ90sn
         sAtqIKHf7ZmJuvcldRCp1nrz6y6Rr7btUF9uIQ0cwRFXw7QXaAGCiobVsCOYDFimBwp2
         oveC0osN1TVL+fWq8LIoNLayKqowm/L25gFD7sPHtHGiRn4hjJqrktIA0pdJHk2k3r7e
         1TmhXylJwTs1uiXkhCO5oDXn58fkutHdy62J2dYhTkb5N/wvIz+HiODx0EbCrMLW0G+u
         +KSw==
Content-Disposition: inline
In-Reply-To: <20220427175956.362987-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Codrin Ciubotariu <codrin.ciubotariu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alain Volmat <alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>, Matt Johnston <matt-KrQt6mEI6EMUxA4j4dw1vfQIK84fMopw@public.gmane.org>

On Wed, Apr 27, 2022 at 12:59:56PM -0500, Rob Herring wrote:
> Add remaining properties and descriptions from i2c.txt binding in Linux
> kernel tree. The Cc list are the authors of i2c.txt.
> 
> Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
> Cc: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Codrin Ciubotariu <codrin.ciubotariu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Alain Volmat <alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>
> Cc: Matt Johnston <matt-KrQt6mEI6EMUxA4j4dw1vfQIK84fMopw@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Cc list, 
> 
> I need your or your company's permission to relicense i2c.txt contents 
> (used in 'description') to BSD-2-Clause. Please ack and provide a 
> copyright if desired.

Acked-by: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks.

-- 
Dmitry
