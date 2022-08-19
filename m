From: Kumar Gala <galak.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: UART map / multiple uart connections
Date: Fri, 19 Aug 2022 07:44:38 -0500
Message-ID: <7C3B936E-9929-4612-A1C4-5B1084CF137D@kernel.org>
References: <A6CFEC90-1DB9-419C-A9C6-4F490B06F015@kernel.org>
 <CAL_JsqJ2_MRADvfHWARTVy4=9HnumB952WBnj-uNj1pnXxjSBg@mail.gmail.com>
 <669C8BA3-8022-43D2-A6D7-CB0CC0F8F2F0@kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:subject:mime-version:from:from:to:cc;
        bh=HF7bDivuL7OZJZdqspc3vgi+QS7efS1reqkypPp/ENU=;
        b=U1s4fL4nlKEEjP+SDIOPWyg+MdjWZ3K4yXO6I27Cab7VMu8xzKTT6XTejXsTgTIdCO
         aVs55iS13Sd2jPpSQAj6KVOcL6+WU6KWw/0GmzSzseKaiQBFMbl99T3cjJKD2tKDUTne
         1NbWMywKUIQm7ZqFmWD1++n00OgNN4CSvovBxguRa6y0d3FitfvD7jlxXMJv/ddWVWUD
         S4oMNeawqC11rCuabD03RZYhZ4SI3MpaCz96yqvA0FyNg0u550R44RwcYg96I1vVFpOx
         u0XU4W7gWdKACDnlMzGwMYBP3XWvHj9cTp2eheF9jZapEPO/b7kKBNBVJ/zyOBGkWC6a
         aJJA==
In-Reply-To: <669C8BA3-8022-43D2-A6D7-CB0CC0F8F2F0-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kumar Gala <galak.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>



> On Jul 14, 2022, at 10:58 AM, Kumar Gala <galak-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>=20
>=20
>=20
>> On Jul 12, 2022, at 9:33 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>=20
>> On Thu, Jul 7, 2022 at 11:56 AM Kumar Gala <galak.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>>=20
>>> Wondering if your aware of any examples of how to describe a modem =
with multiple UART connections.  Normally we have the =E2=80=9Cmodem=E2=80=
=9D as a child of the UART node.  So that would work for one connection, =
but not sure how we=E2=80=99d describe a second UART connection.  Some =
kinda of =E2=80=9Cuart-map=E2=80=9D?
>>=20
>> I haven't seen that come up. The closest thing I can think of is USB3
>> hubs which also have a USB2 connection. Those show up as 2 nodes =
under
>> their respective controller with a phandle link to each other. Is
>> there a primary vs. secondary connection?
>>=20
>> Rob
>=20
> Do you have a pointer to the USB example?
>=20
> I think on of the uart=E2=80=99s could be considered the main =
connection point.  But not sure it maters.  I=E2=80=99m guessing we need =
a few standard properties to represent phandles to devices on buses that =
would normally have the nodes as children.
>=20
> So i2c, spi, uart, etc..=20
>=20
> - k

Rob, any follow up on this?

- k=
