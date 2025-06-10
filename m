Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00BB21B909
	for <devicetree-spec@vger.kernel.org>; Tue, 10 Jun 2025 14:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749567127; cv=fail; b=ieSIkWSeG1sL8YliwGZsENolrzOrrxgR5vjClNoIbAGOZtluq7ZqQp+n64E4SnJ3BjkjTYs0UgFc9r0QICq8atVlBLxID7sRWQleJFilkReF7so+Zl9FIO8T3REX14BRjb0jBUj+G4OrH14a50RtiAd7CVM/uziVMsJZSIXaYlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749567127; c=relaxed/simple;
	bh=xzcLFZl9/CQvhATprc5p8H2k+2hzkp+2Wc4A0OhigDs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ej0/SX86WQpZL4MDBM7XrfU52imi/h3djdYn78tiO0JJPtfvW2Nf40EFAABmV7WLcYPz+6YToQbYrl+6knPq/OtHPi6IPwhvtnHTaWOqPefpzgQxJ40++GrqjSTR099OS3RYO73IXANzNqhL4jYXChUTZTJsi8JOWqkt3Wuyrbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=RH03rNoU; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="RH03rNoU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzqmiBooK6bPXmfdOvuVvZCPdOWRpEBe3H2BK0ysX/yzMkcQb6q98AwWtSSaJdXl93OPYxu/wu6VKBUwTEu5qmk8y5jLHhv1IbcHKw2lbDzs+0CMcMB0kCjIZ07aCFFNdK06t7TZojR71EbDEiyf3jaxzPOC3g/SgzYmd5+4UNMZfAHKL2jiDxpJwYadBHT7bRkWsFlUgJ4siBfupRDZP+BVr4lo79K3zHDo26BjLf/qG4nzcBIZbRWgG8U7kl+sGrmoXvRZyaOgPflhhICJ3eHo2XAcXbpnxt4W8rDdcOQHJ5OFni0kCCBej74RyXNDPkrg9YEcU80ODHB3rJ7Lew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAcwKBWTO9JEKxaf8zFOb2Uy0WLLbKMQg6Ta3FwY+x0=;
 b=Cc3cpP3Jhh1R3Fk6d4XB2lEcJ6e2V/S39av4sU+Ov3hbylTZOAEr5Iflwun5PfjxAiO0aVS1JPpcYTN+KJdM5ecuCm1gzIDo/c7vvt/njEVg9P5hBljXciWDPYAQo/Kgycl8PJbTxw9tgBNdWlVdaxZnhANj4IIjSmrBJm3zQ6oB09x5TlFPVfR73Ec4s1z8TrCLQtHd309dm5B6HIaYqaky1i5GOJ3XwYpwpwFVanD0/l+WylfRGNsdlmjOYs+EAIgABzBOAqjr5Xk9NC3qZCK9Hjx40ZkQgY4CE2mk0hxhi0shpTFM9eJsJcwbwfV6pGQqf2mG+Jp/B+7YBoMKSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAcwKBWTO9JEKxaf8zFOb2Uy0WLLbKMQg6Ta3FwY+x0=;
 b=RH03rNoUyNSR6+U8X/seYp8Pow1xrA+zvJp+kX2OK/vRiMU7n/NU0ipWH+hAbW64vT++mxb//szHNEk+ra5v4mxYvGKPl6pD9YdFlvFPq+QkxtDNYbSma+WiRxTFzlq91izzRPrlcQ87HoTNUKToCBh4IJN76+XtpBfCeWZpeGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8400.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.32; Tue, 10 Jun
 2025 14:52:00 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 14:52:00 +0000
Message-ID: <2cf31fef-5247-4eff-ae34-3c9a95824423@cherry.de>
Date: Tue, 10 Jun 2025 16:51:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Add 'bootsource' /chosen property
To: Simon Glass <sjg@chromium.org>, Quentin Schulz <foss+dt@0leil.net>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Daniel Golle
 <daniel@makrotopia.org>, devicetree-spec@vger.kernel.org
