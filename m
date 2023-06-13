From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Device tree usage in TF-A & OP-Tee consultation
Date: Tue, 13 Jun 2023 15:58:17 +0100
Message-ID: <CAPnjgZ1inUgJ94kugnGSDbQ0dhfxouObyr=VjdUYG81+bv5DjQ@mail.gmail.com>
References: <CABOkjxJnzTm=jJUy4Zgi9kGxLTBHvmrkM80UhgSdzyYcL4xfzA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686668310; x=1689260310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=40zRvtABa8tD9Gd9FX8th2J0HTnjHzICYxxg6ytywa0=;
        b=OA1Zo1IyFaexH+/D0csePKqpu16rRZ0m0chOm+apbdd3sIr7VO2uKeCgGA8lQGpIPs
         BnNeHLrz6G8SeZcrHiPONs9YhWlo5XZTLU4fHhS7VuRQfCh8h7PsKJYZ7UF8yWScgKzP
         FapVeTmZk4Dl/tKEWGMcCZlttTJq9zJtEDbXU=
In-Reply-To: <CABOkjxJnzTm=jJUy4Zgi9kGxLTBHvmrkM80UhgSdzyYcL4xfzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, jkardatzke-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, "yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, chenyian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org

Hi,

On Tue, 13 Jun 2023 at 05:29, Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> Hi, Linux device tree maintainers,
>
> I am writing to you today to request a review of some custom device
> tree bindings that we have developed. These bindings are not used by
> the Linux kernel, but they are used by OP-TEE[1], a secure execution
> environment for embedded systems.
>
> We have placed these bindings under the "chosen" node in the device
> tree, as suggested by Jeffrey Kardatzke.[2]
> The full bindings path would be "chosen/widevine/{tpm-auth-pk, huk,
> widevine-dice, widevine-ta-key}".
>
> We would like to have our bindings reviewed by a device tree
> maintainer to ensure that they are correct. We would also like to get
> your feedback on the best way to document these bindings.
>
> Thank you for your time and consultation.

Do you have a link to the binding, please?

Regards,
Simon


>
> Sincerely,
> Yi
>
> [1]: https://github.com/OP-TEE/optee_os
> [2]: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/20442
