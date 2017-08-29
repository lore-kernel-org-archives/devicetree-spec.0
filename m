From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: editing-type thoughts on devicetree spec 0.1 document
Date: Mon, 28 Aug 2017 19:22:44 -0700
Message-ID: <59A4CFF4.1080101@gmail.com>
References: <alpine.LFD.2.20.1708170751220.8230@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=wTiC7DQfIHYZ3fxWOdN1qnYhhd7IsaCmMkTU225vG80=;
        b=diPL4OpiGQhlbWBSCIlHD2Hc2cJen85mS97NN0zd6NqYIp+qOoFbW326JilEbYHkOG
         3NjV9jI//oredM1iZw3dDLHLI1g9ZEH2ZZaP+ix7bDAV1foi8yBAMllG+O+sGNi9TPqH
         ucxwwWCAiJOaTaHt+OO16/fHiwscUf3GvsfYY+i/nB0UFozqN1g+5x2I8cckQbMYsfs9
         ItmWuqQXUBeIh3l+q9OY2a0E9qBOqiTT/bVI66/uxZbM4Gkltjt1HI31hI3kj/RVy07p
         qdO3j7Q4dAqe9VA/IbMtBY6upwokHcRjQuHPG5Vh5sz73RrTRXNwwAG2Cb4urd99adJc
         vBKw==
In-Reply-To: <alpine.LFD.2.20.1708170751220.8230-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

adding devicetree-spec to distribution list

-Frank

On 08/20/17 12:08, Robert P. J. Day wrote:
> 
>   Was recently asked to give a short tutorial on device trees, so
> started perusing the current 0.1 spec, comparing contents to current
> linux git repo, made a few notes, here they are, admittedly incredibly
> nitpicky so anyone is free to do with them what they want or just
> ignore them in their entirety; it's just my editor/proofreader side
> coming out. Page numbers refer to PDF document.
> 
> p. 2: "... would like [to] thank ..."
> 
> p. 2: "... development [of] this specification ..."
> 
> p. 3: "In this document the term boot program ..."; italicize "boot
> program"
> 
> p. 3,4: "Examples of a boot programs [sic] ..."
> 
> p. 4: "IEEE-1275" should not be hyphenated (occurs more than once)
> 
> p. 4: Should it be "PowerISA" or "Power ISA"? Both forms are used.
> 
> p. 6: "An [sic] DTSpec-compliant ..."
> 
> p. 7: "The nodes with the name Ethernet [sic] ..." actually, it's
> "ethernet".
> 
> p. 8: Why are uart node and first ethernet node both at fe001000? Is
> that deliberate? That seems wrong.
> 
> p. 9: Non-standard property names include orgs fsl, ibm and linux ...
> i would be tempted to add samsung since there is a *ton* of samsung
> content of that form. Just a thought.
> 
> p. 11: "Chapter 4 describes the representation of specific devices
> [and?] may also specify additional requirements."
> 
> p. 11: Example of compatible property is:
> 
>   compatible = "fsl,mpc8641-uart", "ns16550";
> 
> No such line appears in the current kernel source, but there is a
> *pile* of:
> 
>   compatible = "fsl,ns16550", "ns16550";
> 
> if one wants to provide an example that actually occurs in the source.
> 
> p. 11: What is the "model" property used for? Apart from being
> moderately informational, is it used for any compatibility matching?
> That short section doesn't make that clear.
> 
> p. 12: Regarding the deprecated "linux,phandle" property, the current
> linux source using that as part of an actual DTS file appears to
> consist entirely of three occurrences:
> 
>   arm/boot/dts/imx6qdl-gw560x.dtsi:	linux,phandle = <&reg_vdd_arm>;
>   arm/boot/dts/imx6qdl-gw5903.dtsi:	linux,phandle = <&reg_vdd_arm>;
>   arm/boot/dts/imx6qdl-gw5903.dtsi:	linux,phandle = <&reg_vdd_soc>;
> 
> If those last three instances were fixed, would there be any need to
> continue supporting "linux,phandle"?
> 
> Still on the topic of phandles, i notice a number of lines of the
> form:
> 
>   dcr-parent = <&{/cpus/cpu@0}>;
> 
> What's with the curly braces there? Perhaps i missed it, but those
> don't seem to be explained in the spec. Are curly braces required when
> specifying the full path to the node name? If so, is that mentioned
> somewhere?
> 
> p. 12: One listed value for status is "okay", but I notice a number of
> lines in various DTS files:
> 
>   status = "ok";
> 
> If that's an acceptable alternative, it should be mentioned.
> 
> p. 13: "arbitraty"
> 
> 
>   i think i need to take a break and read the interrupts section
> carefully.
> 
> rday
> 
