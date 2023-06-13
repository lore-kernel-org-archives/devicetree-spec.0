From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Device tree usage in TF-A & OP-Tee consultation
Date: Tue, 13 Jun 2023 08:38:14 -0600
Message-ID: <CAL_JsqKV64rU3bOqRWua3BAVKjdfVt3TPuU8ObkrWS6rw7Aqkg@mail.gmail.com>
References: <CABOkjxJnzTm=jJUy4Zgi9kGxLTBHvmrkM80UhgSdzyYcL4xfzA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686667109;
        bh=SpdtResYYZXW1DbIU3GIyD10ROzNlGnrrKfFdxbpIRA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=b/hghF5tt5e+sOr0GsIWee0rASgx2g/BDM0mhMFYQFgxj0CY5pAkWtSsXuv/jT++o
         JgI3CkgPn5ZDmnYJchF+ucU6ns4upPSA47dvBjQaBqu/JQvaueGFclYWkdcV4P54h1
         fcM8uttQH9/rc7jY9AKFJUZmCoZX547GHlg48nAfRKtAo2zUjTL4/d6TTOJ6VIxzk9
         NAnqIunolIL8JQFB7jxsFEBooooV7449Ivq6TR+/fgvvQvJcd4HyUUC0+MlFzPvqTc
         DfhvkdeQ4QxLXdLrC9dfFISUMZPYtElcPJlh8EMK366HlUpHMJSq+m+3Hef51DDL2W
         lY0S/qquKQxyg==
In-Reply-To: <CABOkjxJnzTm=jJUy4Zgi9kGxLTBHvmrkM80UhgSdzyYcL4xfzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, jkardatzke-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, "yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <yich-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, chenyian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org

On Mon, Jun 12, 2023 at 10:29=E2=80=AFPM Yi Chou <yich-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> Hi, Linux device tree maintainers,

devicetree-spec is not Linux specific.

> I am writing to you today to request a review of some custom device
> tree bindings that we have developed. These bindings are not used by
> the Linux kernel, but they are used by OP-TEE[1], a secure execution
> environment for embedded systems.
>
> We have placed these bindings under the "chosen" node in the device
> tree, as suggested by Jeffrey Kardatzke.[2]
> The full bindings path would be "chosen/widevine/{tpm-auth-pk, huk,
> widevine-dice, widevine-ta-key}".

I would advise against using /chosen as it is pretty much geared to be
consumed by a single client (typically "the OS"). Instead, /options
node[1] may be a better option which is what we did for u-boot
configuration. It somewhat depends on what components consume the DT.
If the DT is only ever going to be consumed by OP-TEE, then using
/chosen is probably fine. However, if say TF-A and OP-TEE use the same
DT, then you have 2 components to configure.

> We would like to have our bindings reviewed by a device tree
> maintainer to ensure that they are correct. We would also like to get
> your feedback on the best way to document these bindings.
>
> Thank you for your time and consultation.
>
> Sincerely,
> Yi
>
> [1]: https://github.com/OP-TEE/optee_os
> [2]: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/20442

I don't see any bindings here. Am I supposed to study the code to
figure out the binding? Please write a binding doc/schema if you want
it reviewed.

Rob

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/=
options.yaml
