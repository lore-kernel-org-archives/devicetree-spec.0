From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: How to describe internal flash (ROM) in the microcontroller
Date: Mon, 24 Apr 2017 11:27:35 +1000
Message-ID: <20170424012734.GB16882@umbus.fritz.box>
References: <1492886823.1240.5.camel@op.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1492999172;
        bh=nCjgQEnmWerJGZ/cqNrmnm4VrXKhgAggosLsKhPYBJs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Na1AKsZOQHwlcHhYHoJvkOwBgplbgGh2h3MFIZjgAkn1kbsDteOp+4CTu1LdS2wx7
         0mKHMprxbLAA3u1ZbWsvl+0Bon9LaOIuboQFQQ8S3YPOewgmW1MwUEUJBujEzPfLfx
         C3BDmtYvQ2VmhXHr4yrDSl/4zHlgoXuvILhSv/xU=
Content-Disposition: inline
In-Reply-To: <1492886823.1240.5.camel-FWhLrETftxM@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
To: Freddie Chopin <freddie_chopin-FWhLrETftxM@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 22, 2017 at 08:47:03PM +0200, Freddie Chopin wrote:
> Hello!
>=20
> For my project -=A0http://distortos.org/ - which is a C++ RTOS for
> microcontrollers, I decided to use devicetree to configure hardware.
> Currently the project uses kconfig, but for configuring hardware this
> gets unmanageable and just too big and too restrictive. My plan is to
> gradually convert to *.dts and the first step I wanted to make is to
> convert=A0addresses and sizes of memory (which I'll later read from *.dts
> file to generate linker script).
>=20
> To cut a long story short - there's no issue in adding RAM (internal
> chip's SRAM) - just add that as one or more /memory node. However I
> also need to do something for which I found absolutely no info, no
> example and no binding - I also need to describe **internal** ROM
> (internal on-chip flash memory). Please note that this is _not_
> something which can be described as "nand-flash", "nor-flash", "emmc",
> "qspi" or things like that - this memory is not externally connected
> via some interface - it is "built-in" into the chip.
>=20
> I have thought about two options to do that, but can't decide which one
> fits better, so I decided to ask here, as you've been working with
> devicetrees for quite a long time.
>=20
> Option 1
>=20
> Generally this is similar to what Zephyr RTOS has done, which is to
> just introduce a new /flash node. This has a disadvantage of being non-
> standard.
>=20
> https://github.com/zephyrproject-rtos/zephyr/blob/master/dts/arm/st/stm32=
l476.dtsi#L11
>=20
> Option 2
>=20
> Describe flash as a separate /memory node and add "read-only;" property
> there to designate it as "not-RAM". In my personal opinion this fits
> nicely with other parts of spec (and fits with /reserved-memory nodes
> concept from=A0Linux). However I'm not sure whether the idea of "read-
> only" memory region makes any sense according to your concepts. BTW
> some other property would also work fine here, generally anything that
> would allow me to know which is flash and which is RAM, so I could use
> them for different parts of linker script.
>=20
> Or maybe instead of adding "read-only;" I should use sth like this in
> my flash /memory node:
>=20
> compatible=3D"internal-flash";
>=20
> For "option 2" there's also another question - I may need to add some
> more non-standard properties for such nodes, for example with
> configuration of latency or for configuration of LMA address which will
> be used by linker (for example in STM32F7 microcontrollers flash can be
> accessed via two different buses, but written only via one - as the one
> which can be used for writes is slower, it is preferable to use
> different VMA/LMA addresses). This can actually be done with virtual-
> reg property (where reg would have LMA and virtual-reg - VMA), but I'm
> sure the need for something non-standard would arrive some day or
> another. Would that still fit?
>=20
> Thanks in advance for all ideas!

Right, so basically you need a binding for your flash device - a
binding is the formal description of how a particular sort of device
should be represented in the device tree.  It's not uncommon for new
ports to require a few new bindings for "system" devices.

First off, I think you want option 1, more or less.  Although I think
it originally had a wider meaning, for a long time memory@ nodes have
been used pretty much exclusively for general purpose RAM.  I wouldn't
suggest overloading that binding for something quite different.


I guess in theory I should tell you that all bindings shoul be made
clearly, standardized, published and so forth.  In practice, well,
it's a tradeoff.  Getting a binding reviewed, published and so forth
will generally improve its quality, mean less work for others who use
the device in the future and other good things.  On the other hand it
it can be a lot of work.  It's definitely worth it for common devices;
maybe not so much for board-specific one-offs.

Obviously, the first step is to look for an existing binding for the
device.  How to establish and maintain a canonical repository of
bindings is a subject of continuing debate.  In the meantime the
places to look are Documentation/devicetree/bindings in the Linux
kernel source, and devicetree.org.  There may be other places, but I
don't know them off hand.

=46rom the description of your device, I kind of doubt there's an
existing binding, though.  So you'll need to write one.  Good news is
your device is pretty simple - you can probably copy a binding for a
similar device, and just change the 'compatible' value and make any
few tweaks you need.

I do recommend posting your draft binding here and getting at least
cursory new.  If you're new to writing bindings, there are a fair few
gotchas - things that might not make the binding unusable, but will
differ from existing conventions enough to make life harder for
people.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY/VSCAAoJEGw4ysog2bOSMmQQAOKetqksPJj2XYDjVu6DHs4d
3FOpo6KBiDTeMytK/jI5RWjj53Vc0rPvoDDh6jurgEvRAW/eWJnyPnor4SUBpzDT
MEKNp5yLeskCNT/Pp6hRZWQv5+QFVaPNTCJFHaEQEUcH7K23xgoq4qD6xjVcWQ4R
9jJ/t0PPTEbpF+MlWq0NpUT7JS8mgnK8EOsocC8R79H/8F6arPprePDhYbQmaT10
EpEjTt9Dm48SftfZ8atCZDeHVsSOObB6VsTE88Y78+MPNiXdLXLjhfGvRt8tvpSk
T8BZmO1y3DnS2VfN+4bfIkNTlov11C74RsgXQ7Bqand+htZfyol5XRpYg9dW0i5K
/4Ac3SHto08f3fqEkQqfv6e18nT7PXIE6pR3FKIXCUhjrQIX6ve/DKLnFnULJQyz
ipUqa+YnKzvaHU6tLV64nxIJAM4aQufQ2uou0leFJjqt8rgFm7vnhJieKYeYoLkU
FtlUELlN7ZEhaE2LARHP061nkcEQMjDVWFM6TN9mIOkBLxDltnJXIfwNKcNi1cYF
xTYFfcr49CxOUEkeMK9if5AZd95SU5SUqRHxhbh11nfQYGwLPdWbW+E+2ziLRNhR
p/aazAY0nlmv9oE9D+W+TJRP6VLgfrqYEhB70jDE41ccKybWN2OSg3bx4Mf1XW8l
/bhKm1YbQY48qQiCOfLV
=rEsc
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
