Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E09E3D9DB6
	for <devicetree-spec@vger.kernel.org>; Fri, 21 Aug 2026 18:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338189; cv=fail; b=dhmqczccPxZ/gDGZ20kprQ7JP8R9U4rYkMS2ONSmb8wReuuJ7RDY/0ECZ6Llb7lL9H2y0OCmVeZugmwLNLK5rQWk5AkiOX98h1VKOKYzVzmTGQAIdGBSOQte0Lvn61EJ9s8Z/QNbZKHMQGPYzakj+5VnsBH21a6rb3wQ1zVXuf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338189; c=relaxed/simple;
	bh=S9bWco8+8l9omYj/s0iSEHA1nxxUxSpligZ17JdYbkU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ho/Z1RLmntMOAvBpo2PyYmDkraod0COfwdS52CkkJtdcb/Y5PqywbZ2hHzPSerpc90TdMR93IgtQ1O4wCuHmwXGFPR1ObKCXSWh3AGd9HfP23HObkhaZ1fiiAaS19F+K9+i8P+8hjqpNA7Xtqr6FoE2oQcQAOwY3SDRmTKPO5IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=T3p+Ch0+; arc=fail smtp.client-ip=52.101.69.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="T3p+Ch0+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chNevuvQ7s/soFckEwFjt5QNBuRjMEWzGHk+pcxaXjZhSWtGdYlCLVj9DyjKZWepf97i7iD2PNK84d4SAENdTv2lEAzODAjix2ugfi7pEwJfIGBH2QdO4OhpGcter68btizBnpHYQ2uafFeqNESrGUMTnX1ZB+XU8sYIo/hxjak3HPoGNCR8WMh4cgP+dLLSLiuMEKazr7Ew6Pfe0wAy7WMyJ4NHk4XI0SB9hq7qIEqLbS5VC+e6MnEQXW54caI5TizvXSPdwNRBBvlqRE6k7WLv3mSG43MVrFYGrSOv7YzJRCS3inMGRlu2ET2o63qVEBzHJGVarZKB6QTS811jtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1wDjveMpv2BB7Ftio5nuw0xYbyYIVxlgUCMShEobo8=;
 b=wUGcyBrl7UU2Suz57S8TzRCI0YTLHDPD4hx3GOPPi1tzb/ubtAZl1yuOCcxKXPm631lU5sTerKqmBgvb3aNeA5ph73oa1iJKHm/9HpWIoIHlLms2/jzmCTtwSVgdj3GbiA7O3OgaluR7WQHvp/h6114ra9U307uAiPHrFh9aWg9cXTHMWKGDscH0cz7AqViET+j/d7NUs0qqNE9V7O/0n0iPTpOvimehFP8mNjMeE3PuCL+ZBw9CgdxO9b/dReef34yRsi/h2e34pE5lpQ7CZUahxhEIhn0qRbou7JQyTyv77FFee+jS5k3MsrbN6s6i4qTgLzjYcAPo61aY+VRFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1wDjveMpv2BB7Ftio5nuw0xYbyYIVxlgUCMShEobo8=;
 b=T3p+Ch0+XLKEGUhcWXHNvv+2FlqRnrZvICXhSEucTuR4YBdHePGTkl4ZxN7lZ+r7YsIRLmRtPeGl0kUox4DBFoCxKa67xgiyEVV7IJF0iF0U6bXR+ozqsIXgayp6mx7SnSjktaML0h5/HfggSI83cgBecTvxEDbM6uG3jap8IRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB8062.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 18:49:36 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 18:49:36 +0000
