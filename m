From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague (26
 Oct 2017)
Date: Thu, 19 Oct 2017 11:46:04 -0700
Message-ID: <59E8F2EC.5090602@gmail.com>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <20171017114823.58476908@bbrezillon>
 <CAGb2v67GU4uW7uPMrqFjTW0qBR6LPNeX4Md+tf9S=HRWT_GVqA@mail.gmail.com>
 <20171018110958.mh76pngzluazmc7y@sirena.co.uk>
 <20171018175910.GP12015@bill-the-cat>
 <FD387FCC-3F95-48DF-B412-3384EF96FCFC@fubar.geek.nz>
 <CAL_JsqJTE5p0zjm-66D2143dEx+xQ0uKCV-20kMt-kq=SOa-8Q@mail.gmail.com>
 <23a238d7-0b3d-8b46-b2fe-88b9d0841aa1@st.com>
 <CAL_Jsq+p=-yTY4BNKXdSccPcBWsCUkP8HPQ-ergZXPB8msY5ig@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=55a5B5KihDU9BSislRdZA4N6aolesPBYYqxoM/u9XUw=;
        b=EidHQoFYU3Esk3WRXw1FNypQZTjXzROx/ZElY0eIoZCiQCGKTO2GsSn1G5FCIvEJXW
         Y2cdVnSdhrxlOLFMVlWEL5yx7pi3rpVbiAZZYJb6oiS6G1QVDb8DZExi1AEgt/UXNqPK
         W3u+v2uVhfESsl+6DtllDyr2G1TwxE5OGbDUch5c8RXl0DRBy63DF+aVPZnehfzbj4Ur
         5dCDbVjxxDLhUjP+B+VNnSUcjec9Bto/e3+xpClgnCEifrgIzNo1NLpfCFEWQ0JLb63L
         pqjIGXs/UJMRwuoQZ5017TGebAapbdlAtia0ts8a9YW1dvggJkJh2uOYayTwEJqFRC+6
         WhtA==
In-Reply-To: <CAL_Jsq+p=-yTY4BNKXdSccPcBWsCUkP8HPQ-ergZXPB8msY5ig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Andrew Turner <andrew-/GQUgJ3qWXsIvnNNuaVxrw@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

On 10/19/17 07:59, Rob Herring wrote:
> On Thu, Oct 19, 2017 at 9:00 AM, Alexandre Torgue
> <alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
>> Hi Rob,
>>
>>
>> On 10/19/2017 01:53 AM, Rob Herring wrote:
>>> On Wed, Oct 18, 2017 at 6:28 PM, Andrew Turner <andrew-/GQUgJ3qWXsIvnNN=
uaVxrw@public.gmane.org>
>>> wrote:
>=20
> [...]
>=20
>>>>  From the FreeBSD perspective I=E2=80=99d like it if there was a commo=
n repo for
>>>> all devicetree consumers to share. We are trying to not have FreeBSD
>>>> specific properties as this has caused issues in the past where we had=
 (and
>>>> still have) FreeBSD specific dts files. We are trying to remove these =
as
>>>> drivers are updated to handle the common bindings.
>>>
>>>
>>> Are you aware of this repo[1]? I don't have a sense for how widely
>>> used it is. If not, it is intended to provide a common repository of
>>> binding docs and dts files. If so, what are your issues with using it?
>>> It's generated from the kernel tree with git-filter-branch and through
>>> the kernel tree is the only way to add things currently. But there's
>>> no requirement that you add a Linux driver to submit a binding or dts
>>> change. We could consider taking patches against the tree directly,
>>> and the maintainers (me) can fixup the paths and apply to the kernel
>>> tree.
>>>
>>> If there's bindings in the kernel tree you think are crap and Linux
>>> specific, I'd like to know that too. We should start flagging those.
>>>
>>>> I have also spoken with some NetBSD and OpenBSD developers. They are b=
oth
>>>> using devicetree to handle device enumeration. Having all 5 projects u=
sing a
>>>> common set of dts files and binding would simplify keeping them in syn=
c.
>>>
>>>
>>> There's more than 5 likely: linux, 3x BSD, u-boot, barebox, zephyr,
>>> ARM trusted firmware?, UEFI?, ?
>>
>>
>> First, sorry to come late in this discussion (please be tolerant if you
>> already respond to following requests/interrogations in precedent mails =
:)).
>> From STmicro point of view we have the same kind of requests/needs than
>> Andrew. We think about the possibility to use same DTS files for Linux,
>> U-boot, ATF and Zephir (others could come with other vendors). Currently=
 our
