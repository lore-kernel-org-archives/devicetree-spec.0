Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02olkn2090.outbound.protection.outlook.com [40.92.50.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C74E647
	for <devicetree-spec@vger.kernel.org>; Fri, 17 Jan 2025 19:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.50.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737143883; cv=fail; b=ZErkD9PxvezAkmV4Aj1hByRoYjFwP/Pe0XYin2YoLX+Snart6rziqnZomP1kZRbtBw4gcIKWOM6yRR6psAA5VsTyi8+Px2Ze8bf5JQnN732WvxXrHeJ2gDJmB0bZ1MBaCbLEyBis/7nBn3xN7a8ag8koM6/SXqxHR4kwE9bylBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737143883; c=relaxed/simple;
	bh=nLMXXRtVa3OsUzk4tdHxnIsDsm4QX2wBqknQdsfVvX8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tXF1NUZDkMdnY4RJ8VYpngjfTmHQY5cvDzG5OH2a92AyQyFlxhUHISya++0QQEggS/gRlYnYeeoE9QQqn3UC5vZSQU45XYXDybSZlk+WBG0jk0MLL2dEmdkJtMwBOO5mH0Fk2vTxc0eJm9HfJucFSyOHMYPdAivQWCuu3tUO7EU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=KlMdvnLY; arc=fail smtp.client-ip=40.92.50.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="KlMdvnLY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLtBpHeODNx1d7IfNO1DP72u1w6nsjyw9cHh5+qhaogxSirJHOD0gF99wsGz0SKkpzA9ownAUc6Xm7MSjRUikMhvjUgBb8gBMp8araFsDK7YbIQiIH9h3iplO3L+6Sv3YO6W3/WvtTGiuNLIt9V/Ivrdp9YpFdf6V5OnUMjAbm0gfHJWa/UrBNias/EbOfzvyVeLyt4ccaXxM8CtvcRgufrhtpUXN79bTlhRcJB6LXEfQ+ST1tAhZAS7vKyMiFeT9V0MDouEi6EYLhsE/Va73rS2j3usNM5ItKrz2x5MYSZho7C6ff2LfuWgZ+snyfJ8JcCUVaPFUcdlO/gOG7fVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLMXXRtVa3OsUzk4tdHxnIsDsm4QX2wBqknQdsfVvX8=;
 b=OOYfJdDEhnHI5GeS0qdgzMfmxsneV37Rqb9Vrkt7N9TaH5fGI2md7r39XRPiPwjqj/5g4agKbeMH0ys8O5nGf4RnWAISFLJpm0Z4QyJJsdf+sdeLyh5z4hmJbASCfbH4Oei/VioASDJU/0pjIgI+zC5tG4iKB86GAcH3BycMUIfevdLL5z+KBgfmQg4wDFCYA0GiP7SaQKaQdetxCZI0dnsa0OatgscYJBc5OYXGCa6AbX/y0FtUOKfDP6XjjbW0xOZo8H3oW5pyx2Y9aoTVIFpxPrxIQHPqnnqdjqcFNCi4PZOhE2+7151W3zgOgm6kYkhzl0RZdYP16sjOKZmBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLMXXRtVa3OsUzk4tdHxnIsDsm4QX2wBqknQdsfVvX8=;
 b=KlMdvnLYt4DCPAPThbuTnzeb1iCWpkS1nZ25ubvvl3TPMyp28eRxVnHQgHci6Nooiyuaet7iuwdioiyUzudtjwuXWlx/uWPrt1ZupP8/vxjkyq2ioHAW+oN5dIFmBEoMw1PRcJxOC/5ooSMR4Fpd725mqi3BZjWlubr0Y7mKo4jaIdUEHmF6qEgTF8BiZU+lV3AusSmT1/kB27gVcXvG70RwBgNKuS6lqoyMca+dphlROx7GjY7G+F8eZikv9h6bJbwWrDdIhZs7HahAGRpBvUNtPFLtxkhzPJx+yojORoMPff1jEsbgVm8SOqyfSHBbWntuiIv7Fj7l2ig0QeseGw==
Received: from AS8P190MB1109.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2e7::5)
 by AM8P190MB0946.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:1dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 19:57:59 +0000