References: <20250505-bootsource-v2-1-5a315d9bff26@cherry.de>
 <CAFLszTgdhQHoKLaOvAHcvYatjS3dkSNuy_sr-VxQHgpr88GGRQ@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAFLszTgdhQHoKLaOvAHcvYatjS3dkSNuy_sr-VxQHgpr88GGRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: LNXP265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: c97927b8-9e36-4313-645a-08dda82e5ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3ZkckgxZEhUa2praUNIZkVBYUovclkzYU5pYjZMcmtxK0ZiRkJJQ0xyYnhO?=
 =?utf-8?B?NHE1bmkwVW8yK1o5Rkd2K08rb2J2bnNzRDFFRDJhV2IwOGZZMTZZVVZQRWRT?=
 =?utf-8?B?Y1cvemRBWkxiV09pM3ZTcHJIMFcvaGNoVkVCVW5ubVNYd0JMUHgwY2hiZWJ4?=
 =?utf-8?B?SzlDbDNGa24wd3JOSGdjUkZjczBHV0FtZmlMTlZ6MVNQdjJOdzVHT09FajRs?=
 =?utf-8?B?dmdBdEpJUDFqL1pZaE5KREt0YVdpU2JSOG1yTEt5dERORm9penZqRTdMVEpp?=
 =?utf-8?B?cXBlZ1d2Wjk4eHN5cER5bExGcnFIZEJFOXdmNnRpc3ZwVE55NndZM2xyQWRp?=
 =?utf-8?B?eWJ2V0J3RWpUR3B6QXdrMklqUWduVzBiVHgyc2VBL3BNQzNJYW5jZjJSNE9w?=
 =?utf-8?B?dUZ4Y0grbVgvWmU1S1F4T3orTUpZK0IzU3J3RXMwNXVtV2hDS0Y2S2VQbVN0?=
 =?utf-8?B?T1BkbnRMempKZnhtdXBTUmdPVDltMDFoVDFDS2duY1RPU0lkQkZlcUhyS2lS?=
 =?utf-8?B?UzBEMXZvVHZ2THJDdzM0LzVJYzJ0NDlvZTV5YklNSUJJZUJxdnVBWm9HVjdl?=
 =?utf-8?B?WDBBaTdCZGN0enBTQ1ZCc1ZGb1h2RU9OZi9QYmJRS1BUMTRVSEFiRE1GaWt6?=
 =?utf-8?B?aXZwNEtoRUtQR0JSUXpYVmVGN3ViT2l4QVBXdVBKQldhVnpNUkFzODNNcnZY?=
 =?utf-8?B?ZmR1b3VVVENGVDR3RExuOTVOTWFjSDR2clUzcENxekx1TjBNYnFRU0F1blhH?=
 =?utf-8?B?ZjdZK1lvSDZ0cDAvYlJ0ZnUxalN2cXpzVWJzejluaWs0Q21DQnRJbzFEWndw?=
 =?utf-8?B?SStMckNCMHlmckV5NGVqNlpPaVoxOVZVR04wb3NCNXI1bkxmendIcURGRzA1?=
 =?utf-8?B?SHI3RVdIK0RVb2l5NjBsMnJ1SWNpaU05R2UxUDhmY2c3RnduMFRQQlNTdUhx?=
 =?utf-8?B?a1VTY3RrMEd0WEFCNmsxcHhBQU9iOVVRUmpSanRxeWcrNUJxUnFtMk9lL2dD?=
 =?utf-8?B?QkFNRkRTWktoQjlLaEVQUUVzS05wTDAreEdTN0s3OTdSOVJRNGZqNDFwRW51?=
 =?utf-8?B?T0wvYUgzZ3BGUnB6eXo1dEZ6a0hlZGZxRCtpaDBvdlZSZTBudFhScEtBdHV1?=
 =?utf-8?B?KzlVTHZGc1h1bkJVWFFtZHI1SHZKT3FSSEFlOElMNnpQd1dFSkxJRlNSUTNx?=
 =?utf-8?B?ZU96UnBzelVWNzRaT1BNelVBR1hBdUhDUlYwQTZpWnZwaG1NOGxUR0FCMjJL?=
 =?utf-8?B?UTIwS2xrOHNuSldyYWs4TDVjZTltRVhRS0pJdXppWVVxT3kwQ3FZamp1RFJo?=
 =?utf-8?B?a20xQjZkUjhHUW80ZCtJT1p6RmhDN2NHVGw4UFVsdXVJM0kvWEZNNVNUZDkv?=
 =?utf-8?B?WW5Md2xRYTRTUDNBb01ZTnR1bWlGUmxHalZmU25yNllCMkoxN2pJTHdhZVJw?=
 =?utf-8?B?Y2o0VVFjTlFNTmtWa01LTWFoL002b0lTRkhORy9EcHY3QVhIUVp2ZFpBZk1p?=
 =?utf-8?B?WDEyano4S3UwcGpMY0NqRjNHYXY2VHNCL01jaXpLbDg1SDBZaFBRbHMrWjFQ?=
 =?utf-8?B?SGNzY0ZCeXpQSnE4L1ZNY041MWx0MGNnWEQ5d1Y1dW9uS1lqWkZRZU1kd0tF?=
 =?utf-8?B?Z3poWllWbWV6SVFnKzFuSnFtMFo3b3JBTHBpRHliTGVrY1dxWk45RGx3Sldm?=
 =?utf-8?B?NWszQkJpdlJkOGRYTVJEb3lQUW1BT0hZbUlnQTRZWVZVbFMvaWo1S25MemdQ?=
 =?utf-8?B?NUlZQlZSdVZlbmk1cHJDV1MxR2xudHdzREVLNnlQNVduMWkvcGJQeDd5L1pj?=
 =?utf-8?B?Q1V6RE1xT0tZbE1RaGRLcXpaVVltalQzUVN3YnZyVVBEQVhNZmE2WGJFa0VX?=
 =?utf-8?B?TmJycEEvRTRKL0tuRmVUaXorT3BwSmlaNFNHbkltVDJMejdLYTd2dWM4ZC8z?=
 =?utf-8?Q?bdef2C/B66E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0pBYmtRWUo2andBTm1pRFpRZWp3QWlzSDI3VXlzaFFXcW4vSXhWaGdZenNG?=
 =?utf-8?B?dlFHQzNHbnFIdC9lZzB2UFFrTk8xL1NyanBaUE9pRXk0RTFKaDhTSFRFUUlN?=
 =?utf-8?B?N0c4WUNFdWZDUTNieGZ2bEt5cHFqU2RyQWtURGNUTHdpdHc2VDRmTnk1RHEx?=
 =?utf-8?B?REtOTm5jTTFQYlBEbVE4VkVLb1RvV0lxK0pheUdZM2hLVWlQTFE0clVpNi9R?=
 =?utf-8?B?SWZPUjBLeUF0WjNjbFpOcXZyTnBpdTZZSnBhWExCOXMvcis2TlhtdGxSbUt0?=
 =?utf-8?B?NC9XSC92c1RpRDc1NUhaSjlzV0t6cTRVV2ZOajBab0pHbnBGZ1RsSzBjWHNz?=
 =?utf-8?B?NHBvbzNqWEhpVC92UDBNMUJUVi9SdHRMLzBBazMwUlgvbXVxYWJnZFZjeDZ5?=
 =?utf-8?B?TkVQdjVYNFZOVTNxWUFJbUkxb2Y5T09rdDltSjZFUlVZc3BjRmxCdXNzMTJt?=
 =?utf-8?B?VXgzaGN5ZlluSm1TWDFsallLcWZDRFYvbEhaR3d4eStib252akRXb1FtV3pI?=
 =?utf-8?B?aUV0QlMvZVlUbFpnS1daNVFQMUVuM1d5Qm5ZUjNQUnJnd2pOcWhpUFRCMTlC?=
 =?utf-8?B?RUd3QmJMR05XSnZNMWNZeXljOGtlc3d1S1JnelpSWTBScTFjZGE1S0l6NVlv?=
 =?utf-8?B?TTFhei9jdWp6WFh3Z0RkOE8rY0UrdW5way9yb1YwK2NGL1h3UjVZbks3Nmxx?=
 =?utf-8?B?VisyWHRiM3JVQnpVU05XMXBPbENpZTVvUWNJUVpkbk54UUZXN2tlR0hDcG0x?=
 =?utf-8?B?TTlEeVFqTVBzck5nWGgxa1FEWUZkWXlMN3YvV3N5Y3BiTXk4bExIb0EzczhI?=
 =?utf-8?B?UkVZdUtTd3VFVXdZRGg0bEhxTEdVYVhEQXpyLzBaVU8rWU93TklJR09sZ1N4?=
 =?utf-8?B?Rm1ZYmtHSUdEcDZmQzR2QkRXaG1UTkJINE5menpHN3FhdDJSbzBtT2FMQVdu?=
 =?utf-8?B?UEIrTEhSRmQ4TW1xT0xWa1VneVRnRnhjNFJEc1BvSkVvbnpTMWRMbExjNUNY?=
 =?utf-8?B?QXRnR09HK1ZmTkVWTVlza25xNERlekpyMkNjY2czV01WRTMvcGVhMXhvNDd5?=
 =?utf-8?B?VjBNcWkvdHE0aXR2cHcyVnA5QXVKR21mRzBHSVpWWXkramRNc0taOWE2UUtY?=
 =?utf-8?B?QWlNS1FybEZiZGYrcHdDajlOdkFGU09DZGc3elFwVG13TFhmS2RaOE1SZUhm?=
 =?utf-8?B?NmIyR3FQWUtSQ2t6S0xza2JHMlVaTHdvSUc3Mmg1SU5QZnNKeGVRdG9BUmNp?=
 =?utf-8?B?VjRMTllDVTNkR3FmZGY4bnA5QXBCUzBnRnhYNmRreElnV2hwb3ZQNXhMR28z?=
 =?utf-8?B?TlBvQmJiOWIyZ0FNdS85Q01yVEFPYm9KZVJwaVdiMzVYWEY4ZW9JNlJ4M205?=
 =?utf-8?B?WnBVUmFwQ1pPd1Y3RXdJeTZRNHJHS204TUdNSTBvbStLY1h5dm5ZS29md2Y3?=
 =?utf-8?B?NkpETHoyTUFtTXNsUWNCVnpXTlE4ckI2aEpKZjE4aTMrYTZvcEV5UGxJOXly?=
 =?utf-8?B?ajFhbnpjNzRGbmZ2cnFsRDR5aFpqZ1d1WHdsc2lQdmFVNlBVUG1EZDhiZndn?=
 =?utf-8?B?SDlzVlU5R0VmOXUrd0ZIVTNHdE02QXI0OU5oSEhSQ0l1QU15eE9NZS9OYTBM?=
 =?utf-8?B?OWIvSm5wWmJ0YnZueWp1ZHJMZlUzRkgreDV3bWw2azFaSW5nMWEyNDVSNThK?=
 =?utf-8?B?WUo5WHo5bXBJcFNHSGREYWNJMUV3Qm1XQ3pRTU1memYwWmQvalkxM3pOVzJM?=
 =?utf-8?B?VTY2RFkvRzd4WlZSTjluMnVNek03QWI1UzdocTNRZzBtVlI2RGRmU1pzVXp6?=
 =?utf-8?B?Vjk1NkdNRllMMzFLYXNBb3JraXJzakJteFVIaEc5Wkwybm9XUlpmMFMrZXlx?=
 =?utf-8?B?YVNjWE0vaEtlemJZYThrMDRvU1hqLzJ1YWNBeU9hTVBoSWpYanVpbTRCQmhC?=
 =?utf-8?B?Ym1tOVM0OVU1Qk52N28zN21KSEROU1NTTFZGQ3JSYWZwRW1KK0o2a2d4S2xV?=
 =?utf-8?B?UE43WTdNNkdWQlZjQVdqZUhKdVZxM2x0akhGU3ZmK2hXK1Arelo2UStUelli?=
 =?utf-8?B?Uy9sbmdYQlhxbFk4UFNVSkFRNXl0UUFIQ2JWUnVlMHVHSldPRmJ4dWRqQlcy?=
 =?utf-8?B?ckhOMUc0bHdid2pPQUVZaEF6dEc0RHoyRzh6UXo0QjRwZno1QXhNMFk5dXl5?=
 =?utf-8?B?S2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c97927b8-9e36-4313-645a-08dda82e5ad7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 14:52:00.3835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNi3Y4BixlM9dtLJksqtZcwfuZCTl+2/70liIzK+kHMMRT6LfzP1YMcJA+bO+HBKX+6AJaJapmA77g/OjxaGVZARdb8AAbrOfIG4uTe71s4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8400

