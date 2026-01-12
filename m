Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296A42C0294
	for <devicetree-spec@vger.kernel.org>; Mon, 12 Jan 2026 14:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229408; cv=none; b=kmz+HTuSXGCSQhtJKVwEJbkhqQie/9St+Ap6H6RPmUtaVNA7p2zGSkTGm5bMuUOrGr+D1SLbO3ocHqwPE5UCqtoc+zZ9WQ1t7L6p5ARfaXI7H2UFXO3ygvv2k4LrCDFw/Veqet7XvkMRZpaOJrxD5g+me1jwWppiLiDOi+egi1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229408; c=relaxed/simple;
	bh=uISQheE0pdNi8PMGZkGjpJYf2bS5dOA2vOuLAhqXWnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkedukGUS7WN2UiRxpDriJyiBBjVzDhfx/R7EIMiMaCw0zvwPeINFBiK2y7Co6T/3QSwHQMgk5r6Os1VkJ5TcQ/2lDkDJrqW/RXLX7RtSRGyTlWMaTOpO5F28pikCRIl2yRWq3silfdCGN51PTThhsSAaaQbK4OQgunLu6lIpBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=pOjSkoNB; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="pOjSkoNB"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81e93c5961cso2152673b3a.0
        for <devicetree-spec@vger.kernel.org>; Mon, 12 Jan 2026 06:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1768229405; x=1768834205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TrdNmceHvILHOLnUZ2MtDNO2Dyo6n2swJrWONR1zlek=;
        b=pOjSkoNBpTxuSZd3s+33Fy39szF8uVet5ug17IB0KKR4eidPeypk/HyIJMgtTymqBq
         RehNC15ev+OohweZ1xLf1duDUxXGLOb3n9RNcgIshzG44PzTHNJHOjE1l21Grb0pQTlQ
         uv5cJcRu1kVH5JUOeVbhWaiFI1zF/19L/1rSjcGNJ8faSHac49JYO0twyu39z9vQss8d
         MmdyR/7oITPIn58Kw6dcOFxgp5BIdkW32Z6Cv3i7xHam5qB0aQSN4zMzs3LbegO1QDBH
         nVFp5vYJg3+kkOFgy4EaU7/TSdX8c2w2irpLQPqtfqaBN6XVx1FPD2P+qUlbv7/IyO7u
         8XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229405; x=1768834205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrdNmceHvILHOLnUZ2MtDNO2Dyo6n2swJrWONR1zlek=;
        b=SYt7u3Iw0yQc5G92lsk+1jps/7XA1q6qIPKD3lN9Sh+lh1A6lmne/5cWEflcxT+Fd4
         Dw6UVvl8zO69be/JERNenrWqGXbOmpVBRH36PGVamMT/qS82xWyS5V0RQJjebiJVlZGA
         iSO6dLsEx09KYOxkIJGYbb+bOxRRwO3Hjz/lzeQYDvwlFbSBRb0uBEbKNB3uCiO/oU7t
         eK2HZbfUQz+qzdkeCKmAYdEsefi3h+DIIVnnahousFXBpWcA83FkMm9wpHkbMXl3NU7c
         hAFl3kim/SJg+YloA4cRao/Xq4MhvsiIiaP+e2fSVW2B5GsOPSGpD5vLLC2jp/L52zR1
         y9nw==
X-Forwarded-Encrypted: i=1; AJvYcCVX3MqZ+BIpIXtv4xj6si6OdoTSoCQyk8C6CO+EtpYKPhwLyeTBQn6ip0Rlh8lTUCYid4cl2o8/mr3/W4i4szc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeYYg6faD1MpYo6bsthCFt7Amy1Blxw/sSGWQ88M5HLZQs1S42
	oI2og0q5q+d4kpNm1jwaa7v1WMhbuieUbnwy6iJdV29NrSat464iphB5Y0WgSlrilg==
X-Gm-Gg: AY/fxX6ZPTXHG5HKuQJe8tw1E+qGi3XlwmBhMGuxBsIDqTZeE3ODP3HDffbQTywB41e
	8qCqVKK9x9fLs027YydBnTRl3ceVyOlBUoHySZXcmApXMnoRBf+goFMuWmRHthOesd9iJ004mOC
	oGSOecFtXam/9OjycN1Wsfh7JMwcg0I6IBjsaKou1xlHM4kRdl/WqK7L/QJKP4wmQ/JntVn7a0m
	rjDQ9OpjH9zsK6vIA7YtLhgInXcXmO4q2vdLtY+tpuAH6Xj63Up/0ntjEWxOWJU4X1cshuXbxGb
	/WFgR646LHf28tCnNl7K5VjZhyNoYMRWf8AaVQc8lhAPkMQzs24EZbDazPHlE/uvsW3WmktrRgy
	+EmnTLT7zSCUzMe+c8QouHAC8xl/ilQ2wQj8BMEEZcK3ot8mSp/vVAkRIi3TTMAZmzlix3bGXWy
	YY1qaW9L+7igYR+bs2FWP8ju+B8BgP1hpwAqK0jVKaCaF0keA5AwYs7/5rU+BN2A==
