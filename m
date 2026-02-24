Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020095.outbound.protection.outlook.com [52.101.69.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C44F11CBA
	for <devicetree-spec@vger.kernel.org>; Tue, 24 Feb 2026 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771943083; cv=fail; b=faRQ3dxCN3FSfZ1WVA9Y6pO3Hv/ImS6gxHaSuhEhqymJPB+XBIJolqOYK4pCu7+M+AXzBi+M2sTvbWMSS5z1kRAhPd5A/HVIMCJzW7lCDCCbbWH3DBtSzaRMwIH0pNUk79KXVC8rBxTuv3NRMdtydBhf47/Lj2PpSiQluYxI6x4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771943083; c=relaxed/simple;
	bh=MP+Dif69mtXfhwq+2TsxqfmCdYxQbRim8GDk0vndHR0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=c5BvL6fehuA0MNaQn38DusmrfSYt+VNMqr8/U8/xYOLTAbZi4bm0Q954M6NIrlzRHF2MgsDDpsHM5XqgOmv0M1SgJBHVsnlzQP5f9tALL0WXqPhihhAHSgrtxAQD0irGO4i/BLU6Q+k1rQV/zE3uWzhr+kd+7RvTQZaTOoeX5U4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nordicsemi.no; spf=pass smtp.mailfrom=nordicsemi.no; dkim=pass (2048-bit key) header.d=nordicsemi.no header.i=@nordicsemi.no header.b=usfdzI17; arc=fail smtp.client-ip=52.101.69.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nordicsemi.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nordicsemi.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nordicsemi.no header.i=@nordicsemi.no header.b="usfdzI17"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wjri3y5wX3S5AxZ70qmO67lNKVQxQ5mS5hVzSEzHMqWYrLx+6PF2BMeFHkd7NpLGo6tva3Er9lR9h5InfNxpfY2T92Yx7tGah3G7z9LZ57IAd2ZpiB0kbHvHk0AoOBwI4bKuPkqmgNTJruMYDidXHpOxuhSmRWjEe/xptC45n14Rdl7oAsmLCnSPx+xjlp/SfOvQ0xAo7JUEKxKBwTqFlpNiBvi/ufirujvRcooP57VmZkjgzE705tc3L68DeTYKyafS0rFqlHhKHhAxas7gLOMd8me8CczU/1XfDztrZrmgnfpVRgfvT+kNVKSHgjYAwoO8hKksynye07RpwNWcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MP+Dif69mtXfhwq+2TsxqfmCdYxQbRim8GDk0vndHR0=;
 b=c0PQO+UoHyGzR6rSb7MpupX6MQqnE5jSO9NEeDqOg3HcWo19qC0Ty49p0lyXo0jU+NZ9dixxCPe0lUt620jb1Tf5X/Vw0qoYnikL0OGRaIFB9cFsLg2nCK5iE/YvAS2G5PROcwS5EvzPaVuF/MSPHujBH3htkzT62yvphXk0Xcui1cyuMIwiO/3nck92wJSSaiLtdaK1L9OoavgtgKjTiA/z60zTrlqa3qLwegHcxgWVG7XQLO+f2sRyjZ9MO7WVZ4liD9loZc6dLXY+iV4SD/BUM4dZqmzTva6M1/PJ1YhwDDdPebhWYelB0Eft3/fDqzWyc0VFHt2M+OWPKO2aow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nordicsemi.no; dmarc=pass action=none
 header.from=nordicsemi.no; dkim=pass header.d=nordicsemi.no; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nordicsemi.no;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MP+Dif69mtXfhwq+2TsxqfmCdYxQbRim8GDk0vndHR0=;
 b=usfdzI171GpX74k/AVjfVz8zsoW7vhY0qYbaSC27h3t8ckElUbEJkemPxAjWbRlyKnhnw8T8Q5QuPyLos0hErhUGEuC9uQPG0HqOEaBYY/exl4XVGEjIzjpYkKn4Lzx7ltUXV+o0BYtAxFQFG0UGQDADftiTxKIXIXrdBPbPbdnvADfuVUHx3hEvA9MDsx6E1w1vNi/GbQL0b9mtTNmJCaw49xCXKJeI+d++7I69gu8UsDUIWi2LcHUJceMb0FWlt9lOrJkb+oH59wmdiBgpW5V5uh2RZ+dna9zQifAQK8H5TlOVQCzdcCPEEB4zOoX0AY7EMoHJz2TBsHH8AfAXDA==
Received: from DB8PR05MB6826.eurprd05.prod.outlook.com (2603:10a6:10:132::15)
 by DB9PR05MB10199.eurprd05.prod.outlook.com (2603:10a6:10:455::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Tue, 24 Feb
 2026 14:24:36 +0000
Received: from DB8PR05MB6826.eurprd05.prod.outlook.com
 ([fe80::d72a:bcc8:1160:b8db]) by DB8PR05MB6826.eurprd05.prod.outlook.com
 ([fe80::d72a:bcc8:1160:b8db%3]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:24:36 +0000
From: "Andreasen, Bjarki" <bjarki.andreasen@nordicsemi.no>
To: "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
Subject: Question regarding non-volatile memory mapped memory in embedded
 systems
Thread-Topic: Question regarding non-volatile memory mapped memory in embedded
 systems
Thread-Index: AQHcpZklK1L9fq9NyUi4ZW1pOjwGmA==
Date: Tue, 24 Feb 2026 14:24:36 +0000
Message-ID:
 <DB8PR05MB6826E032A341ED146299DBC18874A@DB8PR05MB6826.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nordicsemi.no;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR05MB6826:EE_|DB9PR05MB10199:EE_
x-ms-office365-filtering-correlation-id: 23df1a6a-f8bb-4e88-6022-08de73b07004
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lJ+lPRERp2M5jiR4u0AQenrsu1jc+ozxdScjus8aPZEKI2W1qziZpb+H6m?=
 =?iso-8859-1?Q?+EAFMgmzgdIZkwh5xWH0maH8pO5LMcUUa5cjGeTZpF/yvUksIWdIMDsrO1?=
 =?iso-8859-1?Q?78WOeSDtDAU6RBi9vKUfW4GtjlAaqJEoPAnyJsZZYXu5VQ6LuXnJ5L6W+Y?=
 =?iso-8859-1?Q?k5RTqqgTb0mdZmPEfolplK9OwLqD06LajAT93a6HWOWyj2gGrfcl7fgt4o?=
 =?iso-8859-1?Q?lx22HQAnvzRMwL9roM9Q8PGOPD4dtHxV1C7c8dFsdpItd1ZCtkv3o1U2p2?=
 =?iso-8859-1?Q?IQHyZ8EIbiCM57MlX3ch5iZO6CtT5at4gSVHHUYnVEqu00/JXblwR88CjZ?=
 =?iso-8859-1?Q?CQB8ohPVQkoub+q6Xdd8gmkVUnheTTlDq7OeiroHntd49rHSEM08x7Y71E?=
 =?iso-8859-1?Q?/SZmMasVs9OTIsav6QQTXshbYopiNmI0nE2RVS3yuAriGmLQ1kYKWm2E/j?=
 =?iso-8859-1?Q?nY6rfBdvM6Q5VfYsbL5D7Rj8rCWO6qAvZN/H3u0V+CFJJFey0kd/ZzKQpK?=
 =?iso-8859-1?Q?NeHVBwtKlSJLArYZ/6ptOinF66KqQL/UfxYr4d78pifQ58Z5hWIF9BP5eM?=
 =?iso-8859-1?Q?cAGaAlmHmUJ5HZh0N7jTbrRPHGwPADhsLdKZWjI2kCjygc6647rmeKwOIA?=
 =?iso-8859-1?Q?4ejUPHCPGvLSCXsRVfApSSgBAtfs3SobWKIOTOPp7QdSCNAz5TGoiFIqlX?=
 =?iso-8859-1?Q?B8Brz+xzZJR0vpZasGTO/1ZSHW8JJBlhZUjEH/iwvpZaZoUyfOOyuONOKH?=
 =?iso-8859-1?Q?p3VAnlX0Z0pLOoAQjIyUVpFfdWyeqkXsIScoHktSf2lSdwnw1G93kbGfxQ?=
 =?iso-8859-1?Q?iZGO+6QobWBRR3SkBk3YJRd/gT2gixbS5FJ8oMuFgapnjWt30OT/9wKmD4?=
 =?iso-8859-1?Q?OMju8yjLd3EWoHXKx7sTaN3AxgvGQDlEsQiO6Ht7Wqxo6H8iDrZ42xE+sG?=
 =?iso-8859-1?Q?spA2+VeQ/KMuyzQnsOvz7s9s1Fja2a+M1UxbPA/+wOHzfM8U4NIegsq5+n?=
 =?iso-8859-1?Q?VmMR5wEh+IYQjphIw8hbLeo2g0pQAB9IIi/tzRaZETXKdLsLJSe9nLeNFi?=
 =?iso-8859-1?Q?KEd+uG5TWGJENcUzG+bWtWDnFi2Kk8TIrT3FmJz9j1GCENWcB5wp8LGTQJ?=
 =?iso-8859-1?Q?9tqHIiloYOMEYaTamfgj0hl9RhJYb8xB1ZogJTthCLRG4wRTvvEXEmIfn5?=
 =?iso-8859-1?Q?i884NbnehlhydGy5H9JyWYnF+Jibt91Oey81ubBeOnYBfDHEFx9zeXKquD?=
 =?iso-8859-1?Q?iHPDHdELvmRahTAo1o55qdsdEF3do8pF0cHYoD4M7YDL97nUgxikl7MtlM?=
 =?iso-8859-1?Q?HPd2/wIB+XAmRJ/om7lOujfwROxTy2KypG4FkdygGV+A4v3Uu3/51N3UEs?=
 =?iso-8859-1?Q?W4hMaBnv/5p0b2vFEzwGuQu2djl74UL4MEAqatFJJbRcrRuUONCYUy1Cem?=
 =?iso-8859-1?Q?WKN1Y/zHHaG/I3N879YjypQkAMOuQLk8xRlHjrj/h5iP2ovpbk8CjSPPne?=
 =?iso-8859-1?Q?eBN3j/jl6kVH4tzGk0a+0HLJStT/19Bxbsv+bEq+kU2T0NxHcsWT3VQt2g?=
 =?iso-8859-1?Q?cesEUHMugehAa1RNXRCwrMhSneVhfPRZvj4pY/eprlwdTXeqUHG2fUcx7w?=
 =?iso-8859-1?Q?10JhkL7UPk13ESrLs+RU2etRauqC1nNuuvBWfKIph1Sx8xhgYociTRO3vg?=
 =?iso-8859-1?Q?Yk9tahlYZp3stybnPhI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR05MB6826.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AJMIoLKqjHY2eXG1muYxhmeIfp/raw4uO3sAtqzz9iqtfNM5jFrt39OCwu?=
 =?iso-8859-1?Q?H95SCoqJbrnJlqLwYttWe6JZh1yMVmftMXpyV/q5ROG9ba99lFR/wdtKxU?=
 =?iso-8859-1?Q?Y8ND9CPDLZFJVoDSw2x7kNqbUA5cAdQpeZqwo0vXAN+O+HzdL+grciNvqg?=
 =?iso-8859-1?Q?3BlWMTR6SigTX7trvIUhdJZjKL5opX9c3uHP1N3Cn84/TWM0VEv5j6AWd0?=
 =?iso-8859-1?Q?bqIFvz+Rh4UYfwrsYm0x4s8RtFy8plVLwv6HYDykPOJDx4njK49RGhUuIA?=
 =?iso-8859-1?Q?Ww/EeFF6TQqxphv/dtza3h0NjEenaTBFCuoo+jl26hlW4WUFXD0XWz70i3?=
 =?iso-8859-1?Q?oB1He+ngbX5KwU5xYwXDLMY2rJOw49JPKz/oehiVoznOYq+OgP5VL+9x3+?=
 =?iso-8859-1?Q?QRuRgKXMug+MmCqBjO+pxA7Bk43OlTolAVPaHL1kHgesnh1U1K45emM3Iv?=
 =?iso-8859-1?Q?q74ai0KpaYrH7Bc/1UzV6GbTjyKQ9FWEgWEEdFYbZmTX6BEtFbfDtQDMTW?=
 =?iso-8859-1?Q?E3+78yJ/FhedPG/9tuwF8FttgiT2ZULCJ2rMtCvGO1/oh+2ETwkfjLC6aN?=
 =?iso-8859-1?Q?+saPciHIkI7hVEGD41EtZCaJqw4fQ+Ovd7KY5Jcwa2qMxTw0poEouYpu/8?=
 =?iso-8859-1?Q?Rf5Sf2vvwkFNyM6hOkEokTvvSlbO0KkAn+PZBNW969jxXjzVskHMc6wTEc?=
 =?iso-8859-1?Q?K8RnEm2GAednsOO6iEjF8w1eLIqEmcK/wRv/c1B2doESnwg13uk/0myPaW?=
 =?iso-8859-1?Q?EERgxO0MSWwXccMTGieGCU2Lk3O1WBKm3hOLS+0U4fLcx6X/gqlUbPLNjg?=
 =?iso-8859-1?Q?/oHXy46XIDN2iPEEgNdT5ZlFJRsRK+K+rHkmAKDvkNd84dSDE86mmXP6Xc?=
 =?iso-8859-1?Q?mrv+4gmjZlMrxY71xHTWh/GlFPMtXrh1ZuJnpGavr67g1iLmKZ1H7Nh0/9?=
 =?iso-8859-1?Q?ehVCmjJQzGsIiO7yNwLepKqgTHIg/7yVKxK57ZLJ2zuwuZe4Q3EmJ2yZr5?=
 =?iso-8859-1?Q?Z9/xCP5CYxedvvmXdqX0Nz1p6TfVrNLJW9kSXDK/Vu4CyF2igzWw2epTcv?=
 =?iso-8859-1?Q?HtBMvHjGDiInl1/5LguIujGTdfxcbBmRgLRsh4JyKwHj/crQGHwsa2iQnZ?=
 =?iso-8859-1?Q?o7GfGXkjuziH5/31uKICbJgIb860bLNV+H0Dw+FoMOoefOpCQDSa4Lnpar?=
 =?iso-8859-1?Q?yN8rNlhHD2Xg5KMJAD3dRTQBl/gjfcL48XQ3QD7Nc3y/hAUzE87ylGVI3o?=
 =?iso-8859-1?Q?fswpuzagc1olhOBLBWmd3ufvBTNJilH9uWkafRjUnhkD/E7Pb0u1VsPBHa?=
 =?iso-8859-1?Q?/qyDQaTfujDLnCavgPmh4jxvrbuEI0a4CeZUgtNfa1V17hCROk5XTERa1M?=
 =?iso-8859-1?Q?Zo3UyH6x6IF+Y/QVGr6yYEa9EQsPlgD2xY/iZolFD3+6VDbfvOLiolE5CX?=
 =?iso-8859-1?Q?EXmdv7uW/OIkc8U/Y/JV4iUE9DHH6cm6S4eKDr7vsuIJdSxu383Lkl10wf?=
 =?iso-8859-1?Q?4hFPnXFC6CsZJcokiF20+9uLpCQcQxPsWeX6i3bso1ghuSuVRqOwymqbX2?=
 =?iso-8859-1?Q?BPbcrbPImuiLXv6GrsZ7ZoPVqZqI1zkDCoiCA8F9JpyVyWCjBREvGnGKH9?=
 =?iso-8859-1?Q?dCO/Xxamn/OLSvWaeh303nU3RPNesA+NhtDPZTehgkd3zCvbgLVbuzPSpp?=
 =?iso-8859-1?Q?+/n9UA0In50spSJ8fAVemOA5rIn1xyiOKEBQH8iPqiouZhnmVG0yZZ3JGS?=
 =?iso-8859-1?Q?LkdyVBvpBpQfnU/OPx2T5sdrwjlQMetxbnjEbcw/iv4oi6kIZ1SySZcv4C?=
 =?iso-8859-1?Q?+9e8Pjqjbfv9RaQSZQ+oztzVWAnEjZ+6HMNBiurooGiewoRb6g5msk1WbX?=
 =?iso-8859-1?Q?xg?=
x-ms-exchange-antispam-messagedata-1: 3qAB5t6ONQ32wm2gnPQaPocTTblqULRFj0w=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nordicsemi.no
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR05MB6826.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23df1a6a-f8bb-4e88-6022-08de73b07004
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 14:24:36.3805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 28e5afa2-bf6f-419a-8cf6-b31c6e9e5e8d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ut0fsfmwb1VCEO8yKcrEYQJWY1G71DtCYUe0stlyBV6HBhysbdQ3eWVQPqzq9pnqN2iWBSD1p0ueS42M9RfmuFiqdLqO/7QsWV+A1mNgNhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR05MB10199

Hello from a zephyr-rtos dev,=0A=
=0A=
In embedded systems, it is typical to execute directly from non volatile me=
mory mapped storage.=0A=
Looking through the devicetree spec, there is a node for defining memory ma=
pped system memory, and reserved memory, the /memory and /reserved-memory n=
odes.=0A=
=0A=
Are the /memory and /reserved-memory nodes intended to be used with volatil=
e memory mapped storage in embedded systems?=0A=
=0A=
A client program (which in an embedded system may be the entire program boo=
ted by the soc itself) is to a large extent agnostic to the exact type of m=
emory its executing from since the memory is memory mapped.=0A=
As long as the program was compiled with the appropriate memory access perm=
issions, non volatile memory like flash being read/execute only, RAM being =
read/write/execute of course.=0A=
=0A=
As an example where the client program is compiled to be placed at a fixed =
address in non-volatile memory mapped flash:=0A=
=0A=
/ {=0A=
=A0 =A0 =A0 =A0 /* Non volatile memory mapped flash, programmed by external=
 tool */=0A=
=A0 =A0 =A0 =A0 memory@0 {=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "memory";=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x0 0x8000>;=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x0 0x8000>;=0A=
=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 program_region: memory@0 {=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x0 0x8000>;=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };=0A=
=A0 =A0 =A0 =A0 };=0A=
=0A=
=A0 =A0 =A0 =A0 /* RAM */=0A=
=A0 =A0 =A0 =A0 memory@20000000 {=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "memory";=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x20000000 0x4000>;=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x20000000 0x4000>;=0A=
=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ram_region: memory@0 {=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x0 0x4000>;=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };=0A=
=A0 =A0 =A0 =A0 };=0A=
};=0A=
=0A=
I believe memory mapped memory is "just memory", it is from the perspective=
 of the program/CPU at least.=0A=
Has this been considered before? Is it already an expected usecase?=0A=
=0A=
Sincerely Bjarki Arge Andreasen=
