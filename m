Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0C656B67
	for <devicetree-spec@vger.kernel.org>; Thu, 11 Jan 2024 20:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAnK5+Yv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797E9C433C7
	for <devicetree-spec@vger.kernel.org>; Thu, 11 Jan 2024 20:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705004232;
	bh=f/nlMBl25QnT6KpgczxPSwGc4DuiaMAggQTXywTVPuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qAnK5+Yv4AwL9sSBeWxFMXrks9MBUgtOMQ3fYk2tMUsRU4RgajPjp0YaUvyasM8+2
	 FCtqLYK4TN/To4dIxTF2mUeVqY877OfiiDNoRue3ULk5dzNG3BFwLRiRfY0Ndm+XYK
	 4l6JPTvltNV5iydLXrtVQPJSZoRbmcWZ/shMD1EOn2CPlgAPTxuSGfmOLZxqCoVSHN
	 NYNzFiq8+fQlZ7Az/wAFl8jjEFYLMATFSPhSDBpaZQAsWy9EwpN41zyZ0sCEYmlTbj
	 h471/EE4cTYazs/DN80Q16rkxdU6HWBlgsBCpruwgDvuEHJU1mupFWjJEIuIt97B7N
	 xdDMSbZOjyYcg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cd5b467209so51488161fa.3
        for <devicetree-spec@vger.kernel.org>; Thu, 11 Jan 2024 12:17:12 -0800 (PST)
X-Gm-Message-State: AOJu0YwogOxRhaJBHQsyUNqoSbGRJBcsRCEuClkLqW5ik0BjtxmL38Tc
	11j1YSgFICDJZe30swTJ37bi4FFQWQJubaG6tQ==
X-Google-Smtp-Source: AGHT+IEMfsmtdJT3anXxszFkE95AcZTnwON+SqbH4mYeX3I5nF6zXyNv+j1kdBdLE/afMwtiqYJXstSYTe8o9bWMgYE=
X-Received: by 2002:a2e:9e49:0:b0:2cc:df75:79b3 with SMTP id
 g9-20020a2e9e49000000b002ccdf7579b3mr142973ljk.12.1705004230751; Thu, 11 Jan
 2024 12:17:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABOkjxLPvtknz4XxfjCdnjvLCpbz5OF1U+x8AgoU7RnRe95TVA@mail.gmail.com>
 <CA+ddPcN-p=cCQUcDRt-33s0=EhZkBMPRFOqULbZS3YMfeP9=Fw@mail.gmail.com>
In-Reply-To: <CA+ddPcN-p=cCQUcDRt-33s0=EhZkBMPRFOqULbZS3YMfeP9=Fw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 11 Jan 2024 14:16:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK2WHTGAUseTtOZKCCTT7Bz+tS1w1LGPRjpF_yh_shHuA@mail.gmail.com>
Message-ID: <CAL_JsqK2WHTGAUseTtOZKCCTT7Bz+tS1w1LGPRjpF_yh_shHuA@mail.gmail.com>
Subject: Re: [PATCH v2] schemas: Add Google Widevine initialization parameters
To: Jeffrey Kardatzke <jkardatzke@google.com>
Cc: Yi Chou <yich@chromium.org>, devicetree-spec@vger.kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, Yi Chou <yich@google.com>, 
	Yi-An Chen <chenyian@google.com>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Simon Glass <sjg@chromium.org>, etienne.carriere@linaro.org, 
	Julius Werner <jwerner@chromium.org>, joakim.bech@linaro.org, etienne.carriere@foss.st.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 12:31=E2=80=AFPM Jeffrey Kardatzke
<jkardatzke@google.com> wrote:
>
> Can we get a review from maintainers now that we've posted this again?

To repeat what I asked for on v1, I'd like to see some acks from Optee
maintainers on this.

Instead I just got pointed to a GH discussion which AFAICT isn't
resolved. Specifically, Joakim raised the same point there as I did.

Rob
