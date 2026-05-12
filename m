Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B761037C0E4
	for <devicetree-spec@vger.kernel.org>; Tue, 12 May 2026 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599753; cv=fail; b=SxqbkFyztCX+1WtbeNxD8wIKHSyvOjtb6lDkGvBfXsZiWWgKqggkqNieULNAFYSmWJUDfoQxcGzX1lA6X2D3AUAEH0ImfFkUQs5O7U1J1UNFp89Sz04N9Ttv2X9t6vHbMbtluK7y/Q6qfw4QCGxUSETG2ttlCkMf9z+G0aEWd78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599753; c=relaxed/simple;
	bh=TXxrmfAG/xngg+jCt596DEygqTnlcsJL/Fb3+o5IPCs=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OgMtl5YDf8zNcTcjtvRVzFJ4tchemFMwPQ0kqPwkaMl0vnt/mmAfVdLenNZM9Hep5A7IwR5oI8W9sn7Z1+o/LxrGg5qIXUdpzScLC2qjp/fKG/N0BWFsQZ6F3aUfGM30pXXhML/FtVv+T3kxfe9yhSX5MBZXwwKy8u1y23TS1YQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=XEbWIUkg; arc=fail smtp.client-ip=40.107.162.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="XEbWIUkg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCWSrM09RWoAaDvwTyOWtVQSJGige9AQEQ5lgKCRpyDKyRl20sfzlPeteUHFNpw1zKOarVZz1vM1EyB1K2bYY6opnN9fvEk1KwTd2n15s879bbHFfFelpOsbDSezitjKirMHiZye5FVLdj+fHKfnieHkw7f8p6fENTAXyiut0X5UnD3mwE3qVjoyMz6rCwX0ZBIlvQjzbrpA4706hPRinxFbqsY03ffKHUYjwtdSoxN7EOyj3iIdWuY4fd9PQ3QLgFU//sZQ2J4kdeE5GhCREPpYzM10C+QzdYmLQJPcRwxz88dtYnsDKxKEsBrkOv3v5LHV2zMKUIKUwLNL6kFgdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/rVY/g9buez8edVM8O2VYYQKVsZWayd2AzixCXn4IE=;
 b=ojNoRto9maLDgjls+3Stu0ui+wB1a8j3dFtf0YeGHr9cPO6YcaFF+/KwZXQ13fJNXpPtWDamlC3TtF3xKkgg8B+i/wEejvOqUGzwzs+P6NQtwbsdfjbStwXJDSw5cZgcAVnT2jPXtFC9IvIWce2hrVSVAHPr9WuFfOFebtirgwGj6khSvWcnME8LeKB98vOPVbPWiSCYt6ghtuUugfh5pu/W6jgK2wB953W+B0cXO+lVGaJoyOkCdI09rroSdvO9ZddFH7KHntGfYtOfcBPjSUQQ8Q7ad7gaXmV4tZHEPP4nhZ06dZP3k2Kb9LjiIr6tP9HiG4VcytzRIWMKHTIFDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/rVY/g9buez8edVM8O2VYYQKVsZWayd2AzixCXn4IE=;
 b=XEbWIUkgrF03WwdQE1puZ4sSaINb/KA6wAqcLyM8R4FBFbyxbd8QG+uY1qWwq00eTuHlTyhBEkkgkslzakLcGptzZGS3AeaeSgs1brtj2H1aO0C3J7fF2H4nz5di9wzPwUprw4X09riN4Mccf7BK66ztWsmHILLpbuUaYRb6TA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA1PR04MB10892.eurprd04.prod.outlook.com (2603:10a6:102:488::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 15:29:06 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 15:29:06 +0000
Message-ID: <2775464f-9da6-4e6f-b6ac-e84901cc3727@cherry.de>
Date: Tue, 12 May 2026 17:29:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Pass reset reason to Linux via FDT
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
 "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
References: <579fcbc186ad2aeea3c206aebc901b64fc665db1.camel@siemens.com>
Content-Language: en-US
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <579fcbc186ad2aeea3c206aebc901b64fc665db1.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0215.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::36) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA1PR04MB10892:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f6f02b-2eb9-48eb-f3e2-08deb03b3466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|3023799003|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xEW8s6/qT3dI5mj6u13Z0CHCkHM7b5NpcurZg0xZKPF+gyN6VSnV6Q4YwmNVexcBt3kTU8Ji1etJ3YFI/zW7PAWQGxd2FRQFyOiw+JP8oE+brQY1G2qICgkLaSTw0as4ZZmfHHy1+kDTthJIlZv9sUHDxsR6Urj9dnLcEtR+n00TO8F5ZeAZS9RHnw4H5apIQFkGikkU5w324BjhIactm5CnuvYxEUCW4I8Y5YOLwfd4U5CBnQjPONtdqgh43CHSEdSwdIIP3rKJI7F0FJHyAhmJ3bfE9wlZajhSEchrHAgTegclAtlpq3rtzWcHV7ezDrlYYbOegqKqZs2g3uH3p+GCex5W9nlZQnVKg7EHmWKK27P1Xot6Ksqz4J5Td6LgtHWiyYBiIXbnW8Pkk4GYRsJWca6MkpSsA5co83zzM+kU8VpJWFnrs93uLr5qq/t+lvy4kqjm6r3nDeWgrd0jQ6jsU0YO3Z4pcgaY2o979uvAFdpyphUGJ4/oHJLZnmkF58OLs9bQGzA9YoH9DNlmMMrYk7hZ2Be2pqlHpg5FdLWDgV5sCztRsuRGwtZyqKBnaLrSAig7oITTgWcVOW1RfoUcofGi40hGctwTln+GISTKX0Jtb/e8KqWoGqb0r8OUNYngDxccjhG+N/ngvGiafw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(3023799003)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnVwVWtRTUsxVEN4WURyU29YVTYzTnJwZWNOMDRZMUpOR3Vqak9FcHRQb29u?=
 =?utf-8?B?WHcyOUY0RHVXQ0tpcnJkbUtYK25ZUTlNbTN2T2Y1VDVzbHo4TyswWUZOeXNP?=
 =?utf-8?B?TWdyblprRnMwSFNJY0hSa0NIclhoekd0MUU5d1ZuTE5IMDR0MkNacUIxb2tI?=
 =?utf-8?B?YkJYL29ZMVl5WGcwYnJaUFdBUVZLdWlMUmpVRGF5ZnVwUEdidUdIaDY3QWhs?=
 =?utf-8?B?dEVLdFJ4bHFOY1p0dTVWVWVVKzJST21oTmhNR3NmTmdYR3pSV3d4eERzVjFO?=
 =?utf-8?B?RUpQNEpiSnhIeEZJemZzTUFTb1JreFRoeEJ6VWs1Ny9BL1A3WVAvMGlnMS9M?=
 =?utf-8?B?WGZ1RFlMcWtBcmpuYys4WjRTdWYzbWdaU2V2K09YT25lamYwemdjN0dMRFNC?=
 =?utf-8?B?WndGdC96NWt3Tk9ZdkpHSkNONmZMVjdrNEZneiswWXpkSWlFSjQyUzFJdzBq?=
 =?utf-8?B?NDBObDhoQStuU09LSTZSYkZWV0RDQ1JvS2dKQ1Irdms2MDJDMDNqQUsxMlYr?=
 =?utf-8?B?MEZDRGRqa2Zwb1d3NlFpTFcxU2JpVVZuTFRXcUxJMjlGbklXU2ltZDFqSVE0?=
 =?utf-8?B?aTMxcDVxbmZwMzd3OUlTY0xiSFhSVmVtdC9jcXdMQ0xPLzM1aDN5b1V4U0NI?=
 =?utf-8?B?VUJaZ0FMRDlXOEwwQVM2MHVhY29YOXRPV2FuQjQ4bllaUTY0aHczZlVjNTd1?=
 =?utf-8?B?cVpNbjEvU3ZZQmZEdVM5VmczVklNU09YaWo4dzJUa0hhWkQyazFxZkRveE5N?=
 =?utf-8?B?b3ZKSUhRVmdtYWwzOEdrM0FrQnlkSGV5UG5kNjJnRHJwcGVlVUptenJrV2ZT?=
 =?utf-8?B?TnBpdDJMQ3J6NFdJZkczOUoyNDBGZG5yUDlrek1kUTRqbmRIaFZONmYrSlFk?=
 =?utf-8?B?eVFRcUl3OFluL3JSRER2am9sVk9pTUQzV2JlRkRuQ25aTm1SZ2pHMXlyaEJm?=
 =?utf-8?B?VmVzTkFRUEtGY0tVcUExQi9qbkYwK2FIWEZqUEo2NGRtT0JHNXhRckgrYkd3?=
 =?utf-8?B?QTNXamowQzFxaFVHQzBzTTNOWWRFRGN2YTJZY0ZrNG1WWDZReEZMc3ZWWGRh?=
 =?utf-8?B?ZWMvdk1vMUtMMjFUQjkrUGEwU1Eyei9NY2NFL2FiWndUc0tvNXpKcEgwODhv?=
 =?utf-8?B?QXdGUUVOR1ZnU3hHOGtUVkZ6VTI5M21vVUp3WnVZd293eVlNdGJiSW9tWEhE?=
 =?utf-8?B?cENDVm5jWG82enZZdjQ2TjMvYWRFQUMzOWZ0MWtvZWJROWx1TE5RRWNWeVdl?=
 =?utf-8?B?Mkt5K0tBYVhRWitFYWJ1eVcvSHYyM0FOOGtVVUF2d1ZKRDBXcEtSL3VZRDB5?=
 =?utf-8?B?YVlzWDg4aW5lck5aV2NNTDU4Q3F4ZHo2YVA0NVV1RG1kMEEzS2RLMklDKzZn?=
 =?utf-8?B?WlFWWWtoYStwRXRvalNmOGRXMjFBNWRpVHMrV3paVkllbzN4NHI4Z2U1Z3lp?=
 =?utf-8?B?V3FYeC9FWWMxU0VwWlUyUU05ajZsZW13bnpyMHZQM281UjZQaUJwS0g4V0o3?=
 =?utf-8?B?eDRXbjBXNmRXcmwxTzYzQWdBTE44emo4dTVEbFNUbTV1a2VReVY4MVpwd0Nt?=
 =?utf-8?B?bVVzOGxxRXQ3RG11S29Yc2FaMWVCS1VDOEZSYUZuN2VEUk01Mzk5emc0anJI?=
 =?utf-8?B?UjZ1ZE0xUlNQTEZJUUNQcmY3QW01SmgrTGhmdzBuZCtrN1QvZEJ5dWNZamFw?=
 =?utf-8?B?S0FNZ0hGbUVXR1ZFaks0ZDcvRzRXYWd3MnBqUDhwTDY3MkZwSGluRUh5NGdx?=
 =?utf-8?B?cmdmbWRQS2Z1WURYdlZOa0FRNWtaUGpCaUtjeVRZc3BUTi9EMlBJQm4ybFZy?=
 =?utf-8?B?ZW1QdHkvUFdMZFV3L3E5SDcvM1FwTGJpa0NMc2VYVzJvZlpmaDhSb2UvRS9P?=
 =?utf-8?B?VGxCd0R1QldveTJZN0pjMTN4OHVNQktaQTdvb0NuQ1ZQckJxM3pFekM5V1o4?=
 =?utf-8?B?bklhZTJXTll4bEZIWmZGVHg2dzVja0MzN3J5TUdTYUs2TUR4Z2NhOEFKaTZN?=
 =?utf-8?B?TE1scXJOSnExKzJYYk5Pci9DRVhrVHVLaFhGQmkyQ1RKdGdHelh0ZUUvUmhp?=
 =?utf-8?B?VmZ3elFXZGJOTjE4VjRDYnJzL1JEYWZYUTNPa1hqUnVnckZvcStNN0J4bEUv?=
 =?utf-8?B?N3QxcjJkaFlsRDRsaEpTM3hLRVEwMjFWd1V5UTJRc2hzMVZGTzROK2Vpb09h?=
 =?utf-8?B?Ymt6RUh6bmpSRFpCeWtkaUx2YmxScGpGeUxzeXJwT2YzTE5hT0VicXYveURB?=
 =?utf-8?B?a2d3RzVJYVVjUHBUQlQyQUFjd3FFaSt2VlVQY2tnSVFIWU1pa3dFUWFWa2Nq?=
 =?utf-8?B?NUdKbHNVdVM2NG51RTlJY2tXRk92VzJEbHZlMUtsNWZMSWw0NWMzenFRWXdR?=
 =?utf-8?Q?0H12aCGAe+QQt9zFgc3BC4FVfECkkexjSZJO+LZa7ZuRj?=
