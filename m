From: Ard Biesheuvel <ardb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] Add details of UEFI interaction with /memory and /reserved-memory
Date: Tue, 15 Sep 2020 20:09:57 +0300
Message-ID: <CAMj1kXGQTbU5uxPSsePxDTZrdeAvOf8Ev0iNmAHDcAoP_SYdHQ@mail.gmail.com>
References: <20200915170455.32520-1-grant.likely@arm.com> <20200915170455.32520-3-grant.likely@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600189809;
        bh=vlZBOSWtFhOLDr117VZj12q7hddaIfkj9vJNATkbxxI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gnF67m2KhMv9f698c0PyjK63wBEjjDDtRMEsjBXfc7g7trNjStUPZlM8I+rsSKx0e
         bwh28INgkl3KAR1V/jV3tYfTOs+dKz6yeH/AVYaAabmPbaFBYgQJN1kq0D3h6ea+RH
         0ZXVfrf3gUR71aMsfYr/npWaVUV+o3nU+di5UoeM=
In-Reply-To: <20200915170455.32520-3-grant.likely-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="tis-620"
To: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nd <nd-5wv7dgnIgG8@public.gmane.org>, Leif Lindholm <leif-e2DmVA6dwcVWk0Htik3J/w@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

On Tue, 15 Sep 2020 at 20:06, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org> wrote:
>
> Output from discussion on EBBR issue:
> https://github.com/ARM-software/ebbr/issues/52
>
> When using the UEFI ABI for booting, the DT memory map is ignored and
> instead UEFI GetMemoryMap() is used to find system memory. Also, regions
> described in /reserved-memory need to also be added to the UEFI memory
> map to protect against overlapping allocations. The patch adds language
> to cover both of those cases.
>
> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
> Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> Cc: Ard Biesheuvel <ardb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  source/chapter3-devicenodes.rst      | 26 +++++++++++++++++++++++---
>  source/chapter5-flattened-format.rst | 10 ++++++++++
>  source/references.rst                |  4 ++++
>  3 files changed, 37 insertions(+), 3 deletions(-)
>
> diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenode=
s.rst
> index 3043b8a..a78a742 100644
> --- a/source/chapter3-devicenodes.rst
> +++ b/source/chapter3-devicenodes.rst
> @@ -160,6 +160,12 @@ If the VLE storage attribute is supported, with VLE=
=3D0.
>  .. note:: All other standard properties (section
>     :ref:`sect-standard-properties`) are allowed but are optional.
>
> +``/memory`` node and UEFI
> +~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +When booting via [UEFI]_, the system memory map is obtained via the
> +GetMemoryMap() UEFI boot time service as defined in [UEFI]_ =C2=A7 7.2,
> +and if present, the OS must ignore any ``/memory`` nodes.
>
>  ``/memory`` Examples
>  ~~~~~~~~~~~~~~~~~~~~
> @@ -308,12 +314,12 @@ is ignored.
>     Usage legend: R=3DRequired, O=3DOptional, OR=3DOptional but Recommend=
ed, SD=3DSee Definition
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
> -.. note:: All other standard properties (section
> -   :ref:`sect-standard-properties`) are allowed but are optional.
> -
>  The ``no-map`` and ``reusable`` properties are mutually exclusive and bo=
th must
>  not be used together in the same node.
>
> +Dynamic reserved memory regions must not be listed in the [UEFI]_ memory=
 map
> +because they are allocated by the OS after exiting firmware boot service=
s.
> +
>  Linux implementation notes:
>
>  - If a ``linux,cma-default`` property is present, then Linux will use th=
e
> @@ -341,6 +347,20 @@ nodes by adding a ``memory-region`` property to the =
device node.
>     Usage legend: R=3DRequired, O=3DOptional, OR=3DOptional but Recommend=
ed, SD=3DSee Definition
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
> +.. _sect-reserved-memory-uefi:
> +
> +``/reserved-memory`` and UEFI
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +When booting via [UEFI]_, static ``/reserved-memory`` regions must
> +also be listed in the system memory map obtained via the GetMemoryMap()
> +UEFI boot time service as defined in [UEFI]_ =C2=A7 7.2.
> +The reserved memory regions need to be included in the UEFI memory map t=
o
> +protect against allocations by UEFI applications.
> +
> +Reserved regions with the ``no-map`` property must be listed in the memo=
ry
> +map with type ``EfiReservedMemoryType``.
> +All other reserved regions must be listed with type ``EfiBootServicesDat=
a``.
> +
>  ``/reserved-memory`` Example
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> diff --git a/source/chapter5-flattened-format.rst b/source/chapter5-flatt=
ened-format.rst
> index 28e5bd4..b1e2b8b 100644
> --- a/source/chapter5-flattened-format.rst
> +++ b/source/chapter5-flattened-format.rst
> @@ -234,6 +234,16 @@ reservation block as a whole, shall be located at an=
 8-byte aligned
>  offset from the beginning of the devicetree blob (see section
>  :ref:`sect-fdt-alignment`).
>
> +Memory Reservation Block and UEFI
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +As with the ``/reserved-memory`` node (section :ref:`sect-reserved-memor=
y-uefi`),
> +when booting via [UEFI]_ entries in the Memory Reservation Block must al=
so be
> +listed in the system memory map obtained via the GetMemoryMap() to prote=
ct against
> +allocations by UEFI applications.
> +The memory reservation block entries should be listed with type
> +``EfiBootServicesData``.
> +

Didn't we just agree this should be EfiReservedMemoryType ?

>  .. _sect-fdt-structure-block:
>
>  Structure Block
> diff --git a/source/references.rst b/source/references.rst
> index 961fa20..8400e96 100644
> --- a/source/references.rst
> +++ b/source/references.rst
> @@ -23,3 +23,7 @@
>  .. [EPAPR] *Power.org Standard for Embedded Power Architecture
>     Platform Requirements*, power.org, 2011,
>     https://www.power.org/documentation/power-org-standard-for-embedded-p=
ower-architecture-platform-requirements-epapr-v1-1-2/
> +
> +.. [UEFI] `Unified Extensable Firmware Interface Specification v2.8 Erra=
ta A
> +   <https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_A_Feb14=
.pdf>`_,
> +   February 2020, `UEFI Forum <http://www.uefi.org>`_
> --
> 2.20.1
>