Hi Simon,

On 6/10/25 4:26 PM, Simon Glass wrote:
> On Mon, 5 May 2025 at 09:34, Quentin Schulz <foss+dt@0leil.net> wrote:
>>
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> Bootloaders typically can be loaded from different storage media, such
>> as eMMC, SD card, SPI flash, EEPROM, but also from non-persistent media
>> such as USB (via proprietary protocols loading directly into SRAM, or
>> fastboot, DFU, etc..), JTAG, ...
>>
>> This information is usually reported by the SoC-ROM via some proprietary
>> mechanism (some specific address in registers/DRAM for example).
>>
>> It would be useful to know which medium was used to load the first stage
>> of the bootloader. SoC-ROM shall be ignored and not reported in this
>> property.
>>
>> This can allow client programs to detect which medium to write to when
>> updating the boot program, or detect if fallback mechanisms to
>> unexpected medium were used to reach the client program's execution.
>>
>> In cases where a boot program is split into multiple stages (like
>> U-Boot), it only represents the device that was used to load the very
>> first stage (in case of U-Boot, VPL/TPL/SPL whichever is executed first)
>> and not any of the later stages (in case of U-Boot, TPL/SPL/proper) or
>> any client program. They may match, but they may not and this property
>> is meant to only represent the device used for loading the very first
>> stage.
>>
>> I have a board running U-Boot which currently has 9 boot scenarios
>> (eMMC/SD/SPI-NOR for the first stage, eMMC/SD/SPI-NOR for the next
>> stages; not counting USB loading yet, which would make it a few more). I
>> cannot force the BootROM of this board to select a specific device aside
>> from erasing the other media.
>> The only way to identify which device was used for the first stage is to
>> parse U-Boot first stage console output or add some custom logic for my
>> board. To validate that a new version of the bootloader works, including
>> the fallback mechanisms, I need to make sure the BootROM loads the first
>> stage from the expected device otherwise I may have false positives.
>> This would be useful for automated testing.
>>
>> I could also very well see this being used to identify where the first
>> stage of the boot program is stored (which may differ from where the
>> later stages are! that's the case for U-Boot proper for example!) to be
>> able to update it from a client program.
>>
>> Note that Barebox has been using this property for a while already, with
>> this very content[1].
>>
>> This is chosen as a string so that it matches other properties in
>> /chosen (e.g. stdout-path) as well as allows for extending it, in case
>> one needs to provide additional information (e.g. HW boot partition for
>> eMMC, a specific disk on an AHCI controller, a specific USB device on
>> a USB bus, etc.).
>>
>> [1] https://lore.kernel.org/u-boot/0066fcc2-3431-48be-8dc2-00ea7e2550c2@pengutronix.de/
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>> Note that this property is already set by Barebox and I'm planning on
>> adding it to U-Boot as well, specifically for Rockchip SoCs.
>>
>> I have some doubts about the wording, especially in the case of
>> hypervisors or chained boot programs. I'm not entirely sure what would
>> make the most sense to put in the property for those scenario.
>> ---
>> Changes in v2:
>> - added usecases, non-usecases and increased verbosity of the definition
>>    of the property name as requested by Simon,
>> - Link to v1: https://lore.kernel.org/r/20250205-bootsource-v1-1-95f4ba69ac27@cherry.de
>> ---
>>   source/chapter3-devicenodes.rst | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> Does this need to go into the schema as well?
> 

Considering this should ever only be programmatically set at runtime, 
I'm not sure this is necessary?

But taking into account that u-boot,version is part of the schema, I 
guess this could too :)

Cheers,
Quentin
