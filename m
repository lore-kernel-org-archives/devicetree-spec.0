From: Francois Ozog <francois.ozog-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Device Tree Evolution Project - call notes - 12th February
Date: Thu, 13 Feb 2020 16:23:35 +0100
Message-ID: <CAHFG_=VNst-6+rG8gHet8LwcE0H37YXvqMub71eqcoPu3_d7Rg@mail.gmail.com>
References: <20200213145028.GR3697@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=70PZPfHiLeyrERCBC+oeJorLiXucmnvUmfVoUoTNlHA=;
        b=xfjiCLI+aafSGZAoSgXF2tF+L9Y4jp3H3ak1LGOqvEXsHXfB7HolXcaWM2/YD7EUc/
         BL+ebjIBIvhHszOwyH+wtJ+UEA/7Sup2mFkRPYMtA16Oue5qjiiZ4rRfnmTS5ydgUz4y
         YCDb8Lui7b1Proj4fqDP2dnYybIKlEV1AXVW2UWjpzCzqp3RBcfdPZGwa9Fi/ziCdURU
         PpGw59lf6EaNOSY/JrAzG6CVPZqmi/dvxF7FZV5bnEyzZ7Y0rM7LGAAXeb4pvCgyUZKE
         bPyg0w84B8FB6tMErDHaX7LE5fZ33b+Q20g5nB4YUsB+mACPyPSkt6IFdCHI0wAnEqcP
         Qrow==
In-Reply-To: <20200213145028.GR3697-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Thank you Steve for those notes as I always have conflicting calls...
Questions below.
FF


On Thu, 13 Feb 2020 at 15:51, Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wr=
ote:
>
> Hi folks!
>
> I'm sharing the notes from our regular meeting that was held
> yesterday. We had updates around several of our initiatives, and
> discussion about trying to organise a DT sprint in the next few
> weeks/months.
>
> ADMIN: I forgot to mention yesterday, but I'll be away on vacation for
> the week of the next call (26th Feb). Obviously the call can happen
> without me if desired, but somebody else will need to deal with taking
> notes etc.
>
> More details about the meeting etc. at the end.
>
> Attendees
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> SteveM - Arm
> GrantL - Arm
> RobH - Arm
> BenjaminG - ST
> EricF - ST
> Lo=C3=AFcP - ST
> BillM - TI
> TomiV - TI
> TomasE - Xilinx
> BruceA - Xilinx
> StefanoS - Xilinx
> ArndB - Linaro
> MathieuP - Linaro
> BillF - Linaro
> KumarG - Linaro
> VincentG - Linaro
> TrilokS - Qualcomm
>
> Notes
> =3D=3D=3D=3D=3D
>
> 1. Trying to arrange a sprint around System DT
>    a. Came from discussions at the Linux on Arm summit last week, more
>       on the lists
>       1. Became apparent that we need a few more people (Stefano,
>          Tomas, others) around a white board for a few days. Quite
>          slow back-and-forth by email.
>    b. Favourite option numerically is week after Connect BUD20, but
>       key people are not available
>       1. March 30-April 3rd. Rob and Stefano can=E2=80=99t make it. No po=
int
>          if can=E2=80=99t get right people. Might end up pushing into May=
. Have
>          had several offers to host (Xilinx, ST, Arm/Linaro).
>       2. Please mail Steve with availability if haven=E2=80=99t already.
>       3. BM: Is this a System Devicetree sprint or Devicetree sprint?
>       4. SM: System Devicetree =E2=80=A6
>       5. GL: Should be scope to talk about more than System Device Tree.
>       6. SM: Attendee split is c.50/50 Europe and US (Iceland??)
>
> 2. Bootloader applied overlays
>    a. https://github.com/wmamills/dt-overlays
>       1. BM: Good discussion on the list. Is this a new agreement on
>          accepting overlays in the kernel? Is there still a laundry
>          list of issues?
>       2. RH: Whilst we agree it=E2=80=99s the right place last time it wa=
s
>          submitted I gave feedback and it was never acted on. If
>          splitting to base and overlays need a way to get back to what
>          you previously had.
>       3. BM: Do you want to mash base and overlays together. I think
>          we tried to upstream that and it was rejected.
>       4. RH: Just need to change DTB format first =E2=80=A6 (Frank)
>       5. BM: Need to decide which way to pursue.
>       6. RH: Think there are a few hurdles IMO. Can=E2=80=99t speak to
>          Frank. Make it a separate repo but a submodule. Maybe lower
>          hurdle for that.
>       7. GL: Most comprehensive use of overlays is RPi and those
>          aren=E2=80=99t upstream. Maybe they have their own repos for tha=
t
>       8. RH: Assumption some people have combined base and overlays
>          and sent upstream because overlays were rejected.
>       9. TV: In TI kernel don=E2=80=99t think we have changed base DTBs. =
Just
>          have overlays that are not upstream. Have DTBs that contain
>          things that should be in overlays.
>       10. BM: Rob raised good point. Things that worked upstream
>           before should continue to work.
>       11. RH: Any cases where an overlay is dependent on another
>           overlay applied
>       12. TV: Yes we have that
>       13. RH: Maybe avoid that initially. Need some may to know what
>           overlays are applied to.
>       14. TV: How to improve that?
>       15. RH: Maybe build rules.
>       16. TV: Still a problem for U-Boot or the user?
>       17. RH: Saying kernel builds should be able to validate them
>       18. TV: Was thinking about using them. Optimally U-Boot will
>           know what to apply. Unfortunately have some cases where
>           can=E2=80=99t detect HW and then it=E2=80=99s up to the user.
>       19. RH: Easy to have typo in overlay. Want to catch that at
>           build time.
>       20. BM: Can be tons of combinations - don=E2=80=99t want them layin=
g
>           around. Keep any version that is the back compatibility
>           version
>       21. RH: Right.
>       22. TE: We are using overlays. Just as a general thing.
>       23. RH: Generating overlay - not wanting to check in
>       24. TE: Yes.
>       25. RH: Arm32 stuff has everything in one directory. Would be
>           good to split this before adding overlays. Need to agree on
>           vendor names. Have script
>       26. AB: When discussed moving years ago - discussed to put in
>           separate directories out of tree. As long as still plan on
>           moving them out. Don=E2=80=99t want to move them twice. If arou=
nd
>           the same time would do them together. First want to get
>           agreement on overlays. Takes half a year. how many files?
>       27. BM: think github is fairly complete or at least a good
>           estimate. Covers only the boards we actively support.
>       28. AB: RPi tree has around 300 overlays.
>       29. RH: For TI is 12.
>       30. BM: Beaglebone capes are not overlays. If a customer of TI
>           invents own overlays - vendor should be =E2=80=9CCustomer X=E2=
=80=9D, not
>           TI. Is that aligned with your thinking?
If we take the "responsibility" out of the picture, I would have
thought those are overlays. Or shall we name them something like
"composable DTBs" ?
>       31. RH: Would align by SoC.
>       32. BM: If there=E2=80=99s a strong standard for a subset could be =
its
>           own vendor.
>       33. SM: If 100s of new files, do we want in kernel or in a flat
>           tree?
>       34. BM: Let=E2=80=99s start with new files
>       35. RH: Not against it being in the kernel but doesn=E2=80=99t have=
 to
