Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013022.outbound.protection.outlook.com [40.107.162.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7203F3469E0;
	Wed,  6 May 2026 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778066759; cv=fail; b=Ok8FGi3ZuDijHgdrsQ0kie5TNd3VfJplgezSxjZUlFIP8zT3XjOFbGnA7abvLmXtwJDx9kx4kA2Uh6GoRv7vts+RYN1A/vHR9J8pazKu2kIDmuA3m/tcnyOMMLaY6ed3dxRQwf6lH66hxi8thmwu8t3jTnBWbLAqKSXt/L+/zJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778066759; c=relaxed/simple;
	bh=k+LV8GtRjUS8vynuUbTaEowbpN/RQvFQ2k4oRtf+70Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VLFEs+rLSUXuap4UZqBmFSV1SM+HMkbwRgam+2MSrZWNZLp1xq0bOu8z5blX22HHqw7PYXdFoZG/8YCXTuuKNPzVqJj5ji1zKyZ7KixQJrFDchu1kGEilbBp0pgeVYONcTqEa9o5ppXbhPBHuMK/y18ZF0PDFrFwXlHGmKFsdbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=YYDc8N5x; arc=fail smtp.client-ip=40.107.162.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="YYDc8N5x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e18trUCkbM/nFjFj5HlKV87Q1aYp9jyR8RVyHISsFHngnl0dUfJ9zEsr0gJEPlF9SOucuVi3OHf6W42ev5xTxl3fiVizhv8ITQiaVsOj2RDsal05r8n/RpZuan9Kg5vYVrxP0bqwq+2tYz8dJfPzwKcgytxL3bWcpiglLk+0CUbYvfbHmrxfDAfZPK5KdN8THVVOyt//6B4tHG49fkd0T7ZI3gpVQMAp1Uc2uvPUvzXwksG2aZ/52G2Kr90H+aDrZzhfuyHMApCTGNBKtJKAIRE/+h373wPYv2iEuc8iJKS9fPQdzVDZPTYjK3KKo4FeLo1hS1ibdiKBS65RIFxYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFTipgwf9Wfy4CuIaPDtOoRw1oUKmemLyYt3gY5wAhU=;
 b=V/NvI7puPdeWzF/xKPME47lI6X/sfyORBnQYTwRonAOozRLo3Ze7LQS55lOOCeFNsrdb6lSATzhNll60yFZwxZ0AsecOpdh8OPF65Iwn529YJFfQlis/I7B2jQlaWr4JXM03se9ZmJp9YyLe/8JdGT0jLpk5rJ9Ph+7VpK5rf3YNmwj9CVz8Qh7NcSvBs5IYdIl+UqyDRH3CGI+3Rk+aSk1oaUnUkGOWcINNgRuO0mvl3MCCNiz4sHsRkfqls7ejr0Crl27jotWMkAKN2g8zWqtpFQROFX2W69GhSV56IDzDLsSXkXRC/wbLXuglhRZDCg38WpfFRyKoIxNX/sdRSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFTipgwf9Wfy4CuIaPDtOoRw1oUKmemLyYt3gY5wAhU=;
 b=YYDc8N5xoaCjf0tM64UyOelanK5Y4jpWiYz8cmeRAovTrwN/pIDtRGMa7WoCcz6wj42Lq8+gsUMfypxW90ueiqbvRkqogXagPHGl0VgJJ2/u18P01Ze09mqcqk0iXshPAnJEy/uIwt9aWSGXXqkw9PNuGUjwopfCokYFSdanJjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PAXPR04MB8079.eurprd04.prod.outlook.com (2603:10a6:102:1cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 6 May
 2026 11:25:52 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 11:25:52 +0000
Message-ID: <ce341685-2903-48f1-8c10-6a50fe729dc9@cherry.de>
Date: Wed, 6 May 2026 13:25:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: SoC-specific device tree aliases?
To: Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree-spec@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <aRs-DaayhtQTtFXj@pengutronix.de>
 <9e14fb8e-af84-4072-b0ac-9ead882782be@kernel.org>
 <CAL_Jsq+=v96eP6V+5Ehi9EQT3iKKU7=t7kvJ-WSA+1WCHDuHEA@mail.gmail.com>
 <07ee3540-d0c1-436e-9e1d-db1952f609a6@kernel.org>
 <bcb359cf-0e8a-46ec-9f69-51c4c9e8874e@pengutronix.de>
 <6638e499-2320-41c9-b720-faf4f976e476@kernel.org>
 <34bd1a0d8e579aba0a6a88039006500fe822ef3d.camel@ew.tq-group.com>
 <dd589476-56df-4565-b4cb-e34f0d7d5559@kernel.org>
 <47903a88-8de9-4ac6-9111-c85ed1428ff0@pengutronix.de>
 <CAL_Jsq+9s7UTXU8YLsX=_z1fnc2H4PmReb+2mHx=+uuonqM7xQ@mail.gmail.com>
 <aTE_Y_JWs8kBuIE7@pengutronix.de>
 <CAL_JsqLFjF7F1eCxL8CzyitGogB0Ee7iHLGf79RHbwTpo6za7g@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAL_JsqLFjF7F1eCxL8CzyitGogB0Ee7iHLGf79RHbwTpo6za7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::14) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PAXPR04MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d2f361-1f94-4e78-417b-08deab623b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1MYnOQ7eCftJEX0iwnSJx/b9ttzMcTeXtvgE/NgIJmwY5hWvRtJI+VmXLGZ3762liHEmdVfGgMXK28CbGqykTiXsSGtRksIKC1Gl9+bVKjUPH+W05e3wPGOfskhemu39oJgaR+6Lx8uoIOGHqQNVv8l0DJ/I36VEz/QSeO4NMcjIjTHl+1t3JUtOWuSlgP/S5uSVrF6TiZN2+G1YnLBxsnBAFGT5iZAhLtG/YyxlE3jb9jpQMRV40XIMNKRMj17ZUaxnND0L61O/vm84xoj9zdVmV2KaAbueUSjkKPFLZaLFlatiVUxDtlePwP0hu4RleUD8f90hw0lspZxgJTrN1dFhwKBDrFYAzshjM5enrOAyw8hwoh9W+c2etXSBW7vjCqRushEP7YoZAhePUfR4NVQ6U86itGYHW9RlTqJZ4uNClyX48TKNO9cShzCpiBk+HdESkdzwGVn//kkNzl8ZdP8uIfr84kw41ELgzDWm/JGVCvSUJ0hG3SLNIydkslqk7YfAwXI7Na14HP2e87VV34PBF8Y0rZjwOq6ZqExK51/BymrZ9mnQYqfGhVv5vwAsO2pmEEUi5kNxUz56Yq0/MwfeSNQz7vN2DeBpK/9umpK7ysYgpCvJrcLZjG327SDkLP6UtpStVgLwC6miJfBr8PVSdK63EMsxMIvBN8Di20AdNNgoj9Dt+C0DyjGeCbCy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGJLbE5FNHVLMXNyY0tjeUVqVUdNTVV4alJNWmExdnZsR2g3aGdidVBia0tP?=
 =?utf-8?B?eWk2SDFvQjNMbTYyQVRFZ2k0WGFVaVBqczhZeDVqSktIQU4xYk9xRStDcjdy?=
 =?utf-8?B?d1doSnVSM25Dd2J6R0YwdVJ0TFVNSkNXOTFHcmJlUW1uR25jQmQrdVJtdXg1?=
 =?utf-8?B?MDRwUm9zM2FBMHFvZzJiMDlPb0QwZjE2VlgxTElPUDFySzlLNU5LcVZDMnFm?=
 =?utf-8?B?UVAxSW80VG5KcEdtZnFjVzNtSEQ2dnYwR0JFZkM4NmFUYWo3WXN2bUZFSWRS?=
 =?utf-8?B?Wml5NUxqREZNTm9nN3owUnJNaERjNlFIcGNLalJrbmJlRlFkSmJNczZpbWdW?=
 =?utf-8?B?cVAvelZGWlc3S0h5RjlLa3lNS28xTEdsUzE2N05OOHBKK0Flaml5bDlUT3Rr?=
 =?utf-8?B?WFlBWWxXakQ1K1NRN3QrZHRnQmJnY2ZZenlOTHNpVWpldWNzeDlMS2gvZjFE?=
 =?utf-8?B?NEoxUG8zWmFxWTJwVDhTT1VMaUhFOTFkMWRISXIxeGY1bUhLVEhodW5ua3hn?=
 =?utf-8?B?TDFwaEVVWHJBTElnQzd3TGJpTUZqQWo1MW1MbXd2RC9EcXpjNXBwNS9TSThM?=
 =?utf-8?B?ZWk1TG9ZSmVVbkdCdDFaZVR2ZlFTbEhOcDRTNFVhSXdUcDBUZHMwL2x3VU9U?=
 =?utf-8?B?a1NhOWtpLy8wd0F1cGxseFNQUkR0Sm4xZkFPZTBkWUdvcEhzNVY3elNmVmxK?=
 =?utf-8?B?RVNnK3UyeFBGTmhVK3UvdlpqcW5Ia3RGQ3ZWZkd5UmxmUmRYaDJTd3ZNb1BI?=
 =?utf-8?B?S2dJTy81ZXZBUmIvd1VXd2VvVGJGN1NPeUUrWjJWVktPNkxITGlFWDIvZk44?=
 =?utf-8?B?TGF1SEpzb25PUVdkTnFYWWpzZzI3QnFMSTBLUEtjUjNsNWRqczFMNzRkR3hz?=
 =?utf-8?B?WnVZZ3psdjBmVDMyWWxvbHRCNEpMdGc0NXBHdTkzQlFMQWJkSW1iUVRUUkxh?=
 =?utf-8?B?SkEzSytDWUR2MlNCOVZRRng1K3V2UW45NXV5NWZNY1BiaFp4Qkozd1NKdVdB?=
 =?utf-8?B?T1pEeFRuWXZ4Rzh4YmVVSnFFQ2pvQ0N6a21kdWxONk1FS0tiZzVaQ0ZOUmdN?=
 =?utf-8?B?UWJjR2tUTHZTYytGQUExS21HejBXMzVPWENOVTFKdXN2TkRNeHJjalRDWnhX?=
 =?utf-8?B?ZXpHbEVOOUxDRnZUTGgzYTUxUWJsanJuYlRXUFE5dUQvY0dDOG95U281c3N0?=
 =?utf-8?B?VUlYWW5IN0htdDRLbVRWR0EzanVtQWdRUU0yMjlPTzZ6a3liTHBRMnJoclVP?=
 =?utf-8?B?ZXUzWDdlMkVYSWp2VUtUUSs3TTVCczNNcW83WkxzSjBRai80a1dhUFZHaWNl?=
 =?utf-8?B?VzVZbmVQcW05UUhWdGorWTBkZWUxMmpRaXIrZGlSemllSzFRWG5RMUVZcG5j?=
 =?utf-8?B?MVFXalEwYWpMZEhOLzhwQjJSaDJMV1pmZVYwR2VMTVN3UUVMbWFoZGJtVkM1?=
 =?utf-8?B?WDN5d2lxbDVzSnM4ZCsxaHZCV2NzSW5FNG1ORy9BeExrSVRWdGgwdUFOMlZX?=
 =?utf-8?B?RHE1SndUMHdmOFc5QXg3R3hFWG9HNFVqT2VtdXlwMDlaWlpVdlY4dU5obUh0?=
 =?utf-8?B?SktrZkNoSkZJSmE1MTdtejFaSjlJTXV1aW9hL1JnSFdlTk94QWFlNXJDUXhV?=
 =?utf-8?B?VE9UK1pScFVycktEZkxIWGRSVjd2YXpqczRnekkwakQxbmJoSTBJWEhBaVNQ?=
 =?utf-8?B?dHR5ZUNla08vSk82Qi9LK01tRjc4NFRGRzZRRlZJajhWMUJuYzZtS1NxNzhZ?=
 =?utf-8?B?d3BLWnNXZ3dpV2JoMDdhUXhPUG44Sm5QVGFzdTVUWWY1bGxFNWNWYzkwdEFN?=
 =?utf-8?B?S3U4dFpiNFUrT2VvTG9vaWQ3ZnVpRGpNUkhVaERBcVFSdjRSeWY1bWx2Zlhm?=
 =?utf-8?B?TUwxVGNtMDlhVTExc2Rqd3JUaDhQT1lVVUF5Vlo5MmZVRTlVektrWnc5b25H?=
 =?utf-8?B?T0Z1aERqVlJPcjNnbmRVTW9oSEpubEMxZXFHQ1I0V3RaZXNwYWhUekxHSUU5?=
 =?utf-8?B?Qmh0T25OMUxxQk5KS21GN2lRd1JDTHZiV24vME9aVHlpUERTemV0aW4rcllL?=
 =?utf-8?B?SkVmdFVtTmJGYTUzdU1IUyt4NEE0eHNZSy9yWXExVmtZWEw5dWFJUTkxR2tW?=
 =?utf-8?B?NGJPUG4vVFc1SUxmZlZXa0plOTBUcVpNbTJaK1cvM3NUV01RZXdDTmJNYjEx?=
 =?utf-8?B?Z1VHUUY4MWYwd3U4YXhrbk5EejZIbFdOSjNhRmlUREVuL2hEazFCdHBPaUEx?=
 =?utf-8?B?NFI5SEhLL3FmeFBXeXJiUjMxdlhlYWJlQUM0bzgvTmxNKzNpMkJ0ZG1YUjhB?=
 =?utf-8?B?emtvYTBEOVdIV1lvSTZjcEM5ME5VSDhTb2tIekVzQjVxN0Z4SlB6YnB0NUxL?=
 =?utf-8?Q?WTma4SyKqIt2U9NQta40c7DWOqvwcmxiEUe5THdBiSIsE?=
X-MS-Exchange-AntiSpam-MessageData-1: KME3ooHUo83cOehfI6m7SN2mXATQc6RnHXs=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d2f361-1f94-4e78-417b-08deab623b16
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 11:25:52.3646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eeJo0bIM0ftaPbVRs2Qlc+eOzrDtIUoYLF+/Daq9tIaAV0eKXDsZY5HYRdrrD2OZmqJxMM70bGVBvEjWYD20uBHrxg8SCqJ0fVpSTiwnTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8079

Hi all,

Thanks Ahmad for starting this discussion!

Ahmad has provided the Barebox side of things, but we need something 
similar in U-Boot for Rockchip SoCs. (Probably other SoCs as well but 
I'm only involved with the Rockchip side of things in U-Boot).

Rockchip SoCs BootROM seems to be writing this info into SRAM at a 
specific, undocumented, offset, whose values are also undocumented as 
far as I know. It seems that for the RK35xx series, the BootROM also 
reports which pinmuxing was used for a specific controller (in Rockchip 
speak those are _MX suffixed, with X being the mux number). We sometimes 
discover new register values a few months or years down the line when 
new HW configuration land (e.g. how we discovered that in the RK35xx 
series of SoCs, the pinmux of the controller changes the register value).

In U-Boot we do the very ugly thing of mapping this value to a hardcoded 
Device Tree path to the controller or chip (e.g. for SPI flashes). I 
know that this "mapping" got broken a few times already, see 
42f67fb51cb4 ("rockchip: rk3568: Fix boot device detection"), 
07b5d348a6b0 ("rockchip: rk3399: boot_devices: fix eMMC node name"), 
5859bb286306 ("rockchip: fix boot_devices constants"), e8a663cc60a3 
("rk3399: boot_devices fix spinor node name"), 97de3935aabf ("rockchip: 
Fix spl mmc boot device ofpath"), 2d86ab50cee3 ("rockchip: adding the 
missing "/" in entries of boot_devices"). So clearly, we are doing 
something wrong :) (yes, a part of it was because U-Boot used to use 
completely different Device Trees and then things got renamed or finally 
synced with DTSes from the Linux kernel (which often have different node 
names or paths)). The implementation today of having an array with the 
DT path at a given index of the array based on the value in the register 
has already stopped scaling with new register values being well above a 
reasonable number (0x81 when booting from RAM via upload to it from USB 
gadget in BootROM), so we resolved ourselves to add an indirection which 
is not making things less confusing. I would like to have something more 
robust (and smaller in size) but it doesn't make sense to work on 
something U-Boot-specific if we can have something different bootloaders 
can share via the DTB for example.

The xPL stage checks the value in SRAM in board_spl_was_booted_from() 
with read_brom_bootsource_id() and use that as the offset in the 
boot_devices array that is stored in an SoC-specific C file. This is 
then used to infer the "same-as-spl" entry in u-boot,spl-boot-order 
which is used to specify to U-Boot xPL which storage medium to try first 
to load the next stage (U-Boot FIT with TF-A, OP-TEE OS and U-Boot 
proper; u-boot.itb essentially). We also insert that path into 
/chosen/bootsource for later consumption.

See read_brom_bootsource_id() and boot_devices[BROM_LAST_BOOTSOURCE + 1] 
in arch/arm/mach-rockchip/rk3576/rk3576.c, board_spl_was_booted_from() 
in arch/arm/mach-rockchip/spl.c and board_boot_order() in 
arch/arm/mach-rockchip/spl-boot-order.c for related source code.

TL;DR: U-Boot uses hardcoded mapping between BootROM register values and 
Device Tree node paths to populate /chosen/bootsource (and also decide 
which storage medium to try next for loading U-Boot FIT). This is a pain 
point and we'd like to have this mapping stored in the DT so we don't 
have to worry about keeping them in sync.

On 12/4/25 2:44 PM, Rob Herring wrote:
> On Thu, Dec 4, 2025 at 1:59 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>>
>> On Wed, Dec 03, 2025 at 11:51:28AM -0600, Rob Herring wrote:
>>> On Wed, Dec 3, 2025 at 5:37 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 12/3/25 12:08 PM, Krzysztof Kozlowski wrote:
>>>>> On 03/12/2025 11:36, Matthias Schiffer wrote:
>>>>>> On Wed, 2025-12-03 at 11:25 +0100, Krzysztof Kozlowski wrote:
>>>>>>> On 03/12/2025 11:16, Ahmad Fatoum wrote:
>>>>>>>> Hello Krzysztof,
>>>>>>>>
>>>>>>>> On 11/17/25 5:29 PM, Krzysztof Kozlowski wrote:
>>>>>>>>> On 17/11/2025 17:06, Rob Herring wrote:
>>>>>>>>>>> So you want it to be an ABI for barebox, sure, just make it a binding.
>>>>>>>>>>
>>>>>>>>>> What do you have in mind? Other than standard names for the aliases,
>>>>>>>>>> what can we check here? That a specific alias points to a specific
>>>>>>>>>> path? That would be a bit too much IMO. That would be equivalent to
>>>>>>>>>> specifying possible values in 'reg' for all devices.
>>>>>>>>>
>>>>>>>>> Binding with pattern or list of needed alias names, referenced by given
>>>>>>>>> soc-platform top-level schema.
>>>>>>>>>
>>>>>>>>> One of the points is to make it explicit and obvious (e.g. to Arnd or to
>>>>>>>>> me if I forget, because I follow the same logic of aliases per board)
>>>>>>>>> that these aliases are used outside of kernel.
>>>>>>>>>
>>>>>>>>> Just because ufs/mmc/spi can be used that way, does not mean we should
>>>>>>>>> accept any possible alias into soc.dtsi.
>>>>>>>>
>>>>>>>> I can't see how this could work. A number of boards renumber MMC devices
>>>>>>>> in a different manner than the SoC reference manual:
>>>>>>>>
>>>>>>>> - Changing the alias numbering is an ABI break, because Linux derives
>>>>>>>> its /dev/mmcblkX numbering from it
>>>>>>>
>>>>>>> First, why the alias would change? Isn't the board following the SoC
>>>>>>> numbering in 99.9% cases?
>>>>>>
>>>>>> At least for our TQ-Systems boards, we have a convention based on usage (mmc0:
>>>>>> eMMC, mmc1: SD card; serial0 is often the console) rather than following the SoC
>>>>>> numbering; that is, we're using the aliases as a form of hardware abstraction
>>>>>> rather than hardware description.
>>>>>
>>>>> Huh, does it even match numbering on the schematics / board / user-guides?
>>>>>
>>>>> I would prefer not to create bindings purely because some existing DTS
>>>>> code is not matching our expectations. However there could be a case
>>>>> where board numbering is different than soc number and we want to keep
>>>>> aliases configured for board.
>>>>>
>>>>> Basically what you propose here is the discouraged instance ID disguised
>>>>> under one more 'alias' which is not really alias. It's just an instance
>>>>> ID. There is no other use of soc-aliases beside instance ID.
>>>>>
>>>>> I see the problem you want to solve, I agree it is worth solving and I
>>>>> agree that DT is the place for this mapping between register value and
>>>>> device node. However solution of discouraged instance ID is just...
>>>>> well, discouraged, so not optimal. I don't have particular advice expect
>>>>> a dedicated property for each device in such case.
>>>>
>>>> How do we move forward here? I don't think we can change the nature of
>>>> /aliases being board-specific now without breaking users.
>>>>
>>>> Does this make the addition of /soc-aliases (or /soc/aliases?) more
>>>> palatable?
>>>
>>> No.
>>>
>>> Thinking about this some more, I'm not sure that something aliases
>>> based is even the right approach. Let's back up to the original
>>> problem instead of talking about a problem concerning a possible
>>> solution.
>>>
>>> You have a platform specific register with values (or from 1 or
>>> multiple fields) that you need to map to devices in DT. That's it.
>>> That could be solved like this:
>>>
>>> bootsource-map =
>>>    <0x2 &mmc0>,
>>>    <0x3 &mmc1>,
>>>    <0x10 &spi0>,
>>>    ...;
>>>
>>> Simple. The first value is platform specific. Maybe it is several
>>> fields (e.g. device type, instance) merged together. Doesn't matter.
>>
>> That's an interesting approach and I like it.
>>
>> I am not sure though how the platform specific value could be composed.
> 
> It's platform specific, so however it wants and not my problem.
> 

We can always have a constant for that so that it's meaning is clearer 
to the human eye. After all, we also have GPIO_ACTIVE_HIGH flag or 
RK_PXY constants for pinctrl pin numbers. I'm thinking the first value 
in the array doesn't have to be related to the value in the register(s) 
as that may actually be quite complex to represent in a stable manner in DT?

This is honestly the best suggested approach so far to me. If we really 
want to, we can make it a bitmap as well, such that multiple bootsources 
can map to the same device. I'm thinking Rockchip RK35xx series having 
different values for the same controller with different pinmuxes (see 
the BROM_BOOTSOURCE_FSPI_* enum in 
arch/arm/mach-rockchip/rk3588/rk3588.c), so that could also be handled 
by the bootloader with its own mapping.

>> The easiest way would be if it maps to some register values. This works
>> well when there's a bitfield with only a few bits which specifies the
>> bootsource, but not so when there are many bits. On TI AM62x for example
>> we have 4 bits specifying the primary bootsource, 3 bits specifying the
>> backup bootsource and 1 bit specifying if we are booting from the
>> primary or from the backup bootsource. This means we have an array with
>> potentially 256 entries with many holes and many different values
>> pointing to the same bootsource. We could reduce the number of array
>> entries by specifying a mask for each value. I am worried also that the
>> initial contributor might for example forget about the backup bootsource
>> and only upstreams primary bootsource, so we would have to modify
>> existing values for the primary bootsource when adding the backup
>> bootsource.
> 
> It's a map, not an array so there should be no holes. The entry index
> is not significant. In this example, the platform just defines the
> cell as:
> 
> <primary_or_sec:16><sec_source:15:8><primary_source:7:0>
> 
> You could fit it all in 8-bits, but I spaced it out in case the next
> SoC needs another bit.
> 
> A mask value would be okay until you have 2 different registers and
> then you need a variable number of cells. And then I could imagine
> someone will want to define the register address for each cell in the
> name of a 'generic binding'. That's not what I want to see.
> 

Yeah, I'm not convinced this is future-proof either.

>> How about only adding the phandles to bootsource-map, like
>>
>> bootsource-map = <&mmc0>, <&mmc2>, <&spi0>, ...;
>>
>> New entries must then only be added at the end, existing entries must
>> never be changed.
> 
> That would work too. Then you just have the index to register value
> lookup in code. Doesn't matter to me too much. The only downside I see
> is having to enforce that people don't try to insert entries in the
> middle.
> 

I... don't like this.

I've this nagging feeling we'll have some DTSI later removing entries in 
that property. Think a new binning variant of an SoC which removes some 
storage medium controller. They are technically mostly identical except 
I cannot have a phandle to that medium controller from the highest 
quality binning because it's not available in the lowest quality 
binning, therefore we need to remove it from bootsource-map. N-th index 
in the array means a different thing depending on the binning. Yes, 
technically it's correct, but now I need to have code that automatically 
detects the binning at runtime to then map the index to this 
bootsource-map property differently. Or have a different bootloader 
binary/DTB for that binning, which we don't necessarily need. And if we 
somehow discover this later because it was not told by the vendor ("oh 
yeah sometimes it can be there, sometimes not, so we only guarantee it's 
not but maybe you'll have it" kind of debacle we've had with the 
RK3582/RK3583 for example), then this may change.

I'm also not fond of SoC-specific aliases, because they'll end up being 
confusing to the user I think: "why are there two mmc0 aliases and they 
don't point at the same node??". I somehow am also not convinced that 
the BootROM value will necessarily be related to the controller instance 
number (I wouldn't be surprised if register value 2 means mmc controller 
0 and register value 0 means mmc controller 1, hardware people are full 
of surprises), so the order of appearance in bootsource-map may not even 
be mmc0, mmc1, mmc2. Or if it is, then we need a mapping in the 
bootloader for "mmc0 in bootsource-map is actually represented by 
register value X" and then enforcing the order doesn't make much sense 
except avoiding to break the ABI.

I couldn't think of anything new to suggest.

I'm reviving this thread because it's been 6 months since the last 
answer and I'm not sure we've agreed on how to go forward. U-Boot and 
Barebox both need this, they both implement it their own way that they 
don't like.

1) I hope we've managed to convey why this is needed and that DT 
maintainers agree with adding *something* to the DT for that purpose.

2) Format of the property needs to be defined. I'm leaning towards
bootsource-map =
   <0x2 &mmc0>,
   <0x3 &mmc1>,
   <0x10 &spi0>;

(possibly with a bitmap for matching multiple BootROM values to a 
controller within one entry in the array instead of duplicating it; 
possibly with constants instead of obscure hardcoded values like above 
(though that isn't relevant for the Device Tree spec)).

3) Location of the property. Is /chosen agreed on? A new child node in 
/options? A new child node at root node?

Anything else I'm missing that needs to be tackled before one can send 
some patches to the spec and/or Linux kernel DT bindings?

Cheers,
Quentin
