Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688AB1E9B0D
	for <devicetree-spec@vger.kernel.org>; Thu, 30 Jan 2025 16:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738255644; cv=fail; b=kkRXkXs2hWJiO6UNlbLdvKHKbOYgVtlpErpCRrtOwh+RBquP9AzbsjAdBn2hQC5CjVPczec3RM30QqFrlSk/ukYdUruZY44Rt1ys/rc8ubZe5V/7iatJKxZtlaav0tLy79vb07J7FuJ9SJqv7pdnAT9ueSYN3zm9+JT1lFDhiXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738255644; c=relaxed/simple;
	bh=EcoJtbl1OtgOabDKR3ULtcE1srb4uUNjxyYjZ7LPIFk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rjSJPyTliJzEFtAQbizIf+WvQBkOSKZ4wxkZsLrkQzGOthKT5xQtVo2kyNdKH/0hRZ6+aNzVecYIi1TkyEyleDktOiHmyKxcPkRfbadjviNnFaVri6OwjyPzsu3LJxYK8N9vqFrenUJ7R3RFwJ85ffbHl625/O1nLhrWCIkREVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=CD57HLn+; arc=fail smtp.client-ip=40.107.22.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="CD57HLn+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufq7nNYZGeZwBnYxS4wUTpHgY0oMFG4mALBmM2gQY/39AH6bmU+jKTRggtSYJoOwvJ6ZtJphhSD8/iSk4BrFVwVL1XhNPl3BBEKe1WhdqFITG93sToDQCZN7Y4sMxediqo+Iz2kcTsoXyl/yj+EXym1cDcicQPIe/fzd8/BPQmGzbfIJfnxqLrBiUzsNgaYrVGtGDml6omLDSmxUN+q0GqubiAUnbjiviYF5kGVEMCg7O6CJz8+90DYD3oGAkIVIiCIz8k6mQBQ/1RqnYah5licffJA1DErTlumEqTRU3+QaVXQExddPDNi7bzdgV346tES/tb6+ZTSR4ZqfDrzooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMEEwW7bD7UoFNMAwto7+hwSMNajxZ/CQpRhWxkBLJs=;
 b=U6BTTSkhhDEA4ArYNAcVE6PoiSVF2co6zUOo5ZNIXKgkqYteQK2msk4dvnvcZ9i8p1IXt48ltCu/iMR9eti05jlnzZ1kwqzINOzjGHW+tyMmna+jgiNv8F28wiXmSorG/Gp7Qf3+lsw7lCLgJX9OBub1d+mlCAw4ql5jgh8rl8CCO0U63NcGLwI4UmxOXr5G84S6BsPINtKIc7F80s+5auxE+VDlG4ezJPCjfCK89c1HjLS11kafsTNdwJex4X9vBQZ2vsmS0QhesbhFJazgB5VfW/98WHkChCdfSFJCVSIuR2/N7/YbHwuLL/FtCOKGDov5fCwwSTxKcGB3JYC0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMEEwW7bD7UoFNMAwto7+hwSMNajxZ/CQpRhWxkBLJs=;
 b=CD57HLn+eNrQ2TvqtWs50uPZBggMS2PVyLa78pVGbgXgezcHXMHDingEoESKIo8XFiyRrZrXrbyr9mfG6YnnrRgilg8MwJdxBPHOHBcoHBG26ZZ2R4y0L4RvlvWZ/DgPMwdfspNuOT/uRQmQlnyq9lX6F3fpDC4Xf43IV2prVmw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8726.eurprd04.prod.outlook.com (2603:10a6:10:2dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 16:47:18 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:47:18 +0000
Message-ID: <c1224497-69cc-4a76-a63f-4445e341c374@cherry.de>
Date: Thu, 30 Jan 2025 17:47:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Adding export-symbols to specification
To: Ayush Singh <ayush@beagleboard.org>,
 Jason Kridner <jkridner@beagleboard.org>, d-gole@ti.com,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: devicetree-spec@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
References: <024685af-4694-4c22-bf83-a04dde6e32bd@beagleboard.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <024685af-4694-4c22-bf83-a04dde6e32bd@beagleboard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0382.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: d5cbbd3e-8b0a-443b-5230-08dd414dc217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFUwNnRJTXlQaGhWODJNb0lyYThEcE90TTU3MVF1VXRLVWFNL3RpaStLUGxP?=
 =?utf-8?B?ajZZN0tMZjhWT09OdFA4eFNpVXo1cVpEd291L0lHd3ZXV2ZMUkcxeXF0MkZ2?=
 =?utf-8?B?OWYrSUozYlBlMzRTUytlTURGVWY3ckdzaTRtSytoSDV4Sk9ab0U2N1p5MGhC?=
 =?utf-8?B?MFhwZmY3NVh1MjVpQUYxV3ZMK1ByaHJ0eks5Sm9tZ1VtaUFadWFEd1k2VE1X?=
 =?utf-8?B?RTlFQ1hKWGRQWFk1aHUySEVSTTNYUmx1YXEwcTh1R3hJNTd6emxBWVI3RzVx?=
 =?utf-8?B?b3VQeTRmQXU0TVBqZ0ZvNzgyaEk2K2k4cGJwRXBXZnkvTzFPSGdrZUFoTzhT?=
 =?utf-8?B?OVIrWjNTajduVmR4M25lMldkOUJXTGN1NkxsM3VKZ2YvZjVERGdUVHhpaTBW?=
 =?utf-8?B?WXp5aWxTRG9PYW1sTjcvTTdkMGw2c1AyRUU5UTZ6SzRGZjVqQ2tSNXdPNzBL?=
 =?utf-8?B?MDY2bHFpbFJYZUtaK3hhZWxrUVFmNWRsT0ovZzFUV0FicmQvNWwzZWdOWDl1?=
 =?utf-8?B?d2R1aU9ySnBoN1Rhd2NmZTFPeW1kK0JtTndvUVhQZ09vaHh1Uy9aOWVwQzVV?=
 =?utf-8?B?ZFlabll2RTNRTlNoZGp2WUNWMjVMNWpzYzh0c21LSmtJSnRZK2g3UHJIeWli?=
 =?utf-8?B?QWVCNU9rZ0ljSThlVHhQUjZHSGV5VDhQNmp4b2lKVkppMVN4b3J1WDg5VUts?=
 =?utf-8?B?ZnM4Z3owWTllNVN0eUM1YWg5ZWJYTDAzSVZRbW1BR09zaDlXRzZUbllUTmMx?=
 =?utf-8?B?aFptRnpsckV1cWJIa3BhUlJTVE9VVlY0Sk5Fa1A5WDl2Vy9rRDhPVWZWNVhY?=
 =?utf-8?B?T0FGLzl3QnV0SEYvUWw2TExVQmc4cjRVMG1zYmZ6dUNIeUg2K3JBVDZYb2pT?=
 =?utf-8?B?b3RSMW1BeVE2TmdTbFo4a3pFMHJweHNtei9NL2dlUVpsWmZ2S2dFNVFKSWky?=
 =?utf-8?B?UmYzVDVKY3NmQUJEZjFha0daeStDZytZNkRRRWM2dm0vUmdCaDRqS2lsdSsx?=
 =?utf-8?B?Q09aQ01PZkk1c1o4bmZkd1pObDJTTGR1U0NtZTZWTDYwTVhxVFUrU29nUklB?=
 =?utf-8?B?V2lrNklnNE5ZSXkwTlFaU1dQMExkb0toQU02eGovdEZlVEFGSzZoVFhyK0xD?=
 =?utf-8?B?ME95U1F1T3ZwdWlUNTBKS2xqM3ZZaTRzOERGV0huSFJDZCt0R3BkZEFoMVJI?=
 =?utf-8?B?VStmWXI2MTJPbGNSSC9jWlpQbzBrMHZqY1dBSjQxQnVDaC8xWndZN1dGR3lm?=
 =?utf-8?B?VTVFblBWdVVteFB4T01hTjNaTFZVeGg2S3VlVWwyQXROUlJGM3pVWDhZb0lS?=
 =?utf-8?B?RXZXcVcyRDRoclVJSDJFdCtYbHhJanc0bUdjbE5nQUQ3aVZFL29nQkphbTlK?=
 =?utf-8?B?Yk1TejdlZ2NGNTZBSmhFczA3Y1MyVmJCQjRKNmpOVWpNU0tXMjFyaUJrSEg0?=
 =?utf-8?B?YVhTdW9WUlRzQmljdkkwL21wQkVpT1R3bEFVY1VDNnJnOFVmWmJJc3ZBeXVJ?=
 =?utf-8?B?VlE0RXdkb1lsQ1Rqa0p5bG16WitQTGFPV2RQOUViTGNPVC8vTnB1akIxMXRB?=
 =?utf-8?B?K3REUTNHTmx0aGNjaVM0cm5GZkpIcE1IYkd6c3NRSTRNS1VnQWZ6eGJEZ0ZO?=
 =?utf-8?B?VXg0dWx6cUhWYUpqZ1dpdkZHaU9zUEZIQ3BDeElJL0RWaFBUZWNjY2loZlRS?=
 =?utf-8?B?RXJGUVRQL256em5ZQUFTUVJVWHJieDdIVlV5bnlwbVFHdm9ZZWJMTUtuQ29K?=
 =?utf-8?B?bzFqbWU0R01GSFFQcEF2aTJvZnNvL0pWSTdFeGtIV1lSOWZkMEhWbW1pODZx?=
 =?utf-8?B?Ymo1VFNoeFdxbEF5VXU3VmEwVnhETTZpcFM4bHFTOUI3WWZXcnkybS9sRWgx?=
 =?utf-8?Q?0N1kXGNhK9Oze?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUd5ejVoR3l5ZWpTeEdhUHVQc3A0eXAvaUlRd29uVzRkZ3ZZTVMvcWgwSmti?=
 =?utf-8?B?b2NTNGJHUlNEcGZjWDhwMmlKK0FDRk14L1FCNkRQVEk4T2prM0dUZ21ZNld0?=
 =?utf-8?B?N3V3aVBsL1RRbXlrMnBMenE0LzFNR1NnWk8wS2V1Y09VR0FtdDJoa0VQS3pJ?=
 =?utf-8?B?b0cwWDV0aU1wUk5hYzVwRTdDaUdEWm9YTTF2ZFgxMzI3TFc0OXJSeUlrMHBj?=
 =?utf-8?B?R250cE5aVkYvQ0grSGtQcFFBVm5xRHk5UEZySlZERytrNDMrdW4yeG5DcHBq?=
 =?utf-8?B?NVdIbU9aV0tTMExyQ3hsRmtmSFp2RUZUMFEwOUxReDB2cUZrNENuVkNzU3Zq?=
 =?utf-8?B?eS9CVU9Lc2NvK1hTUHowQUlaNDZDdGpBUFdLWHRtUGNTa0hPMFN5N28yZDAx?=
 =?utf-8?B?dTRybjBiY04vTzhRY0Y5OEttU0lvbHUyN3dXRXlPcWpPYktZckdDZXNqUWpr?=
 =?utf-8?B?NWVVM3NwcW5pL2daK2YyV1l6ZS8ySWJPbWpvV3VVSkNmWEVTWDJjVjJhaEZv?=
 =?utf-8?B?b1pOTHd6bFZYMkJIVDNtT3ZjaDNJMytPNTRRaU56MmN6b09xUTB6MjQzenhS?=
 =?utf-8?B?WlpvMDh6Ui95anV1S0tYUGhnaFhDQ2VzUTdZVDUxMHFmRmV5NjlHdENydURn?=
 =?utf-8?B?ZGIvL1FFcElmTHdyRWhURm1xQVMwclA2SHBzMkVHNDJaWmtsS3ZTYkhET3l4?=
 =?utf-8?B?YmRueHRRMWgzeVB3dkVDaEtTWHN1bk84K2x0T3JjV1c3cG4vb0YvNmhROFpN?=
 =?utf-8?B?b0RjTGROZmJ1VS9ZMmVOb1ppQWZSZnNoWThBOVkzZmxRYkMxLzJoaG8zUDRm?=
 =?utf-8?B?S0pLQU5IUXRyL1YvVFJUYWpVNGRmdWs2bU1SRS80andzQXFCYXNUZHp6dnlN?=
 =?utf-8?B?dkgwa2tEaXg2WHpKWWZWY3c5K1lULys3S3dJMmlCNzRsTktEOU80Zkp6Nkta?=
 =?utf-8?B?SEhMamRmVWF5Z3gxMUVvVThaL1pjKzYvLzFuZEpFK1JwSlZyazJpeDlsZ3JL?=
 =?utf-8?B?cVBZamdIL2VnMy9pYWtZNTBlZVVuYUJzNFZBRkRUMmRraG14eGV6ajNhU25m?=
 =?utf-8?B?OVR6a0k4KzZRMFAxOU1RSnRFRmtCSmNwbXpNaVhoZUpWbElFampvQlVFK29U?=
 =?utf-8?B?M3Vkd2dWdU1BZ3ZzTmVCd0RGUHgvZ0VGOVROZlNVbmNiUTJMd1Q3S2o3MVZ2?=
 =?utf-8?B?VGQ2UTNUZ3RwTElCa1AyRVp4NzlWYXVZSkMvT3JmVnc2ei9XdTJScFlBeVBC?=
 =?utf-8?B?SmE1UlhSV0VoZGQ5WHpmVkhlZXdUZWpHbTNPRWdlSmx1MzJBa0tVT0VRWWdz?=
 =?utf-8?B?blcxaVlqRE8xNmV1dHpkUW1aR2RuOVhHdWtzK29rZVNjanpTK2ZDdHZCY1hm?=
 =?utf-8?B?MTVzZ3NRYkI1ZlhVZWNuQ0tteDFRdFR1WHkyRzBCeTd4VGZxNHlYOW9IT0xI?=
 =?utf-8?B?MzA2ZHJYZUd4QUJkS3B1SkJaY3R6bDFZWlpBckNuNENhMThYMnNFZEoxb1dD?=
 =?utf-8?B?N2lHVWQzSzRnZW9zaUZKTUJRYTh2RVg4bEt2TkhMMTVhYnQxQkxxRDZiTlNE?=
 =?utf-8?B?eUhWakZVNGY4eVBPMndLbUhSVk5FeE16TlhpU0VyNm56enU0QUtPWEtlam5P?=
 =?utf-8?B?NmxIRFdLckYzdDlFcXJVZkVBM1BsSUtMWVZwVHUrWDRlQS9rNFFEbzc0VG9D?=
 =?utf-8?B?eDVDcGxyTjg4TTZRTXdlbEFsVm1jZmtNRFE1YzJONjUzK084M1BRNDcvVk02?=
 =?utf-8?B?WlQ0TWliOS81dkx4dytXWmNFV2VvWnBwc1dHczBjak0zenVQQmI1TkdqTWxP?=
 =?utf-8?B?MVJqdE44R20rMHUwek4zR2lZVndxSjBvVVZ0aDF3MlpUSG5ZUFBQc1hMQzVz?=
 =?utf-8?B?RzVzVzJDYk05LzNxNUxmN3RpNWFWRnZJblZLc2hjRFUwSlZ2WWc0aExQZ2Jk?=
 =?utf-8?B?UFpRa2lQUURVbEs4ejdEUUVwaUdLMm5QWFVDVTU4TExMV0tBWFpqbW4xcXVF?=
 =?utf-8?B?Nzk5dzZmNDljWWhuSFpHb25ITWd2clZ2V3VlUVhMNWlzRllLQ1ZrekVJbkt2?=
 =?utf-8?B?VHo3TGpGRENnSERxMkI3ZmRtZ3E1anpCUHZ1TG5HQ3NFRng0MGg3d1FubG4y?=
 =?utf-8?B?a1JmUnJ1KzR0bktucUpobi9MZzAyZE9FckxRTjFrU0ovOGJXenlGcFZQOFVS?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cbbd3e-8b0a-443b-5230-08dd414dc217
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:47:18.2537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16BzyiFz1qXtHU9lrbj0oEEA6H3mD92vY0Wbgtt/6T3ALFwEd+NazIEg8feQMXy+yywfjh1ddDIzxaJcUTzUT9oZ7oHI5h6Gm6fn5DVI/E4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8726

Hi Ayush,

This is actually quite interesting. I don't know exactly how far we 
could push this.

FYI, we have a Q7 carrierboard which supports three different modules 
today. This carrierboard currently has two adapter boards that are 
compatible with all three modules. One is Haikou Video Demo, see patch 
here: 
https://lore.kernel.org/linux-rockchip/20241127143719.660658-4-heiko@sntech.de/

We could resolve differences in i2c bus by adding another label to the 
bus node that is exposed on the connector, so that isn't much of an 
issue. MIPI DSI PHY and controller may be a different story as those may 
have different bindings that would make it difficult to support with one 
overlay? Haven't checked yet though. See [1] and [2] for the DTS (not 
yet overlays...) of the other two SoM that this adapter works with. 
However, this would resolve the issue of having different GPIOs for 
reset and interrupt lines. Anyway, I'm not sure this export-symbols 
stuff would actually help us, just being curious here, will keep an eye 
on it but probably won't be able to help much.

