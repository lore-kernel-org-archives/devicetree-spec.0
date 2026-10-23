Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792755011;
	b=AsyHAeXXyUpVoLpv7LYnMHesyEG4zdq+2CkPXD+nvISoPZg82aBqoegLbH9bviqvzNfP
	 La1VPN5EXWM9GXLipjPgqd+sMCp41tyGB5BvtVCZupqbrvI0jzOG2BeaEMKE5ADoxpE1Z
	 IXsbPxMYicS+NDCu3gxRPpSNH1ljuQxCsqwoipoqU5uiwbl2wZPMQPbys5JtKYl2bVY+I
	 4aIZIFyntVnE7HcSXaJE3E55Y9A1lTO6Sa4+TrLaH0HjWnEJpjuI0ovVZis23JSBKG3jg
	 76r8NBLAfb0NmW9mwCAOouU2kWS/3wcm3feMA+z/iO+sO5WKPa1suzS3uNWofYyjHCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792755011;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=gsV34wZjjPHH5fmjILCV1sdq4uiuzxSrBS+pzlxLSrA=;
	b=1L5x3Z0lXeOYs6zlma249TR1kfX7Pcaxrm8Iheeuy2b/woL42imQJ/lTl1fn9+tXv9lC
	 2uPcIYNndacU0f00W16dpMPhFGYw6HyYdqU82q4E9RkH7s1nP8bn45eWcRnjqnR4KbALS
	 5jnC+g++wUBQKWmgy3hXImeOHu0Pd8o26OeOSj1IY+Zxk4V93c+07jndJ2BKr5AGPday/
	 41uXbWh5M9MlhxERcoXqT/NZ9QVIc5vstkAR/Fb2y5xGI1B2yrrcx9UWxwEBivv9Mo85k
	 DuC9h1vKLymayJ2df+BFVxIcsXWnJFg5neCDZsLvaVS4VXGjASkgeO2l4kZjJFMbtEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mK+AvKTT;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3DF606A31A
	for <devicetree-spec@vger.kernel.org>; Fri, 23 Oct 2026 11:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C3DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mK+AvKTT
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5FA4F4E412CD;
	Fri, 23 Oct 2026 11:30:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2117060398;
	Fri, 23 Oct 2026 11:30:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01F2810329015;
	Fri, 23 Oct 2026 13:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792755001; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gsV34wZjjPHH5fmjILCV1sdq4uiuzxSrBS+pzlxLSrA=;
	b=mK+AvKTTCcjfbF3y4U8ovV7fEnf5ttI761VM6A+bbggOpVZ+tuzcvRG/SteWwg0lhTex5F
	zPhjOcqT8c9X+Sa3Pc6XugQO/FwID9wIADniFOJZHUuq0WY5akXyOIj8tYH2APN+PvuQu6
	X36H5Goh67/CWHlC6QXXObrF15ksTvyvZKCU1AVDLSyEbu2NJhkdeM29W5YWgPUrYmYFU/
	QooYL8y3Ci3b6bOqIOsF29ieBjCzV4fUTVh3Cv2qVHQ8d1FFq0ye0n1dN0UOh+UFQ9ONvF
	FiSy4iuE0+4bnMaP1xfqSY+y8loefBm7oIZJqdrk6L4HLmGVrf9rDXAyZPvKfA==
Date: Fri, 23 Oct 2026 13:29:49 +0200
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
Subject: Re: [RFC PATCH v2 07/74] Add support for FDT_PROPDATA_PHANDLE dtb
 tag
Message-ID: <20261023132949.4fc3072b@bootlin.com>
In-Reply-To: <atq3H0Ts4wTBTVCV@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-8-herve.codina@bootlin.com>
	<atgtw8QubzVfWMYP@gractus.seuss>
	<20261021192615.1f5b91ff@bootlin.com>
	<atl8nkrGFvhWRqDr@gractus.seuss>
	<20261022114741.31171b04@bootlin.com>
	<atq3H0Ts4wTBTVCV@gractus.seuss>
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

