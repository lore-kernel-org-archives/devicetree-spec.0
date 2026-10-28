Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176883;
	b=qEQDr+WrNVqtY6K2Snt5CH3Xcwh3Za4Q8ruvDgCdIuF6GHlJci/L6WfuSPE7L+gVri1O
	 UsV/EBmNvNeHdVAkL9lI/m4iJQ9K0efrRTPpdYsTWVtg3Jtdwj1/+qUd6RoDNc2/Gi/JH
	 C4TVyDEbCbqBF/v33CZCEmpjMwKLiRCIgIiR34VJSeZR3yYq67uh7Eh6spYyd61pASiCC
	 gpYPFyRFEHp806cfXTrB8YbTjXLhhPspuR6MTxlC38j48sIO8iYa9jnWGUlHyTF3jPOQm
	 l25qwoAxPCJpQcU9S67uwj5voX/zewEfKOv+iKQHKQoHQRK+fNKoB5QcHbY09bk1bow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176883;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=JzDymCFq2m8GeSdsBCaxEaw3VPeIifTesv3xlvlZRsU=;
	b=qaMTaGhXd6G7cz5qJZhjp7ELjAzDMDCFsTkFo/uUeUHFqzL6VaMQZK+dzxjgScUU3Srj
	 SSXCAX/BBcfRUJJg6B4giKPG5z361WYme8dV9RpPeD+uDhtDS9Zpw2h6u2CJVMhKbBQxO
	 pPNtWEpHkvsGc7u186j+xq1SKIW06YcVltS13qc/yRFWd7OhdoTqebkkfE8nZ4C5NQGkh
	 9Bl07sLpj+3XUalYNo3jDSgZ2uGaLCdzK++URy2xNVgiERJFysz/bwnuiRD6qBQkhCs0L
	 nGF1TyZLxfdzIIIUY2ALzO/av9/3y5WqxE1diLdDHZF8Rgo2wicdhv0mof84tePd9FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ds8tqWhZ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8061C606A31D
	for <devicetree-spec@vger.kernel.org>; Wed, 28 Oct 2026 08:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8061C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ds8tqWhZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CBF861A12CD;
	Wed, 28 Oct 2026 08:41:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9625560769;
	Wed, 28 Oct 2026 08:41:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 520A6103290C7;
	Wed, 28 Oct 2026 09:41:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793176878; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JzDymCFq2m8GeSdsBCaxEaw3VPeIifTesv3xlvlZRsU=;
	b=Ds8tqWhZvvYFmQ+UpQMgKqBwdgMFv9QoHA/ftwXysGUxeBcTFREOWKznS5/c87oSvnOHU4
	jFYoM0ROX3OjPEL1iA2sz26jjx+UnRyS5ZxoYTZfwNVF2KDMZrv38/OTfn8bmp1HWBlSUR
	GMvEQYPSS65vW3kcXoe7Ym/X9j11KtKDR3N1ZNfhL/RYlXpTR4yEk6nROGu7sTsCyNcG7E
	Hb+DreDaSxkBpIhF/Tj75HwfqY1SSnuzMrC9iJeYT6JGYtOyF+V+wCwZc2zpKMTbuDfSam
	O2kCKVOdIgXHF5i+ozcApN8ug2WMsKJDuVeiCqZSfwYRDlUwUZfXNHSEdup61g==
Date: Wed, 28 Oct 2026 09:41:10 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 08/74] livetree: Improve get_node_by_phandle()
Message-ID: <20261028094110.2a8133a2@bootlin.com>
In-Reply-To: <auFgv_f0av-JxMjg@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-9-herve.codina@bootlin.com>
	<atrTn_I_8O6q9QUW@gractus.seuss>
	<20261023181533.0c44a57f@bootlin.com>
	<at6t-l9XYYFfS48T@gractus.seuss>
	<20261026125615.055e7214@bootlin.com>
	<auFgv_f0av-JxMjg@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Post: <mailto:devicetree-spec@vger.kernel.org>
List-Help: <mailto:devicetree-spec+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-spec+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Wed, 28 Oct 2026 13:41:14 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

...

> > 
> > Ok, I will rename node->phandle to node->phandle_ and add a comment saying
> > that phandle_ field must not be accessed directly.  
> 
> You can even switch it back after you've checked there are no stray
> accesses to it.

If I switch it back, why talking about renaming?

Of course, I will do this renaming locally to be sure that I handle all
users but in the end no commit will rename this field.

> 
> > Related to existing users, I can see check_explicit_phandles() available
> > in the checks.c file.
> > 
> > check_explicit_phandles() could use the new get_node_phandle_exising() with
> > the caching feature. The only problematic part will be
> > --- 8< ---
> > 	if (linux_phandle && phandle && (phandle != linux_phandle))
> > 		FAIL(c, dti, node, "mismatching 'phandle' and 'linux,phandle'"
> > 		     " properties");
> > --- 8< ---
> >
> > Indeed, this check is done in get_node_phandle_existing() and the function
> > returns 0 (invalid phandle) when both properties are set with a different
> > value. A value other than 0 should be returned by get_node_phandle_existing()
> > to identify that mismatching properties values.
> > 
> > This should not be a big deal if we introduced a new invalid phandle value:
> >   - 0:
> >     Invalid value. Can be returned by get_node_phandle_existing().
> > 
> >   - ~0:
> >     Unresolved value (phandle value in properties) or value cached in 
> >     phandle->node_ for "mismatch 'phandle' and 'linux,phandle' properties
> >     values". Can be returned by get_node_phandle_existing().
> > 
> >   - (~0)-1:
> >     Invalid value in properties and or value cached in phandle->node_ for Invalid value.
> >     Will not be returned by get_node_phandle_existing().
> >     When this cached value is found, 0 will be returned.
> >
> > In phandle_is_valid(), those 3 values will be checked to determine if the phandle
> > value is valid or not.  
> 
> Alas, we can't do that.  Which phandle values are valid is long
> established from the IEEE1275 days, and we can't really change it.  I
> don't _know_ if there are existing trees out there using 0xfffffffe as
> a valid phandle, but there could be.

Ok.

> 
> *thinks*
> 
> In some ways it would be elegant for get_node_phandle_existing() to
> report the various different error conditions separately, but I think
> the awkwardness of passing that information back to the checks is
> going to outweigh it.
> 
> So, I think we're actually better off separating lookup of phandles
> from validation.  So get_node_phandle_existing() (or whatever we call
> it) will return 0 if there's no valid phandle, whether that's simply
> because it's missing, or there's something malformed.  Separately
> check_explicit_phandles() will report specific types of malformed
> phandle properties.
> 
> It does result in a little redudant logic, but I think it's the best
> overall approach for now.

Right. Ok on my side to have this redundancy.

> 
> > Now last point, renaming get_node_phandle_existing().
> > 
> > get_node_phandle() already exist. It get a phandle but also if the node doesn't
> > have a phandle, it allocate a new phandle value and set node "phandle" or
> > "linux, phandle" property to this allocated value.  
> 
> Ah, sorry, I misunderstood what the "existing" was referring to.
> 
> > IHMO, get_node_phandle() should be renamed to set_node_phandle() and
> > get_node_phandle_existing() should be renamed to get_node_phandle().  
> 
> Right, the existing name is bad.  But let's go with
> get_or_assign_phandle() for the existing one and get_phandle() for the
> new one.  (The "node" added no useful information and this way they're
> two new names to reduce confusion).

Ok, will use those names.

Best regards,
Hervé
