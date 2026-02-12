Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011025.outbound.protection.outlook.com [52.103.39.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC82F318EF7
	for <devicetree-spec@vger.kernel.org>; Thu, 12 Feb 2026 13:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770902078; cv=fail; b=qokuKFgcVJIuvvvpO0da4nBPCCphbFVMZHVoi3qTNHkpKkYlfTI+8nLjNsHLPSyfrDZcSKC4/3UEpc1jtkwgnUZ3xq2HAFg6or3rL27lK+kI+3+aZSRvhhcX9p++LEjTzQ21MSBgcnMSPZsB1ecUG45z3R/TlyJESFbJo1iSq5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770902078; c=relaxed/simple;
	bh=nzgkfEIFeNMfk+HT+r+cfaKog5BGYS4PgezMGs/M824=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ebcinWtC9u5DdgwOHFb+m5XxGzbwsmv5mGEMhgvhEwv4g/ENymn7V5Fc0lUhV3EmMejSY/BCOCHHBCM4xye47TLYqvK6vYzkKqPbFJZSTcj6Trg+PDym1fVQi51gb/DxaMSRvz8Y9ThHQujmRFA5Yb0B5XCcqC7/SCcl1CCTD+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=Crfh2eiO; arc=fail smtp.client-ip=52.103.39.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="Crfh2eiO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSzos/YXoN8v/r3xTFACWj0mE4I8HRSPTh7AvBLCILySszvD6bijDyCttJtMIJiTP103Suy+FlTfUEhJaCJPqETA/JDATkRW7OeGEchQ25Iy1Z70wwExQ4GSsvMdjpRAm7w07tdesnhLHXwn5hL3T/fD41T0+a3X7GcAwW0x/sjmAKdqkaC7Ulcac8afqNTTEc8BsvvkPMW/0jbZ0kIC52UfHpUABRgd6DwKKi0kQRMQ4xrA8MGKpWMKOHQjHYs/K8Xx9fuGyToob9HpH0hh5XeKU+cJIF7zrb3dv+QKstJyae09V438PCOGgxwTxkVyXFXHjsKVkatJEPNqGw1xXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzgkfEIFeNMfk+HT+r+cfaKog5BGYS4PgezMGs/M824=;
 b=G0HPcH1gUkOz7m8uGYgc15C6ohJSC9Qhij4tD7QuraILgG49MEAF21gSFLYrK3n939yVKpXLTnOQ5lyMwSzdlzdWRSFSHnYP/zAF5XTDzY+v5BzL8H2YJrX4y02WWR7tyzTitexUXjCCE9g7t8pX2vYzSE5SB3uxMZb9aeV0Hm8jPgO51Dfttc1Qi+3/8Swwde8D2iLXzGaPVj0TEX9Rj2n+N5V/KeX3C4HUMijZG63NID+ciAF6N0ZxTiF5lf2Qori9sCJN5q3j1mdAXP0MRbnGGuJ+JAc6zUYwD4XtPfxiftSkTAVXnNVgTelsmrbInQYPJt9Y9C98u9Hpi4ek8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzgkfEIFeNMfk+HT+r+cfaKog5BGYS4PgezMGs/M824=;
 b=Crfh2eiOuyr553ZDde8nT/V/Rv8SBprV8Rl0LZAiEPGRtkzjaBdd36kdDDKFU/HgpC8ejCoQMEQ29YRH9vqnc4IuhzKBxZlMUFeWlj1pjJ1uHJWZCgSYPgdLncxzoMu764036HePEFrBdOqs3r+ZxnEJRBYDrLZLMeTT0i5RjeFRil0TET+PFjzUW/WSmYSSXuHzKx6rwksaObciGMdCZo8k5rpGFV/ZaZjEYLLIQVcgr7GOvL20IRnINhY4llQsL5946Uyg9n446gYUGm1quJbTVwXAmqRYIcfCBfIEgcw0sPQGRElkBXAME+SXHxS4jnDVoLeCQFxE+GPYx8vFSA==
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:285::14)
 by PR3P190MB0921.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:8b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 12 Feb
 2026 13:14:34 +0000
