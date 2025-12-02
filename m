Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88180244661
	for <devicetree-spec@vger.kernel.org>; Tue,  2 Dec 2025 23:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764717408; cv=none; b=M51BWYsGWGpyfFz+wb1DE1VtoMClgdu7IvLgFc0FftywVAR1Y/ydE5BBB1bw1YnS4wo56JkHrqZy7TXYTPrv0OgnJPCcz5Hom/t+xIc+fX8KwTAC0OwokfzttGZKYJadB6yKO4ne3S7xYalZ+hsVfLgt/nAj07VgnOv1yx01W+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764717408; c=relaxed/simple;
	bh=73gj/hMYyPPC6pUaSwtP2vWY0sFe8jEPmZXl/KtFSWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9I1pWrGLaOBG/sHhzX9JfP8EQezjuf5nC95pp1erZgshHD3N3FxnsI0tJRgq3wNjuvh0rglhJaZXejL0KmXD9Bw/9Vj7qbdbwcUqOM6dn9CwDVZrp2HXUxPUlfhE4gcH6NJycBQWstGFqLUb/yXkrIwE2pc2n0Vf3lbq8nJyEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvmPeKrn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvmPeKrn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E53AC19425
	for <devicetree-spec@vger.kernel.org>; Tue,  2 Dec 2025 23:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764717408;
	bh=73gj/hMYyPPC6pUaSwtP2vWY0sFe8jEPmZXl/KtFSWM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qvmPeKrn2Gq7hU7je8RiJMvClbjKsLaImFuYAHBNX+jVxvuewh/GkwtuBbMQ3CNV5
	 p2HvxY6XJ/QiOpYxZTu6wF6u9n+7U7SevqtdQrd/hf98wDrl4aVG7f6QPbcvldsGq7
	 tfUkDHr9/OVtm8WO+98TsKUV3Y4rT3DnxfXmokHyy3Wjh3RQM4hWyW7bC4AA03NE39
	 vmnw89PeNIGlk+lFMvdRtSnCmX/U3Beiw+cQFM6MdDU9+FXd/0vWDXVyW5xtqUNlqg
	 aJTRztm1oc1NoQSJR109SFGfZFrGfnNliaLV0+NPzegezG19LqPG3265S1crVDITE1
	 0ATnjajRX0l6Q==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so9970334a12.1
        for <devicetree-spec@vger.kernel.org>; Tue, 02 Dec 2025 15:16:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVF2wFA53C89/4sgQAU9KFjbvAUPVEoiOoWoTQI4JbZF0Y7J5fTvzS5QnG4S9bmgVlQ/SjnWGJBb1VrGUa9O2k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+W9vXNKdmQm5xtPtFPKqv+wCAWk27H+X0GwgH3RIUEY9ISfQd
	RbHYmxk3mKEuvID/dLRBFfI2AX1C9bBJXVjQuBMfwB9mJ6NMdPyNi9aU8NqM+dNmWtFMEG7j82G
	bZ66EB4i+cv/cmTRBq1rTvZbjHvMShg==
X-Google-Smtp-Source: AGHT+IF2w4KiKuKTA29sK8gYXJZDFRujuwfLeSLhIDKQfP25Hu0pVCozW39ZiIEPEtrmRjepDfxpvt6P0O1AulAuoHc=
X-Received: by 2002:a05:6402:50cc:b0:640:e75a:f95d with SMTP id
 4fb4d7f45d1cf-6479c4822e2mr88119a12.15.1764717406701; Tue, 02 Dec 2025
 15:16:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <aS66WcLPm6e5rdyk@shell.armlinux.org.uk>
In-Reply-To: <aS66WcLPm6e5rdyk@shell.armlinux.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Dec 2025 17:16:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLxLakt94ACgv8z5A-O4WGZPfiZ-7UFaBPaOa7W8L3Cxw@mail.gmail.com>
X-Gm-Features: AWmQ_bmj727TPR_OPMEUDsTOZnYmXNt_Vw9MKoaVj3IgJ9mOrtxgOcritfB3iLE
Message-ID: <CAL_JsqLxLakt94ACgv8z5A-O4WGZPfiZ-7UFaBPaOa7W8L3Cxw@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Doug Anderson <dianders@chromium.org>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2025 at 4:07=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Nov 18, 2025 at 02:43:20PM -0800, Doug Anderson wrote:
> > This is a continuation of the discussion that started in reply to my
> > patch adding basic device trees for Pixel 10 phones [1].
> >
> >
> > Problem statement:
> > ------------------
> >
> > We would like an officially accepted scheme that lets us more
> > efficiently ship compiled device trees for a handful of related
> > products by breaking the device trees up into a common "base" device
> > tree and then applying "overlay" device trees atop the base to make a
> > full and complete device tree.
> >
> > To make it more concrete, we'd like to build a "base" device tree that
> > describes a SoC and then have the overlays be enough to make a full
> > description of a board. In theory, one could also imagine wanting to
> > expand this to 3 or more levels (perhaps SoC, baseboard, derived
> > boards), though this is not planned at this time.
> >
> > The primary reason for wanting to break device trees like this is
> > efficiency of the shipped binary device trees. A large portion of a
> > final device tree just describes the SoC. We save space in the final
> > compiled device trees if they don't need to contain as much duplicated
> > information.
>
> Having worked on the SolidRun i.MX6 platforms, I agree with this.
> Within these platforms there are:
>
> SoC     SOM             Platform
> imx6dl  pre-v1.5        cubox
> imx6q   v1.5            hummingboard
>         v1.5 + emmc     hummingboard2
>
> On top of these, I have specific "user" extensions for hardware that
> I've connected - e.g.
> - the NoIR RPi camera needs DT modification.
> - for monitoring a mechanical church clock, a "gps" variant that
>   allowed PPS to be used with a GPIO pin, and a "capture" variant
>   that configured the hardware to allow precise event stamping.
> - 1-wire, for ds18b20 temperature sensors.
>
> Without the user extensions, this adds up to 18 DTB files:
> arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts
> arch/arm/boot/dts/nxp/imx/imx6q-cubox-i-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-cubox-i-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-cubox-i.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts
>
> basically, every combination needs to be enumerated. So, having two SoC
> dt files, three for the SOM, and three for the platform that the boot
> loader combines would significantly cut this down - to 8.
>
> However, it isn't that simple. For example, when the Hummingboard2 is
> used with the iMX6Q SoC, there's a SATA device present in the SoC level
> that needs Hummingboard2 specific properties to tune the signal
> waveform. However, iMX6DL doesn't have this SATA device in silicon, so
> the node doesn't exist in the base SoC DT file. The situation is the
> same for Hummingboard, but the tuning parameters, being board specific,
> are different.

