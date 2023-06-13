From: Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Device tree usage in TF-A & OP-Tee consultation
Date: Tue, 13 Jun 2023 12:25:19 +0800
Message-ID: <CABOkjxJnzTm=jJUy4Zgi9kGxLTBHvmrkM80UhgSdzyYcL4xfzA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686630331; x=1689222331;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yxbt+08HnqV4SCZxNPTZqV3hyOikp4hQrvcpfNg8+i4=;
        b=e+xlV11hjColJ4zmtTe7JRNPnKPOdPLisJZkLvyG0DYNK8fzKNvJ/zRHiXnPS8aLVd
         br4t9C6fqS3KVOmT8W7lvDRQbsPCtTkT/v/cZhoWSk7YV4bAmi9cdJ5Rn6/bCA1XIJOG
         Gzap1mLDsWQzmS2efDBUpOiw/lQGl3Ej8eTbM=
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, jkardatzke-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, "yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, chenyian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org

Hi, Linux device tree maintainers,

I am writing to you today to request a review of some custom device
tree bindings that we have developed. These bindings are not used by
the Linux kernel, but they are used by OP-TEE[1], a secure execution
environment for embedded systems.

We have placed these bindings under the "chosen" node in the device
tree, as suggested by Jeffrey Kardatzke.[2]
The full bindings path would be "chosen/widevine/{tpm-auth-pk, huk,
widevine-dice, widevine-ta-key}".

We would like to have our bindings reviewed by a device tree
maintainer to ensure that they are correct. We would also like to get
your feedback on the best way to document these bindings.

Thank you for your time and consultation.

Sincerely,
Yi

[1]: https://github.com/OP-TEE/optee_os
[2]: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/20442
