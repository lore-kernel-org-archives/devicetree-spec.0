Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA99130E41
	for <devicetree-spec@vger.kernel.org>; Wed,  6 Mar 2024 13:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709730685; cv=none; b=T8RjwDxCFPFvLcZecNlMFJ/GLOS2K1cmSX99/mrpV647VYYMdSNKOyuRd4txiVUB9Nr33VQ+cFM+zlfXxbV3ctB7o2zrvPtIsRuspHEiGOm27XqvJM6Pv30R6NF7vHR4Gt5rM3la85glcJc/n+ppOC+BOJHNx4skbmZVWiX8iGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709730685; c=relaxed/simple;
	bh=WdgBQ3KHNgRkRkPmZyyflLNDrDm/SKLXcCTpROsV7BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTXcVNeAyTljIAeA7qzX7LFdm9PSngkND6XplnukhuJjQhS1dsqoPBlA8zGDLC3BcxvpVpKKgYNSGQGWdtgFV2DD1qCdgtLE0lmoP7c33s/5Uc2JWEZRm65OYJGbeBLyl1xycQlvxdJPRvoMofwJ411AFZQYhtlOWPWCRiQMpIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOgzI3PG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOgzI3PG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A47C43390
	for <devicetree-spec@vger.kernel.org>; Wed,  6 Mar 2024 13:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709730685;
	bh=WdgBQ3KHNgRkRkPmZyyflLNDrDm/SKLXcCTpROsV7BA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EOgzI3PG3tUzI3MprFZQjFm2CWxQrPjWWmpjQ9mX9jAp82xBIxmFfTk9nU69O4CCH
	 ldDMtbKfYHm5GkSSyBiFnCcC4SffBr4YFOl+2Lx8sFw7lt66fBXKumIkhtHvbSDCPO
	 dQcIu6KcJ4U33IMHR4fEvqmKdqg0pO2tK8NeOVdeIpbDLJrNYIaMO/uANW5E5Nkadf
	 vDFy7oe+ZKEP3rinGYIvkcym2qDStnqoZ4zz5FAa2+68niVD84tOozKwAOrMtFvi7a
	 0EAdfTh/tTeFn/VEOzQyrS+iYvPqJWYUZTeECMlVnfX6VhvBb1IAcixcCmlkylGnZd
	 2ninF/g7fxp5Q==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d27184197cso95122911fa.1
        for <devicetree-spec@vger.kernel.org>; Wed, 06 Mar 2024 05:11:25 -0800 (PST)
X-Gm-Message-State: AOJu0YzAA3KPbvfYAXlrICGK3MHb7GgseDP5PRqaZlmcYvLydzztJoRO
	flW3IQ07oDfHUJWElH6vbLEAn+UedmU8OnlPPFiIxOAmqYkFJGbg7vCsg8N7pewr/07nxn6H8Wp
	Z6/cfFcUoF1cdEzhlt8SoUKjTzA==
X-Google-Smtp-Source: AGHT+IGWXI2cQbueqtAgv0u3QAD5GgXEE9IPa5CtQKply1offd7ivNbjq7Ol6QQAeqY9jQBAaw9MW8O8sa3eRDdjYME=
X-Received: by 2002:a2e:9f14:0:b0:2d2:1a1f:ad77 with SMTP id
 u20-20020a2e9f14000000b002d21a1fad77mr3167919ljk.13.1709730683268; Wed, 06
 Mar 2024 05:11:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306002951.1601630-1-saravanak@google.com>
In-Reply-To: <20240306002951.1601630-1-saravanak@google.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Mar 2024 07:11:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKGpbwYU2qQDgDQzWm++aDieCLEWaREW1aiDHM9uzM6Ew@mail.gmail.com>
Message-ID: <CAL_JsqKGpbwYU2qQDgDQzWm++aDieCLEWaREW1aiDHM9uzM6Ew@mail.gmail.com>
Subject: Re: [PATCH v1] schemas: Add schema for post-init-providers
To: Saravana Kannan <saravanak@google.com>
Cc: devicetree-spec@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 6:30=E2=80=AFPM Saravana Kannan <saravanak@google.co=
m> wrote:
>
> The post-init-providers property can be used to break a dependency cycle =
by
> marking some provider(s) as a post device initialization provider(s). Thi=
s
> allows an OS to do a better job at ordering initialization and
> suspend/resume of the devices in a dependency cycle.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  dtschema/schemas/post-init-providers.yaml | 105 ++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 dtschema/schemas/post-init-providers.yaml
>
> diff --git a/dtschema/schemas/post-init-providers.yaml b/dtschema/schemas=
/post-init-providers.yaml
> new file mode 100644
> index 0000000..92eb9a0
> --- /dev/null
> +++ b/dtschema/schemas/post-init-providers.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020, Google LLC. All rights reserved.

2020? I can fix it up.

Rob