X-MS-Exchange-AntiSpam-MessageData-1: 8Xen/Ix3NnMDUDfLqnAmi0Kyx2u5IVvKuKA=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f6f02b-2eb9-48eb-f3e2-08deb03b3466
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 15:29:06.3296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AtK1HEmJd9cbosFRvyYtljipgr/gCe8VuqMMQyYGiZviqiqmJTUGg5A/aSYOd4Zg0WoNYNbaeR9jZtYOJy6Jo/6/KQv4wQ82Vxgqe3AVqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10892

Hi Alexander,

Adding Ahmad for the Barebox side of things because they already use and 
set something in Device Tree as far as I remember.

On 5/12/26 9:27 AM, Sverdlin, Alexander wrote:
> Dear Device Tree Spec Team!
> 
> I would like to receive your opinion on the new /chosen/reset-reason property
> I would like to introduce in the spec and consequently in the U-Boot.
> 
> I've posted an U-Boot patchset [1] with the proposed implementation which
> would work on TI K3 SoCs initially.
> 
> - Do you think I need to send a formal patch to device tree spec?

We (U-Boot) are not merging new Device Tree nodes or properties without 
them being accepted in either the spec or in Linux kernel Device Tree 
bindings, so it's not that we think you need to send a formal patch, is 
that you must and it needs to be merged before we can use it.

