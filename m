From: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/3] Import /reserved-memory specification text
Date: Wed, 16 Sep 2020 17:20:50 +0100
Message-ID: <c358ec20-b3d6-5ef6-796a-5dcee8b0485d@arm.com>
References: <20200915170455.32520-1-grant.likely@arm.com>
 <20200915170455.32520-2-grant.likely@arm.com>
 <CAL_JsqKLV+R2YAXOZuPYnMR8Wji4_PkiH+r+Fki59r436SqnEw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfXreT1PSirrH3QLejd1C0mYQVrS27ZXhtEhwq0Pz4A=;
 b=gze7eg5XtswqdJrr50r4eSHOl9U5F60k2uVKTIHz3WNwP8AzbokSCsmHBHg1sWlv7mwP5G2PYxppz9hzSfuWx0P5rMDmQuCQheVNUcsADAM698nSqKrLpzguB7+7uHSnlbbB2+u5h6UQe7OvPdplt/s8Y+Sj4b0rvdhwk2KAHaA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfXreT1PSirrH3QLejd1C0mYQVrS27ZXhtEhwq0Pz4A=;
 b=gze7eg5XtswqdJrr50r4eSHOl9U5F60k2uVKTIHz3WNwP8AzbokSCsmHBHg1sWlv7mwP5G2PYxppz9hzSfuWx0P5rMDmQuCQheVNUcsADAM698nSqKrLpzguB7+7uHSnlbbB2+u5h6UQe7OvPdplt/s8Y+Sj4b0rvdhwk2KAHaA=
In-Reply-To: <CAL_JsqKLV+R2YAXOZuPYnMR8Wji4_PkiH+r+Fki59r436SqnEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nd <nd-5wv7dgnIgG8@public.gmane.org>, Ard Biesheuvel <ardb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif-e2DmVA6dwcVWk0Htik3J/w@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>



On 16/09/2020 17:11, Rob Herring wrote:
> On Tue, Sep 15, 2020 at 11:06 AM Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>> Imported from linux kernel source:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> 
> And what happens when this file is modified? Can you make it just
> contain "This has moved, see DT spec section x.y.z" or something like
> that?

I think so. My first thought was to remove the file entirely from Linux, 
but it might be better to leave the file in place and replace the 
contents with a hyperlink to the spec section.

> Don't you want to convert it to schema for me first and then generate
> the spec content. ;)

:-p

Yeah I do, but I never got around to implementing that parser and 
instead that idea has just blocked all progress on the spec. So until 
that happens, if ever, I'd rather start bringing the content into dtspec 
that can be reformatted later.

g.

