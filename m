Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010011.outbound.protection.outlook.com [52.101.69.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D0D3FDBFC
	for <devicetree-spec@vger.kernel.org>; Tue, 26 May 2026 18:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779819562; cv=fail; b=GF+/yWOyzvVL6zLWW5iPFruIT3j1siwGAdaXenhnhNleAjEkyg4pA6metsHCXtMl5Vb0i9CPFMls9XR8KjcT8LTCaXCyLxFe+KzGtSNf2XSQYmfLO8iwhoZY9k+e5d32Ns0wWTeYyJ6lk9HrnKg/ygRXg/CJh44z9R3WXHkWICI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779819562; c=relaxed/simple;
	bh=BeY32XR4gO5igQ+DdkKFAX589MVsMhQKHGnpLcHGehM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MC/72KYacX/hGbINtbBHkElnOTDKjr5/WQwZ9bLqGCzkNnHCgryfi3EhGKCINiOgSV8RkzCec+hmEc0F75kMvOdaj1ZrAZ+I2z/4yVs8vJcaq/h+DR5wLBu4FfK588/O1S2SMAHEFPyDWh7FVWr6MV1V5zlwGQ+8MzNntrxQK1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=DtHmr2KC; arc=fail smtp.client-ip=52.101.69.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="DtHmr2KC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYiXkr3l80KJcqAiovIeQTH4vP/SnWPbkvVZevZ6xO7KOGhDp1GXr3IlPRKLHnVyI2x0Rl7t19M7CPj8dshPQ/JFDrLjNorg7i4ZHxsboEEpB5XfPf6eOoL5KUNfm1zn05JIFOhs7BisG9w74CrQ2hiA+g3OFXgskF16OL98K9bDe4C8yotW5tUI/bm50tFi367orFUG5jXgvIZRNmU8u8UPrzZjwOymzIz/4wI2gEpBQC9LyDBMxWqDeAeqfURXQtshEOCAVndID3KzbmzCMKtnQ7P0R9tqRmThSsEWe4qY6PdGh62xLwTKBNbHFNlk45ZKiPEbgoQhQP2aJvBTnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeY32XR4gO5igQ+DdkKFAX589MVsMhQKHGnpLcHGehM=;
 b=VuSvQI5NE16xNsRlkS5AAq5WZqltOrTFjmCRienc2Q57Rz8OiOpAh0c2Tya4uVmCr8+d5hhXtrUEoIY0+SivE6jiYs9BNPx2bJ/M/pLIgFRcCKGTCd8IJs5iI0zDR0sD+yv+G2Ly8ZNOMt8cQBYPxgCwfhVJL4VHXh61PFUiCRAHZthQ+HsmCpbN7mokg3/+kfAT9IL6Fe6aSnOJ0knVAkOXoWXJWNQ6UhxrvNGlW2pHM3Jj1XBgBZfLumNt9JVfzROegDOHz3SHnAQNyog3IP13ibdmEw0C9IdnIq44nMjw02AFOVtwjVREip3ugu/Qocc6FfwY7UiAjqzrvnjMOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeY32XR4gO5igQ+DdkKFAX589MVsMhQKHGnpLcHGehM=;
 b=DtHmr2KCI1pN4PRqkQNCQ55yjM59sO0GjLlxiCeSMGrzEE4upi2uB9J/dNizXoNsUpTdwOK2DZO5w54VV7OST3himMvCxO+FO0FsPlVNEleg/Vt4NO7mhVhqAwPkD3Zp8afo/EGWHMUOTHdPMuLI2x7Yhi0+xZCPpIUcUequmbrCPCxYvsoLMrYSoHWgPA6vfVGoa9D6MGzMkjlxB5iyELkrLz7mWUk9muKq8/+hshrwgdI02ZjEYwHu7lDKmpLU0Mh7K0BA2k3DY1waKmhNa1UCxQz0I2YHOZ/KgdhvLe7HB2trZCDjqyUvBJKQNqnNj6RTXdrIn8quR0QyBhDgZg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DBAPR10MB3994.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Tue, 26 May
 2026 18:19:06 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 18:19:06 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "sjg@chromium.org" <sjg@chromium.org>
CC: "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"a.fatoum@pengutronix.de" <a.fatoum@pengutronix.de>,
	"devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Subject: Re: [PATCH] schemas: chosen: Add reset-reason property
Thread-Topic: [PATCH] schemas: chosen: Add reset-reason property
Thread-Index: AQHc7PwaJbwL8Q2CPkOtMdWc+npmOrYgWLcAgABFloA=
Date: Tue, 26 May 2026 18:19:06 +0000
Message-ID: <1c4b53e2d423c0e461d056f8d5da29c3de4e7cae.camel@siemens.com>
References: <20260526104034.2735938-1-alexander.sverdlin@siemens.com>
	 <CAFLszTjtk-4YvYM=c49fgzc3iB1h0eLByKHDS+KAgpVOS5ewnQ@mail.gmail.com>
In-Reply-To:
 <CAFLszTjtk-4YvYM=c49fgzc3iB1h0eLByKHDS+KAgpVOS5ewnQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DBAPR10MB3994:EE_
x-ms-office365-filtering-correlation-id: 1e375784-7947-400f-2ec2-08debb53461f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099006|38070700021|55112099003|4143699003|6133799003|11063799006;
x-microsoft-antispam-message-info:
 PEqXE27Vx/U9+13LgwTagwkVVZTWnWCzYK9t5f1W4PY09E6rjfwLKTyeH+fL134TtEGVPX73fTfH2kv28kvGYCUK3Qqf9vzuNp+FoWHn9b8pBeNrURZTgfP1pXbZ04/AwbAlMKtiDqySbg/JcKqAFU6+O3u3GVi215v7w9bFNg++mBtnWQ1AgQ3G5IVQR1COtOk3IdA8nmwAxK0KrgXZeius19xPabDhBjTFrMrYP7b2tKFZFUNpMOu1MSNB2eJesjFmlt3yn6SbygsWiYK23C+stPTdbTaMWtCoTNDF6iC42V00H694GlTWNhcLkgBlON+J18J/nWokodtNONh4Y8o7dAemSefodcbcFlIhf9gAppsHRleV5LM0B24EcQEsUewNm+Hvtz95yeAtQrG8a7bQ/Cc6/Pd3IxdgHBOXaP7G2QjtTERA7lFxz1ATKfxkX3n0R+DUXzTRSJUAEjiaXQk2v92ByNX2W06utoczRMLr26b0P1bGR95oCcm5RUJKeaTD8vZZh69efluCWlUr3eZTXVK5h1t5zzPcdbPfby5P5rP8rmeaVLzhysH57PhsSf/F13gETZMIfsqQkBvsKxeG3J23CZWDZ88h0DWLD5dHf3nZpIWMwM63+/nCa/mbO4Tu04DjcvjB08qAkafG+gf1n+Nnep5qPrABvs2ArjtWK+585qrjTyHq1guD834PxNfE4/a/wH114Qde5Ws5Kg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(38070700021)(55112099003)(4143699003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkcyUStnbVRzUjcwa1MzQzhCRUVoTWdIUVJhZDUwZHVmOHNwYXhlbW1hRVBw?=
 =?utf-8?B?S3VTbG1yRXg1UGhVaTVRcDAvK0hROWpoZ1lVWEhuR3FGYmFieTE0Q3BjUWg1?=
 =?utf-8?B?eVZ4OHNhekpHaUtTNmtUWW5ZZmM0bnV2dFhVU1FCaUQwWS8zNWdDcEhBb0lR?=
 =?utf-8?B?Vm5WWENISGVkTE5SUkFXZWZWTlNRc2tFd1dKdTZMS3RwWWZtdU14OFc3bERv?=
 =?utf-8?B?S1drYWpWY3NqbzRQRmdqeVBXOFFGSUYzSXlrUjU2bDFzM2N3UW9CSVQ2RkJj?=
 =?utf-8?B?RnJzenplNkpXanlWRGlheTVFcG12MDQxajZzRnNaNEhVK1B0NlBWWWI2d1JU?=
 =?utf-8?B?QjJYb0ZIb3VzM2VoUWxLdEt5RzgvUnlnUndKbmJGNnBKNUhvdTd2RHZxaDJw?=
 =?utf-8?B?K1MyS204NGVCeVJ2VDNIaFRDWVpNUmphR1J0ZEd1TmdVeGRXWHVSM29mUFNh?=
 =?utf-8?B?UEJaR3kxeFlGS1k3cTNBc25nNGZCZjEzRkVpUTlyS2FsOUJwQWVkWjVPMC9W?=
 =?utf-8?B?UHFvMjRxY3F2L1QrT2hCZURHc2Vxd1J4RXJ3TFArZ3VUSDE3QWgzV1B5akFY?=
 =?utf-8?B?S0NzR3VFRVdMQVdXdUhHVVBUKzZxNjVFZ1ZXU3IzZWoyUEN0TVQvaFZHbnU2?=
 =?utf-8?B?Q3hHSGJIaWdMSDExRTJBdjNoVVRuelpFbU9mZndkckQwajlMelQ5MW9sdzdC?=
 =?utf-8?B?eEIvSlhjUHQ2NTQ0SjdrRitoMU8raXozK2xQZDh1Y1ZtU25FRFlpS0ZpYXpz?=
 =?utf-8?B?dk9kM1BBQjdwVXM4THh4L1Zha0xsS1dNZkJJdksrL3NQd0hOSFZIZ3JjR0Fv?=
 =?utf-8?B?a29SVU1pSjg4a2E1ckE3UnIrT2o2ZHhTUXlNbmc4NVM2OGtxM2pvZTJuSHla?=
 =?utf-8?B?SDFSZnowaWNrelJsVFNtN2JLTkdDTThDQm5Xa0trakZIY3o0UFN2OXA5YkI0?=
 =?utf-8?B?SHZGRFZGS2ZlV3JBdXJxN2lxY2FFY2FrVVd2b2dHTVQxU0o2c1RGaXU2Z1RI?=
 =?utf-8?B?aFE0clMyYmQ0SHhtMnZ6Q2dwalFtUi9KTXlETW9ZQXhFTEt0dFdSOHVrN0hW?=
 =?utf-8?B?R2NQZit3TG1rYWF4Ui90bHFXaURNVTNoMU9pakRodCsrbmR3RVRCVjBsMWVT?=
 =?utf-8?B?REgvaXU2N1VITUhSN0hKQjNlRUI5TGY3eDVUR3N0NzN1V2RlWkFIQzZPbTJi?=
 =?utf-8?B?VHlnM05ZTEdyVTZuOFVPbVZRYUhNa0ZiOTRVdjZKYjBPQ0Y4elh5cTcwaXpi?=
 =?utf-8?B?cXRrR1Z6ZFFkR1Fkd3diUVVPWDUxdGYwZURqeVpNN2w2Z01WVFFsSm9oOUZW?=
 =?utf-8?B?R3JXdFNxOW0zRmNDakp0QTlRZURBVnR4Z3B2a2VOR2t6MWpjSlN6UEF6RExD?=
 =?utf-8?B?R09MZDVhbzMzYVQzaEhtL25sT3NZdlNVTlgwZG5ERU4xUVJrcm92REZ5S2hS?=
 =?utf-8?B?bmJ6WnlhMXBZMnR3enJTaG1rbGp5Q3dLWnBZelFGWjB6NjN2NlZNdHFXYUZK?=
 =?utf-8?B?OHBpRVJvQzN5eVV1dGYvSUwzYTNBV3NDU0tQOHJhRGNpRnRPQ3NMNXBUdnIr?=
 =?utf-8?B?ZTJ2NUpYRjVDQk02RjFPMjdrUjhsVjM1UnpGeWhNZHpBYm1ZZ215WmRVQmEx?=
 =?utf-8?B?T2cvaXRxWGRUS1FvK1VleWU4Nm4xRnc1Umc0bUY0L1VhWE9ZSXZ6dWJ1TE9O?=
 =?utf-8?B?dkZ4UXhGSDB0N1RYSlRaNnNtdGMwYlB4ZGRuRTY4T3ZTZG1SN0lSK1d3YzVQ?=
 =?utf-8?B?bndIeGMwVUMyRnhIZG8yREk4M2tpa2tmTW9IQks0Y0Z6Y2cwK1EzRFM4QXhu?=
 =?utf-8?B?Z01udlZhcXdvNnBKUWlnWW9ENEZPeUIxanMrU3pzWm9NTXh5YklEdEpUK2c4?=
 =?utf-8?B?SUdjZ1VCZTk5VDRMZDZpVWlzSkxCTXhQZUNhdjJTcFhsQnpPN0ZUWWJjQzk2?=
 =?utf-8?B?V2NWaDhoU3ljUnhqZlI4bGpUa3ZyWTZZU05MQ29NWFJRRTcraEIrZ0h6MW9w?=
 =?utf-8?B?YnpETlZPUkJHRGtiUXlocWpXdFp4YzRTWk5uenVuaVJKRjhxQzFIVTRQem9C?=
 =?utf-8?B?dGE1MXRPekRJRFc0d25Wd2wwNGNsM3hFRTNIUUs0dDQwRDRxUlJWbWtMVXdY?=
 =?utf-8?B?eVlrRFlWT1laaDRpZ0JqMUozVVlLaTB1U3VjdWNNUy9CSkpJYWlzNi9ucW9k?=
 =?utf-8?B?SmluTGJNM2VJZ3dqQ3JLUnVkbVRRWE5yRHptS1pLMkQ4TEV4RHpTTnIweFY0?=
 =?utf-8?B?dXlZOUlNSmRyZGp1bS9RVzh4aHZWdi8yZDZrVVljem5pYzF6QTc4em54aVpI?=
 =?utf-8?B?U1kvdm1nS09jZU4wcUJiYzJxWElxWEoxZUFOREhvMklmNEUwTjVTWWhZREhJ?=
 =?utf-8?Q?GMAjg0DLm4BgpHHo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DBAEECD306414429207668127EA1C89@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e375784-7947-400f-2ec2-08debb53461f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 18:19:06.5700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZpKGFGOACDyngJTfpmB7RxvOH4gwRPcgGdhhaFS/++g5S/zjh1wzrFJ//kaAF2A/rC1vMH8LMe3OuKw67uwaW2CDS4XKw9pheScDMmef60M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB3994

SGkgU2ltb24sDQoNCk9uIFR1ZSwgMjAyNi0wNS0yNiBhdCAwOToxMCAtMDUwMCwgU2ltb24gR2xh
c3Mgd3JvdGU6DQo+ID4gQm9vdGxvYWRlcnMgc3VjaCBhcyBVLUJvb3QgYW5kIGJhcmVib3ggY2Fu
IHBvcHVsYXRlIHRoZSAvY2hvc2VuIG5vZGUgd2l0aA0KPiA+IGEgcmVzZXQtcmVhc29uIHN0cmlu
ZyBwcm9wZXJ0eSBpbmRpY2F0aW5nIHRoZSBjYXVzZSBvZiB0aGUgbW9zdCByZWNlbnQNCj4gPiBz
eXN0ZW0gcmVzZXQuDQo+ID4gDQo+ID4gRGVmaW5lIGEgc3RhbmRhcmRpemVkIHNldCBvZiBnZW5l
cmljIHJlc2V0IHJlYXNvbiB2YWx1ZXMgdGhhdCBib290bG9hZGVycw0KPiA+IG1hcCB0aGVpciBw
bGF0Zm9ybS1zcGVjaWZpYyByZXNldCBzb3VyY2VzIHRvOg0KPiA+IA0KPiA+IMKgwqAgdW5rbm93
bsKgwqDCoCAtIHJlc2V0IHNvdXJjZSBjb3VsZCBub3QgYmUgZGV0ZXJtaW5lZA0KPiA+IMKgwqAg
Y29sZMKgwqDCoMKgwqDCoCAtIHBvd2VyLW9uIHJlc2V0DQo+ID4gwqDCoCB3YXJtwqDCoMKgwqDC
oMKgIC0gd2FybSByZXN0YXJ0IHdpdGhvdXQgZnVsbCBwb3dlciBjeWNsZQ0KPiA+IMKgwqAgd2F0
Y2hkb2fCoMKgIC0gd2F0Y2hkb2cgdGltZXIgZXhwaXJhdGlvbg0KPiA+IMKgwqAgd2FrZXVwwqDC
oMKgwqAgLSB3YWtlIGZyb20gc3VzcGVuZC9zbGVlcA0KPiA+IMKgwqAganRhZ8KgwqDCoMKgwqDC
oCAtIEpUQUcvZGVidWcgaW5pdGlhdGVkIHJlc2V0DQo+ID4gwqDCoCB0aGVybWFswqDCoMKgIC0g
dGhlcm1hbCBzaHV0ZG93bi9vdmVydGVtcGVyYXR1cmUNCj4gPiDCoMKgIGV4dGVybmFswqDCoCAt
IGV4dGVybmFsIHJlc2V0IHBpbi9zaWduYWwNCj4gPiDCoMKgIGJyb3dub3V0wqDCoCAtIHN1cHBs
eSB2b2x0YWdlIGRyb3ANCj4gPiDCoMKgIHNvZnR3YXJlwqDCoCAtIGV4cGxpY2l0IHNvZnR3YXJl
LWluaXRpYXRlZCByZXNldA0KPiA+IMKgwqAgc2FmZXR5wqDCoMKgwqAgLSBoYXJkd2FyZSBmYXVs
dCBkZXRlY3Rpb24gKGUuZy4gZXJyb3Igc2lnbmFsaW5nIG1vZHVsZSwNCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZmF1bHQgY29sbGVjdGlvbiBhbmQgY29udHJvbCB1bml0KQ0K
PiA+IMKgwqAgc2VjdXJpdHnCoMKgIC0gc2VjdXJpdHkgc3Vic3lzdGVtIChlLmcuIHNlY3VyZSBl
bmNsYXZlIHZpb2xhdGlvbikNCj4gDQo+IFRoZXNlIGFsbCBzZWVtIGZpbmUgdG8gbWUNCj4gDQo+
ID4gwqDCoCBwbWljwqDCoMKgwqDCoMKgIC0gUE1JQy1pbml0aWF0ZWQgcmVzZXQNCj4gDQo+IHBt
aWMgc2VlbXMgbW9yZSBsaWtlIGEgbWVhbnMgdGhhbiBhIHJlYXNvbi4gQ291bGQgeW91IGdpdmUg
YW4gZXhhbXBsZQ0KPiBvZiB3aGVuIHRoaXMgbWlnaHQgYmUgdXNlZCwgcmF0aGVyIHRoYW4gdGhl
IG90aGVyIHJlYXNvbnM/DQoNCnlvdSBhcmUgbW9zdCBwcm9iYWJseSBjb3JyZWN0IGluIHRoYXQg
UE1JQyBwcm9iYWJseSBnZW5lcmF0ZXMgb25lIG9mIHRoZQ0Kb3RoZXIgcmVzZXRzIChleHRlcm5h
bCBvciBjb2xkKSwgYnV0IGkuTVggZmlybXdhcmUgaXMgYWJsZSB0byBwcm92aWRlIHRoaXMNCmlu
Zm9ybWF0aW9uIFsxXSwgc28gaXQgd291bGQgYmUgcGl0eSB0byB0aHJvdyBpdCBhd2F5Pw0KDQpb
MV0gaHR0cHM6Ly9naXRodWIuY29tL3UtYm9vdC91LWJvb3QvYmxvYi85ODc5MDdhZTRiY2M1ZDYw
NTViZGY3ZDMxOGEzZWRmNTNlMTRkNWZhL2FyY2gvYXJtL21hY2gtaW14L2lteDkvc2NtaS9zb2Mu
YyNMNTkxDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVu
cy5jb20NCg==
