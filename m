From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Device Tree Evolution Project - call notes - 29th January
Date: Tue, 11 Feb 2020 15:53:24 -0600
Message-ID: <CAL_JsqKR5RC+B-vjY3a5pyBnGBgXianh3FPLvfTm9m5p8WUKxA@mail.gmail.com>
References: <20200130135605.GQ3697@linaro.org> <3b257f2a0ccc4f9f9ca0be2de8c9e382@ti.com>
 <CAL_JsqLNHi0ac0E5k9-355vS_GObz7Tu5Av2FLKZ6b-1wjm1Jw@mail.gmail.com> <CAHFG_=UhJzrBqZy1+-Jm0uKaCN+SMgXKryWG17xN=29s1W2Umw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581458016;
        bh=bTO/6yZJJTGAQas69YMnws1NG76Cm+7l6nz9+O21x90=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MY4LJ9QChpBK77QtGO4s3kUcRXRnKNUR8MQHCETYiNammk7ZeWOtHdnqkgBsD3i8h
         YxH1Ed1b73uYCs7CotvOaQ3ILMXRXVrJChP7ME3K1q1o4iYDaP9GjHSzgBIxREqM2L
         v8fUweuY9M1jkMdBt/5L8dwdkBZcuYYmIPwEif6s=
In-Reply-To: <CAHFG_=UhJzrBqZy1+-Jm0uKaCN+SMgXKryWG17xN=29s1W2Umw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois Ozog <francois.ozog-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "Mills, William" <wmills-l0cyMroinI0@public.gmane.org>, Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Kristo, Tero" <t-kristo-l0cyMroinI0@public.gmane.org>, "Valkeinen, Tomi" <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, "Murphy, Dan" <dmurphy-l0cyMroinI0@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org" <tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

On Tue, Feb 11, 2020 at 11:44 AM Francois Ozog <francois.ozog-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> On Tue, 11 Feb 2020 at 17:32, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > On Mon, Feb 10, 2020 at 10:58 AM Mills, William <wmills-l0cyMroinI0@public.gmane.org> wrote:
> > >
> > > Steve,
> > >
> > > Can TI get on the agenda for this week's meeting?
> > >
> > > We have a simple approach to make progress on boot loader applied overlays.
> > > It is a small repo with just the overlays.
> > > It builds the dtb's from the upstream kernel repo and the overlays from this repo.
> > > We are going to do this at git.ti.com so we can make progress.
> > > However we would like to suggest this as a simple way forward to collectively host things the kernel maintainers do not want in the kernel.
> >
> > For the record, I'm in favor of hosting overlays in the kernel (of
> > course I have opinions on the details). Frank is not in favor IIRC,
> > but Frank is only maintainer of 'drivers/of/' so ultimately not his
> > decision.
> >
> > > Does it make sense to host something like this in devicetree.org github account?
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
>
> DT lifecycle shall be selectable by the board vendor. If, for any reason
> (and there may be plenty), a vendor believes it is a better organization to
> handle the DT assembly (static + overlays) outside the kernel, then it
> should be possible to do so.

Certainly, I don't think I said anything that would prevent that. In
that case, I would assume the board is not already upstream and
there's not any backwards compatibility (ABI) to worry about. I'm only
talking about cases where the split is changed such that we go from a
monolithic dtb to a base dtb plus 1 or more overlay dtbs. IOW, we
can't just change the split because that is an ABI. We still need to
build and provide that original single dtb. There may be exceptions to
that, but by default I have to care about backwards compatibility (and
overlays add a new dimension to that). I suppose we could decide that
a collection of base and overlay DTs are a monolithic unit and there
is no ABI between them. However, we'd need to define some way to
distinguish both cases. It's plausible that you'd want to do both on
the same platform (base and overlay dtbs from the board vendor and 3rd
party overlays).

Besides the above reason, there is something much more basic. We need
build time assembly of base plus overlays just to validate overlays
apply successfully. We don't want the only way to check an overlay
applies is by booting the specific board that works with a given base
and overlay dtb. Whether overlays apply or not is just the first step
in validation. There's all the schema validation to do which is going
to have its own issues.

Rob