>           be in the kernel.
>       36. BM: U-boot specific source, MCU DTs. If had a separate repo,
>           could be useful for U-boot and the kernel.
>       37. RH: U-boot and kernel are same but rebased at random
>           times. Did a diff on DTs in U-boot and kernel and a lot
>           hadn=E2=80=99t been synchronised.
>       38. BM: Single repo seems a =E2=80=9Cboil the ocean=E2=80=9D proble=
m.
>       39. SM: Is it a good time to start with that repo and put
>           overlays in. Can=E2=80=99t be the only vendor struggling to mak=
e it
>           work.
>       40. RH: Creatng a DT repo doesn=E2=80=99t mean that U-boot will use=
 it.
>       41. SM: Is all work ad hoc by vendor?
>       42. BM: What is our ask of U-boot?
>       43. SM: Do we want U-boot people to take patches to use an
>           external DT repo rather than pulling in from kernel ad hoc.
>       44. SM: Might be able to find an engineer in Arm to put n
>           this. Will take an action. If can start showing progress
>           would that help?
>
> 3. DTE-18 - DTB runtime ID
>    a. Alexandre still hacking on this
>    b. Found some issues with what was suggested in the first round of
>       discussion
>    c. Follow up on the list
>
> 4. DTE-17: Arnd's prototype work for external DT repo
>    a. left the meeting already - next time?
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
>  * https://www.linaro.org/engineering/core/devicetree-evolution/
>  * https://www.linaro.org/assets/pdf/Linaro-White-Paper--Device-Tree-Evol=
ution.pdf
>
> Cheers,
> --
> Steve McIntyre                                steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
> <http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs
>
>


--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Linaro Edge & Fog Computin=
g Group
T: +33.67221.6485
francois.ozog-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org | Skype: ffozog
