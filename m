From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Add note about the initial character in a compatible
Date: Mon, 14 Jun 2021 11:49:58 -0600
Message-ID: <CAL_JsqLuJ9ddE+9nNjjjtwoWZCRnnvPr73wAN7hZtk83NsFZQg@mail.gmail.com>
References: <20210517152256.451270-1-marti.bolivar@nordicsemi.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623693012;
        bh=ZGyKIioNU8Pkff+ia0Z5O5K0MUz+tiprE9TSZaOLpl4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fDp/vF6fPB/uZzrEkRgmV8nPDyVz6xdGjNLUo/XSLryE64ulj/7EIqiGB4zBDGYqd
         cSX0Bzjn9BAwqew3QJ3+mdUBwmVrC29Y6nwK8095Hbf6fClqDHdRL9BQXGLg+FCFnY
         UElh+1/lB/spnWH2WfDUIDRxFWP4wKDMxqUVSQhQXR2R8YN1AsUipDIjTV8nHg39gM
         HE1rMXg/UIK1supy0Y4xCuXCkQX2JpQyARllJsomiBf9/y8lNRQA+dDx4G220H7Emj
         oHqrLHIoJsGnr5AP8ZhIDXnWMm9tvP/2TtbFWmC8K0j8lQKMk6T5RF1M0MPhz8xvXm
         mWQ53un2A41iw==
In-Reply-To: <20210517152256.451270-1-marti.bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Bolivar, Marti" <Marti.Bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Mon, May 17, 2021 at 9:25 AM Bolivar, Marti
<Marti.Bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org> wrote:
>
> Commit 05a34819e5 ("Add more restrictions on compatible strings")
> started to add recommendations on the contents of compatible strings.
>
> Add an additional recommendation that compatibles should start with a
> letter. In particular, this matches what dt-schema is doing.
>
> Signed-off-by: Mart=C3=AD Bol=C3=ADvar <marti.bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
> ---
>  source/chapter2-devicetree-basics.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I can't get this to apply. I'm not really sure what the issue is, but
can you resend without base64 encoding or send a GH PR.

>
> diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devi=
cetree-basics.rst
> index fa39625..40be221 100644
> --- a/source/chapter2-devicetree-basics.rst
> +++ b/source/chapter2-devicetree-basics.rst
> @@ -484,9 +484,9 @@ Description:
>     (such as a stock ticker symbol), and ``model`` specifies the model
>     number.
>
> -   The compatible string should consist only of lowercase letters, digit=
s
> -   and dashes. A single comma is typically only used following a vendor
> -   prefix. Underscores should not be used.
> +   The compatible string should consist only of lowercase letters, digit=
s and
> +   dashes, and should start with a letter. A single comma is typically o=
nly
> +   used following a vendor prefix. Underscores should not be used.
>
>  Example:
>
> --
> 2.31.1
