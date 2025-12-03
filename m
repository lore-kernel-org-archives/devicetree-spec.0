Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010061.outbound.protection.outlook.com [52.101.61.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D682FF15A;
	Wed,  3 Dec 2025 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764772906; cv=fail; b=PDrszlPMnY0/xTeZ4CXbjC5PJok1dxRbN0xUmkhxMxKvK3PBOExkstMRlMLyaLamNjllyzdAB94kCFp6efxY1PsBhkiv85+6UQtJJW7y7tzJhZOCg0nlXx434PyEX4tLH/cdNLeML+Qwsrlrnjwg4Y0xQCR/3zrm5XQrPxL2sik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764772906; c=relaxed/simple;
	bh=m7AhALe2UYpl8Wvcw1L7RmKOkuRDanjk2y2LO+GmOSo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s2f8X/f0hzVI81iDzKDW73oqkIVugTeyVZA2GQBQdMBxWVFUkdpmA/9Qong2gm+ttCshH3ujyqF9gf1DFHSOKAz0FZpHIbdSQ+86ZFT7NBgjDc4Pzjj8NiPVvUL9wGeiUM9ZjvN5kRaE3+6prMLXCtTWpkOmGQKNmmLG3EXr+eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=V8t/EnVb; arc=fail smtp.client-ip=52.101.61.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="V8t/EnVb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/Ioju+Vy+n5OlGisXXLfODdQd+BcCvNMjp0ey+1mdPVv4HZF4t/xwshyKHfGPvuV4ahS/tzCQoXlupoCLiFew97cteg3C6rbwu/d9cGySbPqttPexrs55jEP8XPmYq0HXR2Df0menu4gTektWs7Hmbyav4IzXsSPfZ0zOTIpMnq4wtvfrxF6s1Cogp0zSuPawEut/LHJHNRszs2GMj5gM2kUzWldCcLK8i13oTplwAdkNfrRSdba1MTDineUhtVvBdJqjkjfg+q/ATaLGJFFl2unG47e/H1p7OFuUl5oVQWeGx/oE0U/wxuNYFKRKAUpVZH60AQ2UP3a3bJ+jLWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxSByKyr5ZxILTKwzeAT4ruDNbccrpZqap4vAL1yTnM=;
 b=aGIr5cFcRYAf/wPvK/1UcZTuigT1jGMQT+oS1TRxFt+bQg8VuHOYjZw8qjwg47+93/OMakMyFYxUsZWxctQVBKkaB95Srv/R1lJFebLCLkjFT5/PCv21rKZZom/MOHjeUPoAe6lGR7LWD/LiC9CNhZqMDxLnUUZA0PK9FGegbqZBcGE9pcvPLQR0tifNJqwuIAhnc/ZQ0+DHRyvT5VEbhgFTCdx7JqMrHYBJJ3N3xJH0DzxRT+Aq644nbofQR2VUHjiarVwwag9iW7EmS6ewgqSuQe9YscwgM6IkdpS6S3BKTNHoF9KqsEhLZUecdJSK7qeANPphTdpq4FWQybmbrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxSByKyr5ZxILTKwzeAT4ruDNbccrpZqap4vAL1yTnM=;
 b=V8t/EnVb/uT/9BKa6HApF2HfP7KwSglj31ezGt7odSfRj4U8UxfObIKQujSPrmZfaVIm4Qf7/sW5Ap56XEPt4CnvRHAN/cNKcQLS2pyBXyccbjD7OaQS/q/KvnALT4TaAprWGSGf4gkhxYracjxVWXLdfQ95nkUwGdBZblgUOdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by LV3PR12MB9165.namprd12.prod.outlook.com (2603:10b6:408:19f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 14:41:42 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 14:41:42 +0000
Message-ID: <87a5fa3a-4242-4755-913d-b87cf8873039@amd.com>
Date: Wed, 3 Dec 2025 15:41:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: devicetree: overlay-notes: recommend top-level
 compatible in DTSO
To: Rob Herring <robh@kernel.org>, Raymond Mao <raymond.mao@linaro.org>
Cc: linux-doc@vger.kernel.org, devicetree-spec@vger.kernel.org,
 devicetree@vger.kernel.org, ilias.apalodimas@linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20250911151436.2467758-1-raymond.mao@linaro.org>
 <CAL_Jsq+apXxvngU9enNw9yzD1YAAOyamwkTBvqdrc2M955Q38g@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <CAL_Jsq+apXxvngU9enNw9yzD1YAAOyamwkTBvqdrc2M955Q38g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0302.eurprd07.prod.outlook.com
 (2603:10a6:800:130::30) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|LV3PR12MB9165:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d9d0f5-4ba4-4adc-54cd-08de327a130f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWlkRGVPRGJnKzIveWFmOXdOendsMEZJRXREWXVKR0RsZE9pc3dOZmcxQUZy?=
 =?utf-8?B?UjZaQnBrN1hQZnJqQkxBY2lkWFBWRVFTclRGc0RjR1ZIUWFyY3dvTEI2bmw4?=
 =?utf-8?B?YWs4dWRKTjJpVGY4eVNKUStlRWYwWFB6TEV5MUFmZnFFRTU2SGIzRmhEbFBQ?=
 =?utf-8?B?MnB6NXEyL3NSemdYWVVRSHg2V0NUZ0MvT0p1NEJQZ0NhbGFwd2hsZis0R3N5?=
 =?utf-8?B?UnpvZHoxN0RqUHJIR0dNUWtvSitocDhuVWdYMEFYZE9wVHpDZFNnTktqakJ2?=
 =?utf-8?B?dnNmYmRiV3BRSkJtN1JpUWhLWmNZN2Y0SjE4MnVFcjNlbm43TUdWQkNRWHVp?=
 =?utf-8?B?bG5WQ1JRZmpPVG53eGpiUEsvc2orK2lUay8yS3pIMmZLRG94ejZUNGNZRXZh?=
 =?utf-8?B?TGxzQng4LzJlRTFLWHo1LzI5Uk5GY3RDRzlyTjY1WG5kTVpxZnBOVHFvUGI1?=
 =?utf-8?B?MzdPRE1DNjVwYisxY1k0ZjNOOGkzL2kvalhaV3VhOGdkVzZjNCtCMzJMV3I4?=
 =?utf-8?B?TXplTnl4SjVVVElJeWRGbXJ2M2ZpdFFQV2src1QraWd4QklyR0kwSGxMcThG?=
 =?utf-8?B?V2RaNWZmdS96M2d0eXo2RjEyMFdyZzJFM2hUSk5teHBJeklFYTVkTWZqS1V5?=
 =?utf-8?B?c3h1bk5nMHU2Y2xWTVlmaXNKaU02MlZGdjZLZis1V0l6a1FJSGdheWhTb3Vm?=
 =?utf-8?B?b0t0M2U0Y2tDbjFxSmt3c0lyNGdJYlZUR01QcjJIVGUxdk8zNDVYLzFkRkxE?=
 =?utf-8?B?eGE5MzNkM1BwZGczYjB4T1puVWNndWprTVNVM0o4MjFjNlRxN3VTMVZZUmpq?=
 =?utf-8?B?NEo1TEVYa0RXYldoOThERnAwdDhyMFlqWi95c0tpTCt2ekNSQ3RDVHE4Ny81?=
 =?utf-8?B?bVk0NlhYZFdiMDllbXNqcnZHVFM5ajR3bWxUMXFZNDBVQzVYcXRqdGh5aVpy?=
 =?utf-8?B?cHFRTG9kMkR3ZS85Z1NDa1BPbkhwbHlsbUxUdU10ZERvS2pSNVNOeUtHOWRT?=
 =?utf-8?B?ejBzSkFQZkZMZStJd3RzWFZoSlVmMXFsb3pMTGhzSlQyMGlnand5VGV0UytB?=
 =?utf-8?B?WG8vSXhxK015WEFxbTE0T2JKZE8zd1luSUc4c1h1S0xPelZ2TlAvdzJNeHJt?=
 =?utf-8?B?TUlZVkJCR1BTNnZ0dmFUckl5YS9kSk9tbHM0S044RDMxTUk1cFZnNlNrU3JB?=
 =?utf-8?B?ZkdNSG5URVpmVkdBYlRkaHQ5NHQvV2FzTmpjTkVPejdWUTZEMGI3akNMZDg4?=
 =?utf-8?B?M2Vzc3ZqQnR6cWVXcGI2cGpaVXFoR2hDUHUxMDJSWmVjSStUa3k2bHdsYVhR?=
 =?utf-8?B?N3paNUFCdFRHc2t3OVB4bFZSR3FYS3RnNW4wV3lPSFoxVVJRN3BEdVdGalI0?=
 =?utf-8?B?UU9kdGtRcHNmcXZLWFh3VkdQc2JPS3F1aEVPZzN6eVo2MDNpMGFvRnR6ZWxW?=
 =?utf-8?B?YzFsL3dWOE1YNjJvb0xWTjlLQlVwc2ljdUtvbDAyMEk3b21zWTFEajJuWVlY?=
 =?utf-8?B?TytsK3pZUzhlVkY3SUx5WVJ4ajhrUE1NVFRmU2NDMDJzR3Z6alpFN1lDZkp1?=
 =?utf-8?B?VmJaMDBqOHhyK3FISFljam0rbHRrYVE2U2dFQ09FNlh3UFpFUStNeWxVMkh3?=
 =?utf-8?B?ZWRHSFRidE0weXhhUmpwS2pGUnZlTTVPb05OTllYVWtJcXBvckxjZFZPUHJU?=
 =?utf-8?B?akQvaXFLTHFSdHFkUzRPS0d5d3p1ZWk5RDRzMUp0R2NKakpnU29RUEx3eUJD?=
 =?utf-8?B?NVhGcUV1d2NiUTdRcHVMeUJZb1Q0YzJXcXRRUnE2Z3Nud1BiMmF4U3kxMkRJ?=
 =?utf-8?B?Zyt3em9lYlc3czVmaDNNdHpxSkM1QTBmbEdlLzJYU2FmZldoQjA5a1BDeE94?=
 =?utf-8?B?OFZhWjBBc0lZOGJLbEExNEVJUUR0UFRYd283aUVuSWl3aGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3V4Z3VLUHBDMlhRQVlTUTRRd1JiZk5kUWFyaXlVQ2t0aE1RS1pvS0JNU0dn?=
 =?utf-8?B?bUYyYy9qYXgwTlR2M3JMVHkxUldJSTg5cFIzbjRwR0V1OEhCWDlIY0t0VEp4?=
 =?utf-8?B?UDcvVkd1RUlwUFlqM2NlZUZzeWgvbjIvVHk0WW4rK3dtRU42RkdHSnIyRm9N?=
 =?utf-8?B?RlNOMmFTOFJ6V1FFT3ZxWjF3cm1pNCs2RVllcnZTcHZ1SklFeW15Zi96b044?=
 =?utf-8?B?dVQ0Q3I0NXJqdExXTER6TGhxUThzU0Z5bER5bk55OVV0QnNuSzZZcEs0SmVo?=
 =?utf-8?B?UXVyY25JK1FPSmNvMHIyL3I2NW1rQzF5ZnlvRnd3eW1LWlVHRGZPZW4rUm4v?=
 =?utf-8?B?dkhESkdmWkxsV1IyRmhFeUFWazdvaTV5UVJISGFQc2JBbHVuWSt6dDNmNEtL?=
 =?utf-8?B?QW1uR0xxTWVwbGpUYnJHTTg5KzhBcXIrL05tM0VReitJbnVzaDVZSW5XMmlV?=
 =?utf-8?B?SExLUEVUamlGSzU0ZDdENC9ZalRLZXYvSWVvR0swY2tkeVZmN0JnNjMvQTRY?=
 =?utf-8?B?elZJNk1wM2JUdDdsTWFNaFYvdnZDQWZGT0VpTFpJNUZzQVFwam01NXV3bVhI?=
 =?utf-8?B?TzBHcFVtcVZ6RHB0VC9YanV4MkVZVWUxcmhxU3hhZS8rTEJxb3B0THpuY21Y?=
 =?utf-8?B?ZmdWMnp0d0RBd0tuMHQvL0RPUzZNa2c2M3RVRVIyclZzb05IZHNvdEhxVXVL?=
 =?utf-8?B?aXBwOW5HRkt3dUN2VCsxU3Y3MDFtb29kZXF2Q3pXeDltdUd6MGVWZTVTZDJ0?=
 =?utf-8?B?c3IzS3U0blhSeVA4Uit1Vm1zb20vTk5XLzBXRG12UjNCNXEyaDc1dDNybGZJ?=
 =?utf-8?B?bVdyL21sUUZyNnFTL0xNODhxY3crNWg5dFhobjFkcGlJS2R6SVB3S01zZjN1?=
 =?utf-8?B?akk1eVpZUUl0azNlNitxTTF4eWdtRE1mTlhKMjZGMnVSTEtpZ085QW0vU3gv?=
 =?utf-8?B?ZkhlaUE3VnAvNWlBUEZjczQ0cnpVNnNWR2JKSE5KWEFJSURJYUZYRm8zc011?=
 =?utf-8?B?eXZ0TDVzaDlhWnZjQzZFdVg3R2hKbU5qUm5TWU5DSnlNT3F6emtxcDltU0Vp?=
 =?utf-8?B?amZYU3V4LzBwcllXZVQ4WEExdGxEdGJUem9GQ2t1VHV4THJBdVZsODFnUzNV?=
 =?utf-8?B?ZlgwcDBBQ0RMUStCeUVMTEVtQUpmVXpBVmEwdGFVTGpYZ0Qzb2ZzR2JlVzdG?=
 =?utf-8?B?ZVVlcTh4ZzNjTWt2UzI4cWErTWVnSzc5akNkQTBPUmR3QVNOdmMwWTJDTG5G?=
 =?utf-8?B?MjRNUDIwdERMQ3V3VlQvbnRCZ0cxaW1INm5zK3ZrdlpaT0hueHkyZWh1cXp5?=
 =?utf-8?B?ZDd2eDJ4ZytQMUh6V1ZwWDJuWHRYQXpDT0JUbm9QZzh2Y3FGQjE2VFRydUNo?=
 =?utf-8?B?WVZmZkYxaVN1NWZCZEVvSmJqZmdnaW5oSUUwa2F6ZFVvR292bTRHR3h2WDgy?=
 =?utf-8?B?QVNPckUvVGpmV1BmNmtiTXZQczA2clFWZlQ5cXJybzJ4NS9HYjI1Z205VllZ?=
 =?utf-8?B?MnRTckkxcTdJd1R6NTFtWitYdm13QXhDTlZ5OUNhbkt4eWJSSVRwSjhFQ3Q4?=
 =?utf-8?B?Z2pyZTlYa3dvT0NsSjh2YnAyaFRGSjFnRzgxc0FIbWthb0Jvc3pRUDUwbWlu?=
 =?utf-8?B?bTFVQytVbm9JcjZIcCtDQUQrOWFOTnJHZFBiMktySjF1ODN0L2ZSS1JUOWE3?=
 =?utf-8?B?Z2xUbTBDTDhYWE13K3d4eGhCSFNiRVhZNHNrajk0Y0lFS1RFdTlteE5CSSsz?=
 =?utf-8?B?enhpT2ZvSEFNOWc2NGMvU2JTZlRaclZUbVRWUmpHS2lVQ3o5bjM4SEpwMFdL?=
 =?utf-8?B?bnNrc0xwWW84VkZ2Ri9lUFFmUm5CaWhaYUNpY3dBWjgwSEZEd2duZ2ZPUVZm?=
 =?utf-8?B?TWJRdDZ6OHg0M0hnQVZ3ajlsbVhCY3l0ejl4aDNEeUdUd2hPTVBUNG4rWXlU?=
 =?utf-8?B?TVdmVW1PODZiWHpORkRhSkdnNm1TR1RpUHdORW5VV3MvK2ZGTS9iTnNOaHRi?=
 =?utf-8?B?WnRIaWVLM1R3UWFvVXVJekRpRkdTYXF5UTJjenpYT2tTbkVpZHBBL1lxeU9t?=
 =?utf-8?B?Y3E5SHNBaFBwbG9MejNnVkVnSVpUV3NMRi92QVIwK05lK3lnQXBtK2xBNjN5?=
 =?utf-8?Q?ztpVOP6HLOQj+BNE0sqDF+jOc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d9d0f5-4ba4-4adc-54cd-08de327a130f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:41:42.3359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydURp3dmOuFzcsqP/Hj5gDH7I58DO3CMP7KyGymWSFg2nFi1UTqQMstWFPDPYrBW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9165

Hi,

On 11/14/25 14:08, Rob Herring wrote:
> On Thu, Sep 11, 2025 at 10:14 AM Raymond Mao <raymond.mao@linaro.org> wrote:
>>
>> When managing multiple base device trees and overlays in a structured
>> way (e.g. bundled in firmware or tools), it is helpful to identify the
>> intended target base DT for each overlay, which can be done via a
>> top-level compatible string in the overlay.
>>
>> This provides a way to identify which overlays should be applied once the
>> DT is selected for the case when a device have a common firmware binary
>> which only differs on the DT and overlays.
>>
>> This patch updates the document with a note and example for this
>> practice.
>> For more information on this firmware requirement, please see [1].
>>
>> [1] https://github.com/FirmwareHandoff/firmware_handoff/pull/74
>>
>> Suggested-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
>> Signed-off-by: Raymond Mao <raymond.mao@linaro.org>
>> ---
>> Changes in v2:
>> - Updated commit message.
>> Changes in v3
>> - Rename to 'overlay-compatible' and rephrase the description accordingly.
>>
>>   Documentation/devicetree/overlay-notes.rst | 32 ++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/Documentation/devicetree/overlay-notes.rst b/Documentation/devicetree/overlay-notes.rst
>> index 35e79242af9a..77284afba9a4 100644
>> --- a/Documentation/devicetree/overlay-notes.rst
>> +++ b/Documentation/devicetree/overlay-notes.rst
>> @@ -103,6 +103,38 @@ The above bar.dtso example modified to use target path syntax is::
>>       ---- bar.dtso --------------------------------------------------------------
>>
>>
>> +Overlay identification
>> +----------------------
>> +
>> +When managing device tree overlays dynamically - such as bundling multiple base
>> +device trees and overlays within firmware, initramfs, or user-space tools - it
>> +is important to associate each overlay with its corresponding base device tree.
>> +
>> +To support this association, each overlay should define a top-level compatible
>> +string (referred to as the 'overlay-compatible' string). This string is
>> +intended to match the top-level compatible property of the target base device
>> +tree.
> 
> This property needs to be defined in dtschema at a minimum. Really we
> need to check the values are documented. We already have all the
> possible compatibles, so we'd need to generate a schema from them. But
> that part can wait as we don't actually validate overlays on their
> own.
>> +
>> +By including this identifier, higher-level software or firmware can determine
>> +which base device tree an overlay is compatible with, and apply it accordingly.
>> +
>> +Example usage::
>> +
>> +    ---- bar.dtso - overlay with top-level compatible string -------------------
>> +       /dts-v1/;
>> +       /plugin/;
>> +       / {
>> +               overlay-compatible = "corp,foo";
>> +
>> +               ...
>> +       };
>> +    ---- bar.dtso --------------------------------------------------------------
>> +
>> +This top-level compatible string is not required by the kernel overlay
>> +mechanism itself, but it is strongly recommended for managing overlays in
>> +scalable systems.
> 
> Please define exactly how the matching works. I assume it is the 1
> overlay-compatible string has to match any one of the entries in the
> base root compatible property. I don't like to assume though.
> 
> How would you handle a case where you have 2 similar SoCs which don't
> share a common compatible string and the overlay applies to both of
> them?

Let me describe what we are doing in this space today.

We are applying overlay in u-boot for SOM + CC (Carrier Card) and you can see 
DTs in the Linux kernel tree.

SOM itself is using

	compatible = "xlnx,zynqmp-sm-k24-rev1", "xlnx,zynqmp-sm-k24-revB",
		     "xlnx,zynqmp-sm-k24-revA", "xlnx,zynqmp-sm-k24",
		     "xlnx,zynqmp";

CC are using

	compatible = "xlnx,zynqmp-sk-kd240-rev1",
		     "xlnx,zynqmp-sk-kd240-revB",
		     "xlnx,zynqmp-sk-kd240-revA",
		     "xlnx,zynqmp-sk-kd240", "xlnx,zynqmp";

The reason is that we have to run SW on SOM to detect SC. We have SOM+CC 
combinations for all revisions and based on autodetection we are choosing 
combination which matches it (multiple full DTs in FIT image).

Feel free to look at
https://source.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/zynqmp-binman-som.dts
where combinations are described.

Today FIT image have full DTBs and not overlays. Overlays are just helping us to 
build different combinations in a simpler way.

https://source.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/Makefile#L351

We would use a mechanism which can connect CC overlay with SOM.
SOM can run on 4 different CCs
And some CCs can be populated by different SOMs (with the same SOC family).

All of these combinations should be working when run time DT overlay applying 
mechanism is in place.

Above is pretty much describing how to connect overlay with base DT and likely 
it should have more then one compatible string.

It should be also described if base DT will accept DT overlay compatible string 
or remain on existing one.

Another mechanism which we are exploring is to use transfer list where SW 
components start to inject DT overlays to it (for example description from 
OP-TEE) which is then passed to U-Boot which should merge them together.
For it overlay-compatible = "xlnx,zynqmp"; in overlay could be used and will be 
connected to actual silicon.

Based on above description I can't see any issue to cover our existing use cases 
if overlay-compatible can contains multiple compatible strings not just one.

Thanks,
Michal

