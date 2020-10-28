From: Bill Mills <bill.mills-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: DTE Call: DTB ABI vs OS loader
Date: Wed, 28 Oct 2020 08:21:45 -0400
Message-ID: <06a3720a-46ac-7fd3-9ed2-97727d1d5c0a@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=vcB4RtshSU4zCL+BZha3q6ejCTNgn0OfknfJeVQi8CE=;
        b=RnSwdC0NFrWx/hwUpo0ThkkibS000+Rs/i1pl6txC2teBSPKvXz9NB6360n6bGFT4/
         G8WtdHXwT5alkbDhhT8BGxu85MsUZSHn6Q1rK/PgpF84qeq5zfvTUoASwfemMQ9U4F9m
         nSiTc5hyGEUT1i4B7Km5vgSwPpIuYbK6ryXEjJ36qvdnuhL5gDOdy77igMMfezfFBZyi
         U/llTbmbhImcvfPVttEXpoVV6w+278/PXOeBkj2sZ9FiewV7i6oupS4n9rpnqQ3SeLjn
         EeUa0f1/4g4Xe8ybxeoiS24Wl90seL8LYxT1eUIFiwneX6CVDTjt6Myd4NIVHbMYFS+C
         9OIA==
Content-Language: en-US
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello,

The DT Evolution call will be in ~1.5 hours.
Assuming we have quorum*, I would like to discuss the issues with DTB 
ABI (current lack there of) when we have an OS loader in the path (like 
GRUB).

I made these slides to frame the conversation:
https://docs.google.com/presentation/d/1Hq7-42EfM4xC_1N1HMO20vXVKSpkA_S-LosSYp4l9Ik/edit?usp=sharing

* I know ELC is going on also.  Lets see how we do.

Thanks,
Bill

-- 
Bill Mills
Principal Technical Consultant, Linaro
+1-240-643-0836
TZ: US Eastern
Work Schedule:  Tues/Wed/Thur
