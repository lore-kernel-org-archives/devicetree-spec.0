From: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Device Tree Evolution Project - call notes - 29th January
Date: Mon, 10 Feb 2020 17:51:44 +0000
Message-ID: <ea867eb4-beb4-4749-b7cc-632895bcd5ab@arm.com>
References: <20200130135605.GQ3697@linaro.org>
 <3b257f2a0ccc4f9f9ca0be2de8c9e382@ti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Qzs/lL0peLT1fd6WNBJeMEHDmq8ktRN4thJgWiNh9Y=;
 b=VpVsDJJAP2kjj7TQrl/uwVaxdQlzt35X3blATcfYq/zDBPx+F+WVGUX1ReBgm9Vz3lMC5cgV4PhwxsfPij0WblUgoV+gAAB3lxviWBv98/4F2aRCLuHlP7kWZ84NJYn8wSr2McVcp6UO+SBi5G6jUbM3joktKIQwE1dZK5hVA1Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Qzs/lL0peLT1fd6WNBJeMEHDmq8ktRN4thJgWiNh9Y=;
 b=VpVsDJJAP2kjj7TQrl/uwVaxdQlzt35X3blATcfYq/zDBPx+F+WVGUX1ReBgm9Vz3lMC5cgV4PhwxsfPij0WblUgoV+gAAB3lxviWBv98/4F2aRCLuHlP7kWZ84NJYn8wSr2McVcp6UO+SBi5G6jUbM3joktKIQwE1dZK5hVA1Y=
In-Reply-To: <3b257f2a0ccc4f9f9ca0be2de8c9e382-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "Mills, William" <wmills-l0cyMroinI0@public.gmane.org>, Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Kristo, Tero" <t-kristo-l0cyMroinI0@public.gmane.org>, "Valkeinen, Tomi" <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, "Murphy, Dan" <dmurphy-l0cyMroinI0@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org" <tom.rini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>



On 10/02/2020 16:58, 'Mills, William' via dte-all wrote:
> Steve,
>
> Can TI get on the agenda for this week's meeting?
>
> We have a simple approach to make progress on boot loader applied overlay=
s.
> It is a small repo with just the overlays.
> It builds the dtb's from the upstream kernel repo and the overlays from t=
his repo.
> We are going to do this at git.ti.com so we can make progress.
> However we would like to suggest this as a simple way forward to collecti=
vely host things the kernel maintainers do not want in the kernel.
> Does it make sense to host something like this in devicetree.org github a=
ccount?

Possibly. Do you want a test repo on github.com/devicetree prior to the
meeting? What would you call it?

g.

>
> I think this is a very reasonable way forward and more practical than:
> * moving all DT's out of the kernel (or sync'ing two homes etc)
> * reworking overlay support to be the "one final good way"
> * everyone keeping this stuff in their own vendor trees, each doing somet=
hing different and generating N solutions
>
> We will push the repo somewhere public before the meeting.
>
> (CC'ing Tom and Tony does not constituent their endorsement, we are start=
ing to talk with them now also)
>
> Bill
>
> -----Original Message-----
> From: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:devicetree-spec-owner=
@vger.kernel.org] On Behalf Of Steve McIntyre
> Sent: Thursday, January 30, 2020 8:56 AM
> To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
> Subject: Device Tree Evolution Project - call notes - 29th January
>
> Hi folks!
>
> I'm sharing the notes from our regular meeting that was held
> yesterday. We had updates around several of our initiatives,
> particularly around System DT and runtime identification of DTB.
>
> More details about the meeting etc. at the end.
>
> Attendees
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> SteveM - Arm
> GrantL - Arm
> MarkB - Arm
> RobH - Arm
> AlexandreT - ST
> BenjaminG - ST
> EricF - ST
> Lo=C3=AFcP - ST
> BillM - TI
> FrankR - ??
> BruceA - Xilinx
> StefanoS - Xilinx
> MathieuP - Linaro
> BillF - Linaro
> KumarG - Linaro
> VincentG - Linaro
> TrilokS - Qualcomm
>
> Notes
> =3D=3D=3D=3D=3D
>
> 1. DTE-18 - DTB runtime ID
>     a. Alexandre posted patches, went through review
>     b. v2 coming soon
>        1. Don't modify DTC directly, but tweak how things are built
>           slightly
>        2. ETA? maybe 3w
>
> 2. DTE-19 - working out what's changed since the DTB build
>     a. Time to talk on the list to see how to do this best
>        1. Checksum per node, one of 2 ways:
>           a. Modify the sources to include the checksum?
>           b. Update the DTB format to add support directly?
>        2. Discuss on-list
>
> 3. DTE-17: Arnd's prototype work for external DT repo
>     a. Status update? No Arnd this week, so not this time
>     b. Not everybody will be at FOSDEM or the Arm kernel summit in
>        Cambridge, so limited scope for discussion about this
>     c. SM will try to organise something for Cambridge next week
>
> 4. DTE-2: System DT
>     a. Adding spec for new bindings is ok, but need to add more
>        explanation of how things should be used (e.g. how to map
>        interrupts to multiple domains, multiple controllers)
>     b. Stefano promises more docs soon to describe things
>     c. ETA for having a working demo?
>        1. Will change again before it heads upstream
>        2. Things work ok for a demo already! :-)
>        3. Just needs more docs to describe
>
> 5. DTE-8: DTB lifecycle
>     a. Trying to get LEDGE group working on this, working on planning
>        meetings for next week
>     b. Interested parties - please say so and we'll try and include you
>        too
>     c. Specifically thinking about bootloader-applied overlays, not
>        dynamic stuff applied by kernel at runtime
>     d. TI really looking for a collaboration space here
>     e. ST interested in U-Boot starting with one DT, then applying an
>        overlay before passing it to kernel
>        1. Source-level problem here - whey do we have two different
>           (almost-complete) DTs in both U-Boot and Linux?
>        2. DTE-17 could help here
>
> 6. Meetings at BUD20 Connect?
>     a. Let Steve know about availability and what you'd like to talk
>        about
>     b. Sessions in the BUD20 schedule:
>        1. Thu 11:00: System DT
>        2. Mon 15:30: New approach to dynamically manage hardware bus
>           firewalls
>
> 7. Linux on Arm summit in Cambridge next week
>     a. Some of our group will be around and may have some informal
>        discussion
>     b. Not a formal DT sprint!
>
>
> Background information about DTE
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
> Linaro engineers are working on a range of initiatives in the DT
> space, collected together as a project called Device Tree Evolution
> (DTE). We hold a discussion call every second Wednesday at
> 1700 GMT / 1200 EST / 0900 PST. If you would like to be invited, please
> ask me (Steve McIntyre).
>
> This is a summary of the notes from the most recent meeting. I aim to
> tidy up and post the meeting notes shortly after each meeting. The raw
> notes are published at
>
> https://docs.google.com/document/d/e/2PACX-1vRVDrVFWjIOascqZFCO--T8pIqyFB=
_MDh9cvgyoqhI6Y0tqaA9TcCcvQhcmxi5IY7CG44JfIrCdAUDL/pub
>
> For more information about DTE, see:
>
>   * https://www.linaro.org/engineering/core/devicetree-evolution/
>   * https://www.linaro.org/assets/pdf/Linaro-White-Paper--Device-Tree-Evo=
lution.pdf
>
> Cheers,
>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
