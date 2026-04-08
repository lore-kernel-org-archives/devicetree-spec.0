Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C741396B6B;
	Wed,  8 Apr 2026 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634948; cv=none; b=DV/f+LI70dhot7OMdYcuFM6iW+rdI8hFPTyC2dVPXkurgwyW4zLy7C9GaI0En14qwTJjRs40TabksJpKgAIidvnQlMn8TbJs695d5DN4MPFzFmPrqby8Jtj/1YAZy5uPgWeUc/riVO/dL+IXoK6d4+rVpQveARl0n+tvsCCX2QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634948; c=relaxed/simple;
	bh=AH6dJigQs5hz84A7MorI6yrN4/3IGUQSRRNzsp2M+jc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=aUYdSqz7XfRtIkG90ANbzFEGFVjkknHq/rWkLcguhrYvMPnGF5AxMFPl0siGmD67jmPtB4brqMyUs+cHcj537FCbJb1apR1plfdz9uy0ig0STabqp13vErbvqt/o+hZxl57vhDWaCects4I+1GhnqPYAJ9kItuHs9FvZJfawb9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZezyUPUb; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZezyUPUb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD9AC4E42977;
	Wed,  8 Apr 2026 07:55:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B1963603CB;
	Wed,  8 Apr 2026 07:55:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C65D104503D0;
	Wed,  8 Apr 2026 09:55:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775634942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rvnKg1xMJhGiVQnrTAtZ8gZFRNiU/MpXI3BNFhAd8Ck=;
	b=ZezyUPUb0hRfNKObxlk3XBRzRpnx/sdVAvENgYporqPvlkuEv3Wwk3WFSaU2+QkgaAhScv
	iJKh/iNOZbFZr0wjBtSDBC/aN/g88OlksUTPfvonkovBxkmdCvtGKU/I06lDNEY3zFxdo/
	C+L6b7wG+1npaTGcIzlshu22I/ezzAa5NkRa9DKy1JPb/FmCnREalQpIH+ioVMALL86seE
	plPR37RHiiwSvxbB4vbxoRRAYCo3N/uu2oVLr0V1VznsrhG2nJ9XPa+2BtNVnmfERFGjlO
	izeosxBtFv2W1lnyZ+jWqdyMM8V8E3tvo0yXeFz/TYcyNI2A7xXNc/T4mHzq6w==
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 09:55:37 +0200
Message-Id: <DHNM1XCPKD6P.1KD9C370G7H90@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [RFC PATCH 15/15] Introduce v18 dtb version
Cc: "David Gibson" <david@gibson.dropbear.id.au>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Ayush Singh" <ayush@beagleboard.org>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>,
 <devicetree-compiler@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree-spec@vger.kernel.org>, "Hui Pu"
 <hui.pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Herve Codina" <herve.codina@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-16-herve.codina@bootlin.com>
 <DHHX3P5TS0D3.VWALCUNJ7LGL@bootlin.com>
 <20260407184423.3060f1cd@bootlin.com>
In-Reply-To: <20260407184423.3060f1cd@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Apr 7, 2026 at 6:44 PM CEST, Herve Codina wrote:
> Hi Luca,
>
> On Wed, 01 Apr 2026 17:19:09 +0200
> "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
>
>> On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
>> > This v18 version will add support for
>> >   - Structured tags.
>> >     Those tags value definition will allow old libfdt, dtc and other
>> >     tools to skip unknown tags if encountered in future dtb version.
>>
>> "old" seems to imply that versions released before today will be able to
>> wkip unknown tags. I think this should be clarified along the lines of:
>>
>>   libfdt, dtc and other tools implementing version v18 will be able to w=
kip
>>   unknown tags in dtbs generated with later versions of dtc
>
> Yes, I will add this clarification in the next iteration.
>
>>
>> >   - dt_flags header field.
>> >     For now this flag field is set to 0. It is a placeholder for futur=
e
>> >     dtb version and could be used to store some dtb related informatio=
n
>> >     such as the kind of dtb.
>>
>> Is this intended for DT addons?
>>
>> You may mention a realistiv use case here.
>
> Intended, maybe not. Used by addons, yes, for sure.
>
> What do you think if I add the following:
>     For instance, the future addons format will use this field to
>     clearly identify that the dtb is an addon dtb.

This clarifies a lot to me, so I think it can be added to the commit
message.

>> > Compared to previous version, it is worth noting that the dtb is not
>>                                                                ^
>> 				                        "dtb version"
>>
>> > downgrade for all modification but only when unknown tags are removed
>>   ^
>>   downgraded for any
>>
>>
>> > due a property modification.
>>   ^
>>   "due to a ..."
>>
>> I'm not sure I got what you mean by the initial "Compared to previous
>> version". Version(s) of what?
>>
>> If I just remove those 4 words the sentence seems OK to me BTW.
>
> Is the following clearer?
>
>     It is worth noting that with this v18 version, the dtb version is not
>     downgraded for any modification but only when unknown tags are remove=
d
>     due to a property modification. In v17 or older version any modificat=
ion
>     led to a dtb version downgrade.

Yes, totally clear now, thanks!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
