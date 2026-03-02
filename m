Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598332DE717
	for <devicetree-spec@vger.kernel.org>; Mon,  2 Mar 2026 17:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473846; cv=none; b=BDxtsD5TBoG9vhU9ycFM8U3bhkd6iZtyFcL0Qd9GT5o//2Tc53T6htlOMslLhaFMfn8HbRZ90zOVg6KeB1oWwLZiI2HjfG4osqaufS/FCiNx8+XoV3LL8XW3TEhsDe4JRZ8mFFHzkfuxquy1nN8K0A1El46pxcb4O4AIlMfDwmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473846; c=relaxed/simple;
	bh=twmyGDvb1+bavHPZKSi6+ygl1ybWAsG5IrFRIcyV/Bw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d34ANBiIceihfUxYlw63cUKemixPPYSdZ6/7XB3h6Ct5RiRndY10UT5PRv2UkUjORNr1u+xsif7J5P+dFUeOWifiOM8wp8deyGA5/vdkts23zmDUuQ1/opEn6iRa222Zxc1wzqP7mXBy70lXHhsj9fcDha7SHqSTSywPuDCAgvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7viy2jk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7viy2jk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D98C2BC9E
	for <devicetree-spec@vger.kernel.org>; Mon,  2 Mar 2026 17:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772473846;
	bh=twmyGDvb1+bavHPZKSi6+ygl1ybWAsG5IrFRIcyV/Bw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C7viy2jkgWOeJnlZwFFinQ8+Gzdtv95SSsgYdVlGnFdjfBq1VTH0dGVSs0UDOb0KK
	 m0h/tUSBbZXuC7F1ngHSy2d7hjZIGpc1dIJHKtEZ3yLs6YWOr5skpfdn7OAZZonLfS
	 eB1WoD+W/nVC4WjvF7+bSQqw2PqaX1/R0B2zp7U2poQ4CdvnHwE/V0yWF+3Z1KZyVd
	 hVrJUe6q6U6sYiPAiujkvOQGBxnQ1H/NrfhKMjcBKz09ADkR4RyDJLZU/ENTYDuhkM
	 hHeN54V2zy+hXY89P2ZyuwMtIUJJh4rG8Iaf2x8kbw+gmoFOe0KDxdsznYtziljGvA
	 1PLCLPL1iNWaw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so565754566b.2
        for <devicetree-spec@vger.kernel.org>; Mon, 02 Mar 2026 09:50:45 -0800 (PST)
X-Gm-Message-State: AOJu0YwvFoxp18B/iZOo8sdHMZGn2kFAbjEpjCZWnYt0DZnfIFeR/bCq
	NVc9RtwwgzmvBgTYP5qedfV0QlC6CjTlXe8cZvoUWP7Jks8C2X2JdMlRMZfJxcqzYRi3U7wDrI2
	LT91Y8P1Ic1kjOQxBAgmCKNPIvzX2uA==
X-Received: by 2002:a17:906:c105:b0:b93:c5a9:a5f4 with SMTP id
 a640c23a62f3a-b93c5a9ba15mr94695866b.9.1772473844506; Mon, 02 Mar 2026
 09:50:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DB8PR05MB6826E032A341ED146299DBC18874A@DB8PR05MB6826.eurprd05.prod.outlook.com>
In-Reply-To: <DB8PR05MB6826E032A341ED146299DBC18874A@DB8PR05MB6826.eurprd05.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 2 Mar 2026 11:50:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKJZuMzFKuS1-MagAdP9ETv8apms=q21LKF6G+wU+M6eA@mail.gmail.com>
X-Gm-Features: AaiRm52djlOlhBb4rnZl6ar1yfqItXe5xxk3CC5BBvqZoYF169mJLYi2uYAlG4c
Message-ID: <CAL_JsqKJZuMzFKuS1-MagAdP9ETv8apms=q21LKF6G+wU+M6eA@mail.gmail.com>
Subject: Re: Question regarding non-volatile memory mapped memory in embedded systems
To: "Andreasen, Bjarki" <bjarki.andreasen@nordicsemi.no>
Cc: "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 8:24=E2=80=AFAM Andreasen, Bjarki
<bjarki.andreasen@nordicsemi.no> wrote:
>
> Hello from a zephyr-rtos dev,
>
> In embedded systems, it is typical to execute directly from non volatile =
memory mapped storage.

So eXecute In Place or XIP.

> Looking through the devicetree spec, there is a node for defining memory =
mapped system memory, and reserved memory, the /memory and /reserved-memory=
 nodes.
>
> Are the /memory and /reserved-memory nodes intended to be used with volat=
ile memory mapped storage in embedded systems?

Yes. And what's defined in /reserved-memory should be bounded by what
/memory node(s) define though given there is no enforcement of that,
that's probably not always true. /memory should not be defining RO
storage.

> A client program (which in an embedded system may be the entire program b=
ooted by the soc itself) is to a large extent agnostic to the exact type of=
 memory its executing from since the memory is memory mapped.
> As long as the program was compiled with the appropriate memory access pe=
rmissions, non volatile memory like flash being read/execute only, RAM bein=
g read/write/execute of course.

XIP isn't really defined for DT. I'm not sure it has to be as that's
more the protocol/interface between the prior stage and the
client(OS). You could still want/need a generic way to define the
non-volatile ranges. There are various MTD and partition bindings, but
those live under specific h/w devices rather than some generic node
like 'memory'.

Rob
