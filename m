Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359552D0C67
	for <devicetree-spec@vger.kernel.org>; Fri, 25 Jul 2025 09:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753435399; cv=fail; b=PJzFgYvuj1BFF8e/kuK6RgISgjrGi5WYEfXqHUamMRa0/7+g5fYbD1V6SV2Er5ZFBRxRFhLCRWPL6y1MSJIx4KsaoyWp/dw8a4PKTzk0bG1D3J4Ep2cRnSBDJayfGKxL8TGh85I9e2AHGvSKmdRtg8LFy7jfpccIZjmPzj6qb74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753435399; c=relaxed/simple;
	bh=qn+tMaVxd5uORtsWIupMJzBdB4TatKOHJdYug59/Pq0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QnZgI5ufKikiplI+LK6AIg6ocdtwwappr/H8KAKxfgMzkkQV/2vBKP9rhsEPXC6NWggOgY6kiujHt/rVt2xpC42qLG3VKplE7ne7QzqUMKK7U+OWfsJuwCnc5Gb3YV4HzAIcEQ1wrIGYNiOXql3Gq1GxxqTa0iNgfBDwX2Pn/r8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=U6acuZMe; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="U6acuZMe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgDOwlio1JPwtzlXtUS/hLWGxLbk4g82ycRYjRu9aplykoqGrnDfgYrBm1l59MW7n8wWKAU6qEYyUF5RZB/WTiigplEYKBpKGa2FEHSRK0wMSvJPiQ1dbXQo0k9eW+612AwcolIMahgRaPvk9jXZYEZ0/Zo8/Vf9ajyt6Kj4pJsnfL45spEaRNntePatT0UjkCDwbbhlFHaWyLJQjxcb9m/dvOPQkvwXp0x1yYuPq6jxBxakOgaM9G/CMO4B7vN2nfkljg5R8mpohQb05UVyB3C/mW/1+xJdr1G75SeUJkxdvXC3osSmL/+r5UkOEHkFvFd2ibk6E1Jw67SrVmyNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRHTouaiZKYFNGLjL+SnXE3Ki5mwgk3E/IZDnGYcWUg=;
 b=Ncr9Mv2QA59wpATNeDVn6aUKWQxLjeT0JzRBQnXV9gCPsd2W3NKV79IWGhxwdId7cRh0tBopu68o90n6RRYkRubo442u+VTBU06/oRyoHi9mviM/Gb3as6kHiY153PLJhMdL1dG6mLZecHKfSWmOeIdOzArrz7rNsx+PIYif5SRdLdHjPpv0AHbtfKkeIwjYPzvdPYClxeYy8xGOxt/Km+MHSHAgOysEJSuCMJbuaCJ5NdsMp5eO6cX4JGiaJZ06rIw+A0ceeWY/RFs1/e2s9uZXS7WstPyJ0h1YAs+gthws4hBSyVWiQNJIymaflR8WE/1OgysEYNL9XrrTt1NcTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRHTouaiZKYFNGLjL+SnXE3Ki5mwgk3E/IZDnGYcWUg=;
 b=U6acuZMeDQ0xesM1MlhJ1gaefhJrX1VMnG+Wlm/uEAGnZ8kV/KiEq6PBYgy78gp8XG6iZvZx38JTTZl4ZEbPeTti/C2zkLHcJXsSAAXwFthbpwDTmxxPzbiA01NH4fOQjxNdZK6NOFg1TZdudWZe3QujHSG2mG2l5f6mJksq4m4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8281.eurprd04.prod.outlook.com (2603:10a6:10:25f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 09:23:12 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 09:23:12 +0000
Message-ID: <e363918f-2caa-4d96-9cd7-0098d36ab778@cherry.de>
Date: Fri, 25 Jul 2025 11:23:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Add 'bootsource' /chosen property
To: Rob Herring <robh@kernel.org>
Cc: Simon Glass <sjg@chromium.org>, Quentin Schulz <foss+dt@0leil.net>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Daniel Golle
 <daniel@makrotopia.org>, devicetree-spec@vger.kernel.org
References: <20250505-bootsource-v2-1-5a315d9bff26@cherry.de>
 <CAFLszTgdhQHoKLaOvAHcvYatjS3dkSNuy_sr-VxQHgpr88GGRQ@mail.gmail.com>
 <2cf31fef-5247-4eff-ae34-3c9a95824423@cherry.de>
 <CAL_JsqKE+J3aF-tCEH=xwvvKL+K3a9Cp=db90XEYYFhzeae9Vw@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAL_JsqKE+J3aF-tCEH=xwvvKL+K3a9Cp=db90XEYYFhzeae9Vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: 062d1253-9063-411b-96bd-08ddcb5ce0ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGI1aG4yNVhzK09abFBIRHdqemV3bEVFc2JUS1N6a2RXY2xqN1c2UDR2blFB?=
 =?utf-8?B?a1NaR0ttWDUyY0Q4dDUvdWxldVJqOVpiWWdFYUdNd2Z1TXNGbTFvSlFMT2R6?=
 =?utf-8?B?Z0JWY1dQNFhEZjQwTlptK1FUQ1hHOVRKLzdhVXFqbjJxUDlBejBGQVFRNTVp?=
 =?utf-8?B?T0V1ZmVJdVhMRS9zWHgrMHk0alo3VG9NN21lUWJtZlFPaGlkcjdvWmNnVk96?=
 =?utf-8?B?V3pIWDBvMXlBNm03Wi9IY2NZN2pCQm5GWnZJcW1wM2ZibmgrQUZpSVNDZFN2?=
 =?utf-8?B?TzdqM0d0S2treGF1YjVUbzNLRGpsQUpvdVAwZEhiaHB0NmIxd1pkOXAyQ0c3?=
 =?utf-8?B?R2Irc1B3bElWV0UzZmVqTGlZcnFTb0xkSnFZSUM4dit2THZMRmRsWjhSckF0?=
 =?utf-8?B?aytFZktpUDE5bE9vNDZkSEdrV2UxY1BQNkI0bEtGcWJIbGlJT3VDVEtnNERq?=
 =?utf-8?B?aFFwbGxUck00WWdLbWNuZGtVWmlKQy9vNzZrZTNpSDdVRHRJWGQ3ZTZTZW51?=
 =?utf-8?B?eUM4ZlVidmVhTGVFMHcyajB6WVdPOG9PU0dNazVtTjlQdWRwQmYySWZtblI1?=
 =?utf-8?B?b0dnRWR5MkJuS2tkcVNxTXJxL29JeWtDTmFTR1BoRGNIQ1p1Z1JoOFZ6L2N1?=
 =?utf-8?B?Z0xkWS9zQ25sOWFsUHdYZ3NpR0ZDYTRDcDZROE5zdkpiWnBFNnhUb0o2QmNI?=
 =?utf-8?B?R21id3h6bFhxT1F1Mk5yaGV1bnBSUC9ST0hCUVRzSkxmQ3ZyOUxVMGttQmg4?=
 =?utf-8?B?L1hzVExmTk1kbVZVOVA1dndXZmt0dFdFekFhMlhzdGtWa0VvZ2UxLzIzZ0Fh?=
 =?utf-8?B?TjVMYjhGbG1sUDNlc24rZWI4RkxIdGlpMDBPejhxVjlaYzlqWVRQSnJUMkRy?=
 =?utf-8?B?RnZHNm04VUN0dmlQUTg0V3FGWUlmUjJUa3ZaTlNvRm1hZXI2M0hvbXc0SkR3?=
 =?utf-8?B?SWRMeERBUXhkZ0hXdDlPTGovQzB2VmNFZjJKdmVhYzUyMDZhM21ubDlHSnM2?=
 =?utf-8?B?eUltbUtnWEFOcXcxbXFGMTJjdzAxa0tuWkE3a3Btc1c5aUtNVEoyU3A3amxw?=
 =?utf-8?B?SlV1d3o3QTIvYno5WnJJYUQ5LzY3eVQ5RHJFWjRSWXJtdmZCUGh0OTdLQlhO?=
 =?utf-8?B?T2JWOSs1akY3K21jb3JIZ2x1TUkwWHJUQVpUMFRUdm5DMW5XTk1DVm5yVHZR?=
 =?utf-8?B?dUFZa2hmWjNZQVV3Smw2SjAzTG50dms2T3FHdjVkUkUzYjJJS0tKQnMvZ2p4?=
 =?utf-8?B?Sk15c2xhbVFrMmlYTDlDR1JsWjdlUGZaSFVFUmR2L004cjR5TWZNSmhMYnVz?=
 =?utf-8?B?a3RDWTU1NHR6SFpDU0IxMnBEbEFCaXRhNlNvTWxnT2FJcXZRQm1RR1JEZlNR?=
 =?utf-8?B?V0pmQ0llZWF6YlhBdENvcFQreDVmeGVOOFV3aXFwQ2lENlNKQ3RzZG1rbVNl?=
 =?utf-8?B?eW9RdUh4Um4yR0xEcWMzUDRFRFkwVHgvUGJNdlhjY2tySm4weHVuUVpUQ2Ey?=
 =?utf-8?B?eEdUNGVKWVBXVEcvUnlON1NJTHBmZk5wN2luaXd5a1R4WWpacDRSWlBSa3hj?=
 =?utf-8?B?K2hqVFUzZVJDcmY4M2Z3bDYwbVdGYjBJdW96T0I5b2dhNXNnbnJ0MVdvWjVQ?=
 =?utf-8?B?ZWliVkxBRUo4cVE0ejFJbU9rUEJ6cjJFN3ZSWEwxbWJBOVllMUF1R0oyY3hs?=
 =?utf-8?B?d081QU5jVHdnMFc1UWc0QkdIdUk2RW14bVhmREhPRUw1Y2oxRXFWbWRxd1Mx?=
 =?utf-8?B?amNRRTEvVFFmTkVJVC9JUzNpUFhLTitCa0RWQnFvaGVPNU9ydHV3QzBVSlhR?=
 =?utf-8?B?dldCSkFBR013Q0duSlVmUTFQODk0UFhsY3IrSFRQcTcrR1dJVXdUK0xyZzcz?=
 =?utf-8?B?WTVBaHlCQU5ZUXJETjVhQ0JBdVhWRnV2REhzSFlpNG5UanZXUUhRalpZbnZE?=
 =?utf-8?Q?fLIrHuYACTo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGlQUU1mT0FMRlBjcTlydDVkRElGbGcwcmxtWS9GcUxadkJhZlFsRnFFNU12?=
 =?utf-8?B?UStCTWlmVXd4WUNPaytsd0lFVEZwdlpUangyb0hTTU5QYm10aGloVmdrclNk?=
 =?utf-8?B?YUNyM0ZZSFA5ZGE5U3VXenQ5U1lmK3diZWZoRVR1Yk1oeHJVRE4raGpHVEdn?=
 =?utf-8?B?VG1sZnN2ZVBHQ3hVQUFscmxQdU9LcTdFbzVLOC96RHRwT2h4bkwwaUFLeHZW?=
 =?utf-8?B?Y2lDVDJpSGJoMWljSG1qZExmZmRjRSs0eXFJK2NZa2dKWlNweUd4ZVlSVjN0?=
 =?utf-8?B?UzVKRHllaXBkOXRIYytrdm1zb0lnbFcvWGlYSk1mTzB6WTdxVE9iWU1aSkRX?=
 =?utf-8?B?T1lSczhWWmxlR1pIZ3lZdkh4c1FhQkNOQnYvUzN2UG5tTmFwMjQzaUxIZVpT?=
 =?utf-8?B?ZTYySjlDN3pRTzIxc0U2RXVhR1IyV3JQNWx1MmdzamVrOThqNXVFcGVHdStR?=
 =?utf-8?B?UFllZlQ5alBEdDl5QU5OSlFrV01adUQ3RFJnejM5YTg4cENyYi9tMkd4WTlZ?=
 =?utf-8?B?dlppTW9TZnc2aXJ1QW9PRGNSMkJoNnJaYk92dUI4T3RvYnMyZ0dJdmQ2RG55?=
 =?utf-8?B?ZkdHTTNBYmdmbTluc1NCODlrbUxvTVNTV1lrdEJIblFnWmpUWGd2YnYyMSta?=
 =?utf-8?B?Uyt0TDZCQjFIcUpFVE5TeWxBVkRXNkJjV2dCTzRXdHpvMUFPZXlIZTBrMERV?=
 =?utf-8?B?cmVqNlVoQllUTWx1NGMxNHFnUU5icUJTbk9iZ2VEaTlWQWV6bGdKclB3bnhx?=
 =?utf-8?B?VE9nOHB4WXg1VHBQN0syUDJqNXZNbjczYm9UcVQ1WGdMYTVvTmJGc1lNalNU?=
 =?utf-8?B?UmJLclEvY3hBdkE5N1FobWhjOUM3VFQ0MHlJNGtDRjhWT1I4SG4zek8xdWt5?=
 =?utf-8?B?QVBXbzcxQ2lLNGRPQWJJZFY3Wk1Ed3YrMFJOR3puK2R4NXRodldMdGxXUU55?=
 =?utf-8?B?U0VFRHo4TnBYRnJuS2tCOUJPUFpjK1JmYVpDUE02emZlRFVpMFRHQThaYmpP?=
 =?utf-8?B?cU1aeE5Zc21sdjZZOGxrZzU2TUMzQzZuN2N5anBqM3RXcGlQVU15UCtUd2VW?=
 =?utf-8?B?RzVSL2tiQ2pGajk2U3kyTEZ2Ni8va21SbTdaOEQrSVZxd1k3emVBNVlEcTBK?=
 =?utf-8?B?UlBoV2p6blZ0S3N2aGREL0dZUUh0Z2lqckJMalFXMTlxV3JyS3c1dmxKZFds?=
 =?utf-8?B?TkhXVTJMaTluTGJyWG1JM3Z0aGpZY0FmVlpqeEljc2RKRHQxKzE4UGUzU2RS?=
 =?utf-8?B?ZEhMUEkveGZMdXBBTEUraTAvKzV2ZkR5bGNYMS9PT05pUGVSVE03WmJKSTVS?=
 =?utf-8?B?Q05uTVhGSkZuZEdzYjdFQy9TWEM2NGc5MlFVbnJpNFhwVnJ6bnVNMlB6djdw?=
 =?utf-8?B?U1ZkT092NDNKM2hRamU3WUtiRkQ4N1hOVWxrMGRQN2Vpb1hCd20vaU04Vmxq?=
 =?utf-8?B?Uzlrck01WWhWeEV2cXkweUxGTzc1Tmk5aW1zckQxNTVTemcwZFhxeWtoWUdZ?=
 =?utf-8?B?TUI0d1VneEdGNmRDOUpIRXdJb1ZxQUYyUGRpNGl2MDFLU1lrNWhvYzY0SUxo?=
 =?utf-8?B?NFU0d2JUODRuRzBzd3JJdFgvVm8vL1MrbG5Pcm1WemkrRXBLeGxqTjFJVWFD?=
 =?utf-8?B?dG1WNTduSzVZMHJjWXQzdFVkNWpMU0VGWWNlanQ1TVJiSURCaW8zdlFiZWJM?=
 =?utf-8?B?ZzRDMFdVOTlaVXFkTXdPZEZjRUlHU2dhblZPWlMvV2pZbGp0MWJzamp5RENC?=
 =?utf-8?B?L0RJMjJyUTZHanB4UTZEQXNHVDNLVm4xL0d6K3dsak14blBpdEhoN1Z6TUM2?=
 =?utf-8?B?MFFPbjNUZEZBc1pIbjdKVlNNL0dta2VnOXI2MWhrVWJWSmVRdFNDZlBraHNX?=
 =?utf-8?B?QWxkSDMydjFFMDZOY3FMU2R1eDEwdFNHS2MyTi8yMitoZUlVeDFXZ2s2QW11?=
 =?utf-8?B?U3F3a1RnODBFdm1KdkdKR0Q0MXRCeEhqVHdCRmNnOEJrWjNUV1pFT0s2aWNJ?=
 =?utf-8?B?d3RWVEpMYStUYWhmSmRKRmZFVXdNeHFScWROMmptYi93Q2VFV1MxVE9xTitm?=
 =?utf-8?B?bUx4a1A2eWhPMVVScmM1T2FXUkFRS3RWaTI4V0V6UElYNU53enA0Q1hoR1lB?=
 =?utf-8?B?b2wyMHdKL0IwamVXZmoyaEx4bC9CN3lmRU0wMTg3YzJ5KzhETU40b0JpaWd3?=
 =?utf-8?B?THc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 062d1253-9063-411b-96bd-08ddcb5ce0ac
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 09:23:12.5322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynho82RS4ERnFbS8jw9FT4gbpjrn7MS0uPH0LQVX9wsEV+2LS8Lk1bXe43rOFvHHJhRKDEx+9+UN/zUaIS7vkRVvqjitNbCLDgnP0pS46aY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8281

Hi all,

On 6/10/25 5:29 PM, Rob Herring wrote:
> On Tue, Jun 10, 2025 at 9:52 AM Quentin Schulz <quentin.schulz@cherry.de> wrote:
>>
>> Hi Simon,
>>
>> On 6/10/25 4:26 PM, Simon Glass wrote:
>>> On Mon, 5 May 2025 at 09:34, Quentin Schulz <foss+dt@0leil.net> wrote:
>>>>
>>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>>
>>>> Bootloaders typically can be loaded from different storage media, such
>>>> as eMMC, SD card, SPI flash, EEPROM, but also from non-persistent media
>>>> such as USB (via proprietary protocols loading directly into SRAM, or
>>>> fastboot, DFU, etc..), JTAG, ...
>>>>
>>>> This information is usually reported by the SoC-ROM via some proprietary
>>>> mechanism (some specific address in registers/DRAM for example).
>>>>
>>>> It would be useful to know which medium was used to load the first stage
>>>> of the bootloader. SoC-ROM shall be ignored and not reported in this
>>>> property.
>>>>
>>>> This can allow client programs to detect which medium to write to when
>>>> updating the boot program, or detect if fallback mechanisms to
>>>> unexpected medium were used to reach the client program's execution.
>>>>
>>>> In cases where a boot program is split into multiple stages (like
>>>> U-Boot), it only represents the device that was used to load the very
>>>> first stage (in case of U-Boot, VPL/TPL/SPL whichever is executed first)
>>>> and not any of the later stages (in case of U-Boot, TPL/SPL/proper) or
>>>> any client program. They may match, but they may not and this property
>>>> is meant to only represent the device used for loading the very first
>>>> stage.
>>>>
>>>> I have a board running U-Boot which currently has 9 boot scenarios
>>>> (eMMC/SD/SPI-NOR for the first stage, eMMC/SD/SPI-NOR for the next
>>>> stages; not counting USB loading yet, which would make it a few more). I
>>>> cannot force the BootROM of this board to select a specific device aside
>>>> from erasing the other media.
>>>> The only way to identify which device was used for the first stage is to
>>>> parse U-Boot first stage console output or add some custom logic for my
>>>> board. To validate that a new version of the bootloader works, including
>>>> the fallback mechanisms, I need to make sure the BootROM loads the first
>>>> stage from the expected device otherwise I may have false positives.
>>>> This would be useful for automated testing.
>>>>
>>>> I could also very well see this being used to identify where the first
>>>> stage of the boot program is stored (which may differ from where the
>>>> later stages are! that's the case for U-Boot proper for example!) to be
>>>> able to update it from a client program.
>>>>
>>>> Note that Barebox has been using this property for a while already, with
>>>> this very content[1].
>>>>
>>>> This is chosen as a string so that it matches other properties in
>>>> /chosen (e.g. stdout-path) as well as allows for extending it, in case
>>>> one needs to provide additional information (e.g. HW boot partition for
>>>> eMMC, a specific disk on an AHCI controller, a specific USB device on
>>>> a USB bus, etc.).
>>>>
>>>> [1] https://lore.kernel.org/u-boot/0066fcc2-3431-48be-8dc2-00ea7e2550c2@pengutronix.de/
>>>>
>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>> ---
>>>> Note that this property is already set by Barebox and I'm planning on
>>>> adding it to U-Boot as well, specifically for Rockchip SoCs.
>>>>
>>>> I have some doubts about the wording, especially in the case of
>>>> hypervisors or chained boot programs. I'm not entirely sure what would
>>>> make the most sense to put in the property for those scenario.
>>>> ---
>>>> Changes in v2:
>>>> - added usecases, non-usecases and increased verbosity of the definition
>>>>     of the property name as requested by Simon,
>>>> - Link to v1: https://lore.kernel.org/r/20250205-bootsource-v1-1-95f4ba69ac27@cherry.de
>>>> ---
>>>>    source/chapter3-devicenodes.rst | 17 +++++++++++++++++
>>>>    1 file changed, 17 insertions(+)
>>>>
>>>
>>> Reviewed-by: Simon Glass <sjg@chromium.org>
>>>
>>> Does this need to go into the schema as well?
>>>
>>
>> Considering this should ever only be programmatically set at runtime,
>> I'm not sure this is necessary?
>>
>> But taking into account that u-boot,version is part of the schema, I
>> guess this could too :)
> 
> Validation can and does run on booted systems, so yes.
> 

See https://github.com/devicetree-org/dt-schema/pull/169

Cheers,
Quentin
