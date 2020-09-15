From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/3] Clarify language on /memreserve/
Date: Tue, 15 Sep 2020 22:45:21 +0200
Message-ID: <389c3f6b-dc39-2b12-ebd4-034dc274e2f6@gmx.de>
References: <20200915170455.32520-1-grant.likely@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1600202726;
        bh=PMD+rAXq8DFs8A7JbnA1ruEYouJA2SLxs8Qhfljewfo=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Rzsb1zVUNl9nEc+XN6qy02yf4Zrt2+4YCNQNL/GkYRALhvVhjHoXz5e782QLq2X21
         UPUQTEgRQYaidN1q9fmVTSGNhz4O/g2I27mojVEVkxkuOdH6bkbhi3NFCReq6d4/Gh
         0qohQ8J9AaLBHapNOLhklM/+lWxV8FnC54/VdgCk=
In-Reply-To: <20200915170455.32520-1-grant.likely-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: nd-5wv7dgnIgG8@public.gmane.org, Ard Biesheuvel <ardb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif-e2DmVA6dwcVWk0Htik3J/w@public.gmane.org>

On 9/15/20 7:04 PM, Grant Likely wrote:
> The language was ambiguous. Rephrase and reformat to be more readable.
>
> Co-authored-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
> Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  source/chapter6-source-language.rst | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/source/chapter6-source-language.rst b/source/chapter6-sourc=
e-language.rst
> index ed4e234..295fcd6 100755
> --- a/source/chapter6-source-language.rst
> +++ b/source/chapter6-source-language.rst
> @@ -233,15 +233,23 @@ File layout
>              [child nodes]
>          };
>
> -The /dts-v1/; shall be present to identify the file as a version 1 DTS
> +``/dts-v1/;`` shall be present to identify the file as a version 1 DTS
>  (dts files without this tag will be treated by dtc as being in the
>  obsolete version 0, which uses a different format for integers in
>  addition to other small but incompatible changes).
>
> -Memory reservations define an entry for the devicetree blob=E2=80=99s m=
emory
> -reservation table. They have the form: e.g., /memreserve/ <address>
> -<length>; Where <address> and <length> are 64-bit C-style integers.
> +Memory reservations (see section :ref:`sect-fdt-memory-reservation-bloc=
k`)
> +are represented by lines in the form::
>
> -*  The / { }; section defines the root node of the devicetree.
> +   /memreserve/ <address> <length>;
>
> -*  C style (/* ... \*/) and C++ style (//) comments are supported.
> +Where ``<address>`` and ``<length>`` are 64-bit C-style integers, e.g.,
> +
> +.. code-block:: dts
> +
> +   /memreserve/ 0x10000000 0x0004000;

+   /memreserve/ 0x10000000 0x00004000;

The 28bit number looks strange here. Let's add another zero so that the
number formats match (or remove the leading zeros).

Best regards

Heinrich

> +
> +The ``/ { ... };`` section defines the root node of the devicetree, and
> +all the device tree data is contained within it.
> +
> +C style (``/* ... \*/``) and C++ style (``//``) comments are supported.
>

