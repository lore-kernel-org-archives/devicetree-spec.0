Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D255205E34
	for <devicetree-spec@vger.kernel.org>; Mon,  3 Feb 2025 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738594083; cv=none; b=sThBMuEo80DAoO1e09po0+sOLIWefkpn5JvdaK/Y61dn9WS0Em6koGRDEIUlh/L+zM9sreNdiaa6i1LcTrd/zdJyLbeE2S48H3zOAD9iK1170f46dv3dO+rk10k5sUCOIosrfSCpIAODZ62q665jvZhAzDGpdzIZdSTb2EMBVGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738594083; c=relaxed/simple;
	bh=2pXmjyc8WPzCazltFwJqe8nn/UoLoo8nKzyu/TxQw/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2JI8jyVL46IlDlLGoclAGt8X4C+bl7/daR7XNHyf4z4jiqnQElOOgJo9nBQM4cbEQoyIzOil67pcjvCDWgT/87gYCMbbDzpxTinlW5vroM6jGwL1ZYW/qtyGwMbDY/XtwZut18Muv4RwKZMiSW3fkKBzd5NXrlvjqRr+P2RNDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFEWSvsM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFEWSvsM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E6FC4CED2
	for <devicetree-spec@vger.kernel.org>; Mon,  3 Feb 2025 14:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738594082;
	bh=2pXmjyc8WPzCazltFwJqe8nn/UoLoo8nKzyu/TxQw/0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bFEWSvsM7dN7sx0mfz8WFQhWzekIgVCFZdkck/sYqNpu4L6WSiuyuZyhfLOfKDXPC
	 lpSSySr+9FK/rEe6K1nyRIhgkboYiHf6Wiw3RUry+sSBhbZ5mFhxWu3rZ0NUoUc0bj
	 32u1zJhOCDfC/wgeI6cilcFnlSZO9r13DFYt97SUzzLqx1PMzaMmK20jntOs9LShMI
	 tQAIL+zQA2a0MXIesDFaNdpurAq3/GcV5i9UPPkCvpegL6kNKFmpnFuHb6+nBgUtGR
	 Gzp8ZmeoAJWtQqfNxP5G2ZZwlC2aOUuhAi7VGWIhB7vrET7JGTAfRJJBziU9fytEyp
	 Q3fPYEspZmP1A==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so9340364a12.2
        for <devicetree-spec@vger.kernel.org>; Mon, 03 Feb 2025 06:48:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4eZ/cRwhS1YEDuLBgAYltIsjYunnMY9xIG6y4Izo0/pT5f/OSg/zCtDyJXS0Ap+EGncpUUuByOSh9kIfSnJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRIsTtzlxhfFWi/hMmKFInOccgepbbmgow0bNp9kmhXm891oEb
	hhSxIue6bbyxZ9gUfJNsc97Ws8KVkXbE4CAgHVNcNRawvlwXGSywXHIvdk4LmqGq+WM2l8oYJvJ
	IxaOzLoE1jncn8b03p+wyP4xgOw==
X-Google-Smtp-Source: AGHT+IH0QVGr5MnuWRxtAN1Lp1wSciGYBmr6N/nLJzdBfcWCu7X4IWFwCmTOVfYyWOV12EVGfx6REBlD+WCJz6gxqoE=
X-Received: by 2002:a05:6402:2816:b0:5dc:1395:1d3a with SMTP id
 4fb4d7f45d1cf-5dc5efa2e79mr24677185a12.1.1738594081314; Mon, 03 Feb 2025
 06:48:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203120527.3534-1-alireza.sanaee@huawei.com>
In-Reply-To: <20250203120527.3534-1-alireza.sanaee@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Feb 2025 08:47:50 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKLJ=i7cbpYa-qfr+TQ+Z7HCq1iLoCiw+QcAGRaF_uZ5w@mail.gmail.com>
X-Gm-Features: AWEUYZmm3UrmokrYBbqdjgaFfHEa_n2m6JGMiTQ163EdNOWF-d8FDVs6p8nBA8c
Message-ID: <CAL_JsqKLJ=i7cbpYa-qfr+TQ+Z7HCq1iLoCiw+QcAGRaF_uZ5w@mail.gmail.com>
Subject: Re: [RFC PATCH v1] Chapter 3: Add shared L1 Cache
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: grant.likely@secretlab.ca, devicetree-spec@vger.kernel.org, 
	mark.rutland@arm.com, yangyicong@huawei.com, jonathan.cameron@huawei.com, 
	shameerali.kolothum.thodi@huawei.com, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 6:05=E2=80=AFAM Alireza Sanaee <alireza.sanaee@huawe=
i.com> wrote:
>
> For L1 cache to be shared between SMT threads, a register array must be
> used. This, however, is not straightforward if every node in the CPU map
> refers to a separate CPU node. Therefore, it is suggested to create a
> separate CPU node for every SMT thread. The L1 cache can be shared if an
> extra node represents it.

I don't understand why a cpu-map is a problem for the SMT case?

I don't think this change is necessary.

Rob