>> main concerns about this are:
>>
>> 1-How to reduce dtb size:
>>         --> Reading some thread, you already start this task with Nicola=
s.
>> Does it concerns only XiP system ?
>=20
> That's the main focus ATM. Nico has looked at shrinking code usage too
> such as the tty layer and scheduler, but those have faced resistance.
> We need actual products to prove the value (and that's a chicken and
> egg problem).
>=20
>>         -->For example, I want to use the same dtsi files between Linux =
and
>> U-boot. If in u-boot dts file I overload several "status" entry by
>> "disabled", is it possible that compiler doesn't build it ? And what abo=
ut
>> not used phandle ?
>=20
> You certainly could remove disabled nodes in dtc. I'm not sure how
> hard it would be to plumb into dtc. I think phandle properties are
> already only created if there's a reference to them. If that is

Yes, phandles are only created if referenced, unless compiled
for loading overlays into:

$ cat test1.dts
/dts-v1/;
/ {
	mynode: node {
	};
};
$ cat test2.dts
/dts-v1/;
/ {
	mynode: node {
		myprop =3D < &mynode >;
	};
};
$ scripts/dtc/dtx_diff test1.dts
/dts-v1/;

/ {

	mynode: node {
	};
};
$ scripts/dtc/dtx_diff test2.dts
/dts-v1/;

/ {

	mynode: node {
		myprop =3D <0x1>;
		phandle =3D <0x1>;
	};
};


If symbols are enabled for a base device tree, so that overlays
can later reference them, then all symbols generate phandles:

$ dtc -@ -O dts test1.dts
/dts-v1/;

/ {

	mynode: node {
		phandle =3D <0x1>;
	};

	__symbols__ {
		mynode =3D "/node";
	};
};

> created before you deleted nodes, then it would probably be hard to
> find and remove all of those. It would be similar to solving the
> device dependency problem. Or do you mean something like disable the
> clock controller node if there are no enabled references to it? I
> don't think we could do something like that generically and reliably.
>=20
> We did recently stop creating both "phandle" and "linux,phandle"
> properties by default in dtc, so that will save some size.
>=20
>> 2- The place of DT files (sources/scripts). I see (and clone) your
>> "devicetree-rebasing.git" tree, it's a good start point. Currently (corr=
ect
>> me  if I'm wrong) the Kernel seems to "lead" the devicetree bindings and
>> devicetree dts(i) files.
>=20
> Yes, and there's not really any changing that regardless of where
> bindings and dts files live given Linux has the broadest h/w support.
>=20
>> By using this external repo, it would be maybe
>> easier to integrate changes for other components than Linux Kernel ?
>=20
> Yes, barebox at least regularly imports it.
>=20
>> We
>> could have (per vendor), same dtsi files which describes the hardware (S=
oC +
>> board) and a extra dts files (at least at beginning) per software compon=
ents
>> to overload nodes (to disable some nodes not required (see (1)), to chan=
ge
>> bindings which are different regarding component ...).
>=20
> You mean dtsi files to disable nodes for linux, u-boot, etc. That may
> make sense for mutually exclusive things like FreeBSD vs. Linux, but
> for say u-boot, we really want u-boot and Linux (or whatever OS is
> loaded) to use the same dtb. Having different dtbs is going to
> increase your memory usage.
>=20
>> It will also allow to have all dt script / tools for all components at o=
nly
>> one place.
>>
>> Once again, sorry if I repeat things already discussed but I wanted to
>> expose what STMicro has in mind for DT. It will be a good topic to discu=
ss
>> at Prague.
>=20
> Yes, but I won't be there.
>=20
> Rob
> _______________________________________________
> Ksummit-discuss mailing list
> Ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.=
org
> https://lists.linuxfoundation.org/mailman/listinfo/ksummit-discuss
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
