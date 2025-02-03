Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40727205E12
	for <devicetree-spec@vger.kernel.org>; Mon,  3 Feb 2025 15:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597521; cv=none; b=firSsKOIbsSjtZ0LEFL/KNHZq4ZCsGiACce2P6uUIi140A41swZPq+mWkBJuTOwuDChYiXv9pceka1o9l3lO57gwPKO9p6rg3wOGAXpwD2MOWHR36VTgwMqPoZdDuV6lKCN8HZGcGtu5HIeAzoJPeEv9bTca+F+zWR3mRH4unBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597521; c=relaxed/simple;
	bh=iuMbGjMySEqcVKn0bwKrqXolocS0hO9VXSdrGMfXxY8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SnESQWpFfYDm5A2gF3uIJwC9JEwoVkzytE4e/hS9FTH//ywRKruS26HE8uF22vWeUuR3pAkxQ7HTJVypgp36XhNnszxD5wPGsIv0nAOgT8+5agq9gcljzi1PznbfR9bUZM5vVh/lLfTgZIefw7aRWn4jN/okNRNKZ6gsSG0hRlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YmrQd3kG4z6K9Fy;
	Mon,  3 Feb 2025 23:44:25 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 95CA8140A34;
	Mon,  3 Feb 2025 23:45:15 +0800 (CST)
Received: from localhost (10.47.70.44) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Feb
 2025 16:45:15 +0100
Date: Mon, 3 Feb 2025 15:45:09 +0000
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Rob Herring <robh@kernel.org>
CC: <grant.likely@secretlab.ca>, <devicetree-spec@vger.kernel.org>,
	<mark.rutland@arm.com>, <yangyicong@huawei.com>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<linuxarm@huawei.com>
Subject: Re: [RFC PATCH v1] Chapter 3: Add shared L1 Cache
Message-ID: <20250203154509.000000f9.alireza.sanaee@huawei.com>
In-Reply-To: <CAL_JsqKLJ=i7cbpYa-qfr+TQ+Z7HCq1iLoCiw+QcAGRaF_uZ5w@mail.gmail.com>
References: <20250203120527.3534-1-alireza.sanaee@huawei.com>
	<CAL_JsqKLJ=i7cbpYa-qfr+TQ+Z7HCq1iLoCiw+QcAGRaF_uZ5w@mail.gmail.com>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 frapeml500003.china.huawei.com (7.182.85.28)

On Mon, 3 Feb 2025 08:47:50 -0600
Rob Herring <robh@kernel.org> wrote:

> On Mon, Feb 3, 2025 at 6:05=E2=80=AFAM Alireza Sanaee
> <alireza.sanaee@huawei.com> wrote:
> >
> > For L1 cache to be shared between SMT threads, a register array
> > must be used. This, however, is not straightforward if every node
> > in the CPU map refers to a separate CPU node. Therefore, it is
> > suggested to create a separate CPU node for every SMT thread. The
> > L1 cache can be shared if an extra node represents it. =20
>=20
> I don't understand why a cpu-map is a problem for the SMT case?
>=20
> I don't think this change is necessary.
>=20
> Rob

Hi Rob,

I posted the following patch, which uses a reg array to represent
threads, allowing threads to share resources within a CPU
node using reg array and without requiring an extra l1-cache layer:=20
https://lore.kernel.org/all/20250110161057.445-1-alireza.sanaee@huawei.com/

=46rom Mark's remarks in the same patch, I learned that cpu-map object in
the dt will need each thread to point to a CPU node entry in
particular, (Documentation/devicetree/bindings/cpu/cpu-topology.txt). If
I use the reg array, each thread in the CPU map will not be able to
point to the corresponding CPU node as they are in the reg array.

You might argue that CPU maps should also be able to be built based on
the threads in the reg array, and I actually agree with that. Maybe
that's something I should go about in that case.

Thanks,
Alireza

