Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91172D060D
	for <devicetree-spec@vger.kernel.org>; Thu, 12 Feb 2026 15:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770910426; cv=pass; b=Ok49sR2ZXnNe3aDY8T7gXld+sle0VXvtTreApG39VqvlGau8RkDpJ9sJZPWkNvszXcaQUMrXh0uMAc70sE5sj3PO1hZh7udCRoIJQbbVNA5a31UTK6fLWdJBiX9Vw/rbP9f0wIEA/4YyDoyzrCYjVTfTQZTRsadW2fmHJPXOYGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770910426; c=relaxed/simple;
	bh=B4VadzhynTXSTTd43Y3hXoXOiCVRL+8CBbKoiGszw9E=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfL6huU5+6jto0Ow3XtImmUJ8VsepaDOqzACSd/0ELrwXxOlTy14nJdvdulNf8TuMorpofZXjOXcMad12wnNZmtoJ86TpA/1zxPGkHUTBceYABuFVlXQIp2PRFq+3CQGw7ciYzNnLLe6G4cDXY91/4Ua5aodbUhsPIqetASsElQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=Q+gFRZxw; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="Q+gFRZxw"
ARC-Seal: i=1; a=rsa-sha256; t=1770910420; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CRdNb4Rx/AqbF7dIxhRLPvtTZkkm047qVSD5cX4QV9nX+lPHDHnsniQwdmkpykUBtacPiCdtCoPyQygkBNpCvHbjPEM+EUQMQYVBjZtROvgS1f0AjPMBvCq9f0l8PDuunRc1ZODkL1G6J9Hl9JX3N4qsIMqWeX18fQcsqAP6Ij8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770910420; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=HMw+qWSqVDpdUwN4rQRGDGmuIoT2I5kIrFQPKBdbsUQ=; 
	b=WPx+q2VLoYmH4MItlhBrBTiUlvGF40H/vSJzb0A7wpLaXfvOi3mmkxCKonMD3OtH1Gohw5YGITiFnd5rs0WvJYpj1ONg8Ub2gXUIpt9TVZtcAjSUdqqyHyvUIEEf3sDbMS8v91LEz06QoqPS1g4D4/jIbXAxEGa6PKSXDf4ozrE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770910420;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To:Cc;
	bh=HMw+qWSqVDpdUwN4rQRGDGmuIoT2I5kIrFQPKBdbsUQ=;
	b=Q+gFRZxwqEFCxVUQDzwW7RrHUjovHL79nbz0fiNgFYhk3CmYI6xGc1TflnpMqlGk
	W/lZnBkE3+z1hF2pv1a681139tYAxyFhilMtzVs1jSibRpNDKZcwHjVgFKVPf51o36o
	jBckCLINIQtbi+lgzheaw9a9jwGQGcvms4gEZn+g=
Received: by mx.zohomail.com with SMTPS id 1770910416619396.3388092662117;
	Thu, 12 Feb 2026 07:33:36 -0800 (PST)
Date: Thu, 12 Feb 2026 15:33:33 +0000
From: Yao Zi <me@ziyao.cc>
To: Kyle Bonnici <kylebonnici@hotmail.com>,
	"devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Subject: Re: Ranges - Intended use case
Message-ID: <aY3yzUGLHU-wxue9@pie>
References: <7CB259ED-7AFC-4EE1-A926-54A5F6DCD97B@hotmail.com>
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7CB259ED-7AFC-4EE1-A926-54A5F6DCD97B@hotmail.com>
X-ZohoMailClient: External

On Thu, Feb 12, 2026 at 01:14:33PM +0000, Kyle Bonnici wrote:
> Hi 
> 
> I have been trying to understand how ranges should/should not be used.
> 
> Looking at the spec 
> 
> > The ranges property provides a means of defining a mapping or translation between the address space of the
> bus (the child address space) and the address space of the bus node’s parent (the parent address space).
> 
> This to me the spec leave some space for interpretation on if ranges should be used on just buses or not. Below are some examples to try to get a better understanding.

I'd like to say ranges literally specifies the translation process
between the children address space and the parent one, regardless
whether the parent is a "bus".

For example, reserved-memory nodes aren't really "buses", but often
come with ranges property, as shown in the example of dt-schema[1].

However it might be a signature of bad device-tree model designs if you
have to use a ranges property for a random non-bus node.

> 
> ```
> / {
> 	foo { // not a bus
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		ranges; // does this ranges have any meaning?

I'd like to say, yes.

> 		bar@10 {
> 			reg<0x10 …> 
> 		};
> 	};
> };
> ```
> 
> ```
> / {
> 	foo { // not a bus
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		reg = <0x100 0x50>;
> 		ranges = <0x0 0x100 0x50>; // is this an intended use case?

Depending on what the child node represents, but IMHO it comes with a
clear meaning.

> 		bar@10 {
> 			reg<0x10 …> // hence abs address is 0x110. 
> 		};
> 	};
> };
> ```
> 
> ```
> / {
> 	foo { // bus
> 		compatible = <simple-bus>;
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		ranges; // this I understand to declare that children will have direct mapping
> 
> 		bar {
> 			ranges; // is this needed? Or is it implied that the foobar is in the same address space of bar?

It's necessary. I don't think ranges property is ever implied.

> 			foobar@10 {
> 				reg<0x10 …>  // hence abs address is 0x10. 
> 			};
> 		};
> 	};
> };
> ```
> 
> ```
> / {
> 	soc { // bus
> 		compatible = <simple-bus>;
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		ranges; // this I understand to declare that children will have direct mapping
> 
> 		flash@1000 {
> 			reg<0x1000 …> 
> 			ranges = <0x0 0x1000 …>;
> 		
> 			partitions {
> 				ranges;  // is this needed? Or is it implied that the partition1 is in the same address space of partitions?

Personally I think it SHOULD be needed, though existing dt-bindings for
fixed partition layout don't enforce such.

I'm not very familiar with flash partitions and their dt patterns, so
will leave the question for others :)

> 				partition1@10 {
> 					reg<0x10 …>   // hence abs address is 0x1010. 
> 				};
> 			};
> 		};
> 	};
> };
> ```
> 
> Looking forward to explanations on this topic to extend my understanding of devicetree
> 
> Regards
> Kyle

Best regards,
Yao Zi

[1]: https://github.com/devicetree-org/dt-schema/blob/d16dc68b093e59ec4ae6a32a2e1179cb9cc0fada/dtschema/schemas/reserved-memory/reserved-memory.yaml#L147