Received: from AS8P190MB1109.EURP190.PROD.OUTLOOK.COM
 ([fe80::ed07:bccc:9366:c10f]) by AS8P190MB1109.EURP190.PROD.OUTLOOK.COM
 ([fe80::ed07:bccc:9366:c10f%7]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 19:57:59 +0000
From: Kyle Bonnici <kylebonnici@hotmail.com>
To: "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Subject: Try the new alpha Devicetree LSP
Thread-Topic: Try the new alpha Devicetree LSP
Thread-Index: AQHbaRobFbY3yCsqNkCDUWkxUK6bNg==
Date: Fri, 17 Jan 2025 19:57:59 +0000
Message-ID: <7EA2C735-138A-4CAF-8FFD-2AC95F904D67@hotmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P190MB1109:EE_|AM8P190MB0946:EE_
x-ms-office365-filtering-correlation-id: a3dbaf2c-38d3-41be-9c5f-08dd37313e43
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|19110799003|15080799006|7092599003|8062599003|461199028|10035399004|440099028|3412199025|4302099013|102099032|41001999003|1602099012|12091999003;
x-microsoft-antispam-message-info:
 =?utf-8?B?NmVKRDFKaDZ1YmxFS1dCcG9TM0owdGNoU1M1OERsVzFpUDJka2NDaU1RWlpO?=
 =?utf-8?B?aHdCTkZ3amNVTWhFdWcvVXpNUmtwTkZtMk41SCtZZUZGekJpUzJRaXdGamhP?=
 =?utf-8?B?ZVRZU3gxNGZvdEc1c1NiUWRORzlPNHE5M1l6NklTZEdpdFcvMW15Q2doeXpH?=
 =?utf-8?B?WmNHTTZHL0t5MkF0VHFKT3RLS2c5dEZQZEFHZitmakl0RjhiazBQY0JjZ3JE?=
 =?utf-8?B?dC81MW8zNnZNTFJkYnNSWitzcTBFNXRBWUlmejNoU25CZzNLOElscU51WEpo?=
 =?utf-8?B?c0lOczZCOW9MYjZmQmZWVVorcmRoaU9FaVpmVFBLdTlaVVNyalpHUDRiSi9V?=
 =?utf-8?B?MTBrZVY4OTdzZ1M0cktzYlhjOHFETDdCdFB3U0c4dDRub2dpQXJrYlYrYWVR?=
 =?utf-8?B?OHhUdENWT3kzdmZqdFFtNEFrazJTS2xyY0htQXZWbmgyVkJtYTFnVWZwTVd5?=
 =?utf-8?B?NGszMG9YSzYxVGFEeWVPb1FKQThPYTNONzVrNFJBSmlJaDloYisxYU04ZWxj?=
 =?utf-8?B?ak9TNmZiaU5rRTMzUVhIMm1kbDZVTzdwSTM3RERZL0Jza2VrRm9mM29GMjQv?=
 =?utf-8?B?SVlqYWdPdm51ZlFlWHhPMzZJWEUxMjMwaThZUzAyK3puMFpsQk9iN01UUUJp?=
 =?utf-8?B?RGQwR1VhV3FONCszOXR6NDMyRXlhbHVBcDdVLzVuUDBwTFAyUUlocElseFRY?=
 =?utf-8?B?c0x6U2k4VkJMcng0RHFQdHc4ejZBUXRIMjZYMi9MckVsZFRRMGVyeFFFMitL?=
 =?utf-8?B?TFdiYmE5K2tkeGZaWW5LNzA2MllEaG1NSURHYjZCT0lGUS9DZkJFaVVtZ2hs?=
 =?utf-8?B?VkhUUXV5dlIyVkdzYmxEZGxwWjR6TzhFa2d0bFlzdlMra0pjeEJMVlVnTVc1?=
 =?utf-8?B?eUpOYUNNQTZyOXNsbzg1UlRSc05PNU91REFKS3dlYXhWZDdQajdxRUpDZndy?=
 =?utf-8?B?TTdqTkpMeEgyQlA2V0p2YnBUS1NWMHY1MWJ4YWRwNHE1WjlrSFA0T01YVnhl?=
 =?utf-8?B?VkpMRGREa3lrdjVHdUNkVnBiU2loQ0I1TVpndStYakVKQjlHOVFqdllBV2ll?=
 =?utf-8?B?cW5GQWh6RHJPcWdzQUVnRXR3THRKM01jK3hsZXBFNFVVakdrRlVZMHlqQzVU?=
 =?utf-8?B?cEZvR01SUENyRnhRNVNNMnd3NytpNFZ6OFdNcnkvQUx1UG5OZjNoNWExUW0r?=
 =?utf-8?B?b2hieDYzc2lDN0kxZWxveSs3eEZWWjdWWjNxT050Mjh1cDcyOXNVeFRMSi9j?=
 =?utf-8?B?WDlReHdnQ0tINUhrbGpPSkNOV0FWS3dQTDFXSll1WWltV3lpWWw4M3FFOVF3?=
 =?utf-8?B?VXMzSk9TdGJqK2ZzOEcyaDQzNnlWcEU5UzZ1b29UeTJGNi82a1MyVFNVcWY2?=
 =?utf-8?B?M3ZROGZPNnJKcXJHNmFRU2YvSnhsMzZhZGZlNTAvQmRWNm1LOXdrWjc1aDdX?=
 =?utf-8?B?WU1MREkyVjh4R2F6RkliR01iMSsvRHpHeWpBZFVhTWpjN0ZlS2dLUnBCOTJs?=
 =?utf-8?B?RFE2Z2k3MVp0Y3diR1Fwb2dPVllkSytWNG1MVjlhbmY3akNJc1dOb2RWUWI5?=
 =?utf-8?B?TU52TFc1MzZSdGdTcWhKNEcyYTdkTCtLQ0lxU29RZGt6bm9FZjljWEJwU1Y1?=
 =?utf-8?B?Y0d5RjNOTGx0clpJeDU2NCtTT2RPWjhpeEU5ejFUUzExU2JkaHhYc3JxTGJW?=
 =?utf-8?B?QzhCa0liRitCNEpRUmZuYUN5TWlQR1pWbDRVdEdDZWx2ankvbjVLZkF3PT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTlJYnJGTkdoME5sMmZnOGZKaUdJS2lYbW1WT1BGcHBSVlNIcVgraGgxdlk2?=
 =?utf-8?B?a1piOTQwYmYwRWk3Q2dwTTU1bFZyOVVBZk1pczV4U2p4WkVvVEFOVGt6czhE?=
 =?utf-8?B?OUhSNDVlZDJlMHJDVzlSbVRWZm5PdVNLQXUrWGZFc3ExUjZaNFh0R2JDZzdy?=
 =?utf-8?B?SC84YmdZY0xVK25ZYm5EQ0cvY2FmVFRNL2hCT2FLY3EyZ2JIZzIrcFpEM3Vq?=
 =?utf-8?B?OFFsQVMzRldTT3QwWENoQ3NSZXMwU1Y4VE5EMk1LRGh1eERLdGJYdjlPYnMv?=
 =?utf-8?B?ems5bVJLQUJnSFo1UVMyblpSaGc2MlJFOFgyUzNwNGI3V2NXQ0VpcWEwWWlD?=
 =?utf-8?B?dyt5cHEwVDhLbCtxSXYyQXJnWmZrWDVvZ0hRcnVkUENLTllwTm9xTUJvQmNx?=
 =?utf-8?B?ZHh1SlJhdERPN1E4WnhiUDlZR2o4S21sWmVUdW02Z1RzOTZBajNJQ1NpNlli?=
 =?utf-8?B?V2JBUi96NzE4WUZ3Q25pRWFiWTM1eGU2enlPUHUzS2VnanNsbWdEMWkzRnpw?=
 =?utf-8?B?RkNjNDIxdkVTSit6WE9GNjROWmVDYmlTdHFnUzl2cXIvZ1RON2srOFR3ODNz?=
 =?utf-8?B?cVdXeGhMTktFTkhsNzM1eHhJaE9GWThnaWxXbHJFRmVFWlBzS2V6UW94U2ZB?=
 =?utf-8?B?UlBKSndHSzdLcVZTM0tUK245YXgrb2hvUXFqQWtkcXMvZldWZUp2RldEc2tN?=
 =?utf-8?B?UnNpbVBWUlJzcXd0dXRZaUNZT29uOTBqN3NsUHhmMVVoUnhjVlRzZGtqN0Ft?=
 =?utf-8?B?RG4rQUlyWENYU3lMRm1YYmZWc2pjK1BHV3dqOFdNN2JNSDRXM24rQ0VXa0RP?=
 =?utf-8?B?Sk9tcTRRcWg4aHNvamFFbHFDcFltcllEd2s4czdkcklCK0hjTGpjYlkzVk1V?=
 =?utf-8?B?bno1NXdESXBhTW9sdTZLVkV0NW9JUWt5Q1ByaGRpWWZOanhkZkp6RjhETzBq?=
 =?utf-8?B?ZTVTMmdkZnJwdzlDaE9wRlVJWWEwbkNNZnVkYXhQYUdMaHBIZmJ3UWFtTi9r?=
 =?utf-8?B?bDFVOTlpaW40Mkw2cjArenUvMlE0VkcwdHl3RGtjSW9EYmpsNGFUT2V4YlRu?=
 =?utf-8?B?WE40N2RibDQ2dDVWdEtNcTFTd1pxRG9mNEdCMThnekEvZjg0NWF5cXU4a0x0?=
 =?utf-8?B?SHJiVGhOZ09wcW12SG1zOGNzR1lkbVR5WmFjS1RwRnozUFlDR3BsUGtsR2Jq?=
 =?utf-8?B?QkU3QlFzanF2T01ZZkhEV0xlOHRGOVkzOFYwY2NKRDA2WEI1c1Vhamx5TVZZ?=
 =?utf-8?B?aGJCaU1sUWgxeVRka2gyYWswUXlpWEdFeTBaZWlKWHRtVlBGZ1czZURpbG5u?=
 =?utf-8?B?V1N3M0F5Q204KzFybzRrbGx4V3JmenF3YlVFWTd0NnNSQnhaUTI3TlZWckN6?=
 =?utf-8?B?VWs3TVJQZnJtVXRuaWxqWDRlK29zMjJPcCtFS3pVbCtnVE4xSGR5S0JJMHFh?=
 =?utf-8?B?aU1GU2RDbTNSb0NlUThlcUY1NW84Y0pDT2QyZC8rbzhwNXFTQzJiVXZ0QVh4?=
 =?utf-8?B?S0ZSaTl3K2xwMVdJQXRyYXdyRmhXaStGTjZ0SE8yRUN5eXZpMmVPUjdQTkJX?=
 =?utf-8?B?VFRxWXF3dzhGN2xDK2hmeFVxcHJwSEJodXE3bHVodUpDdFhIR0tPYWJwdVVl?=
 =?utf-8?B?aWQwdEQycVBhRnNDUmNTeGsrbm1vVm51dGdrVFd6WWkzM21DaEpodi84aGlS?=
 =?utf-8?Q?pPcB4oLgo9fheek58MH/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F3484CFE8798944AB012F8AFAFA251E@EURP190.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-4ff97.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P190MB1109.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a3dbaf2c-38d3-41be-9c5f-08dd37313e43
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2025 19:57:59.3571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P190MB0946

SGkgYWxsLA0KDQoNCkkgYW0gS3lsZSBhbmQgSSBoYXZlIGJlZW4gd29ya2luZyBvbiBhbiBMU1Ag
KCBodHRwczovL2dpdGh1Yi5jb20va3lsZWJvbm5pY2kvZHRzLWxzcCApIGZvciBkZXZpY2V0cmVl
IHRvIGhlbHAgd2l0aCBldmVyeWRheSBkZXZlbG9wbWVudC4NCg0KDQpGaXJzdCBJIHdvdWxkIGxp
a2UgdG8gc3RhcnQgd2l0aCBhbiBvdmVydmlldyBvZiB3aGF0IGFuIExTUCBpcy4NCg0KTW9zdCB0
ZXh0IGVkaXRvcnMvSURFcyBsaWtlIEVtYWNzLCBWU0NvZGUsIFZJTSwgIG5lb1ZpbSwgVlNDb2Rp
dW0gZXRj4oCmIHByb3ZpZGUgZnVuY3Rpb25hbGl0eSB0byBtYWtlIG91ciBsaWZlIHdvcmtpbmcg
d2l0aCBjb2RlIGEgYml0IGVhc2llci4gU29tZSBvZiB0aGUgbWFpbiBmZWF0dXJlcyB0aGF0IHdl
IHdvdWxkIHNlZSB3aGVuIHVzaW5nIGFuIExTUCBhcmU6IA0KLSBTeW50YXggaGlnaGxpZ2h0aW5n
DQotIERvY3VtZW50L1dvcmtzcGFjZSBTeW1ib2xzDQotIERpYWdub3N0aWNzIHRvIHNob3cgZXJy
b3JzIHN1Y2ggYXMgc3ludGF4IGVycm9ycyBvciB3YXJuaW5ncyB0byBoZWxwIGF2b2lkIGNvbW1v
biBpc3N1ZXMNCi0gQ29kZSBhY3Rpb25zIHRvIGhlbHAgcmVzb2x2ZSBkaWFnbm9zdGljIGlzc3Vl
cyB0aGF0IHdlcmUgcmVwb3J0ZWQgDQotIEZpbmQgYWxsIHJlZmVyZW5jZXMNCi0gRmluZCBkZWZp
bml0aW9ucw0KLSBGaW5kIGRlY2xhcmF0aW9ucw0KLSBSZW5hbWUgZWRpdHMgKHJlZmFjdG9yaW5n
KQ0KLSBIb3ZlciB0b29sdGlwcyB3aXRoIGluZm9ybWF0aW9uIHJlbGF0ZWQgdG8gdGhlIGNvZGUg
aW4gcXVlc3Rpb24NCi0gQW5kIG1vcmU7IGZ1bGwgc3BlYyBjYW4gYmUgZm91bmQgaGVyZSBodHRw
czovL21pY3Jvc29mdC5naXRodWIuaW8vbGFuZ3VhZ2Utc2VydmVyLXByb3RvY29sLyANCkkgcGVy
c29uYWxseSBhbSBub3QgYW4gRW1hY3MgdXNlciBidXQgSSBmb3VuZCBzb21lIGRvY3VtZW50YXRp
b24gb24gaG93IHRvIHNldCB0aGlzIHVwLiBFbWFjcyBzdXBwb3J0IHRoaXMgbW9kdWxlLCBsc3At
bW9kZSAoaHR0cHM6Ly9lbWFjcy1sc3AuZ2l0aHViLmlvL2xzcC1tb2RlLykgYW5kIGhlcmUgeW91
IGNhbiBmaW5kIGhvdyB0byBpbnN0YWxsIGFuZCBjb25maWd1cmUgYW4gTFNQLg0KDQpUaGlzIExT
UCBpcyBub3QgaW4gdGhlIGxpc3QgdGhhdCBpcyBuYXRpdmVseSBzdXBwb3J0ZWQgYnkgbHNwLW1v
ZGUgKGh0dHBzOi8vZW1hY3MtbHNwLmdpdGh1Yi5pby9sc3AtbW9kZS9wYWdlL2xhbmd1YWdlcy8g
IGh0dHBzOi8vZ2l0aHViLmNvbS9lbWFjcy1sc3AvbHNwLW1vZGUvYmxvYi9tYXN0ZXIvZG9jcy9s
c3AtY2xpZW50cy5qc29uICkgYnV0IG9uZSBjYW4gY29uZmlndXJlIGEgY3VzdG9tIExTUDsgdGhp
cyBpcyBkb2N1bWVudGVkIGhlcmUgaHR0cHM6Ly9lbWFjcy1sc3AuZ2l0aHViLmlvL2xzcC1tb2Rl
L3BhZ2UvYWRkaW5nLW5ldy1sYW5ndWFnZS8gDQpUaGlzIG5ldyBEZXZpY2V0cmVlIExTUCBjYW4g
YmUgaW5zdGFsbGVkIHVzaW5nIG5wbSAoaHR0cHM6Ly93d3cubnBtanMuY29tL3BhY2thZ2UvZGV2
aWNldHJlZS1sYW5ndWFnZS1zZXJ2ZXIpLiBSZWFkbWUgaW4gbnBtanMgaXMgY29taW5nIHNvb24g
YnV0IHlvdSBjYW4gc2VlIHRoZSBvbmUgSSBoYXZlIGZvciBWU0NvZGUgZm9yIGluZm9ybWF0aW9u
IG9uIHRoZSBzdHJ1Y3R1cmUgb2YgdGhlIGNvbmZpZ3VyYXRpb24gIChodHRwczovL2dpdGh1Yi5j
b20va3lsZWJvbm5pY2kvZHRzLWxzcC9ibG9iL21haW4vUkVBRE1FLm1kKQ0KDQpJbnN0YWxsaW5n
IHRoZSBMU1Agb24gVlNDb2RpdW0gb3IgVlNDb2RlIGlzIHF1aXRlIGVhc3k7IGp1c3QgZG93bmxv
YWQgdGhlIFZTSVggZmlsZSBmcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9reWxlYm9ubmljaS9kdHMt
bHNwL3JlbGVhc2VzIGFuZCBmb2xsb3cgdGhlIHN0ZXBzIG9uIHRoaXMgZ3VpZGUgaHR0cHM6Ly9j
b2RlLnZpc3VhbHN0dWRpby5jb20vZG9jcy9lZGl0b3IvZXh0ZW5zaW9uLW1hcmtldHBsYWNlI19p
bnN0YWxsLWZyb20tYS12c2l4Lg0KDQpJbiB0aGUgZnV0dXJlLCBJIHdpbGwgYmUgYWRkaW5nIHRo
aXMgdG8gdGhlIE1pY3Jvc29mdCBtYXJrZXRwbGFjZSBhbmQgb3RoZXJzLCBidXQgZmlyc3QgSeKA
mW0gbG9va2luZyBmb3IgaW5pdGlhbCBmZWVkYmFjayB0byBpcm9uIG91dCBhbnl0aGluZyB0aGF0
IG5lZWRzIGltcHJvdmVtZW50LiANCg0KTm9uIEVtYWNzL1ZTQ29kZS9WU0NvZGl1bSB1c2VycyB3
aWxsIG5lZWQgdG8gcmVhZCB1cCBvbiBob3cgdGhpcyBjYW4gYmUgY29uZmlndXJlZCBvbiB0aGVp
ciBlZGl0b3IuIA0KDQpXaGF0IGNhbiB0aGlzIGFscGhhIHZlcnNpb24gZG8gc28gZmFyPw0KLSBE
b2N1bWVudCBGb3JtYXR0aW5nIA0KLSBEb2N1bWVudC93b3Jrc3BhY2Ugc3ltYm9scw0KLSBTeW50
YXggRGlhZ25vc3RpY3MNCi0gVHlwZSBEaWFnbm9zdGljcyAoU3RhbmRhcmQgVHlwZXMpDQotIEJp
bmRpbmcgRGlhZ25vc3RpY3MgKFplcGh5cikgDQotIEdvIHRvIFR5cGUgKFplcGh5cikNCi0gQXV0
byBjb21wbGV0aW9uDQotIEZpbmQgYWxsIHJlZmVyZW5jZXMNCi0gRmluZCBhbGwgZGVmaW5pdGlv
bnMNCi0gRmluZCBkZWNsYXJhdGlvbg0KLSBOb2RlIGxhYmVsIFJlbmFtaW5nDQotIE5vZGUgbmFt
ZSBSZW5hbWluZw0KLSBQcm9wZXJ0eSBSZW5hbWluZw0KLSBPbiBob3ZlciAoQ3VycmVudCBub2Rl
IHN0YXRlKQ0KLSBPbiBob3ZlciAoWmVwaHlyIGJpbmRpbmcgZGVzY3JpcHRpb24pDQotIE9uIGhv
dmVyIChTdGFuZGFyZCBUeXBlcyBkZXNjcmlwdGlvbikNCg0KSWYgeW91IGFyZSBub3QgdXNpbmcg
WmVwaHlyIGJpbmRpbmdzLCBwbGVhc2UgZG8gc2hhcmUgd2l0aCBtZSBzb21lIGV4YW1wbGVzIGFu
ZCBkb2NzIG9mIGJpbmRpbmcgdHlwZXMgdGhhdCB5b3UgdGhpbmsgc2hvdWxkIGJlIGFkZGVkIHNv
IEkgY2FuIGV4dGVuZCB0aGlzIExTUC4NCg0KQXQgdGhpcyBzdGFnZSBJIGhhdmUgYW4gTFNQIHRo
YXQgd29ya3Mgd2l0aCB0aGUgRFRTIFNwZWMgMC40IGFuZCBJbXBsZW1lbnRzIENoYXB0ZXJzIDEg
YW5kIDIuIEkgd2lsbCBzb29uIGJlIGFkZGluZyB0aGUgcmVxdWlyZW1lbnRzIGZvciBDaGFwdGVy
IDMuIA0KDQpGZWVsIGZyZWUgdG8gcmVhY2ggb3V0IHRvIG1lIG9yIG9wZW4gaXNzdWVzIGRpcmVj
dGx5IG9uIEdpdEh1YiBmb3IgYW55IGlzc3VlIG9yIGZlYXR1cmUgcmVxdWVzdC4gDQoNClRoYW5r
cyBhbmQgcmVnYXJkcywNCkt5bGU=
