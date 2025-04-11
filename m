Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1231326F450
	for <devicetree-spec@vger.kernel.org>; Fri, 11 Apr 2025 18:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744397369; cv=none; b=KO1jfkWTld4n6HFKFj3+4iwov6xfmS+zhjTU/Enyy6gl3Pr6NU/DcYYiWhH1+SRlzBS9kz/37ujpt2m3lmB5LqToUXYW0lZhy7f5NKU7G8XUuvSswsYIIcBh+pe2h44xp/nlwzhFtZ4LYkrlQTBmdcmllqd+7JjX4t2+pyoap9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744397369; c=relaxed/simple;
	bh=Hl26pqtFHZFSG+1hpOMXgwzxe8ApHPTC5HGMlZ94Xz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZxiAgLtOiYGvYp0gcfFrTAnsRerpD6+/beh3xsDFWnXJmLCILVJmsDcsacVtkFaASociW6840gaTsTUEacsxK3YH7gIPA9sCQrdr4CkwG3lOV449coTqDmsNK25IgO0i8FdFfFzKKQfx1Lh/ItCJ3uNS6ll0+zsYfphj4x+ids=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=JmD3z4VB; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="JmD3z4VB"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af9a7717163so2638126a12.2
        for <devicetree-spec@vger.kernel.org>; Fri, 11 Apr 2025 11:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1744397367; x=1745002167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2d/tTun9JFnIkfP1YqxhBUY8akZ/H8pYOxt1P4JGzvQ=;
        b=JmD3z4VBxTU6eDPDWvY/0Zxmqk/hb8oCMYf8nE9Soa4Vlvz+MRS+Z9JsLk50IBWGfb
         4C3qjXCFgSAJAFreMdgd4x63Ypp+bh44B4vnNf03FXXijTxIHVE8O08cnqxK8dUI8ybs
         hTscUVoK6rV4kn72Tb7TFcfLi4ClDU1/xFToJIejo5OvFPsQNRFfWA7qlPdGCL4KXIBZ
         ErBA37+3FtyXsE09Lk1IkzJreTEZXUVp1Iz+q1uDojDP7Mjpl1AdWIzSldE9P4pityNb
         91AGl6iAOEFndRQFydhpSaOxW3nEft/VJN9DjMbF/umuQUvdQj7xoh04e2KAH/hgX2IB
         U21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744397367; x=1745002167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2d/tTun9JFnIkfP1YqxhBUY8akZ/H8pYOxt1P4JGzvQ=;
        b=bJslMrmTYTA8ja3zyZ7CjscbHohgYGnhM6nqsO47djGAI1r1xWgZOLt2TsqeJxpU+n
         +qudVeAg5IwTgsN5zVryidk5mf5axtWyESzI3cDKRmPBfGX9djFk8OqFOmUMY7Xrluuh
         aJmZEU+P3fU3zxM9qM3NxQLGgrpOJlloLz3WdlvrgtChAGNcMabjeh/khhckDP33zhlm
         pc4WQO3urATT12jwyWUI7ETBDm/pwXjJWMT4AduufQA0r3k0GRKz/q3O2QuDZejXQX4h
         xfEPjz7UC7k2u0jHhlJWYBR46nEnmwVDFffJFPRiuzenHCu31sM9eUi8rgXpkONu4U2R
         IFnw==
X-Gm-Message-State: AOJu0Yyxllt0W/e050aKSDB2Mx4meVPcQ+SjlH81W6ycNfrQLGW1eAYH
	oqq9zoK70uCL6ynQW0h5giM3yDDRL0qp2+zXLGy54Q2Ppqj1C7HG0g89oZljQA==
X-Gm-Gg: ASbGncu5MABRGnhoihelgBtcyGQ3wfA8dSoArUn+5dbLu9GB/zcKRsnUT786mQU6XnO
	ZAWC/dflpU2iEv4WVUv7ZDA06DKTz/iin1AzQ6gvSpI3dX9fiorTTQUm/PKfvMOd8FXCEKi9IVx
	DZW+kra92Oo9/U27l4EaFYv24d1HIpIw50/2dXugxswMrHgXdztxuVxqshZcHd+jSaIvyDCEiCp
	xeILOFbiy9dps1od1mMLYcmQolB5b5ZYWhN+JMEzpf31LOnggyIVDyg1e86q/bZ8Uh2Wd31i8FI
	IQPNA085oFN2JdmGokjw2EzQZzgOHYuuSlzEG7ijCEctIss=
X-Google-Smtp-Source: AGHT+IEhPndhi3CdSc7UE8aGaWa69pXyv+/ous+jXD14lRn9STbgK4FviyVEW9pBkxb0zitBaRkPDA==
X-Received: by 2002:a17:90b:2d87:b0:2fe:b8b9:5aa6 with SMTP id 98e67ed59e1d1-3082367ef21mr5601706a91.31.1744397367168;
        Fri, 11 Apr 2025 11:49:27 -0700 (PDT)
Received: from [172.16.118.31] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df2fae34sm6047853a91.39.2025.04.11.11.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 11:49:26 -0700 (PDT)
Message-ID: <d78e60f2-e2e5-4e6a-9724-68cc0481fd77@beagleboard.org>
Date: Sat, 12 Apr 2025 00:19:16 +0530
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Add new `export-symbols` node
To: Andrew Davis <afd@ti.com>, Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Grant Likely <grant.likely@secretlab.ca>, Dhruva Gole <d-gole@ti.com>
Cc: devicetree-spec@vger.kernel.org, devicetree@vger.kernel.org
References: <20250411-export-symbols-v3-1-f59368d97063@beagleboard.org>
 <0d25b3d4-7735-4e35-8553-d6e64b8ad8f7@ti.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <0d25b3d4-7735-4e35-8553-d6e64b8ad8f7@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/25 23:09, Andrew Davis wrote:

> On 4/11/25 3:00 AM, Ayush Singh wrote:
>> `export-symbols` is designed to be a local replacement of global
>> `__symbols__` allowing nodes to define aliases to nodes in a tree, which
>> will take precedence over the aliases defined in the global 
>> `__symbols__`.
>>
>> Having a way to allow node local aliases helps in usecases such as
>> connectors and addon-boards, by allowing decoupling of
>> overlays/devicetree nodes of addon-board from the base connector.
>>
>> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>> This patch series follows the initial RFC [9] sent a few weeks ago. I
>> will be reiterating the RFC here for anyone who might be seeing this the
>> first time, since there was not much feedback in that thread.
>>
>
> I think this is a useful tool in the effort to build a complete 
> addon-board
> solution. But I'm still missing how it all fits together, do you have 
> a real
> working overlay making use of this somewhere I could take a look at? 
> Maybe
> an overlay for one of the addon-boards you list below (one of the 
> BeagleCapes
> for instance).
>
> Andrew


Well, I do not have a completely working for MikroBUS right now, but I 
think Herve Codina and Luca Ceresolli should have some working overlays 
for their addon-board setups, so maybe they can link those here. I have 
mostly been working on devicetree side of things to make it more general 
devicetree thing rather just a Linux thing (Zephyr also needs MikroBUS 
support). Additionally, I have been trying to get the support in base 
fdtoverlay, so that static use-cases are also covered.

I will try posting a MikroBUS patch based on the kernel export-symbols 
support patches [0] soon to maybe provide a better picture regarding how 
all the pieces fit together. The spec patch series was supposed to be 
for getting initial feedback regarding this particular direction, but I 
guess to get real feedback, I need some more concrete prototypes.


Best Regards,

Ayush Singh


[0]: 
https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/