If that is a separate overlay fragment (i.e. not under another node in
the overlay), we could solve this by having some way to mark the
fragment as optional. Apply it if the base node is present, but don't
fail if not. Could be a need for this without overlays as well.
Something like this:

#include <soc.dtsi>

/optional/ &sata {
  foo =3D <0>;
};

Normally if 'sata' isn't found, that's an error.

To make that work for overlays, we'd have to transform /optional/ into
a property. "target-optional" alongside "target-path" perhaps.

> This means is that there are DT properties that are dependent on the
> SoC DT component and the platform DT component which do not fit with
> splitting the DT files into their individual "component" levels.
>
> The other issue would be the /model property - for example:
>
>         model =3D "SolidRun HummingBoard2 Solo/DualLite";
>         model =3D "SolidRun HummingBoard2 Solo/DualLite (1.5som+emmc)";
>         model =3D "SolidRun HummingBoard2 Solo/DualLite (1.5som)";
>         model =3D "SolidRun HummingBoard Solo/DualLite";
>         model =3D "SolidRun HummingBoard2 Dual/Quad";
>         model =3D "SolidRun Cubox-i Solo/DualLite";

I think you just give up and generalize it: "SolidRun HummingBoard/Cubox"


> as a set of examples. I don't see a clear way to generate these from
> a fragmented scheme. There's a similar problem with the board-level
> compatible:
>
>         compatible =3D "solidrun,cubox-i/dl", "fsl,imx6dl";
>         compatible =3D "solidrun,hummingboard2/dl", "fsl,imx6dl";
>         compatible =3D "solidrun,hummingboard/dl", "fsl,imx6dl";
>         compatible =3D "solidrun,hummingboard2/q", "fsl,imx6q";
>
> These don't include the SoM information.

So we're back to needing to merge compatible even though Doug was
willing to drop it. Or to put it another way, there's usecases for the
base to be different SoC revisions and variants. So I don't think we
should give up on solving that.

> Maybe what would work would be a high-level DT file that contains
> paths to the lower levels that need to be combined, along with
> properties that need to be merged. E.g.
>
> / {
>         model =3D "SolidRun HummingBoard2 Dual/Quad";
>         compatible =3D "solidrun,hummingboard2/q", "fsl,imx6q";
>
>         dts-components {
>                 compatible =3D "boot/dt";
>
>                 component@1 {
>                         compatible =3D "dt";
>                         path =3D "imx6q.dtbo";
>                 };
>
>                 component@2 {
>                         compatible =3D "dt";
>                         path =3D "imx6qdl-sr-som-v1.5.dtbo";
>                 };
>
>                 component@3 {
>                         compatible =3D "dt";
>                         path =3D "imx6qdl-hummingboard2.dtbo";
>                 };
>
>                 component@4 {
>                         compatible =3D "dt";
>                         path =3D "imx6ql-hummingboard2-emmc.dtbo";
>                 };
>         };
>
>         soc {
>                 sata@2200000 {
>                         .. sata tuning properties ..
>                 };
>         };
> };
>
> Or something similar. However, this would mean we would still need the
> 18 or so top level DT files, but also each component as well, which
> will increase the number of files we're having to manage on a target
> platform - so I'm wondering whether it's worth it.

Looks like FIT...

> I don't think we'll be able to get away from this problem: it's likely
> that there will continue to be properties that are specific across
> several "levels" of a split DT setup, and apart from something like the
> above, I don't really see a way to handle them.

I tend to agree your cases might be the tip of the iceberg. I think
someone has to take some existing platforms and see what happens
splitting them.

> I also don't see a sensible way without something like the above for a
> boot loader to know the filenames of each of the components for a
> platform - and it would need to be told the order to glue those
> components together.

We've generally resisted making filenames significant/ABI.

Rob
