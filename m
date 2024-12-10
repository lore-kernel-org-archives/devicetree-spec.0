Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BCD1B2195;
	Tue, 10 Dec 2024 14:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841718; cv=none; b=Sj0QFkUPfBTU4hkcuFKPJupzZX68qnLekoKaoQYQCLYuBDquMpDkM/JKb9NCQ6VHjElAZQE87ULiKLEcWnWdLvnNr8ncBluPIeYi144CWk2Om/Kf+mSUnPG3DU9EvBRVIchlB83K1J+mRzdfjLp2YItmZjoKfh9qeiGaVG5DWDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841718; c=relaxed/simple;
	bh=6I+fvpRnzlPuOqr0NtIcUKQjHLNr3VYA1+cn4EHRNgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlpPl+GBtNESO3niLEsK2GYqZd6EVs8u9GhPjBoZdFENgYm2mIO8jNWxSm4DIVsLXlsTvObfBbGx022RutS1oMXXTl0VP0/UN4PLh/6+387dxNZI6gYTt56HCpV8gsB+LHONgmz2oxQDyP746LOCq1ckiHAT973GUo7VUuD0l1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfO/9HfI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfO/9HfI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DC3C4CEDE;
	Tue, 10 Dec 2024 14:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733841718;
	bh=6I+fvpRnzlPuOqr0NtIcUKQjHLNr3VYA1+cn4EHRNgY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NfO/9HfIy+WghyrLVXC0d4Mbpp4/XvHE5Z/uhYp1vxnRlsW+Nd/mEvkBqeZhRvmMK
	 kgpSMxbXZkrUDhbGe0wGsJMr6V3hKIa7LJZcpIP3jSy0XF1/Lq4PnYHJlgyqhrcSqs
	 U39FLUtTATfsdQsLIl/XS8pXHunELnvA58omJ+L3+MYnv4qVc99e3oz62ki18/vu1T
	 cdHegQlu5YNgraaqGwfINe6AT02a9jBlqKu7O/9+la2j8/riwPAFI39fI3FKwggf1f
	 ovNa7g1R3viYIictxHljFCIBmigeICZyvP8MEHi6NFCidGBwC8gkpUZpGt7tkATpVb
	 np8JrdX95cybg==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6eff5ad69a1so28940627b3.3;
        Tue, 10 Dec 2024 06:41:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPCJQn0Fh2yFO1qXDLa0/QXLZDOSZUj5RrCK8BVvoIXI1ovMIORkMNus0IISwIxKoqd9LDlWt/0/WOP2PDrBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRmWCxESIToPFTlb3abM+hZ8pcVeLdfVanWZSWunmtQoxdYE8X
	tHTj0+xbhD6HCyKEw12bafgns2obtFditvDULNyu0zzfvHDR/ujYdM9bxrCfgvrmLSshiMcni3l
	ROOOul/rBXO6r4uYahpTewU3hJg==
X-Google-Smtp-Source: AGHT+IEFK4UoAEDb9osbYUZV0RyjUZPG4SHW9yY8AoUNGN7ZS1Z1jUfl+Uyz1M9es3mv0bzOJ6l1wGkpquMbIdVMzmw=
X-Received: by 2002:a05:6902:12cc:b0:e39:9a5b:53ac with SMTP id
 3f1490d57ef6-e3a0b417f62mr11841401276.40.1733841717209; Tue, 10 Dec 2024
 06:41:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a068210820b44d28a6e97eb07f43f3c5@huawei.com>
In-Reply-To: <a068210820b44d28a6e97eb07f43f3c5@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Dec 2024 08:41:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLGEvGBQ0W_B6+5cME1UEhuKXadBB-6=GoN1tmavw9K_w@mail.gmail.com>
Message-ID: <CAL_JsqLGEvGBQ0W_B6+5cME1UEhuKXadBB-6=GoN1tmavw9K_w@mail.gmail.com>
Subject: Re: Separate L1 cache object in CPU@x
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Mailing List <devicetree-spec@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 10:01=E2=80=AFAM Alireza Sanaee
<alireza.sanaee@huawei.com> wrote:
>
> Hi

Better to send questions like this to devicetree-spec@vger.kernel.org
if you want them to be seen.

> I was working on some scenarios where I have multi-threading on for my AR=
M CPUs and would like to share L1 caches between two hyperthreaded cores. T=
his is particularly possible to be expressed via ACPI PPTT tables, and it i=
s important to be able to express the same thing on both devicetree and ACP=
I PPTT because some use device tree and some use PPTT table for topology an=
d sharing purposes on ARM. Currently L1 caches are expressed via some prope=
rties within CPU object and it seems not possible to use a separate cache o=
bject for L1 looking at the latest spec. I wonder what the thought are on t=
his?

The easiest thing to do here is that each thread within a core should
be a 'reg' entry. So if you have 2 threads per core, the cpu nodes
would have 2 entries in 'reg'. This is what the DT spec says. Though
the spec says to do that if the MMU is shared, I would put that down
as powerpc specific. As the spec came from ePAPR, there's still a lot
of powerpc specifics left. (Patches welcome.)

I don't think we've ever supported multi-threading with DT on ARM, so
likely there might be some issues to fix in the kernel.

Rob
