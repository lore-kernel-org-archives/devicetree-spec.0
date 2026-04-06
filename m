Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C8F36F418
	for <devicetree-spec@vger.kernel.org>; Mon,  6 Apr 2026 12:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775479744; cv=none; b=SSdANFHHMBugLXQdNTHnzGDlmGLsTnqrWoQxdVBOBHezRlmizvl6eqSVNeNwMffqUy/7o8T1fje69rJepYVwphbBBBsqWCcbj+77KTxClTxZc2qCFEHaWB0jFkfkIFHDnYulyCuhi2ioXUqIHw8ZBCMR+EfNA03XYF+rSseHcQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775479744; c=relaxed/simple;
	bh=1xKAa+PmppcswDIZ9pTEbngJ2OJ2BeS/GY3dfaa7/T4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kaOHQl6LuE8ybM8+QTcQYXWYJo393MbSy+E/n5ILXC/TG1tk/6M45RkmMGx2rF4TdmEGrUe3mMkx3hKHQW/YfM/zHN88SNm93LZl13tIB/5wKL0FRyMFVz6E/5BbIc5BrBQoaIXxBniK0EXcQMBzLhc/A2/wJJW0NmAk3EIESwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7aj0ce0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7aj0ce0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BA6C2BC9E
	for <devicetree-spec@vger.kernel.org>; Mon,  6 Apr 2026 12:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775479744;
	bh=1xKAa+PmppcswDIZ9pTEbngJ2OJ2BeS/GY3dfaa7/T4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g7aj0ce0coQJdeZPkirlUShfaiPIPTIvaqCFe4IrEThY6PEZuCv07crRmwKsd+Uo+
	 xlEgpmYylk8jyPBfW5UrguBqAFg6WWNzgwA62nt0N7pJIT2ilFYf2D2/06pUmORv7T
	 bSeILY7bxzcGRVKxPwgWke/AdLNYqH+VyWRT1uWsmVsik8aqMzSdCgSvgBqml98nnb
	 3HSPxJTXiH/hR7xcuzL3riyKf9P7zX0T6wGu/ch//MdAKL9LtopnaE0Pz5CYBhXC8l
	 aziKq2GXHnG+bpD4DwU9M+s7t7M2WIkH9FE4atkFDopek+OXDRbIlwImZiTr87oaCT
	 /e3Pm1TxFmtcw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66e6d9610d8so3080749a12.0
        for <devicetree-spec@vger.kernel.org>; Mon, 06 Apr 2026 05:49:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YwzLwdkmhzZRZa9Z6QLBPfW8olXhyBbsirmeXXBdHikchfbLD8w
	sAiZrGHYFq1csrv5ZYmKNKjQ4u4vI9kKi1FtB9zbPu3veF00wLjv8qhjd5gnDoDEMHSgGhsm7HO
	EIrlUtrmcyh2Qm+vA7Zm+uvsiVx2UQQ==
X-Received: by 2002:a17:907:9617:b0:b9c:4fa:9141 with SMTP id
 a640c23a62f3a-b9c672a5d61mr620807066b.9.1775479742733; Mon, 06 Apr 2026
 05:49:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn> <adHofcKAr7C5YCSA@zatzit>
In-Reply-To: <adHofcKAr7C5YCSA@zatzit>
From: Rob Herring <robh@kernel.org>
Date: Mon, 6 Apr 2026 07:48:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJFv3+UJ-bjLGk0i7Wc+spsowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com>
X-Gm-Features: AQROBzC4_AzDK3DGYWlPXKw1OmT3onlC3gJu87rKdHQYHaYN_zOxh7MaJpfvdwg
Message-ID: <CAL_JsqJFv3+UJ-bjLGk0i7Wc+spsowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com>
Subject: Re: Devicetree spec: Specifying /cpus/cpu@* unit address format?
To: David Gibson <david@gibson.dropbear.id.au>, Vivian Wang <wangruikang@iscas.ac.cn>
Cc: devicetree-spec@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 11:43=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Fri, Apr 03, 2026 at 06:06:17PM +0800, Vivian Wang wrote:
> > (Also posted at: https://github.com/devicetree-org/devicetree-specifica=
tion/issues/86 )
> >
> > Hi all,
> >
> > Presently, there seems to be some confusion in the community about the
> > format of unit addresses for "/cpus/cpu@*" nodes for a CPU with ID > 9,=
 e.g.
> >
> >     cpu@??? {
> >         reg =3D <10>;
> >         /* reg =3D <0xa>; */ /* This should be equivalent */
> >     }
> >
> >
> > Should this be a decimal "cpu@10", or hexadecimal "cpu@a"? I can't find
> > any explicit specification.
>
> It should be hex.  That's a general convention for unit addresses.
> Before flattened trees, OF essentially never used decimal
> representations of things.

The only decimal usage in FDT were mistakes.

Rather than worrying about what the spec says, please worry about what
the tools check. Unfortunately, this is still only checked for
specific bus types and the default is not checked.

Rob
