Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB2920B1FC
	for <devicetree-spec@vger.kernel.org>; Mon,  3 Feb 2025 16:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738601094; cv=none; b=K+6B6SVcQ5SsQWQo2PBXYFiST9u8x4rvwXs5zGSpykVqfuTyPLgxsj8YxbOY2mcfWlDnI6P7G0ASOoLRH1PJeXK+u1Sqz9yhaI21who+z3SxU/z5hLe3sNvtMA2v0MgxS5gVUD9xxX88X/h66MJ2dK0N4Qpm5MGFc/KAiWnwTfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738601094; c=relaxed/simple;
	bh=FFNGeZV3/alilaFzkSzIlaJSvCnfLe3Ug13MH/UVo68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXii+DWUXTx7mrvF+I/kgLsTMHS4rkcY/7XgNR3keJwLVyaI1G4CO25LhSCjARcbdE+3Y71WqjAPdlj0KSBAVh3mx2iuZ46jPWSRT1hOKpQxaIFYh+6ze+a2ZHqgAHFObI/D5hJyZ1RHnFX67uQXCBrgCNgUGVC6qy8U3DHyjZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8JJbQap; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8JJbQap"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42C5C4CEE5
	for <devicetree-spec@vger.kernel.org>; Mon,  3 Feb 2025 16:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738601093;
	bh=FFNGeZV3/alilaFzkSzIlaJSvCnfLe3Ug13MH/UVo68=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d8JJbQap6Biy57hEi58pEc01cR4AtDz/CExX4WygiV9bofE4Pg/yJ6hl9+Db+9hY3
	 bakBWQMDkdbsgnNt4JElquotdIsINOCuObc/nY0iDUhRl70iMxJV+7ucTV5TPmrFfy
	 yoEc7nH0g/HVJzYkd5IbQEZnbA6r5H7BUJ5SXPb+L26FnhuStnXB2r6/nw1ayKL0h5
	 de3vJ5IQMM9WzrTSfhNxXXEf/X4oGZ+CM98x9Gl3mWVHoqMgB0Dy9pg41sukUEyqPi
	 T1Rzm7LtgOSpwk9gVVblTRblmp76mcCFJPEZtugzFrzxCtuKbSE9kj4lwk8EYUtgz9
	 iee9QDijRbnxg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fdafso9115461a12.0
        for <devicetree-spec@vger.kernel.org>; Mon, 03 Feb 2025 08:44:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+3bshM+bjrWkBjNUeUTgfIl7Kse+bZW7/jSHh1S0vbQaXPeYXyv4pWXZthhbXI+M09890SMb6vuvtosd9ka4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy42pzlwVwy9QG09JEHKbgGMt8YMLszDMsx4bfW6xjuivIe3uig
	RU2pjikC2fX2e3eu7J+SHbZbOig7cXV6ObsBBvoq/oYV5oJq8bn/qfPnrG8mm32fuMkwCoFMmdw
	/YL/xIfkjYNOKmm2oXQ0svZBWVg==
X-Google-Smtp-Source: AGHT+IHAzRnZD7K49r43B+8ue98lTatzLKBV/Q7XPrpimn3tPvBCnKkCWUzj1MbiapRkbocSnILRV13RCPk3SBXmE5Y=
X-Received: by 2002:a05:6402:34c3:b0:5d0:81af:4a43 with SMTP id
 4fb4d7f45d1cf-5dc5e6dd167mr27486464a12.0.1738601092240; Mon, 03 Feb 2025
 08:44:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203120527.3534-1-alireza.sanaee@huawei.com>
 <CAL_JsqKLJ=i7cbpYa-qfr+TQ+Z7HCq1iLoCiw+QcAGRaF_uZ5w@mail.gmail.com> <20250203154509.000000f9.alireza.sanaee@huawei.com>
In-Reply-To: <20250203154509.000000f9.alireza.sanaee@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Feb 2025 10:44:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK1yqRLD9B+G7UUp=D8K++mXHq0Rmv=1i6DL_jXyZwXAw@mail.gmail.com>
X-Gm-Features: AWEUYZncDYysweElsTJFxown5cNCbGqSRhp7WASj0UbCWsjazwSYv25soZqiG9g
Message-ID: <CAL_JsqK1yqRLD9B+G7UUp=D8K++mXHq0Rmv=1i6DL_jXyZwXAw@mail.gmail.com>
Subject: Re: [RFC PATCH v1] Chapter 3: Add shared L1 Cache
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: grant.likely@secretlab.ca, devicetree-spec@vger.kernel.org, 
	mark.rutland@arm.com, yangyicong@huawei.com, jonathan.cameron@huawei.com, 
	shameerali.kolothum.thodi@huawei.com, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 9:45=E2=80=AFAM Alireza Sanaee <alireza.sanaee@huawe=
i.com> wrote:
>
> On Mon, 3 Feb 2025 08:47:50 -0600
> Rob Herring <robh@kernel.org> wrote:
>
> > On Mon, Feb 3, 2025 at 6:05=E2=80=AFAM Alireza Sanaee
> > <alireza.sanaee@huawei.com> wrote:
> > >
> > > For L1 cache to be shared between SMT threads, a register array
> > > must be used. This, however, is not straightforward if every node
> > > in the CPU map refers to a separate CPU node. Therefore, it is
> > > suggested to create a separate CPU node for every SMT thread. The
> > > L1 cache can be shared if an extra node represents it.
> >
> > I don't understand why a cpu-map is a problem for the SMT case?
> >
> > I don't think this change is necessary.
> >
> > Rob
>
> Hi Rob,
>
> I posted the following patch, which uses a reg array to represent
> threads, allowing threads to share resources within a CPU
> node using reg array and without requiring an extra l1-cache layer:
> https://lore.kernel.org/all/20250110161057.445-1-alireza.sanaee@huawei.co=
m/
>
> From Mark's remarks in the same patch, I learned that cpu-map object in
> the dt will need each thread to point to a CPU node entry in
> particular, (Documentation/devicetree/bindings/cpu/cpu-topology.txt). If
> I use the reg array, each thread in the CPU map will not be able to
> point to the corresponding CPU node as they are in the reg array.
>
> You might argue that CPU maps should also be able to be built based on
> the threads in the reg array, and I actually agree with that. Maybe
> that's something I should go about in that case.

The CPU binding in the spec predates cpu-topology.txt. Yes, that was
originally written for PowerPC, but there's really no good reason for
other architectures to deviate. L1 caches are not the only thing
shared. There's clocks, power-domains, OPPs, etc. The CPU node parsing
functions (e.g. of_get_cpu_node()) are also already designed for
threads to share a CPU node. IMO, we should follow the spec.

For cpu-map, there's 2 choices if there is 1 CPU node for all shared thread=
s:
- Don't describe threads in the map and use 'reg' to get any thread info.
- Make shared threads in the map point to the same CPU node.

The latter option could be:

core0 {
  thread0 {
    cpu =3D <&cpu0>;
  };
  thread1 {
    cpu =3D <&cpu0>;
  };
};

Or:

core0 {
  thread0 {
    cpu =3D <&cpu0 0 0>;
  };
  thread1 {
    cpu =3D <&cpu0 0 1>;
  };
};

Where "0 0" and "0 1" match the 'reg' address of the thread.

Rob
