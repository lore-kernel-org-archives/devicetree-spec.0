From: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] Trivia: Add SPDX tags to source files
Date: Thu, 17 Sep 2020 15:14:27 +0100
Message-ID: <c36f53db-c8fc-962c-ce70-829f1c9f354b@arm.com>
References: <20200917141259.13432-1-grant.likely@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mzR1tz9u6jaAztm/6u17PPnZkt+qfe2ptXfVVlnNJo=;
 b=77ktoqRO7JUFKjssgnAKTdnxkxVeK8T+F0s4goIs6lKnZffSpTB2/3DbcVrqQbBm8tNfwa1HbGy8ZfmS4B0ECrG3JgsreVJR+HhLZo15Sn1WhGzQBAgc/7mJgnoAod2H8LUhYV1riHtj24tMqEssh7DJ0SCv0Y5Vj5b7DA5WKI8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mzR1tz9u6jaAztm/6u17PPnZkt+qfe2ptXfVVlnNJo=;
 b=77ktoqRO7JUFKjssgnAKTdnxkxVeK8T+F0s4goIs6lKnZffSpTB2/3DbcVrqQbBm8tNfwa1HbGy8ZfmS4B0ECrG3JgsreVJR+HhLZo15Sn1WhGzQBAgc/7mJgnoAod2H8LUhYV1riHtj24tMqEssh7DJ0SCv0Y5Vj5b7DA5WKI8=
In-Reply-To: <20200917141259.13432-1-grant.likely-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: nd-5wv7dgnIgG8@public.gmane.org

*trivial

