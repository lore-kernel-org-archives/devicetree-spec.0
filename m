From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Device Tree Evolution Project - call notes - 12th February
Date: Thu, 13 Feb 2020 11:24:59 -0600
Message-ID: <cfbcee96-ac90-c482-1a36-b803d3e9ce2d@gmail.com>
References: <20200213145028.GR3697@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gL3CXFVvVtZMzzL+ON9K2c6XEZnyA0laGqWWrxE5+FI=;
        b=gNwZT2dR11Ag8PiJAeEr20akSR5T7jpoH1boN/3jh4EnIG+xQzHwRkFpG7TF07ryTJ
         xP3ryZH1zCN8c6GmdcEFZWSPed9H/P19Qf8UEaz95aPVlE44TkIrXnpci3C8XB9rNmLI
         3od+5ueI5gyhgy0a0nhqn/NzIcRfIBQcwZwykQ5AguIelGM98nc2miYsF5FTFfh+IHqr
         bGSKtl2IlIAiK2Asshs6SUpeQxj0Qv15/0tAnM3IiGdm4kq6QtFRSucrZqc87iGEqB4R
         NW/6VoPV4w8PcP8eaTKbAn/qguY5/xOwlscKy12M+Ihg//8MD5h18Lwp6nMEP0TATMLB
         T1qQ==
In-Reply-To: <20200213145028.GR3697-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

On 2/13/20 8:50 AM, Steve McIntyre wrote:
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
> =========
> 
> SteveM - Arm
> GrantL - Arm
> RobH - Arm
> BenjaminG - ST
> EricF - ST
> LoïcP - ST
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
> =====
> 
> 1. Trying to arrange a sprint around System DT
>    a. Came from discussions at the Linux on Arm summit last week, more
>       on the lists
>       1. Became apparent that we need a few more people (Stefano,
>          Tomas, others) around a white board for a few days. Quite
>          slow back-and-forth by email.
>    b. Favourite option numerically is week after Connect BUD20, but
>       key people are not available
>       1. March 30-April 3rd. Rob and Stefano can’t make it. No point
>          if can’t get right people. Might end up pushing into May. Have
>          had several offers to host (Xilinx, ST, Arm/Linaro).
>       2. Please mail Steve with availability if haven’t already. 
>       3. BM: Is this a System Devicetree sprint or Devicetree sprint?
>       4. SM: System Devicetree …
>       5. GL: Should be scope to talk about more than System Device Tree.
>       6. SM: Attendee split is c.50/50 Europe and US (Iceland??)
> 
> 2. Bootloader applied overlays
>    a. https://github.com/wmamills/dt-overlays
>       1. BM: Good discussion on the list. Is this a new agreement on
>          accepting overlays in the kernel? Is there still a laundry
>          list of issues?
>       2. RH: Whilst we agree it’s the right place last time it was
>          submitted I gave feedback and it was never acted on. If
>          splitting to base and overlays need a way to get back to what
>          you previously had.
>       3. BM: Do you want to mash base and overlays together. I think
>          we tried to upstream that and it was rejected.
>       4. RH: Just need to change DTB format first … (Frank)

That matches my memory of wanting to update the DTB format before allowing
overlay sources into the kernel tree.  BUT, it has been two years (I
think) of small bursts of discussion about DTB format with little
forward progress.  I had hoped to revive the DTB format discussion in
December or January, but now it is already February.  Maybe I will get
to it this month.

The biggest change since then is that overlays can be applied by the
bootloader (at least I think that was implemented after my objection).
That alone is enough to change my opinion.  But on top of that, the
long delay on DTB format update also changes my opinion.

