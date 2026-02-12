Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FCA1643B
	for <devicetree-spec@vger.kernel.org>; Thu, 12 Feb 2026 19:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770924274; cv=none; b=Gpr5qNsCc7tXs6oUI+kr/abrKhDJ+64l6FOIPoRXAFpIdE0olqYhgUrlPr6Q/44VSsOeiqtabag3SFJ7KbwLlly0YD9Llixq8HQIZ6Gfyym5cjrecp7yU6oc/00iTpbuWQUbGbkbj497AhlRqFWzQjd5hg75c/N7CPT2jtcHDXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770924274; c=relaxed/simple;
	bh=wxWc1UcM+8UZY627OdsPpkZ4mCiER0/bCE8LaNvtXxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZqT7FfUMS7Mbs0ifaNQlBuCcnoTteMLS3pRT4F7y8hzp8EdZltx7wSTP6MpOXuxSIbiNu61+Rk2pyFZM8zi/js56Js4OGUrn4XfJS31VUYsNxkblkUM5TXUbxHUFK6e18tjiciSDa7+IWpSoGWfOZmaIEJAvENhnAKqH5fOJP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHkZlKpU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHkZlKpU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BDDC4AF09
	for <devicetree-spec@vger.kernel.org>; Thu, 12 Feb 2026 19:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770924273;
	bh=wxWc1UcM+8UZY627OdsPpkZ4mCiER0/bCE8LaNvtXxU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nHkZlKpUWX9q/o6VoreWiRFK6DeuUi/Mg7wSaoeMzOTZAh8CFOAZSCNPvas16ySsN
	 cwv+93JLCMQCLDwQemQN6M3zQAqZ/45T7qXbj2hsnOdozM2jvSF/YVbEbTgJyzC1kL
	 0sb2oM9E7htcjfC1tI3tULDuxD8WxTXd/Zfk5qAGNTZij1rZrY7e855mqMQAik10Sy
	 DOJk3+4mJikBVdFhg1+M8QvEoNrlcINx18jpOxnsM116lm9e+A9aJYwQeMvx+6ECY5
	 83vc+Pq5P/Y93Dn8xM4xdOTsGf/laQABcSFBQT+Ts4LGIJhXuw6BJe6X0ZT8O0wUkY
	 kdqRRoT45TjQw==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8849dc12f6so14356266b.1
        for <devicetree-spec@vger.kernel.org>; Thu, 12 Feb 2026 11:24:33 -0800 (PST)
X-Gm-Message-State: AOJu0YxDw2VT93M6KxrJhRfvb+wgMWS62w7UaoQ7+hj6o1D4T7hG568U
	AOSHLJNz/DhdbR5vRq1T0b2yfulcG2uKmvYLh6KghmXmVwzLiRqVcM02FDwr10vczW1HVlFrl85
	tkdXAU2OPlSH1OL420yVsyLX7pftHYA==
X-Received: by 2002:a17:907:d03:b0:b8a:f2de:e329 with SMTP id
 a640c23a62f3a-b8facce7b90mr6523366b.25.1770924272164; Thu, 12 Feb 2026
 11:24:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7CB259ED-7AFC-4EE1-A926-54A5F6DCD97B@hotmail.com> <aY3yzUGLHU-wxue9@pie>
