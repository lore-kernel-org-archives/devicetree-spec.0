From: William Mills <wmills-l0cyMroinI0@public.gmane.org>
Subject: Re: Device Tree Evolution Project - call notes - 29th January
Date: Tue, 11 Feb 2020 19:27:54 -0500
Message-ID: <e4e99060-2278-0888-2eac-dd5c1c043784@ti.com>
References: <20200130135605.GQ3697@linaro.org>
 <3b257f2a0ccc4f9f9ca0be2de8c9e382@ti.com>
 <CAL_JsqLNHi0ac0E5k9-355vS_GObz7Tu5Av2FLKZ6b-1wjm1Jw@mail.gmail.com>
 <CAHFG_=UhJzrBqZy1+-Jm0uKaCN+SMgXKryWG17xN=29s1W2Umw@mail.gmail.com>
 <CAL_JsqKR5RC+B-vjY3a5pyBnGBgXianh3FPLvfTm9m5p8WUKxA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581467275;
        bh=cjmsGQe6N+FZhA1YCDkudCwqBLYp9eTTP4ybe6gZHrE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=g2azBVCkc9hKOiK6/6Xj5N/cAbGoMaPVD66emNlNCIqa4wgzAspxGwUq1FYfBP9+E
         RyJ+Di8i54npwnnT+H01GhHnic/hURR2aBrLBb2bp0+EpLawFnxQdEkRJ4hI3FxB7V
         jXPi8CJzohDf84rn49kqg2SISB0ZsuAQZccplSsU=
In-Reply-To: <CAL_JsqKR5RC+B-vjY3a5pyBnGBgXianh3FPLvfTm9m5p8WUKxA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Francois Ozog <francois.ozog-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Kristo, Tero" <t-kristo-l0cyMroinI0@public.gmane.org>, "Valkeinen, Tomi" <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, "Murphy, Dan" <dmurphy-l0cyMroinI0@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org" <tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>



On 2/11/20 4:53 PM, Rob Herring wrote:
> On Tue, Feb 11, 2020 at 11:44 AM Francois Ozog <francois.ozog-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>
>> On Tue, 11 Feb 2020 at 17:32, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>
>>> On Mon, Feb 10, 2020 at 10:58 AM Mills, William <wmills-l0cyMroinI0@public.gmane.org> wrote:
>>>>
>>>> Steve,
>>>>
>>>> Can TI get on the agenda for this week's meeting?
>>>>
>>>> We have a simple approach to make progress on boot loader applied overlays.
>>>> It is a small repo with just the overlays.
>>>> It builds the dtb's from the upstream kernel repo and the overlays from this repo.
>>>> We are going to do this at git.ti.com so we can make progress.
>>>> However we would like to suggest this as a simple way forward to collectively host things the kernel maintainers do not want in the kernel.
>>>
>>> For the record, I'm in favor of hosting overlays in the kernel (of
>>> course I have opinions on the details). Frank is not in favor IIRC,
>>> but Frank is only maintainer of 'drivers/of/' so ultimately not his
>>> decision.
>>>
>>>> Does it make sense to host something like this in devicetree.org github account?
>>>
>>> Yes, but I would like to see this coordinated with hosting
>>> 'devicetree-rebasing' there. We should be able to use the same
>>> makefiles from it. Perhaps the overlay repo should work as a git
>>> submodule of it as well. That would help keep things in sync.
>>>

ACK on that.  Lots of good points raised in this thread. (I guess I
should not have recycled the subject line :)

I promised to publish so this is what we have so far:
https://github.com/wmamills/dt-overlays

Bill

>>> A concern I have is what happens when someone wants to split some
>>> portions of an existing dts into an overlay? Then the base dts becomes
>>> incomplete. Users will have regressions from missing functionality if
>>> they don't know to apply some overlay. And how do we track what base
>>> DTs overlays apply to? Not that we have a solution when they are in
>>> one tree, but 2 trees makes that harder.
>>
>> DT lifecycle shall be selectable by the board vendor. If, for any reason
>> (and there may be plenty), a vendor believes it is a better organization to
>> handle the DT assembly (static + overlays) outside the kernel, then it
>> should be possible to do so.
> 
> Certainly, I don't think I said anything that would prevent that. In
> that case, I would assume the board is not already upstream and
> there's not any backwards compatibility (ABI) to worry about. I'm only
> talking about cases where the split is changed such that we go from a
> monolithic dtb to a base dtb plus 1 or more overlay dtbs. IOW, we
> can't just change the split because that is an ABI. We still need to
> build and provide that original single dtb. There may be exceptions to
> that, but by default I have to care about backwards compatibility (and
> overlays add a new dimension to that). I suppose we could decide that
> a collection of base and overlay DTs are a monolithic unit and there
> is no ABI between them. However, we'd need to define some way to
> distinguish both cases. It's plausible that you'd want to do both on
> the same platform (base and overlay dtbs from the board vendor and 3rd
> party overlays).
> 
> Besides the above reason, there is something much more basic. We need
> build time assembly of base plus overlays just to validate overlays
> apply successfully. We don't want the only way to check an overlay
> applies is by booting the specific board that works with a given base
> and overlay dtb. Whether overlays apply or not is just the first step
> in validation. There's all the schema validation to do which is going
> to have its own issues.
> 
> Rob
> 