>       5. BM: Need to decide which way to pursue. 
>       6. RH: Think there are a few hurdles IMO. Can’t speak to
>          Frank. Make it a separate repo but a submodule. Maybe lower
>          hurdle for that.
>       7. GL: Most comprehensive use of overlays is RPi and those
>          aren’t upstream. Maybe they have their own repos for that
>       8. RH: Assumption some people have combined base and overlays
>          and sent upstream because overlays were rejected.
>       9. TV: In TI kernel don’t think we have changed base DTBs. Just
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
>           can’t detect HW and then it’s up to the user.
>       19. RH: Easy to have typo in overlay. Want to catch that at
>           build time.
>       20. BM: Can be tons of combinations - don’t want them laying
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
>           moving them out. Don’t want to move them twice. If around
>           the same time would do them together. First want to get
>           agreement on overlays. Takes half a year. how many files?
>       27. BM: think github is fairly complete or at least a good
>           estimate. Covers only the boards we actively support.
>       28. AB: RPi tree has around 300 overlays.
>       29. RH: For TI is 12. 
>       30. BM: Beaglebone capes are not overlays. If a customer of TI
>           invents own overlays - vendor should be “Customer X”, not
>           TI. Is that aligned with your thinking?
>       31. RH: Would align by SoC. 
>       32. BM: If there’s a strong standard for a subset could be its
>           own vendor.
>       33. SM: If 100s of new files, do we want in kernel or in a flat
>           tree?
>       34. BM: Let’s start with new files
>       35. RH: Not against it being in the kernel but doesn’t have to
>           be in the kernel.
>       36. BM: U-boot specific source, MCU DTs. If had a separate repo,
>           could be useful for U-boot and the kernel.
>       37. RH: U-boot and kernel are same but rebased at random
>           times. Did a diff on DTs in U-boot and kernel and a lot
>           hadn’t been synchronised.
>       38. BM: Single repo seems a “boil the ocean” problem.
>       39. SM: Is it a good time to start with that repo and put
>           overlays in. Can’t be the only vendor struggling to make it
>           work.
>       40. RH: Creatng a DT repo doesn’t mean that U-boot will use it.
>       41. SM: Is all work ad hoc by vendor?
>       42. BM: What is our ask of U-boot?
>       43. SM: Do we want U-boot people to take patches to use an
>           external DT repo rather than pulling in from kernel ad hoc.
>       44. SM: Might be able to find an engineer in Arm to put n
>           this. Will take an action. If can start showing progress
>           would that help?

There are a couple of issues that I think are relatively easily
resolved with the "new" overlay source format (now years old).

One issue is the duplication of source in both a system .dts and
an overlay .dts.  A second issue is being able to validate
overlay source.

An example of a .dtsi that can be included from either a
system .dts or an overlay .dts is:

---------- system .dts -------------------------------

/dts-v1/;

/ {
        soc {
                intc: interrupt_ctrl {
                };
                fpga_region: base_fpga_region {
                };
        };
};

/include/ "fpga_plugin_or_dtsi.dtsi"


---------- overlay .dts ----------------------------------

/dts-v1/;
/plugin/;

/include/ "fpga_plugin_or_dtsi.dtsi"


---------- fpga_plugin_or_dtsi.dtsi ----------------------------------

&fpga_region {
        ranges = <0x00000000 0x00000000 0xc0000000 0x00040000>,
                 <0x00000001 0x00000000 0xff200000 0x00001000>;

        external-fpga-config;

        #address-cells = <2>;
        #size-cells = <1>;

        fpga_pr_region0 {
                compatible = "fpga-region";
                fpga-bridges = <&freeze_controller_0>;
                ranges;
        };

        freeze_controller_0: freeze_controller@100000450 {
                compatible = "altr,freeze-bridge-controller";
                reg = <0x00000001 0x00000450 0x00000010>;
                interrupt-parent = <&intc>;
                interrupts = <0 21 4>;
        };
};


In a similar manner, an overlay can be validated in the context of
a system .dts - a small wrapper .dts can be created to include
both the system .dts and the overlay .dts, and then the wrapper
.dts is validated:

$ cat wrapper.dts
/include/ "system_base.dts"
/include/ "overlay.dts"


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
> ================================
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
> https://docs.google.com/document/d/e/2PACX-1vRVDrVFWjIOascqZFCO--T8pIqyFB_MDh9cvgyoqhI6Y0tqaA9TcCcvQhcmxi5IY7CG44JfIrCdAUDL/pub
> 
> For more information about DTE, see:
> 
>  * https://www.linaro.org/engineering/core/devicetree-evolution/
>  * https://www.linaro.org/assets/pdf/Linaro-White-Paper--Device-Tree-Evolution.pdf
> 
> Cheers,
> 

