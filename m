From: Francois Ozog <francois.ozog-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Device Tree Evolution Project - call notes - 29th January
Date: Wed, 12 Feb 2020 15:54:29 +0100
Message-ID: <CAHFG_=VHWvJvroBJepfo9XH-DRuMjhzCcUYEb98MspeGMy_s0A@mail.gmail.com>
References: <20200130135605.GQ3697@linaro.org> <3b257f2a0ccc4f9f9ca0be2de8c9e382@ti.com>
 <CAL_JsqLNHi0ac0E5k9-355vS_GObz7Tu5Av2FLKZ6b-1wjm1Jw@mail.gmail.com> <36cb9cd4-542e-c8da-9615-f26d6ee3e44e@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vpk9hZ4VflwuyXGNbL00FfFstZt3AoL1PQTMwcCORXU=;
        b=qH4OU6qhhKrtqQgCiz3jy3UhY6RuEUzgiHYTA5Eck0/qNzgTPCg3e/TSOfVsRX6xDm
         mqbM1L5AUWiTLNfBE6eWINp3IBP1/zfyuKuzlvgXymmG9naNjsjJfLuPJk8Ct6/3etLv
         s6qkNY66tjlr4jaJFKp4peAScMJy4D+58iYqlwKDpicFCYn+CBu8mnNBnQzJ7bVQqTki
         4fYb2EV415eIHKdIUeK5oYdUd4IX8UuW4BmweBcmD6OnZFUcEBWYCP/NRvvO6RpfHJq6
         IIu4I9eDnZqxZqctefWRprgK68E8MP6ndrW8u05RfAU9xr/5Tm0C7x/Ep0Tt07lxIStI
         MMUg==
In-Reply-To: <36cb9cd4-542e-c8da-9615-f26d6ee3e44e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Mills, William" <wmills-l0cyMroinI0@public.gmane.org>, Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Kristo, Tero" <t-kristo-l0cyMroinI0@public.gmane.org>, "Valkeinen, Tomi" <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, "Murphy, Dan" <dmurphy-l0cyMroinI0@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org" <tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

On Wed, 12 Feb 2020 at 03:49, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On 2/11/20 10:31 AM, Rob Herring wrote:
> > On Mon, Feb 10, 2020 at 10:58 AM Mills, William <wmills-l0cyMroinI0@public.gmane.org> wrote:
> >>
> >> Steve,
> >>
> >> Can TI get on the agenda for this week's meeting?
> >>
> >> We have a simple approach to make progress on boot loader applied overlays.
> >> It is a small repo with just the overlays.
> >> It builds the dtb's from the upstream kernel repo and the overlays from this repo.
> >> We are going to do this at git.ti.com so we can make progress.
> >> However we would like to suggest this as a simple way forward to collectively host things the kernel maintainers do not want in the kernel.
> >
> > For the record, I'm in favor of hosting overlays in the kernel (of
> > course I have opinions on the details). Frank is not in favor IIRC,
> > but Frank is only maintainer of 'drivers/of/' so ultimately not his
> > decision.
>
> I agree that the kernel is the place to host overlay sources.
>

I would like to fully understand the *why* overlays before diving in the *how*.
Even if addressed in previous calls or meeting minutes: it may be good
to restate the use cases in the mail thread.
Here are the ones I have been exposed to:

1) static hypervisor partitioning
Some devices of the board may be under the control of an RTOS or even
a bare metal app in a partition while most devices are under a Linux
partition
Hypervisor could be Xen, VMWare ESXi, Hafnium, Jailhouse.

2) driver isolation from main OS
A kernel may run "driver-less" and have devices handled in isolated
domains or VMs.
Reasons for that many not be just about security but abstraction for instance.

3) conditional parameters or device access
Presence or Absence of OPTEE memory reservation is not an operating
system selection.
We may want to boot the same image regardless if OPTEE is activated or not.
If we want to have embedded systems as easy as servers, we do not want
to have a fixed assumption by
distros providers. Boot loader can properly "decorate" the DT with
memory reservations if OPTEE present.
In addition, OPTEE could vouch for certain device access. It can give
actual device access to kernel if validated.
The BAR(s) may be actually be controlled by OPTEE.
(2) and (3) may be combined

4) Lego-style hardware
hardware may come in pieces that are assembled at different moment of
the product lifecycle:
- dev board extensions with capes
- composable products such as Insta360 configurable camara (or defunct
Google project ARA)
The running platform DT can only be a composition DTs either at runtime.

5) other cases?

Let's not talk about (4) for the moment. Are there other cases?

(1), (2) and (3) is all about correct chopping of a platform DT into
meaningful and self-contained pieces.
It is mandatory that, when fully assembled, it is a coherent and
compliant entity that the kernel can use.
Linux kernel should assume all devices for itself and hence all dtso
should be present in the kernel for this "end-to-end" case.

Now the origin of the pieces may be "upstream", meaning the Linux
kernel would pull all pieces and assemble all of them at normal
compilation time.
Other components (bootloader, TEE, hypervisor, RTOS) can pull the
dtsos and assemble them in different ways.
The good thing is that slices are known a-priori. An OS driver making
use of a DT element not in a single dtso may end-up having issues if
used in (1) for instance.

Those other components could "refer" to Linux kernel source for dtso
origin. But it looks strange as the DT is describing hardware, not a
Linux component...

To conclude:
- dtso are in a single multi-vendor repo
- Linux pull them all and assemble them all so that it validates the
end-to-end schema. drivers shall only deal with single dtso.
- other OSes, bootloaders, hypervisors, TEE pull them and assemble
them as they please
- Linux receives the actual DT from whatever component loads it and
know that the DT it deals with is made of the dtso it already knows
and for which the drivers have been verified


> -Frank
>
> >
> >> Does it make sense to host something like this in devicetree.org github account?
> >
> > Yes, but I would like to see this coordinated with hosting
> > 'devicetree-rebasing' there. We should be able to use the same
> > makefiles from it. Perhaps the overlay repo should work as a git
> > submodule of it as well. That would help keep things in sync.
> >
> > A concern I have is what happens when someone wants to split some
> > portions of an existing dts into an overlay? Then the base dts becomes
> > incomplete. Users will have regressions from missing functionality if
> > they don't know to apply some overlay. And how do we track what base
> > DTs overlays apply to? Not that we have a solution when they are in
> > one tree, but 2 trees makes that harder.
> >
> > Rob
> >
>
>
