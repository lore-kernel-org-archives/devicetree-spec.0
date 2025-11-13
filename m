Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735871DFF7
	for <devicetree-spec@vger.kernel.org>; Thu, 13 Nov 2025 05:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763011039; cv=none; b=YhKHBFBEST7t4zTsv66YyRCN6iTothMiEvqJSaIml8htGUNuRPZ99qDIUuABATKHmr15/FX9Pky+NUZ5VJlzRbQMg18+yNFGTPLbiRzx4HJZRgKvBQYXKVtpNykpubW4khJ/vsA24ezr6YkR7BzZwCMCdFxOXm0X0I8ksDHcMLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763011039; c=relaxed/simple;
	bh=FVc+NaRrYJ4ZZqE5HIwBsY3M0/OOCYbazwmP6gVegvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujPP+D6bvn+RVn7DEoOmGNYKb7Q+ymbEIQyBRXlbldYp+SpIKQkL9STiv5gais5eQcMqnEoDB3vFoBvEjPnMfz6GIEWoUPtPNGQAO3t7LIc2WmtUrju2ovPBOmPXyJN28JEbHiiQe0DOAXG3W5aMzQvOtDcVicRVrSMQIbOCBa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZhllMcD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZhllMcD"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so690839a12.3
        for <devicetree-spec@vger.kernel.org>; Wed, 12 Nov 2025 21:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763011036; x=1763615836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVc+NaRrYJ4ZZqE5HIwBsY3M0/OOCYbazwmP6gVegvE=;
        b=AZhllMcDSqtpJu65d/VjWnWtc/2PAKdL4o5aVDrrx259XEF7cjDdHMpHl8IX4FlPgX
         K7SvyZ/3ce+WSPGHXm7b+jiDJdYxcebA4cLdK73gvPgKd98qwy5yAXLSc4KIeU8SYJ4Y
         5DiO/IZ3GCIQQ5OrfuNivujp+SJ8JW+vtp/YHWCBtIei+n2ZF+7oVo759YB0Gp1bDX3A
         i1QAKuNXtHfgpn1VclVkXZBka2zAcyJctViUL/nNDRNNrT4pFTi2o3K7yi8ThJRk2FUg
         SEPuD/kKttlN95f5Kwr/YmKR2uqUulrlpOZUPhgBZlTVsSJ8yxK4cFb7YzuSBt+GSgmp
         w36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763011036; x=1763615836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVc+NaRrYJ4ZZqE5HIwBsY3M0/OOCYbazwmP6gVegvE=;
        b=Gh1WLSdq5Yo80UkwBShVM9wR5fdg1eFi+Htg3WV7RxX9XX2whk6eM/ySwXzKHC1RHf
         c2djXDSof6Dah/cpCa6jm1FPUwFM54VX1p4agbOuqF/zgUyS43uFaaalHQbSdlF0TZ4K
         oLnnGrxfRtcBqiyLkuYZQrKVpLv14GAHqriSGhrW97Ws6Be60K02owgNn6mluEKimSVb
         jzRRi6eFoqvTuxD0S6U1nhZ/0jadD1tBRRqmq0SbXu/48uaSO1reRPP+JvVaz/K08zXI
         jJ2aCiZAPwoXnrEEOG4xToeIJlwQ9cW44F4TKmslwaLDhziBoXxA/qmADA6T0y7gXZ6a
         czZw==
X-Forwarded-Encrypted: i=1; AJvYcCXAK/krJGpv7JufAhprCowJ9RwuvYYP5jhY8wCkRbDiBasL3dq4lvFEc9dMgyMPFiLIItP7akEzeRySIYer3ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2rFA0JikwEM9IMvzeAQnMuzTBmZTTdjVmcBF2TnO0SFKSAl3F
	7JS8vU1VgLYz7hu/hGsbxvicc0yqTixOJoHHAVq4hbe2zYqzDM5AhN5e6le20Ek+lZk+FPy3JZq
	ECFpNxnz0pgcQdV7MI2InBeBGY6jiKGM=
