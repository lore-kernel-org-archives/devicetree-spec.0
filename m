From: Kumar Gala <galak.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: UART map / multiple uart connections
Date: Thu, 14 Jul 2022 10:58:17 -0500
Message-ID: <669C8BA3-8022-43D2-A6D7-CB0CC0F8F2F0@kernel.org>
References: <A6CFEC90-1DB9-419C-A9C6-4F490B06F015@kernel.org>
 <CAL_JsqJ2_MRADvfHWARTVy4=9HnumB952WBnj-uNj1pnXxjSBg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:mime-version:subject:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=0yzRORZngZEMq3HQ99MHo4oYVCKsfAOYPlCzy1+3Lkc=;
        b=kqRcqMJ2enGEfAaNUZq4xeLaCQm0yzRIn5+VTaelWenBfgG/RZ7K63KkAhPVdATr0D
         LaMOGZoIxKPUyy5JAMm4aFWX7u8BXUTbF0GPa8T8CiPnwCNN8goKojN+ECW9KP79dwBs
         dyi7TUbnwQzFc1AkE0oulPCv13ACivuCqzraIQhJ827MZnVN0+qHiQoFa82DJELoHK4V
         XKcWYTZ/+Uif0/YBTrM5eezDiGjjGVLKBhXgwb8/OKrV4tPs3TbT26rIjpjfLm8y4ITA
         DHlh+nYdExVHCVAwNw5Us+sCzfQSgu6oT5XCIOIpj9Bh2cp01Vlo1o3AKAWFqudzQa2w
         TGlw==
In-Reply-To: <CAL_JsqJ2_MRADvfHWARTVy4=9HnumB952WBnj-uNj1pnXxjSBg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kumar Gala <galak.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>



> On Jul 12, 2022, at 9:33 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>=20
> On Thu, Jul 7, 2022 at 11:56 AM Kumar Gala <galak.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>=20
>> Wondering if your aware of any examples of how to describe a modem =
with multiple UART connections.  Normally we have the =E2=80=9Cmodem=E2=80=
=9D as a child of the UART node.  So that would work for one connection, =
but not sure how we=E2=80=99d describe a second UART connection.  Some =
kinda of =E2=80=9Cuart-map=E2=80=9D?
>=20
> I haven't seen that come up. The closest thing I can think of is USB3
> hubs which also have a USB2 connection. Those show up as 2 nodes under
> their respective controller with a phandle link to each other. Is
> there a primary vs. secondary connection?
>=20
> Rob

Do you have a pointer to the USB example?

I think on of the uart=E2=80=99s could be considered the main connection =
point.  But not sure it maters.  I=E2=80=99m guessing we need a few =
standard properties to represent phandles to devices on buses that would =
normally have the nodes as children.

So i2c, spi, uart, etc..=20

- k=
