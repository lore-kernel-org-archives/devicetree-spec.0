From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Intended use of "model" property?
Date: Tue, 13 Sep 2022 06:04:05 -0500
Message-ID: <CAL_Jsq+KdBTusKDh1g2H=Nqrw+Ff7k-d9c-UXZ22HGxYNRttkw@mail.gmail.com>
References: <dfc5b413eba67844ae65b27e0f926451.marti.bolivar@nordicsemi.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663067057;
        bh=NvPPKSX+cI5HGVtysvZmHVxE7x4r2zkjlT/Ewhr3Tmw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=F0WljdAIkSxFbqKcvjJraUq9TF0HABS9jIoOzQfBUIXqGDalDPCvogTMVIqxykXEC
         w3rvYw5vblqJ0g2U95Q5BvCnIgU7Pwb/aGBacdpwTEXPT/H1vlgMuUC95CMGYp5O3H
         9YZBNuKT9RDhOh/CjzXbEi8e/vY6AopG/becZcKuMAt0ZQ5HQ46gjhDYGSHE7V6iO2
         HBkZiyXyXq/1xIHxc3GaPP0yLlXxC+ZKQPKpAxv5oCIkj+bq0ETZG7R5xI65Ld1saw
         nCI9XsBbp0tzWbyjwahoemmXaTzp+kMSTCR339yLHlQRIv7dsE5B/nGEJWwSyh1NKo
         teWSs9veVNtTA==
In-Reply-To: <dfc5b413eba67844ae65b27e0f926451.marti.bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="tis-620"
To: Marti Bolivar <marti.bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, galak-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org

On Mon, Sep 12, 2022 at 3:18 PM Marti Bolivar
<marti.bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org> wrote:
>
> I'm trying to understand the intended use of the model property
> in DT spec v0.4-rc1 =C2=A72.3.2.
>
> Specifically, can "model" be a property in any node of the devicetree?

Yes, but not like 'status' in that bindings must define using it.

> The spec seems to indicate so, but grepping around the DTS files in
> Linux, it seems to be primarily used as a property of the root node, as
> a model name for the entire device.
>
> There are a few exceptions in Documentation/devicetree/bindings/, but
> they are mostly in sound/, so it's not clear to me whether this is the
> "model" I'm referring to here, especially since that isn't present next
> to "compatible", "reg", and friends in dt-schema/meta-schemas/core.yaml.

Audio has a defined use for 'model' to provide a name for the 'sound device=
'.

It's not in meta-schemas/core.yaml simply because it's not appearing
in lots of bindings.

> Is "model" in the =C2=A72.3.2 sense meant to be a property of the root no=
de
> only, or can it appear anywhere with the meaning defined there?

Even use in the root node is not terribly well defined. ePAPR
(starting point for the spec) defined it as a compatible like string.
On Arm, it's a more human friendly freeform string.

So I wouldn't encourage new uses.

Rob