Message-ID: <2317684b-f0ed-4f36-9c0c-314ec8cd6920@cherry.de>
Date: Fri, 21 Aug 2026 16:58:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] schemas: chosen: Add reset-reason property
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 devicetree-spec@vger.kernel.org
Cc: Ludwig Nussel <ludwig.nussel@siemens.com>, Simon Glass
 <sjg@chromium.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20260605085938.3779084-1-alexander.sverdlin@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260605085938.3779084-1-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::35) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PA4PR04MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 8204fd1a-036e-4bba-77b4-08deffb4f2d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|23010399003|22082099003|18002099003|56012099006|6133799003|11063799006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info:
	UvfHmI8NK3veTXQ8/cRbanINiGQy4g6o6KO292HqKvZBdGiQ5+oE610OLnpVVfk1gkDzDsocV89EoQ+TCjhQwcIKWiOF0BvEbkUu5E4VJyTQDUD0AeVMNSkI52OsxR0Exph0Rwk+px64UYtHX30AsGOHlk/2pEF3SQEWqq1cB962FGAD51lVvXMW9KMa866pXndK5mfFxfbX497gGN5Z1B3qErRjaEXQqT3V9JB4CDyOoRxuhfB8THRIqiYJBNbqAE0NpaHScY4LLeYBwgj5CksB1UFMXlq741E6L4/+diT9Wj6X+AETAeYBknifenDxfhCL/6ezlINl1MNplcxBk9qEgDmpHMTbR7lI8Ajs16vTvNy++PaQcbpJa1CytbYZA90aaGol07D3wW8ByjdevF3LoSt1TC8o74rhAThCM75rZ6mv2YDMclQVy9w8yaxOnub+emZOTDM09mMxk1alfUX45GXVSHzzO4PP6g5vFJv01/G6cihFGkd51jeE91HwrPpNn13CxnlEdpzexVjkgVsd/e22LNNpl9ENUlKbstsIHf+b8uvrpXJBm77L7pu3MkQuWYymvnTrvp0taYNuaphkXVYN2HK4gfTDV5Pci2JHB7sK6EHtW0ZOulv7MJkFXs202mpC1uIfOtNFjJyUukYl2m+Etk7azIh8PzLCng4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006)(5023799004)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTFuQi9mWmJWdFhxSjgrb3B5dUVHQWxoWGtCdWxWVlhycmRVRlZWTTFUM2Rt?=
 =?utf-8?B?UDJNKzh5MG91d3ltU0R4emNkbGs4MlZGbnR2WlNSMDYvREZ4SlZ4NXE5Wktl?=
 =?utf-8?B?eUNIRGlKQ1U5TUVxbnJDWmtacC9zUmdmMGZwak5zcmdXQ1dFbC9zTWRjeDVk?=
 =?utf-8?B?NytPKzdIZnZXSnlJTWpjNisvUGRkUlMwK2RHQXYwanJjNTJqUHRzKzkrUEpj?=
 =?utf-8?B?UiswZ0RRSGpOeUFZZytWTzhtanY2WGQ4MWpiL1EvZyswMTZnUnFobldsYmhV?=
 =?utf-8?B?Qm9jL0ovVG95Q0lVTmxNdVZ0cHJveTVnd2l4NjdiWjdyZVFielE3QTBsY2NQ?=
 =?utf-8?B?c2dWZXN0Sk5BaktJMFcyNi9OVkxNdUFZR1pEQk5BN21wa1N6RUptcmh6Zkpy?=
 =?utf-8?B?bkYrbG1FYWhjQnpUY3lsMGhCcHpZWERYRGZWL1NPbzlZeENCV1NMczJUREQz?=
 =?utf-8?B?c2VzOUhLd3ROdmNvMXlyRDZMeUpGVFAxSW1sRnlIaTg2VlBjQnloOHhhdm1l?=
 =?utf-8?B?a3RHOFpXc3d5YmswM0JqZlpnd2pscW9IV3dCaTNydXdBUllDTENKM1RoVTVk?=
 =?utf-8?B?aGZTcnBiZXZ3TDNyeWhyUWgxMWNGSlBDblIvdVVaL3hldEhLcFR4Z3lPZEFq?=
 =?utf-8?B?bFBLWHBNWkdtejJnZVNpUkZSMzlmaG1mMHBySTBHT1lncC9SUDF1VTdJdTVk?=
 =?utf-8?B?R3B3SnJHekdadTdTVU02eDJKZnRoeDJEYkFKMHhhdUlaOStqVC9hc1RkYkFH?=
 =?utf-8?B?TUhlUk1TMkh3QUpRTXI5WjlLdUdGZnJWaU5saHY4TUxWaTA4NjdJeUZRQWlK?=
 =?utf-8?B?SjM3TWdDNHQ3VkV3WExudlBqTGdqTXhXZ29oMXZONWxqL1Ava2tqTlhuUFcz?=
 =?utf-8?B?TFRucnlrc3gyQ3FxTURjeXRmaVZGTzJwWGpuSXJ6bkJRbjRTUGhFaXRnN1VB?=
 =?utf-8?B?TFpZK3FicGcvN0FVSXpHZUNhb3hCQlNZbUx6d3FyNU9qNDBGRG15eHpsR052?=
 =?utf-8?B?NGd3WXljSDlDTFdxVXcvWXBoN1dSNHlEbDNoWHUrWm9BTkJaYnJPNG1Zcmw1?=
 =?utf-8?B?em5SeXBsNDBjTFNDTU8wbG1SckVRbTBGNElKeTBMdUx6UU1iT0ZaRnM2ZTYz?=
 =?utf-8?B?c3hGekRjaGE5WnZYSktDbW9QYWpwSVdyUlE0MDZUZ0MxZ1pibks4c1hzcUN0?=
 =?utf-8?B?aFhVZTZ6clhFRTZjYlVyUGJWN1Ywd04yM1ZJaEtIckpkdGVBMXlHQ2t0eVRn?=
 =?utf-8?B?cVU0RHFSNzRPVzlaYXMvQlpCMlR4QXRvbHhaTXZpRVJyc2RYdjYyS2dHcnJq?=
 =?utf-8?B?Mys4VmU5K2tUZGFSayt1ZDNUbUxkU1pzMDk1R3Z2SkRpb0R0QVVXTFhrb1lM?=
 =?utf-8?B?RFpoMHEzejc1Qm1ZaXJBL0ZGTVV0SmczVVMra3R3VTlrLzU4dEtoZEN5Rk5W?=
 =?utf-8?B?ZEtNMXZ4b0Uwb0tWQUxlY0pEek5kUnB5ViszcTAzaG4xOFp0OGQ4TXlQSGJ3?=
 =?utf-8?B?RWo5YVZ3SXZaNlhyQ2xKUFN1NjBlSjdCZ2FwUGFiUnRzUlZscFcwdlFWZTIw?=
 =?utf-8?B?RmFLdXNvcUhxUzdyWUY5NmpJNnB4TDNnK0x5UnZuMG1HelNPOWlKMkxxWm1t?=
 =?utf-8?B?VjBtdnRFOEQxeG1pRWRBVHM1ZlQzYVhIOWZOSk5yRkd3U081cXpyTlJ5ZWw4?=
 =?utf-8?B?OW9iQUxtYUJPWXA2SnFkTWJ6R1F5QmtZbzIyc01Gb2UvKzVwc2FmT29IWWhU?=
 =?utf-8?B?T1dtekFzREVNaEpGc2JHYktHbjR5VUY2c0l5MXF1N2c3dzFNb3ZLVDJZYmVH?=
 =?utf-8?B?QkRvREdYL29ZSkNiQXVURlJJRW43bVVnbU1QLytYTkRkVUJmUm0zRlMrQkx3?=
 =?utf-8?B?eXVyV3MzOTJmNjlLVGZHRnlmNURGY2dSbklpZFVYa1A0SHJvK3hsczVDVXFO?=
 =?utf-8?B?enlpVzY4cW1OcjNzS1RlN3h3RWFybFNqZ2Zxa2x2REUxQVJkZ3lRU1k1QlhE?=
 =?utf-8?B?MjJtUU51N3ZUTmhtb2JRU1RkSDdnNEJ3VlprL0tFdmJSdEdWMjZiKzN3Q1Ev?=
 =?utf-8?B?UXNCNDgvM1ZBUXV0ZWNUQnlha1ovQ3FINE1tY1cvTk9NYjBYTk5SUnRzOU16?=
 =?utf-8?B?a1RlcE1yeEFHN0pHRXZBanhEYmdWTVdORFUxd2ZhWVgvaUdrRGpyekRzY2dn?=
 =?utf-8?B?c2RiWUNKOUNMdmc0STdTMU03UThEdVkyK25XVUtrdUppSDVDY04vMmROS2hI?=
 =?utf-8?B?ajVDSFJDcG1tSm1acVZaMk51ankyZndvZXdnWllrcXZWWVdyekRuN3JNSGty?=
 =?utf-8?B?U0dhd0RKNE9keGl5anVHYWpzR3FVamZVNHp6RzNtS2VIamROQ2lTSDdjMmRs?=
 =?utf-8?Q?P+XQd5tgmwhYWlwbJ5K2zvBXE7Ys5enYmkQI80dReSM3z?=
