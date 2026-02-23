Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FAD34D4C1;
	Mon, 23 Feb 2026 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771836009; cv=none; b=b+ywMgNis7WBEHtJlbVkaHl/lni6ztLD7KbDnGAGl4+n1Jy1hLpZBgXJIeg7yo3cXZaUZhJmIkJya+P3hUFQqXlzPlcYpekXrKI/e/UaLOIq3XwDs2y6nskM3BxqAfhstbqb/SfbrUkeLHaLHFhQNF75zFTWu0bKMR08z2VgKVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771836009; c=relaxed/simple;
	bh=4XRyDEjLLNVXzHKWzW4WmnEuuw/utoKOqYKULc2vVEE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fS2L4kAhwfdz1cBrKC2iaYIgoXL03QP6owW2TvMnWGIq8Kk7zZRqto8bBq2q1CWgmHvqEl6iCdaSe/9WBksMv66N6ZERCbr9zi1VoV1oHXdklDrKE5Ciw1cUzYHQFCTOt96tlIbjlFOandnFZFN5MrXC/PU+rANEjq9LV2045lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x3Ipc00n; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x3Ipc00n"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1309C1A1169;
	Mon, 23 Feb 2026 08:39:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D51685FD43;
	Mon, 23 Feb 2026 08:39:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C7FF103686FA;
	Mon, 23 Feb 2026 09:39:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771835997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w/LaEiWbJ8jf3yGYaLX65wGucyFvb0TAz0HexsEfC/0=;
	b=x3Ipc00nGgMVWGzQOq6akp3zun+cJGpPqYDJXaVLppF6CEWLUmyAkJshDSScEiUME8607O
	oO13cYagN7nmunFC0gizx9dgx0vl11/wY6gcbDVPNjgKzHaZ0drsMOYTTEIUBn4oXmg/ZD
	dCbKYrqPHK6RsrU6zeMWjFLzIPl/0kdlb5qtLCRFfyGkBYCC7x21RGIf+rg/7SHjZaXVmx
	PCcMvXgbln8UPjq9jQCjYLe9OBetP7Vv/Qmd9MkBOIXL0JyxXKNfW+kyPebeCxzuJvzCV0
	uQEwEjf3bPgq2Cg5NBPXvgRK1LNyUTAVCRWVvodEQppVJCPO489VLDjUSclZ/g==
Date: Mon, 23 Feb 2026 09:39:50 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ayush Singh <ayush@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, Hui Pu
 <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 03/15] fdtdump: Return an error code on wrong tag
 value
Message-ID: <20260223093950.7c44b540@bootlin.com>
In-Reply-To: <aZvnwbRVoX73DyLJ@zatzit>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
	<20260210173349.636766-4-herve.codina@bootlin.com>
	<aZvnwbRVoX73DyLJ@zatzit>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Mon, 23 Feb 2026 16:38:09 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Feb 10, 2026 at 06:33:31PM +0100, Herve Codina wrote:
> > fdtdump prints a message on stderr when it encounters a wrong tag and
> > stop its processing without returning an error code.
> > 
> > Having a wrong tag is really a failure. Indeed, the processing cannot
> > continue.
> > 
> > Be more strict. Stop the processing, print a message and return an
> > error code. In other words, call die().
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> The intention of fdtdump is that it's a fairly crude debugging tool -
> it will generally attempt to produce at least partial output even on a
> bad dtb file.  If you want a polished tool for use on good dtbs, use
> :dtc -I dtb -O dts".

fdtdump is also interesting for tests purpose.
I use it to check dtb outputs during tests. Those outputs are either
generated by dtc or by libfdt.

Having an error code returned by fdtdump when it cannot parse the given dtb
allows to have this test (patch 10):
--- 8< ---
+
+    base_run_test wrap_fdtdump unknown_tags_can_skip.dtb unknown_tags_can_skip.dtb.out
+    # Remove unneeded comments
+    sed -i '/^\/\/ /d' unknown_tags_can_skip.dtb.out
+    base_run_test check_diff unknown_tags_can_skip.dtb.out "$SRCDIR/unknown_tags_can_skip.dtb.expect"
+
+    run_wrap_error_test $FDTDUMP unknown_tags_no_skip.dtb
--- 8< ---

> 
> That's why this didn't die() initially - the idea is if there's some
> bogus stuff in the dtb, it might print a bunch of these warnings, but
> eventually resynchronize on another valid tag.

Current implementation cannot resynchronize. The parsing loop is exited
  https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/fdtdump.c#n150
and the program just returns 0.

Instead of just print and exit the loop, the idea was to have a program
error code set. Calling die() allows to print, exit the loop and exit
the program with an error code.

With that in mind, I can do what you prefer. Either:
  - keep the die() call
or
  - discard this patch and update the test in patch 10 (i.e. remove the
    'run_wrap_error_test $FDTDUMP unknown_tags_no_skip.dtb' line)

Let me know.

Best regards,
Hervé
