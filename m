From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Device Tree Evolution Project - call notes - 29th January
Date: Tue, 11 Feb 2020 10:31:52 -0600
Message-ID: <CAL_JsqLNHi0ac0E5k9-355vS_GObz7Tu5Av2FLKZ6b-1wjm1Jw@mail.gmail.com>
References: <20200130135605.GQ3697@linaro.org> <3b257f2a0ccc4f9f9ca0be2de8c9e382@ti.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581438725;
        bh=eEq/9n9THfP0H6Vh7fXk8JeklCb56tDElEd5VDulLpM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gt6uyKEHLhPaPU87QkgxPUuq+dWnogFzRVQm0P3v5S1ajgcKh5LgF2dIcHABvgGR7
         wH5o+KkXhrzQ4CIOvn5pylNdCVUxAt3jzj8gFWs25CiLNoNL0TmboLyRIjAJubTsk0
         dvRrWEhOcuW7aW+NJSpyLqfI0GLjsoKYzWYc3oos=
In-Reply-To: <3b257f2a0ccc4f9f9ca0be2de8c9e382-l0cyMroinI0@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mills, William" <wmills-l0cyMroinI0@public.gmane.org>
Cc: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Kristo, Tero" <t-kristo-l0cyMroinI0@public.gmane.org>, "Valkeinen, Tomi" <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, "Murphy, Dan" <dmurphy-l0cyMroinI0@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org" <tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

On Mon, Feb 10, 2020 at 10:58 AM Mills, William <wmills-l0cyMroinI0@public.gmane.org> wrote:
>
> Steve,
>
> Can TI get on the agenda for this week's meeting?
>
> We have a simple approach to make progress on boot loader applied overlays.
> It is a small repo with just the overlays.
> It builds the dtb's from the upstream kernel repo and the overlays from this repo.
> We are going to do this at git.ti.com so we can make progress.
> However we would like to suggest this as a simple way forward to collectively host things the kernel maintainers do not want in the kernel.

For the record, I'm in favor of hosting overlays in the kernel (of
course I have opinions on the details). Frank is not in favor IIRC,
but Frank is only maintainer of 'drivers/of/' so ultimately not his
decision.

> Does it make sense to host something like this in devicetree.org github account?

Yes, but I would like to see this coordinated with hosting
'devicetree-rebasing' there. We should be able to use the same
makefiles from it. Perhaps the overlay repo should work as a git
submodule of it as well. That would help keep things in sync.

A concern I have is what happens when someone wants to split some
portions of an existing dts into an overlay? Then the base dts becomes
incomplete. Users will have regressions from missing functionality if
they don't know to apply some overlay. And how do we track what base
DTs overlays apply to? Not that we have a solution when they are in
one tree, but 2 trees makes that harder.

Rob
