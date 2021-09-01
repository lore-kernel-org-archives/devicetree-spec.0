From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 05/52] dt-bindings: Convert Reserved Memory binding to
 a schema
Date: Wed, 1 Sep 2021 08:10:36 -0400
Message-ID: <20210901121036.GY858@bill-the-cat>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-6-maxime@cerno.tech>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E6mpPb7f1F5lRhxBylDSrTxeNwkSOwBfhFK+8t8tMzw=;
        b=BHE1z2l1fRN7EaJh7wRMCoKvitxbmB5ICi1ZNqQc7um4oCx7DlDTvNyfopK5hpzqaO
         kr4m9UCAC7EBe0KV5fxUY4t64yS6gZeqqiUtYbMe2aP8WcOMVCN/eHfKOaKjsWvduy21
         pqnnlGzao3sUSPumfpjlX4FC/ERhiUvjYaeYo=
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-6-maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, Sep 01, 2021 at 11:18:05AM +0200, Maxime Ripard wrote:

> The Reserved Memory mechanism is supported by Linux thanks to its device
> tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>

Minor request.  As device tree bindings are used and valid and
applicable outside of Linux, it shouldn't be mentioned in the commit
message either.  This binding is just as valid for U-Boot, FreeBSD, etc
as it is for Linux :)  Thanks!

-- 
Tom
