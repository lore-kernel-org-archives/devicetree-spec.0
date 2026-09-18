Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5AD441616
	for <devicetree-spec@vger.kernel.org>; Fri, 18 Sep 2026 05:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789710716; cv=none; b=Htz1ZKvPpgIhkn/dvFBaxTQwWRzw/CbswDwOLbdXA41YTLvdTFD0LJAj4zCDh7wlOyv3ADLJP0JNFlqWNX7eozi4PWCFNXA6IpaEuQzxzS1IdiCxetMJOLjXlvR9UBhQV4W+TJHFwf/IiPVXhxugpXqfbtD+6rmxk3zN4sQgHUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789710716; c=relaxed/simple;
	bh=SpS7360fjpRJNUudiYFH30lWFW3xLf34MLgxs6aHHt8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J6FpTcehZKFpJ5qxyM0dmiZhE9RlhMM+jdl9N5le7OgbLx77fA3ZRFClcBDwhjIlI0D51wlohd+hhN9S4g2WnbPZyeWlTnCNmk1gMuJA0DJM7JMm2P1Lu8sEXzyPK63xU3xzBUSuqaz36Iwcd5O8FRDgJKZYncrvHfqmyfznoOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.44])
	by APP-01 (Coremail) with SMTP id qwCowAAH2+5x0axqg0xICA--.14665S2;
	Fri, 18 Sep 2026 13:51:46 +0800 (CST)
Message-ID: <b228fb8c86acd3eddcc9e671071a3d65d8230636.camel@iscas.ac.cn>
Subject: Re: [PATCH] chapter2: add generic name requirement for multiple
 nodes w/o unit addr
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robh@kernel.org>,
 	devicetree-spec@vger.kernel.org
Date: Fri, 18 Sep 2026 13:51:45 +0800
In-Reply-To: <aqzF-U499nWyVyih@gractus.seuss>
References: <20260915142340.3131310-1-zhengxingda@iscas.ac.cn>
	 <aqzF-U499nWyVyih@gractus.seuss>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:qwCowAAH2+5x0axqg0xICA--.14665S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWrtFy3uF4Dur1UAF1kXwb_yoW8AF47pF
	s7GF4UJFn2gr17Wws7ZF1DXryxArs5Aws8CrnxKw10kr98Xr1xGFZ2k398uay7Ar1kC3WY
	vFs0qas5ArZ8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyjb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU5PpnJUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-09-18=E4=BA=94=E7=9A=84 15:02 +1000=EF=BC=8CDavid Gibson=E5=
=86=99=E9=81=93=EF=BC=9A
> On Tue, Sep 15, 2026 at 10:23:40PM +0800, Icenowy Zheng wrote:
> > Sometimes multiple nodes matching the same generic name will
> > coexist at
> > the same level (e.g. multiple GPIO-controlled regulators).
> >=20
> > Document the common practice used in existing device trees in this
> > case.
> >=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> > =C2=A0source/chapter2-devicetree-basics.rst | 4 ++++
> > =C2=A01 file changed, 4 insertions(+)
> >=20
> > diff --git a/source/chapter2-devicetree-basics.rst
> > b/source/chapter2-devicetree-basics.rst
> > index ca716a1..003b37b 100644
> > --- a/source/chapter2-devicetree-basics.rst
> > +++ b/source/chapter2-devicetree-basics.rst
> > @@ -303,6 +303,10 @@ name should be one of the following choices:
> > =C2=A0=C2=A0=C2=A0 * watchdog
> > =C2=A0=C2=A0=C2=A0 * wifi
> > =C2=A0
> > +When multiple nodes matching the same generic name and no unit
> > addresses exist
> > +at the same level in the tree, the node names should start with
> > the generic
> > +name and a dash, follows either a sequence number or short
> > descriptive names.
>=20
> If that situation arises, it seems like a real warning sign, though
> whether the problem is in the specific tree or the relevant bindings
> is less clear.
>=20
> Presumably there must be some way for the OS to separately address
> each of these otherwise identical devices.=C2=A0 In which case, that
> addressing should appear in reg, in which case there _should_ be a
> unit address.

Sometimes the device are addressed with something other than a real
address, e.g. a GPIO controller and its GPIO cells; and I think it's
currently not supported to use a reg property instead of xxx-gpio
property to reference a GPIO.

Thanks,
Icenowy

