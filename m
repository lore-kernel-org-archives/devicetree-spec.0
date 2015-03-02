From: Stefan Seefeld <stefan-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Subject: Re: Formal grammar for DTS
Date: Mon, 2 Mar 2015 10:42:12 -0500
Message-ID: <54F484D4.8080501@codesourcery.com>
References: <54F1DD4F.3080304@codesourcery.com> <20150302045403.GE29409@voom.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150302045403.GE29409-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

David,

On 01/03/15 11:54 PM, David Gibson wrote:
> On Sat, Feb 28, 2015 at 10:22:55AM -0500, Stefan Seefeld wrote:
>> Hello,
>>
>> I would like to write a tool / library that allows me to
>> (programmatically) edit .dts files, with the ability to regenerate the
>> source files, preserving the original formatting (including comments and
>> other non-semantic content).
>>
>> To that end I need a formal definition of the DTS grammar. While I have
>> found the dtc tool, all its source files (in particular the dtc-lexer.l
>> and dtc-parser.y files) are released under GPL, so it isn't entirely
>> clear whether I may use the grammar encoded in those and transcribe that
>> into my own (I'm writing my tool in Java, most likely using the JavaCC
>> parser generator tool).
>>
>> So, is there another place where the grammar of Device Tree source files
>> is formally defined in ways that allows tools developers to use that ?
>> Any help and advice would be highly appreciated.
> 
> I'm not aware of any other presentation of the dts grammar than in the
> source files.
> 
> IANAL, but fwiw, I wouldn't consider transcribing the grammar rules
> (without the semantic actions) into some other form to be a derived
> work triggering the GPL.

Yes, I agree. Still, it would be a little clearer if the grammar would
be held in a separate file (not covered by GPL). Perhaps you could c&p
just the BNF grammar into a text file ?

Many thanks,
		Stefan

-- 
Stefan Seefeld
CodeSourcery / Mentor Embedded
stefan-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
