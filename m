Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11021101.outbound.protection.outlook.com [40.107.208.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9251382F1E
	for <devicetree-spec@vger.kernel.org>; Fri,  4 Sep 2026 19:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548498; cv=fail; b=AcbmDrC2hxdwKscuD2k41SML3Yo/+BRmp0xvQAOtXAy27EZ+Ba7MheNpbW6n7cFy2VYok/j/kDtMATf2YI1WntmnHH+eme5w+cH/rup+aQROl6vDpDkveLaBSS1hehWGrduyOZjVPfw+yUy0/4hPoX1AylP8uDg6PniPtQGV0rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548498; c=relaxed/simple;
	bh=+DsuowQ+euWhkLSf/A65+25k0ixy03EexydhVxarIF4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CPUkxKngqHaLMq1MJ0GquGg2l2/EWjTdE/AsjrD81rzJUb70Dns0cQcp2QfKGhbOYvq2SryBuBX2o0aWf7So1s/8+u+dslsD+y56NTG09lncSIdLlA5NDBI3Fn9zGsLQu1X2jw+M6bIcW+ftF/Fx8QZbmWeHJPNIrSWSmqzAMU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amperecomputing.com; spf=pass smtp.mailfrom=amperecomputing.com; dkim=pass (2048-bit key) header.d=amperecomputing.com header.i=@amperecomputing.com header.b=g4SVW+Jt; arc=fail smtp.client-ip=40.107.208.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amperecomputing.com header.i=@amperecomputing.com header.b="g4SVW+Jt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmvXQQL4rKZa6xx0E4imQNEWb3tS3X73ygtVWqbzbV78iyP+ZEzFfJOxv5J6u2fi/2a07E/3ARL3d3v8m4m6yYpE9iNZ5TxAPprkE03EKd55EabgFCK60/04K5HdnVMYDzBFDArviF8RKb4ESHOeK4RVsUnRqo2GwofgdWo1G29FUYh4l9wmZRf98cLGLJ8/a19N2qthmgZgGKCEiiaZh/u1KHlXohgT5r2v5xu5PsiF9VzWlGImurGWuMMRxrIwc137VlViuwuQuHjRQvSS7JoXxxRdQZZEvhBgqw0AwSSpccMvdEPAvegBTZvtZFgE9bQuKoEW1nYXqsLBlrsIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUBRjoq8E+JxW9UIlSOxnwuuspPyDHL1p44nebY0SSo=;
 b=cqIIDwo3iHyqEVEdTEuERi6/YPoHHzSaQwvP+PT0BNPU52pl+ygnDDd+ejoK8sb7tlC1whbI9txLchY7vkeDiYVxaa4r9lj8/UaxrDDMMg6cwxL3W4StqnllzemsUJavayx2YmU4JvK7E4vdbeBqvBofg9X2Ui9pvnFW6VCuDb3lqs7A/2glYdrjHI3lLCOUhafpSx7M4QMpG+4YdgM2tfowxyavsdLxBpWWMfTcUg0+i0wbDWSWO43iNAF+6wfTE8xdOz+azOOJsv+R/6xokoI4ZlobLK9nc8KhUMhqezdaaJcK65Zebg/NnuC7cBg4BN84oZMi+jNcTeYU7Q/uRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amperecomputing.com; dmarc=pass action=none
 header.from=amperecomputing.com; dkim=pass header.d=amperecomputing.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amperecomputing.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUBRjoq8E+JxW9UIlSOxnwuuspPyDHL1p44nebY0SSo=;
 b=g4SVW+JtSOhiYXpGSmf++xXaWSTnU1dD7VKcIN4lxCX8LyAA0ee+D809GQp0mLKhbLX8NE7yzv8KL+ah+60MdL7rWzQpKdCWSYQPJl22oY/nnE7qQND0dpOBhCSCpaNOTNlpoA4CIiUQ3eXk1nt2tdgDcG4fusC4Ma0igTuTfyVNvgd7eqMdKd4JYBhD7p0MBTJC9GXBPh0PAmKoKD6txj2jHov6bj0uVsgD5NFTGGz8WDQYUNgs+S13/HwAQPBEqhs/COXhVNTr76Y2i4OW845hHPwMvg2f7aElBT7ftRx4flKtZ1ZpQ3YTm2ep54Q5ZwFv8zH0GwEeUi2Sd9g8jw==
Received: from CH3PR01MB8629.prod.exchangelabs.com (2603:10b6:610:168::9) by
 DS4PR01MB994137.prod.exchangelabs.com (2603:10b6:8:32a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Fri, 4 Sep 2026 19:01:25 +0000
Received: from CH3PR01MB8629.prod.exchangelabs.com
 ([fe80::50a7:7140:6aaa:777c]) by CH3PR01MB8629.prod.exchangelabs.com
 ([fe80::50a7:7140:6aaa:777c%5]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 19:01:24 +0000
From: Lee Hamel <lhamel@amperecomputing.com>
To: "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Subject: documented cache properties
Thread-Topic: documented cache properties
Thread-Index: AQHdPJ+pxh8BIbcBXEqoWBwjpDaKEA==
Date: Fri, 4 Sep 2026 19:01:24 +0000
Message-ID:
 <CH3PR01MB86294B399E85439FACBC6F8ACAB52@CH3PR01MB8629.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_Enabled=True;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_SiteId=3bc2b170-fd94-476d-b0ce-4229bdc904a7;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_SetDate=2026-09-04T19:01:24.148Z;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_Name=Confidential;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_ContentBits=1;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR01MB8629:EE_|DS4PR01MB994137:EE_
x-ms-office365-filtering-correlation-id: 8219bb83-af4e-4456-7ce1-08df0ab6eaba
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|18002099003|55112099003|38070700021;
x-microsoft-antispam-message-info:
 3qA0JBU5IIOv8dHMxdszICVYU249qXApfWXTk3ScLlqfGimpLqmKcwrmVtZlv2JlZkOaY+cD5k1BPgdStdoGO2NvvCk5ckQ6ZOGaeOsnL29jf/8PdueiFQ8JjYdtjVkaWFjZUMl95gHGHtioNRoAqZpCox87TkkFE3af8EEVZC5FR9pLTsEgJBzMhCRoOwH9S+Pr6ih4XZUlFlZfBhWp/lv1/NHHQCw+roSWT58sLFLAMqr3r5iC79bldyeVz7xMzcfxd84T3ChYURYNfq1sVjCfNgsyMWQZgEX/Ub/oN/4L8J/EOnMZP7D8Gc9hTXS0VQhZt2vFHG6PYv911TuqNuaDN79L8IMm3kp2QJJyzUxyZ+E3uSOxuRFQimes7nt8FtnmIK+kalG8OGpAWUzCxipHit+0EamD+2b7qF64IycdaVLeXV1uao8GW5V/MXf+rEN+pCJkDOxC8m1uSIUq5EbdicrGrD4eRGIYVn0ngm5oQlsTY3PCN3LpfbF3nYqbUftXJUySONhFk7QtLxElHZZwgVbz1Uk2SX/zXkrQ9boXnb1W2rvop8lGrG9bo6aWFKtBPbCB70kAkRXTsv67zoR0lo1Q4I4RzUK7WwFI0fZdeNJYHAdCYpChNVVZMgdtYgRnISYYNSVlB8acGONWeEI+KMLHkMhrtKhJ4WNtfpI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR01MB8629.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(55112099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9AvHvM6t+nLeZish/kGDDraAJARangjCftBywnLWUZ3Og67z817bRjvZrV?=
 =?iso-8859-1?Q?ykTFjdMxI31W0tbKdmXAc/V9H6rOcPIWsXzeXB5qlGV71gJ7Nmz5GJ4YV4?=
 =?iso-8859-1?Q?2BVeaP0ZaZNaTulUCM88Dq1nQSYMMMY9jm7JsoyB1cHgsM+4l3izNcBev4?=
 =?iso-8859-1?Q?O2avBDq9N+aJAcKUJhWN4k1icXuw9BTrr9xaUjcquI/jjZRSF53wkVQTQq?=
 =?iso-8859-1?Q?0p/fwqCzWNDi+wBWIxLSo7Y5pr4bEX9VpG8SrS9TfY+thjsu6wpMHPxz1Y?=
 =?iso-8859-1?Q?vjTJ4NmHLhZSyBJ+ycK9C0O4hVNqfkcsgJNPpPCmo5gxh9fEnzQEq8BlS+?=
 =?iso-8859-1?Q?ANBWKn+VKqLVIr+0ubXApbPFBgR8BACH9I2GMVQW/Udb0Mr+KgddgIfMJh?=
 =?iso-8859-1?Q?YPQ1+V2NsX1S5vHMjIpga4tJyaS+6YxCycKe33/GMOPuEiOMTN9vAG+UHE?=
 =?iso-8859-1?Q?ZRPGBEb3xt6d2ye9YHdBEfd1d1nUk8rqBiSMwojGh6ZJiCOIBkjTudeu9I?=
 =?iso-8859-1?Q?xSWApvJVmDElfayGGuxkenPYYlJsJhQcWIGcbedyWTiQ/t9Y/4Q+4cWQ+k?=
 =?iso-8859-1?Q?aUiiQ/qqMDm0wJBrzyfkDEV7Zu95lcWrOp3o7kltVRWH9e2ZgvzbnNPvqZ?=
 =?iso-8859-1?Q?x4J0hOKzVfOXogN8zysOQrEscBiu5NQB1O1wbRuSYSBfHWdjkczN0PH4Zw?=
 =?iso-8859-1?Q?LY/g8fWw5uchFuH3O+gJnitazQ0cF+J4xHePmjixD/nePIN8TW0OZxWcCF?=
 =?iso-8859-1?Q?F/mHIjRJK0kZJSx4Bm0Mi8k6Yz4YOVkoUMF9jjRs0797JEjRmCT26iZDho?=
 =?iso-8859-1?Q?yyyYfdTxX16gF4TDZiMUdIGv4qkuE7VdiwmQM4wIkxCQzIq9ywap7AsBdj?=
 =?iso-8859-1?Q?resPtHSKoYJsAzcpxvYbyymvhxzDqi7hvecigwE8AHl0z9a/rtRwYXMzgs?=
 =?iso-8859-1?Q?b0+qHgGq1I1YEfxpUj112ij++oEY5SsRV6KBoDANJGXz+5+kuEQlYnKUjn?=
 =?iso-8859-1?Q?LSfbGuLTzYeJllzV8UMKeLHoKd9kcKPOFnwqhjT3jyEhIvpfijUI9jwfP6?=
 =?iso-8859-1?Q?sUUr7GY3aDr43oHQhM1oHNmk32WxSPXRfIMY9leAE7g2Z3bSnn6BzLHuWc?=
 =?iso-8859-1?Q?iQ8AglbGOWuILVrUQtHWEYRdDpRzpPYoHADOgOt94hu5t5xsWLghdLWYni?=
 =?iso-8859-1?Q?Fuji5f9KP1htIPz/JMWlnRoFEabpLRnQos02hRdUIzZZh2mHkAcAwmUQmF?=
 =?iso-8859-1?Q?Akd0qDFNHF8xwnK9X/bk8EOz9jKBQ8KawYsMBWPt/dFZo6zcv/xYOkiKlz?=
 =?iso-8859-1?Q?R/lQgiy5hawMDt+ZYujbljh0esg3C5JcwDOIqHHZfItkps3vAUGD5MxyLZ?=
 =?iso-8859-1?Q?mqgTVyodp/WEDhn5zOSc/gMRmdNZMPzbmIk5UPph66qCq1qP53BhEQNBU6?=
 =?iso-8859-1?Q?tUB/y8yTVIsIeA/0wTqg69tfuOZwBBJUYZKRTCLl4Tr/WRly2Nr4eYOssi?=
 =?iso-8859-1?Q?+1fxmf0a4VN+ceISN9Hh6sqRS41NYCH3yw6d42KvV91+sGDsmYRqihXguA?=
 =?iso-8859-1?Q?lLMvQk5Mc98h8iLJ0NVtT/Bg9RnHM8fJLXCy35Wb/D2DGOyvGXO6SsyVi7?=
 =?iso-8859-1?Q?NSCIq7BqjlC7Zocf8hoev+rqCyMbiTF9y86vkX7ll1/nQDcXt5/KhPeMjm?=
 =?iso-8859-1?Q?bSD/Nn3st3qDO0PfhS7H5O1pApQS0OXw2c0DLQ3zqKdtOzRiIW0t1l4FTb?=
 =?iso-8859-1?Q?IkjDxcjGDnoKmB5pQnRa3ZU1LNa08kdKZqc0FAHSnXSJk4xfjyep0kaLSR?=
 =?iso-8859-1?Q?ICfEvv0S7Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR01MB8629.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8219bb83-af4e-4456-7ce1-08df0ab6eaba
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 19:01:24.7983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wQSVUxgsZTY+Ka2lBujLyZFT2YlZcXgEgYzA1s+6mk2e0hJnd9czzWmISnLK+6+wGBLsju99Mwwg7eqj5KdgYHf85o9SFu8NlQ+bfhHtG+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR01MB994137

I work for Ampere and am implementing DT in our edk2 FW.  The DT spec has a=
 cache example for shared cache, but the properties used for cache aren't d=
efined in the spec.  FW and OS must follow the same spec so that code can b=
e developed and OS can parse what FW implemented.=0A=
=0A=
However I find this page https://devicetree-specification.readthedocs.io/en=
/latest/chapter3-devicenodes.html#internal-l1-cache-properties=0A=
that lists cache properties.  Can someone explain the source of truth for D=
T spec?=0A=
=0A=
Thanks,=0A=
Lee Hamel=
