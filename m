Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013085.outbound.protection.outlook.com [52.103.35.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A5633A9F3;
	Mon,  6 Apr 2026 16:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491724; cv=fail; b=R/IacHQBJKaP0AvCbQur+pcmN/QTTqQ10okA/E4kb0STwo4DvfVYaS8WYkYSGCir9DbAvM6yhS1nIhzLMAL7AG4fhLrqbDw7ZuH+770G9Rs/QXcv42ZvI1RS9xlVv5qaT6c5LbIchzf1mMwfT8AYN7eIZ+wDO29BUyGbg7xGGwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491724; c=relaxed/simple;
	bh=F5LE5dxJi+e9/kr949EA0dJXmhT+LadgkB+3hczA0t4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GbqcWIfcVxZrTI3IcwCZZRvVQkLO/F2ViZuU8EGtg6F5lVnXso1IfvJW8AEcckEuIHO+FCyMnWRn+pvINPgKSe1T3fPxzC1/Q4zvYerihW3KNzQZau3Y/HYOB0pweFkrAgibdKTTYS+QLikLLNrPc5ZvxW9+YIf8xPcfP9axxzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=c9fgaYQe; arc=fail smtp.client-ip=52.103.35.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="c9fgaYQe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOn3DiPoVxl4UmzCRi23oWS1NAZzeQ5xNgqWD1BL/qQdVw4p7Za/SuqxeZ14Re79+ZgjTYSAJMpxIPfUgdMZsfGOoM7lwZJWHtP3k4GmqoH3qC1cAoT08ZiW0Dh93mfYXYPh0ekGGJt5ZaZvcSeYqq25cuI2dLvyK9a15qqr1U6GAaL4v7lO/cI6wC9k+0B4HF18AfsdOyhEHMxzzlpJNaRsWKn8QGYuRP4u8kYjAe/1XqBJd7EMo3Vk1HenQBHeTZV8Br3dPEn30Xf/LUvrxUR+DkhFL1JEXF/WOXu1oKft4XdE/j2SZWjZLS7+WYN5+YeOZdX3AiN+1nO9Z7mXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5LE5dxJi+e9/kr949EA0dJXmhT+LadgkB+3hczA0t4=;
 b=NYhOVaHF6eDpmw6UIqgKK64qvIaeujrFzOYgmP8PLAmhg/NTjj+9Zi7aOA9ev3BAuC1jRApn8aSvVE5GYLkWUuFaXXNjBDIzc16/UKKIPHtOm0px0hEAkkqhygB7PDRflrFgH5hyhx7Qkiw1JYw7zxIjM1Q/e1EHwjEbOIngYmwvg+oK9AH5D9NkDNw2FOzLtXr3CnIAiBs0USeSxdttlZO6CU4wgIBfLLtOZiUUgoVmV2qDF78yLVLxAGBCCCRzCqP3zVvZlcckckfoESoQVuGJuPALBBWg4EnOTU6DftPMBM74z2CqLV24uApgjtb7Zt4W0+JsNfREi4DA30VhQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5LE5dxJi+e9/kr949EA0dJXmhT+LadgkB+3hczA0t4=;
 b=c9fgaYQe8bKJ8mA/n9Y8VbfYps3hcxWjNboF9+yk3xioE0fO3K+95S8bXTZZ0WWvI94FFyPKHhkB2C1Iqbfv/kK82Mta8N89F1WcJGLQkHxFNj8qC0FQ6CGQ0QKaV8I1zZNJsvTO3L7T4np/qHYBKzYQQK6O+Arx61kXutDfkIgGWkXkWBEMzWaDaSX+Lvmq86PSVJtUwrADJcsRrN389WVT25COyld40bqDx+P7wnlnnRfqNbevGSRoWKm4k27CLBzMwGI3wqD/IaCBN2qc92xWysGsoim+VN8Hb/e8/iVr78WKyribeB8PgdS0oLHsVHQWitBbCJ14Mq/JYxRvFA==
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:285::14)
 by AS1P190MB1728.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:4aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Mon, 6 Apr
 2026 16:08:38 +0000
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac]) by GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac%6]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 16:08:38 +0000
From: Kyle Bonnici <kylebonnici@hotmail.com>
To: Rob Herring <robh@kernel.org>
CC: David Gibson <david@gibson.dropbear.id.au>, Vivian Wang
	<wangruikang@iscas.ac.cn>, "devicetree-spec@vger.kernel.org"
	<devicetree-spec@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Chen Wang
	<unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Subject: Re: Devicetree spec: Specifying /cpus/cpu@* unit address format?
