From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Device Tree Evolution Project - call notes - 29th January
Date: Tue, 11 Feb 2020 08:37:29 -0800
Message-ID: <20200211163729.GA16391@atomide.com>
References: <20200130135605.GQ3697@linaro.org>
 <3b257f2a0ccc4f9f9ca0be2de8c9e382@ti.com>
 <CAL_JsqLNHi0ac0E5k9-355vS_GObz7Tu5Av2FLKZ6b-1wjm1Jw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLNHi0ac0E5k9-355vS_GObz7Tu5Av2FLKZ6b-1wjm1Jw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "Mills, William" <wmills-l0cyMroinI0@public.gmane.org>, Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Kristo, Tero" <t-kristo-l0cyMroinI0@public.gmane.org>, "Valkeinen, Tomi" <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, "Murphy, Dan" <dmurphy-l0cyMroinI0@public.gmane.org>, "tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org" <tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

* Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> [200211 16:33]:
> On Mon, Feb 10, 2020 at 10:58 AM Mills, William <wmills-l0cyMroinI0@public.gmane.org> wrote:
> >
> > Steve,
> >
> > Can TI get on the agenda for this week's meeting?
> >
> > We have a simple approach to make progress on boot loader applied overlays.
> > It is a small repo with just the overlays.
> > It builds the dtb's from the upstream kernel repo and the overlays from this repo.
> > We are going to do this at git.ti.com so we can make progress.
> > However we would like to suggest this as a simple way forward to collectively host things the kernel maintainers do not want in the kernel.
> 
> For the record, I'm in favor of hosting overlays in the kernel (of
> course I have opinions on the details). Frank is not in favor IIRC,
> but Frank is only maintainer of 'drivers/of/' so ultimately not his
> decision.

I agree, having them all together would be best. AFAIK the only
issue for that earlier was people did not want dangling dts files
that could not be checked and compiled. Sounds like that part has
been now taken care of.

> > Does it make sense to host something like this in devicetree.org github account?
> 
> Yes, but I would like to see this coordinated with hosting
> 'devicetree-rebasing' there. We should be able to use the same
> makefiles from it. Perhaps the overlay repo should work as a git
> submodule of it as well. That would help keep things in sync.
> 
> A concern I have is what happens when someone wants to split some
> portions of an existing dts into an overlay? Then the base dts becomes
> incomplete. Users will have regressions from missing functionality if
> they don't know to apply some overlay. And how do we track what base
> DTs overlays apply to? Not that we have a solution when they are in
> one tree, but 2 trees makes that harder.

Yeah good point.

Regards,

Tony
