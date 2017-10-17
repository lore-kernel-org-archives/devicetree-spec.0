From: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague
 (26 Oct 2017)
Date: Tue, 17 Oct 2017 10:21:16 -0600
Message-ID: <1508257276.74236.38.camel@freebsd.org>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
         <20171017114823.58476908@bbrezillon>
         <CACxGe6tPQxwzN14TZtgNhw7OOuePLJxODrn-_b4gMDGzAFEf1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6tPQxwzN14TZtgNhw7OOuePLJxODrn-_b4gMDGzAFEf1Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>

On Tue, 2017-10-17 at 14:48 +0100, Grant Likely wrote:
> On Tue, Oct 17, 2017 at 10:48 AM, Boris Brezillon
> <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >=20
> > Hello Grant,
> >=20
> > On Mon, 9 Oct 2017 21:39:51 +0100
> > Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wro=
te:
> >=20
> > >=20
> > > Kernel Summit is now just over 2 weeks away and it is time to pull
> > > together the schedule for the Devicetree workshop. Originally I
> > > planned on just an afternoon, but I've got the room for the whole day,
> > > so I've got a lot of flexibility on the schedule. Unscheduled time can
> > > be used for hacking.
> > >=20
> > > Date: 26 Oct 2017
> > > Time: 9:00am-5:30pm (Lunch from 12:30-2:30)
> > > Location: Athens room - Hilton Prague
> > >=20
> > > If you plan to attend, make sure you update your OSSunmitE/ELCE
> > > registration to include the DT Workshop (log in to access and modify
> > > your registration):
> > >=20
> > > https://www.regonline.com/register/login.aspx?eventID=3D1883377&Metho=
dId=3D0&EventsessionId=3D&Email_Address=3D&membershipID=3D
> > >=20
> > > Here is my current list of topics in no particular order, including
> > > the topic moderator:
> > >=20
> > > Runtime memory consumption (Rob Herring)
> > > Overlay maintenance plan (TBC)
> > > Stable ABI for devicetree (TBC)
> > > DT YAML encoding (Pantelis Antoniou)
> > > DT Schema format - option 1 (Pantelis Antoniou)
> > > DT Schema format - option 2 (Grant Likely)
> > > Sharing Generic bindings (TBC)
> > > devicetree.org update (Grant)
> > >=20
> > > Reply to this email if you want to propose another topic.
> > Not sure yet if I'll attend the DT workshop or not, but I thought I
> > could ask my question here because it might be of interest to someone
> > else who is attending.
> >=20
> > What happens when the DT bindings is not documented in Linux but in an
> > another project because this project was the first to use it.
> >=20
> > I had the case here http://patchwork.ozlabs.org/patch/810275/, and I'm
> > not sure what's the policy when this happens. Should we add a file
> > under Documentation/devicetree/bindings/... that points to the external
> > doc file, should we duplicate the DT bindings doc in Linux, or should
> > we just leave the bindings undocumented in the kernel tree?
> I'm going to add this as a topic. I've got my own opinion, but it
> would be better to discuss in the room because it affects maintainers.
>=20
> g.


I've run into the same thing in FreeBSD. =A0We use bindings and dts
files, exacted periodically from the linux tree and imported into ours,
for all modern arm boards/systems. =A0Several times I've created drivers
for small things like i2c RTC chips that aren't supported currently by
linux, and it's not clear to me that it's even possible to submit
bindings and dts for them back upstream without also submitting a linux
driver that uses them (which of course I'm not in a position to do).

-- Ian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
