Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64E32054EE
	for <devicetree-spec@vger.kernel.org>; Tue,  4 Feb 2025 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700681; cv=none; b=EV7MYLg9lQF9P7RnVkVNv6TuX9AR9GMz79QRSG5QDRnA+kMUq1fMWMhQwcYJqR682joiOsc5Yr/Vmbv6kkmq+AW49kWZmF/q8/0y/qY/XRxUw//G5HzK17v5ySqdi86IBt+4vuSJzbu7V+CnwnkyQyk+F8balOw3cGh/Pxg1zPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700681; c=relaxed/simple;
	bh=bDzUs+1/lwmMWKV5flkno8qW/61mogVqqVqm8yxXKQM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eRMgPBWhZRodSZ7TatwFOjaFicP1BbRh/hQO50esnLbaeOQN7rOCNUb9XWH1E8ycmz0FY9QqvCj7mP4w9au6tDswhBFy0qBoojoKH1Lt1AWdWCpES6Knn80MuePXPNjKm+xL2Ae6wgS7rifVLsRY3vuG92o8gun0RfuEzwi7Bdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=HKa2sYZh; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="HKa2sYZh"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so7930374a91.3
        for <devicetree-spec@vger.kernel.org>; Tue, 04 Feb 2025 12:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1738700679; x=1739305479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bOsjYVLWB/PinTGYzqPuk8F+iPxyNTxHwnESNtGEX24=;
        b=HKa2sYZh+SP2R96wUavZfeV3LSNbxeAXvPHmrPGTpFyBhkPND+rFy10r+YN9v2u4bP
         Q0HajmS52SQ9w8cAPsIHpjJDVg2yaRRyWUTlWc2EyKHAsR2M+onLfrqAFc+zyz7Gdj1N
         lFO5bB5jLCxMEZEmafiZQj2xXYjbh0MzJPDuUwHyV2y70xPy09PADLgOgfQibJ3gho4K
         dXCdHHO+L3nR9aFdWJXI07NMXAniXRUk5XWMw1inssMOu0JAdBLp8t6kWEdgUQqq4dJj
         s+vO3ipURPxQ/SIMZMAEg6nONWP8cTQRurYyjEUdvwAoL7GqbeKUpTbW8yV7hfIfsXji
         duNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738700679; x=1739305479;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bOsjYVLWB/PinTGYzqPuk8F+iPxyNTxHwnESNtGEX24=;
        b=nvfw+1Br4boudJXETcCRBKFRN/zK/oTOneXrhL6PZlSV1EB3hT637Kl5MYU0KKv4J5
         P9gEYYS6aKS97RxeutD1mbT4F5ctTCTrnvCT+jeliHS6JBQDZuJAfGWJBDv3HKMb6Cp/
         CZNKcV5v4doMoJq4CtQdijWJp5MIFBHJQ0uYHbcDW24MChVIoWXlj32nYBClQCkS5sCI
         eM1QmccBZgIFhj9nr3HkbhLfH5ytwEG9kblA82fwUklYNc0VvqjiZyPOKPQmPu9Qh0nR
         Yx3TGoERRE04Kp6zcU5WmqOopTjPkynbYYDXoRGPmyNb8/WvZLS25MKnUPkzdhGI+0vq
         73Bw==
X-Forwarded-Encrypted: i=1; AJvYcCV6I7Z+tpTkgmMkmwe+nyJa8DJb5HuSHocO/6x384G6kA9OVcOpxOGSAWuE6R/ekBEc+u8Cb/0UAQ4d7kcXEaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmF/YA8kcfvCBk4gvFE6QaKpewMvew7U3/WUynsn6w0hRj4yUq
	4Pr9PprRr968RiEcSKSAxr+oFPJjnIT8ViAJqA7Izq2m1l1diC4cahSPwdT0Bg==
X-Gm-Gg: ASbGncstpKszWB92wwJbzwdTotxekUMqMbEovesrt4XwBUeytz9bsTPTM8Tk+oZcbSU
	q1tyenb7aKCoOISSe6HEIiKWzzpJMBsh7fagyBv1VzpZ2VqW5xduwqL8jjglf5/qARnsZcCR4kN
	JLbvpUdGE6D/DuCkvYtCKrWAV505ZwiT4rcqe/I/VTHP4jo0UvJRKFOQTSKDP8JgRXoKlkplJ/S
	XZ/E/A8sa2kts+4tRxvUcCUAxinRgfHPogKT9V4I0KFwVHVyhbr0AsZXV+W3Jmz5m6f8tcFjEwt
	GyTVb1gHf73ODQq39mUk9gk=
X-Google-Smtp-Source: AGHT+IHvSMkv4dlZv9kxeR7vQQ8tzZI/hvJdtexkOt7XOY8OV7evtZe2sMZPUQDtAfgqIRh1V1zk7Q==
X-Received: by 2002:a17:90b:3e8e:b0:2ee:e317:69ab with SMTP id 98e67ed59e1d1-2f9e069e353mr301117a91.0.1738700678779;
        Tue, 04 Feb 2025 12:24:38 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf95b44sm14111246a91.37.2025.02.04.12.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 12:24:38 -0800 (PST)
Message-ID: <e178299f-3dbd-4a33-bde8-08f28af353df@beagleboard.org>
Date: Wed, 5 Feb 2025 01:53:54 +0530
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ayush Singh <ayush@beagleboard.org>
Subject: Re: [RFC] Adding export-symbols to specification
To: Herve Codina <herve.codina@bootlin.com>
Cc: Jason Kridner <jkridner@beagleboard.org>, d-gole@ti.com,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com,
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Robert Nelson <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree-spec@vger.kernel.org
References: <024685af-4694-4c22-bf83-a04dde6e32bd@beagleboard.org>
 <20250127162043.48552da0@bootlin.com>
 <d5f629f5-68d0-4c41-be62-1f1acee3db64@beagleboard.org>
 <20250204202157.202230fe@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250204202157.202230fe@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/5/25 00:51, Herve Codina wrote:

