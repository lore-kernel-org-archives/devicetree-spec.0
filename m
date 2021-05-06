From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [ANNOUNCE] dtschema 2021.5 release
Date: Thu, 6 May 2021 13:52:25 -0500
Message-ID: <CAL_JsqJ3tThskW5birkReLo10K7+YrkBr0BAwOTx+GrnrW3QTA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620327158;
        bh=yiVGmX4sP7Bfubik8i5v4TvkRUWih83CNcAAuSpmeIY=;
        h=From:Date:Subject:To:From;
        b=Ft5bDWsX+Wicvrl3xl0mczEhOkGBWDZeJkrmGCZnFcSK2T25FX41/J6VKTvtNFi7j
         jg3TOcF/jwNOS98NPNwXk6sf3wAz1+ifcgzysKkWue0G/IiPtG3qAiB+uHdOdiTgsy
         g2CrRg5jpmrMCAOCA9cAXkfsUkmRo0IAiG1NoTn4FhFOxg/vZosDBb+vyd0njBXdA9
         A/FOgj0niAnNkUSYmG6DfRHXSVV1/H4V0CabZB/StZPODyk0ndlnalvJvu1b6oGG82
         BDoDCNlqg2OXQ+s/NGScJCXC9vwHhRt7dhnJA5KIQPm6wGibNutC+tvOg2rAQeIHqZ
         son6OwT0BtThg==
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

I don't normally announce releases, but I've tagged a new dtschema
release. There's exactly one new feature in this release: improved
warning messages for binding schema warnings.

The default error messages come from the jsonschema module. For
anything beyond simple errors, figuring out where in the meta-schemas
the error came from and how the schema needs to be changed are not
obvious. This should now be much better as the nearest 'description'
in the meta-schema and the '$id' of the failing meta-schema will be
printed. I've added some descriptions which cover the most common
cases. I'm sure there's still more descriptions to add, so let me know
or send me patches.

The release is available on PyPI: https://pypi.org/project/dtschema/

Rob
