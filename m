Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011038.outbound.protection.outlook.com [40.107.130.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705CF1E9B35
	for <devicetree-spec@vger.kernel.org>; Tue, 25 Nov 2025 16:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764087368; cv=fail; b=BMGWsTviTdhIQgWGVkM2A9XxQQw+OEXRsp5ANCp++55WHI+sG0m8OsjZUy01JPuaFZIGXtY4AV289Q71lvS1Zt8KTkz9p1jYu4/263SO8uxlHcCxkjo/OjVk/t8+r6d9OKIUvUaroaFw9dUIt/Sq2/zeAInCa7EeAXw8Z1iDru4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764087368; c=relaxed/simple;
	bh=qBmRw0Xng/0M0Inklnd355dnvR8CbRS90PUlp84mTgA=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JMRQOnefi0/SPGrwX54WtGIahPUzmVfhAUtkqK92Qw4YClOJVvydXw43eTgBOAuiw9cFsZTCq5eilJTDl2Oz9cl24VwLG3rmpiagOPnjRHnlvNEeXJCczUdFG2fQXCA8Oz1NQUNnEsavz6uTjTTqLNp3pFoxQon04GO52ZS4aoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=N3gXVwhC; arc=fail smtp.client-ip=40.107.130.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="N3gXVwhC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftg+wFmkBvPZjkJbngM236HyMNh4pEDiaa/cYpmcJDTAH7CVCpR20NakX6IkvxyO+CaqpAXjV499Y2VYXdRfHM//4X58KGdghSOteHSGAMVjmvUot9UXu4w5o5eFg0fwx/OosiuN6tBlad8P0QfxXDERn9NwT13XZFfUCViz4Z/r5uVyatz72em8pkMSCD0scsyFu/yVzdJPXilrbgDpuPQm3l/aOkYwmFkdy8YJsb9eMWaCWrrL1emrUvKbNAyvg8CsXvS8D5Z7OFIRu+arrZaIrxlgi5raT6Mzu5pqyflttUaZvG0lgD0FmH9YBDYyXHNtxHHZpoZq7QvP1PgmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HasZhwb5uSkh16PwE0l06Q3xhPx/bkxKtpomIKdiWM=;
 b=S9UtiKxdyytQjx+mzBfP+H8UL9mvqZhB48vCMrmNtj0aUeu7mSTasBSrskkD7d5bPuQ/Pw/ptjP6SUSKt9cIhq2m5XchleDdC1kcZ5/TDQJvTG4lSw2+E8TcRPrNm3HrAEVMrJy/U0aT5ScepTvTTXpsCm/Rx/dCVZu5TjD0X2rvwHnu6u4N4QUHmj7/B1K8mlJVZpYKok17biHqkIuTk0w0qW36iuaHCHD89SY1ssaCyr9gCdzJ4a+6drllprf4RM9j/5sYI/XLyXK0FCOQcQWNW1suhmmrsbXONaEEBYrqHifG+aWV+7SVHr0lUjo/o4G94tFTfFOpm5UrwsoGKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HasZhwb5uSkh16PwE0l06Q3xhPx/bkxKtpomIKdiWM=;
 b=N3gXVwhCZcsupSDdtXLI/EpPY8R0o9ut+MHLQFk2/Vywlm804uU0Pz4QMVZO9pbsZy2f9KejJy5vrgO48vBJ1DV+8N2k9xFiDBIIKoQa94DANCfE1f1otjiFDpceVeG75ZqXXL6G6TsOPczwjPRU8Fdxh/BPAE4Dh1psiqTcJpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DUZPR04MB9846.eurprd04.prod.outlook.com (2603:10a6:10:4db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 16:16:02 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 16:16:02 +0000
Message-ID: <acd2308c-baca-4866-87b2-78bc209ace9a@cherry.de>
Date: Tue, 25 Nov 2025 17:16:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Add 'bootsource' /chosen property
From: Quentin Schulz <quentin.schulz@cherry.de>
To: Rob Herring <robh@kernel.org>
Cc: Simon Glass <sjg@chromium.org>, Quentin Schulz <foss+dt@0leil.net>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Daniel Golle
 <daniel@makrotopia.org>, devicetree-spec@vger.kernel.org
References: <20250505-bootsource-v2-1-5a315d9bff26@cherry.de>
 <CAFLszTgdhQHoKLaOvAHcvYatjS3dkSNuy_sr-VxQHgpr88GGRQ@mail.gmail.com>
 <2cf31fef-5247-4eff-ae34-3c9a95824423@cherry.de>
 <CAL_JsqKE+J3aF-tCEH=xwvvKL+K3a9Cp=db90XEYYFhzeae9Vw@mail.gmail.com>
 <e363918f-2caa-4d96-9cd7-0098d36ab778@cherry.de>
Content-Language: en-US
In-Reply-To: <e363918f-2caa-4d96-9cd7-0098d36ab778@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DUZPR04MB9846:EE_
X-MS-Office365-Filtering-Correlation-Id: c11d6250-198b-4fe7-fbfe-08de2c3ded45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnNUZ0NvWTV5LytsNmxNdGlyblRSMGI3U3lmb3hDeUh6bkhDcXVaTm8zZzFZ?=
 =?utf-8?B?cy9TME5QRi93SVFGZTdnL2RYZkY2K1lFVXdmbVB5cHRDR3AxVzNwUzBkaWl5?=
 =?utf-8?B?Ly9HU1RwNE8yY0NTR2xtVnFYMXhMa2R6WFJOU29qRDZrQzNWN3JqZFdDaThT?=
 =?utf-8?B?eGFJMkVVZk1WRDdjdmNhK3F1aHlxVnF0SWRJT2JhY0x1NHRyWi8vT0tuVm5j?=
 =?utf-8?B?NzVBRUpoR3ljbnBjR2FoZU5ROHJHTGN3VFoyZncrVVZrVWQvMXVGMGZ0N2s4?=
 =?utf-8?B?WlJpQXFPMGpBVFFkdlA3aTAyaWNxMHh2MGRtajhxUVFPU1NFcjUwUXpmOFJZ?=
 =?utf-8?B?Ym9lMUFVYmVMTWZPb2tiY3c2OTFPNlJXdW1FbDdkelMxU0RqcG5mNE9DZnFp?=
 =?utf-8?B?dVRVdnhWMzh2TWVoUUxRYjdDRTBBYlJRQ3FjUE1HYXZ2akd2SWRTM1hXR1hC?=
 =?utf-8?B?aS9jdDh1QTcyMllsMnlFS2dUUzZweGw1L21NZWNHdWJvRVhEbitQemUwemd2?=
 =?utf-8?B?UklWdkw4TUljRnlwRjFGeFFyZGUxYSs1blBQWGRSaEJXRjNWMDljZzRjTGFz?=
 =?utf-8?B?b0U5NVhCLytLRXhsZUc2blNudzhPMWVHWlZnYTlKZk1WNlduWkJnS25xMmto?=
 =?utf-8?B?ODhBb3pwUkZIM0p2YzVmek00UFZEQU9JdGcyanNLWmNxSHUxZ1N4eTZNa1kw?=
 =?utf-8?B?Y0wyYmhXREFxQVp6eWF3VHp6Z2NtUmw3NFFPRzJOcGNqdEdJNUlwSXFuZTVJ?=
 =?utf-8?B?NWhZNW1vT0l0a2VTdXljOEhkZTNxVTZ3aWF1RjA0M2psVTNlendmeGxOVG5C?=
 =?utf-8?B?dFFWT01xdGhMdElZV2Y3U3dDT0greDhsLy94UjZTNXp6QjJDZEs1R0d2VnVD?=
 =?utf-8?B?OHczN2dTL3dVd3czbVdvNkpvMTdWbUdIN3VHQkZwZElUZE03cGVmVndCYi9W?=
 =?utf-8?B?ZHNvbWlYVEt1LzVPblMwa1hua2F4dExiR2VWOTNwZU91TTdOQ253L0taSHdq?=
 =?utf-8?B?MEJXd2RMaXE5c2VJWXAwdUV5Uml0OU9LYS9RZGE5V3hqM3JTbndkaU9mWnI2?=
 =?utf-8?B?ZDR6WlNPakJkVHdYdmxUV0lKUmVHSnFadjBWSnBFS2dqcjZBVjlxU3REUHJw?=
 =?utf-8?B?dUdEekRDajNzMzZCTFI1UDdOUkhDNmhYNHhBVWVCdGV0cUdTQ29RcHFGeTFs?=
 =?utf-8?B?WndrcHRVRVBNaVV2RGJlcEhWM1h1dTNXZ1QxOUhXRFlHam5rcjdUV08zT3pu?=
 =?utf-8?B?bUJ5YVFVQmhOK0pHQVVXRi9SSFh4Snhqd2x2VnJySHQxdWVLeWxwbThwMjJI?=
 =?utf-8?B?cm8yRDhScFBaaHd1RkxQTHkwOTZEVzg5VTZLWWVsTVJyeUdJb2RsTXg2Uk5v?=
 =?utf-8?B?REowNUUyUEpnK2hMcXp5WEVuNGxrY1ZidXdac1hOMUp0Y003SmlEYlpEYUI0?=
 =?utf-8?B?QTdNcUZ1elZqci81RzBKeWdlYXFxdlF4U3dRelE4a3lWcmFPejdhQzZvSjBx?=
 =?utf-8?B?WFBhejZRWEpMNkVZZDhOa0N4YzJlZUZtT0paRHp1N21xcHZMTU1hN0p5QTUy?=
 =?utf-8?B?RDFKb0tNbFYxQWl5SE02d3FUYjU1d096VUh2cDBxR0RXSjRWZlFaejlqTEJL?=
 =?utf-8?B?aGZXcE4zaGpMbFlJY2V5N09NSXNmVVU3d3pRTXlyS3IwMTk2N3pVTUsvYlhl?=
 =?utf-8?B?RXU4Y2JrSDhkTlJibEk0dHhONFc1MSswMXlkaytKc3NWa3JXLzFvQlF6TFBP?=
 =?utf-8?B?aC9iTmMvYW53V3VxaWp4OXUyVkYwUmNTaUpkSnNCdUp0QnJhM1gwV3p5RUdy?=
 =?utf-8?B?UFV5Umd2TGJWamorWnlFTHdGZVdIb3lkRis5VG11ai9yV0VFem5QTlA4YnlW?=
 =?utf-8?B?N0ZIbWhSWSs2UGFsS1VjNEFZM1VweGZOUHlGUElNbDI2aURiOTF2SDhEWkxN?=
 =?utf-8?B?ZXNNOUd4bDBJL1RjMklYcWJyRDU3VmJPenVtTmV2dmRhaHdDZStkUnpGWGxn?=
 =?utf-8?B?NFYyZzRrNWRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWlxVmxrbGp3eU8xWFNWWXBIOVdLQjJsMjB5TEFRamdqYUYwVmhYNXRBVGlh?=
 =?utf-8?B?ckhmdDRCV2FxNlAvMHlrOUJ0K2dwTDF2ZTR6eG44SmxMVytQb0pobmdkNk9I?=
 =?utf-8?B?ZjdQZHp4alBMSFZlUUxyenZUT1hYWGJaY1Jwa3RVaFFKUmN1NHhmcnlnQm5x?=
 =?utf-8?B?aTFPWkwvNVZ3RndTbkEzbzBvU2V4ZXZpdDJHalpSQmt0d3dGeDd5TWc5Yng2?=
 =?utf-8?B?WFdHMjd1aC9kTTA2SFVFUHlQVkY2NjdhK0N2WmthSUlQeXFlN0N3bzFySm44?=
 =?utf-8?B?ajRaVVk3ZXBTdVgyM3JJNXRlTVZBNS9KUFA3VldueDh2VDl5RnA5NkJvL3V1?=
 =?utf-8?B?c2FmOXphRmJUakNNSGFGRTFVWXphM1R5VWhNT1ZORFN3V1ozZ0FCUGtyQVBI?=
 =?utf-8?B?OUFYR3ZRdldCek1hN1ZkNkt2SUZ6Z0dPcVAyTDZQWHdqUU1abE52UG5CNjl6?=
 =?utf-8?B?QUZtbWdmRjhhSjk2bnFQZ2dHOGRjQjgyNy80MzVKUWRkd3BNTEwwQ0ZBNlor?=
 =?utf-8?B?SjdCY2FWL0hvRVFlNFZCcUtCQzJvZjdDNUNWODQ0Tm9uL2NWbnFxVHpyeTBV?=
 =?utf-8?B?NWJLYkdwdWx2eXNMVnZRbmxobHZwaGswTjh5UHdzbGtYUXNyMWtKK3FXeG5X?=
 =?utf-8?B?elF5REZSQW9XSTk2SnNyODNvblk3SVBkOWJaRHZTUHVvRE9oeFlIUXRuZkc2?=
 =?utf-8?B?dUFlS3E4MlRUV0xkK0h6WFhzd2pWdVluMnBDQStuN0tKRm93SVFCTmgxYVE1?=
 =?utf-8?B?OU9wZ0ZYV0ZSZGpkZVVtWkEwMFcwQTl3b0J5L3dUNEZWSjVWR2pyeTNJZWQy?=
 =?utf-8?B?M0tVMmNoblNlR2QrU2pBNE5wNDRvb3NVVXo0TVRQWDI1dTk1SEtneTdrRDEv?=
 =?utf-8?B?YjlLZmNTY003b0psTnhrdi9hemN2UEczc2NSd3pGQ1gvVkdWYnJWVEFaUkJ1?=
 =?utf-8?B?aHVHaXgzZFMyZHViMjhaclFXa3BuM2Q5NGpQbDBJV0k2d29qOVMwbzYyR2My?=
 =?utf-8?B?NDQybmhMeHloMkhxUVJaUlpucUMwbTlJaFZDeitXdVN4WGZ0UVBVZkFlZzNi?=
 =?utf-8?B?N3R2TUhwbG51SHJqSzlnb2Q4aVBFMmNYODFZd1RmNHB5S1FqZWVrTC9acFZF?=
 =?utf-8?B?cFo1Zk9aOVpmdFo1NTZoM3lpOUVlNmlrVWtMYk1zalUzMHJmQjhrZFVpdFBJ?=
 =?utf-8?B?WTZGU0tTanhZU0ZLMW15RHE0MTdVTVNnbjhGNnJzUHJVNWF0L0xCbjd0ZFh0?=
 =?utf-8?B?SWcyN2VhaFo2VXJzT1pjdTYzQlpabHlnTkhMZ2NXaGF5S3B5L1FHVlRkN0NF?=
 =?utf-8?B?aGsvUFVVc1pNRGFaU2VUK1NWK2NQb01GQzg1d0tBdUt6MjRuOVdpbmRNZnZQ?=
 =?utf-8?B?MHJtNjNYbzNKOUpCUEFiTmRoMnFMM29xaVoxNEQycFlTaWZvRHJYT2FZZ0ZU?=
 =?utf-8?B?UVJPQ1JSYVNGd3NqNmRrTGloSE91STNlYkt6UTFUbllpZWRJVWtzK0srL2Yv?=
 =?utf-8?B?QmorRUwwTFpVNFlLUmIvdmxOVkhEMkEzTnlrWWdvSmRYZzlXamxrT2lRRDJZ?=
 =?utf-8?B?dCt0OEJnNjd3Z2lPMXpTRGVVQXcwYzdhZkJ1VG1TUDJUT3dRTTExd0N2amE0?=
 =?utf-8?B?TFhOSnlNekRvb2NCczlCTE1ucGhadGNTK3RDYWhGQ2tzVVRWL3lxWUZDTVJQ?=
 =?utf-8?B?Z3hFMUdHZkVmeEUyR1puM3llVjhza0lmVVRadG1nNUtTVnBSQlNvNldlZFlL?=
 =?utf-8?B?UkdpU24rRHFBdHo1bktObWY5Z1ZNTE5NdllPZzkxdTZJUGFQc2RSTkxXWUVq?=
 =?utf-8?B?N0tqOGF0RUxzOUpFaXlteDlYR1N6T3g3RUYvSS9xVVFrcHRocmM5MzVZSFBw?=
 =?utf-8?B?OEpqMysrcDkvY0Q3ZzQyZURBS1NkSGtubFIycXN3dFFEWDhRR3R1bzIwK2h1?=
 =?utf-8?B?S2xEdEN4VVM0cHFvL1BLYjE4OG9Pb0lyaW56NFVWMXJDYnZ0dFFtVkRMU3pz?=
 =?utf-8?B?WVZuSDQwZG8zaUdJejFKUFhmTis1OVd5YzIxcldxWVlHS2tGRzRWeDEyU0tC?=
 =?utf-8?B?RE5aZVBpSmluRENqWG9pdjJTZ3pOM1FMMGZ0QnJSQTdabDh1d0dHZ1FKdmg3?=
 =?utf-8?B?QW1ySGJnUkpORWJWL0U0WG9JNWF2T0toZ0dsRExkSHpmWW1FWXdSeEN1SjVH?=
 =?utf-8?Q?ruIMYw0toAljEjoHCF7JfWc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c11d6250-198b-4fe7-fbfe-08de2c3ded45
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 16:16:01.9655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlEFB8jPCu0AAsPhz8crr6gzaorlsdzoJBA/gZTik/6gy/s93Ice+hrQaS8qT89AozUc7UkpPu1U8x36KzpiSVHTJlf/vQ9ECUVpAQMHK68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9846

Hi all,

On 7/25/25 11:23 AM, Quentin Schulz wrote:
> Hi all,
> 
> On 6/10/25 5:29 PM, Rob Herring wrote:
>> On Tue, Jun 10, 2025 at 9:52 AM Quentin Schulz 
>> <quentin.schulz@cherry.de> wrote:
>>>
>>> Hi Simon,
>>>
>>> On 6/10/25 4:26 PM, Simon Glass wrote:
>>>> On Mon, 5 May 2025 at 09:34, Quentin Schulz <foss+dt@0leil.net> wrote:
>>>>>
>>>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>>>
>>>>> Bootloaders typically can be loaded from different storage media, such
>>>>> as eMMC, SD card, SPI flash, EEPROM, but also from non-persistent 
>>>>> media
>>>>> such as USB (via proprietary protocols loading directly into SRAM, or
>>>>> fastboot, DFU, etc..), JTAG, ...
>>>>>
>>>>> This information is usually reported by the SoC-ROM via some 
>>>>> proprietary
>>>>> mechanism (some specific address in registers/DRAM for example).
>>>>>
>>>>> It would be useful to know which medium was used to load the first 
>>>>> stage
>>>>> of the bootloader. SoC-ROM shall be ignored and not reported in this
>>>>> property.
>>>>>
>>>>> This can allow client programs to detect which medium to write to when
>>>>> updating the boot program, or detect if fallback mechanisms to
>>>>> unexpected medium were used to reach the client program's execution.
>>>>>
>>>>> In cases where a boot program is split into multiple stages (like
>>>>> U-Boot), it only represents the device that was used to load the very
>>>>> first stage (in case of U-Boot, VPL/TPL/SPL whichever is executed 
>>>>> first)
>>>>> and not any of the later stages (in case of U-Boot, TPL/SPL/proper) or
>>>>> any client program. They may match, but they may not and this property
>>>>> is meant to only represent the device used for loading the very first
>>>>> stage.
>>>>>
>>>>> I have a board running U-Boot which currently has 9 boot scenarios
>>>>> (eMMC/SD/SPI-NOR for the first stage, eMMC/SD/SPI-NOR for the next
>>>>> stages; not counting USB loading yet, which would make it a few 
>>>>> more). I
>>>>> cannot force the BootROM of this board to select a specific device 
>>>>> aside
>>>>> from erasing the other media.
>>>>> The only way to identify which device was used for the first stage 
>>>>> is to
>>>>> parse U-Boot first stage console output or add some custom logic 
>>>>> for my
>>>>> board. To validate that a new version of the bootloader works, 
>>>>> including
>>>>> the fallback mechanisms, I need to make sure the BootROM loads the 
>>>>> first
>>>>> stage from the expected device otherwise I may have false positives.
>>>>> This would be useful for automated testing.
>>>>>
>>>>> I could also very well see this being used to identify where the first
>>>>> stage of the boot program is stored (which may differ from where the
>>>>> later stages are! that's the case for U-Boot proper for example!) 
>>>>> to be
>>>>> able to update it from a client program.
>>>>>
>>>>> Note that Barebox has been using this property for a while already, 
>>>>> with
>>>>> this very content[1].
>>>>>
>>>>> This is chosen as a string so that it matches other properties in
>>>>> /chosen (e.g. stdout-path) as well as allows for extending it, in case
>>>>> one needs to provide additional information (e.g. HW boot partition 
>>>>> for
>>>>> eMMC, a specific disk on an AHCI controller, a specific USB device on
>>>>> a USB bus, etc.).
>>>>>
>>>>> [1] https://eur02.safelinks.protection.outlook.com/? 
>>>>> url=https%3A%2F%2Flore.kernel.org%2Fu- 
>>>>> boot%2F0066fcc2-3431-48be-8dc2-00ea7e2550c2%40pengutronix.de%2F&data=05%7C02%7Cquentin.schulz%40cherry.de%7C62bee489a30342bdfe1108dda833a49d%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C638851661931307638%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=cZXaYVfIc3%2BN6VahJmAtzUzut0VjG9LiUZNeLWKxbHQ%3D&reserved=0
>>>>>
>>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>>> ---
>>>>> Note that this property is already set by Barebox and I'm planning on
>>>>> adding it to U-Boot as well, specifically for Rockchip SoCs.
>>>>>
>>>>> I have some doubts about the wording, especially in the case of
>>>>> hypervisors or chained boot programs. I'm not entirely sure what would
>>>>> make the most sense to put in the property for those scenario.
>>>>> ---
>>>>> Changes in v2:
>>>>> - added usecases, non-usecases and increased verbosity of the 
>>>>> definition
>>>>>     of the property name as requested by Simon,
>>>>> - Link to v1: https://eur02.safelinks.protection.outlook.com/? 
>>>>> url=https%3A%2F%2Flore.kernel.org%2Fr%2F20250205-bootsource- 
>>>>> v1-1-95f4ba69ac27%40cherry.de&data=05%7C02%7Cquentin.schulz%40cherry.de%7C62bee489a30342bdfe1108dda833a49d%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C638851661931346429%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=c3xFGwKD0uapQ4%2B%2Fk15t5Yfu3Dr4JgZGyJGYpountT8%3D&reserved=0
>>>>> ---
>>>>>    source/chapter3-devicenodes.rst | 17 +++++++++++++++++
>>>>>    1 file changed, 17 insertions(+)
>>>>>
>>>>
>>>> Reviewed-by: Simon Glass <sjg@chromium.org>
>>>>
>>>> Does this need to go into the schema as well?
>>>>
>>>
>>> Considering this should ever only be programmatically set at runtime,
>>> I'm not sure this is necessary?
>>>
>>> But taking into account that u-boot,version is part of the schema, I
>>> guess this could too :)
>>
>> Validation can and does run on booted systems, so yes.
>>
> 
> See https://github.com/devicetree-org/dt-schema/pull/169
> 

The above (dt-schema part) was merged August 4th, 2025. Can this patch 
here be merged into the spec please? Or is there additional review to 
share if it isn't ready to merge?

Thanks!
Quentin
