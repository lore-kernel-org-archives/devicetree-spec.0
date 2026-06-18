Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013055.outbound.protection.outlook.com [40.107.159.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094662D77E5
	for <devicetree-spec@vger.kernel.org>; Thu, 18 Jun 2026 16:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781801580; cv=fail; b=AAfmZR/F0w3ZPq64poW5ks02GjE/QEst0W+gY3fM9jCiA/tcdjUSG0UrgDEQn34I7YRalVU+gK10hfqpfsXCtWMrr8V/DjE5g/n5yO/i4cBFzSqHZJAXvqfbDm0/JdYEP/XKKiA596xfAjD7dlVKBZyH2bXw/263nR0qESs9hOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781801580; c=relaxed/simple;
	bh=A3TWYwKBYaRWjC3Z1FcSilHXtVVx+LnRv/vROXRxxHc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WOgA+TK1gqEy2eJ87nENNtkzZ2htLEeavsF/VKvRXfmfVpuscJbc/ezdZ4IfxV+TplXwnEw4RA6/R9TR2XIIA6BrmEAtH9z+1oL2znvSXVODAGAiAksDCh+1q0vLf9SDCTce+5WAGa/QR6xwx1eFTzYaXn0YeaOWsO8w4i64HKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=lRVh3G7+; arc=fail smtp.client-ip=40.107.159.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="lRVh3G7+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDFQG61YTXEYtsJpBk9dm44CNcnC0uTBr7kfbTJ0ihzsH/BQlBEpIm9HXdt3XwfoCo3qLpcCZAG7n5CNSih0+IwwzX42iZD1nHWQKVvXblGPKAJxigOVVHHYUBnayGsJmpDYgb9L9IjPJlbs3Bzw/2okAVwTXZT/vQjECgESTGBK4o3Q8OhXQB9TFuV17ztQZ2fVS/dZJ7LY6Z7vdlnhegqoXWDROXEXsBRJbb83Dt9wH3/ROGyqTylt7F1doYblN2dcTLf6fa2vKOcKvqjpr85w4hcYT4LOsVPOZ8zFZScX6nbTq28oVi5lyGNwRf/kzEXImQyq3wGY3sNjE6Dp2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3TWYwKBYaRWjC3Z1FcSilHXtVVx+LnRv/vROXRxxHc=;
 b=RQjSb/6FyTS6PO3aoN+BnYcwNHYnPQLuh4hSFvp7qavHoA4WiGB+t1YHITh27ypUn7Lqq90HceRtDZEQ9Ehgy8W7tMWZz3fFr2YM0IFJOO2I32ZxDVTqDhgSFoBKV1yx6vLGYZ6K4Qg1n7FUTmIPq5roqQb26a7+rQisSeGoCIvcGwvC2WFvqWu4uS74qL/V6iZggat06FHeEuXN/En/gte1wOsGejMmdcjwOLdDCYl7uGY/Ph6Cf76rTPMAEt0bP0TwlHtTt1v+GSYCOH1U1i+cnV6AgXmXxVjcQcI94wXOnfdjjS0FywDrKSnkh5a03HyXrFe5WZeOaYmnfaeaMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3TWYwKBYaRWjC3Z1FcSilHXtVVx+LnRv/vROXRxxHc=;
 b=lRVh3G7+d6M2SXcV6s0cdaTYVz9mhwBeHWFpO6oIWendUhCF0d1OyPq308Uxi1al0L+nyFV6FAwFrdMwWF7HpeT6yod3VXQtxObj3xwVoBk+EzAUd4hACMbxUJCeN42lEPwuKyoxLzE2d/fQdI0Hcr0m4r4ZWENQubli/3BYEhzCx7LQa5c26hYcMP7LUkSzzivPNsndQ77Zwg1uqZAf1DGvQlMbuINTZNQenoxZ6idRF1xdR9QcdQ3ub2tCVS6xvRls7s5m7kxwQgEWLduh3IafIkdOOJC2EJk9J23Gc9NOzGMiDPKdhidWqV6ROjEuqK5kWuc6wINf6+E+iIH7pw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS2PR10MB7660.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:62c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 16:52:55 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 16:52:55 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "sjg@chromium.org" <sjg@chromium.org>
CC: "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Subject: Re: [PATCH v2] schemas: chosen: Add reset-reason property
Thread-Topic: [PATCH v2] schemas: chosen: Add reset-reason property
Thread-Index: AQHc9Mmr9cro80sXwEC5MsxpUZz/MrZEg9SAgAAYaAA=
Date: Thu, 18 Jun 2026 16:52:55 +0000
Message-ID: <5ed5509c1027571c0f102fb2bfe78995b96e39b3.camel@siemens.com>
References: <20260605085938.3779084-1-alexander.sverdlin@siemens.com>
	 <CAFLszThb9beaPZDV0NF8RGCPzxgOTGFVGD+cVWCKYc3+DD-tTg@mail.gmail.com>
In-Reply-To:
 <CAFLszThb9beaPZDV0NF8RGCPzxgOTGFVGD+cVWCKYc3+DD-tTg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS2PR10MB7660:EE_
x-ms-office365-filtering-correlation-id: 3f27a36c-c6c0-4e92-f68a-08decd5a0b54
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|4143699003|56012099006|38070700021|22082099003|18002099003|55112099003;
x-microsoft-antispam-message-info:
 Buni4WTeXTwQZwzMt2YAXt/ZrfROjhAj2YiMjEbXGvrDrMt7vaxNAUuzDuTU5+spzneXZ1ZgE8npetfck9Uq/KqevOV80TfODOOxSXYgZZBkf5ATRq85YtqhwqCcNy6y+AAaj33J0h/0CTQMxDcv6HMpT3WGX2EoG765RJNFYe2rEaMd/arHscUpTOxK5rKrc2t/j98VpZCKXJ0x7UMKfIAFN6NHBRigi86ZxYs8eEmit/51Y7/lIDBD0HmEiuFi/6fDI+pHSvZIlWs6uZajlw+d9Byv5U6QThLlXVyiEZo6V0jtlmb9c4PaT6gyHNdkBIZyiZEWGaa4A3TbKAWjcTjWyojq0JX59ffybV3QDyt3/o4SGzW8+3Zg0aD5Ntyb3u1yYzPtYLMU8lOYuMnlOc7h0HgNJTVTVkZDG/kfAKoHZS8KjCtfPP9xR25YEo1XSmv9Hj9r7eKrWrTSJedU5LmhIw62wGBYSOMsvpjp5o0sU0Z6A3yPm25zXvME/ttC5TvyFad9fMoGw2A8kAy3gO3Znzp/tk9GxhnKr204HunROidas3/7Y+VD1GUQKODyl4ngcRptGOG6k3ZHYrWDcGH2V3TAJIJfoixFRjF8UC0gA/gt4CxIcAeLFcfRO4dw7AZtHi2hQ8mWarekfdprKnqZtMxSZqW2oCeBAHHhi3+/cPcaJZCXXdVkGde5u3h3unEjIz2vcmXvkHFgzQCcbw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(4143699003)(56012099006)(38070700021)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGRaZmFQMEtVNkV5TTlVaXR5MUVMdlk4a2F3dC8wV2NibWVzZDZzQ3F3RlFH?=
 =?utf-8?B?RCtpUHVMdVBoTmltWmRyN3h1QWlyazRrWXp5S1hQRmpaZ0hVemRyU0o5VW41?=
 =?utf-8?B?a3FJb1NQLzVIQ1NUMnYvb1pxQm92cngwMGV3QkwrM1BFeUZjQnBWNHM1UCth?=
 =?utf-8?B?Q0dRallnVkU3MTl0cm1vY2lGWVd4RDBOTkIyL0gyTmZpcTdta1lMRXYxMko4?=
 =?utf-8?B?TUNrTEhkR3M2YUUweUJhajFoV1QxVUQ4Z2xHdVdtQVV5RitBSHE2c3ZCMFhu?=
 =?utf-8?B?VVpWa1h3Q0RZWU53STRycFZweG5ONnpHQ0ZkZ3IrUUtoeHFoTlZSMGtHRUhD?=
 =?utf-8?B?QmxaZUUrU0FlbFd6WXhwSHRLYytyUTArLzEzRExjTURoVTZGUDVycTQ0bmxu?=
 =?utf-8?B?cHBzZnNrR1R0MUFhTVlldzdRVy9CVHlKY0M0VzlzR2dDYmlhTjV6VVZLWU1m?=
 =?utf-8?B?N3BLa2xoZFRkVzhFbTJGRWpzL2RlRUdPQ2syQkVRYlhpTXRFWklJcUNLY3d3?=
 =?utf-8?B?QklNREZvTVlKMk9xTEkralJ5dERHTkhOZjhNdy84UzhnRk9VUFRwek9ZWTJy?=
 =?utf-8?B?V0phb0Q4K0xlTHVnalVkZ2VTTXBEcSt5Njh5RUdhMlJReDF3Y2dEaWRSRTJ4?=
 =?utf-8?B?dnlPaEI4Vys3TE9xRzFPS0kwajlZSFhMQjZLLzNkZVNremkweW5HVXZXSGN5?=
 =?utf-8?B?eEhtZDd6RlRLUDRJR0h6Y3phMEFsT1JkTUlSbEcvbkRGVzBYVURuVGlaK2Iz?=
 =?utf-8?B?QXZQWDJTWWNUN1F3L1pvQ1pGeVVzSU9HOCtlMEEyNlVTMkdYb3d3QW11ak1a?=
 =?utf-8?B?RWZWeEpCck1ocEh4K0VBcGFQZk5mM2Erc0JwaDV5M1RKbWdCMVk2QUljVzRn?=
 =?utf-8?B?bUZwTnkxV1hJY0lWYXNHbk9xTDY4OTdxZm94b0JiMi9tSDBQQWNOcE9aaXJp?=
 =?utf-8?B?NFh4YTNaNUF0Uy9kQ05PSWQ0UFcwc0c5eUVFdHFhTTJNVWF4R1NHaHRWT3Vq?=
 =?utf-8?B?OW9JZDgvcHNSck5PbmMzVm5YSWhpRlhGSGNETFlBZHFKZmdid20zU25FQXMv?=
 =?utf-8?B?a0NCUGhQQUx4eUtQajlXSEcxMGpZWnB6RHZ1K2Rld3U0L2hpM2R4VVR2SEpS?=
 =?utf-8?B?ZXlHdGhockc3bDVvZlA2RGlsSlkwa0lUS1JiMHRxcy8vM3duYWlGcFNMK3Zn?=
 =?utf-8?B?N2xGTXlzbFNuZW9LdWRUS0k3UlVJRFRYaWsrY2dFVWlBTENnN1JwTk9tckpB?=
 =?utf-8?B?dDVZbnVqRExUeWo2dWVvemNJV1lpaUR3RFNyVVBxZUVBMXB3U1dpUGtrYlcz?=
 =?utf-8?B?U21oMTdEd3FQZ0pUVGR0Q3FUL0FYdGFwYnlxdCtTYmtrZ3FjMDJnY3RPckIr?=
 =?utf-8?B?N251RlZDQitpcnFSMjMwWU9VTllETjlBYVpFZVYvU2tWQnk2R3dteXdWazA3?=
 =?utf-8?B?elBlVnViV281TXlaVkpROUZHSWt2THFNSkg5NW1aNENNUjNvL1VuakhXK0RQ?=
 =?utf-8?B?cU9VUUNvbXdwTWVNb2FGRGw0K1NGWE5tZ1VNNWhkSGk0YjZuckl6WSt6cWJZ?=
 =?utf-8?B?SDJKVWxMZlJ3YWpidkpJckJZMFNFcUNhODVlWjFmbHFVbm1HbzJWREtlQUt2?=
 =?utf-8?B?WDZPb0lPV2poRG5XeUhVM0pHaFYwWXdEYlJ5SEhKdnhma2ZnamxVSWRxTUtE?=
 =?utf-8?B?U1NDME5DRjJTVkFlNzNSMTh6aEF0ckNWdlg5bTJqUHBiY2Z5bnUzU2ZzQXJH?=
 =?utf-8?B?dSs0STJIT0Y2Y1FpMjR1WlVIeWU3dW0vQktrNUFMTXRBWmpuVDhCYVZJZy9F?=
 =?utf-8?B?alh1bmN0d0VWOUpHL2htWjRTU3RpZGRuZmgzZFJzaVZhemhCdUQxNGk4aThP?=
 =?utf-8?B?Tk1CRFVZTEF5V3NTa29KaGVyZ1lCNnJzQ21ENDBnUWpxeVl4N3BtSFFOVUtG?=
 =?utf-8?B?Yk9CQStyU3V1RitoTGwyMU1rU1o3YVhoeUQ5RDFsT0tOYXlmSVc0WWYxbGpv?=
 =?utf-8?B?RVJnd1VnQWlQZWY5M0tncFJtNnBtTlFjKzlWU1haZTk2SDdzRjVxS2M5T2Qw?=
 =?utf-8?B?VkpXNDRVUVREQ3Mya21jSkQ2bVJCWk1aZ0RwaHBQRyt0RjAxREJqb3FubDVs?=
 =?utf-8?B?NVJXY0hLdzk5MFdlbWgybzFWV1NxS2NxZGtnMmNBWGVhZisxN2ZlWHJ6c1Vw?=
 =?utf-8?B?eUhubzFCVTBCWFArOVRnamhNSDZPS2FJd05SMTg3MWR4elErTzhacDBXS05v?=
 =?utf-8?B?N1VHVUtrZFRXMGpSUnpBN1pQcU8rWWJWTnBtM3cxR0x5eHZ2VEJlSGxRZFAw?=
 =?utf-8?B?a0xOdVhQS0Q1MHRxZGJ6WHFqVUhwK3YvQU9VdzE3QnJ1WnpBU1lTZnc5L29t?=
 =?utf-8?Q?IxlSesUr1GpHx/W4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65A6C3BC647CE548A4604DB52E64130A@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f27a36c-c6c0-4e92-f68a-08decd5a0b54
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2026 16:52:55.3425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQFiOLrgDfwVZm4Zm+8FnIlgfBE8A1xHznu7LyriWDzF4WvG8avtL3xMyZ7Fipf9tBzbljjCfkGgApmujas6oORVRYpnQFHqB8zgui4fvXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7660

SGkgU2ltb24hDQoNCk9uIFRodSwgMjAyNi0wNi0xOCBhdCAxNjoyNSArMDEwMCwgU2ltb24gR2xh
c3Mgd3JvdGU6DQo+IFJldmlld2VkLWJ5OiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4N
Cg0KVGhhbmtzIGZvciByZXZpZXchDQoNCj4gVGlueSBuaXQgYmVsb3cNCg0KVGhhbmtzIGZvciB0
aGUgaGludCEgSSBiZWxpZXZlLCB0aGVzZSBhcmUgbm9uLWRlYmF0YWJsZToNCg0KPiByZXNldC1y
ZWFzb24NCj4gSlRBRy9kZWJ1Zy1pbml0aWF0ZWQNCg0KSSdsbCBjb3JyZWN0IHRoZW0sIHNoYWxs
IGEgcmUtc3BpbiBiZSByZXF1aXJlZC4NCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1l
bnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K