Yes, this can take months and be cumbersome but Device Tree is supposed 
to represent the HW and be system-agnostic so we should make sure all 
bootloaders or OSes understand and fill the Device Tree as intended.

> - Do you think /chosen/reset-reason is the proper location for the SoC/platform
>    agnostic reset cause information?

/chosen is likely the right place considering /chosen/bootsource which 
is also added by the bootloader.

> - Do you think having an opaque string there is OK, bearing in mind that there

No.

>    is no standard approach up to now to this topic, neither in Linux nor in
>    U-Boot, taking into account different SoCs and vendors provide very different

In Barebox there is a way though. Strings are bad, and even more so if 
they are free-form as vendors will either be very inventive and there 
can also be typos.

>    information regarding reset cause, which is barely possible to unify?
> 

I think you want to have a read of common/oftree.c in Barebox, 
specifically the /chosen/reset-source-device, /chosen/reset-source, 
/chosen/reset-source-instance properties as well as 
common/reset_source.c where they also read /chosen/reset-source-priority.

There are multiple issues with the suggested implementation here. How do 
we handle a device with multiple IPs possibly triggering the same kind 
of reset? E.g. there can be a CPU watchdog but also a PMIC watchdog. The 
difference is really important as on some system, you need to reset the 
PMIC so the power-rails are reset and in the expected state.