X-Google-Smtp-Source: AGHT+IEEV+bBFxaL+HmGXBYLPXT8QOI/i365W+3G3efvHjjGOVeF8J2mcr/VroAfeB15j4B99ujTew==
X-Received: by 2002:a05:6a21:9984:b0:35d:6bbc:e9ce with SMTP id adf61e73a8af0-3898f8d5d20mr15229340637.16.1768229405359;
        Mon, 12 Jan 2026 06:50:05 -0800 (PST)
Received: from ?IPV6:2401:4900:1f3f:e311:7179:901d:930c:942? ([2401:4900:1f3f:e311:7179:901d:930c:942])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b1d81sm17890973a91.1.2026.01.12.06.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 06:50:04 -0800 (PST)
Message-ID: <de02ed8c-0176-4996-ad7a-680a2e115161@beagleboard.org>
Date: Mon, 12 Jan 2026 20:19:59 +0530
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/77] Add support for dtb metadata and addon
 device-trees
To: Herve Codina <herve.codina@bootlin.com>,
 David Gibson <david@gibson.dropbear.id.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
 Hui Pu <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20260112142009.1006236-1-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/12/26 7:48 PM, Herve Codina wrote:

> This big picture series adds support for dtb metadata and addon
> device-trees.
>
> Before giving details about the series content, let me give a little bit
> of context.
>
> The use-case is to support additional boards that can be hot-plugged to
> a connector available in a base board. This connector is standardized in
> terms of resources available on each pin. Any additional boards
> compatible with the connector should be able to be connected to base
> board and all base boards where this connector is implemented should
> support any additional boards.
>
> TLDR: The last patch, patch 77, gives an example of dts and dtsa (new
>        addon device-tree) handling this use-case. It provides an example
>        of a realistic base board description (dts) and an realistic
>        additional board description (dtsa).
>
> Each base board is described by its own device-tree and the real
> resource connected to the connector depends on each board. For instance
> an i2c bus on the connector can come from the i2c1 controller from base
> board A and i2c5 controller from base board B. This is obviously the
> case for all resources wired to the connector.
>
> On the other hand, the device-tree describing the additional board has
> no reason to be changed based on the base board the additional board is
> going to be connected. Indeed this device-tree describes the additional
> board hardware and this hardware doesn't change if the additional board
> is connected to the base board A or the base board B.
>
> In order to extend a device-tree at runtime, a device-tree overlay can
> be used. The drawback of current overlay implementation is that an
> overlay is tightly coupled with the base device-tree it is applied to.
>
> If a symbol of the base device-tree has to be used by the overlay, all
> symbols available in the base device-tree need to be visible by the
> overlay and the overlay can use only those symbol without any kind of
> name translation.
>
> With current overlay implementation, a overlay depends on the base
> board. Indeed, if an overlay wants to add an I2C device on the I2C bus
> available on the base board A connector, it needs to reference the i2c1
> bus whereas it needs to reference the i2c5 bus if it used with the base
> board B.
>
> In order to fix the issue, the 'export symbol' concept has been
> proposed. This concept allows some specific node to 'export' symbols in
> order to be seen by an overlay applied to this node.
>
> The use-case and the export symbol proposal have been detailed during
> a talk at ELCE 2025. Have a look at the slides [1] and/or the video [2]
> to have a clear view of the topic
>
> [1] https://bootlin.com/pub/conferences/2025/elce/ceresoli-hotplug-status.pdf
> [2] https://www.youtube.com/watch?v=C8dEQ4OzMnc
>
> The export symbol proposal based on an export-symbol node in the
> device-tree have been rejected by device-tree and dtc maintainers.
>
> A discussion about the topic has been started on the mailing-list [3].
> This discussions led to:
>
> - The addition of meta-data in dtb instead of having __fixup__, __local__fixup__,
>    an similar nodes in the device-tree used by overlays
>
> - A new kind of device-tree, an addon device-tree, in order to replace the
>    usage of the overlay device-tree in this 'hot-plugging additional board'
>    use-case.
>
> [3] https://lore.kernel.org/all/20250902105710.00512c6d@booty/
>
> This current RFC is the implementation of features discussed on the
> mailing-list. A lot of things are new in dtb format (new tags) and dts
> format (new keyword, new kind of references) and not yet mentioned in
> the standard.
>
> The purpose of this big picture RFC is to move forward on this topic
> based on code and some concrete dts / dtb example. Indeed, this RFC also
> adds tests for each feature introduced. Those tests are performed using
> dts files and the content of those dts files can also help in the
> discussion.
>
> The first patch is just a simple fix and can probably be merged out of this
> meta-data and addon discussion.
>
>    - Patches 2..12: Introduce new meta-data dtb tags based on markers
>
>      Those new tags are FDT_REF_LOCAL and FDT_REF_PHANDLE.
>
>      FDT_REF_LOCAL (details in patch 6) is used to tag property using a
>      phandle and this phandle points to a local node (i.e. a node
>      existing in the dtb).
>
>      FDT_REF_PHANDLE (details in patch 11) is used to tag a property
>      using a phandle but this phandle points to a non local node (i.e.
>      the node doesn't exist in the dtb). The reference to the node is
>      present with the tag and the phandle value has to be fixed when the
>      dtb is applied. This tag can only be present in plugins (overlays)
>      and addons dtb.
>
>    - Patches 13..17: Introduce addons device-tree
>
>      This part introduce the new /addon/ dts keyword
>
>    - Patches 18..30: Introduce /export/ keyword and related dtb tags
>
>      This part introduces the new /export/ dts keyword (details in patch
>      20) and the related FDT_EXPORT_SYM and FDT_EXPORT_SYM_REF dtb tags.
>
>      FDT_EXPORT_SYM (details in patch 25) is used when the exported
>      symbol involved is a local node and FDT_EXPORT_SYM_REF (details in
>      patch 29) is used when the node involved is a non local node.
>
>    - Patches 31..38: Introduce /import/ keyword and related dtb tags
>
>      This part introduces the new /import/ dts keyword (details in patch
>      33) and the related FDT_IMPORT_SYM dtb tag (details in patch 35).
>
>    - Patches 39..63: Introduce orphan nodes
>
>      Even if the orphan nodes concept was already present in overlays,
>      the final encoding of those nodes in addon dtbs is different
>      compared to overlays dtbs.
>
>      In overlays, orphan nodes are transformed to a /fragment@n/__overlay__
>      node. This is not the way used in addons.
>
>      Indeed, in addons, orphan nodes are not transformed to fit in
>      something like /fragment@n/__overlay__. They are encoded in the dtb
>      using a specific tag.
>
>      This part, after some preparation, introduces orphan nodes (details
>      in patch 48) and the related FDT_BEGIN_NODE_REF_SYM dtb tag (details
>      in patch 56).
>
>      It also adds support for addons dts/dtb without a 'root' (details in
>      patch 58).
>
>      This part ended with the support for merging orphan node described
>      in dts when relevant (details patch 60).
>
>    - Patches 64..65: Reference orphan nodes and its sub-nodes by path
>
>      A new syntax is needed to be able to reference a an orphan node and
>      its sub-nodes by path.
>
>      This new syntax is '${$<orphan_name>/<path>}' (details in patch #60)
>
>    - Patches 66..67: Namespace labels references
>
>      Add Namespace labels references with the new syntax '&foo.bar.baz'.
>
>      This new syntax, only allowed in addons, allows to 'jump' from node
>      to node based on exported symbols defined at each node (details in
>      patch 66).
>
>    - Patches 68..71: Support for applying an addon
>
>      First, add fdt_addon_apply() in libfdt (details in patch 70) and
>      then the fdtaddon command line tool (details in patch 71).
>
>    - Patches 72..76: fdtaddon test
>
>      Several tests related to addon application
>
>    - Patch 77: A more Realistic test
>
>      A last test based on use-case we want to handle.
>
>      This last patch (and its dts and dtsa files) shows the kind of usage
>      is expected for addons.
>
>      Also it proves that metadata and addons features handles our
>      use-case.
>
> I know this series is a huge series but I would like to give the big
> picture in this RFC (I hope this was a good idea). Of course, this
> series can be split for the upstreaming step and handled by parts by
> parts. Let me know.
>
> Tests are provided for each feature. In addition to be used for testing,
> tests input source files and expected output files can be used to see
> the expected behavior related to each feature.
>
> I hope also that this first RFC will help in moving forward regarding
> this 'handling an additional board described by a device-tree' topic.
>
> Best regards,
> Hervé

Hello Herve,


I was just in the process of typing out a reply in the old thread for 
the topic regarding restarting discussion and how we should move towards 
extending DT. So imagine my surprise when this lands in my mailbox. 
Thanks for all this work.

I will go through this series and check things in reference with my 
connector + addon baord setups.


Best Regards,

Ayush Singh