Thread-Topic: Devicetree spec: Specifying /cpus/cpu@* unit address format?
Thread-Index: AQHcxcPJ824p9WBGTU+HmnC9jlYKYLXSM6yA
Date: Mon, 6 Apr 2026 16:08:38 +0000
Message-ID: <C6654462-1E53-4C2C-B615-D541CBD5A981@hotmail.com>
References: <00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn>
 <adHofcKAr7C5YCSA@zatzit>
 <CAL_JsqJFv3+UJ-bjLGk0i7Wc+spsowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com>
In-Reply-To:
 <CAL_JsqJFv3+UJ-bjLGk0i7Wc+spsowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXP190MB2509:EE_|AS1P190MB1728:EE_
x-ms-office365-filtering-correlation-id: 17ef4005-cadc-4145-b5ca-08de93f6c37f
x-ms-exchange-slblob-mailprops:
 Cq7lScuPrnr9cOglUl1urTSFBsjx1OD0KpoiQUPmTAkUgIOswk48TzqyR1qnUHfs+09HCt+0QTk2qZrk8948V6jdAbRpJDaXdFM+yNtyLLOHHyR6VheyzZCEhkHEobWyiZoUNgodku5H4ANYHCebva47BdLnxxche2yzDy+q/BvSVwOuw85EFu3J9ASNirW3EPj+2VENGnJAyf5JO7VTDqMvwG9sbwF2Bv2V8e08MbBsPMT7ITHmZAo9JDozqzGVBSwjLAPG3DR8ggN+WdNRq0FFTV6jVw5cjbxISJNwheWMpNZOKS+LFu3Erfs3IOGucs1pe19xHLJmhj9CTlimU9hyWwgRPMQvIqPz9rAS2m0db42GbRM6kSBiFaoOAJCPzJvLFkJPRUjT4DeJcWPLr8wgSaoWhuZn6oU+982IRbufugsZIcRkqoWDW2OnkOwNP4i/FXOl8CTmEt9PrvWMItnLtad1NiPU7AZV2okxnQ0Yd/Vq5DR/ze/m7OZV4PLxtWD2GQyQR7GF/0EYkp8ujDLjjMHqlhXRT3QNuWYiqIIgXbkv1yCChWlE0N7JeKz4tnfQLpypVZAGbHsxnITvkX9pV4kUXsUmskbLVfcwE57E3nLLQxgfSvP1oQw8Y10VyWdvP59WF/sRJosR6VeDFiSGCfl0H9IXiD+h5G1Q3W0yoEDCeZ2QnOwnv5ObT8jPkwFPvmF9eQegDRMF0kcDn6GWm/SV3OeIUqCv2wqBRtmDalzL8NHf7+n62sb6MRGqV/opVqrnI8s=
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|12121999013|19110799012|31061999003|461199028|8060799015|8062599012|41001999006|39105399006|25031999004|37011999003|10035399007|440099028|3412199025|26121999003|102099032|13041999003|40105399003|41105399003;
x-microsoft-antispam-message-info:
 =?utf-8?B?OGVJRjIyWXNtYzQ3N3pHOTR2UWZqTHZNblNBSDBWQ2UvMTl1d3FDVElQNFNW?=
 =?utf-8?B?UWVwZlo3T3R2Z1VqSURJNjROcWo3aXhGU2w3T3I2Y0ZIS1FyZkxXc3A1aHBL?=
 =?utf-8?B?cDU5eGY4TDJMUW84Z0Q0MEMySmE2QUdaQ0hKWUZHVjJzZ2JuZTRoSWlKVGhx?=
 =?utf-8?B?SWJqeXBxT0pqRDNHb3dvVno0eDgvV01pbWZ3MHBzZk1zQkxwTEozYldGbmVF?=
 =?utf-8?B?NUFpRXRIZmhQU1lWNFZFN0pDS1F0Z2t6TEtoV0hleEEra0VkUHRyNGhXR0JV?=
 =?utf-8?B?c1hpWWIrVWc0Y2xoakNDc0xNbDdYMjZSV29wbEFoWnQ3MmhjRVdxaXFIbnFm?=
 =?utf-8?B?dWRLdUxQZE40eDFXdmZuc0NyVThEQTZzQ1F4bWcrVG83cWc1Qm5yQm9kbGF5?=
 =?utf-8?B?RHZkOTBRMnJqQmZFaTcvSHgxeDJrU1NhaDMyaElNeG1DUTk2Zk1sTG9sbXk2?=
 =?utf-8?B?ZW9hcHphSDRubSsyRjczdi9vWFA1c21OWndjS2VSSnA3dTJHd1N6S2tlSzdC?=
 =?utf-8?B?eUovYlNtQ051VXN5N0VFZ2dRSWU4K3FHVk5kVFNXUjFwRFVWUHZCQWxudGlE?=
 =?utf-8?B?MTRzcWxKT3RPRTBmdHhiNmZGWE9MdmxZaHU1bFRQa2VRbnFHUDMwaFhzSkM0?=
 =?utf-8?B?NFdTNDEvMzVmYmU2Q0VDNHhFSk5uZm9MSDBxUWR1bEYzZmhZMkJ0VWlkQWU2?=
 =?utf-8?B?SVN6UGNmU3Y0QXVnL1V0L200amllMUNac21QRHA4Qmxhb3ZaSDRlVllzaXQ4?=
 =?utf-8?B?aHJaK3cwZi9tZGNCS2Zta2tWb01QbWZ2Yk5XZWwyZk5icnR5UkhSWjJyZUY2?=
 =?utf-8?B?Y3BoYnkybloxZlNxUzZudkJuL2thVGx0eHYrVXVSY3Q0dFUrUzExT0lER21r?=
 =?utf-8?B?dm1wVit2UXVVOEN1OThoNUFERW84SXBiSTlZeFNZQStDblM3OTRtYXZhU1Fx?=
 =?utf-8?B?SEsvdk82ZlhKYVhpUytSMzJrbi9sZUxPbk9UMFREdFdGS0I3aEJ1K1dYWlpY?=
 =?utf-8?B?UkF3UkRYMjBsQlRYcERXRnNZTFFya1lQTjBTcVl0c2wzYmlZeVNuTXRkaUND?=
 =?utf-8?B?M1ZkNnJ4eXZBSnVSMkJabjN0bm1XQjI3eTgzVTZBS0Z5aHhNcGt0R1g4Smtw?=
 =?utf-8?B?bVJWcUNhUGV0cHBYYytTdlVWM3hSQ290OWlyYWNtTy9qcmg0bWVZVDhMb1cz?=
 =?utf-8?B?NFJUMTJpaUVITEdVK2wyTW9lOWt6OHVsRDlUTC9IMHowMVdFSnlSc0kwZFRD?=
 =?utf-8?B?TkVJMFAzZW5EYlZvZ29idTdwQTBGQXZoQXJSMFJMbWw1STloYll4R1RjYktx?=
 =?utf-8?B?SWFwSFZodnZESjcwSDFjQm5JS0FEYUkrSkVBUjZUbzhqd0VJTVl6OURsTGtV?=
 =?utf-8?B?ZGpjTW9adkowcUVXKzBpa1FxYm1kUWtidmV4dG9YTktsQTZiZVJlcUdwcEwv?=
 =?utf-8?B?WlRveGYyYUE4QnFTeUhXSVRWQlE2alRBQ3dWRUhFOEI1Wk81NmJpNi9KY0s5?=
 =?utf-8?B?c3I1WGVOZzNrMXQrNjI5azg5aFRHQjBYVEs1eUV1Mnpzc1MydzQ5VzZtVlF4?=
 =?utf-8?B?STFTUT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N0RwbkpXcDhmMGVlVDFFSVJpWTljUkRnM0N3TWl3WGtQZ2hjSHhtVzJyYXRC?=
 =?utf-8?B?dVkwOGd5STdUaUMxVjZLWThOTmU0RFlSNFNkOG5SNis0UHBrdnhZSHo3RnNl?=
 =?utf-8?B?ZzA2Q1prZFBlWUdFR0VqUGtZL25zcDc0UTUwQU83ZDhXY3kvSWtsRXV6TEFm?=
 =?utf-8?B?MklpZjZQaXBFZ3N2aVpOWTdBY3locnptdnBkdTNTMmxYeWVDWTltRm1mUGg3?=
 =?utf-8?B?dlNFSXRlZ3V4VUNtZWRzaTdESG85TndzeWVmY05RMzZRWGlROUdmd3djN3RO?=
 =?utf-8?B?TWh1QmVTeWE4RmoxS3hoendHcllTcU1aMEhYUWpYdEJidTZVc1oyckVtQkR2?=
 =?utf-8?B?SHZQV0ZHSXRWUnJYYmhCTFFLZENhSFd0SEJPK2p6NEFOckpzMVRheUhlbm9h?=
 =?utf-8?B?NXUwa3dyU29Lb1BESU9LTE9DQXdnRDZHT1ErVXdOZko0dW9hVWJaeC93NU5T?=
 =?utf-8?B?Smh5NGMxMmpndWtDT1oya3FUS3JGL21IakhnL2VPbFdFY1I1cXpOa0FnRmEw?=
 =?utf-8?B?YUYwZmJ6dEd5UEZjRlVMSEZNL0YwbkpTODhKTG84WmFQaFVWcWg4bEZmYnc1?=
 =?utf-8?B?UWJtdENjcnVhL2U2YVpqR0xwelBWU2NZQkI0b2w0YjlsOGptMXYzYlFjMWlh?=
 =?utf-8?B?QnhyQ2dESzI1M1VSaVhDSkNQUnR3L1BCcG9hRWUzazU3aWhLMnJsbyt5ejhD?=
 =?utf-8?B?aE82Sk0yY1B0YUtEUWZnVVQ1bnpLY2JUL2J4VlV0RnhXWXYyY0FULzNMSDlt?=
 =?utf-8?B?ZTk0Z3NYWXdydDV2SS96ZlY2WWZqc1owSlNua1ZSN29KaFRtd3NreU13bHFo?=
 =?utf-8?B?NGtmb2JOeGN4cm4vcGtPT1VSOElvc0pBYzd5eDBzbWVvOHdHaWFTZXczRHFn?=
 =?utf-8?B?M3J6V29PNEZsTDkvY3ByZW9USEgzTlV1Y0JaVXpiQnp1NHlvS25NamxDK3FM?=
 =?utf-8?B?SE15UlBVcFRGb0p0UDNmbnU4VlVtT2FHNXVTRUtLSUl3U3VmWXFSZVZJMi8x?=
 =?utf-8?B?WW5vemlCSjdQVjd6Z2x2YmpGOFA1Z3NyeThTekVYK212YndmcGR5TExKcysw?=
 =?utf-8?B?QzhPLzV2K0tQZHU0VUcrVVFxVldodG9PNFBqV0s1RUtrUFVaMU94Zy9kWUwx?=
 =?utf-8?B?b0V0Yk9ZL2g5YklqNXdwNXRYVzBkZDhtSXMrUUZTcnJaYTZvYmFsSjJJb0tU?=
 =?utf-8?B?M1BYSXR2ZnJRY2VLZTZUUy9xZWQzanR1OEM2ZjBBZXY1Qm1rQXFhb3BWVDZq?=
 =?utf-8?B?SGlDcndjblNMVlcxaVJzK2ZCM2g4ZStVNkliamFRTzBsQ0M4ckEzZU8yTGd2?=
 =?utf-8?B?a29Qd0owQTVJQ2pBakRhOE9NSUpqbFhrY1p1aFVrU0krek5kVjNiVklXMGdJ?=
 =?utf-8?B?VVZKaWhOcTBScmxTdmlEMFNjcTF3aisxMHlBZVhiOWhkbVAwN1JuKzFBSDB1?=
 =?utf-8?B?QzFKdVVJQ0ttQkhsZFlaanNmZHJPYndRNWtRbUtEREFqZVNsZlF0Zkxwa05L?=
 =?utf-8?B?Zlp4LzV2YStHNGFuTCtiazNKMG5zL0hJTVZvSnFJN0doRWxvRnZjUGs0L0pZ?=
 =?utf-8?B?UVp3YU5hTnRGSlhzUld3Nk4zeUphVUdqRjM5c3ZOcXorRzk2QVNNTkkwSlBt?=
 =?utf-8?B?ZG1hMlR3bm43QnlQMnFhRlNveHBNWjNZM1JnME85eDloc0NFSXdvVXZJTmlC?=
 =?utf-8?B?T05ybFhOcTRIZDdQRFBTRWQwUXlmMUx6T0wwbW91YlhXZHRLYnFBeW1YdTZw?=
 =?utf-8?B?NGVYQzM4ZDJPeGhVU0xheU9NS2h0WFRERDF5aGNqZ3ZEYVI5Zi8vcGVrZHFK?=
 =?utf-8?B?NTN3L3M3Vy93ZlVYbnZqQUlDbkdpMG1iYks0L0RHWFpLcmoySkV2YXRHUmJp?=
 =?utf-8?B?L1VTUCtscmRTN3BCNGJaQVdNeHZwanBKT0NIUlNUaHp2TGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A6444182BBB6A44BF626F1AD38FF55C@EURP190.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b33f1.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ef4005-cadc-4145-b5ca-08de93f6c37f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 16:08:38.4035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P190MB1728

