From: Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Node name & property name collusion - json/yaml implications
Date: Mon, 8 Feb 2021 16:47:15 +0100
Message-ID: <CAK8P3a34jOEFo6YfW752bVjEkh4sVr1dnRU+Y0wW9r+9YHXrzg@mail.gmail.com>
References: <C008DF92-364E-4892-A1C0-68A2C97BE946@linaro.org>
 <20210206071131.GA61463@yekko.fritz.box> <CAL_Jsq+e7JjDJTAkDJj_6bcc70QZSZ3cP8012TE7QEf3+sid3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612799252;
        bh=n1yB92SEJ4Mpnyjr/FwN7WchuD5YMZl0ZOA1nl3RF0Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ipl6ZB4Wlud0wG2sMzVv2KIoTC/Lm+jWBCVrIZNlyzPxYDZkUAgTXi+tEbJE9p+5d
         tqAeXGnR/2rk/hqJvZXX3s2WeEUpQMSMiwCCNLYoUVcZwNf1snaMTzaxJTcmldVX97
         AiuO4XyO1sOz6QRASfDVulPOfs3iz/SzkQZD5QU00UrkxdAreG9KzDDcZXfH6xsXkd
         XqQEjIjMneqYwMYmYUAxJiZmPXkpQhNDBK7OfHKmdjoXQvbubgFu8+KqtQPtRnxgYo
         7XnSJePSHTcNJVjdFL2rDxvplGGCwmscCBBAka+Q8s27HfCl4dF1fm0S30CGmusK8x
         W5sjPotm4E1mg==
In-Reply-To: <CAL_Jsq+e7JjDJTAkDJj_6bcc70QZSZ3cP8012TE7QEf3+sid3Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Bolivar, Marti" <Marti.Bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>, Grant Likely <Grant.Likely-5wv7dgnIgG8@public.gmane.org>, Rob Herring <Rob.Herring-5wv7dgnIgG8@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, Feb 8, 2021 at 4:01 PM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Sat, Feb 6, 2021 at 1:26 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>=
 wrote:
> >
> > On Fri, Feb 05, 2021 at 06:57:54AM -0600, Kumar Gala wrote:
> > > There=E2=80=99s an old thread about this from 2016:
> > >
> > > https://www.spinics.net/lists/devicetree-spec/msg00296.html
> >
> > That is not the only case of this - IIRC old Apple machine device
> > trees had both an 'l2-cache' property and an 'l2-cache' node under
> > each CPU node.
>
> According to a dump I have, '/cpus/PowerPC,G4' has 'l2-cache' property
> and '/cpus/PowerPC,G4/PowerPC,G4' node has a node name of 'l2-cache'.
> So this would actually work with yaml if we brought back explicit
> 'name' properties. But this highlights we've already diverged from
> OpenFirmware.

For reference, the new Mac Mini has a "pmgr" node that has both
a property clpc=3D<0x3> and a child node named 'clpc'.

         Arnd