In-Reply-To: <aY3yzUGLHU-wxue9@pie>
From: Rob Herring <robh@kernel.org>
Date: Thu, 12 Feb 2026 13:24:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJOO9c5HVmHcFC5COE6nJQ4wDrpvwhtTPXvGmFYjL2ySA@mail.gmail.com>
X-Gm-Features: AZwV_QjvTeUFKMaYSCVVtKzYbhcI21yKLsabJUDnYsEyQ5B4oHIu0Ci-NQivADQ
Message-ID: <CAL_JsqJOO9c5HVmHcFC5COE6nJQ4wDrpvwhtTPXvGmFYjL2ySA@mail.gmail.com>
Subject: Re: Ranges - Intended use case
To: Yao Zi <me@ziyao.cc>, Kyle Bonnici <kylebonnici@hotmail.com>
Cc: "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 9:33=E2=80=AFAM Yao Zi <me@ziyao.cc> wrote:
>
> On Thu, Feb 12, 2026 at 01:14:33PM +0000, Kyle Bonnici wrote:
> > Hi
> >
> > I have been trying to understand how ranges should/should not be used.
> >
> > Looking at the spec
> >
> > > The ranges property provides a means of defining a mapping or transla=
tion between the address space of the
> > bus (the child address space) and the address space of the bus node=E2=
=80=99s parent (the parent address space).
> >
> > This to me the spec leave some space for interpretation on if ranges sh=
ould be used on just buses or not. Below are some examples to try to get a =
better understanding.
>
> I'd like to say ranges literally specifies the translation process
> between the children address space and the parent one, regardless
> whether the parent is a "bus".

Yes.

To put it simply, "ranges" should be used whenever the child nodes
have memory-mapped CPU addresses.

> For example, reserved-memory nodes aren't really "buses", but often
> come with ranges property, as shown in the example of dt-schema[1].
>
> However it might be a signature of bad device-tree model designs if you
> have to use a ranges property for a random non-bus node.
>
> >
> > ```
> > / {
> >       foo { // not a bus
> >               #address-cells =3D <1>;
> >               #size-cells =3D <1>;
> >               ranges; // does this ranges have any meaning?
>
> I'd like to say, yes.
>
> >               bar@10 {
> >                       reg<0x10 =E2=80=A6>
> >               };
> >       };
> > };
> > ```
> >
> > ```
> > / {
> >       foo { // not a bus
> >               #address-cells =3D <1>;
> >               #size-cells =3D <1>;
> >               reg =3D <0x100 0x50>;
> >               ranges =3D <0x0 0x100 0x50>; // is this an intended use c=
ase?
>
> Depending on what the child node represents, but IMHO it comes with a
> clear meaning.
>
> >               bar@10 {
> >                       reg<0x10 =E2=80=A6> // hence abs address is 0x110=
.
> >               };
> >       };
> > };
> > ```
> >
> > ```
> > / {
> >       foo { // bus
> >               compatible =3D <simple-bus>;
> >               #address-cells =3D <1>;
> >               #size-cells =3D <1>;
> >               ranges; // this I understand to declare that children wil=
l have direct mapping
> >
> >               bar {
> >                       ranges; // is this needed? Or is it implied that =
the foobar is in the same address space of bar?
>
> It's necessary. I don't think ranges property is ever implied.
>
> >                       foobar@10 {
> >                               reg<0x10 =E2=80=A6>  // hence abs address=
 is 0x10.
> >                       };
> >               };
> >       };
> > };
> > ```
> >
> > ```
> > / {
> >       soc { // bus
> >               compatible =3D <simple-bus>;
> >               #address-cells =3D <1>;
> >               #size-cells =3D <1>;
> >               ranges; // this I understand to declare that children wil=
l have direct mapping
> >
> >               flash@1000 {
> >                       reg<0x1000 =E2=80=A6>
> >                       ranges =3D <0x0 0x1000 =E2=80=A6>;
> >
> >                       partitions {
> >                               ranges;  // is this needed? Or is it impl=
ied that the partition1 is in the same address space of partitions?
>
> Personally I think it SHOULD be needed, though existing dt-bindings for
> fixed partition layout don't enforce such.
>
> I'm not very familiar with flash partitions and their dt patterns, so
> will leave the question for others :)

It depends. Usually no, because the partition addresses are just
offsets in the flash device. They are their own address space and not
part of the CPU address space. An exception would be a parallel
nor-flash device that is memory-mapped into the CPU's address space.
Even then, it may not be all that useful to be able to translate a
specific partition address into a CPU address.

> >                               partition1@10 {
> >                                       reg<0x10 =E2=80=A6>   // hence ab=
s address is 0x1010.
> >                               };