X-MS-Exchange-AntiSpam-MessageData-1: TCCbWSnj66kgTPVNY8uuf/QiHa2iCetCQg8=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8204fd1a-036e-4bba-77b4-08deffb4f2d3
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 18:49:36.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSqFBhK9AjVndQnErdPEEaV8oiKRcgGav59EUiUyGqCb0x58mLJ/WOFf5C+9exs+FxirueoEkGd4nJcB+kqHqymPH4stX5T8Bhhu0ujtTjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8062

Hi Alexander,

On 6/5/26 10:59 AM, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Bootloaders such as U-Boot and barebox can populate the /chosen node with
> a reset-reason string property indicating the cause of the most recent
> system reset.
> 
> Define a standardized set of generic reset reason values that bootloaders
> map their platform-specific reset sources to:
> 
>    unknown    - reset source could not be determined
>    cold       - power-on reset
>    warm       - warm restart without full power cycle
>    watchdog   - watchdog timer expiration
>    wakeup     - wake from suspend/sleep
>    jtag       - JTAG/debug initiated reset
>    thermal    - thermal shutdown/overtemperature
>    external   - external reset pin/signal
>    brownout   - supply voltage drop
>    software   - explicit software-initiated reset
>    safety     - hardware fault detection (e.g. error signaling module,
>                 fault collection and control unit)
>    security   - security subsystem (e.g. secure enclave violation)
>    pmic       - PMIC-initiated reset
> 
> Mapping of platform-specific reset sources to generic values:
> 
>    Generic      AM6x              i.MX9            barebox
>    -------      ----              -----            -------
>    unknown      UNKNOWN           -                unknown
>    cold         POR               por              POR
>    warm         RST (SW warm)     -                RST
>    watchdog     WDOG              wdog             WDG
>    wakeup       -                 -                WKE
>    jtag         JTAG              jtag             JTAG
>    thermal      THERMAL           tempsense        THERM
>    external     PIN               -                EXT
>    brownout     -                 -                BROWNOUT
>    software     -                 sw               -
>    safety       ESM               fccu             -
>    security     SMS/DMSC          ele              -
>    pmic         -                 pmic             -
> 
> Note: barebox already populates this property but uses abbreviated
> uppercase values (common/reset_source.c). These will need to be adapted
> to match the standardized lowercase values defined here.
> 
> The list can be extended in the future as needed.
> 

We'll want to eventually extend it and match what barebox does by adding 
more information (e.g. which IP triggered the reset, possibly 
IP-specific information such as which reset in the IP triggered the 
reset, thinking about the watchdog IP in Rockchip SoCs with multiple 
sources for a watchdog event to kick in).

Considering the DT people weren't too happy last time I didn't provide 
the whole picture, I would like to avoid being involved in upsetting 
them again, so please provide the full discussion we had in the RFC so 
they know this is only the beginning of reset-related properties we're 
eventually planning to add to the DT bindings. Maybe they'll suggest 
something that works better for them based on that feedback. I still 
believe this is a partial implementation and stopping half-way to 
something that would be useful (Barebox for sure didn't implement new 
properties for nothing ;) ).

Cheers,
Quentin