On 17/09/2020 15:12, Grant Likely wrote:
> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
> ---
>   FAQ.md                                | 2 ++
>   Makefile                              | 2 ++
>   README.md                             | 1 +
>   linux-doc-removal-schedule.rst        | 2 ++
>   source/acknowledgements.rst           | 2 ++
>   source/chapter1-introduction.rst      | 1 +
>   source/chapter2-devicetree-basics.rst | 2 +-
>   source/chapter3-devicenodes.rst       | 2 ++
>   source/chapter4-device-bindings.rst   | 2 ++
>   source/chapter5-flattened-format.rst  | 2 ++
>   source/chapter6-source-language.rst   | 2 ++
>   source/conf.py                        | 1 +
>   source/index.rst                      | 2 ++
>   source/license.rst                    | 1 +
>   source/references.rst                 | 1 +
>   source/revhistory.rst                 | 2 ++
>   source/rst_prolog                     | 2 ++
>   writers-guide.rst                     | 2 ++
>   18 files changed, 30 insertions(+), 1 deletion(-)
>=20
> diff --git a/FAQ.md b/FAQ.md
> index 0d8a032..c1a470e 100644
> --- a/FAQ.md
> +++ b/FAQ.md
> @@ -43,3 +43,5 @@ only and not with Linaro membership.
>   The membership proceeds go towards the defraying of Linaro=E2=80=99s co=
sts for hosting devicetree.org.
>  =20
>   If you have useful FAQs you would like to see here, please contact us t=
hrough the mailing list
> +
> +<!-- SPDX-License-Identifier: Apache-2.0 -->
> diff --git a/Makefile b/Makefile
> index 8e5475d..33446b0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: Apache-2.0
> +#
>   # Minimal makefile for Sphinx documentation
>   #
>  =20
> diff --git a/README.md b/README.md
> index fa21ecf..57b16d8 100644
> --- a/README.md
> +++ b/README.md
> @@ -136,3 +136,4 @@ By making a contribution to this project, I certify t=
hat:
>       this project or the open source license(s) involved.
>   ```
>  =20
> +<!-- SPDX-License-Identifier: Apache-2.0 -->
> diff --git a/linux-doc-removal-schedule.rst b/linux-doc-removal-schedule.=
rst
> index 90eeed0..b0ae9b1 100644
> --- a/linux-doc-removal-schedule.rst
> +++ b/linux-doc-removal-schedule.rst
> @@ -8,3 +8,5 @@ The content of the following files have been imported int=
o the spec from the Lin
>            bindings/
>               reserved-memory/
>                  reserved-memory.txt     # Added commit 841c0878
> +
> +.. SPDX-License-Identifier: Apache-2.0
> diff --git a/source/acknowledgements.rst b/source/acknowledgements.rst
> index a02e0aa..5e768d4 100644
> --- a/source/acknowledgements.rst
> +++ b/source/acknowledgements.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: Apache-2.0
> +
>   **Acknowledgements**
>  =20
>   The devicetree.org Technical Steering Committee would like to
> diff --git a/source/chapter1-introduction.rst b/source/chapter1-introduct=
ion.rst
> index f50e6b5..6c806af 100644
> --- a/source/chapter1-introduction.rst
> +++ b/source/chapter1-introduction.rst
> @@ -1,3 +1,4 @@
> +.. SPDX-License-Identifier: Apache-2.0
>  =20
>   .. _chapter-introduction:
>  =20
> diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devi=
cetree-basics.rst
> index f782137..50a6a86 100644
> --- a/source/chapter2-devicetree-basics.rst
> +++ b/source/chapter2-devicetree-basics.rst
> @@ -1,4 +1,4 @@
> -
> +.. SPDX-License-Identifier: Apache-2.0
>  =20
>   .. _chapter-devicetree:
>  =20
> diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenode=
s.rst
> index c248f53..b731b8f 100644
> --- a/source/chapter3-devicenodes.rst
> +++ b/source/chapter3-devicenodes.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: Apache-2.0
> +
>   .. _chapter-device-node-requirements:
>  =20
>   Device Node Requirements
> diff --git a/source/chapter4-device-bindings.rst b/source/chapter4-device=
-bindings.rst
> index 7e1a0f4..6e481f1 100644
> --- a/source/chapter4-device-bindings.rst
> +++ b/source/chapter4-device-bindings.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: Apache-2.0
> +
>   .. _chapter-device-bindings:
>  =20
>   Device Bindings
> diff --git a/source/chapter5-flattened-format.rst b/source/chapter5-flatt=
ened-format.rst
> index 6b1e182..26efe6e 100644
> --- a/source/chapter5-flattened-format.rst
> +++ b/source/chapter5-flattened-format.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: Apache-2.0
> +
>   .. _chapter-fdt-structure:
>  =20
>   Flattened Devicetree (DTB) Format
> diff --git a/source/chapter6-source-language.rst b/source/chapter6-source=
-language.rst
> index 61d05d4..7b74846 100755
> --- a/source/chapter6-source-language.rst
> +++ b/source/chapter6-source-language.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: Apache-2.0
> +
>   .. _chapter-devicetree-source-format:
>  =20
>   Devicetree Source (DTS) Format (version 1)
> diff --git a/source/conf.py b/source/conf.py
> index 1803dfa..51ffa2b 100644
> --- a/source/conf.py
> +++ b/source/conf.py
> @@ -1,3 +1,4 @@
> +# SPDX-License-Identifier: Apache-2.0
>   # -*- coding: utf-8 -*-
>   #
>   # Devicetree Specification documentation build configuration file, crea=
ted by
> diff --git a/source/index.rst b/source/index.rst
> index 568e72b..120c991 100644
> --- a/source/index.rst
> +++ b/source/index.rst
> @@ -3,6 +3,8 @@
>      You can adapt this file completely to your liking, but it should at =
least
>      contain the root `toctree` directive.
>  =20
> +   SPDX-License-Identifier: Apache-2.0
> +
>   Welcome to Devicetree Specification's documentation!
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>  =20
> diff --git a/source/license.rst b/source/license.rst
> index 17a586f..b480895 100644
> --- a/source/license.rst
> +++ b/source/license.rst
> @@ -1,3 +1,4 @@
> +.. SPDX-License-Identifier: Apache-2.0
>  =20
>   **Copyright**
>  =20
> diff --git a/source/references.rst b/source/references.rst
> index 8400e96..8d8708d 100644
> --- a/source/references.rst
> +++ b/source/references.rst
> @@ -1,3 +1,4 @@
> +.. SPDX-License-Identifier: Apache-2.0
>  =20
>   .. [IEEE1275] *Boot (Initialization Configuration) Firmware: Core Requi=
rements
>      and Practices*, 1994, This is the core standard (also known as IEEE
> diff --git a/source/revhistory.rst b/source/revhistory.rst
> index e302093..81b71f2 100644
> --- a/source/revhistory.rst
> +++ b/source/revhistory.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: Apache-2.0
> +
>   .. _revision-history:
>   .. tabularcolumns:: | p{1.5cm} p{2.25cm} p{11.50cm} |
>   .. table:: Revision History
> diff --git a/source/rst_prolog b/source/rst_prolog
> index 6cee60e..2854cc8 100644
> --- a/source/rst_prolog
> +++ b/source/rst_prolog
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: Apache-2.0
> +
>   .. Revision of the specification
>  =20
>   .. |dtspec-major| replace:: 0
> diff --git a/writers-guide.rst b/writers-guide.rst
> index 75c291a..fde76a4 100644
> --- a/writers-guide.rst
> +++ b/writers-guide.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: Apache-2.0
> +
>   This document uses the Sphinx implementation of reStructured Text (RST)=
. RST is
>   a flexible markup language with lots of options for laying out text. To=
 keep
>   thinks simple, this file describes the conventions used by this project=
. As
>=20
