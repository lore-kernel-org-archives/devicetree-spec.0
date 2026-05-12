Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B343368D78
	for <devicetree-spec@vger.kernel.org>; Tue, 12 May 2026 07:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778570848; cv=fail; b=TImWf2/44RpXQHic5uwhuOuVMICPplISEvaf256NwexPzeIJ1fhjPy8NK6Aj6oo1vhuBj7VGSJdDZ1r70/NBBuifVQhcCVrfDRRzncmJjZtxMWggja5/r4NWQ75zny1RkK4FiX7M713ec37Sm/Tct26xxmG0q60ISLqrCNg3LNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778570848; c=relaxed/simple;
	bh=Ki4DHJZHlVvQqbt3kiqFAO1x4Fnv9wpoWfMBQAPNIJw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TAOa7o2k7qooVQ7u9wbH6kZbLmWb1y8rIdz85pedjvSHDkSWqUQSIqxRwZquvzkZOwTqBy1Ez6oVwIx5o/jj/0FaUMQvlvO8GVOwzz6EZZvsVJRp7mv5SCkUiblZvJM2B8kx8hd2Q/omGyoags0hYxUU5OBttQ7jkJ3OQR9Oxzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=OaPZvAAQ; arc=fail smtp.client-ip=52.101.84.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="OaPZvAAQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxFXSscsWuPQUxXdZYH1v3CbDeY1a2UXgVNFbrQW/GJIt+zYAOQqUokXsvHr1WMnpDXvufAmWAYiq3Z+d2b6BjDurFMQeJJ8By7yiS6T4w3mBwfxTyiI0bvR/xAgtisCN8pSKPUZHLTZJh6UIpiwbDC1G1WPEICOzhmFwylOMEBDeTE442+TpDkS6Ra8VTLViIDXiwaeHnIjr6CJJTM5O4j1lzfgrDuuYZe9ufN3OSkg0M8M5qM3ycAhguVR3u6oo6jcglbLtQVnmu7Epj/p5ZvRXaOGqPqNqrwQeD/Qi2Rd7C3KXqadKOO5AymL+3e+ZdRGwl6ykATZQxQXKl9KPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ki4DHJZHlVvQqbt3kiqFAO1x4Fnv9wpoWfMBQAPNIJw=;
 b=n+u7O0z2ew7qfVWRFGQmK9XBO9LGtc5en9XjwNJdUWGGNskv+5t+T6r2CHYgiMrVtsfcGDtFLkGiRmJQb2tpKW/UjU9hFGfqLMeLImcSO9Z9gdaLekge4KXKj77mJV9ZQw651UanSObJFMLFguKhm1PaSMogRx6VjY9Kr9RgAr0RKj4+Vi7j7VzdPYYOEY9a5rqhYYfpYVn5WnuWT0nThG+s3z8VPKhQJdfkjLrJKLS9Eyb0ANR56TUHH8UB8A4Vo00f8bdrwxYcThSwtYAbpq64JDnjcll6veGXd45FijkxdwbWJF23/2vrmU8uQBpr9zs9wqJDW1soH3w8ywPPqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ki4DHJZHlVvQqbt3kiqFAO1x4Fnv9wpoWfMBQAPNIJw=;
 b=OaPZvAAQIAV1e7LRAKR+CwN5036577PHUOSc/hu8ahsUbEblVU6dw0N7axvJtBKKSlORFf1/d8u2QTvAWxXnUqCOaPv7Y9gtxohyTyGvPDVFyF3RP9Az2zhO7UEzLaTio28Bsip4lWdGf67qxUZqtpYSk3AkzTDYQYjfAAS2Ba0FjacwXRITltF0AVzrH1kySRNqXqL85po4rK1RxGRV1e8N2YXgZ5c7pPCcvo/5EU4dg6Tq3AvWdJX90Ti5QJ6gaXlBzGq2LVlYkVRyi2zPj8ShdkgKoBgVHusikT+vLNtXc+EYLVnXXK9RiQxINXM69Kxpugr+wJxAHIEJAE0gxg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PA2PR10MB9065.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:421::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 07:27:17 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 07:27:17 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Subject: [RFC] Pass reset reason to Linux via FDT