DQoNCj4gT24gNiBBcHIgMjAyNiwgYXQgMTQ6NDgsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+IHdyb3RlOg0KPiANCj4gT24gU2F0LCBBcHIgNCwgMjAyNiBhdCAxMTo0M+KAr1BNIERhdmlk
IEdpYnNvbg0KPiA8ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1PiB3cm90ZToNCj4+IA0KPj4g
T24gRnJpLCBBcHIgMDMsIDIwMjYgYXQgMDY6MDY6MTdQTSArMDgwMCwgVml2aWFuIFdhbmcgd3Jv
dGU6DQo+Pj4gKEFsc28gcG9zdGVkIGF0OiBodHRwczovL2dpdGh1Yi5jb20vZGV2aWNldHJlZS1v
cmcvZGV2aWNldHJlZS1zcGVjaWZpY2F0aW9uL2lzc3Vlcy84NiApDQo+Pj4gDQo+Pj4gSGkgYWxs
LA0KPj4+IA0KPj4+IFByZXNlbnRseSwgdGhlcmUgc2VlbXMgdG8gYmUgc29tZSBjb25mdXNpb24g
aW4gdGhlIGNvbW11bml0eSBhYm91dCB0aGUNCj4+PiBmb3JtYXQgb2YgdW5pdCBhZGRyZXNzZXMg
Zm9yICIvY3B1cy9jcHVAKiIgbm9kZXMgZm9yIGEgQ1BVIHdpdGggSUQgPiA5LCBlLmcuDQo+Pj4g
DQo+Pj4gICAgY3B1QD8/PyB7DQo+Pj4gICAgICAgIHJlZyA9IDwxMD47DQo+Pj4gICAgICAgIC8q
IHJlZyA9IDwweGE+OyAqLyAvKiBUaGlzIHNob3VsZCBiZSBlcXVpdmFsZW50ICovDQo+Pj4gICAg
fQ0KPj4+IA0KPj4+IA0KPj4+IFNob3VsZCB0aGlzIGJlIGEgZGVjaW1hbCAiY3B1QDEwIiwgb3Ig
aGV4YWRlY2ltYWwgImNwdUBhIj8gSSBjYW4ndCBmaW5kDQo+Pj4gYW55IGV4cGxpY2l0IHNwZWNp
ZmljYXRpb24uDQo+PiANCj4+IEl0IHNob3VsZCBiZSBoZXguICBUaGF0J3MgYSBnZW5lcmFsIGNv
bnZlbnRpb24gZm9yIHVuaXQgYWRkcmVzc2VzLg0KPj4gQmVmb3JlIGZsYXR0ZW5lZCB0cmVlcywg
T0YgZXNzZW50aWFsbHkgbmV2ZXIgdXNlZCBkZWNpbWFsDQo+PiByZXByZXNlbnRhdGlvbnMgb2Yg
dGhpbmdzLg0KDQpJIGFtIGFsc28gb2YgdGhlIHVuZGVyc3RhbmRpbmcgdGhhdCBpdCBzaG91bGQg
YmUgaW4gaGV4LiANClRoaXMgdW5kZXJzdGFuZGluZyB3YXMgZGV2ZWxvcGVkIGFmdGVyIGxvb2tp
bmcgYXQgdGhlIGRldmljZXRyZWUgZmlsZXMgaW4gDQpMaW51eCBrZXJuZWwgYW5kIFplcGh5ciBw
cm9qZWN0LiANCg0KSG93ZXZlciB0aGlzIGlzIG5vdCB3ZWxsIGRlZmluZWQgaW4gdGhlIHNwZWMu
IEluIGFkZGl0aW9uIHRoZSBzcGVjIFYwLjQgaGFzIG90aGVyIGNvbnRyYWRpY3Rpb25zDQpyZWxh
dGVkIHRvIHRoZSBub2RlIGFkZHJlc3MuIFNlZSANCmh0dHBzOi8vZ2l0aHViLmNvbS9kZXZpY2V0
cmVlLW9yZy9kZXZpY2V0cmVlLXNwZWNpZmljYXRpb24vaXNzdWVzLzg2I2lzc3VlY29tbWVudC00
MTkzMzE3NjQxDQoNCj4gDQo+IFRoZSBvbmx5IGRlY2ltYWwgdXNhZ2UgaW4gRkRUIHdlcmUgbWlz
dGFrZXMuDQo+IA0KPiBSYXRoZXIgdGhhbiB3b3JyeWluZyBhYm91dCB3aGF0IHRoZSBzcGVjIHNh
eXMsIHBsZWFzZSB3b3JyeSBhYm91dCB3aGF0DQo+IHRoZSB0b29scyBjaGVjay4gVW5mb3J0dW5h
dGVseSwgdGhpcyBpcyBzdGlsbCBvbmx5IGNoZWNrZWQgZm9yDQo+IHNwZWNpZmljIGJ1cyB0eXBl
cyBhbmQgdGhlIGRlZmF1bHQgaXMgbm90IGNoZWNrZWQuDQo+IA0KPiBSb2INCj4gDQoNCg==
