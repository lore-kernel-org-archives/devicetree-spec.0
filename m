From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Devicetree specification process
Date: Sat, 30 Apr 2016 12:02:15 +0100
Message-ID: <CACxGe6u==fS-0s6swtfXOzi0t3RvNQtCS9MSr147G-uf_+fUZw@mail.gmail.com>
References: <CACxGe6uY-b49YfgBEkJmhjrZ5Pv3+_GPGj+eZOWOkJ43Qc2e4A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=zGUMc5LniHOKy/Qe0c1tjySbBunaJC69COqjaJ2B0IY=;
        b=aDR2towYC41IKu5l40A60jgWGxjAm3xA2vK9K11Kut3TeSQ5SZinptuBJ+2B5vkuET
         9S2G4qeACumdTLDLgQ/FKjou0gU+s4LQ6967Z/tqQhRT5Ghmm1a1RzuxqCMwpPt2TMFm
         h/D7EB4osEfu8BjXVKcn6t4vOMDBWiytoCDL3dfFmx0wMpAWU9aLgbKsOr8vntCEC+IH
         q3T84i7Vl43Jaio7XZ9k/U3g3ZgFrBNI5+WiNjdwNSX02Oje5aCDPXtCB4h/Ws0wgXxq
         WX0GEAkWXEiY/PPURBADD+qHqL5+AlbYNfo8VZrCS7LWn4yNRG+xb0dXYlHO7kjk7jYw
         NldA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=zGUMc5LniHOKy/Qe0c1tjySbBunaJC69COqjaJ2B0IY=;
        b=ZNtj7kT3E0QGNupczYqxB08tgDpQeOVQmXm/TYTRSNH+QbhOQ+WxT7VJFjaMJzipS1
         jKa0iHjannQUK3Iog27cFB65PANsELusXKyDHpZ1VxXa9yiH/T9x6HKvvgIsGz3DMmLf
         8fk7Ud5SEpgqHEny8vzVsRmwz04ZKhSqfghHk=
In-Reply-To: <CACxGe6uY-b49YfgBEkJmhjrZ5Pv3+_GPGj+eZOWOkJ43Qc2e4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>

On Sat, Apr 30, 2016 at 12:23 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> I'm pleased to announce the first *very early draft* of the new
> devicetree specification that I and several others have been working
> on since January. This document picks up where ePAPR left off in 2012.
> I'm announcing it now along with the new devicetree.org organization
> which will handle governance for the spec.
>
> We're still in the process of getting all the details sorted out (not
> everything on the website is accurate at the moment), but in the mean
> time you can look at the current state of the document. At the moment,
> it is little more than repackaging the ePAPR text. The next step will
> be pulling in the new core bindings that were never covered by ePAPR.
> You can look at a draft copy of the document here:
>
> https://github.com/kvekaria/devicetree-specification-released/blob/master/prerelease/DevicetreeSpecification-20160429-pre1.pdf

Oops, wrong link. This should be:

https://github.com/devicetree-org/devicetree-specification-released/blob/master/prerelease/devicetree-specification-v0.1-pre1-20160429.pdf

g.
