From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: UART map / multiple uart connections
Date: Tue, 12 Jul 2022 08:33:16 -0600
Message-ID: <CAL_JsqJ2_MRADvfHWARTVy4=9HnumB952WBnj-uNj1pnXxjSBg@mail.gmail.com>
References: <A6CFEC90-1DB9-419C-A9C6-4F490B06F015@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657636408;
        bh=Qs9X7wNcDipWPEwqpTfUhxcvYRV+PQbf19nu6vmBNU0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hwcF3X2W7hv3rbvkqQafhTZOryoeEi5H87oRNPC4LtCBpqD5KEG89FwB6coXOv5Zt
         2YcIFPmXaQHMv35R2UdDNoVsNAkUNwXccOkUCGqGgSEzO6mns7oVfnXFRPTg7COc30
         u1MSnudIfAC7Gwp95KiugDeLxjb2RXaRcQnnfpetIRjejBgnRnSzKRTteCbeJFY6eC
         O6PKugRpX1QUorr3Ygz5oWK7qRYLj+CbgiACUiX6QNxkP7aNyuGHybmglLITn61GDn
         sJYnhp/O36rq8sc6kQ88SEi3bfzhQpSjG5vj4SMQXfEG2B2AwiDgBytq258RiwFmWe
         kf7k/aG1s7ESg==
In-Reply-To: <A6CFEC90-1DB9-419C-A9C6-4F490B06F015-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Kumar Gala <galak.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Jul 7, 2022 at 11:56 AM Kumar Gala <galak.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Wondering if your aware of any examples of how to describe a modem with m=
ultiple UART connections.  Normally we have the =E2=80=9Cmodem=E2=80=9D as =
a child of the UART node.  So that would work for one connection, but not s=
ure how we=E2=80=99d describe a second UART connection.  Some kinda of =E2=
=80=9Cuart-map=E2=80=9D?

I haven't seen that come up. The closest thing I can think of is USB3
hubs which also have a USB2 connection. Those show up as 2 nodes under
their respective controller with a phandle link to each other. Is
there a primary vs. secondary connection?

Rob
