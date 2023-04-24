From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] Describe chosen modules for hypervisor booting
Date: Mon, 24 Apr 2023 13:55:22 +0100
Message-ID: <87jzy1a15e.fsf@linaro.org>
References: <20230421164012.2867267-1-alex.bennee@linaro.org>
 <CAL_JsqJmtcmsqRB_oiFm-cx8KU-4FgywHxK+qUn=-FvKz1d0xw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682341038; x=1684933038;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4INBt7gMyoW4ClGdnY1Wz3WgqXojX+vq0atR1N1+b6k=;
        b=wmuOd3FDuTyH8TtiS8aSC+PZ44GUnCIAH1thb76Y3pscYJXxKrcAWIWntAEb/Buuz9
         ZGb6hfmTsfAHDVYbpIYlPu57OdUWtHFjkD0YqMvJXgjCUXXtWxAtG0YcWnWOP5ByhyyR
         73rzBFObrxbu+95vp7MwtN54MHH9t/dN8o6fGlrlpc1niUTg1I4Z1yATRiDriZP7zGOH
         YNbAYYZ//oFprRJLHcNpvqcMj7nFucY8j+e3f76w0ZFkdjGHO62KM8OMp2oPZaHc2KXT
         /ngQZPTI/rzLo9OHPfYH7zh1ameB91P3IfKsgILPYQCVySD4Xnm6Fvzxi/WVn8mJzTAq
         Cccg==
In-reply-to: <CAL_JsqJmtcmsqRB_oiFm-cx8KU-4FgywHxK+qUn=-FvKz1d0xw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julien Grall <julien-LM2mM/qkH7s@public.gmane.org>, Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Carl van Schaik <cvanscha-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>


Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Fri, Apr 21, 2023 at 11:40=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@li=
naro.org> wrote:
>>
>> When booting something like a hypervisor there is need to communicate
>> to it how the first guest will be loaded. Typically the firmware or
>> boot loader will put the kernel and ramdisk in memory and pass the
>> information to the hypervisors boot code. This mechanism currently
>> works with Xen on the Arm platform and would be equally applicable to
>> other such hypervisors.
>
> This is probably something to discuss on the boot-architecture list.
>
>>
>> However this specification doesn't address the needs of a dom0less
>> system (where there is no "root" guest to launch the others) so is
>> currently very much an RFC.
>
> In the end, whatever you want to add will need a DT schema. Really,
> just a schema would be fine. Much of /chosen is not in the spec.

Where are these schema's stored?

I'm agnostic about where we eventually document this behaviour as long
as we can come up with a canonical documentation of it somewhere.
Otherwise I worry we will end up with numerous approaches all slightly
different in their behaviour.

>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Julien Grall <julien-LM2mM/qkH7s@public.gmane.org>
>> Cc: Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Carl van Schaik <cvanscha-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>
>> ---
>>  source/chapter3-devicenodes.rst | 55 +++++++++++++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>
>> diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenod=
es.rst
>> index 958257e..3c021a4 100644
>> --- a/source/chapter3-devicenodes.rst
>> +++ b/source/chapter3-devicenodes.rst
>> @@ -488,6 +488,61 @@ For compatibility, a client program might want to s=
upport
>>  *linux,stdout-path* if a *stdout-path* property is not present. The mea=
ning
>>  and use of the two properties is identical.
>>
>> +``chosen`` modules
>> +~~~~~~~~~~~~~~~~~~
>> +
>> +In a multi-stage boot, for example booting a hypervisor directly, the
>> +firmware may need to describe where the booting stage can find the
>> +next bit of software. These are described with one or more ``module``
>> +nodes which describe where in memory the module can be found and how
>> +to boot it. The ``module`` nodes should be filtered out from the DT
>> +passed to the next stage.
>
> I think 'image' would be a bit clearer than 'module'.
>
>> +
>> +.. tabularcolumns:: | p{4cm} p{0.75cm} p{4cm} p{6.5cm} |
>> +.. table:: ``/chosen/module`` Node Properties
>> +
>> +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> +   Property Name           Usage Value Type            Definition
>> +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> +   ``bootargs``            O     ``<string>``          A string that sp=
ecifies the boot arguments for
>> +                                                       the client progr=
am. The value could
>> +                                                       potentially be a=
 null string if no boot
>> +                                                       arguments are re=
quired.
>> +   ``compatible``          OR    ``<string>``          Describes the mo=
dule, may contain the following
>> +                                                       strings:
>> +
>> +                                                       - ``multiboot,ke=
rnel``: This indicates the
>> +                                                         module is a mu=
ltiboot compatible
>> +                                                         kernel image
>
> What does "multiboot compatible" mean?
>
>> +
>> +                                                       - ``multiboot,ra=
mdisk``:
>> +                                                         This indicates=
 the module is a ramdisk
>> +                                                         image. Kernels=
 confirming to the
>> +                                                         multiboot spec=
 will expect to be
>> +                                                         pointed to the=
 ramdisk as part of
>> +                                                         the boot infor=
mation
>
> Why don't the existing initrd properties work?
>
>> +   Usage legend: R=3DRequired, O=3DOptional, OR=3DOptional but Recommen=
ded, SD=3DSee Definition
>> +   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> +
>> +**Example**
>> +
>> +.. code-block:: dts
>> +
>> +    chosen {
>> +            bootargs =3D "dom0_mem=3D128M loglvl=3Dall guest_loglvl=3Da=
ll";
>> +            stdout-path =3D "/pl011@9000000";
>> +
>> +            module@0x47000000 {
>> +                    bootargs =3D "console=3Dhvc0";
>> +                    compatible =3D "multiboot,module\0multiboot,kernel";
>> +                    reg =3D <0x00 0x47000000 0x00 0xe47a00>;
>> +            };
>> +    };
>> +
>> +In this example the root bootargs are passed to the first stage and
>> +configure the hypervisor with the module being a kernel image that the
>> +hypervisor will boot with specific arguments for the guests kernel.
>> +
>>  ``/cpus`` Node Properties
>>  -------------------------
>>
>> --
>> 2.39.2
>>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