Received: from GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac]) by GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
 ([fe80::d3e7:d584:bbf8:fcac%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 13:14:34 +0000
From: Kyle Bonnici <kylebonnici@hotmail.com>
To: "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Subject: Ranges - Intended use case
Thread-Topic: Ranges - Intended use case
Thread-Index: AQHcnCGH5Z7Q0jqRZk+jBQogOApGKQ==
Date: Thu, 12 Feb 2026 13:14:33 +0000
Message-ID: <7CB259ED-7AFC-4EE1-A926-54A5F6DCD97B@hotmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXP190MB2509:EE_|PR3P190MB0921:EE_
x-ms-office365-filtering-correlation-id: 71e58d73-ae49-4d0b-d985-08de6a38aa3a
x-ms-exchange-slblob-mailprops:
 9qw5+ftluCCm9yoJ9fgtGwzhjjsJDn+q/h6MmJ8Num4Qr1SnxyHNQ5zwbM5cPGo53LrF1xxxqshfQox7Bgfye5NyxuER/Jz/RlTRna785cwFiXn+aJUzWDJcvrZinIQC2Ue0Mt4XoaZvXJwdRYmOygupxsJfn3cwUoHKg48yED6NcKJXjxMt2BV0R/Eq0DNWoEcTQOA3K6BB2En4l1qsb67A84W2IrrR2bcmEOsCGUmfCLjACSBVrWKPpDXW7Mv7+HCARG4M6JHfCX9DMQqFaCHKg61jTE3tXl0Rq6XdxgEOdA+rJHJWye5v6ulu1clS6vBBJ3We8IAaTd2CVPHRzOgSeT6miaG08nJ8lzeC7QTa2drHgDGeXAl/uxkgPOEapmN4uMoaH//JAe1o2ZB8kbZvHzfA1TrPh9cFttsFeyBzMTl3wzUOVTOmGOPer3c3KiA8n/EALa8dPWuI1PgyrvRKlP1/B1xhLcyq8sY54COK01JYNM3Llr1Q8+nsOdvl6pQgwynogYwvP84PRIokGrwsdTmgFk1X/Bj0ouY2htt7cAqzDNTRXg83dOodVel2BHfngFYgWZR/Hc8jRUEG9rwEe4oZENSZ1WaLn48iBdsdpsKk4Sw8S3syMSYRFlyyfRB9UUQ/VG8kf/KqiE80ZRvk5DQhgBDoEEFKK8moGhzOnnA5qNgurzxxM42Irqr8NJYBD7f3LiY=
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|19110799012|51005399006|8060799015|15080799012|8062599012|41001999006|31061999003|3412199025|440099028|40105399003|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?dmNiYzJ2eGc1Q2hVTk4wY25RekZsa2RRbERieGlqWlMxVWZlL0tPeW1kZE9Z?=
 =?utf-8?B?QTkydk5Od1dQdkF1QzhwM1RFZTdoeWltZUt5a0lUK2RUbk43UUI3RHJrMHIr?=
 =?utf-8?B?VUY0by9XUE9FNDRVQThucm5ldktPUUNxME40M1JyUnVReXpHQnB4dUFHUklh?=
 =?utf-8?B?MExybzdkZ0huZFRkTnJtcUVpdGhLdFRvVXN4eUsyaWtLS0h5MFh5L2diWEhv?=
 =?utf-8?B?a0tlQkpGaFlLSHFuN2pMb3JCN3BqSktyNTNmV3dXSEhlZWQydDhuNlkzY2pP?=
 =?utf-8?B?Rkc0THZtN0Nka3dQQlBSRjUrZVVXVFVFMXRpaVdrZGlKejkxMGFUMFYvcVlr?=
 =?utf-8?B?Um1HWHFEMFBjeWFRU2NPVVRSd2FXR1BKUGpybjd0bXpTQi9qRmdtRHlJMFdl?=
 =?utf-8?B?OE5XMXRJRmdzUUVnb1E1SXh3SHVWcHZWTGJLSFNBdXRYeXRmYnlrWDJxK1dF?=
 =?utf-8?B?RzNmd05aTnFHbC9TdWE3M1RkaGFOWkdiMTRZdldGV2o1S3lCWm5aamVYYzQ2?=
 =?utf-8?B?YTVCSmg2aURpelpXd21pUVJRZUNKWEFjOXY0UFNLNVU4bXZFUldYM05jdENC?=
 =?utf-8?B?ekJpY1lhM244ZWpyUE00YXh2QWsxZlNCM29pOU9UcGZSQWVqQzAvWWlZUVBU?=
 =?utf-8?B?bC9sRWhkTWxkTXJsZGgvZVNnZGNNeG9PWUd1ZXZNTmR5RmdFZEM3MWlKMHpz?=
 =?utf-8?B?QVUxWVlMb2JZQlRWeFlHMklvb241L25XUnB5LzlUL0hiTGkzTkVWUkR1eGNC?=
 =?utf-8?B?eTNSeXlpZVJ6bStWTXRrTzlGVnlXYm9BOWFRZERNczhYUE0zdmRyV1Q1U1c4?=
 =?utf-8?B?OXI2VmdvYVZrSEFJNHNGRDJUaFF3NDJ1b2NHTDJTa0U2YjlLK0FSdm5pc2FR?=
 =?utf-8?B?TXluRlIrYko4d2t5RS92NXdWeWh1QW1DWkVYaVFTVnIreDd5aTJNLzlFVGM0?=
 =?utf-8?B?VFE4ekU1MDZSYVZGOVRVNk16RFEvOVkvSGxUZWNlOE9kUWlMelNHYmRFTWU5?=
 =?utf-8?B?Y1Q1eVk1ZHByRVJSdEROaUQwQVhmMWljTjdMVmlTcERDZnI3c01kb0tVdTJL?=
 =?utf-8?B?U1c1RTdTZ2Q3ZjRyeFc4K01kb3QvLzkydExMTEprOXA1MVd3c3A1eHNJNHRQ?=
 =?utf-8?B?K29ncnV4OVNJWjVmU2tOa2ZCbEpHd1ZobXBrMEVabEZ3dWVPL1Jlb1kvL2Na?=
 =?utf-8?B?MXo3UHRhbmxTVUlaSEZOeWxYQTFQVERjbWM2QXBUWUM2N2VseUxkODdnTGdz?=
 =?utf-8?B?UE5XN0lCOVZSV0FVSzYxSytiS2lYYXdLOHMzMllYbW12eTlsK1VIbzUraFhp?=
 =?utf-8?B?L3dBT1d5aEhDM0pzR2dJeExuSDlobUpnVzdhL0ZiTlp6YXA4anBzMGZQTUxq?=
 =?utf-8?B?UXkvTWRieGNpenZUQTV1c0tNdW5DZ2NpYTg1ZFUyT3hWOVFGM2JIbmR0dVE1?=
 =?utf-8?B?RnVmWWlYZm8wZkV1cnVRN3BXeitDRWR4ZWV4RmlsQU01cW1nTjd5ekdzTngy?=
 =?utf-8?B?RjNVWkNWcHB6OVdWdXFyMkwrcEJMVzV3c2J2L1hJeFNTYXh2M3lOK29jbFkr?=
 =?utf-8?B?b3Q3MW9uQWoyZUo2OFdvL1VObDJ4VW9JVEhmYlZNbWFJRk03Q1ZwcWRPc3RW?=
 =?utf-8?B?M0hBSElrUlNUWUROM1luNG03czlDaHc9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHdxQkJFbUlZZlcrelA2dTZZK0RPWVh5SXh4Tjk2WmExUGxrRG1JYnRNalQr?=
 =?utf-8?B?ay8rUDNXWDRsbmpGZ2llN2pjZEtwOXVqSDNkYUFOcFJ6aWhXbUpGWEplUkM5?=
 =?utf-8?B?d295L0Z5OVo2SGlxUFNiL2FTWGNPQ3ZSb2crQktyaVBQYnA2UUdxQjVQSy8r?=
 =?utf-8?B?d1hiZFdQcytNTjdCaGE2R3V5Q2lWOEVjWnJIbldhK3ZMSE9hK0ZRV250bk5K?=
 =?utf-8?B?dFE3cXd6b0tzaXlYRnJHMHY5RUhkTDZHdkRjYVJ6UEVCWTJlRW5oV253bUc4?=
 =?utf-8?B?R1NBc01KV1I3MWNmVys5aWtIcy9VWUNGNVEyVjZtSTFzdkd4bThQcFJxQVoz?=
 =?utf-8?B?NG9vUENId3hPdXRmZFFSeGgxU3JqTTA5MXRXT1JXNUlOT1ZwVGtnNDFwS3Q5?=
 =?utf-8?B?RFUvN1lrL0FicVltMjZUdnpyeGprbHpOQzc5c1NyckY4dnNYRUxlWGI0a21h?=
 =?utf-8?B?T2J6NUdlYjFub3F2clBuZWRtbkVxWmphRzJ0SkVNbkY1Rk1RTFZweWdZd0Yy?=
 =?utf-8?B?QWh4K0JzcDVncFcxaDV1VmJ4WTgyYWVYeGJock9Ld2xWZkJvM2pRZStSNVN2?=
 =?utf-8?B?R2ZtZTFtblZ2OS9tcDlmZ2ZGL2p4VWdFb1RFd25aUWhPQktnMXFpcW5sM2JT?=
 =?utf-8?B?d08zLzBLNU1EY1I2cTBDdlBROENEV2FhZm1YbUdiM1VPUmF3akx5eFNkTzM4?=
 =?utf-8?B?RXJXd3ZWZXJaYVlEdFVOVzNLc0JUYmIxV0RUMUNISm1udjhUTXVGYzlBQW14?=
 =?utf-8?B?WlBNTTdlam1sU3NTV09LVWYzNTlXZVo2M1dKRU00cnlPOXVDK2Nld2V3Tm05?=
 =?utf-8?B?U1pOYnBOSlFhRjRKeXkrcU45OVYya0hzWGJkTFRzUHVKQXh1Q2FWK0YrYmxy?=
 =?utf-8?B?YmhNT0VwdU9UQlRRNmovSi9QWHluSmdGaENLdkFLMlRYVjhMVS9ubXpCM2lE?=
 =?utf-8?B?SzdBb0o1bGdJR0lQa0ZDNGdDS3UxaVo2RU5KMkJNVCtjZHdwY2QzVzNwRDl2?=
 =?utf-8?B?bjdCWXEzSlc4MTczUTVaa2NQMFJuK29JWHlBc01UbHFZVGIybnM5aWNKaDUv?=
 =?utf-8?B?aUxRMXpRYzd3TFBQTzAwRjhneEN5ZWN2S21CVTMxQkdhY0RMK1p2MHcxYXFq?=
 =?utf-8?B?SGNjclYrZmhCOFhOeUNSSisxSWdQUXdjbUxiblNlVUtybXp5bXlNZUpTZUNE?=
 =?utf-8?B?eWtDRzVvRnJIS2Jsc210b1Y4cUR3M210QjFacmhWYmM4WG5oNnBHTWh0ak5I?=
 =?utf-8?B?NHd2MkZnczFUZk95ZDVLN3R0bUpxK21EMDlTQ2l4ZDkreDBpMDByTXd2am9T?=
 =?utf-8?B?RjR6dGpQOFlzMkVnZThNVHdLV2F0aGFDRGpuQTBwOXlkb3pPa2I5VUh2T0Y3?=
 =?utf-8?B?cTBjb0M0byt5K1JaUndpVXQ0WVhXc0hDNC9kWDBhaW5vUGhKQk1VWEhlcDMv?=
 =?utf-8?B?ME0xVDZhUDVoSFY1UE1NRWJpTzR3UE1ua0hSa0crVXhvdnk2MWhiRGJFSGQv?=
 =?utf-8?B?d256bG5jK0pHdGlSOFlTUUlyUmhDZVgvTGtnMDlDa0Q1RTRhR3l2ek1Na0Qv?=
 =?utf-8?B?ei9qMlIxMWhRVmIrb2RjeXYyWHdudW5ZdjhiWTlpN0R2aGFQcXBNL1owdWZu?=
 =?utf-8?B?WlR1Y25MTTlJVkdLMVRaRWt4bzBCQ1hlaC9SOXptazBKbHF0N20rQnNacC9X?=
 =?utf-8?B?NnNvUGo3TmJKY3pBdDk4ZUJwSFhRT24wZXlrTUdONGF5MWtGUzMxWnFJa1Nq?=
 =?utf-8?B?U1NlRTZzUWtSemlQcVJHTkJEWS9XUWpCWGZBSnk1ZHNIUTFNTVJBbER3V1V4?=
 =?utf-8?B?K2RhV2M3SkExNW9NcnlRYXdEcVhqM3h0Z0VnYTBXQUFvd3JLcExya25CdDdv?=
 =?utf-8?B?SUZDT09wWkZTNDFwVmhyODhxY0JJUUNvTUJmcW9lUjM1WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB5D4CC452C90647AC9597BFACC46BF3@EURP190.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-711a9.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXP190MB2509.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e58d73-ae49-4d0b-d985-08de6a38aa3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 13:14:33.9414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB0921

SGkgDQoNCkkgaGF2ZSBiZWVuIHRyeWluZyB0byB1bmRlcnN0YW5kIGhvdyByYW5nZXMgc2hvdWxk
L3Nob3VsZCBub3QgYmUgdXNlZC4NCg0KTG9va2luZyBhdCB0aGUgc3BlYyANCg0KPiBUaGUgcmFu
Z2VzIHByb3BlcnR5IHByb3ZpZGVzIGEgbWVhbnMgb2YgZGVmaW5pbmcgYSBtYXBwaW5nIG9yIHRy
YW5zbGF0aW9uIGJldHdlZW4gdGhlIGFkZHJlc3Mgc3BhY2Ugb2YgdGhlDQpidXMgKHRoZSBjaGls
ZCBhZGRyZXNzIHNwYWNlKSBhbmQgdGhlIGFkZHJlc3Mgc3BhY2Ugb2YgdGhlIGJ1cyBub2Rl4oCZ
cyBwYXJlbnQgKHRoZSBwYXJlbnQgYWRkcmVzcyBzcGFjZSkuDQoNClRoaXMgdG8gbWUgdGhlIHNw
ZWMgbGVhdmUgc29tZSBzcGFjZSBmb3IgaW50ZXJwcmV0YXRpb24gb24gaWYgcmFuZ2VzIHNob3Vs
ZCBiZSB1c2VkIG9uIGp1c3QgYnVzZXMgb3Igbm90LiBCZWxvdyBhcmUgc29tZSBleGFtcGxlcyB0
byB0cnkgdG8gZ2V0IGEgYmV0dGVyIHVuZGVyc3RhbmRpbmcuDQoNCmBgYA0KLyB7DQoJZm9vIHsg
Ly8gbm90IGEgYnVzDQoJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KCQkjc2l6ZS1jZWxscyA9IDwx
PjsNCgkJcmFuZ2VzOyAvLyBkb2VzIHRoaXMgcmFuZ2VzIGhhdmUgYW55IG1lYW5pbmc/DQoNCgkJ
YmFyQDEwIHsNCgkJCXJlZzwweDEwIOKApj4gDQoJCX07DQoJfTsNCn07DQpgYGANCg0KYGBgDQov
IHsNCglmb28geyAvLyBub3QgYSBidXMNCgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQoJCSNzaXpl
LWNlbGxzID0gPDE+Ow0KCQlyZWcgPSA8MHgxMDAgMHg1MD47DQoJCXJhbmdlcyA9IDwweDAgMHgx
MDAgMHg1MD47IC8vIGlzIHRoaXMgYW4gaW50ZW5kZWQgdXNlIGNhc2U/DQoNCgkJYmFyQDEwIHsN
CgkJCXJlZzwweDEwIOKApj4gLy8gaGVuY2UgYWJzIGFkZHJlc3MgaXMgMHgxMTAuIA0KCQl9Ow0K
CX07DQp9Ow0KYGBgDQoNCmBgYA0KLyB7DQoJZm9vIHsgLy8gYnVzDQoJCWNvbXBhdGlibGUgPSA8
c2ltcGxlLWJ1cz47DQoJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KCQkjc2l6ZS1jZWxscyA9IDwx
PjsNCgkJcmFuZ2VzOyAvLyB0aGlzIEkgdW5kZXJzdGFuZCB0byBkZWNsYXJlIHRoYXQgY2hpbGRy
ZW4gd2lsbCBoYXZlIGRpcmVjdCBtYXBwaW5nDQoNCgkJYmFyIHsNCgkJCXJhbmdlczsgLy8gaXMg
dGhpcyBuZWVkZWQ/IE9yIGlzIGl0IGltcGxpZWQgdGhhdCB0aGUgZm9vYmFyIGlzIGluIHRoZSBz
YW1lIGFkZHJlc3Mgc3BhY2Ugb2YgYmFyPw0KCQkJZm9vYmFyQDEwIHsNCgkJCQlyZWc8MHgxMCDi
gKY+ICAvLyBoZW5jZSBhYnMgYWRkcmVzcyBpcyAweDEwLiANCgkJCX07DQoJCX07DQoJfTsNCn07
DQpgYGANCg0KYGBgDQovIHsNCglzb2MgeyAvLyBidXMNCgkJY29tcGF0aWJsZSA9IDxzaW1wbGUt
YnVzPjsNCgkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQoJCSNzaXplLWNlbGxzID0gPDE+Ow0KCQly
YW5nZXM7IC8vIHRoaXMgSSB1bmRlcnN0YW5kIHRvIGRlY2xhcmUgdGhhdCBjaGlsZHJlbiB3aWxs
IGhhdmUgZGlyZWN0IG1hcHBpbmcNCg0KCQlmbGFzaEAxMDAwIHsNCgkJCXJlZzwweDEwMDAg4oCm
PiANCgkJCXJhbmdlcyA9IDwweDAgMHgxMDAwIOKApj47DQoJCQ0KCQkJcGFydGl0aW9ucyB7DQoJ
CQkJcmFuZ2VzOyAgLy8gaXMgdGhpcyBuZWVkZWQ/IE9yIGlzIGl0IGltcGxpZWQgdGhhdCB0aGUg
cGFydGl0aW9uMSBpcyBpbiB0aGUgc2FtZSBhZGRyZXNzIHNwYWNlIG9mIHBhcnRpdGlvbnM/DQoN
CgkJCQlwYXJ0aXRpb24xQDEwIHsNCgkJCQkJcmVnPDB4MTAg4oCmPiAgIC8vIGhlbmNlIGFicyBh
ZGRyZXNzIGlzIDB4MTAxMC4gDQoJCQkJfTsNCgkJCX07DQoJCX07DQoJfTsNCn07DQpgYGANCg0K
TG9va2luZyBmb3J3YXJkIHRvIGV4cGxhbmF0aW9ucyBvbiB0aGlzIHRvcGljIHRvIGV4dGVuZCBt
eSB1bmRlcnN0YW5kaW5nIG9mIGRldmljZXRyZWUNCg0KUmVnYXJkcw0KS3lsZQ==