What about an SoC with multiple watchdogs (Rockchip SoCs have many 
different sources for triggering the watchdog)?

Considering Barebox has had support for this for a very long time, I'm 
sure they have some opinions on what to do and what not to do :)

Cheers,
Quentin

> The proposed change would look like following:
> 
> diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
> index 63f3c12..d908426 100644
> --- a/dtschema/schemas/chosen.yaml
> +++ b/dtschema/schemas/chosen.yaml
> @@ -183,6 +183,20 @@ properties:
>         will assign devices in its usual manner, otherwise it will not try to
>         assign devices and instead use them as they are configured already.
>   
> +  reset-reason:
> +    $ref: types.yaml#/definitions/string
> +    description:
> +      This property is set by the bootloader to indicate the reason for the
> +      most recent system reset, e.g. "POR" (power-on reset), "WDOG" (watchdog),
> +      "PIN" (external reset pin), "RST" (software warm reset), "THERMAL", etc.
> +      The set of possible values is platform-specific.
> +
> +      / {
> +              chosen {
> +                      reset-reason = "WDOG";
> +              };
> +      };
> +
>     smbios3-entrypoint:
>       $ref: types.yaml#/definitions/address
>       maxItems: 1
> 
> [1] https://www.mail-archive.com/u-boot@lists.denx.de/msg573811.html
> 

