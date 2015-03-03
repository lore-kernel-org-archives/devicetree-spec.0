From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: Formal grammar for DTS
Date: Tue, 03 Mar 2015 12:22:46 +0000
Message-ID: <1425385366.24959.141.camel@hellion.org.uk>
References: <54F1DD4F.3080304@codesourcery.com>
	 <20150302045403.GE29409@voom.fritz.box> <54F484D4.8080501@codesourcery.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F484D4.8080501-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Seefeld <stefan-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, 2015-03-02 at 10:42 -0500, Stefan Seefeld wrote:
> David,
> 
> On 01/03/15 11:54 PM, David Gibson wrote:
> > On Sat, Feb 28, 2015 at 10:22:55AM -0500, Stefan Seefeld wrote:
> >> Hello,
> >>
> >> I would like to write a tool / library that allows me to
> >> (programmatically) edit .dts files, with the ability to regenerate the
> >> source files, preserving the original formatting (including comments and
> >> other non-semantic content).
> >>
> >> To that end I need a formal definition of the DTS grammar. While I have
> >> found the dtc tool, all its source files (in particular the dtc-lexer.l
> >> and dtc-parser.y files) are released under GPL, so it isn't entirely
> >> clear whether I may use the grammar encoded in those and transcribe that
> >> into my own (I'm writing my tool in Java, most likely using the JavaCC
> >> parser generator tool).
> >>
> >> So, is there another place where the grammar of Device Tree source files
> >> is formally defined in ways that allows tools developers to use that ?
> >> Any help and advice would be highly appreciated.
> > 
> > I'm not aware of any other presentation of the dts grammar than in the
> > source files.
> > 
> > IANAL, but fwiw, I wouldn't consider transcribing the grammar rules
> > (without the semantic actions) into some other form to be a derived
> > work triggering the GPL.
> 
> Yes, I agree. Still, it would be a little clearer if the grammar would
> be held in a separate file (not covered by GPL). Perhaps you could c&p
> just the BNF grammar into a text file ?

Isn't the DTS syntax described by ePAPR "Appendix A Device Tree Source
Format (version 1)"? having said that it's not terribly formal.

Ian.

--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