Thread-Topic: [RFC] Pass reset reason to Linux via FDT
Thread-Index: AQHc4eDCy2dEJ/VJ+EyYrfi8GPFrDw==
Date: Tue, 12 May 2026 07:27:17 +0000
Message-ID: <579fcbc186ad2aeea3c206aebc901b64fc665db1.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PA2PR10MB9065:EE_
x-ms-office365-filtering-correlation-id: b5520902-a572-438f-dcca-08deaff7e54e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|55112099003|56012099003|18002099003|3023799003|11063799003;
x-microsoft-antispam-message-info:
 tb8tzdjhrDFAwvBa0KH7PxrsbeGO/7Fw35bQMKE/UlSxhNVVRj3xb5pIqncW8oOBmGTPDuWulbdjZu6o58dziGzniocXgOzQ+7HfejAWhI2q4riF46vB+n60sbJSBDSFGJR7NABlE0Vmn/UIcql2ixRy5HNn/5ux6v3WmC9ZCxFIgqkExBCSDPR56g+IKwUbuQvuT8VswwJyUDZmzlOlMcYzFV2jciIdCXrqbEmDwWLZy0/o3QmC1fzWm64n8Z3z2gr0a0QK9EH0uj/c+yOwfo8INujXugFfNCggJfnhhBuY5Dtcl1oE0fLdeqvC2R8p6tRVQxAuTNPh83IY9e8CmIdir0OmD5vjBYr0oTqU4aOTUcZbVTP2dCKi9R0a+Fj/Y7gXynd93SxP8ZsJPcTq5rcCZQAskNmCgudkcvHL8iSrUndZ5qraAFsKXCNMneezFMFjXstdt2dC01qYW8O5fzrnAFzdP9XOi/Q1SZw4ngDJ6hs+vJ6WbaQvMfxyoqkoN0eJlyoUqFHnPldZiJ383TAp12R/O81E0JGtjz/PoOSnO9V9ebTRlsq/22KQFTv5kkAcxWtYCp86Kpvrz9JFesQ80hkjGF7PxjCW4QvhhL54/bjkRn5jJO9nWRjCBnI9VhFrxYWzOcOEAI6xOZeiGe8vdBfnrRCa8jLdwMkLYdc90UBrX7W+hTIa5RKWixyLPoQE8SrgBCMkBYTjx+vzqg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(55112099003)(56012099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1JxRUlaeVVYRFpFME56Ky9PUDNwbGFMWi90T2g1RG1kRjN0UlRsaitlUmxi?=
 =?utf-8?B?R1ZaaFVTNGdFTFVrVGVUTmVsQzlabVUwM09RdXkyY0NzKzRlbUZWaXg3UStu?=
 =?utf-8?B?YXN5UTBza3BJWEZiNC9sTUdmOG50Q002dlA1SldIOXJyaFIzblVxYkEwSG0y?=
 =?utf-8?B?YVZkMkwxNWxMR2hBNmVtc1Brd1lmWTNDTUxoOTBYN2daZEg2SFVKd3psbFp6?=
 =?utf-8?B?S2pmUWlVSG4wWnZOejMrVkRFajR6Qkc5a1ZNWVA5cWRWMFVKWU1pOXR4SitR?=
 =?utf-8?B?cmxoNm4wTGIvRGJQZDV2aytRblhmOGl3MDNoZDVhL2RVMkxSM0RaNHF2a2cx?=
 =?utf-8?B?SWhtVmxRWnZaQ3FIa3MzR2VOY05lWFJNakxlZUtjdmFpYnZMRkpuNW9LL2Q5?=
 =?utf-8?B?Wmkvd2dWM0dwZTZQNFFsQk94NVRYTW5DY0dmSFE3OWlQb3hjTGZ2UTFodGE3?=
 =?utf-8?B?WVREcXdYeGxtMUZrY003NWs3bG9VT1M1TkkwOXJ2ZHNocm1Eck52UlVhQ1FV?=
 =?utf-8?B?L3VQZmhPUkpUOGFVYmFCcUdZYTY5UkFoK25YT0FzNFZUWXNHNittZ29yMEEx?=
 =?utf-8?B?NWZuVXVoWEVPcE9OQzQwMmFNNmtBZmVaL2o2TDhaTnhsZER6amloUEtqaEIw?=
 =?utf-8?B?QkM2c1NTRjhFYUg5bHBsM2RjbmowbFYwTTczSlB0dVFnWWY1Z29vUThsaFRq?=
 =?utf-8?B?Y0d6SDkrd0xzSE1uY3QvYVJxZlRyV3E1am9LWDhYTmlEdDM3QXJuRmN4aUJr?=
 =?utf-8?B?UHp1NGpScDJ0dVYxUmtUOXFZbE5US0VCZFhDNGNmRkhscEZYYWJjMUpuYVpJ?=
 =?utf-8?B?OVUzVmQzaWhPWXYyaWVOU0hGZTN1L3lEWUVRY210NkptV0lzNWFVUkpxSG02?=
 =?utf-8?B?d0pZZjhHbFMyNHRtSGtLRGxLb1BjUHluWjczSHcrMkJRMDJjMVU3ZGRsMXcx?=
 =?utf-8?B?dW9VczZYc2pTa0lmdHZWbWw3U2JQazF0b1lOOUlqYkkxL0ZwR2RKMVh4NWdQ?=
 =?utf-8?B?NWlrOTAyUWVvQ0JIZDc4RTREekMxVHVXMXRTUXNlMmJ2QnFtb1RZdmVocUJF?=
 =?utf-8?B?YlZpQlFoWVM1c3ZTenR2UWpQNlE5RDFPcExmQkZORVhoV2pwNFhlUXk1YzF1?=
 =?utf-8?B?ano2anIyVU1EeE9ralNaMVdVWnQyV0lCN0lQM2NsRFpFVmh0SDQvU2tuSzhL?=
 =?utf-8?B?SWJmdVFrK1pVb1VrYmptRUk2bEFwTm9UWnEwZDZSdHAzTVpva1BxUmZXMkJ3?=
 =?utf-8?B?U1lnc3JYTVlmcXNhVTBXLzQyQThORlJYNGErTHpmdk1peDFQZ0U3aEpyZDNp?=
 =?utf-8?B?a0drT2g3SDJIczFMU3RVaU5MV0RrR2lpc0V1aUhBYTR0dHBQV2FqR2hvbXo1?=
 =?utf-8?B?SlQ4Z2o1UVZmSk5QMmlDU1ZrYWp3RWRwa0RsLzM5enB1RWhBSXQ5Q2R2WUQ3?=
 =?utf-8?B?VWRPamh3MTdwVWl0Y1FrZis5d1NCaHUwazJIMzlQblNlSVZHM21WcUluUVhs?=
 =?utf-8?B?c1EyajE0VXlJU1gzMFc4MDBObWRRMUxtMkQzVFljR3prTzM1WkhMdUVZNktJ?=
 =?utf-8?B?VERHclFNMzhhWE5aSUlCVzJOdTNnY2Jlc0UzdTVyOERoQVlCSDdUUXpPTUxh?=
 =?utf-8?B?WGxtZ0ZiQXk0QnRmVUQ3ZGZtM0tNaEQwY3RrdHdURjRGMXJEQkpZdXJkcncw?=
 =?utf-8?B?L0hycW5CMUFhSTBhVDlUVVFDeW94aS9CTVZDcXU5QVBtOGp3ZVh5VzU3YW9B?=
 =?utf-8?B?c2JYcDFlU0FTbTdQOWJocUJ4UHc4WTZITVpVSTE1Q2ZsMFFoRGVjdmdoRVhI?=
 =?utf-8?B?emx0bEZFOVBzK0hCNi84YzVMTE1JSmRLUnhuQmJXQVUrVkpJb1cwYm85ZXJs?=
 =?utf-8?B?R2MwUU5SaERTK2lGc2t0bHV2L2hSZ2tJQ3FScnAzY2gxNm9udFZQaFN5WW9v?=
 =?utf-8?B?ZGV4ZzFaUEY5amUwODEweEt3aVB6VkJuUmNsZlVndFJoQ25wb1lIMXFPZm9P?=
 =?utf-8?B?d2thelA1dmJMd2MxcGh1Zzlmc1ZkZDFDcTJRaEZVNWE1V3hnSEdYT3hwdkZK?=
 =?utf-8?B?QXJ5MjE5SVh5VUF0eFZUeit3U0J0TUJZcFRpdld4RE9SbU56QkZBSWRiL2Q1?=
 =?utf-8?B?cndJTk1EWTM3dHRjNlRIK3FDWkhZZ2ZnNmlmWmFMV1A1M0UvMU5NckNaY3RU?=
 =?utf-8?B?bXJmZ0ZFc1JjQnZ3RzNWcjdYUVI2S1JGaDFoRnVZSTU4dVRnbHYwbVFEcHJx?=
 =?utf-8?B?dXQrbFhQMFhpQUMvSmR2Q21obXErTjFva1Y2dTgvRFJSaTgzNVhwYmNiRkVG?=
 =?utf-8?B?d1BaNTY4T0RUY0tGazdQejNIR2kwQmlKTFZxRWlLcXY0ZzBVc2tUSVFqbENP?=
 =?utf-8?Q?YTWZhdVymm7sWWAQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7420F290F4654A4BA1E246E3BB583C70@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b5520902-a572-438f-dcca-08deaff7e54e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 07:27:17.1799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aX8IK3J1uJPa3oRsbJC5ZpKXOKd6dIvZGQWgDFTw76aPteiuYUzoCqlnRHvxHmnCHHcVX2HsoqAa1jZI2DUCpNGmTM1VJjzUjhtsAiZcNgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9065

RGVhciBEZXZpY2UgVHJlZSBTcGVjIFRlYW0hDQoNCkkgd291bGQgbGlrZSB0byByZWNlaXZlIHlv
dXIgb3BpbmlvbiBvbiB0aGUgbmV3IC9jaG9zZW4vcmVzZXQtcmVhc29uIHByb3BlcnR5DQpJIHdv
dWxkIGxpa2UgdG8gaW50cm9kdWNlIGluIHRoZSBzcGVjIGFuZCBjb25zZXF1ZW50bHkgaW4gdGhl
IFUtQm9vdC4NCg0KSSd2ZSBwb3N0ZWQgYW4gVS1Cb290IHBhdGNoc2V0IFsxXSB3aXRoIHRoZSBw
cm9wb3NlZCBpbXBsZW1lbnRhdGlvbiB3aGljaA0Kd291bGQgd29yayBvbiBUSSBLMyBTb0NzIGlu
aXRpYWxseS4NCg0KLSBEbyB5b3UgdGhpbmsgSSBuZWVkIHRvIHNlbmQgYSBmb3JtYWwgcGF0Y2gg
dG8gZGV2aWNlIHRyZWUgc3BlYz8NCi0gRG8geW91IHRoaW5rIC9jaG9zZW4vcmVzZXQtcmVhc29u
IGlzIHRoZSBwcm9wZXIgbG9jYXRpb24gZm9yIHRoZSBTb0MvcGxhdGZvcm0NCiAgYWdub3N0aWMg
cmVzZXQgY2F1c2UgaW5mb3JtYXRpb24/DQotIERvIHlvdSB0aGluayBoYXZpbmcgYW4gb3BhcXVl
IHN0cmluZyB0aGVyZSBpcyBPSywgYmVhcmluZyBpbiBtaW5kIHRoYXQgdGhlcmUNCiAgaXMgbm8g
c3RhbmRhcmQgYXBwcm9hY2ggdXAgdG8gbm93IHRvIHRoaXMgdG9waWMsIG5laXRoZXIgaW4gTGlu
dXggbm9yIGluDQogIFUtQm9vdCwgdGFraW5nIGludG8gYWNjb3VudCBkaWZmZXJlbnQgU29DcyBh
bmQgdmVuZG9ycyBwcm92aWRlIHZlcnkgZGlmZmVyZW50DQogIGluZm9ybWF0aW9uIHJlZ2FyZGlu
ZyByZXNldCBjYXVzZSwgd2hpY2ggaXMgYmFyZWx5IHBvc3NpYmxlIHRvIHVuaWZ5Pw0KDQpUaGUg
cHJvcG9zZWQgY2hhbmdlIHdvdWxkIGxvb2sgbGlrZSBmb2xsb3dpbmc6DQoNCmRpZmYgLS1naXQg
YS9kdHNjaGVtYS9zY2hlbWFzL2Nob3Nlbi55YW1sIGIvZHRzY2hlbWEvc2NoZW1hcy9jaG9zZW4u
eWFtbA0KaW5kZXggNjNmM2MxMi4uZDkwODQyNiAxMDA2NDQNCi0tLSBhL2R0c2NoZW1hL3NjaGVt
YXMvY2hvc2VuLnlhbWwNCisrKyBiL2R0c2NoZW1hL3NjaGVtYXMvY2hvc2VuLnlhbWwNCkBAIC0x
ODMsNiArMTgzLDIwIEBAIHByb3BlcnRpZXM6DQogICAgICAgd2lsbCBhc3NpZ24gZGV2aWNlcyBp
biBpdHMgdXN1YWwgbWFubmVyLCBvdGhlcndpc2UgaXQgd2lsbCBub3QgdHJ5IHRvDQogICAgICAg
YXNzaWduIGRldmljZXMgYW5kIGluc3RlYWQgdXNlIHRoZW0gYXMgdGhleSBhcmUgY29uZmlndXJl
ZCBhbHJlYWR5Lg0KIA0KKyAgcmVzZXQtcmVhc29uOg0KKyAgICAkcmVmOiB0eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy9zdHJpbmcNCisgICAgZGVzY3JpcHRpb246DQorICAgICAgVGhpcyBwcm9wZXJ0
eSBpcyBzZXQgYnkgdGhlIGJvb3Rsb2FkZXIgdG8gaW5kaWNhdGUgdGhlIHJlYXNvbiBmb3IgdGhl
DQorICAgICAgbW9zdCByZWNlbnQgc3lzdGVtIHJlc2V0LCBlLmcuICJQT1IiIChwb3dlci1vbiBy
ZXNldCksICJXRE9HIiAod2F0Y2hkb2cpLA0KKyAgICAgICJQSU4iIChleHRlcm5hbCByZXNldCBw
aW4pLCAiUlNUIiAoc29mdHdhcmUgd2FybSByZXNldCksICJUSEVSTUFMIiwgZXRjLg0KKyAgICAg
IFRoZSBzZXQgb2YgcG9zc2libGUgdmFsdWVzIGlzIHBsYXRmb3JtLXNwZWNpZmljLg0KKw0KKyAg
ICAgIC8gew0KKyAgICAgICAgICAgICAgY2hvc2VuIHsNCisgICAgICAgICAgICAgICAgICAgICAg
cmVzZXQtcmVhc29uID0gIldET0ciOw0KKyAgICAgICAgICAgICAgfTsNCisgICAgICB9Ow0KKw0K
ICAgc21iaW9zMy1lbnRyeXBvaW50Og0KICAgICAkcmVmOiB0eXBlcy55YW1sIy9kZWZpbml0aW9u
cy9hZGRyZXNzDQogICAgIG1heEl0ZW1zOiAxDQoNClsxXSBodHRwczovL3d3dy5tYWlsLWFyY2hp
dmUuY29tL3UtYm9vdEBsaXN0cy5kZW54LmRlL21zZzU3MzgxMS5odG1sDQoNCi0tIA0KQWxleGFu
ZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==
