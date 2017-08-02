From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Devicetree at Linux Plumbers Conference 2017
Date: Wed, 2 Aug 2017 14:19:47 +0100
Message-ID: <CACxGe6vX4tz9QiCvSyaf9kqHXk+ubpGx0+2w608b7NBY0yNnyQ@mail.gmail.com>
References: <CACxGe6v0hm_YC+JdatGpNcYtaeSiUgm58Gnj1ZWndLHCPcA1tQ@mail.gmail.com>
 <CACxGe6vz65ZhVRNCUYE91LAOJu7eQQRHkFOm5BS22Jvac=UaYA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=raYi4++/rBloK4BpTO6vb2buU/1woXfeTMj8Le/SGfI=;
        b=BPClKx+cRX9IbWuWilhIiHIlXi8Uv9+HjMCTDcpNI2Q2dPNJcMPISm3QokCbnj0b9A
         eQ8JDjPtGkVThMIQ47GAx+adLwxYFbXMNCvUzNbqp9IbNxQJSEtE6zAx7B7Ri4EVvd3B
         PMmzszkzGH6Em7Knx3XTKho8F2JndPrnXjj/+umH7zPE/jaziF/dddbra0BoYjW3X5aF
         PMCTrUjgRdrM4erOMMT/lrw5LoAXjHSsaPq5ntgvUCppOhMbQOnu/K60hOXRI2BXl/pj
         X4PxA4aue41YObF7kPtzAGw0kGlkQ2vmLlOkwqms0qSnesbcwYxJ+ZEVyKxKxr9yo5qV
         2z7A==
In-Reply-To: <CACxGe6vz65ZhVRNCUYE91LAOJu7eQQRHkFOm5BS22Jvac=UaYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Fabien Parent <fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <SWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Olof Johansson <olof.johansson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Tue, Aug 1, 2017 at 5:37 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Mon, Jul 31, 2017 at 6:29 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> Hi folks,
>>
>> For anyone attending Linux Plumbers Conference this year, I'm trying
>> to put together an agenda for a Devicetree miniconference, and I need
>> topics. If you have anything you want to discuss or present, please
>> add it to the following wiki page and/or email me:
>>
>> http://wiki.linuxplumbersconf.org/2017:device_tree
>
> A number of people have asked about holding this at ELCE instead of
> Linux Plumbers, so I'd like some feedback. Here's a quick survey.
> Please reply ASAP if your interested in a Devicetree miniconference
> this year:
>
> https://docs.google.com/forms/d/e/1FAIpQLSe0k9L597egFfOwZoDwq0Og-hRt8IAEPtp-JpvoH9nw2njx0g/viewform?usp=sf_link

Last call for survey responses.

I've had 10 responses so far, and the concensus it to hold it at ELCE.
Ted thinks he'd be able to give us a 1/2 day on Thursday 26 October
(ELCE runs 23-25, and KSummit 24-26). Unless someone makes a strong
argument otherwise, I'm going to choose locating with ELCE/Ksummit.

Cheers,
g.