X-Gm-Gg: ASbGncvHO1Y4hZ/QrbG66YT+ImQ68f6IWxxxxgtP5ahOKAggxAtga/VAS/4Nwl6LwPG
	Inl61BNxSDgYhlBIo/HKYBTyg6CLTyxr4UWgjeAjLDC8XrrgGIlYhLWSLLebhX7Jg09lNql0+Gk
	i2fmciTeTtBNY80Xabz1CCGwJJutESb/ohikNXquTiI+8MLsqd/jzmAZ3/P5zDZdhFZBrGKN6A7
	pNVPriUkGOmjLFcRFjLq1KSI0rvC6EaDVnKH4wXd2MuNRavkrnVN1sOK+8=
X-Google-Smtp-Source: AGHT+IFFqzvTsN+kdWh5aXbVIuB/Xz/Sn3dBXBODVaqAA0egIjBhB/CfuwFsG1SK+AYHSWwDmsGSGFR8lLgy5baFIMI=
X-Received: by 2002:a05:6402:520b:b0:640:9993:3cb8 with SMTP id
 4fb4d7f45d1cf-6431a4b41b4mr5342826a12.5.1763011035635; Wed, 12 Nov 2025
 21:17:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110112947.2071036-1-krishna.chundru@oss.qualcomm.com>
 <aRHdiYYcn2uZkLor@wunner.de> <enri4affdgq4q5mibnmhldhqqoybqbdcswohoj5mst2i77ckmu@dwlaqfxyjy3w>
In-Reply-To: <enri4affdgq4q5mibnmhldhqqoybqbdcswohoj5mst2i77ckmu@dwlaqfxyjy3w>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 13 Nov 2025 10:46:59 +0530
X-Gm-Features: AWmQ_bnjom5y-sHR4CmC6-myx34ok_lfZLkzPXNlZa_8iQxi8N7EI8lvAYr6CnE
Message-ID: <CANAwSgQcMDXitA2RLbFsD_v2KoOQMcHywxcxNs-ab-O2JddAuQ@mail.gmail.com>
Subject: Re: [PATCH v2] schemas: pci: Document PCIe T_POWER_ON
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, andersson@kernel.org, robh@kernel.org, 
	manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Manivannan

On Thu, 13 Nov 2025 at 10:01, Manivannan Sadhasivam <mani@kernel.org> wrote=
:
>
> On Mon, Nov 10, 2025 at 01:41:45PM +0100, Lukas Wunner wrote:
> > On Mon, Nov 10, 2025 at 04:59:47PM +0530, Krishna Chaitanya Chundru wro=
te:
> > > From PCIe r6, sec 5.5.4 & Table 5-11 in sec 5.5.5 T_POWER_ON is the
> >
> > Please use the latest spec version as reference, i.e. PCIe r7.0.
> >
> > > minimum amount of time(in us) that each component must wait in L1.2.E=
xit
> > > after sampling CLKREQ# asserted before actively driving the interface=
 to
> > > ensure no device is ever actively driving into an unpowered component=
 and
> > > these values are based on the components and AC coupling capacitors u=
sed
> > > in the connection linking the two components.
> > >
> > > This property should be used to indicate the T_POWER_ON for each Root=
 Port.
> >
> > What's the difference between this property and the Port T_POWER_ON_Sca=
le
> > and T_POWER_ON_Value in the L1 PM Substates Capabilities Register?
> >
> > Why do you need this in the device tree even though it's available
> > in the register?
> >
>
> Someone needs to program these registers. In the x86 world, BIOS will do =
it
> happily, but in devicetree world, OS has to do it. And since this is a pl=
atform
> specific value, this is getting passed from devicetree.
>
According to the RK3588 TRM Part 2, the DSP_PCIE_L1SUB_CAPABILITY_REG (0x4)
It is a commonly configurable parameter, It can be tuned on for the
Rockchip platform.
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
>
Thanks
-Anand

I could not apply this patch

$ git am ./v2_20251110_krishna_chundru_schemas_pci_document_pcie_t_power_on=
.mbx
Applying: schemas: pci: Document PCIe T_POWER_ON
error: dtschema/schemas/pci/pci-bus-common.yaml: does not exist in index
Patch failed at 0001 schemas: pci: Document PCIe T_POWER_ON
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort=
".
hint: Disable this message with "git config set advice.mergeConflict false"
