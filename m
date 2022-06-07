From: <Eugen.Hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [dtschema PATCH] schemas: i2c: Add missing properties and
 descriptions
Date: Tue, 7 Jun 2022 06:43:14 +0000
Message-ID: <cc597d64-a7a9-0078-2d41-754a8d82af8a@microchip.com>
References: <20220427175956.362987-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654584211; x=1686120211;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NYG0AfiiV843sgxS3eJRbYj9C1YGXSWL/CZQXcA4yKo=;
  b=iRmoLLED0uA00l3BygawaIwipbT7S/Fa4naBUYd7q0Flng6KA+MC3Y/r
   B4GQkQlq2uLXM1O7h3xdiR19PMNhurGGEmc3Q25HvxUQ24AhuQkaOhnAt
   ysR4tZGjqlLfQ8oyV3E9GBRaNKXM8VvVKbMgk0bzCcfFUvSGHxJ2PRsCg
   N6LfCBl7UgX0ZV0tsBNkmW7qAaMjwu59Ec+JmH1MVyj2eo/owa0E3xhvC
   VFR0Q98Oy04UK2F8QSKxx0DVxAv96fkWVu7JJ2FYX7vsk5qa4k/VrGHnM
   VzZa8PvPVgO7m6I1fEUso54SCCCKO7kA2ZbcqNOrX3qldvx+LWriP51AB
   Q==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYG0AfiiV843sgxS3eJRbYj9C1YGXSWL/CZQXcA4yKo=;
 b=XceN0bnr+4dfk3G9RAakmg7IFkWU3bim2a5WQN0sTG+X4BMpyC32h8+BISePVe01T8jmODB66miHxW1amX/quqwn7LmVvZewtd7+oXAHnTzo95iq2el7mHBARkd19QRQKEO6E3gJc3+gzan53jFol35jk5GbwnMqiNhmoABdKTE=
In-Reply-To: <20220427175956.362987-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Content-ID: <C56EE26C1198664D907041DB46D2C5E5-Hry67jCOGbCcE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Codrin.Ciubotariu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alain.volmat-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org, matt-KrQt6mEI6EMUxA4j4dw1vfQIK84fMopw@public.gmane.org

T24gNC8yNy8yMiA4OjU5IFBNLCBSb2IgSGVycmluZyB3cm90ZToNCj4gQWRkIHJlbWFpbmluZyBw
cm9wZXJ0aWVzIGFuZCBkZXNjcmlwdGlvbnMgZnJvbSBpMmMudHh0IGJpbmRpbmcgaW4gTGludXgN
Cj4ga2VybmVsIHRyZWUuIFRoZSBDYyBsaXN0IGFyZSB0aGUgYXV0aG9ycyBvZiBpMmMudHh0Lg0K
PiANCj4gQ2M6IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+
DQo+IENjOiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+IENj
OiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+DQo+IENjOiBDb2Ry
aW4gQ2l1Ym90YXJpdSA8Y29kcmluLmNpdWJvdGFyaXVAbWljcm9jaGlwLmNvbT4NCj4gQ2M6IEpv
biBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPg0KPiBDYzogQWxhaW4gVm9sbWF0IDxhbGFp
bi52b2xtYXRAZm9zcy5zdC5jb20+DQo+IENjOiBNYXR0IEpvaG5zdG9uIDxtYXR0QGNvZGVjb25z
dHJ1Y3QuY29tLmF1Pg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPg0KPiAtLS0NCj4gQ2MgbGlzdCwNCj4gDQo+IEkgbmVlZCB5b3VyIG9yIHlvdXIgY29tcGFu
eSdzIHBlcm1pc3Npb24gdG8gcmVsaWNlbnNlIGkyYy50eHQgY29udGVudHMNCj4gKHVzZWQgaW4g
J2Rlc2NyaXB0aW9uJykgdG8gQlNELTItQ2xhdXNlLiBQbGVhc2UgYWNrIGFuZCBwcm92aWRlIGEN
Cj4gY29weXJpZ2h0IGlmIGRlc2lyZWQuDQo+IA0KDQpBY2tlZC1ieTogRXVnZW4gSHJpc3RldiA8
ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0K