On Fri, 23 Oct 2026 12:23:58 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

...

> > > > > > -static struct data data_append_markers(struct data d, struct marker *m)
> > > > > > +struct data data_append_markers(struct data d, struct marker *m)
> > > > > >  {
> > > > > >  	struct marker **mp = &d.markers;
> > > > > >  
> > > > > > @@ -288,6 +288,7 @@ struct marker *alloc_marker(unsigned int offset, enum markertype type,
> > > > > >  	m->type = type;
> > > > > >  	m->ref = ref;
> > > > > >  	m->next = NULL;
> > > > > > +	m->is_local = 0;      
> > > > > 
> > > > > Storing is_local in the marker doesn't make sense to me.  I think the
> > > > > locality should be calculated only when we actually go to emit the dtb
> > > > > - I believe we should be able to deduce it from m->ref.    
> > > > 
> > > > When we parse a dtb, we do not have any reference for local phandle, we have
> > > > only the phandle value.    
> > > 
> > > Heh, right, I remarked on that further down.
> > >   
> > > > Later in build_dt_info(), complete_references() is called. This new function
> > > > is introduced in patch 9 ("dtc: Complete REF_PHANDLE markers with ref strings
> > > > and is_local flags"). It completes the reference either filling the ref field
> > > > based on the phandle value for all local reference (parsing from a dtb) or
> > > > setting is_local based on the reference (parsing from a dts).    
> > > 
> > > Ah, right having that logic in a different patch makes it harder to
> > > follow.
> > > 
> > > What concerns me here is that currently we have an invariant that a
> > > REF_PHANDLE marker always has a meaningful m->ref field - from as soon
> > > as it's added to the property data.
> > > 
> > > This patch breaks that assumption, which means when looking at some
> > > random part of the code it's hard to know whether we're in a state
> > > where m->ref is valid or it might not me.
> > > 
> > > One approach is to minimise the gap where m->ref is invalid.  That's
> > > both in terms of code path - at minimum the m->ref fields should be
> > > valid by return from dt_from_*().  It's also in terms of not leaving
> > > intermediate patches where this is not fixed up.
> > > 
> > > The other approach would be to create new marker types indicating
> > > these intermediate states.  The markers are for dtc internal use, they
> > > don't need to have 1 to 1 correspondance with things in either dtb or
> > > source format.  
> > 
> > I don't want to introduce new markers for handling intermediate states.
> > 
> > I really prefer avoiding those kind of "fake" marker which will have
> > a short lifetime and should not be seen by code (other than the code
> > moving this intermediate state to the final state).
> > 
> > My strategy was to ensure that once build_dt_info() is called, all
> > markers are fully correct with all field (is_local and ref) correctly
> > set.
> > 
> > build_dt_info() is called by all parser at the end of the parsing
> > operation to return a struct dt_info which is the dtc internal
> > internal representation used by the rest of code.
> > 
> > Are you ok with this strategy?  
> 
> Having transitional states that don't last beyond build_dt_info() is
> acceptable in principle, however:
> 
>   1) That leaves m->is_local and m->ref redudant after that point,
>      which I don't like very much

Ok I've looked deeper to remove the is_local field. It should be doable.

complete_references(), probably renamed to fixup_references(), will still be
needed and called from build_dt_info(). Indeed, all refs need to point to a
valid string (path or label).

The idea removing is_local is to have the transitional state where ref can be NULL.
(REF_PHANDLE created from FDT_PROPDATA_PHANDLE where no ref are available but just
the phandle value).

Those NULL ref, identifying a local phandle, will be updated by fixup_references()
called from build_dt_info().

I plan also to remove the is_local field from export symbols structure. Indeed, the
exact same problematic exist with export symbol and related to this 'is_local' topic
REF_PHANDLE markers and export symbols have no reason to be handled in a different
way.

I plan to introduce an new function:
    bool ref_is_local(struct dt_info *dti, const char *ref)
in order to determine if a given reference is local or not.

As you already stated, this will be needed to emit the correct tag in the output dtb.

This function will walk the tree, no way to avoid that with a 'is_local' flag.


>   2) As of this patch specifically, that's not the case.  I don't want
>      to have intermediate commits where this invariant is not
>      preserved (it's bad for bisects).
> 
> > If yes, patches order in this series will be changed.
> > 
> > The current order is
> >  - Patch 7: Add support for FDT_PROPDATA_PHANDLE dtb tag
> >  - Patch 8: livetree: Improve get_node_by_phandle()
> >  - Patch 9: dtc: Complete REF_PHANDLE markers with ref strings and is_local flags
> > 
> > With that order we have the incomplete marker state present after patch 7 and
> > before patch 9.
> > 
> > Moving 'Add support for FDT_PROPDATA_PHANDLE dtb tag' after introducing the marker
> > state completion will avoid the problem.
> >  - Patch 7: livetree: Improve get_node_by_phandle()
> >  - Patch 8: dtc: Complete REF_PHANDLE markers with ref strings and is_local flags
> >  - Patch 9: Add support for FDT_PROPDATA_PHANDLE dtb tag
> > 
> > Patch 8 and 9 could be squashed if you prefer to have the completion added
> > in the 'Add support for FDT_PROPDATA_PHANDLE dtb tag' patch.  
> 
> That sounds ok, though I think I'll have to look at the final result
> to be sure.  I would prefer 8 & 9 be merged together for
> reviewability.  That said, the libfdt parts of the changes could be
> split out into an earlier patch than the dtc parts to keep the sizes
> smaller.

Ok, I will merge and extract libfdt related parts to a specific patch.

> 
> > > It seems to me there's an important difference between the -Idts and
> > > -Idtb cases: in the dts case, we have a valid reference, but the
> > > phandle needs to be filled in later; in the dtb case, we have a valid
> > > phandle, but the reference needs to be filled in later.  Using
> > > different marker types for those cases doesn't seem unreasonable for
> > > me.  In fact, for clarity it might even make sense to have a third
> > > variant for "both phandle and m->ref are valid" - the fixup code
> > > between input and output would convert either of the first two
> > > variants into the third, which is what the final output code would
> > > require.
> > > 
> > > That's not necessarily the best way to do it, but I really prefer
> > > where what's valid in a structure can be determined from the type and
> > > contents alone - rather than having to know where you are in a complex
> > > code path to know what's valid.  
> > 
> > Performing marker completion in build_dt_info() avoid additional markers
> > and avoid also incomplete markers in the code path.
> > 
> > Before build_dt_info() call, the internal devicetree representation doesn't
> > exits for dtc. We are in the process of parsing and so we are building this
> > internal representation. After this call, the internal representation exists
> > and all markers are fully set without the need to introduce (and handle)
> > additional markers.
> > 
> > In other word, dti returned by all dt_from_*() functions returns a fully
> > complete dt_info.
> > --- 8< ---
> > 	if (streq(inform, "dts"))
> > 		dti = dt_from_source(arg);
> > 	else if (streq(inform, "fs"))
> > 		dti = dt_from_fs(arg);
> > 	else if(streq(inform, "dtb"))
> > 		dti = dt_from_blob(arg);
> > 	else
> > 		die("Unknown input format \"%s\"\n", inform);
> > --- 8< ---
> > 
> > User of this dti will never see an incomplete marker.  
> 
> Ok, that works.

Fine.

...

> > 
> > What do you thing about:
> > --- 8< ---
> > 	/**
> > 	 * fdt_next_tag - get next tag in the device tree
> > 	...
> > 	* returns:
> >  	*	The tag type, either a known tag or an unknown structured tag
> > 	*       if this unknown tag can be skipped (SAFE_SKIP bit set in this
> > 	*       tag).
> > 	*	In case of error, FDT_END is returned with @nextoffset set to
> > 	*	a negative error code.
> >  	*/
> > --- 8< ---  
> 
> I don't think the extra detail really helps much - just "The tag
> type." would be fine, I think.

Ok on my side, I will remove the detail.

Best regards,
Hervé