[1] 
https://git.theobroma-systems.com/puma-linux.git/tree/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dts?h=v6.6.39-puma
[2] 
https://git.theobroma-systems.com/puma-linux.git/tree/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dts?h=v6.6.39-puma

On 1/27/25 2:45 PM, Ayush Singh wrote:
[...]
> A board with two connectors can be described with:
> 
> 
>      connector1: connector1 {
>          ...
>          export-symbols {
>            connector = <&connector1>;
>          };
>      };
> 
>      connector2: connector2 {
>          ...
>          export-symbols {
>            connector = <&connector2>;
>          };
>      };
> 
> 
> In that case, the same overlay with unresolved 'connector' symbol can be 
> applied on both connectors and the correct symbol resolution (connector1 
> or connector2) will be done.
> 

I'm not sure to understand how the tooling would figure out to which 
connector of the baseboard should the overlay be applied?

In the case of a single connector and a single overlay, that's fine. But 
in the case of 2+ connectors, 2+ adapters but a single overlay, how does 
the system know which connector it should resolve the "connector" part 
in the overlay? Is there some tooling involved? E.g. providing an 
argument (like which connector from the board to use?). Or are you 
expecting that applying the overlay once will pick connector1 and 
applying the overlay a second time would pick connector2? If you have 
multiple overlays for different adapters using this connector 
abstraction, the first one to be applied would be the on the first 
connector and then the second on the second one? What if I have nothing 
connected on connector 1 but on connector 2, how do I specify to which 
connector the overlay should apply?

Cheers,
Quentin
