From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Devicetree at Linux Plumbers Conference 2017
Date: Wed, 30 Aug 2017 15:55:59 +0100
Message-ID: <CACxGe6uhBeG0zmaFPqfiW1-RcPDX3M6hs=Ss8CRBKOZO17jtCQ@mail.gmail.com>
References: <CACxGe6v0hm_YC+JdatGpNcYtaeSiUgm58Gnj1ZWndLHCPcA1tQ@mail.gmail.com>
 <CACxGe6vz65ZhVRNCUYE91LAOJu7eQQRHkFOm5BS22Jvac=UaYA@mail.gmail.com>
 <CACxGe6vX4tz9QiCvSyaf9kqHXk+ubpGx0+2w608b7NBY0yNnyQ@mail.gmail.com>
 <CACxGe6u9v1pW=FFPJc04fwZqJRsvRaYHK4qfGzAmW=4Ft+Q_QQ@mail.gmail.com>
 <CACxGe6uEmrho8n5XrXOOEBybQGp7NJ2Jy68Gen+CVxv2Jj95Og@mail.gmail.com>
 <CACxGe6vOMsL=5tRzAyOoW-Rh5CjvJcvnn_Zv34L3g_tQVGfK4A@mail.gmail.com>
 <3AA247F8-C570-4F09-AF7A-B8619B0D69CD@linaro.org> <CAMuHMdUYNxgJjFF1X6KPiMRUoQ0eJibyeHsKoDM=JZ+gQF6qCA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=0zBhfBVC6Qu3FKJbuzxrfKwByDiFaQSGr9gFo19ibHY=;
        b=KmVrEhEOv7jxmMrrxttkg+k7Zk/8O8fxrQSjbeKpIFQnBt97Gba3Gk8Uz4DnlZR5GS
         4jn1ihGw+37fHmn5oE35sgX1OzlFnh4S79XJI47nzZmsVdl4ZWotZN+V+DfHNIiBaeZM
         LSMeshruqYYOSJK1jI1SazpuTxdfIYCs6DzyyH2VKEES/pegN4w8gmT0XtLly2SaEpoG
         LOWJNTtjXq41sHNYlH3TwbHEK6LstvWx6Ku7j9iH5imw+vRJJCDB1G7cqLYibiE3aGBR
         /HQElvVyPRKmgxadRDemYt3+AOX7tbbW55dH0jjDEF9cuIEP55dV/72DvMOoWiuEWqlL
         P2LQ==
In-Reply-To: <CAMuHMdUYNxgJjFF1X6KPiMRUoQ0eJibyeHsKoDM=JZ+gQF6qCA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Fabien Parent <fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <SWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof.johansson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Wed, Aug 30, 2017 at 3:42 PM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Hi Kumar,
>
> On Wed, Aug 30, 2017 at 4:36 PM, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> On Aug 30, 2017, at 5:41 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>>> Confirmed! The Devicetree Workshop will be Thursday 26 October in the
>>> afternoon. Anyone registered for OSS will be able to attend. I don't
>>> know yet if there are any other consessions for registration. I'm
>>> finding out now and will update as soon as I know.
>>>
>>> Cheers,
>>> g.
>>
>> Does ELCE registration count?
>
> Yes, according to
> http://events.linuxfoundation.org/events/linux-kernel-summit/attend/register

Yes. There is a single registration form for both OSSE and ELCE.

Cheers,
g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