> On Tue, 4 Feb 2025 22:54:52 +0530
> Ayush Singh <ayush@beagleboard.org> wrote:
>
>>> You have perfectly summarized the export-symbols goal and the benefit of
>>> this new feature.
>>>
>>> I am waiting for feedback from other people. I hope we will move forward
>>> on this topic and unblock several users (me included) stuck on this real
>>> issue.
>>>
>>> Thanks a lot!
>>>
>>> Best regards,
>>> Hervé
>> While working on a Patch series to the specification itself, I realized
>> that I was missing some edge cases, so wanted to discuss those:
>>
>> # Scope
>>
>> Should export-symbols only be used to resolve the properties in parent,
>> or should all other children (and their decedents) use the
>> `export-symbols` for resolving phandles and path references?
>>
>> For example, should the following work:
>>
>>
>> parent {
>>
>>     sibling {
>>
>>         led = <&gpio 0 GPIO_ACTIVE_HIGH>
>>
>>     };
>>
>>
>>     export-symbols {
>>
>>         gpio = <&my_gpio1>;
>>
>>     };
>>
>> };
>>
>>
>> This would also mean that bottoms up lookup needs to take place for all
>> `export-symbols` that might be present in path to root, before using top
>> level `__symbols__` or `/aliases`.
> I restricted the use of export-symbols node when an overlay is applied 
> at a node
> which contains an export-symbols sub-node.
>
> In your example, If you apply an overlay at parent node, your 
> export-symbols
> is used but if you apply an overlay at sibling node, your 
> export-symbols is
> not used.
>
> Of course if your overlay applied at parent node looks like the following:
>
> __overlay__ {
> sibling {
> prop = <&gpio>;
> };
> };
>
> &gpio will be resolved using your export-symbols. __overlay__ is applied
> at parent -> visible in the overlay.
>
> If the base device-tree looks like this:
> parent {
> sibling {
> export-symbols {
> gpio = <&my_gpio1>;
> };
> };
> };
>
> The same overlay applied at parent will failed.
> Indeed, no export-symbols is available at parent node and so the
> gpio symbols used by the overlay will not be resolved even
> if an export-symbols exists in the sibling node.
> To see this export-symbols from the overlay, the overlay has to be applied
> at sibling node and not parent node.

Yes, but adding export-symbols to specification would mean defining the 
behavior in base devicetree as well.


```

\ {

     parent {

         export-symbols {

             gpio = <&main_gpio0>;

         };

     };

};


&parent {

     led = <&gpio 0 GPIO_ACTIVE_HIGH>

};

```


It might not make sense to add it to devicetree specification if the 
node does not function in normal devicetree context.

>>
>> # Export symbols phandles
>>
>> Can export symbols reference each other? For example is the following 
>> valid:
>>
>>
>> parent {
>>
>>     export-symbols {
>>
>>         shadow_gpio = <&my_gpio1>;
>>
>>         gpio = <&shadow_gpio>;
>>
>>     };
>>
>> };
> For sure, not planned.
>
> Also, maybe I missed something but I am not sure you can have a
> phandle referencing a property.
>
> In your example, shadow_gpio is a property, even if we add a label
> to this property i.e.
> label_shadow_gpio: shadow_gpio = <&my_gpio1>;
>
> How can we set:
> gpio = <&label_shadow_gpio>;

Well, technically, all phandles actually just reference a property since 
they are resolved using the properties defined in `__symbols__` node or 
`/aliases`. So it is pretty simple to add the functionality described above.

> Best regards,
> Hervé
>


I have been thinking about some alternative approaches as well, and 
something that sounds nice is `/ephimeral-symbols`. Let me explain what 
I mean:

`/ephemeral-symbols` can be a global node whose properties have a single 
phandle as value. For example:


/ {
     ephemeral-symbols {
       connector1 = <&connector1>;
       gpio = <&my_gpio1>;
     };
};


This node will take precedence over `__symbols__` and will be used for 
symbol resolution. However, it will never be present in the compiled 
devicetree blob.

In case of base devicetree, it can be used to generate symbols for 
specific nodes:


/ {
     connector1 {
         prop = "1";
     };

     ephemeral-symbols {
         connector1 = <&connector1>;
     };
};


Will compile to:


/ {

     connector1 {
         prop = "1";
     };

     __symbols__ {
         connector1 = "/connector1";
     };

};


In case of addon board overlay setup, it can be used in a similar way to 
the __symbols__ proposal by Andrew [0].


So you have the base devicetree:


/ {

     connector1 {
     };

     connector2 {
     };

     ephemeral-symbols {
         connector1 = <&connector1>;
     };
};


adapter overlay:


/dts-v1/;
/plugin/;

&{/} {
     ephemeral-symbols {
         ABC_CONNECTOR = <&connector1>;
     };
};


addon board overlay:


/dts-v1/;
/plugin/;


&ABC_CONNECTOR {

     prop = "val";

};


Which will end up resolving to:


/ {

     connector1 {
         prop = "val";
     };

     connector2 {
     };

     __symbols__ {
         connector1 = "/connector1";
         connector2 = "/connector2";
     };

};


It does seem like it avoids the pitfalls of [0] (no global __symbols__ 
polluting and chaining is fine since we do not need to resize devicetree 
to resolve path references). But it might have some other flaws I am 
missing right now.



[0]: https://lore.kernel.org/lkml/20240702164403.29067-1-afd@ti.com/

Best Regards,

Ayush Singh

