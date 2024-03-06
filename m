Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021B263A1
	for <devicetree-spec@vger.kernel.org>; Wed,  6 Mar 2024 20:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709758383; cv=none; b=MmwRAQ5GYsh0oWLU8WQBoHy2sijafag7a0lYpi0LXylADlRBtcFt2HPRV9gZSM8Gfb3iU3brtKDSAcNL/b8jFHW4VgepRSS2BivQJVx03v27TCI5gH2d0ghJfSdbZ/10azZ8Fc1r9+zJ2cGjYlpa6JT8d6XF2dhhgpxBgS1+oJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709758383; c=relaxed/simple;
	bh=tm9nHBRi96WZ3pJQ7hz980TL1Dy6QNux26XMUaZnrIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EudwU/M90V4ofGCBuovgQU+c1NDnlgB/BmbW8Ltwyx85acNDjOI3cVP0RXg6q1xvil+GomFlFDA0nsA7vHW3FI8JTaJtENlCbXct8t2xJNPS21jBKL9C9DYJHeLadMKXXfPAI8WRi6ZbH2sI0Aq7udpPc0NQ6E/iMBhTkPD9kt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MJUWHKOI; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MJUWHKOI"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-428405a0205so2161cf.1
        for <devicetree-spec@vger.kernel.org>; Wed, 06 Mar 2024 12:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709758381; x=1710363181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qLee0h9yNQtdWE2XtneFT/2ie2StJeqS0qK5VgDYWg=;
        b=MJUWHKOIMPmpKyQKVtTQGNDtbJH5yjJi03uD1zQeNhJSyfSNoRKts1oK3ZuuL/8PTe
         bovrlq3S6heeUdqtggfDUsvc4htuA9lBIHRLCakup05EIL08eMbf5OBB+VkrqN9mFky5
         eAga7KZn5WMSwcRkdr6QUmBhCZqvaIGf0jfJ55D21BcwzJtLvsmsDdeJkwPepHlEx5ox
         AFFao9OsHWGfCsNIJlrwfiXdAbyKeyAHL//M6NtB5kzCob/hFsoeZDAB+3o3MEZlSWOr
         65gi2/G1vw2cRVbZkpzdw+tYAuPxlOwDIEcoD2PEybt90Sd5PdeDd02HaydOkH7AttNj
         zWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709758381; x=1710363181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qLee0h9yNQtdWE2XtneFT/2ie2StJeqS0qK5VgDYWg=;
        b=sDWil8TW/Ro04RBEu8z05oAvsXg7X9t1mSRv2IybDPHMhN/MOaTiyhsvha8td/Y3MX
         lhnkasKnDhxzEx3otelQK9IeEMlYcKrjwA6gv7UQltKJz25dJUhOIkSjTqJy2vz8mI2X
         S6zZ3YDAT32Q4ETPL3cBPT5D+H9trOd9qUtC5M2mUmtREIcSh7DwbZbAGV0V/CIeR4nS
         iuuY73CSbFAuioPcl/3+9UtydOtQq7LI2sOAlvguI2zD8QOminw1py+KCR+PoRbfYky0
         yOIApa4BoYPv2OOyLMqryeUfpu2OdOyyGmRsbXm4oeHU7nX5IEi9YYCU8wNi7NTQ31iq
         xY7A==
X-Gm-Message-State: AOJu0YzVTM8BYVPuqxzifZhHXwGfg3gbqzfuc40klMceqrnSP+wNJiys
	PegnseU98tYezLPLPQEtKLa6SIWjgSToiGD/gqwHjbwUPDZb5AFE4Rrz47dYD3xe9Cee+iI+SQT
	9IJX7iXuIT5AEcoA0PzNVOyp1/fjnefUl13SyIlBfilPnfMkl4g==
X-Google-Smtp-Source: AGHT+IHWJu3zfH6rO+P4gmS3KT5L88aollbvRO+KbMt+f/65W3XzB4Jfe0ykiqeXkJGMV6ssynQgnwuqur2rSDcow5g=
X-Received: by 2002:a05:622a:1a0e:b0:42f:a3c:2d46 with SMTP id
 f14-20020a05622a1a0e00b0042f0a3c2d46mr38107qtb.7.1709758380654; Wed, 06 Mar
 2024 12:53:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306002951.1601630-1-saravanak@google.com> <CAL_JsqKGpbwYU2qQDgDQzWm++aDieCLEWaREW1aiDHM9uzM6Ew@mail.gmail.com>
In-Reply-To: <CAL_JsqKGpbwYU2qQDgDQzWm++aDieCLEWaREW1aiDHM9uzM6Ew@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 6 Mar 2024 12:52:21 -0800
Message-ID: <CAGETcx83jn-4uhjZ31Y_TUw5kGGS7WahuWPxLCMP=ck8EmNxSQ@mail.gmail.com>
Subject: Re: [PATCH v1] schemas: Add schema for post-init-providers
To: Rob Herring <robh@kernel.org>
Cc: devicetree-spec@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 5:11=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Mar 5, 2024 at 6:30=E2=80=AFPM Saravana Kannan <saravanak@google.=
com> wrote:
> >
> > The post-init-providers property can be used to break a dependency cycl=
e by
> > marking some provider(s) as a post device initialization provider(s). T=
his
> > allows an OS to do a better job at ordering initialization and
> > suspend/resume of the devices in a dependency cycle.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  dtschema/schemas/post-init-providers.yaml | 105 ++++++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644 dtschema/schemas/post-init-providers.yaml
> >
> > diff --git a/dtschema/schemas/post-init-providers.yaml b/dtschema/schem=
as/post-init-providers.yaml
> > new file mode 100644
> > index 0000000..92eb9a0
> > --- /dev/null
> > +++ b/dtschema/schemas/post-init-providers.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2020, Google LLC. All rights reserved.
>
> 2020? I can fix it up.

Yes, please. Make it 2024.

-Saravana