>>
>> Very minor editorial changes made while importing, with one exception.
>> Added clause that the 'no-map' and 'reusable' properties are mutually
>> exclusive.
>>
>> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>> Cc: Ard Biesheuvel <ardb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>   source/chapter3-devicenodes.rst | 203 +++++++++++++++++++++++++++++++-
>>   1 file changed, 202 insertions(+), 1 deletion(-)
>>
>> diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenodes.rst
>> index 3aa4650..3043b8a 100644
>> --- a/source/chapter3-devicenodes.rst
>> +++ b/source/chapter3-devicenodes.rst
>> @@ -161,7 +161,8 @@ If the VLE storage attribute is supported, with VLE=0.
>>      :ref:`sect-standard-properties`) are allowed but are optional.
>>
>>
>> -**Examples**
>> +``/memory`` Examples
>> +~~~~~~~~~~~~~~~~~~~~
>>
>>   Given a 64-bit Power system with the following physical memory layout:
>>
>> @@ -200,6 +201,206 @@ memory ranges. The 2 GB I/O region is skipped. Note that the
>>   value of 2, which means that two 32-bit cells are required to define the
>>   address and length for the ``reg`` property of the memory node.
>>
>> +``/reserved-memory`` Node
>> +-------------------------
>> +
>> +Reserved memory is specified as a node under the ``/reserved-memory`` node.
>> +The operating system shall exclude reserved memory from normal usage
>> +one can create child nodes describing particular reserved (excluded from
>> +normal use) memory regions.
>> +Such memory regions are usually designed for the special usage by various
>> +device drivers.
>> +
>> +Parameters for each memory region can be encoded into the device tree
>> +with the following nodes:
>> +
>> +/reserved-memory parent node
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
>> +.. table:: /reserved-memory Parent Node Properties
>> +
>> +   =================== ===== ================= ===============================================
>> +   Property Name       Usage Value Type        Definition
>> +   =================== ===== ================= ===============================================
>> +   ``#address-cells``  R     ``<u32>``         Specifies the number of ``<u32>`` cells to
>> +                                               represent the address in the ``reg`` property in
>> +                                               children of root.
>> +   ``#size-cells``     R     ``<u32>``         Specifies the number of ``<u32>`` cells to
>> +                                               represent the size in the ``reg`` property in
>> +                                               children of root.
>> +   ``ranges``          R     ``<prop encoded   This property represents the mapping between
>> +                             array>``          parent address to child address spaces (see
>> +                                               section :ref:`sect-standard-properties-ranges`,
>> +                                               ranges).
>> +   Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
>> +   ===========================================================================================
>> +
>> +``#address-cells`` and ``#size-cells`` should use the same values as for the root node,
>> +and ``ranges`` should be empty so that address translation logic works correctly.
>> +
>> +/reserved-memory/ child nodes
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +Each child of the reserved-memory node specifies one or more regions of
>> +reserved memory. Each child node may either use a ``reg`` property to
>> +specify a specific range of reserved memory, or a ``size`` property with
>> +optional constraints to request a dynamically allocated block of memory.
>> +
>> +Following the generic-names recommended practice, node names should
>> +reflect the purpose of the node (ie. "*framebuffer*" or "*dma-pool*").
>> +Unit address (``@<address>``) should be appended to the name if the node
>> +is a static allocation.
>> +
>> +A reserved memory node requires either a ``reg`` property for static
>> +allocations, or a ``size`` property for dynamics allocations.
>> +Dynamic allocations may use ``alignment`` and ``alloc-ranges`` properties
>> +to constrain where the memory is allocated from.
>> +If both ``reg`` and ``size`` are present, then the region is treated as a
>> +static allocation with the ``reg`` property taking precedence and ``size``
>> +is ignored.
>> +
>> +.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
>> +.. table:: ``/reserved-memory/`` Child Node Properties
>> +
>> +   ======================= ===== ========================= ===============================================
>> +   Property Name           Usage Value Type                Definition
>> +   ======================= ===== ========================= ===============================================
>> +   ``reg``                 O      ``<prop-encoded-array>`` Consists of an arbitrary number of address and
>> +                                                           size pairs that specify the physical address
>> +                                                           and size of the memory ranges.
>> +   ``size``                O      ``<prop-encoded-array>`` Size in bytes of memory to reserve for
>> +                                                           dynamically allocated regions.
>> +                                                           Size of this property is based on parent node's
>> +                                                           ``#size-cells`` property.
>> +   ``alignment``           O      ``<prop-encoded-array>`` Address boundary for alignment of allocation.
>> +                                                           Size of this property is based on parent node's
>> +                                                           ``#size-cells`` property.
>> +   ``alloc-ranges``        O      ``<prop-encoded-array>`` Specifies regions of memory that are acceptable
>> +                                                           to allocate from.
>> +                                                           Format is (address, length pairs) tuples in
>> +                                                           same format as for ``reg`` properties.
>> +   ``compatible``          O      ``<stringlist>``         May contain the following strings:
>> +
>> +                                                           - ``shared-dma-pool``: This indicates a region of
>> +                                                             memory meant to be used as a shared pool of DMA
>> +                                                             buffers for a set of devices.
>> +                                                             It can be used by an operating system to
>> +                                                             instantiate the necessary pool management
>> +                                                             subsystem if necessary.
>> +
>> +                                                           - vendor specific string in the form
>> +                                                             ``<vendor>,[<device>-]<usage>``
>> +   ``no-map``              O      ``<empty>``              If present, indicates the operating system must
>> +                                                           not create a virtual mapping of the region as
>> +                                                           part of its standard mapping of system memory,
>> +                                                           nor permit speculative access to it under any
>> +                                                           circumstances other than under the control of
>> +                                                           the device driver using the region.
>> +   ``reusable``            O      ``<empty>``              The operating system can use the memory in this
>> +                                                           region with the limitation that the device
>> +                                                           driver(s) owning the region need to be able to
>> +                                                           reclaim it back.
>> +                                                           Typically that means that the operating system
>> +                                                           can use that region to store volatile or cached
>> +                                                           data that can be otherwise regenerated or
>> +                                                           migrated elsewhere.
>> +   Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
>> +   =======================================================================================================
>> +
>> +.. note:: All other standard properties (section
>> +   :ref:`sect-standard-properties`) are allowed but are optional.
>> +
>> +The ``no-map`` and ``reusable`` properties are mutually exclusive and both must
>> +not be used together in the same node.
>> +
>> +Linux implementation notes:
>> +
>> +- If a ``linux,cma-default`` property is present, then Linux will use the
>> +  region for the default pool of the contiguous memory allocator.
>> +
>> +- If a ``linux,dma-default`` property is present, then Linux will use the
>> +  region for the default pool of the consistent DMA allocator.
>> +
>> +Device node references to reserved memory
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +Regions in the ``/reserved-memory`` node may be referenced by other device
>> +nodes by adding a ``memory-region`` property to the device node.
>> +
>> +.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
>> +.. table:: Properties for referencing reserved-memory regions
>> +
>> +   ======================= ===== ========================= ===============================================
>> +   Property Name           Usage Value Type                Definition
>> +   ======================= ===== ========================= ===============================================
>> +   ``memory-region``       O     ``<prop-encoded-array>``  phandle, specifier pairs to children of
>> +                                                           ``/reserved-memory``
>> +   ``memory-region-names`` O     ``<stringlist>>``         A list of names, one for each corresponding
>> +                                                           entry in the ``memory-region`` property
>> +   Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
>> +   =======================================================================================================
>> +
>> +``/reserved-memory`` Example
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +This example defines 3 contiguous regions are defined for Linux kernel:
>> +one default of all device drivers (named ``linux,cma@72000000`` and 64MiB in size),
>> +one dedicated to the framebuffer device (named ``framebuffer@78000000``, 8MiB), and
>> +one for multimedia processing (named ``multimedia-memory@77000000``, 64MiB).
>> +
>> +.. code-block:: dts
>> +
>> +   / {
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +
>> +      memory {
>> +         reg = <0x40000000 0x40000000>;
>> +      };
>> +
>> +      reserved-memory {
>> +         #address-cells = <1>;
>> +         #size-cells = <1>;
>> +         ranges;
>> +
>> +         /* global autoconfigured region for contiguous allocations */
>> +         linux,cma {
>> +            compatible = "shared-dma-pool";
>> +            reusable;
>> +            size = <0x4000000>;
>> +            alignment = <0x2000>;
>> +            linux,cma-default;
>> +         };
>> +
>> +         display_reserved: framebuffer@78000000 {
>> +            reg = <0x78000000 0x800000>;
>> +         };
>> +
>> +         multimedia_reserved: multimedia@77000000 {
>> +            compatible = "acme,multimedia-memory";
>> +            reg = <0x77000000 0x4000000>;
>> +         };
>> +      };
>> +
>> +      /* ... */
>> +
>> +      fb0: video@12300000 {
>> +         memory-region = <&display_reserved>;
>> +         /* ... */
>> +      };
>> +
>> +      scaler: scaler@12500000 {
>> +         memory-region = <&multimedia_reserved>;
>> +         /* ... */
>> +      };
>> +
>> +      codec: codec@12600000 {
>> +         memory-region = <&multimedia_reserved>;
>> +         /* ... */
>> +      };
>> +   };
>> +
>>   ``/chosen`` Node
>>   ----------------
>>
>> --
>> 2.20.1
>>
